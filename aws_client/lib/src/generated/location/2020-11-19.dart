// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export '../../shared/shared.dart' show AwsClientCredentials;

/// Suite of geospatial services including Maps, Places, Routes, Tracking, and
/// Geofencing
class Location {
  final _s.RestJsonProtocol _protocol;
  Location({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
  /// <note>
  /// Currently not supported — Cross-account configurations, such as creating
  /// associations between a tracker resource in one account and a geofence
  /// collection in another account.
  /// </note>
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
  /// <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollectionConsumer</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource to be associated with a geofence
  /// collection.
  Future<void> associateTrackerConsumer({
    required String consumerArn,
    required String trackerName,
  }) async {
    ArgumentError.checkNotNull(consumerArn, 'consumerArn');
    _s.validateStringLength(
      'consumerArn',
      consumerArn,
      0,
      1600,
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
  }

  /// Deletes the position history of one or more devices from a tracker
  /// resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [deviceIds] :
  /// Devices whose position history you want to delete.
  ///
  /// <ul>
  /// <li>
  /// For example, for two devices: <code>“DeviceIds” :
  /// [DeviceId1,DeviceId2]</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource to delete the device position history
  /// from.
  Future<BatchDeleteDevicePositionHistoryResponse>
      batchDeleteDevicePositionHistory({
    required List<String> deviceIds,
    required String trackerName,
  }) async {
    ArgumentError.checkNotNull(deviceIds, 'deviceIds');
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      100,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'DeviceIds': deviceIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/delete-positions',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteDevicePositionHistoryResponse.fromJson(response);
  }

  /// Deletes a batch of geofences from a geofence collection.
  /// <note>
  /// This operation deletes the resource permanently.
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
    required String collectionName,
    required List<String> geofenceIds,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
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

  /// Evaluates device positions against the geofence geometries from a given
  /// geofence collection. The evaluation determines if the device has entered
  /// or exited a geofenced area, which publishes ENTER or EXIT geofence events
  /// to Amazon EventBridge.
  /// <note>
  /// The last geofence that a device was observed within, if any, is tracked
  /// for 30 days after the most recent device position update
  /// </note>
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
    required String collectionName,
    required List<DevicePositionUpdate> devicePositionUpdates,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
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

  /// A batch request to retrieve all device positions.
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
    required List<String> deviceIds,
    required String trackerName,
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

  /// A batch request for storing geofence geometries into a given geofence
  /// collection, or updates the geometry of an existing geofence if a geofence
  /// ID is included in the request.
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
    required String collectionName,
    required List<BatchPutGeofenceRequestEntry> entries,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
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

  /// Uploads position update data for one or more devices to a tracker
  /// resource. Amazon Location uses the data when reporting the last known
  /// device position and position history.
  /// <note>
  /// Only one position update is stored per sample time. Location data is
  /// sampled at a fixed rate of one position per 30-second interval and
  /// retained for 30 days before it's deleted.
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
    required String trackerName,
    required List<DevicePositionUpdate> updates,
  }) async {
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      100,
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

  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html">Calculates
  /// a route</a> given the following required parameters:
  /// <code>DeparturePostiton</code> and <code>DestinationPosition</code>.
  /// Requires that you first <a
  /// href="https://docs.aws.amazon.com/location-routes/latest/APIReference/API_CreateRouteCalculator.html">create
  /// aroute calculator resource</a>
  ///
  /// By default, a request that doesn't specify a departure time uses the best
  /// time of day to travel with the best traffic conditions when calculating
  /// the route.
  ///
  /// Additional options include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#departure-time">Specifying
  /// a departure time</a> using either <code>DepartureTime</code> or
  /// <code>DepartureNow</code>. This calculates a route based on predictive
  /// traffic data at the given time.
  /// <note>
  /// You can't specify both <code>DepartureTime</code> and
  /// <code>DepartureNow</code> in a single request. Specifying both parameters
  /// returns an error message.
  /// </note> </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#travel-mode">Specifying
  /// a travel mode</a> using TravelMode. This lets you specify additional route
  /// preference such as <code>CarModeOptions</code> if traveling by
  /// <code>Car</code>, or <code>TruckModeOptions</code> if traveling by
  /// <code>Truck</code>.
  /// </li>
  /// </ul>
  ///
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [calculatorName] :
  /// The name of the route calculator resource that you want to use to
  /// calculate a route.
  ///
  /// Parameter [departurePosition] :
  /// The start position for the route. Defined in <a
  /// href="https://earth-info.nga.mil/GandG/wgs84/index.html">WGS 84</a>
  /// format: <code>[longitude, latitude]</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>[-123.115, 49.285]</code>
  /// </li>
  /// </ul> <note>
  /// If you specify a departure that's not located on a road, Amazon Location
  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road">moves
  /// the position to the nearest road</a>.
  /// </note>
  /// Valid Values: <code>[-180 to 180,-90 to 90]</code>
  ///
  /// Parameter [destinationPosition] :
  /// The finish position for the route. Defined in <a
  /// href="https://earth-info.nga.mil/GandG/wgs84/index.html">WGS 84</a>
  /// format: <code>[longitude, latitude]</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>[-122.339, 47.615]</code>
  /// </li>
  /// </ul> <note>
  /// If you specify a destination that's not located on a road, Amazon Location
  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road">moves
  /// the position to the nearest road</a>.
  /// </note>
  /// Valid Values: <code>[-180 to 180,-90 to 90]</code>
  ///
  /// Parameter [carModeOptions] :
  /// Specifies route preferences when traveling by <code>Car</code>, such as
  /// avoiding routes that use ferries or tolls.
  ///
  /// Requirements: <code>TravelMode</code> must be specified as
  /// <code>Car</code>.
  ///
  /// Parameter [departNow] :
  /// Sets the time of departure as the current time. Uses the current time to
  /// calculate a route. Otherwise, the best time of day to travel with the best
  /// traffic conditions is used to calculate the route.
  ///
  /// Default Value: <code>false</code>
  ///
  /// Valid Values: <code>false</code> | <code>true</code>
  ///
  /// Parameter [departureTime] :
  /// Specifies the desired time of departure. Uses the given time to calculate
  /// a route. Otherwise, the best time of day to travel with the best traffic
  /// conditions is used to calculate the route.
  /// <note>
  /// Setting a departure time in the past returns a <code>400
  /// ValidationException</code> error.
  /// </note>
  /// <ul>
  /// <li>
  /// In <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. For example,
  /// <code>2020–07-2T12:15:20.000Z+01:00</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [distanceUnit] :
  /// Set the unit system to specify the distance.
  ///
  /// Default Value: <code>Kilometers</code>
  ///
  /// Parameter [includeLegGeometry] :
  /// Set to include the geometry details in the result for each path between a
  /// pair of positions.
  ///
  /// Default Value: <code>false</code>
  ///
  /// Valid Values: <code>false</code> | <code>true</code>
  ///
  /// Parameter [travelMode] :
  /// Specifies the mode of transport when calculating a route. Used in
  /// estimating the speed of travel and road compatibility.
  ///
  /// The <code>TravelMode</code> you specify determines how you specify route
  /// preferences:
  ///
  /// <ul>
  /// <li>
  /// If traveling by <code>Car</code> use the <code>CarModeOptions</code>
  /// parameter.
  /// </li>
  /// <li>
  /// If traveling by <code>Truck</code> use the <code>TruckModeOptions</code>
  /// parameter.
  /// </li>
  /// </ul>
  /// Default Value: <code>Car</code>
  ///
  /// Parameter [truckModeOptions] :
  /// Specifies route preferences when traveling by <code>Truck</code>, such as
  /// avoiding routes that use ferries or tolls, and truck specifications to
  /// consider when choosing an optimal road.
  ///
  /// Requirements: <code>TravelMode</code> must be specified as
  /// <code>Truck</code>.
  ///
  /// Parameter [waypointPositions] :
  /// Specifies an ordered list of up to 23 intermediate positions to include
  /// along a route between the departure position and destination position.
  ///
  /// <ul>
  /// <li>
  /// For example, from the <code>DeparturePosition</code> <code>[-123.115,
  /// 49.285]</code>, the route follows the order that the waypoint positions
  /// are given <code>[[-122.757, 49.0021],[-122.349, 47.620]]</code>
  /// </li>
  /// </ul> <note>
  /// If you specify a waypoint position that's not located on a road, Amazon
  /// Location <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road">moves
  /// the position to the nearest road</a>.
  ///
  /// Specifying more than 23 waypoints returns a <code>400
  /// ValidationException</code> error.
  /// </note>
  /// Valid Values: <code>[-180 to 180,-90 to 90]</code>
  Future<CalculateRouteResponse> calculateRoute({
    required String calculatorName,
    required List<double> departurePosition,
    required List<double> destinationPosition,
    CalculateRouteCarModeOptions? carModeOptions,
    bool? departNow,
    DateTime? departureTime,
    DistanceUnit? distanceUnit,
    bool? includeLegGeometry,
    TravelMode? travelMode,
    CalculateRouteTruckModeOptions? truckModeOptions,
    List<List<double>>? waypointPositions,
  }) async {
    ArgumentError.checkNotNull(calculatorName, 'calculatorName');
    _s.validateStringLength(
      'calculatorName',
      calculatorName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(departurePosition, 'departurePosition');
    ArgumentError.checkNotNull(destinationPosition, 'destinationPosition');
    final $payload = <String, dynamic>{
      'DeparturePosition': departurePosition,
      'DestinationPosition': destinationPosition,
      if (carModeOptions != null) 'CarModeOptions': carModeOptions,
      if (departNow != null) 'DepartNow': departNow,
      if (departureTime != null) 'DepartureTime': iso8601ToJson(departureTime),
      if (distanceUnit != null) 'DistanceUnit': distanceUnit.toValue(),
      if (includeLegGeometry != null) 'IncludeLegGeometry': includeLegGeometry,
      if (travelMode != null) 'TravelMode': travelMode.toValue(),
      if (truckModeOptions != null) 'TruckModeOptions': truckModeOptions,
      if (waypointPositions != null) 'WaypointPositions': waypointPositions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/routes/v0/calculators/${Uri.encodeComponent(calculatorName)}/calculate/route',
      exceptionFnMap: _exceptionFns,
    );
    return CalculateRouteResponse.fromJson(response);
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
  /// Contain only alphanumeric characters (A–Z, a–z, 0–9), hyphens (-), periods
  /// (.), and underscores (_).
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
  /// Specifies the pricing plan for the geofence collection.
  ///
  /// For additional details and restrictions on each pricing plan option, see
  /// the <a href="https://aws.amazon.com/location/pricing/">Amazon Location
  /// Service pricing page</a>.
  ///
  /// Parameter [description] :
  /// An optional description for the geofence collection.
  ///
  /// Parameter [kmsKeyId] :
  /// A key identifier for an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">AWS
  /// KMS customer managed key</a>. Enter a key ID, key ARN, alias name, or
  /// alias ARN.
  ///
  /// Parameter [pricingPlanDataSource] :
  /// Specifies the data provider for the geofence collection.
  ///
  /// <ul>
  /// <li>
  /// Required value for the following pricing plans: <code>MobileAssetTracking
  /// </code>| <code>MobileAssetManagement</code>
  /// </li>
  /// </ul>
  /// For more information about <a
  /// href="https://aws.amazon.com/location/data-providers/">Data Providers</a>,
  /// and <a href="https://aws.amazon.com/location/pricing/">Pricing plans</a>,
  /// see the Amazon Location Service product page.
  /// <note>
  /// Amazon Location Service only uses <code>PricingPlanDataSource</code> to
  /// calculate billing for your geofence collection. Your data won't be shared
  /// with the data provider, and will remain in your AWS account or Region
  /// unless you move it.
  /// </note>
  /// Valid Values: <code>Esri </code>| <code>Here</code>
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to the geofence collection. A tag is a key-value
  /// pair helps manage, identify, search, and filter your resources by
  /// labelling them.
  ///
  /// Format: <code>"key" : "value"</code>
  ///
  /// Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Maximum 50 tags per resource
  /// </li>
  /// <li>
  /// Each resource tag must be unique with a maximum of one value.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9), and the following
  /// characters: + - = . _ : / @.
  /// </li>
  /// </ul>
  Future<CreateGeofenceCollectionResponse> createGeofenceCollection({
    required String collectionName,
    required PricingPlan pricingPlan,
    String? description,
    String? kmsKeyId,
    String? pricingPlanDataSource,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(pricingPlan, 'pricingPlan');
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      1,
      2048,
    );
    final $payload = <String, dynamic>{
      'CollectionName': collectionName,
      'PricingPlan': pricingPlan.toValue(),
      if (description != null) 'Description': description,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
      if (tags != null) 'Tags': tags,
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
  /// periods (.), and underscores (_).
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
  /// Specifies the pricing plan for your map resource.
  ///
  /// For additional details and restrictions on each pricing plan option, see
  /// the <a href="https://aws.amazon.com/location/pricing/">Amazon Location
  /// Service pricing page</a>.
  ///
  /// Parameter [description] :
  /// An optional description for the map resource.
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to the map resource. A tag is a key-value pair
  /// helps manage, identify, search, and filter your resources by labelling
  /// them.
  ///
  /// Format: <code>"key" : "value"</code>
  ///
  /// Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Maximum 50 tags per resource
  /// </li>
  /// <li>
  /// Each resource tag must be unique with a maximum of one value.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9), and the following
  /// characters: + - = . _ : / @.
  /// </li>
  /// </ul>
  Future<CreateMapResponse> createMap({
    required MapConfiguration configuration,
    required String mapName,
    required PricingPlan pricingPlan,
    String? description,
    Map<String, String>? tags,
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
      'PricingPlan': pricingPlan.toValue(),
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/maps/v0/maps',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMapResponse.fromJson(response);
  }

  /// Creates a place index resource in your AWS account, which supports
  /// functions with geospatial data sourced from your chosen data provider.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [dataSource] :
  /// Specifies the data provider of geospatial data.
  /// <note>
  /// This field is case-sensitive. Enter the valid values as shown. For
  /// example, entering <code>HERE</code> will return an error.
  /// </note>
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code>
  /// </li>
  /// <li>
  /// <code>Here</code>
  /// <important>
  /// Place index resources using HERE as a data provider can't be used to <a
  /// href="https://docs.aws.amazon.com/location-places/latest/APIReference/API_DataSourceConfiguration.html">store</a>
  /// results for locations in Japan. For more information, see the <a
  /// href="https://aws.amazon.com/service-terms/">AWS Service Terms</a> for
  /// Amazon Location Service.
  /// </important> </li>
  /// </ul>
  /// For additional details on data providers, see the <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers page</a>.
  ///
  /// Parameter [indexName] :
  /// The name of the place index resource.
  ///
  /// Requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only alphanumeric characters (A–Z, a–z, 0–9), hyphens (-), periods
  /// (.), and underscores (_).
  /// </li>
  /// <li>
  /// Must be a unique place index resource name.
  /// </li>
  /// <li>
  /// No spaces allowed. For example, <code>ExamplePlaceIndex</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [pricingPlan] :
  /// Specifies the pricing plan for your place index resource.
  ///
  /// For additional details and restrictions on each pricing plan option, see
  /// the <a href="https://aws.amazon.com/location/pricing/">Amazon Location
  /// Service pricing page</a>.
  ///
  /// Parameter [dataSourceConfiguration] :
  /// Specifies the data storage option for requesting Places.
  ///
  /// Parameter [description] :
  /// The optional description for the place index resource.
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to the place index resource. A tag is a key-value
  /// pair helps manage, identify, search, and filter your resources by
  /// labelling them.
  ///
  /// Format: <code>"key" : "value"</code>
  ///
  /// Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Maximum 50 tags per resource
  /// </li>
  /// <li>
  /// Each resource tag must be unique with a maximum of one value.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9), and the following
  /// characters: + - = . _ : / @.
  /// </li>
  /// </ul>
  Future<CreatePlaceIndexResponse> createPlaceIndex({
    required String dataSource,
    required String indexName,
    required PricingPlan pricingPlan,
    DataSourceConfiguration? dataSourceConfiguration,
    String? description,
    Map<String, String>? tags,
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
      'PricingPlan': pricingPlan.toValue(),
      if (dataSourceConfiguration != null)
        'DataSourceConfiguration': dataSourceConfiguration,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/places/v0/indexes',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePlaceIndexResponse.fromJson(response);
  }

  /// Creates a route calculator resource in your AWS account.
  ///
  /// You can send requests to a route calculator resource to estimate travel
  /// time, distance, and get directions. A route calculator sources traffic and
  /// road network data from your chosen data provider.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [calculatorName] :
  /// The name of the route calculator resource.
  ///
  /// Requirements:
  ///
  /// <ul>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9) , hyphens (-), periods
  /// (.), and underscores (_).
  /// </li>
  /// <li>
  /// Must be a unique Route calculator resource name.
  /// </li>
  /// <li>
  /// No spaces allowed. For example, <code>ExampleRouteCalculator</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dataSource] :
  /// Specifies the data provider of traffic and road network data.
  /// <note>
  /// This field is case-sensitive. Enter the valid values as shown. For
  /// example, entering <code>HERE</code> returns an error.
  /// </note>
  /// Valid Values: <code>Esri</code> | <code>Here</code>
  ///
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  ///
  /// Parameter [pricingPlan] :
  /// Specifies the pricing plan for your route calculator resource.
  ///
  /// For additional details and restrictions on each pricing plan option, see
  /// <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// pricing</a>.
  ///
  /// Parameter [description] :
  /// The optional description for the route calculator resource.
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to the route calculator resource. A tag is a
  /// key-value pair helps manage, identify, search, and filter your resources
  /// by labelling them.
  ///
  /// <ul>
  /// <li>
  /// For example: { <code>"tag1" : "value1"</code>, <code>"tag2" :
  /// "value2"</code>}
  /// </li>
  /// </ul>
  /// Format: <code>"key" : "value"</code>
  ///
  /// Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Maximum 50 tags per resource
  /// </li>
  /// <li>
  /// Each resource tag must be unique with a maximum of one value.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9), and the following
  /// characters: + - = . _ : / @.
  /// </li>
  /// </ul>
  Future<CreateRouteCalculatorResponse> createRouteCalculator({
    required String calculatorName,
    required String dataSource,
    required PricingPlan pricingPlan,
    String? description,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(calculatorName, 'calculatorName');
    _s.validateStringLength(
      'calculatorName',
      calculatorName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSource, 'dataSource');
    ArgumentError.checkNotNull(pricingPlan, 'pricingPlan');
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    final $payload = <String, dynamic>{
      'CalculatorName': calculatorName,
      'DataSource': dataSource,
      'PricingPlan': pricingPlan.toValue(),
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/routes/v0/calculators',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRouteCalculatorResponse.fromJson(response);
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
  /// Specifies the pricing plan for the tracker resource.
  ///
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
  /// Contain only alphanumeric characters (A-Z, a-z, 0-9) , hyphens (-),
  /// periods (.), and underscores (_).
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
  ///
  /// Parameter [kmsKeyId] :
  /// A key identifier for an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">AWS
  /// KMS customer managed key</a>. Enter a key ID, key ARN, alias name, or
  /// alias ARN.
  ///
  /// Parameter [pricingPlanDataSource] :
  /// Specifies the data provider for the tracker resource.
  ///
  /// <ul>
  /// <li>
  /// Required value for the following pricing plans: <code>MobileAssetTracking
  /// </code>| <code>MobileAssetManagement</code>
  /// </li>
  /// </ul>
  /// For more information about <a
  /// href="https://aws.amazon.com/location/data-providers/">Data Providers</a>,
  /// and <a href="https://aws.amazon.com/location/pricing/">Pricing plans</a>,
  /// see the Amazon Location Service product page.
  /// <note>
  /// Amazon Location Service only uses <code>PricingPlanDataSource</code> to
  /// calculate billing for your tracker resource. Your data will not be shared
  /// with the data provider, and will remain in your AWS account or Region
  /// unless you move it.
  /// </note>
  /// Valid Values: <code>Esri</code> | <code>Here</code>
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to the tracker resource. A tag is a key-value
  /// pair helps manage, identify, search, and filter your resources by
  /// labelling them.
  ///
  /// Format: <code>"key" : "value"</code>
  ///
  /// Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Maximum 50 tags per resource
  /// </li>
  /// <li>
  /// Each resource tag must be unique with a maximum of one value.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9), and the following
  /// characters: + - = . _ : / @.
  /// </li>
  /// </ul>
  Future<CreateTrackerResponse> createTracker({
    required PricingPlan pricingPlan,
    required String trackerName,
    String? description,
    String? kmsKeyId,
    String? pricingPlanDataSource,
    Map<String, String>? tags,
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
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      1,
      2048,
    );
    final $payload = <String, dynamic>{
      'PricingPlan': pricingPlan.toValue(),
      'TrackerName': trackerName,
      if (description != null) 'Description': description,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
      if (tags != null) 'Tags': tags,
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
  /// This operation deletes the resource permanently. If the geofence
  /// collection is the target of a tracker resource, the devices will no longer
  /// be monitored.
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
    required String collectionName,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a map resource from your AWS account.
  /// <note>
  /// This operation deletes the resource permanently. If the map is being used
  /// in an application, the map may not render.
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
    required String mapName,
  }) async {
    ArgumentError.checkNotNull(mapName, 'mapName');
    _s.validateStringLength(
      'mapName',
      mapName,
      1,
      100,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/maps/v0/maps/${Uri.encodeComponent(mapName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a place index resource from your AWS account.
  /// <note>
  /// This operation deletes the resource permanently.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [indexName] :
  /// The name of the place index resource to be deleted.
  Future<void> deletePlaceIndex({
    required String indexName,
  }) async {
    ArgumentError.checkNotNull(indexName, 'indexName');
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      100,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/places/v0/indexes/${Uri.encodeComponent(indexName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a route calculator resource from your AWS account.
  /// <note>
  /// This operation deletes the resource permanently.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [calculatorName] :
  /// The name of the route calculator resource to be deleted.
  Future<void> deleteRouteCalculator({
    required String calculatorName,
  }) async {
    ArgumentError.checkNotNull(calculatorName, 'calculatorName');
    _s.validateStringLength(
      'calculatorName',
      calculatorName,
      1,
      100,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/routes/v0/calculators/${Uri.encodeComponent(calculatorName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a tracker resource from your AWS account.
  /// <note>
  /// This operation deletes the resource permanently. If the tracker resource
  /// is in use, you may encounter an error. Make sure that the target resource
  /// isn't a dependency for your applications.
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
    required String trackerName,
  }) async {
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      100,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String collectionName,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
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
    required String mapName,
  }) async {
    ArgumentError.checkNotNull(mapName, 'mapName');
    _s.validateStringLength(
      'mapName',
      mapName,
      1,
      100,
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

  /// Retrieves the place index resource details.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [indexName] :
  /// The name of the place index resource.
  Future<DescribePlaceIndexResponse> describePlaceIndex({
    required String indexName,
  }) async {
    ArgumentError.checkNotNull(indexName, 'indexName');
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      100,
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

  /// Retrieves the route calculator resource details.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [calculatorName] :
  /// The name of the route calculator resource.
  Future<DescribeRouteCalculatorResponse> describeRouteCalculator({
    required String calculatorName,
  }) async {
    ArgumentError.checkNotNull(calculatorName, 'calculatorName');
    _s.validateStringLength(
      'calculatorName',
      calculatorName,
      1,
      100,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/routes/v0/calculators/${Uri.encodeComponent(calculatorName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRouteCalculatorResponse.fromJson(response);
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
    required String trackerName,
  }) async {
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      100,
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

  /// Removes the association between a tracker resource and a geofence
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
  /// <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollectionConsumer</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource to be dissociated from the consumer.
  Future<void> disassociateTrackerConsumer({
    required String consumerArn,
    required String trackerName,
  }) async {
    ArgumentError.checkNotNull(consumerArn, 'consumerArn');
    _s.validateStringLength(
      'consumerArn',
      consumerArn,
      0,
      1600,
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/consumers/${Uri.encodeComponent(consumerArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves a device's most recent position according to its sample time.
  /// <note>
  /// Device positions are deleted after 30 days.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [deviceId] :
  /// The device whose position you want to retrieve.
  ///
  /// Parameter [trackerName] :
  /// The tracker resource receiving the position update.
  Future<GetDevicePositionResponse> getDevicePosition({
    required String deviceId,
    required String trackerName,
  }) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    _s.validateStringLength(
      'deviceId',
      deviceId,
      1,
      100,
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
  /// Device positions are deleted after 30 days.
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
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. By default, the
  /// value will be the time that the request is made.
  ///
  /// Requirement:
  ///
  /// <ul>
  /// <li>
  /// The time specified for <code>EndTimeExclusive</code> must be after the
  /// time for <code>StartTimeInclusive</code>.
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
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. By default, the
  /// value will be 24 hours prior to the time that the request is made.
  ///
  /// Requirement:
  ///
  /// <ul>
  /// <li>
  /// The time specified for <code>StartTimeInclusive</code> must be before
  /// <code>EndTimeExclusive</code>.
  /// </li>
  /// </ul>
  Future<GetDevicePositionHistoryResponse> getDevicePositionHistory({
    required String deviceId,
    required String trackerName,
    DateTime? endTimeExclusive,
    String? nextToken,
    DateTime? startTimeInclusive,
  }) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    _s.validateStringLength(
      'deviceId',
      deviceId,
      1,
      100,
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
    required String collectionName,
    required String geofenceId,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
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
  /// contain 256 characters. For example, 0–255 includes all characters from
  /// range <code>U+0000</code> to <code>00FF</code>. Must be aligned to
  /// multiples of 256.
  ///
  /// Parameter [mapName] :
  /// The map resource associated with the glyph ﬁle.
  Future<GetMapGlyphsResponse> getMapGlyphs({
    required String fontStack,
    required String fontUnicodeRange,
    required String mapName,
  }) async {
    ArgumentError.checkNotNull(fontStack, 'fontStack');
    ArgumentError.checkNotNull(fontUnicodeRange, 'fontUnicodeRange');
    ArgumentError.checkNotNull(mapName, 'mapName');
    _s.validateStringLength(
      'mapName',
      mapName,
      1,
      100,
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
    required String fileName,
    required String mapName,
  }) async {
    ArgumentError.checkNotNull(fileName, 'fileName');
    ArgumentError.checkNotNull(mapName, 'mapName');
    _s.validateStringLength(
      'mapName',
      mapName,
      1,
      100,
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
    required String mapName,
  }) async {
    ArgumentError.checkNotNull(mapName, 'mapName');
    _s.validateStringLength(
      'mapName',
      mapName,
      1,
      100,
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
  /// clients to render a map. they're addressed using a grid arrangement with
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
    required String mapName,
    required String x,
    required String y,
    required String z,
  }) async {
    ArgumentError.checkNotNull(mapName, 'mapName');
    _s.validateStringLength(
      'mapName',
      mapName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(x, 'x');
    ArgumentError.checkNotNull(y, 'y');
    ArgumentError.checkNotNull(z, 'z');
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

  /// Lists the latest device positions for requested devices.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [trackerName] :
  /// The tracker resource containing the requested devices.
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of entries returned in a single call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListDevicePositionsResponse> listDevicePositions({
    required String trackerName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      100,
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
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/list-positions',
      exceptionFnMap: _exceptionFns,
    );
    return ListDevicePositionsResponse.fromJson(response);
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
    int? maxResults,
    String? nextToken,
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
    required String collectionName,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
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
    int? maxResults,
    String? nextToken,
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

  /// Lists place index resources in your AWS account.
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
    int? maxResults,
    String? nextToken,
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

  /// Lists route calculator resources in your AWS account.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// An optional maximum number of results returned in a single call.
  ///
  /// Default Value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default Value: <code>null</code>
  Future<ListRouteCalculatorsResponse> listRouteCalculators({
    int? maxResults,
    String? nextToken,
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
      requestUri: '/routes/v0/list-calculators',
      exceptionFnMap: _exceptionFns,
    );
    return ListRouteCalculatorsResponse.fromJson(response);
  }

  /// Returns the tags for the specified Amazon Location Service resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource whose tags you want to
  /// retrieve.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      1600,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
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
    required String trackerName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(trackerName, 'trackerName');
    _s.validateStringLength(
      'trackerName',
      trackerName,
      1,
      100,
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
    int? maxResults,
    String? nextToken,
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

  /// Stores a geofence geometry in a given geofence collection, or updates the
  /// geometry of an existing geofence if a geofence ID is included in the
  /// request.
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
  /// <note>
  /// Each <a
  /// href="https://docs.aws.amazon.com/location-geofences/latest/APIReference/API_GeofenceGeometry.html">geofence
  /// polygon</a> can have a maximum of 1,000 vertices.
  /// </note>
  Future<PutGeofenceResponse> putGeofence({
    required String collectionName,
    required String geofenceId,
    required GeofenceGeometry geometry,
  }) async {
    ArgumentError.checkNotNull(collectionName, 'collectionName');
    _s.validateStringLength(
      'collectionName',
      collectionName,
      1,
      100,
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
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [indexName] :
  /// The name of the place index resource you want to use for the search.
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
    required String indexName,
    required List<double> position,
    int? maxResults,
  }) async {
    ArgumentError.checkNotNull(indexName, 'indexName');
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      100,
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
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [indexName] :
  /// The name of the place index resource you want to use for the search.
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
    required String indexName,
    required String text,
    List<double>? biasPosition,
    List<double>? filterBBox,
    List<String>? filterCountries,
    int? maxResults,
  }) async {
    ArgumentError.checkNotNull(indexName, 'indexName');
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      100,
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

  /// Assigns one or more tags (key-value pairs) to the specified Amazon
  /// Location Service resource.
  /// <pre><code> &lt;p&gt;Tags can help you organize and categorize your
  /// resources. You can also use them to scope user permissions, by granting a
  /// user permission to access or change only resources with certain tag
  /// values.&lt;/p&gt; &lt;p&gt;Tags don't have any semantic meaning to AWS and
  /// are interpreted strictly as strings of characters.&lt;/p&gt; &lt;p&gt;You
  /// can use the &lt;code&gt;TagResource&lt;/code&gt; action with an Amazon
  /// Location Service resource that already has tags. If you specify a new tag
  /// key for the resource, this tag is appended to the tags already associated
  /// with the resource. If you specify a tag key that is already associated
  /// with the resource, the new tag value that you specify replaces the
  /// previous value for that tag. &lt;/p&gt; &lt;p&gt;You can associate as many
  /// as 50 tags with a resource.&lt;/p&gt; </code></pre>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource whose tags you want to
  /// update.
  ///
  /// Parameter [tags] :
  /// The mapping from tag key to tag value for each tag associated with the
  /// specified resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from the specified Amazon Location Service
  /// resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource from which you want to
  /// remove tags.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

class AssociateTrackerConsumerResponse {
  AssociateTrackerConsumerResponse();

  factory AssociateTrackerConsumerResponse.fromJson(Map<String, dynamic> _) {
    return AssociateTrackerConsumerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the tracker resource details.
class BatchDeleteDevicePositionHistoryError {
  /// The ID of the device for this position.
  final String deviceId;
  final BatchItemError error;

  BatchDeleteDevicePositionHistoryError({
    required this.deviceId,
    required this.error,
  });

  factory BatchDeleteDevicePositionHistoryError.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteDevicePositionHistoryError(
      deviceId: json['DeviceId'] as String,
      error: BatchItemError.fromJson(json['Error'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final error = this.error;
    return {
      'DeviceId': deviceId,
      'Error': error,
    };
  }
}

class BatchDeleteDevicePositionHistoryResponse {
  /// Contains error details for each device history that failed to delete.
  final List<BatchDeleteDevicePositionHistoryError> errors;

  BatchDeleteDevicePositionHistoryResponse({
    required this.errors,
  });

  factory BatchDeleteDevicePositionHistoryResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteDevicePositionHistoryResponse(
      errors: (json['Errors'] as List)
          .whereNotNull()
          .map((e) => BatchDeleteDevicePositionHistoryError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      'Errors': errors,
    };
  }
}

/// Contains error details for each geofence that failed to delete from the
/// geofence collection.
class BatchDeleteGeofenceError {
  /// Contains details associated to the batch error.
  final BatchItemError error;

  /// The geofence associated with the error message.
  final String geofenceId;

  BatchDeleteGeofenceError({
    required this.error,
    required this.geofenceId,
  });

  factory BatchDeleteGeofenceError.fromJson(Map<String, dynamic> json) {
    return BatchDeleteGeofenceError(
      error: BatchItemError.fromJson(json['Error'] as Map<String, dynamic>),
      geofenceId: json['GeofenceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final geofenceId = this.geofenceId;
    return {
      'Error': error,
      'GeofenceId': geofenceId,
    };
  }
}

class BatchDeleteGeofenceResponse {
  /// Contains error details for each geofence that failed to delete.
  final List<BatchDeleteGeofenceError> errors;

  BatchDeleteGeofenceResponse({
    required this.errors,
  });

  factory BatchDeleteGeofenceResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteGeofenceResponse(
      errors: (json['Errors'] as List)
          .whereNotNull()
          .map((e) =>
              BatchDeleteGeofenceError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      'Errors': errors,
    };
  }
}

/// Contains error details for each device that failed to evaluate its position
/// against the geofences in a given geofence collection.
class BatchEvaluateGeofencesError {
  /// The device associated with the position evaluation error.
  final String deviceId;

  /// Contains details associated to the batch error.
  final BatchItemError error;

  /// Specifies a timestamp for when the error occurred in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime sampleTime;

  BatchEvaluateGeofencesError({
    required this.deviceId,
    required this.error,
    required this.sampleTime,
  });

  factory BatchEvaluateGeofencesError.fromJson(Map<String, dynamic> json) {
    return BatchEvaluateGeofencesError(
      deviceId: json['DeviceId'] as String,
      error: BatchItemError.fromJson(json['Error'] as Map<String, dynamic>),
      sampleTime: nonNullableTimeStampFromJson(json['SampleTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final error = this.error;
    final sampleTime = this.sampleTime;
    return {
      'DeviceId': deviceId,
      'Error': error,
      'SampleTime': iso8601ToJson(sampleTime),
    };
  }
}

class BatchEvaluateGeofencesResponse {
  /// Contains error details for each device that failed to evaluate its position
  /// against the given geofence collection.
  final List<BatchEvaluateGeofencesError> errors;

  BatchEvaluateGeofencesResponse({
    required this.errors,
  });

  factory BatchEvaluateGeofencesResponse.fromJson(Map<String, dynamic> json) {
    return BatchEvaluateGeofencesResponse(
      errors: (json['Errors'] as List)
          .whereNotNull()
          .map((e) =>
              BatchEvaluateGeofencesError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      'Errors': errors,
    };
  }
}

/// Contains error details for each device that didn't return a position.
class BatchGetDevicePositionError {
  /// The ID of the device that didn't return a position.
  final String deviceId;

  /// Contains details related to the error code.
  final BatchItemError error;

  BatchGetDevicePositionError({
    required this.deviceId,
    required this.error,
  });

  factory BatchGetDevicePositionError.fromJson(Map<String, dynamic> json) {
    return BatchGetDevicePositionError(
      deviceId: json['DeviceId'] as String,
      error: BatchItemError.fromJson(json['Error'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final error = this.error;
    return {
      'DeviceId': deviceId,
      'Error': error,
    };
  }
}

class BatchGetDevicePositionResponse {
  /// Contains device position details such as the device ID, position, and
  /// timestamps for when the position was received and sampled.
  final List<DevicePosition> devicePositions;

  /// Contains error details for each device that failed to send its position to
  /// the tracker resource.
  final List<BatchGetDevicePositionError> errors;

  BatchGetDevicePositionResponse({
    required this.devicePositions,
    required this.errors,
  });

  factory BatchGetDevicePositionResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetDevicePositionResponse(
      devicePositions: (json['DevicePositions'] as List)
          .whereNotNull()
          .map((e) => DevicePosition.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['Errors'] as List)
          .whereNotNull()
          .map((e) =>
              BatchGetDevicePositionError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final devicePositions = this.devicePositions;
    final errors = this.errors;
    return {
      'DevicePositions': devicePositions,
      'Errors': errors,
    };
  }
}

/// Contains the batch request error details associated with the request.
class BatchItemError {
  /// The error code associated with the batch request error.
  final BatchItemErrorCode? code;

  /// A message with the reason for the batch request error.
  final String? message;

  BatchItemError({
    this.code,
    this.message,
  });

  factory BatchItemError.fromJson(Map<String, dynamic> json) {
    return BatchItemError(
      code: (json['Code'] as String?)?.toBatchItemErrorCode(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.toValue(),
      if (message != null) 'Message': message,
    };
  }
}

enum BatchItemErrorCode {
  accessDeniedError,
  conflictError,
  internalServerError,
  resourceNotFoundError,
  throttlingError,
  validationError,
}

extension on BatchItemErrorCode {
  String toValue() {
    switch (this) {
      case BatchItemErrorCode.accessDeniedError:
        return 'AccessDeniedError';
      case BatchItemErrorCode.conflictError:
        return 'ConflictError';
      case BatchItemErrorCode.internalServerError:
        return 'InternalServerError';
      case BatchItemErrorCode.resourceNotFoundError:
        return 'ResourceNotFoundError';
      case BatchItemErrorCode.throttlingError:
        return 'ThrottlingError';
      case BatchItemErrorCode.validationError:
        return 'ValidationError';
    }
  }
}

extension on String {
  BatchItemErrorCode toBatchItemErrorCode() {
    switch (this) {
      case 'AccessDeniedError':
        return BatchItemErrorCode.accessDeniedError;
      case 'ConflictError':
        return BatchItemErrorCode.conflictError;
      case 'InternalServerError':
        return BatchItemErrorCode.internalServerError;
      case 'ResourceNotFoundError':
        return BatchItemErrorCode.resourceNotFoundError;
      case 'ThrottlingError':
        return BatchItemErrorCode.throttlingError;
      case 'ValidationError':
        return BatchItemErrorCode.validationError;
    }
    throw Exception('$this is not known in enum BatchItemErrorCode');
  }
}

/// Contains error details for each geofence that failed to be stored in a given
/// geofence collection.
class BatchPutGeofenceError {
  /// Contains details associated to the batch error.
  final BatchItemError error;

  /// The geofence associated with the error message.
  final String geofenceId;

  BatchPutGeofenceError({
    required this.error,
    required this.geofenceId,
  });

  factory BatchPutGeofenceError.fromJson(Map<String, dynamic> json) {
    return BatchPutGeofenceError(
      error: BatchItemError.fromJson(json['Error'] as Map<String, dynamic>),
      geofenceId: json['GeofenceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final geofenceId = this.geofenceId;
    return {
      'Error': error,
      'GeofenceId': geofenceId,
    };
  }
}

/// Contains geofence geometry details.
class BatchPutGeofenceRequestEntry {
  /// The identifier for the geofence to be stored in a given geofence collection.
  final String geofenceId;

  /// Contains the polygon details to specify the position of the geofence.
  /// <note>
  /// Each <a
  /// href="https://docs.aws.amazon.com/location-geofences/latest/APIReference/API_GeofenceGeometry.html">geofence
  /// polygon</a> can have a maximum of 1,000 vertices.
  /// </note>
  final GeofenceGeometry geometry;

  BatchPutGeofenceRequestEntry({
    required this.geofenceId,
    required this.geometry,
  });

  factory BatchPutGeofenceRequestEntry.fromJson(Map<String, dynamic> json) {
    return BatchPutGeofenceRequestEntry(
      geofenceId: json['GeofenceId'] as String,
      geometry:
          GeofenceGeometry.fromJson(json['Geometry'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final geofenceId = this.geofenceId;
    final geometry = this.geometry;
    return {
      'GeofenceId': geofenceId,
      'Geometry': geometry,
    };
  }
}

class BatchPutGeofenceResponse {
  /// Contains additional error details for each geofence that failed to be stored
  /// in a geofence collection.
  final List<BatchPutGeofenceError> errors;

  /// Contains each geofence that was successfully stored in a geofence
  /// collection.
  final List<BatchPutGeofenceSuccess> successes;

  BatchPutGeofenceResponse({
    required this.errors,
    required this.successes,
  });

  factory BatchPutGeofenceResponse.fromJson(Map<String, dynamic> json) {
    return BatchPutGeofenceResponse(
      errors: (json['Errors'] as List)
          .whereNotNull()
          .map((e) => BatchPutGeofenceError.fromJson(e as Map<String, dynamic>))
          .toList(),
      successes: (json['Successes'] as List)
          .whereNotNull()
          .map((e) =>
              BatchPutGeofenceSuccess.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final successes = this.successes;
    return {
      'Errors': errors,
      'Successes': successes,
    };
  }
}

/// Contains a summary of each geofence that was successfully stored in a given
/// geofence collection.
class BatchPutGeofenceSuccess {
  /// The timestamp for when the geofence was stored in a geofence collection in
  /// <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime createTime;

  /// The geofence successfully stored in a geofence collection.
  final String geofenceId;

  /// The timestamp for when the geofence was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  BatchPutGeofenceSuccess({
    required this.createTime,
    required this.geofenceId,
    required this.updateTime,
  });

  factory BatchPutGeofenceSuccess.fromJson(Map<String, dynamic> json) {
    return BatchPutGeofenceSuccess(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      geofenceId: json['GeofenceId'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final geofenceId = this.geofenceId;
    final updateTime = this.updateTime;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'GeofenceId': geofenceId,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

/// Contains error details for each device that failed to update its position.
class BatchUpdateDevicePositionError {
  /// The device associated with the failed location update.
  final String deviceId;

  /// Contains details related to the error code such as the error code and error
  /// message.
  final BatchItemError error;

  /// The timestamp at which the device position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime sampleTime;

  BatchUpdateDevicePositionError({
    required this.deviceId,
    required this.error,
    required this.sampleTime,
  });

  factory BatchUpdateDevicePositionError.fromJson(Map<String, dynamic> json) {
    return BatchUpdateDevicePositionError(
      deviceId: json['DeviceId'] as String,
      error: BatchItemError.fromJson(json['Error'] as Map<String, dynamic>),
      sampleTime: nonNullableTimeStampFromJson(json['SampleTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final error = this.error;
    final sampleTime = this.sampleTime;
    return {
      'DeviceId': deviceId,
      'Error': error,
      'SampleTime': iso8601ToJson(sampleTime),
    };
  }
}

class BatchUpdateDevicePositionResponse {
  /// Contains error details for each device that failed to update its position.
  final List<BatchUpdateDevicePositionError> errors;

  BatchUpdateDevicePositionResponse({
    required this.errors,
  });

  factory BatchUpdateDevicePositionResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateDevicePositionResponse(
      errors: (json['Errors'] as List)
          .whereNotNull()
          .map((e) => BatchUpdateDevicePositionError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      'Errors': errors,
    };
  }
}

/// Contains details about additional route preferences for requests that
/// specify <code>TravelMode</code> as <code>Car</code>.
class CalculateRouteCarModeOptions {
  /// Avoids ferries when calculating routes.
  ///
  /// Default Value: <code>false</code>
  ///
  /// Valid Values: <code>false</code> | <code>true</code>
  final bool? avoidFerries;

  /// Avoids tolls when calculating routes.
  ///
  /// Default Value: <code>false</code>
  ///
  /// Valid Values: <code>false</code> | <code>true</code>
  final bool? avoidTolls;

  CalculateRouteCarModeOptions({
    this.avoidFerries,
    this.avoidTolls,
  });

  factory CalculateRouteCarModeOptions.fromJson(Map<String, dynamic> json) {
    return CalculateRouteCarModeOptions(
      avoidFerries: json['AvoidFerries'] as bool?,
      avoidTolls: json['AvoidTolls'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final avoidFerries = this.avoidFerries;
    final avoidTolls = this.avoidTolls;
    return {
      if (avoidFerries != null) 'AvoidFerries': avoidFerries,
      if (avoidTolls != null) 'AvoidTolls': avoidTolls,
    };
  }
}

/// Returns the result of the route calculation. Metadata includes legs and
/// route summary.
class CalculateRouteResponse {
  /// Contains details about each path between a pair of positions included along
  /// a route such as: <code>StartPosition</code>, <code>EndPosition</code>,
  /// <code>Distance</code>, <code>DurationSeconds</code>, <code>Geometry</code>,
  /// and <code>Steps</code>. The number of legs returned corresponds to one less
  /// than the total number of positions in the request.
  ///
  /// For example, a route with a departure position and destination position
  /// returns one leg with the positions <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road">snapped
  /// to a nearby road</a>:
  ///
  /// <ul>
  /// <li>
  /// The <code>StartPosition</code> is the departure position.
  /// </li>
  /// <li>
  /// The <code>EndPosition</code> is the destination position.
  /// </li>
  /// </ul>
  /// A route with a waypoint between the departure and destination position
  /// returns two legs with the positions snapped to a nearby road.:
  ///
  /// <ul>
  /// <li>
  /// Leg 1: The <code>StartPosition</code> is the departure position . The
  /// <code>EndPosition</code> is the waypoint positon.
  /// </li>
  /// <li>
  /// Leg 2: The <code>StartPosition</code> is the waypoint position. The
  /// <code>EndPosition</code> is the destination position.
  /// </li>
  /// </ul>
  final List<Leg> legs;

  /// Contains information about the whole route, such as: <code>RouteBBox</code>,
  /// <code>DataSource</code>, <code>Distance</code>, <code>DistanceUnit</code>,
  /// and <code>DurationSeconds</code>
  final CalculateRouteSummary summary;

  CalculateRouteResponse({
    required this.legs,
    required this.summary,
  });

  factory CalculateRouteResponse.fromJson(Map<String, dynamic> json) {
    return CalculateRouteResponse(
      legs: (json['Legs'] as List)
          .whereNotNull()
          .map((e) => Leg.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: CalculateRouteSummary.fromJson(
          json['Summary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final legs = this.legs;
    final summary = this.summary;
    return {
      'Legs': legs,
      'Summary': summary,
    };
  }
}

/// A summary of the calculated route.
class CalculateRouteSummary {
  /// The data provider of traffic and road network data used to calculate the
  /// route. Indicates one of the available providers:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code>
  /// </li>
  /// <li>
  /// <code>Here</code>
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The total distance covered by the route. The sum of the distance travelled
  /// between every stop on the route.
  /// <note>
  /// The route <code>distance</code> can't be greater than 250 km. If the route
  /// exceeds 250 km, the response returns a <code>400
  /// RoutesValidationException</code> error.
  /// </note>
  final double distance;

  /// The unit of measurement for the distance.
  final DistanceUnit distanceUnit;

  /// The total travel time for the route measured in seconds. The sum of the
  /// travel time between every stop on the route.
  final double durationSeconds;

  /// Specifies a geographical box surrounding a route. Used to zoom into a route
  /// when displaying it in a map. For example, <code>[min x, min y, max x, max
  /// y]</code>
  ///
  /// The first 2 <code>bbox</code> parameters describe the lower southwest
  /// corner:
  ///
  /// <ul>
  /// <li>
  /// The first <code>bbox</code> position is the X coordinate or longitude of the
  /// lower southwest corner.
  /// </li>
  /// <li>
  /// The second <code>bbox</code> position is the Y coordinate or latitude of the
  /// lower southwest corner.
  /// </li>
  /// </ul>
  /// The next 2 <code>bbox</code> parameters describe the upper northeast corner:
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
  final List<double> routeBBox;

  CalculateRouteSummary({
    required this.dataSource,
    required this.distance,
    required this.distanceUnit,
    required this.durationSeconds,
    required this.routeBBox,
  });

  factory CalculateRouteSummary.fromJson(Map<String, dynamic> json) {
    return CalculateRouteSummary(
      dataSource: json['DataSource'] as String,
      distance: json['Distance'] as double,
      distanceUnit: (json['DistanceUnit'] as String).toDistanceUnit(),
      durationSeconds: json['DurationSeconds'] as double,
      routeBBox: (json['RouteBBox'] as List)
          .whereNotNull()
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final distance = this.distance;
    final distanceUnit = this.distanceUnit;
    final durationSeconds = this.durationSeconds;
    final routeBBox = this.routeBBox;
    return {
      'DataSource': dataSource,
      'Distance': distance,
      'DistanceUnit': distanceUnit.toValue(),
      'DurationSeconds': durationSeconds,
      'RouteBBox': routeBBox,
    };
  }
}

/// Contains details about additional route preferences for requests that
/// specify <code>TravelMode</code> as <code>Truck</code>.
class CalculateRouteTruckModeOptions {
  /// Avoids ferries when calculating routes.
  ///
  /// Default Value: <code>false</code>
  ///
  /// Valid Values: <code>false</code> | <code>true</code>
  final bool? avoidFerries;

  /// Avoids ferries when calculating routes.
  ///
  /// Default Value: <code>false</code>
  ///
  /// Valid Values: <code>false</code> | <code>true</code>
  final bool? avoidTolls;

  /// Specifies the truck's dimension specifications including length, height,
  /// width, and unit of measurement. Used to avoid roads that can't support the
  /// truck's dimensions.
  final TruckDimensions? dimensions;

  /// Specifies the truck's weight specifications including total weight and unit
  /// of measurement. Used to avoid roads that can't support the truck's weight.
  final TruckWeight? weight;

  CalculateRouteTruckModeOptions({
    this.avoidFerries,
    this.avoidTolls,
    this.dimensions,
    this.weight,
  });

  factory CalculateRouteTruckModeOptions.fromJson(Map<String, dynamic> json) {
    return CalculateRouteTruckModeOptions(
      avoidFerries: json['AvoidFerries'] as bool?,
      avoidTolls: json['AvoidTolls'] as bool?,
      dimensions: json['Dimensions'] != null
          ? TruckDimensions.fromJson(json['Dimensions'] as Map<String, dynamic>)
          : null,
      weight: json['Weight'] != null
          ? TruckWeight.fromJson(json['Weight'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final avoidFerries = this.avoidFerries;
    final avoidTolls = this.avoidTolls;
    final dimensions = this.dimensions;
    final weight = this.weight;
    return {
      if (avoidFerries != null) 'AvoidFerries': avoidFerries,
      if (avoidTolls != null) 'AvoidTolls': avoidTolls,
      if (dimensions != null) 'Dimensions': dimensions,
      if (weight != null) 'Weight': weight,
    };
  }
}

class CreateGeofenceCollectionResponse {
  /// The Amazon Resource Name (ARN) for the geofence collection resource. Used
  /// when you need to specify a resource across all AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection</code>
  /// </li>
  /// </ul>
  final String collectionArn;

  /// The name for the geofence collection.
  final String collectionName;

  /// The timestamp for when the geofence collection was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime createTime;

  CreateGeofenceCollectionResponse({
    required this.collectionArn,
    required this.collectionName,
    required this.createTime,
  });

  factory CreateGeofenceCollectionResponse.fromJson(Map<String, dynamic> json) {
    return CreateGeofenceCollectionResponse(
      collectionArn: json['CollectionArn'] as String,
      collectionName: json['CollectionName'] as String,
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final collectionArn = this.collectionArn;
    final collectionName = this.collectionName;
    final createTime = this.createTime;
    return {
      'CollectionArn': collectionArn,
      'CollectionName': collectionName,
      'CreateTime': iso8601ToJson(createTime),
    };
  }
}

class CreateMapResponse {
  /// The timestamp for when the map resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The Amazon Resource Name (ARN) for the map resource. Used when you need to
  /// specify a resource across all AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:maps/ExampleMap</code>
  /// </li>
  /// </ul>
  final String mapArn;

  /// The name of the map resource.
  final String mapName;

  CreateMapResponse({
    required this.createTime,
    required this.mapArn,
    required this.mapName,
  });

  factory CreateMapResponse.fromJson(Map<String, dynamic> json) {
    return CreateMapResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      mapArn: json['MapArn'] as String,
      mapName: json['MapName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final mapArn = this.mapArn;
    final mapName = this.mapName;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'MapArn': mapArn,
      'MapName': mapName,
    };
  }
}

class CreatePlaceIndexResponse {
  /// The timestamp for when the place index resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The Amazon Resource Name (ARN) for the place index resource. Used to specify
  /// a resource across all AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:place-index/ExamplePlaceIndex</code>
  /// </li>
  /// </ul>
  final String indexArn;

  /// The name for the place index resource.
  final String indexName;

  CreatePlaceIndexResponse({
    required this.createTime,
    required this.indexArn,
    required this.indexName,
  });

  factory CreatePlaceIndexResponse.fromJson(Map<String, dynamic> json) {
    return CreatePlaceIndexResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      indexArn: json['IndexArn'] as String,
      indexName: json['IndexName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final indexArn = this.indexArn;
    final indexName = this.indexName;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'IndexArn': indexArn,
      'IndexName': indexName,
    };
  }
}

class CreateRouteCalculatorResponse {
  /// The Amazon Resource Name (ARN) for the route calculator resource. Use the
  /// ARN when you specify a resource across all AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:route-calculator/ExampleCalculator</code>
  /// </li>
  /// </ul>
  final String calculatorArn;

  /// The name of the route calculator resource.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>ExampleRouteCalculator</code>.
  /// </li>
  /// </ul>
  final String calculatorName;

  /// The timestamp when the route calculator resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>2020–07-2T12:15:20.000Z+01:00</code>
  /// </li>
  /// </ul>
  final DateTime createTime;

  CreateRouteCalculatorResponse({
    required this.calculatorArn,
    required this.calculatorName,
    required this.createTime,
  });

  factory CreateRouteCalculatorResponse.fromJson(Map<String, dynamic> json) {
    return CreateRouteCalculatorResponse(
      calculatorArn: json['CalculatorArn'] as String,
      calculatorName: json['CalculatorName'] as String,
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final calculatorArn = this.calculatorArn;
    final calculatorName = this.calculatorName;
    final createTime = this.createTime;
    return {
      'CalculatorArn': calculatorArn,
      'CalculatorName': calculatorName,
      'CreateTime': iso8601ToJson(createTime),
    };
  }
}

class CreateTrackerResponse {
  /// The timestamp for when the tracker resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The Amazon Resource Name (ARN) for the tracker resource. Used when you need
  /// to specify a resource across all AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:tracker/ExampleTracker</code>
  /// </li>
  /// </ul>
  final String trackerArn;

  /// The name of the tracker resource.
  final String trackerName;

  CreateTrackerResponse({
    required this.createTime,
    required this.trackerArn,
    required this.trackerName,
  });

  factory CreateTrackerResponse.fromJson(Map<String, dynamic> json) {
    return CreateTrackerResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      trackerArn: json['TrackerArn'] as String,
      trackerName: json['TrackerName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final trackerArn = this.trackerArn;
    final trackerName = this.trackerName;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'TrackerArn': trackerArn,
      'TrackerName': trackerName,
    };
  }
}

/// Specifies the data storage option chosen for requesting Places.
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
  /// <important>
  /// Place index resources using HERE as a data provider can't be configured to
  /// store results for locations in Japan when choosing <code>Storage</code> for
  /// the <code>IntendedUse</code> parameter.
  /// </important> </li>
  /// </ul>
  /// Default value: <code>SingleUse</code>
  final IntendedUse? intendedUse;

  DataSourceConfiguration({
    this.intendedUse,
  });

  factory DataSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return DataSourceConfiguration(
      intendedUse: (json['IntendedUse'] as String?)?.toIntendedUse(),
    );
  }

  Map<String, dynamic> toJson() {
    final intendedUse = this.intendedUse;
    return {
      if (intendedUse != null) 'IntendedUse': intendedUse.toValue(),
    };
  }
}

class DeleteGeofenceCollectionResponse {
  DeleteGeofenceCollectionResponse();

  factory DeleteGeofenceCollectionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteGeofenceCollectionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteMapResponse {
  DeleteMapResponse();

  factory DeleteMapResponse.fromJson(Map<String, dynamic> _) {
    return DeleteMapResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePlaceIndexResponse {
  DeletePlaceIndexResponse();

  factory DeletePlaceIndexResponse.fromJson(Map<String, dynamic> _) {
    return DeletePlaceIndexResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRouteCalculatorResponse {
  DeleteRouteCalculatorResponse();

  factory DeleteRouteCalculatorResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRouteCalculatorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTrackerResponse {
  DeleteTrackerResponse();

  factory DeleteTrackerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTrackerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeGeofenceCollectionResponse {
  /// The Amazon Resource Name (ARN) for the geofence collection resource. Used
  /// when you need to specify a resource across all AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection</code>
  /// </li>
  /// </ul>
  final String collectionArn;

  /// The name of the geofence collection.
  final String collectionName;

  /// The timestamp for when the geofence resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime createTime;

  /// The optional description for the geofence collection.
  final String description;

  /// The pricing plan selected for the specified geofence collection.
  ///
  /// For additional details and restrictions on each pricing plan option, see the
  /// <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// pricing page</a>.
  final PricingPlan pricingPlan;

  /// The timestamp for when the geofence collection was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  /// A key identifier for an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">AWS
  /// KMS customer managed key</a> assigned to the Amazon Location resource
  final String? kmsKeyId;

  /// The specified data provider for the geofence collection.
  final String? pricingPlanDataSource;

  /// Displays the key, value pairs of tags associated with this resource.
  final Map<String, String>? tags;

  DescribeGeofenceCollectionResponse({
    required this.collectionArn,
    required this.collectionName,
    required this.createTime,
    required this.description,
    required this.pricingPlan,
    required this.updateTime,
    this.kmsKeyId,
    this.pricingPlanDataSource,
    this.tags,
  });

  factory DescribeGeofenceCollectionResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeGeofenceCollectionResponse(
      collectionArn: json['CollectionArn'] as String,
      collectionName: json['CollectionName'] as String,
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      description: json['Description'] as String,
      pricingPlan: (json['PricingPlan'] as String).toPricingPlan(),
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      kmsKeyId: json['KmsKeyId'] as String?,
      pricingPlanDataSource: json['PricingPlanDataSource'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final collectionArn = this.collectionArn;
    final collectionName = this.collectionName;
    final createTime = this.createTime;
    final description = this.description;
    final pricingPlan = this.pricingPlan;
    final updateTime = this.updateTime;
    final kmsKeyId = this.kmsKeyId;
    final pricingPlanDataSource = this.pricingPlanDataSource;
    final tags = this.tags;
    return {
      'CollectionArn': collectionArn,
      'CollectionName': collectionName,
      'CreateTime': iso8601ToJson(createTime),
      'Description': description,
      'PricingPlan': pricingPlan.toValue(),
      'UpdateTime': iso8601ToJson(updateTime),
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
      if (tags != null) 'Tags': tags,
    };
  }
}

class DescribeMapResponse {
  /// Specifies the map tile style selected from a partner data provider.
  final MapConfiguration configuration;

  /// The timestamp for when the map resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// Specifies the data provider for the associated map tiles.
  final String dataSource;

  /// The optional description for the map resource.
  final String description;

  /// The Amazon Resource Name (ARN) for the map resource. Used when you need to
  /// specify a resource across all AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:maps/ExampleMap</code>
  /// </li>
  /// </ul>
  final String mapArn;

  /// The map style selected from an available provider.
  final String mapName;

  /// The pricing plan selected for the specified map resource.
  /// <pre><code> &lt;p&gt;For additional details and restrictions on each pricing
  /// plan option, see the &lt;a
  /// href=&quot;https://aws.amazon.com/location/pricing/&quot;&gt;Amazon Location
  /// Service pricing page&lt;/a&gt;.&lt;/p&gt; </code></pre>
  final PricingPlan pricingPlan;

  /// The timestamp for when the map resource was last update in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// Tags associated with the map resource.
  final Map<String, String>? tags;

  DescribeMapResponse({
    required this.configuration,
    required this.createTime,
    required this.dataSource,
    required this.description,
    required this.mapArn,
    required this.mapName,
    required this.pricingPlan,
    required this.updateTime,
    this.tags,
  });

  factory DescribeMapResponse.fromJson(Map<String, dynamic> json) {
    return DescribeMapResponse(
      configuration: MapConfiguration.fromJson(
          json['Configuration'] as Map<String, dynamic>),
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      dataSource: json['DataSource'] as String,
      description: json['Description'] as String,
      mapArn: json['MapArn'] as String,
      mapName: json['MapName'] as String,
      pricingPlan: (json['PricingPlan'] as String).toPricingPlan(),
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final description = this.description;
    final mapArn = this.mapArn;
    final mapName = this.mapName;
    final pricingPlan = this.pricingPlan;
    final updateTime = this.updateTime;
    final tags = this.tags;
    return {
      'Configuration': configuration,
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'Description': description,
      'MapArn': mapArn,
      'MapName': mapName,
      'PricingPlan': pricingPlan.toValue(),
      'UpdateTime': iso8601ToJson(updateTime),
      if (tags != null) 'Tags': tags,
    };
  }
}

class DescribePlaceIndexResponse {
  /// The timestamp for when the place index resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The data provider of geospatial data. Indicates one of the available
  /// providers:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code>
  /// </li>
  /// <li>
  /// <code>Here</code>
  /// </li>
  /// </ul>
  /// For additional details on data providers, see the <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers page</a>.
  final String dataSource;

  /// The specified data storage option for requesting Places.
  final DataSourceConfiguration dataSourceConfiguration;

  /// The optional description for the place index resource.
  final String description;

  /// The Amazon Resource Name (ARN) for the place index resource. Used to specify
  /// a resource across all AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:place-index/ExamplePlaceIndex</code>
  /// </li>
  /// </ul>
  final String indexArn;

  /// The name of the place index resource being described.
  final String indexName;

  /// The pricing plan selected for the specified place index resource.
  ///
  /// For additional details and restrictions on each pricing plan option, see the
  /// <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// pricing page</a>.
  final PricingPlan pricingPlan;

  /// The timestamp for when the place index resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// Tags associated with place index resource.
  final Map<String, String>? tags;

  DescribePlaceIndexResponse({
    required this.createTime,
    required this.dataSource,
    required this.dataSourceConfiguration,
    required this.description,
    required this.indexArn,
    required this.indexName,
    required this.pricingPlan,
    required this.updateTime,
    this.tags,
  });

  factory DescribePlaceIndexResponse.fromJson(Map<String, dynamic> json) {
    return DescribePlaceIndexResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      dataSource: json['DataSource'] as String,
      dataSourceConfiguration: DataSourceConfiguration.fromJson(
          json['DataSourceConfiguration'] as Map<String, dynamic>),
      description: json['Description'] as String,
      indexArn: json['IndexArn'] as String,
      indexName: json['IndexName'] as String,
      pricingPlan: (json['PricingPlan'] as String).toPricingPlan(),
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final dataSourceConfiguration = this.dataSourceConfiguration;
    final description = this.description;
    final indexArn = this.indexArn;
    final indexName = this.indexName;
    final pricingPlan = this.pricingPlan;
    final updateTime = this.updateTime;
    final tags = this.tags;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'DataSourceConfiguration': dataSourceConfiguration,
      'Description': description,
      'IndexArn': indexArn,
      'IndexName': indexName,
      'PricingPlan': pricingPlan.toValue(),
      'UpdateTime': iso8601ToJson(updateTime),
      if (tags != null) 'Tags': tags,
    };
  }
}

class DescribeRouteCalculatorResponse {
  /// The Amazon Resource Name (ARN) for the Route calculator resource. Use the
  /// ARN when you specify a resource across AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:route-calculator/ExampleCalculator</code>
  /// </li>
  /// </ul>
  final String calculatorArn;

  /// The name of the route calculator resource being described.
  final String calculatorName;

  /// The timestamp when the route calculator resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>2020–07-2T12:15:20.000Z+01:00</code>
  /// </li>
  /// </ul>
  final DateTime createTime;

  /// The data provider of traffic and road network data. Indicates one of the
  /// available providers:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code>
  /// </li>
  /// <li>
  /// <code>Here</code>
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The optional description of the route calculator resource.
  final String description;

  /// The pricing plan selected for the specified route calculator resource.
  ///
  /// For additional details and restrictions on each pricing plan option, see <a
  /// href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// pricing</a>.
  final PricingPlan pricingPlan;

  /// The timestamp when the route calculator resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>2020–07-2T12:15:20.000Z+01:00</code>
  /// </li>
  /// </ul>
  final DateTime updateTime;

  /// Tags associated with route calculator resource.
  final Map<String, String>? tags;

  DescribeRouteCalculatorResponse({
    required this.calculatorArn,
    required this.calculatorName,
    required this.createTime,
    required this.dataSource,
    required this.description,
    required this.pricingPlan,
    required this.updateTime,
    this.tags,
  });

  factory DescribeRouteCalculatorResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRouteCalculatorResponse(
      calculatorArn: json['CalculatorArn'] as String,
      calculatorName: json['CalculatorName'] as String,
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      dataSource: json['DataSource'] as String,
      description: json['Description'] as String,
      pricingPlan: (json['PricingPlan'] as String).toPricingPlan(),
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final calculatorArn = this.calculatorArn;
    final calculatorName = this.calculatorName;
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final description = this.description;
    final pricingPlan = this.pricingPlan;
    final updateTime = this.updateTime;
    final tags = this.tags;
    return {
      'CalculatorArn': calculatorArn,
      'CalculatorName': calculatorName,
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'Description': description,
      'PricingPlan': pricingPlan.toValue(),
      'UpdateTime': iso8601ToJson(updateTime),
      if (tags != null) 'Tags': tags,
    };
  }
}

class DescribeTrackerResponse {
  /// The timestamp for when the tracker resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The optional description for the tracker resource.
  final String description;

  /// The pricing plan selected for the specified tracker resource.
  ///
  /// For additional details and restrictions on each pricing plan option, see the
  /// <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// pricing page</a>.
  final PricingPlan pricingPlan;

  /// The Amazon Resource Name (ARN) for the tracker resource. Used when you need
  /// to specify a resource across all AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:tracker/ExampleTracker</code>
  /// </li>
  /// </ul>
  final String trackerArn;

  /// The name of the tracker resource.
  final String trackerName;

  /// The timestamp for when the tracker resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// A key identifier for an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">AWS
  /// KMS customer managed key</a> assigned to the Amazon Location resource.
  final String? kmsKeyId;

  /// The specified data provider for the tracker resource.
  final String? pricingPlanDataSource;

  /// The tags associated with the tracker resource.
  final Map<String, String>? tags;

  DescribeTrackerResponse({
    required this.createTime,
    required this.description,
    required this.pricingPlan,
    required this.trackerArn,
    required this.trackerName,
    required this.updateTime,
    this.kmsKeyId,
    this.pricingPlanDataSource,
    this.tags,
  });

  factory DescribeTrackerResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTrackerResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      description: json['Description'] as String,
      pricingPlan: (json['PricingPlan'] as String).toPricingPlan(),
      trackerArn: json['TrackerArn'] as String,
      trackerName: json['TrackerName'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      kmsKeyId: json['KmsKeyId'] as String?,
      pricingPlanDataSource: json['PricingPlanDataSource'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final description = this.description;
    final pricingPlan = this.pricingPlan;
    final trackerArn = this.trackerArn;
    final trackerName = this.trackerName;
    final updateTime = this.updateTime;
    final kmsKeyId = this.kmsKeyId;
    final pricingPlanDataSource = this.pricingPlanDataSource;
    final tags = this.tags;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'Description': description,
      'PricingPlan': pricingPlan.toValue(),
      'TrackerArn': trackerArn,
      'TrackerName': trackerName,
      'UpdateTime': iso8601ToJson(updateTime),
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains the device position details.
class DevicePosition {
  /// The last known device position.
  final List<double> position;

  /// The timestamp for when the tracker resource received the device position in
  /// <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime receivedTime;

  /// The timestamp at which the device's position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime sampleTime;

  /// The device whose position you retrieved.
  final String? deviceId;

  DevicePosition({
    required this.position,
    required this.receivedTime,
    required this.sampleTime,
    this.deviceId,
  });

  factory DevicePosition.fromJson(Map<String, dynamic> json) {
    return DevicePosition(
      position: (json['Position'] as List)
          .whereNotNull()
          .map((e) => e as double)
          .toList(),
      receivedTime:
          nonNullableTimeStampFromJson(json['ReceivedTime'] as Object),
      sampleTime: nonNullableTimeStampFromJson(json['SampleTime'] as Object),
      deviceId: json['DeviceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final receivedTime = this.receivedTime;
    final sampleTime = this.sampleTime;
    final deviceId = this.deviceId;
    return {
      'Position': position,
      'ReceivedTime': iso8601ToJson(receivedTime),
      'SampleTime': iso8601ToJson(sampleTime),
      if (deviceId != null) 'DeviceId': deviceId,
    };
  }
}

/// Contains the position update details for a device.
class DevicePositionUpdate {
  /// The device associated to the position update.
  final String deviceId;

  /// The latest device position defined in <a
  /// href="https://earth-info.nga.mil/GandG/wgs84/index.html">WGS 84</a> format:
  /// <code>[X or longitude, Y or latitude]</code>.
  final List<double> position;

  /// The timestamp at which the device's position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime sampleTime;

  DevicePositionUpdate({
    required this.deviceId,
    required this.position,
    required this.sampleTime,
  });

  factory DevicePositionUpdate.fromJson(Map<String, dynamic> json) {
    return DevicePositionUpdate(
      deviceId: json['DeviceId'] as String,
      position: (json['Position'] as List)
          .whereNotNull()
          .map((e) => e as double)
          .toList(),
      sampleTime: nonNullableTimeStampFromJson(json['SampleTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final position = this.position;
    final sampleTime = this.sampleTime;
    return {
      'DeviceId': deviceId,
      'Position': position,
      'SampleTime': iso8601ToJson(sampleTime),
    };
  }
}

enum DimensionUnit {
  meters,
  feet,
}

extension on DimensionUnit {
  String toValue() {
    switch (this) {
      case DimensionUnit.meters:
        return 'Meters';
      case DimensionUnit.feet:
        return 'Feet';
    }
  }
}

extension on String {
  DimensionUnit toDimensionUnit() {
    switch (this) {
      case 'Meters':
        return DimensionUnit.meters;
      case 'Feet':
        return DimensionUnit.feet;
    }
    throw Exception('$this is not known in enum DimensionUnit');
  }
}

class DisassociateTrackerConsumerResponse {
  DisassociateTrackerConsumerResponse();

  factory DisassociateTrackerConsumerResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateTrackerConsumerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum DistanceUnit {
  kilometers,
  miles,
}

extension on DistanceUnit {
  String toValue() {
    switch (this) {
      case DistanceUnit.kilometers:
        return 'Kilometers';
      case DistanceUnit.miles:
        return 'Miles';
    }
  }
}

extension on String {
  DistanceUnit toDistanceUnit() {
    switch (this) {
      case 'Kilometers':
        return DistanceUnit.kilometers;
      case 'Miles':
        return DistanceUnit.miles;
    }
    throw Exception('$this is not known in enum DistanceUnit');
  }
}

/// Contains the geofence geometry details.
/// <note>
/// Amazon Location doesn't currently support polygons with holes,
/// multipolygons, polygons that are wound clockwise, or that cross the
/// antimeridian.
/// </note>
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
  final List<List<List<double>>>? polygon;

  GeofenceGeometry({
    this.polygon,
  });

  factory GeofenceGeometry.fromJson(Map<String, dynamic> json) {
    return GeofenceGeometry(
      polygon: (json['Polygon'] as List?)
          ?.whereNotNull()
          .map((e) => (e as List)
              .whereNotNull()
              .map((e) =>
                  (e as List).whereNotNull().map((e) => e as double).toList())
              .toList())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final polygon = this.polygon;
    return {
      if (polygon != null) 'Polygon': polygon,
    };
  }
}

class GetDevicePositionHistoryResponse {
  /// Contains the position history details for the requested device.
  final List<DevicePosition> devicePositions;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  GetDevicePositionHistoryResponse({
    required this.devicePositions,
    this.nextToken,
  });

  factory GetDevicePositionHistoryResponse.fromJson(Map<String, dynamic> json) {
    return GetDevicePositionHistoryResponse(
      devicePositions: (json['DevicePositions'] as List)
          .whereNotNull()
          .map((e) => DevicePosition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devicePositions = this.devicePositions;
    final nextToken = this.nextToken;
    return {
      'DevicePositions': devicePositions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetDevicePositionResponse {
  /// The last known device position.
  final List<double> position;

  /// The timestamp for when the tracker resource received the device position in
  /// <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601
  /// </a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime receivedTime;

  /// The timestamp at which the device's position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601 </a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime sampleTime;

  /// The device whose position you retrieved.
  final String? deviceId;

  GetDevicePositionResponse({
    required this.position,
    required this.receivedTime,
    required this.sampleTime,
    this.deviceId,
  });

  factory GetDevicePositionResponse.fromJson(Map<String, dynamic> json) {
    return GetDevicePositionResponse(
      position: (json['Position'] as List)
          .whereNotNull()
          .map((e) => e as double)
          .toList(),
      receivedTime:
          nonNullableTimeStampFromJson(json['ReceivedTime'] as Object),
      sampleTime: nonNullableTimeStampFromJson(json['SampleTime'] as Object),
      deviceId: json['DeviceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final receivedTime = this.receivedTime;
    final sampleTime = this.sampleTime;
    final deviceId = this.deviceId;
    return {
      'Position': position,
      'ReceivedTime': iso8601ToJson(receivedTime),
      'SampleTime': iso8601ToJson(sampleTime),
      if (deviceId != null) 'DeviceId': deviceId,
    };
  }
}

class GetGeofenceResponse {
  /// The timestamp for when the geofence collection was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime createTime;

  /// The geofence identifier.
  final String geofenceId;

  /// Contains the geofence geometry details describing a polygon.
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
  final String status;

  /// The timestamp for when the geofence collection was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  GetGeofenceResponse({
    required this.createTime,
    required this.geofenceId,
    required this.geometry,
    required this.status,
    required this.updateTime,
  });

  factory GetGeofenceResponse.fromJson(Map<String, dynamic> json) {
    return GetGeofenceResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      geofenceId: json['GeofenceId'] as String,
      geometry:
          GeofenceGeometry.fromJson(json['Geometry'] as Map<String, dynamic>),
      status: json['Status'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final geofenceId = this.geofenceId;
    final geometry = this.geometry;
    final status = this.status;
    final updateTime = this.updateTime;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'GeofenceId': geofenceId,
      'Geometry': geometry,
      'Status': status,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

class GetMapGlyphsResponse {
  /// The blob's content type.
  final Uint8List? blob;

  /// The map glyph content type. For example,
  /// <code>application/octet-stream</code>.
  final String? contentType;

  GetMapGlyphsResponse({
    this.blob,
    this.contentType,
  });

  factory GetMapGlyphsResponse.fromJson(Map<String, dynamic> json) {
    return GetMapGlyphsResponse(
      blob: _s.decodeNullableUint8List(json['Blob'] as String?),
      contentType: json['Content-Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final contentType = this.contentType;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

class GetMapSpritesResponse {
  /// Contains the body of the sprite sheet or JSON offset ﬁle.
  final Uint8List? blob;

  /// The content type of the sprite sheet and offsets. For example, the sprite
  /// sheet content type is <code>image/png</code>, and the sprite offset JSON
  /// document is <code>application/json</code>.
  final String? contentType;

  GetMapSpritesResponse({
    this.blob,
    this.contentType,
  });

  factory GetMapSpritesResponse.fromJson(Map<String, dynamic> json) {
    return GetMapSpritesResponse(
      blob: _s.decodeNullableUint8List(json['Blob'] as String?),
      contentType: json['Content-Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final contentType = this.contentType;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

class GetMapStyleDescriptorResponse {
  /// Contains the body of the style descriptor.
  final Uint8List? blob;

  /// The style descriptor's content type. For example,
  /// <code>application/json</code>.
  final String? contentType;

  GetMapStyleDescriptorResponse({
    this.blob,
    this.contentType,
  });

  factory GetMapStyleDescriptorResponse.fromJson(Map<String, dynamic> json) {
    return GetMapStyleDescriptorResponse(
      blob: _s.decodeNullableUint8List(json['Blob'] as String?),
      contentType: json['Content-Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final contentType = this.contentType;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

class GetMapTileResponse {
  /// Contains Mapbox Vector Tile (MVT) data.
  final Uint8List? blob;

  /// The map tile's content type. For example,
  /// <code>application/vnd.mapbox-vector-tile</code>.
  final String? contentType;

  GetMapTileResponse({
    this.blob,
    this.contentType,
  });

  factory GetMapTileResponse.fromJson(Map<String, dynamic> json) {
    return GetMapTileResponse(
      blob: _s.decodeNullableUint8List(json['Blob'] as String?),
      contentType: json['Content-Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final contentType = this.contentType;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

enum IntendedUse {
  singleUse,
  storage,
}

extension on IntendedUse {
  String toValue() {
    switch (this) {
      case IntendedUse.singleUse:
        return 'SingleUse';
      case IntendedUse.storage:
        return 'Storage';
    }
  }
}

extension on String {
  IntendedUse toIntendedUse() {
    switch (this) {
      case 'SingleUse':
        return IntendedUse.singleUse;
      case 'Storage':
        return IntendedUse.storage;
    }
    throw Exception('$this is not known in enum IntendedUse');
  }
}

/// Contains the calculated route's details for each path between a pair of
/// positions. The number of legs returned corresponds to one less than the
/// total number of positions in the request.
///
/// For example, a route with a departure position and destination position
/// returns one leg with the positions <a
/// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road">snapped
/// to a nearby road</a>:
///
/// <ul>
/// <li>
/// The <code>StartPosition</code> is the departure position.
/// </li>
/// <li>
/// The <code>EndPosition</code> is the destination position.
/// </li>
/// </ul>
/// A route with a waypoint between the departure and destination position
/// returns two legs with the positions snapped to a nearby road.:
///
/// <ul>
/// <li>
/// Leg 1: The <code>StartPosition</code> is the departure position . The
/// <code>EndPosition</code> is the waypoint positon.
/// </li>
/// <li>
/// Leg 2: The <code>StartPosition</code> is the waypoint position. The
/// <code>EndPosition</code> is the destination position.
/// </li>
/// </ul>
class Leg {
  /// The distance between the leg's <code>StartPosition</code> and
  /// <code>EndPosition</code> along a calculated route.
  ///
  /// <ul>
  /// <li>
  /// The default measurement is <code>Kilometers</code> unless the request
  /// specifies a <code>DistanceUnit</code> of <code>Miles</code>.
  /// </li>
  /// </ul>
  final double distance;

  /// The estimated travel time between the leg's <code>StartPosition</code> and
  /// <code>EndPosition</code>. The travel mode and departure time that you
  /// specify in the request determines the calculated time.
  final double durationSeconds;

  /// The terminating position of the leg. Follows the format
  /// <code>[longitude,latitude]</code>.
  /// <note>
  /// If the <code>EndPosition</code> isn't located on a road, it's <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road">snapped
  /// to a nearby road</a>.
  /// </note>
  final List<double> endPosition;

  /// The starting position of the leg. Follows the format
  /// <code>[longitude,latitude]</code>.
  /// <note>
  /// If the <code>StartPosition</code> isn't located on a road, it's <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road">snapped
  /// to a nearby road</a>.
  /// </note>
  final List<double> startPosition;

  /// Contains a list of steps, which represent subsections of a leg. Each step
  /// provides instructions for how to move to the next step in the leg such as
  /// the step's start position, end position, travel distance, travel duration,
  /// and geometry offset.
  final List<Step> steps;

  /// Contains the calculated route's path as a linestring geometry.
  final LegGeometry? geometry;

  Leg({
    required this.distance,
    required this.durationSeconds,
    required this.endPosition,
    required this.startPosition,
    required this.steps,
    this.geometry,
  });

  factory Leg.fromJson(Map<String, dynamic> json) {
    return Leg(
      distance: json['Distance'] as double,
      durationSeconds: json['DurationSeconds'] as double,
      endPosition: (json['EndPosition'] as List)
          .whereNotNull()
          .map((e) => e as double)
          .toList(),
      startPosition: (json['StartPosition'] as List)
          .whereNotNull()
          .map((e) => e as double)
          .toList(),
      steps: (json['Steps'] as List)
          .whereNotNull()
          .map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      geometry: json['Geometry'] != null
          ? LegGeometry.fromJson(json['Geometry'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final durationSeconds = this.durationSeconds;
    final endPosition = this.endPosition;
    final startPosition = this.startPosition;
    final steps = this.steps;
    final geometry = this.geometry;
    return {
      'Distance': distance,
      'DurationSeconds': durationSeconds,
      'EndPosition': endPosition,
      'StartPosition': startPosition,
      'Steps': steps,
      if (geometry != null) 'Geometry': geometry,
    };
  }
}

/// Contains the geometry details for each path between a pair of positions.
/// Used in plotting a route leg on a map.
class LegGeometry {
  /// An ordered list of positions used to plot a route on a map.
  ///
  /// The first position is closest to the start position for the leg, and the
  /// last position is the closest to the end position for the leg.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>[[-123.117, 49.284],[-123.115, 49.285],[-123.115,
  /// 49.285]]</code>
  /// </li>
  /// </ul>
  final List<List<double>>? lineString;

  LegGeometry({
    this.lineString,
  });

  factory LegGeometry.fromJson(Map<String, dynamic> json) {
    return LegGeometry(
      lineString: (json['LineString'] as List?)
          ?.whereNotNull()
          .map((e) =>
              (e as List).whereNotNull().map((e) => e as double).toList())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final lineString = this.lineString;
    return {
      if (lineString != null) 'LineString': lineString,
    };
  }
}

class ListDevicePositionsResponse {
  /// Contains details about each device's last known position. These details
  /// includes the device ID, the time when the position was sampled on the
  /// device, the time that the service received the update, and the most recent
  /// coordinates.
  final List<ListDevicePositionsResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  ListDevicePositionsResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListDevicePositionsResponse.fromJson(Map<String, dynamic> json) {
    return ListDevicePositionsResponse(
      entries: (json['Entries'] as List)
          .whereNotNull()
          .map((e) => ListDevicePositionsResponseEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Contains the tracker resource details.
class ListDevicePositionsResponseEntry {
  /// The ID of the device for this position.
  final String deviceId;

  /// The last known device position. Empty if no positions currently stored.
  final List<double> position;

  /// The timestamp at which the device position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime sampleTime;

  ListDevicePositionsResponseEntry({
    required this.deviceId,
    required this.position,
    required this.sampleTime,
  });

  factory ListDevicePositionsResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListDevicePositionsResponseEntry(
      deviceId: json['DeviceId'] as String,
      position: (json['Position'] as List)
          .whereNotNull()
          .map((e) => e as double)
          .toList(),
      sampleTime: nonNullableTimeStampFromJson(json['SampleTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final position = this.position;
    final sampleTime = this.sampleTime;
    return {
      'DeviceId': deviceId,
      'Position': position,
      'SampleTime': iso8601ToJson(sampleTime),
    };
  }
}

class ListGeofenceCollectionsResponse {
  /// Lists the geofence collections that exist in your AWS account.
  final List<ListGeofenceCollectionsResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  ListGeofenceCollectionsResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListGeofenceCollectionsResponse.fromJson(Map<String, dynamic> json) {
    return ListGeofenceCollectionsResponse(
      entries: (json['Entries'] as List)
          .whereNotNull()
          .map((e) => ListGeofenceCollectionsResponseEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Contains the geofence collection details.
class ListGeofenceCollectionsResponseEntry {
  /// The name of the geofence collection.
  final String collectionName;

  /// The timestamp for when the geofence collection was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime createTime;

  /// The description for the geofence collection
  final String description;

  /// The pricing plan for the specified geofence collection.
  ///
  /// For additional details and restrictions on each pricing plan option, see the
  /// <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// pricing page</a>.
  final PricingPlan pricingPlan;

  /// Specifies a timestamp for when the resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  /// The specified data provider for the geofence collection.
  final String? pricingPlanDataSource;

  ListGeofenceCollectionsResponseEntry({
    required this.collectionName,
    required this.createTime,
    required this.description,
    required this.pricingPlan,
    required this.updateTime,
    this.pricingPlanDataSource,
  });

  factory ListGeofenceCollectionsResponseEntry.fromJson(
      Map<String, dynamic> json) {
    return ListGeofenceCollectionsResponseEntry(
      collectionName: json['CollectionName'] as String,
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      description: json['Description'] as String,
      pricingPlan: (json['PricingPlan'] as String).toPricingPlan(),
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      pricingPlanDataSource: json['PricingPlanDataSource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collectionName = this.collectionName;
    final createTime = this.createTime;
    final description = this.description;
    final pricingPlan = this.pricingPlan;
    final updateTime = this.updateTime;
    final pricingPlanDataSource = this.pricingPlanDataSource;
    return {
      'CollectionName': collectionName,
      'CreateTime': iso8601ToJson(createTime),
      'Description': description,
      'PricingPlan': pricingPlan.toValue(),
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
    };
  }
}

/// Contains a list of geofences stored in a given geofence collection.
class ListGeofenceResponseEntry {
  /// The timestamp for when the geofence was stored in a geofence collection in
  /// <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime createTime;

  /// The geofence identifier.
  final String geofenceId;

  /// Contains the geofence geometry details describing a polygon.
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
  final String status;

  /// The timestamp for when the geofence was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  ListGeofenceResponseEntry({
    required this.createTime,
    required this.geofenceId,
    required this.geometry,
    required this.status,
    required this.updateTime,
  });

  factory ListGeofenceResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListGeofenceResponseEntry(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      geofenceId: json['GeofenceId'] as String,
      geometry:
          GeofenceGeometry.fromJson(json['Geometry'] as Map<String, dynamic>),
      status: json['Status'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final geofenceId = this.geofenceId;
    final geometry = this.geometry;
    final status = this.status;
    final updateTime = this.updateTime;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'GeofenceId': geofenceId,
      'Geometry': geometry,
      'Status': status,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

class ListGeofencesResponse {
  /// Contains a list of geofences stored in the geofence collection.
  final List<ListGeofenceResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  ListGeofencesResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListGeofencesResponse.fromJson(Map<String, dynamic> json) {
    return ListGeofencesResponse(
      entries: (json['Entries'] as List)
          .whereNotNull()
          .map((e) =>
              ListGeofenceResponseEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMapsResponse {
  /// Contains a list of maps in your AWS account
  final List<ListMapsResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  ListMapsResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListMapsResponse.fromJson(Map<String, dynamic> json) {
    return ListMapsResponse(
      entries: (json['Entries'] as List)
          .whereNotNull()
          .map((e) => ListMapsResponseEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Contains details of an existing map resource in your AWS account.
class ListMapsResponseEntry {
  /// The timestamp for when the map resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// Specifies the data provider for the associated map tiles.
  final String dataSource;

  /// The description for the map resource.
  final String description;

  /// The name of the associated map resource.
  final String mapName;

  /// The pricing plan for the specified map resource.
  ///
  /// For additional details and restrictions on each pricing plan option, see the
  /// <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// pricing page</a>.
  final PricingPlan pricingPlan;

  /// The timestamp for when the map resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  ListMapsResponseEntry({
    required this.createTime,
    required this.dataSource,
    required this.description,
    required this.mapName,
    required this.pricingPlan,
    required this.updateTime,
  });

  factory ListMapsResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListMapsResponseEntry(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      dataSource: json['DataSource'] as String,
      description: json['Description'] as String,
      mapName: json['MapName'] as String,
      pricingPlan: (json['PricingPlan'] as String).toPricingPlan(),
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final description = this.description;
    final mapName = this.mapName;
    final pricingPlan = this.pricingPlan;
    final updateTime = this.updateTime;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'Description': description,
      'MapName': mapName,
      'PricingPlan': pricingPlan.toValue(),
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

class ListPlaceIndexesResponse {
  /// Lists the place index resources that exist in your AWS account
  final List<ListPlaceIndexesResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  ListPlaceIndexesResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListPlaceIndexesResponse.fromJson(Map<String, dynamic> json) {
    return ListPlaceIndexesResponse(
      entries: (json['Entries'] as List)
          .whereNotNull()
          .map((e) =>
              ListPlaceIndexesResponseEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A place index resource listed in your AWS account.
class ListPlaceIndexesResponseEntry {
  /// The timestamp for when the place index resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The data provider of geospatial data. Indicates one of the available
  /// providers:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code>
  /// </li>
  /// <li>
  /// <code>Here</code>
  /// </li>
  /// </ul>
  /// For additional details on data providers, see the <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers page</a>.
  final String dataSource;

  /// The optional description for the place index resource.
  final String description;

  /// The name of the place index resource.
  final String indexName;

  /// The pricing plan for the specified place index resource.
  ///
  /// For additional details and restrictions on each pricing plan option, see the
  /// <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// pricing page</a>.
  final PricingPlan pricingPlan;

  /// The timestamp for when the place index resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  ListPlaceIndexesResponseEntry({
    required this.createTime,
    required this.dataSource,
    required this.description,
    required this.indexName,
    required this.pricingPlan,
    required this.updateTime,
  });

  factory ListPlaceIndexesResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListPlaceIndexesResponseEntry(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      dataSource: json['DataSource'] as String,
      description: json['Description'] as String,
      indexName: json['IndexName'] as String,
      pricingPlan: (json['PricingPlan'] as String).toPricingPlan(),
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final description = this.description;
    final indexName = this.indexName;
    final pricingPlan = this.pricingPlan;
    final updateTime = this.updateTime;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'Description': description,
      'IndexName': indexName,
      'PricingPlan': pricingPlan.toValue(),
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

class ListRouteCalculatorsResponse {
  /// Lists the route calculator resources that exist in your AWS account
  final List<ListRouteCalculatorsResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a subsequent request to fetch the next set of results.
  final String? nextToken;

  ListRouteCalculatorsResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListRouteCalculatorsResponse.fromJson(Map<String, dynamic> json) {
    return ListRouteCalculatorsResponse(
      entries: (json['Entries'] as List)
          .whereNotNull()
          .map((e) => ListRouteCalculatorsResponseEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A route calculator resource listed in your AWS account.
class ListRouteCalculatorsResponseEntry {
  /// The name of the route calculator resource.
  final String calculatorName;

  /// The timestamp when the route calculator resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>2020–07-2T12:15:20.000Z+01:00</code>
  /// </li>
  /// </ul>
  final DateTime createTime;

  /// The data provider of traffic and road network data. Indicates one of the
  /// available providers:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code>
  /// </li>
  /// <li>
  /// <code>Here</code>
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The optional description of the route calculator resource.
  final String description;

  /// The pricing plan for the specified route calculator resource.
  ///
  /// For additional details and restrictions on each pricing plan option, see <a
  /// href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// pricing</a>.
  final PricingPlan pricingPlan;

  /// The timestamp when the route calculator resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>2020–07-2T12:15:20.000Z+01:00</code>
  /// </li>
  /// </ul>
  final DateTime updateTime;

  ListRouteCalculatorsResponseEntry({
    required this.calculatorName,
    required this.createTime,
    required this.dataSource,
    required this.description,
    required this.pricingPlan,
    required this.updateTime,
  });

  factory ListRouteCalculatorsResponseEntry.fromJson(
      Map<String, dynamic> json) {
    return ListRouteCalculatorsResponseEntry(
      calculatorName: json['CalculatorName'] as String,
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      dataSource: json['DataSource'] as String,
      description: json['Description'] as String,
      pricingPlan: (json['PricingPlan'] as String).toPricingPlan(),
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final calculatorName = this.calculatorName;
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final description = this.description;
    final pricingPlan = this.pricingPlan;
    final updateTime = this.updateTime;
    return {
      'CalculatorName': calculatorName,
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'Description': description,
      'PricingPlan': pricingPlan.toValue(),
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

class ListTagsForResourceResponse {
  /// The mapping from tag key to tag value for each tag associated with the
  /// specified resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListTrackerConsumersResponse {
  /// Contains the list of geofence collection ARNs associated to the tracker
  /// resource.
  final List<String> consumerArns;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  ListTrackerConsumersResponse({
    required this.consumerArns,
    this.nextToken,
  });

  factory ListTrackerConsumersResponse.fromJson(Map<String, dynamic> json) {
    return ListTrackerConsumersResponse(
      consumerArns: (json['ConsumerArns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final consumerArns = this.consumerArns;
    final nextToken = this.nextToken;
    return {
      'ConsumerArns': consumerArns,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTrackersResponse {
  /// Contains tracker resources in your AWS account. Details include tracker
  /// name, description and timestamps for when the tracker was created and last
  /// updated.
  final List<ListTrackersResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  ListTrackersResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListTrackersResponse.fromJson(Map<String, dynamic> json) {
    return ListTrackersResponse(
      entries: (json['Entries'] as List)
          .whereNotNull()
          .map((e) =>
              ListTrackersResponseEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Contains the tracker resource details.
class ListTrackersResponseEntry {
  /// The timestamp for when the tracker resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The description for the tracker resource.
  final String description;

  /// The pricing plan for the specified tracker resource.
  ///
  /// For additional details and restrictions on each pricing plan option, see the
  /// <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// pricing page</a>.
  final PricingPlan pricingPlan;

  /// The name of the tracker resource.
  final String trackerName;

  /// The timestamp at which the device's position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// The specified data provider for the tracker resource.
  final String? pricingPlanDataSource;

  ListTrackersResponseEntry({
    required this.createTime,
    required this.description,
    required this.pricingPlan,
    required this.trackerName,
    required this.updateTime,
    this.pricingPlanDataSource,
  });

  factory ListTrackersResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListTrackersResponseEntry(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      description: json['Description'] as String,
      pricingPlan: (json['PricingPlan'] as String).toPricingPlan(),
      trackerName: json['TrackerName'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      pricingPlanDataSource: json['PricingPlanDataSource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final description = this.description;
    final pricingPlan = this.pricingPlan;
    final trackerName = this.trackerName;
    final updateTime = this.updateTime;
    final pricingPlanDataSource = this.pricingPlanDataSource;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'Description': description,
      'PricingPlan': pricingPlan.toValue(),
      'TrackerName': trackerName,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
    };
  }
}

/// Specifies the map tile style selected from an available provider.
class MapConfiguration {
  /// Specifies the map style selected from an available data provider.
  ///
  /// Valid styles: <code>RasterEsriImagery</code>,
  /// <code>VectorEsriStreets</code>, <code>VectorEsriTopographic</code>,
  /// <code>VectorEsriNavigation</code>, <code>VectorEsriDarkGrayCanvas</code>,
  /// <code>VectorEsriLightGrayCanvas</code>, <code>VectorHereBerlin</code>.
  /// <note>
  /// When using HERE as your data provider, and selecting the Style
  /// <code>VectorHereBerlin</code>, you may not use HERE Maps for Asset
  /// Management. See the <a href="https://aws.amazon.com/service-terms/">AWS
  /// Service Terms</a> for Amazon Location Service.
  /// </note>
  final String style;

  MapConfiguration({
    required this.style,
  });

  factory MapConfiguration.fromJson(Map<String, dynamic> json) {
    return MapConfiguration(
      style: json['Style'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final style = this.style;
    return {
      'Style': style,
    };
  }
}

/// Contains details about addresses or points of interest that match the search
/// criteria.
class Place {
  final PlaceGeometry geometry;

  /// The numerical portion of an address, such as a building number.
  final String? addressNumber;

  /// A country/region specified using <a
  /// href="https://www.iso.org/iso-3166-country-codes.html">ISO 3166</a> 3-digit
  /// country/region code. For example, <code>CAN</code>.
  final String? country;

  /// The full name and address of the point of interest such as a city, region,
  /// or country. For example, <code>123 Any Street, Any Town, USA</code>.
  final String? label;

  /// A name for a local area, such as a city or town name. For example,
  /// <code>Toronto</code>.
  final String? municipality;

  /// The name of a community district. For example, <code>Downtown</code>.
  final String? neighborhood;

  /// A group of numbers and letters in a country-specific format, which
  /// accompanies the address for the purpose of identifying a location.
  final String? postalCode;

  /// A name for an area or geographical division, such as a province or state
  /// name. For example, <code>British Columbia</code>.
  final String? region;

  /// The name for a street or a road to identify a location. For example,
  /// <code>Main Street</code>.
  final String? street;

  /// A country, or an area that's part of a larger region . For example,
  /// <code>Metro Vancouver</code>.
  final String? subRegion;

  Place({
    required this.geometry,
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

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      geometry:
          PlaceGeometry.fromJson(json['Geometry'] as Map<String, dynamic>),
      addressNumber: json['AddressNumber'] as String?,
      country: json['Country'] as String?,
      label: json['Label'] as String?,
      municipality: json['Municipality'] as String?,
      neighborhood: json['Neighborhood'] as String?,
      postalCode: json['PostalCode'] as String?,
      region: json['Region'] as String?,
      street: json['Street'] as String?,
      subRegion: json['SubRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final geometry = this.geometry;
    final addressNumber = this.addressNumber;
    final country = this.country;
    final label = this.label;
    final municipality = this.municipality;
    final neighborhood = this.neighborhood;
    final postalCode = this.postalCode;
    final region = this.region;
    final street = this.street;
    final subRegion = this.subRegion;
    return {
      'Geometry': geometry,
      if (addressNumber != null) 'AddressNumber': addressNumber,
      if (country != null) 'Country': country,
      if (label != null) 'Label': label,
      if (municipality != null) 'Municipality': municipality,
      if (neighborhood != null) 'Neighborhood': neighborhood,
      if (postalCode != null) 'PostalCode': postalCode,
      if (region != null) 'Region': region,
      if (street != null) 'Street': street,
      if (subRegion != null) 'SubRegion': subRegion,
    };
  }
}

/// Places uses a point geometry to specify a location or a Place.
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
  final List<double>? point;

  PlaceGeometry({
    this.point,
  });

  factory PlaceGeometry.fromJson(Map<String, dynamic> json) {
    return PlaceGeometry(
      point: (json['Point'] as List?)
          ?.whereNotNull()
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final point = this.point;
    return {
      if (point != null) 'Point': point,
    };
  }
}

enum PricingPlan {
  requestBasedUsage,
  mobileAssetTracking,
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
  }
}

extension on String {
  PricingPlan toPricingPlan() {
    switch (this) {
      case 'RequestBasedUsage':
        return PricingPlan.requestBasedUsage;
      case 'MobileAssetTracking':
        return PricingPlan.mobileAssetTracking;
      case 'MobileAssetManagement':
        return PricingPlan.mobileAssetManagement;
    }
    throw Exception('$this is not known in enum PricingPlan');
  }
}

class PutGeofenceResponse {
  /// The timestamp for when the geofence was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime createTime;

  /// The geofence identifier entered in the request.
  final String geofenceId;

  /// The timestamp for when the geofence was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  PutGeofenceResponse({
    required this.createTime,
    required this.geofenceId,
    required this.updateTime,
  });

  factory PutGeofenceResponse.fromJson(Map<String, dynamic> json) {
    return PutGeofenceResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      geofenceId: json['GeofenceId'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final geofenceId = this.geofenceId;
    final updateTime = this.updateTime;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'GeofenceId': geofenceId,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

/// Specifies a single point of interest, or Place as a result of a search query
/// obtained from a dataset configured in the place index resource.
class SearchForPositionResult {
  /// Contains details about the relevant point of interest.
  final Place place;

  SearchForPositionResult({
    required this.place,
  });

  factory SearchForPositionResult.fromJson(Map<String, dynamic> json) {
    return SearchForPositionResult(
      place: Place.fromJson(json['Place'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    return {
      'Place': place,
    };
  }
}

/// Contains relevant Places returned by calling
/// <code>SearchPlaceIndexForText</code>.
class SearchForTextResult {
  /// Contains details about the relevant point of interest.
  final Place place;

  SearchForTextResult({
    required this.place,
  });

  factory SearchForTextResult.fromJson(Map<String, dynamic> json) {
    return SearchForTextResult(
      place: Place.fromJson(json['Place'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    return {
      'Place': place,
    };
  }
}

class SearchPlaceIndexForPositionResponse {
  /// Returns a list of Places closest to the specified position. Each result
  /// contains additional information about the Places returned.
  final List<SearchForPositionResult> results;

  /// Contains a summary of the request.
  final SearchPlaceIndexForPositionSummary summary;

  SearchPlaceIndexForPositionResponse({
    required this.results,
    required this.summary,
  });

  factory SearchPlaceIndexForPositionResponse.fromJson(
      Map<String, dynamic> json) {
    return SearchPlaceIndexForPositionResponse(
      results: (json['Results'] as List)
          .whereNotNull()
          .map((e) =>
              SearchForPositionResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: SearchPlaceIndexForPositionSummary.fromJson(
          json['Summary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    final summary = this.summary;
    return {
      'Results': results,
      'Summary': summary,
    };
  }
}

/// A summary of the reverse geocoding request sent using
/// <code>SearchPlaceIndexForPosition</code>.
class SearchPlaceIndexForPositionSummary {
  /// The data provider of geospatial data. Indicates one of the available
  /// providers:
  ///
  /// <ul>
  /// <li>
  /// Esri
  /// </li>
  /// <li>
  /// HERE
  /// </li>
  /// </ul>
  /// For additional details on data providers, see the <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers page</a>.
  final String dataSource;

  /// The position given in the reverse geocoding request.
  final List<double> position;

  /// An optional parameter. The maximum number of results returned per request.
  ///
  /// Default value: <code>50</code>
  final int? maxResults;

  SearchPlaceIndexForPositionSummary({
    required this.dataSource,
    required this.position,
    this.maxResults,
  });

  factory SearchPlaceIndexForPositionSummary.fromJson(
      Map<String, dynamic> json) {
    return SearchPlaceIndexForPositionSummary(
      dataSource: json['DataSource'] as String,
      position: (json['Position'] as List)
          .whereNotNull()
          .map((e) => e as double)
          .toList(),
      maxResults: json['MaxResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final position = this.position;
    final maxResults = this.maxResults;
    return {
      'DataSource': dataSource,
      'Position': position,
      if (maxResults != null) 'MaxResults': maxResults,
    };
  }
}

class SearchPlaceIndexForTextResponse {
  /// A list of Places closest to the specified position. Each result contains
  /// additional information about the specific point of interest.
  final List<SearchForTextResult> results;

  /// Contains a summary of the request. Contains the <code>BiasPosition</code>,
  /// <code>DataSource</code>, <code>FilterBBox</code>,
  /// <code>FilterCountries</code>, <code>MaxResults</code>,
  /// <code>ResultBBox</code>, and <code>Text</code>.
  final SearchPlaceIndexForTextSummary summary;

  SearchPlaceIndexForTextResponse({
    required this.results,
    required this.summary,
  });

  factory SearchPlaceIndexForTextResponse.fromJson(Map<String, dynamic> json) {
    return SearchPlaceIndexForTextResponse(
      results: (json['Results'] as List)
          .whereNotNull()
          .map((e) => SearchForTextResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: SearchPlaceIndexForTextSummary.fromJson(
          json['Summary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    final summary = this.summary;
    return {
      'Results': results,
      'Summary': summary,
    };
  }
}

/// A summary of the geocoding request sent using
/// <code>SearchPlaceIndexForText</code>.
class SearchPlaceIndexForTextSummary {
  /// The data provider of geospatial data. Indicates one of the available
  /// providers:
  ///
  /// <ul>
  /// <li>
  /// Esri
  /// </li>
  /// <li>
  /// HERE
  /// </li>
  /// </ul>
  /// For additional details on data providers, see the <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers page</a>.
  final String dataSource;

  /// The address, name, city or region to be used in the geocoding request. In
  /// free-form text format. For example, <code>Vancouver</code>.
  final String text;

  /// Contains the coordinates for the bias position entered in the geocoding
  /// request.
  final List<double>? biasPosition;

  /// Contains the coordinates for the optional bounding box coordinated entered
  /// in the geocoding request.
  final List<double>? filterBBox;

  /// Contains the country filter entered in the geocoding request.
  final List<String>? filterCountries;

  /// Contains the maximum number of results indicated for the request.
  final int? maxResults;

  /// A bounding box that contains the search results within the specified area
  /// indicated by <code>FilterBBox</code>. A subset of bounding box specified
  /// using <code>FilterBBox</code>.
  final List<double>? resultBBox;

  SearchPlaceIndexForTextSummary({
    required this.dataSource,
    required this.text,
    this.biasPosition,
    this.filterBBox,
    this.filterCountries,
    this.maxResults,
    this.resultBBox,
  });

  factory SearchPlaceIndexForTextSummary.fromJson(Map<String, dynamic> json) {
    return SearchPlaceIndexForTextSummary(
      dataSource: json['DataSource'] as String,
      text: json['Text'] as String,
      biasPosition: (json['BiasPosition'] as List?)
          ?.whereNotNull()
          .map((e) => e as double)
          .toList(),
      filterBBox: (json['FilterBBox'] as List?)
          ?.whereNotNull()
          .map((e) => e as double)
          .toList(),
      filterCountries: (json['FilterCountries'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      maxResults: json['MaxResults'] as int?,
      resultBBox: (json['ResultBBox'] as List?)
          ?.whereNotNull()
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final text = this.text;
    final biasPosition = this.biasPosition;
    final filterBBox = this.filterBBox;
    final filterCountries = this.filterCountries;
    final maxResults = this.maxResults;
    final resultBBox = this.resultBBox;
    return {
      'DataSource': dataSource,
      'Text': text,
      if (biasPosition != null) 'BiasPosition': biasPosition,
      if (filterBBox != null) 'FilterBBox': filterBBox,
      if (filterCountries != null) 'FilterCountries': filterCountries,
      if (maxResults != null) 'MaxResults': maxResults,
      if (resultBBox != null) 'ResultBBox': resultBBox,
    };
  }
}

/// Represents an element of a leg within a route. A step contains instructions
/// for how to move to the next step in the leg.
class Step {
  /// The travel distance between the step's <code>StartPosition</code> and
  /// <code>EndPosition</code>.
  final double distance;

  /// The estimated travel time, in seconds, from the step's
  /// <code>StartPosition</code> to the <code>EndPosition</code>. . The travel
  /// mode and departure time that you specify in the request determines the
  /// calculated time.
  final double durationSeconds;

  /// The end position of a step. If the position the last step in the leg, this
  /// position is the same as the end position of the leg.
  final List<double> endPosition;

  /// The starting position of a step. If the position is the first step in the
  /// leg, this position is the same as the start position of the leg.
  final List<double> startPosition;

  /// Represents the start position, or index, in a sequence of steps within the
  /// leg's line string geometry. For example, the index of the first step in a
  /// leg geometry is <code>0</code>.
  ///
  /// Included in the response for queries that set
  /// <code>IncludeLegGeometry</code> to <code>True</code>.
  final int? geometryOffset;

  Step({
    required this.distance,
    required this.durationSeconds,
    required this.endPosition,
    required this.startPosition,
    this.geometryOffset,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      distance: json['Distance'] as double,
      durationSeconds: json['DurationSeconds'] as double,
      endPosition: (json['EndPosition'] as List)
          .whereNotNull()
          .map((e) => e as double)
          .toList(),
      startPosition: (json['StartPosition'] as List)
          .whereNotNull()
          .map((e) => e as double)
          .toList(),
      geometryOffset: json['GeometryOffset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final durationSeconds = this.durationSeconds;
    final endPosition = this.endPosition;
    final startPosition = this.startPosition;
    final geometryOffset = this.geometryOffset;
    return {
      'Distance': distance,
      'DurationSeconds': durationSeconds,
      'EndPosition': endPosition,
      'StartPosition': startPosition,
      if (geometryOffset != null) 'GeometryOffset': geometryOffset,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum TravelMode {
  car,
  truck,
  walking,
}

extension on TravelMode {
  String toValue() {
    switch (this) {
      case TravelMode.car:
        return 'Car';
      case TravelMode.truck:
        return 'Truck';
      case TravelMode.walking:
        return 'Walking';
    }
  }
}

extension on String {
  TravelMode toTravelMode() {
    switch (this) {
      case 'Car':
        return TravelMode.car;
      case 'Truck':
        return TravelMode.truck;
      case 'Walking':
        return TravelMode.walking;
    }
    throw Exception('$this is not known in enum TravelMode');
  }
}

/// Contains details about the truck dimensions in the unit of measurement that
/// you specify. Used to filter out roads that can't support or allow the
/// specified dimensions for requests that specify <code>TravelMode</code> as
/// <code>Truck</code>.
class TruckDimensions {
  /// The height of the truck.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>4.5</code>.
  /// </li>
  /// </ul>
  final double? height;

  /// The length of the truck.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>15.5</code>.
  /// </li>
  /// </ul>
  final double? length;

  /// Specifies the unit of measurement for the truck dimensions.
  ///
  /// Default Value: <code>Meters</code>
  final DimensionUnit? unit;

  /// The width of the truck.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>4.5</code>.
  /// </li>
  /// </ul>
  final double? width;

  TruckDimensions({
    this.height,
    this.length,
    this.unit,
    this.width,
  });

  factory TruckDimensions.fromJson(Map<String, dynamic> json) {
    return TruckDimensions(
      height: json['Height'] as double?,
      length: json['Length'] as double?,
      unit: (json['Unit'] as String?)?.toDimensionUnit(),
      width: json['Width'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final height = this.height;
    final length = this.length;
    final unit = this.unit;
    final width = this.width;
    return {
      if (height != null) 'Height': height,
      if (length != null) 'Length': length,
      if (unit != null) 'Unit': unit.toValue(),
      if (width != null) 'Width': width,
    };
  }
}

/// Contains details about the truck's weight specifications. Used to avoid
/// roads that can't support or allow the total weight for requests that specify
/// <code>TravelMode</code> as <code>Truck</code>.
class TruckWeight {
  /// The total weight of the truck.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>3500</code>.
  /// </li>
  /// </ul>
  final double? total;

  /// The unit of measurement to use for the truck weight.
  ///
  /// Default Value: <code>Kilograms</code>
  final VehicleWeightUnit? unit;

  TruckWeight({
    this.total,
    this.unit,
  });

  factory TruckWeight.fromJson(Map<String, dynamic> json) {
    return TruckWeight(
      total: json['Total'] as double?,
      unit: (json['Unit'] as String?)?.toVehicleWeightUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final total = this.total;
    final unit = this.unit;
    return {
      if (total != null) 'Total': total,
      if (unit != null) 'Unit': unit.toValue(),
    };
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum VehicleWeightUnit {
  kilograms,
  pounds,
}

extension on VehicleWeightUnit {
  String toValue() {
    switch (this) {
      case VehicleWeightUnit.kilograms:
        return 'Kilograms';
      case VehicleWeightUnit.pounds:
        return 'Pounds';
    }
  }
}

extension on String {
  VehicleWeightUnit toVehicleWeightUnit() {
    switch (this) {
      case 'Kilograms':
        return VehicleWeightUnit.kilograms;
      case 'Pounds':
        return VehicleWeightUnit.pounds;
    }
    throw Exception('$this is not known in enum VehicleWeightUnit');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
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
