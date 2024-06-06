// ignore_for_file: deprecated_member_use_from_same_package
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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export '../../shared/shared.dart' show AwsClientCredentials;

/// "Suite of geospatial services including Maps, Places, Routes, Tracking, and
/// Geofencing"
class Location {
  final _s.RestJsonProtocol _protocol;
  Location({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Creates an association between a geofence collection and a tracker
  /// resource. This allows the tracker resource to communicate location data to
  /// the linked geofence collection.
  ///
  /// You can associate up to five geofence collections to each tracker
  /// resource.
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [consumerArn] :
  /// The Amazon Resource Name (ARN) for the geofence collection to be
  /// associated to tracker resource. Used when you need to specify a resource
  /// across all Amazon Web Services.
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
  /// geofence collection.
  ///
  /// This operation always returns an empty response because geofences are
  /// asynchronously evaluated. The evaluation determines if the device has
  /// entered or exited a geofenced area, and then publishes one of the
  /// following events to Amazon EventBridge:
  ///
  /// <ul>
  /// <li>
  /// <code>ENTER</code> if Amazon Location determines that the tracked device
  /// has entered a geofenced area.
  /// </li>
  /// <li>
  /// <code>EXIT</code> if Amazon Location determines that the tracked device
  /// has exited a geofenced area.
  /// </li>
  /// </ul> <note>
  /// The last geofence that a device was observed within is tracked for 30 days
  /// after the most recent device position update.
  /// </note> <note>
  /// Geofence evaluation uses the given device position. It does not account
  /// for the optional <code>Accuracy</code> of a
  /// <code>DevicePositionUpdate</code>.
  /// </note> <note>
  /// The <code>DeviceID</code> is used as a string to represent the device. You
  /// do not need to have a <code>Tracker</code> associated with the
  /// <code>DeviceID</code>.
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

  /// Lists the latest device positions for requested devices.
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

  /// Uploads position update data for one or more devices to a tracker resource
  /// (up to 10 devices per batch). Amazon Location uses the data when it
  /// reports the last known device position and position history. Amazon
  /// Location retains location data for 30 days.
  /// <note>
  /// Position updates are handled based on the <code>PositionFiltering</code>
  /// property of the tracker. When <code>PositionFiltering</code> is set to
  /// <code>TimeBased</code>, updates are evaluated against linked geofence
  /// collections, and location data is stored at a maximum of one position per
  /// 30 second interval. If your update frequency is more often than every 30
  /// seconds, only one update per 30 seconds is stored for each unique device
  /// ID.
  ///
  /// When <code>PositionFiltering</code> is set to <code>DistanceBased</code>
  /// filtering, location data is stored and evaluated against linked geofence
  /// collections only if the device has moved more than 30 m (98.4 ft).
  ///
  /// When <code>PositionFiltering</code> is set to <code>AccuracyBased</code>
  /// filtering, location data is stored and evaluated against linked geofence
  /// collections only if the device has moved more than the measured accuracy.
  /// For example, if two consecutive updates from a device have a horizontal
  /// accuracy of 5 m and 10 m, the second update is neither stored or evaluated
  /// if the device has moved less than 15 m. If <code>PositionFiltering</code>
  /// is set to <code>AccuracyBased</code> filtering, Amazon Location uses the
  /// default value <code>{ "Horizontal": 0}</code> when accuracy is not
  /// provided on a <code>DevicePositionUpdate</code>.
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
  /// Contains the position update details for each device, up to 10 devices.
  Future<BatchUpdateDevicePositionResponse> batchUpdateDevicePosition({
    required String trackerName,
    required List<DevicePositionUpdate> updates,
  }) async {
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
  /// <code>DeparturePosition</code> and <code>DestinationPosition</code>.
  /// Requires that you first <a
  /// href="https://docs.aws.amazon.com/location-routes/latest/APIReference/API_CreateRouteCalculator.html">create
  /// a route calculator resource</a>.
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
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/departure-time.html">Specifying
  /// a departure time</a> using either <code>DepartureTime</code> or
  /// <code>DepartNow</code>. This calculates a route based on predictive
  /// traffic data at the given time.
  /// <note>
  /// You can't specify both <code>DepartureTime</code> and
  /// <code>DepartNow</code> in a single request. Specifying both parameters
  /// returns a validation error.
  /// </note> </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/travel-mode.html">Specifying
  /// a travel mode</a> using TravelMode sets the transportation mode used to
  /// calculate the routes. This also lets you specify additional route
  /// preferences in <code>CarModeOptions</code> if traveling by
  /// <code>Car</code>, or <code>TruckModeOptions</code> if traveling by
  /// <code>Truck</code>.
  /// <note>
  /// If you specify <code>walking</code> for the travel mode and your data
  /// provider is Esri, the start and destination must be within 40km.
  /// </note> </li>
  /// </ul>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [calculatorName] :
  /// The name of the route calculator resource that you want to use to
  /// calculate the route.
  ///
  /// Parameter [departurePosition] :
  /// The start position for the route. Defined in <a
  /// href="https://earth-info.nga.mil/index.php?dir=wgs84&amp;action=wgs84">World
  /// Geodetic System (WGS 84)</a> format: <code>[longitude, latitude]</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>[-123.115, 49.285]</code>
  /// </li>
  /// </ul> <note>
  /// If you specify a departure that's not located on a road, Amazon Location
  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html">moves
  /// the position to the nearest road</a>. If Esri is the provider for your
  /// route calculator, specifying a route that is longer than 400 km returns a
  /// <code>400 RoutesValidationException</code> error.
  /// </note>
  /// Valid Values: <code>[-180 to 180,-90 to 90]</code>
  ///
  /// Parameter [destinationPosition] :
  /// The finish position for the route. Defined in <a
  /// href="https://earth-info.nga.mil/index.php?dir=wgs84&amp;action=wgs84">World
  /// Geodetic System (WGS 84)</a> format: <code>[longitude, latitude]</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>[-122.339, 47.615]</code>
  /// </li>
  /// </ul> <note>
  /// If you specify a destination that's not located on a road, Amazon Location
  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html">moves
  /// the position to the nearest road</a>.
  /// </note>
  /// Valid Values: <code>[-180 to 180,-90 to 90]</code>
  ///
  /// Parameter [arrivalTime] :
  /// Specifies the desired time of arrival. Uses the given time to calculate
  /// the route. Otherwise, the best time of day to travel with the best traffic
  /// conditions is used to calculate the route.
  /// <note>
  /// ArrivalTime is not supported Esri.
  /// </note>
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
  /// the route. Otherwise, the best time of day to travel with the best traffic
  /// conditions is used to calculate the route.
  ///
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
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  ///
  /// Parameter [optimizeFor] :
  /// Specifies the distance to optimize for when calculating a route.
  ///
  /// Parameter [travelMode] :
  /// Specifies the mode of transport when calculating a route. Used in
  /// estimating the speed of travel and road compatibility. You can choose
  /// <code>Car</code>, <code>Truck</code>, <code>Walking</code>,
  /// <code>Bicycle</code> or <code>Motorcycle</code> as options for the
  /// <code>TravelMode</code>.
  /// <note>
  /// <code>Bicycle</code> and <code>Motorcycle</code> are only valid when using
  /// Grab as a data provider, and only within Southeast Asia.
  ///
  /// <code>Truck</code> is not available for Grab.
  ///
  /// For more details on the using Grab for routing, including areas of
  /// coverage, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html">GrabMaps</a>
  /// in the <i>Amazon Location Service Developer Guide</i>.
  /// </note>
  /// The <code>TravelMode</code> you specify also determines how you specify
  /// route preferences:
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
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html">moves
  /// the position to the nearest road</a>.
  ///
  /// Specifying more than 23 waypoints returns a <code>400
  /// ValidationException</code> error.
  ///
  /// If Esri is the provider for your route calculator, specifying a route that
  /// is longer than 400 km returns a <code>400 RoutesValidationException</code>
  /// error.
  /// </note>
  /// Valid Values: <code>[-180 to 180,-90 to 90]</code>
  Future<CalculateRouteResponse> calculateRoute({
    required String calculatorName,
    required List<double> departurePosition,
    required List<double> destinationPosition,
    DateTime? arrivalTime,
    CalculateRouteCarModeOptions? carModeOptions,
    bool? departNow,
    DateTime? departureTime,
    DistanceUnit? distanceUnit,
    bool? includeLegGeometry,
    String? key,
    OptimizationMode? optimizeFor,
    TravelMode? travelMode,
    CalculateRouteTruckModeOptions? truckModeOptions,
    List<List<double>>? waypointPositions,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'DeparturePosition': departurePosition,
      'DestinationPosition': destinationPosition,
      if (arrivalTime != null) 'ArrivalTime': iso8601ToJson(arrivalTime),
      if (carModeOptions != null) 'CarModeOptions': carModeOptions,
      if (departNow != null) 'DepartNow': departNow,
      if (departureTime != null) 'DepartureTime': iso8601ToJson(departureTime),
      if (distanceUnit != null) 'DistanceUnit': distanceUnit.toValue(),
      if (includeLegGeometry != null) 'IncludeLegGeometry': includeLegGeometry,
      if (optimizeFor != null) 'OptimizeFor': optimizeFor.toValue(),
      if (travelMode != null) 'TravelMode': travelMode.toValue(),
      if (truckModeOptions != null) 'TruckModeOptions': truckModeOptions,
      if (waypointPositions != null) 'WaypointPositions': waypointPositions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/routes/v0/calculators/${Uri.encodeComponent(calculatorName)}/calculate/route',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CalculateRouteResponse.fromJson(response);
  }

  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route-matrix.html">
  /// Calculates a route matrix</a> given the following required parameters:
  /// <code>DeparturePositions</code> and <code>DestinationPositions</code>.
  /// <code>CalculateRouteMatrix</code> calculates routes and returns the travel
  /// time and travel distance from each departure position to each destination
  /// position in the request. For example, given departure positions A and B,
  /// and destination positions X and Y, <code>CalculateRouteMatrix</code> will
  /// return time and distance for routes from A to X, A to Y, B to X, and B to
  /// Y (in that order). The number of results returned (and routes calculated)
  /// will be the number of <code>DeparturePositions</code> times the number of
  /// <code>DestinationPositions</code>.
  /// <note>
  /// Your account is charged for each route calculated, not the number of
  /// requests.
  /// </note>
  /// Requires that you first <a
  /// href="https://docs.aws.amazon.com/location-routes/latest/APIReference/API_CreateRouteCalculator.html">create
  /// a route calculator resource</a>.
  ///
  /// By default, a request that doesn't specify a departure time uses the best
  /// time of day to travel with the best traffic conditions when calculating
  /// routes.
  ///
  /// Additional options include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/departure-time.html">
  /// Specifying a departure time</a> using either <code>DepartureTime</code> or
  /// <code>DepartNow</code>. This calculates routes based on predictive traffic
  /// data at the given time.
  /// <note>
  /// You can't specify both <code>DepartureTime</code> and
  /// <code>DepartNow</code> in a single request. Specifying both parameters
  /// returns a validation error.
  /// </note> </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/travel-mode.html">Specifying
  /// a travel mode</a> using TravelMode sets the transportation mode used to
  /// calculate the routes. This also lets you specify additional route
  /// preferences in <code>CarModeOptions</code> if traveling by
  /// <code>Car</code>, or <code>TruckModeOptions</code> if traveling by
  /// <code>Truck</code>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [calculatorName] :
  /// The name of the route calculator resource that you want to use to
  /// calculate the route matrix.
  ///
  /// Parameter [departurePositions] :
  /// The list of departure (origin) positions for the route matrix. An array of
  /// points, each of which is itself a 2-value array defined in <a
  /// href="https://earth-info.nga.mil/GandG/wgs84/index.html">WGS 84</a>
  /// format: <code>[longitude, latitude]</code>. For example, <code>[-123.115,
  /// 49.285]</code>.
  /// <important>
  /// Depending on the data provider selected in the route calculator resource
  /// there may be additional restrictions on the inputs you can choose. See <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route-matrix.html#matrix-routing-position-limits">
  /// Position restrictions</a> in the <i>Amazon Location Service Developer
  /// Guide</i>.
  /// </important> <note>
  /// For route calculators that use Esri as the data provider, if you specify a
  /// departure that's not located on a road, Amazon Location <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html">
  /// moves the position to the nearest road</a>. The snapped value is available
  /// in the result in <code>SnappedDeparturePositions</code>.
  /// </note>
  /// Valid Values: <code>[-180 to 180,-90 to 90]</code>
  ///
  /// Parameter [destinationPositions] :
  /// The list of destination positions for the route matrix. An array of
  /// points, each of which is itself a 2-value array defined in <a
  /// href="https://earth-info.nga.mil/GandG/wgs84/index.html">WGS 84</a>
  /// format: <code>[longitude, latitude]</code>. For example, <code>[-122.339,
  /// 47.615]</code>
  /// <important>
  /// Depending on the data provider selected in the route calculator resource
  /// there may be additional restrictions on the inputs you can choose. See <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route-matrix.html#matrix-routing-position-limits">
  /// Position restrictions</a> in the <i>Amazon Location Service Developer
  /// Guide</i>.
  /// </important> <note>
  /// For route calculators that use Esri as the data provider, if you specify a
  /// destination that's not located on a road, Amazon Location <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html">
  /// moves the position to the nearest road</a>. The snapped value is available
  /// in the result in <code>SnappedDestinationPositions</code>.
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
  /// calculate the route matrix. You can't set both <code>DepartureTime</code>
  /// and <code>DepartNow</code>. If neither is set, the best time of day to
  /// travel with the best traffic conditions is used to calculate the route
  /// matrix.
  ///
  /// Default Value: <code>false</code>
  ///
  /// Valid Values: <code>false</code> | <code>true</code>
  ///
  /// Parameter [departureTime] :
  /// Specifies the desired time of departure. Uses the given time to calculate
  /// the route matrix. You can't set both <code>DepartureTime</code> and
  /// <code>DepartNow</code>. If neither is set, the best time of day to travel
  /// with the best traffic conditions is used to calculate the route matrix.
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
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  ///
  /// Parameter [travelMode] :
  /// Specifies the mode of transport when calculating a route. Used in
  /// estimating the speed of travel and road compatibility.
  ///
  /// The <code>TravelMode</code> you specify also determines how you specify
  /// route preferences:
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
  /// </ul> <note>
  /// <code>Bicycle</code> or <code>Motorcycle</code> are only valid when using
  /// <code>Grab</code> as a data provider, and only within Southeast Asia.
  ///
  /// <code>Truck</code> is not available for Grab.
  ///
  /// For more information about using Grab as a data provider, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html">GrabMaps</a>
  /// in the <i>Amazon Location Service Developer Guide</i>.
  /// </note>
  /// Default Value: <code>Car</code>
  ///
  /// Parameter [truckModeOptions] :
  /// Specifies route preferences when traveling by <code>Truck</code>, such as
  /// avoiding routes that use ferries or tolls, and truck specifications to
  /// consider when choosing an optimal road.
  ///
  /// Requirements: <code>TravelMode</code> must be specified as
  /// <code>Truck</code>.
  Future<CalculateRouteMatrixResponse> calculateRouteMatrix({
    required String calculatorName,
    required List<List<double>> departurePositions,
    required List<List<double>> destinationPositions,
    CalculateRouteCarModeOptions? carModeOptions,
    bool? departNow,
    DateTime? departureTime,
    DistanceUnit? distanceUnit,
    String? key,
    TravelMode? travelMode,
    CalculateRouteTruckModeOptions? truckModeOptions,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'DeparturePositions': departurePositions,
      'DestinationPositions': destinationPositions,
      if (carModeOptions != null) 'CarModeOptions': carModeOptions,
      if (departNow != null) 'DepartNow': departNow,
      if (departureTime != null) 'DepartureTime': iso8601ToJson(departureTime),
      if (distanceUnit != null) 'DistanceUnit': distanceUnit.toValue(),
      if (travelMode != null) 'TravelMode': travelMode.toValue(),
      if (truckModeOptions != null) 'TruckModeOptions': truckModeOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/routes/v0/calculators/${Uri.encodeComponent(calculatorName)}/calculate/route-matrix',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CalculateRouteMatrixResponse.fromJson(response);
  }

  /// Creates a geofence collection, which manages and stores geofences.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
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
  /// Parameter [description] :
  /// An optional description for the geofence collection.
  ///
  /// Parameter [kmsKeyId] :
  /// A key identifier for an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon
  /// Web Services KMS customer managed key</a>. Enter a key ID, key ARN, alias
  /// name, or alias ARN.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  ///
  /// Parameter [pricingPlanDataSource] :
  /// This parameter is no longer used.
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
  /// <li>
  /// Cannot use "aws:" as a prefix for a key.
  /// </li>
  /// </ul>
  Future<CreateGeofenceCollectionResponse> createGeofenceCollection({
    required String collectionName,
    String? description,
    String? kmsKeyId,
    PricingPlan? pricingPlan,
    String? pricingPlanDataSource,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'CollectionName': collectionName,
      if (description != null) 'Description': description,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
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

  /// Creates an API key resource in your Amazon Web Services account, which
  /// lets you grant actions for Amazon Location resources to the API key
  /// bearer.
  /// <note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">Using
  /// API keys</a>.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [keyName] :
  /// A custom name for the API key resource.
  ///
  /// Requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only alphanumeric characters (A–Z, a–z, 0–9), hyphens (-), periods
  /// (.), and underscores (_).
  /// </li>
  /// <li>
  /// Must be a unique API key name.
  /// </li>
  /// <li>
  /// No spaces allowed. For example, <code>ExampleAPIKey</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [restrictions] :
  /// The API key restrictions for the API key resource.
  ///
  /// Parameter [description] :
  /// An optional description for the API key resource.
  ///
  /// Parameter [expireTime] :
  /// The optional timestamp for when the API key resource will expire in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. One of
  /// <code>NoExpiry</code> or <code>ExpireTime</code> must be set.
  ///
  /// Parameter [noExpiry] :
  /// Optionally set to <code>true</code> to set no expiration time for the API
  /// key. One of <code>NoExpiry</code> or <code>ExpireTime</code> must be set.
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to the map resource. A tag is a key-value pair
  /// that helps manage, identify, search, and filter your resources by
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
  /// <li>
  /// Cannot use "aws:" as a prefix for a key.
  /// </li>
  /// </ul>
  Future<CreateKeyResponse> createKey({
    required String keyName,
    required ApiKeyRestrictions restrictions,
    String? description,
    DateTime? expireTime,
    bool? noExpiry,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'KeyName': keyName,
      'Restrictions': restrictions,
      if (description != null) 'Description': description,
      if (expireTime != null) 'ExpireTime': iso8601ToJson(expireTime),
      if (noExpiry != null) 'NoExpiry': noExpiry,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/metadata/v0/keys',
      exceptionFnMap: _exceptionFns,
    );
    return CreateKeyResponse.fromJson(response);
  }

  /// Creates a map resource in your Amazon Web Services account, which provides
  /// map tiles of different styles sourced from global location data providers.
  /// <note>
  /// If your application is tracking or routing assets you use in your
  /// business, such as delivery vehicles or employees, you must not use Esri as
  /// your geolocation provider. See section 82 of the <a
  /// href="http://aws.amazon.com/service-terms">Amazon Web Services service
  /// terms</a> for more details.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [configuration] :
  /// Specifies the <code>MapConfiguration</code>, including the map style, for
  /// the map resource that you create. The map style defines the look of maps
  /// and the data provider for your map resource.
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
  /// Parameter [description] :
  /// An optional description for the map resource.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
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
  /// <li>
  /// Cannot use "aws:" as a prefix for a key.
  /// </li>
  /// </ul>
  Future<CreateMapResponse> createMap({
    required MapConfiguration configuration,
    required String mapName,
    String? description,
    PricingPlan? pricingPlan,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Configuration': configuration,
      'MapName': mapName,
      if (description != null) 'Description': description,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
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

  /// Creates a place index resource in your Amazon Web Services account. Use a
  /// place index resource to geocode addresses and other text queries by using
  /// the <code>SearchPlaceIndexForText</code> operation, and reverse geocode
  /// coordinates by using the <code>SearchPlaceIndexForPosition</code>
  /// operation, and enable autosuggestions by using the
  /// <code>SearchPlaceIndexForSuggestions</code> operation.
  /// <note>
  /// If your application is tracking or routing assets you use in your
  /// business, such as delivery vehicles or employees, you must not use Esri as
  /// your geolocation provider. See section 82 of the <a
  /// href="http://aws.amazon.com/service-terms">Amazon Web Services service
  /// terms</a> for more details.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [dataSource] :
  /// Specifies the geospatial data provider for the new place index.
  /// <note>
  /// This field is case-sensitive. Enter the valid values as shown. For
  /// example, entering <code>HERE</code> returns an error.
  /// </note>
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code> – For additional information about <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/esri.html">Esri</a>'s
  /// coverage in your region of interest, see <a
  /// href="https://developers.arcgis.com/rest/geocode/api-reference/geocode-coverage.htm">Esri
  /// details on geocoding coverage</a>.
  /// </li>
  /// <li>
  /// <code>Grab</code> – Grab provides place index functionality for Southeast
  /// Asia. For additional information about <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html">GrabMaps</a>'
  /// coverage, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html#grab-coverage-area">GrabMaps
  /// countries and areas covered</a>.
  /// </li>
  /// <li>
  /// <code>Here</code> – For additional information about <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/HERE.html">HERE
  /// Technologies</a>' coverage in your region of interest, see <a
  /// href="https://developer.here.com/documentation/geocoder/dev_guide/topics/coverage-geocoder.html">HERE
  /// details on goecoding coverage</a>.
  /// <important>
  /// If you specify HERE Technologies (<code>Here</code>) as the data provider,
  /// you may not <a
  /// href="https://docs.aws.amazon.com/location-places/latest/APIReference/API_DataSourceConfiguration.html">store
  /// results</a> for locations in Japan. For more information, see the <a
  /// href="http://aws.amazon.com/service-terms/">Amazon Web Services Service
  /// Terms</a> for Amazon Location Service.
  /// </important> </li>
  /// </ul>
  /// For additional information , see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Data
  /// providers</a> on the <i>Amazon Location Service Developer Guide</i>.
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
  /// Parameter [dataSourceConfiguration] :
  /// Specifies the data storage option requesting Places.
  ///
  /// Parameter [description] :
  /// The optional description for the place index resource.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to the place index resource. A tag is a key-value
  /// pair that helps you manage, identify, search, and filter your resources.
  ///
  /// Format: <code>"key" : "value"</code>
  ///
  /// Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Maximum 50 tags per resource.
  /// </li>
  /// <li>
  /// Each tag key must be unique and must have exactly one associated value.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9), and the following
  /// characters: + - = . _ : / @
  /// </li>
  /// <li>
  /// Cannot use "aws:" as a prefix for a key.
  /// </li>
  /// </ul>
  Future<CreatePlaceIndexResponse> createPlaceIndex({
    required String dataSource,
    required String indexName,
    DataSourceConfiguration? dataSourceConfiguration,
    String? description,
    PricingPlan? pricingPlan,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'DataSource': dataSource,
      'IndexName': indexName,
      if (dataSourceConfiguration != null)
        'DataSourceConfiguration': dataSourceConfiguration,
      if (description != null) 'Description': description,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
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

  /// Creates a route calculator resource in your Amazon Web Services account.
  ///
  /// You can send requests to a route calculator resource to estimate travel
  /// time, distance, and get directions. A route calculator sources traffic and
  /// road network data from your chosen data provider.
  /// <note>
  /// If your application is tracking or routing assets you use in your
  /// business, such as delivery vehicles or employees, you must not use Esri as
  /// your geolocation provider. See section 82 of the <a
  /// href="http://aws.amazon.com/service-terms">Amazon Web Services service
  /// terms</a> for more details.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
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
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code> – For additional information about <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/esri.html">Esri</a>'s
  /// coverage in your region of interest, see <a
  /// href="https://doc.arcgis.com/en/arcgis-online/reference/network-coverage.htm">Esri
  /// details on street networks and traffic coverage</a>.
  ///
  /// Route calculators that use Esri as a data source only calculate routes
  /// that are shorter than 400 km.
  /// </li>
  /// <li>
  /// <code>Grab</code> – Grab provides routing functionality for Southeast
  /// Asia. For additional information about <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html">GrabMaps</a>'
  /// coverage, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html#grab-coverage-area">GrabMaps
  /// countries and areas covered</a>.
  /// </li>
  /// <li>
  /// <code>Here</code> – For additional information about <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/HERE.html">HERE
  /// Technologies</a>' coverage in your region of interest, see <a
  /// href="https://developer.here.com/documentation/routing-api/dev_guide/topics/coverage/car-routing.html">HERE
  /// car routing coverage</a> and <a
  /// href="https://developer.here.com/documentation/routing-api/dev_guide/topics/coverage/truck-routing.html">HERE
  /// truck routing coverage</a>.
  /// </li>
  /// </ul>
  /// For additional information , see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Data
  /// providers</a> on the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// Parameter [description] :
  /// The optional description for the route calculator resource.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
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
  /// <li>
  /// Cannot use "aws:" as a prefix for a key.
  /// </li>
  /// </ul>
  Future<CreateRouteCalculatorResponse> createRouteCalculator({
    required String calculatorName,
    required String dataSource,
    String? description,
    PricingPlan? pricingPlan,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'CalculatorName': calculatorName,
      'DataSource': dataSource,
      if (description != null) 'Description': description,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
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

  /// Creates a tracker resource in your Amazon Web Services account, which lets
  /// you retrieve current and historical location of devices.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
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
  /// Parameter [eventBridgeEnabled] :
  /// Whether to enable position <code>UPDATE</code> events from this tracker to
  /// be sent to EventBridge.
  /// <note>
  /// You do not need enable this feature to get <code>ENTER</code> and
  /// <code>EXIT</code> events for geofences with this tracker. Those events are
  /// always sent to EventBridge.
  /// </note>
  ///
  /// Parameter [kmsKeyEnableGeospatialQueries] :
  /// Enables <code>GeospatialQueries</code> for a tracker that uses a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon
  /// Web Services KMS customer managed key</a>.
  ///
  /// This parameter is only used if you are using a KMS customer managed key.
  /// <note>
  /// If you wish to encrypt your data using your own KMS customer managed key,
  /// then the Bounding Polygon Queries feature will be disabled by default.
  /// This is because by using this feature, a representation of your device
  /// positions will not be encrypted using the your KMS managed key. The exact
  /// device position, however; is still encrypted using your managed key.
  ///
  /// You can choose to opt-in to the Bounding Polygon Quseries feature. This is
  /// done by setting the <code>KmsKeyEnableGeospatialQueries</code> parameter
  /// to true when creating or updating a Tracker.
  /// </note>
  ///
  /// Parameter [kmsKeyId] :
  /// A key identifier for an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon
  /// Web Services KMS customer managed key</a>. Enter a key ID, key ARN, alias
  /// name, or alias ARN.
  ///
  /// Parameter [positionFiltering] :
  /// Specifies the position filtering for the tracker resource.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>TimeBased</code> - Location updates are evaluated against linked
  /// geofence collections, but not every location update is stored. If your
  /// update frequency is more often than 30 seconds, only one update per 30
  /// seconds is stored for each unique device ID.
  /// </li>
  /// <li>
  /// <code>DistanceBased</code> - If the device has moved less than 30 m (98.4
  /// ft), location updates are ignored. Location updates within this area are
  /// neither evaluated against linked geofence collections, nor stored. This
  /// helps control costs by reducing the number of geofence evaluations and
  /// historical device positions to paginate through. Distance-based filtering
  /// can also reduce the effects of GPS noise when displaying device
  /// trajectories on a map.
  /// </li>
  /// <li>
  /// <code>AccuracyBased</code> - If the device has moved less than the
  /// measured accuracy, location updates are ignored. For example, if two
  /// consecutive updates from a device have a horizontal accuracy of 5 m and 10
  /// m, the second update is ignored if the device has moved less than 15 m.
  /// Ignored location updates are neither evaluated against linked geofence
  /// collections, nor stored. This can reduce the effects of GPS noise when
  /// displaying device trajectories on a map, and can help control your costs
  /// by reducing the number of geofence evaluations.
  /// </li>
  /// </ul>
  /// This field is optional. If not specified, the default value is
  /// <code>TimeBased</code>.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  ///
  /// Parameter [pricingPlanDataSource] :
  /// This parameter is no longer used.
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
  /// <li>
  /// Cannot use "aws:" as a prefix for a key.
  /// </li>
  /// </ul>
  Future<CreateTrackerResponse> createTracker({
    required String trackerName,
    String? description,
    bool? eventBridgeEnabled,
    bool? kmsKeyEnableGeospatialQueries,
    String? kmsKeyId,
    PositionFiltering? positionFiltering,
    PricingPlan? pricingPlan,
    String? pricingPlanDataSource,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'TrackerName': trackerName,
      if (description != null) 'Description': description,
      if (eventBridgeEnabled != null) 'EventBridgeEnabled': eventBridgeEnabled,
      if (kmsKeyEnableGeospatialQueries != null)
        'KmsKeyEnableGeospatialQueries': kmsKeyEnableGeospatialQueries,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (positionFiltering != null)
        'PositionFiltering': positionFiltering.toValue(),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
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

  /// Deletes a geofence collection from your Amazon Web Services account.
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified API key. The API key must have been deactivated more
  /// than 90 days previously.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [keyName] :
  /// The name of the API key to delete.
  ///
  /// Parameter [forceDelete] :
  /// ForceDelete bypasses an API key's expiry conditions and deletes the key.
  /// Set the parameter <code>true</code> to delete the key or to
  /// <code>false</code> to not preemptively delete the API key.
  ///
  /// Valid values: <code>true</code>, or <code>false</code>.
  ///
  /// Required: No
  /// <note>
  /// This action is irreversible. Only use ForceDelete if you are certain the
  /// key is no longer in use.
  /// </note>
  Future<void> deleteKey({
    required String keyName,
    bool? forceDelete,
  }) async {
    final $query = <String, List<String>>{
      if (forceDelete != null) 'forceDelete': [forceDelete.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/metadata/v0/keys/${Uri.encodeComponent(keyName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a map resource from your Amazon Web Services account.
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/maps/v0/maps/${Uri.encodeComponent(mapName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a place index resource from your Amazon Web Services account.
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/places/v0/indexes/${Uri.encodeComponent(indexName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a route calculator resource from your Amazon Web Services account.
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/routes/v0/calculators/${Uri.encodeComponent(calculatorName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a tracker resource from your Amazon Web Services account.
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeGeofenceCollectionResponse.fromJson(response);
  }

  /// Retrieves the API key resource details.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [keyName] :
  /// The name of the API key resource.
  Future<DescribeKeyResponse> describeKey({
    required String keyName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/metadata/v0/keys/${Uri.encodeComponent(keyName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeKeyResponse.fromJson(response);
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
  /// resource across all Amazon Web Services.
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
  /// Parameter [maxResults] :
  /// An optional limit for the number of device positions returned in a single
  /// call.
  ///
  /// Default value: <code>100</code>
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
    int? maxResults,
    String? nextToken,
    DateTime? startTimeInclusive,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (endTimeExclusive != null)
        'EndTimeExclusive': iso8601ToJson(endTimeExclusive),
      if (maxResults != null) 'MaxResults': maxResults,
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
  /// preference. For example, <code>Noto Sans Regular, Arial Unicode</code>.
  ///
  /// Valid font stacks for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/esri.html">Esri</a>
  /// styles:
  ///
  /// <ul>
  /// <li>
  /// VectorEsriDarkGrayCanvas – <code>Ubuntu Medium Italic</code> |
  /// <code>Ubuntu Medium</code> | <code>Ubuntu Italic</code> | <code>Ubuntu
  /// Regular</code> | <code>Ubuntu Bold</code>
  /// </li>
  /// <li>
  /// VectorEsriLightGrayCanvas – <code>Ubuntu Italic</code> | <code>Ubuntu
  /// Regular</code> | <code>Ubuntu Light</code> | <code>Ubuntu Bold</code>
  /// </li>
  /// <li>
  /// VectorEsriTopographic – <code>Noto Sans Italic</code> | <code>Noto Sans
  /// Regular</code> | <code>Noto Sans Bold</code> | <code>Noto Serif
  /// Regular</code> | <code>Roboto Condensed Light Italic</code>
  /// </li>
  /// <li>
  /// VectorEsriStreets – <code>Arial Regular</code> | <code>Arial Italic</code>
  /// | <code>Arial Bold</code>
  /// </li>
  /// <li>
  /// VectorEsriNavigation – <code>Arial Regular</code> | <code>Arial
  /// Italic</code> | <code>Arial Bold</code> | <code>Arial Unicode MS
  /// Bold</code> | <code>Arial Unicode MS Regular</code>
  /// </li>
  /// </ul>
  /// Valid font stacks for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/HERE.html">HERE
  /// Technologies</a> styles:
  ///
  /// <ul>
  /// <li>
  /// VectorHereContrast – <code>Fira GO Regular</code> | <code>Fira GO
  /// Bold</code>
  /// </li>
  /// <li>
  /// VectorHereExplore, VectorHereExploreTruck, HybridHereExploreSatellite –
  /// <code>Fira GO Italic</code> | <code>Fira GO Map</code> | <code>Fira GO Map
  /// Bold</code> | <code>Noto Sans CJK JP Bold</code> | <code>Noto Sans CJK JP
  /// Light</code> | <code>Noto Sans CJK JP Regular</code>
  /// </li>
  /// </ul>
  /// Valid font stacks for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html">GrabMaps</a>
  /// styles:
  ///
  /// <ul>
  /// <li>
  /// VectorGrabStandardLight, VectorGrabStandardDark – <code>Noto Sans
  /// Regular</code> | <code>Noto Sans Medium</code> | <code>Noto Sans
  /// Bold</code>
  /// </li>
  /// </ul>
  /// Valid font stacks for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/open-data.html">Open
  /// Data</a> styles:
  ///
  /// <ul>
  /// <li>
  /// VectorOpenDataStandardLight, VectorOpenDataStandardDark,
  /// VectorOpenDataVisualizationLight, VectorOpenDataVisualizationDark –
  /// <code>Amazon Ember Regular,Noto Sans Regular</code> | <code>Amazon Ember
  /// Bold,Noto Sans Bold</code> | <code>Amazon Ember Medium,Noto Sans
  /// Medium</code> | <code>Amazon Ember Regular Italic,Noto Sans Italic</code>
  /// | <code>Amazon Ember Condensed RC Regular,Noto Sans Regular</code> |
  /// <code>Amazon Ember Condensed RC Bold,Noto Sans Bold</code> | <code>Amazon
  /// Ember Regular,Noto Sans Regular,Noto Sans Arabic Regular</code> |
  /// <code>Amazon Ember Condensed RC Bold,Noto Sans Bold,Noto Sans Arabic
  /// Condensed Bold</code> | <code>Amazon Ember Bold,Noto Sans Bold,Noto Sans
  /// Arabic Bold</code> | <code>Amazon Ember Regular Italic,Noto Sans
  /// Italic,Noto Sans Arabic Regular</code> | <code>Amazon Ember Condensed RC
  /// Regular,Noto Sans Regular,Noto Sans Arabic Condensed Regular</code> |
  /// <code>Amazon Ember Medium,Noto Sans Medium,Noto Sans Arabic Medium</code>
  /// </li>
  /// </ul> <note>
  /// The fonts used by the Open Data map styles are combined fonts that use
  /// <code>Amazon Ember</code> for most glyphs but <code>Noto Sans</code> for
  /// glyphs unsupported by <code>Amazon Ember</code>.
  /// </note>
  ///
  /// Parameter [fontUnicodeRange] :
  /// A Unicode range of characters to download glyphs for. Each response will
  /// contain 256 characters. For example, 0–255 includes all characters from
  /// range <code>U+0000</code> to <code>00FF</code>. Must be aligned to
  /// multiples of 256.
  ///
  /// Parameter [mapName] :
  /// The map resource associated with the glyph ﬁle.
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  Future<GetMapGlyphsResponse> getMapGlyphs({
    required String fontStack,
    required String fontUnicodeRange,
    required String mapName,
    String? key,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/maps/v0/maps/${Uri.encodeComponent(mapName)}/glyphs/${Uri.encodeComponent(fontStack)}/${Uri.encodeComponent(fontUnicodeRange)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetMapGlyphsResponse(
      blob: await response.stream.toBytes(),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
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
  /// For the JSON document containing image offsets. Use the following ﬁle
  /// names:
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
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  Future<GetMapSpritesResponse> getMapSprites({
    required String fileName,
    required String mapName,
    String? key,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/maps/v0/maps/${Uri.encodeComponent(mapName)}/sprites/${Uri.encodeComponent(fileName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetMapSpritesResponse(
      blob: await response.stream.toBytes(),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
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
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  Future<GetMapStyleDescriptorResponse> getMapStyleDescriptor({
    required String mapName,
    String? key,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/maps/v0/maps/${Uri.encodeComponent(mapName)}/style-descriptor',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetMapStyleDescriptorResponse(
      blob: await response.stream.toBytes(),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
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
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  Future<GetMapTileResponse> getMapTile({
    required String mapName,
    required String x,
    required String y,
    required String z,
    String? key,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/maps/v0/maps/${Uri.encodeComponent(mapName)}/tiles/${Uri.encodeComponent(z)}/${Uri.encodeComponent(x)}/${Uri.encodeComponent(y)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetMapTileResponse(
      blob: await response.stream.toBytes(),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// Finds a place by its unique ID. A <code>PlaceId</code> is returned by
  /// other search operations.
  /// <note>
  /// A PlaceId is valid only if all of the following are the same in the
  /// original search request and the call to <code>GetPlace</code>.
  ///
  /// <ul>
  /// <li>
  /// Customer Amazon Web Services account
  /// </li>
  /// <li>
  /// Amazon Web Services Region
  /// </li>
  /// <li>
  /// Data provider specified in the place index resource
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [indexName] :
  /// The name of the place index resource that you want to use for the search.
  ///
  /// Parameter [placeId] :
  /// The identifier of the place to find.
  ///
  /// While you can use PlaceID in subsequent requests, PlaceID is not intended
  /// to be a permanent identifier and the ID can change between consecutive API
  /// calls. Please see the following PlaceID behaviour for each data provider:
  ///
  /// <ul>
  /// <li>
  /// Esri: Place IDs will change every quarter at a minimum. The typical time
  /// period for these changes would be March, June, September, and December.
  /// Place IDs might also change between the typical quarterly change but that
  /// will be much less frequent.
  /// </li>
  /// <li>
  /// HERE: We recommend that you cache data for no longer than a week to keep
  /// your data data fresh. You can assume that less than 1% ID shifts will
  /// release over release which is approximately 1 - 2 times per week.
  /// </li>
  /// <li>
  /// Grab: Place IDs can expire or become invalid in the following situations.
  ///
  /// <ul>
  /// <li>
  /// Data operations: The POI may be removed from Grab POI database by Grab Map
  /// Ops based on the ground-truth, such as being closed in the real world,
  /// being detected as a duplicate POI, or having incorrect information. Grab
  /// will synchronize data to the Waypoint environment on weekly basis.
  /// </li>
  /// <li>
  /// Interpolated POI: Interpolated POI is a temporary POI generated in real
  /// time when serving a request, and it will be marked as derived in the
  /// <code>place.result_type</code> field in the response. The information of
  /// interpolated POIs will be retained for at least 30 days, which means that
  /// within 30 days, you are able to obtain POI details by Place ID from Place
  /// Details API. After 30 days, the interpolated POIs(both Place ID and
  /// details) may expire and inaccessible from the Places Details API.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  ///
  /// Parameter [language] :
  /// The preferred language used to return results. The value must be a valid
  /// <a href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for
  /// example, <code>en</code> for English.
  ///
  /// This setting affects the languages used in the results, but not the
  /// results themselves. If no language is specified, or not supported for a
  /// particular result, the partner automatically chooses a language for the
  /// result.
  ///
  /// For an example, we'll use the Greek language. You search for a location
  /// around Athens, Greece, with the <code>language</code> parameter set to
  /// <code>en</code>. The <code>city</code> in the results will most likely be
  /// returned as <code>Athens</code>.
  ///
  /// If you set the <code>language</code> parameter to <code>el</code>, for
  /// Greek, then the <code>city</code> in the results will more likely be
  /// returned as <code>Αθήνα</code>.
  ///
  /// If the data provider does not have a value for Greek, the result will be
  /// in a language that the provider does support.
  Future<GetPlaceResponse> getPlace({
    required String indexName,
    required String placeId,
    String? key,
    String? language,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
      if (language != null) 'language': [language],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/places/v0/indexes/${Uri.encodeComponent(indexName)}/places/${Uri.encodeComponent(placeId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPlaceResponse.fromJson(response);
  }

  /// A batch request to retrieve all device positions.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [trackerName] :
  /// The tracker resource containing the requested devices.
  ///
  /// Parameter [filterGeometry] :
  /// The geometry used to filter device positions.
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
    TrackingFilterGeometry? filterGeometry,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filterGeometry != null) 'FilterGeometry': filterGeometry,
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

  /// Lists geofence collections in your Amazon Web Services account.
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
  /// Parameter [maxResults] :
  /// An optional limit for the number of geofences returned in a single call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListGeofencesResponse> listGeofences({
    required String collectionName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
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

  /// Lists API key resources in your Amazon Web Services account.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filter] :
  /// Optionally filter the list to only <code>Active</code> or
  /// <code>Expired</code> API keys.
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
  Future<ListKeysResponse> listKeys({
    ApiKeyFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filter != null) 'Filter': filter,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/metadata/v0/list-keys',
      exceptionFnMap: _exceptionFns,
    );
    return ListKeysResponse.fromJson(response);
  }

  /// Lists map resources in your Amazon Web Services account.
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

  /// Lists place index resources in your Amazon Web Services account.
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

  /// Lists route calculator resources in your Amazon Web Services account.
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

  /// Returns a list of tags that are applied to the specified Amazon Location
  /// resource.
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
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:resourcetype/ExampleResource</code>
  /// </li>
  /// </ul>
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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

  /// Lists tracker resources in your Amazon Web Services account.
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
  /// Contains the details to specify the position of the geofence. Can be
  /// either a polygon or a circle. Including both will return a validation
  /// error.
  /// <note>
  /// Each <a
  /// href="https://docs.aws.amazon.com/location-geofences/latest/APIReference/API_GeofenceGeometry.html">
  /// geofence polygon</a> can have a maximum of 1,000 vertices.
  /// </note>
  ///
  /// Parameter [geofenceProperties] :
  /// Associates one of more properties with the geofence. A property is a
  /// key-value pair stored with the geofence and added to any geofence event
  /// triggered with that geofence.
  ///
  /// Format: <code>"key" : "value"</code>
  Future<PutGeofenceResponse> putGeofence({
    required String collectionName,
    required String geofenceId,
    required GeofenceGeometry geometry,
    Map<String, String>? geofenceProperties,
  }) async {
    final $payload = <String, dynamic>{
      'Geometry': geometry,
      if (geofenceProperties != null) 'GeofenceProperties': geofenceProperties,
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
  /// Specifies the longitude and latitude of the position to query.
  ///
  /// This parameter must contain a pair of numbers. The first number represents
  /// the X coordinate, or longitude; the second number represents the Y
  /// coordinate, or latitude.
  ///
  /// For example, <code>[-123.1174, 49.2847]</code> represents a position with
  /// longitude <code>-123.1174</code> and latitude <code>49.2847</code>.
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  ///
  /// Parameter [language] :
  /// The preferred language used to return results. The value must be a valid
  /// <a href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for
  /// example, <code>en</code> for English.
  ///
  /// This setting affects the languages used in the results, but not the
  /// results themselves. If no language is specified, or not supported for a
  /// particular result, the partner automatically chooses a language for the
  /// result.
  ///
  /// For an example, we'll use the Greek language. You search for a location
  /// around Athens, Greece, with the <code>language</code> parameter set to
  /// <code>en</code>. The <code>city</code> in the results will most likely be
  /// returned as <code>Athens</code>.
  ///
  /// If you set the <code>language</code> parameter to <code>el</code>, for
  /// Greek, then the <code>city</code> in the results will more likely be
  /// returned as <code>Αθήνα</code>.
  ///
  /// If the data provider does not have a value for Greek, the result will be
  /// in a language that the provider does support.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter. The maximum number of results returned per request.
  ///
  /// Default value: <code>50</code>
  Future<SearchPlaceIndexForPositionResponse> searchPlaceIndexForPosition({
    required String indexName,
    required List<double> position,
    String? key,
    String? language,
    int? maxResults,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'Position': position,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/places/v0/indexes/${Uri.encodeComponent(indexName)}/search/position',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SearchPlaceIndexForPositionResponse.fromJson(response);
  }

  /// Generates suggestions for addresses and points of interest based on
  /// partial or misspelled free-form text. This operation is also known as
  /// autocomplete, autosuggest, or fuzzy matching.
  ///
  /// Optional parameters let you narrow your search results by bounding box or
  /// country, or bias your search toward a specific position on the globe.
  /// <note>
  /// You can search for suggested place names near a specified position by
  /// using <code>BiasPosition</code>, or filter results within a bounding box
  /// by using <code>FilterBBox</code>. These parameters are mutually exclusive;
  /// using both <code>BiasPosition</code> and <code>FilterBBox</code> in the
  /// same command returns an error.
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
  /// The free-form partial text to use to generate place suggestions. For
  /// example, <code>eiffel tow</code>.
  ///
  /// Parameter [biasPosition] :
  /// An optional parameter that indicates a preference for place suggestions
  /// that are closer to a specified position.
  ///
  /// If provided, this parameter must contain a pair of numbers. The first
  /// number represents the X coordinate, or longitude; the second number
  /// represents the Y coordinate, or latitude.
  ///
  /// For example, <code>[-123.1174, 49.2847]</code> represents the position
  /// with longitude <code>-123.1174</code> and latitude <code>49.2847</code>.
  /// <note>
  /// <code>BiasPosition</code> and <code>FilterBBox</code> are mutually
  /// exclusive. Specifying both options results in an error.
  /// </note>
  ///
  /// Parameter [filterBBox] :
  /// An optional parameter that limits the search results by returning only
  /// suggestions within a specified bounding box.
  ///
  /// If provided, this parameter must contain a total of four consecutive
  /// numbers in two pairs. The first pair of numbers represents the X and Y
  /// coordinates (longitude and latitude, respectively) of the southwest corner
  /// of the bounding box; the second pair of numbers represents the X and Y
  /// coordinates (longitude and latitude, respectively) of the northeast corner
  /// of the bounding box.
  ///
  /// For example, <code>[-12.7935, -37.4835, -12.0684, -36.9542]</code>
  /// represents a bounding box where the southwest corner has longitude
  /// <code>-12.7935</code> and latitude <code>-37.4835</code>, and the
  /// northeast corner has longitude <code>-12.0684</code> and latitude
  /// <code>-36.9542</code>.
  /// <note>
  /// <code>FilterBBox</code> and <code>BiasPosition</code> are mutually
  /// exclusive. Specifying both options results in an error.
  /// </note>
  ///
  /// Parameter [filterCategories] :
  /// A list of one or more Amazon Location categories to filter the returned
  /// places. If you include more than one category, the results will include
  /// results that match <i>any</i> of the categories listed.
  ///
  /// For more information about using categories, including a list of Amazon
  /// Location categories, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/category-filtering.html">Categories
  /// and filtering</a>, in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// Parameter [filterCountries] :
  /// An optional parameter that limits the search results by returning only
  /// suggestions within the provided list of countries.
  ///
  /// <ul>
  /// <li>
  /// Use the <a href="https://www.iso.org/iso-3166-country-codes.html">ISO
  /// 3166</a> 3-digit country code. For example, Australia uses three
  /// upper-case characters: <code>AUS</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  ///
  /// Parameter [language] :
  /// The preferred language used to return results. The value must be a valid
  /// <a href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for
  /// example, <code>en</code> for English.
  ///
  /// This setting affects the languages used in the results. If no language is
  /// specified, or not supported for a particular result, the partner
  /// automatically chooses a language for the result.
  ///
  /// For an example, we'll use the Greek language. You search for <code>Athens,
  /// Gr</code> to get suggestions with the <code>language</code> parameter set
  /// to <code>en</code>. The results found will most likely be returned as
  /// <code>Athens, Greece</code>.
  ///
  /// If you set the <code>language</code> parameter to <code>el</code>, for
  /// Greek, then the result found will more likely be returned as <code>Αθήνα,
  /// Ελλάδα</code>.
  ///
  /// If the data provider does not have a value for Greek, the result will be
  /// in a language that the provider does support.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter. The maximum number of results returned per request.
  ///
  /// The default: <code>5</code>
  Future<SearchPlaceIndexForSuggestionsResponse>
      searchPlaceIndexForSuggestions({
    required String indexName,
    required String text,
    List<double>? biasPosition,
    List<double>? filterBBox,
    List<String>? filterCategories,
    List<String>? filterCountries,
    String? key,
    String? language,
    int? maxResults,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      15,
    );
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'Text': text,
      if (biasPosition != null) 'BiasPosition': biasPosition,
      if (filterBBox != null) 'FilterBBox': filterBBox,
      if (filterCategories != null) 'FilterCategories': filterCategories,
      if (filterCountries != null) 'FilterCountries': filterCountries,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/places/v0/indexes/${Uri.encodeComponent(indexName)}/search/suggestions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SearchPlaceIndexForSuggestionsResponse.fromJson(response);
  }

  /// Geocodes free-form text, such as an address, name, city, or region to
  /// allow you to search for Places or points of interest.
  ///
  /// Optional parameters let you narrow your search results by bounding box or
  /// country, or bias your search toward a specific position on the globe.
  /// <note>
  /// You can search for places near a given position using
  /// <code>BiasPosition</code>, or filter results within a bounding box using
  /// <code>FilterBBox</code>. Providing both parameters simultaneously returns
  /// an error.
  /// </note>
  /// Search results are returned in order of highest to lowest relevance.
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
  /// The address, name, city, or region to be used in the search in free-form
  /// text format. For example, <code>123 Any Street</code>.
  ///
  /// Parameter [biasPosition] :
  /// An optional parameter that indicates a preference for places that are
  /// closer to a specified position.
  ///
  /// If provided, this parameter must contain a pair of numbers. The first
  /// number represents the X coordinate, or longitude; the second number
  /// represents the Y coordinate, or latitude.
  ///
  /// For example, <code>[-123.1174, 49.2847]</code> represents the position
  /// with longitude <code>-123.1174</code> and latitude <code>49.2847</code>.
  /// <note>
  /// <code>BiasPosition</code> and <code>FilterBBox</code> are mutually
  /// exclusive. Specifying both options results in an error.
  /// </note>
  ///
  /// Parameter [filterBBox] :
  /// An optional parameter that limits the search results by returning only
  /// places that are within the provided bounding box.
  ///
  /// If provided, this parameter must contain a total of four consecutive
  /// numbers in two pairs. The first pair of numbers represents the X and Y
  /// coordinates (longitude and latitude, respectively) of the southwest corner
  /// of the bounding box; the second pair of numbers represents the X and Y
  /// coordinates (longitude and latitude, respectively) of the northeast corner
  /// of the bounding box.
  ///
  /// For example, <code>[-12.7935, -37.4835, -12.0684, -36.9542]</code>
  /// represents a bounding box where the southwest corner has longitude
  /// <code>-12.7935</code> and latitude <code>-37.4835</code>, and the
  /// northeast corner has longitude <code>-12.0684</code> and latitude
  /// <code>-36.9542</code>.
  /// <note>
  /// <code>FilterBBox</code> and <code>BiasPosition</code> are mutually
  /// exclusive. Specifying both options results in an error.
  /// </note>
  ///
  /// Parameter [filterCategories] :
  /// A list of one or more Amazon Location categories to filter the returned
  /// places. If you include more than one category, the results will include
  /// results that match <i>any</i> of the categories listed.
  ///
  /// For more information about using categories, including a list of Amazon
  /// Location categories, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/category-filtering.html">Categories
  /// and filtering</a>, in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// Parameter [filterCountries] :
  /// An optional parameter that limits the search results by returning only
  /// places that are in a specified list of countries.
  ///
  /// <ul>
  /// <li>
  /// Valid values include <a
  /// href="https://www.iso.org/iso-3166-country-codes.html">ISO 3166</a>
  /// 3-digit country codes. For example, Australia uses three upper-case
  /// characters: <code>AUS</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  ///
  /// Parameter [language] :
  /// The preferred language used to return results. The value must be a valid
  /// <a href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for
  /// example, <code>en</code> for English.
  ///
  /// This setting affects the languages used in the results, but not the
  /// results themselves. If no language is specified, or not supported for a
  /// particular result, the partner automatically chooses a language for the
  /// result.
  ///
  /// For an example, we'll use the Greek language. You search for <code>Athens,
  /// Greece</code>, with the <code>language</code> parameter set to
  /// <code>en</code>. The result found will most likely be returned as
  /// <code>Athens</code>.
  ///
  /// If you set the <code>language</code> parameter to <code>el</code>, for
  /// Greek, then the result found will more likely be returned as
  /// <code>Αθήνα</code>.
  ///
  /// If the data provider does not have a value for Greek, the result will be
  /// in a language that the provider does support.
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
    List<String>? filterCategories,
    List<String>? filterCountries,
    String? key,
    String? language,
    int? maxResults,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'Text': text,
      if (biasPosition != null) 'BiasPosition': biasPosition,
      if (filterBBox != null) 'FilterBBox': filterBBox,
      if (filterCategories != null) 'FilterCategories': filterCategories,
      if (filterCountries != null) 'FilterCountries': filterCountries,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/places/v0/indexes/${Uri.encodeComponent(indexName)}/search/text',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SearchPlaceIndexForTextResponse.fromJson(response);
  }

  /// Assigns one or more tags (key-value pairs) to the specified Amazon
  /// Location Service resource.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions, by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// You can use the <code>TagResource</code> operation with an Amazon Location
  /// Service resource that already has tags. If you specify a new tag key for
  /// the resource, this tag is appended to the tags already associated with the
  /// resource. If you specify a tag key that's already associated with the
  /// resource, the new tag value that you specify replaces the previous value
  /// for that tag.
  ///
  /// You can associate up to 50 tags with a resource.
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
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:resourcetype/ExampleResource</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to specific resource. A tag is a key-value pair
  /// that helps you manage, identify, search, and filter your resources.
  ///
  /// Format: <code>"key" : "value"</code>
  ///
  /// Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Maximum 50 tags per resource.
  /// </li>
  /// <li>
  /// Each tag key must be unique and must have exactly one associated value.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9), and the following
  /// characters: + - = . _ : / @
  /// </li>
  /// <li>
  /// Cannot use "aws:" as a prefix for a key.
  /// </li>
  /// </ul>
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
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

  /// Removes one or more tags from the specified Amazon Location resource.
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
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:resourcetype/ExampleResource</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the specified resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
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

  /// Updates the specified properties of a given geofence collection.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionName] :
  /// The name of the geofence collection to update.
  ///
  /// Parameter [description] :
  /// Updates the description for the geofence collection.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  ///
  /// Parameter [pricingPlanDataSource] :
  /// This parameter is no longer used.
  Future<UpdateGeofenceCollectionResponse> updateGeofenceCollection({
    required String collectionName,
    String? description,
    PricingPlan? pricingPlan,
    String? pricingPlanDataSource,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGeofenceCollectionResponse.fromJson(response);
  }

  /// Updates the specified properties of a given API key resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [keyName] :
  /// The name of the API key resource to update.
  ///
  /// Parameter [description] :
  /// Updates the description for the API key resource.
  ///
  /// Parameter [expireTime] :
  /// Updates the timestamp for when the API key resource will expire in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  ///
  /// Parameter [forceUpdate] :
  /// The boolean flag to be included for updating <code>ExpireTime</code> or
  /// <code>Restrictions</code> details.
  ///
  /// Must be set to <code>true</code> to update an API key resource that has
  /// been used in the past 7 days.
  ///
  /// <code>False</code> if force update is not preferred
  ///
  /// Default value: <code>False</code>
  ///
  /// Parameter [noExpiry] :
  /// Whether the API key should expire. Set to <code>true</code> to set the API
  /// key to have no expiration time.
  ///
  /// Parameter [restrictions] :
  /// Updates the API key restrictions for the API key resource.
  Future<UpdateKeyResponse> updateKey({
    required String keyName,
    String? description,
    DateTime? expireTime,
    bool? forceUpdate,
    bool? noExpiry,
    ApiKeyRestrictions? restrictions,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (expireTime != null) 'ExpireTime': iso8601ToJson(expireTime),
      if (forceUpdate != null) 'ForceUpdate': forceUpdate,
      if (noExpiry != null) 'NoExpiry': noExpiry,
      if (restrictions != null) 'Restrictions': restrictions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/metadata/v0/keys/${Uri.encodeComponent(keyName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateKeyResponse.fromJson(response);
  }

  /// Updates the specified properties of a given map resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [mapName] :
  /// The name of the map resource to update.
  ///
  /// Parameter [configurationUpdate] :
  /// Updates the parts of the map configuration that can be updated, including
  /// the political view.
  ///
  /// Parameter [description] :
  /// Updates the description for the map resource.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  Future<UpdateMapResponse> updateMap({
    required String mapName,
    MapConfigurationUpdate? configurationUpdate,
    String? description,
    PricingPlan? pricingPlan,
  }) async {
    final $payload = <String, dynamic>{
      if (configurationUpdate != null)
        'ConfigurationUpdate': configurationUpdate,
      if (description != null) 'Description': description,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/maps/v0/maps/${Uri.encodeComponent(mapName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMapResponse.fromJson(response);
  }

  /// Updates the specified properties of a given place index resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [indexName] :
  /// The name of the place index resource to update.
  ///
  /// Parameter [dataSourceConfiguration] :
  /// Updates the data storage option for the place index resource.
  ///
  /// Parameter [description] :
  /// Updates the description for the place index resource.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  Future<UpdatePlaceIndexResponse> updatePlaceIndex({
    required String indexName,
    DataSourceConfiguration? dataSourceConfiguration,
    String? description,
    PricingPlan? pricingPlan,
  }) async {
    final $payload = <String, dynamic>{
      if (dataSourceConfiguration != null)
        'DataSourceConfiguration': dataSourceConfiguration,
      if (description != null) 'Description': description,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/places/v0/indexes/${Uri.encodeComponent(indexName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePlaceIndexResponse.fromJson(response);
  }

  /// Updates the specified properties for a given route calculator resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [calculatorName] :
  /// The name of the route calculator resource to update.
  ///
  /// Parameter [description] :
  /// Updates the description for the route calculator resource.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  Future<UpdateRouteCalculatorResponse> updateRouteCalculator({
    required String calculatorName,
    String? description,
    PricingPlan? pricingPlan,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/routes/v0/calculators/${Uri.encodeComponent(calculatorName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRouteCalculatorResponse.fromJson(response);
  }

  /// Updates the specified properties of a given tracker resource.
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
  /// Parameter [description] :
  /// Updates the description for the tracker resource.
  ///
  /// Parameter [eventBridgeEnabled] :
  /// Whether to enable position <code>UPDATE</code> events from this tracker to
  /// be sent to EventBridge.
  /// <note>
  /// You do not need enable this feature to get <code>ENTER</code> and
  /// <code>EXIT</code> events for geofences with this tracker. Those events are
  /// always sent to EventBridge.
  /// </note>
  ///
  /// Parameter [kmsKeyEnableGeospatialQueries] :
  /// Enables <code>GeospatialQueries</code> for a tracker that uses a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon
  /// Web Services KMS customer managed key</a>.
  ///
  /// This parameter is only used if you are using a KMS customer managed key.
  ///
  /// Parameter [positionFiltering] :
  /// Updates the position filtering for the tracker resource.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>TimeBased</code> - Location updates are evaluated against linked
  /// geofence collections, but not every location update is stored. If your
  /// update frequency is more often than 30 seconds, only one update per 30
  /// seconds is stored for each unique device ID.
  /// </li>
  /// <li>
  /// <code>DistanceBased</code> - If the device has moved less than 30 m (98.4
  /// ft), location updates are ignored. Location updates within this distance
  /// are neither evaluated against linked geofence collections, nor stored.
  /// This helps control costs by reducing the number of geofence evaluations
  /// and historical device positions to paginate through. Distance-based
  /// filtering can also reduce the effects of GPS noise when displaying device
  /// trajectories on a map.
  /// </li>
  /// <li>
  /// <code>AccuracyBased</code> - If the device has moved less than the
  /// measured accuracy, location updates are ignored. For example, if two
  /// consecutive updates from a device have a horizontal accuracy of 5 m and 10
  /// m, the second update is ignored if the device has moved less than 15 m.
  /// Ignored location updates are neither evaluated against linked geofence
  /// collections, nor stored. This helps educe the effects of GPS noise when
  /// displaying device trajectories on a map, and can help control costs by
  /// reducing the number of geofence evaluations.
  /// </li>
  /// </ul>
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  ///
  /// Parameter [pricingPlanDataSource] :
  /// This parameter is no longer used.
  Future<UpdateTrackerResponse> updateTracker({
    required String trackerName,
    String? description,
    bool? eventBridgeEnabled,
    bool? kmsKeyEnableGeospatialQueries,
    PositionFiltering? positionFiltering,
    PricingPlan? pricingPlan,
    String? pricingPlanDataSource,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (eventBridgeEnabled != null) 'EventBridgeEnabled': eventBridgeEnabled,
      if (kmsKeyEnableGeospatialQueries != null)
        'KmsKeyEnableGeospatialQueries': kmsKeyEnableGeospatialQueries,
      if (positionFiltering != null)
        'PositionFiltering': positionFiltering.toValue(),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTrackerResponse.fromJson(response);
  }
}

/// Options for filtering API keys.
class ApiKeyFilter {
  /// Filter on <code>Active</code> or <code>Expired</code> API keys.
  final Status? keyStatus;

  ApiKeyFilter({
    this.keyStatus,
  });

  Map<String, dynamic> toJson() {
    final keyStatus = this.keyStatus;
    return {
      if (keyStatus != null) 'KeyStatus': keyStatus.toValue(),
    };
  }
}

/// API Restrictions on the allowed actions, resources, and referers for an API
/// key resource.
class ApiKeyRestrictions {
  /// A list of allowed actions that an API key resource grants permissions to
  /// perform. You must have at least one action for each type of resource. For
  /// example, if you have a place resource, you must include at least one place
  /// action.
  ///
  /// The following are valid values for the actions.
  ///
  /// <ul>
  /// <li>
  /// <b>Map actions</b>
  ///
  /// <ul>
  /// <li>
  /// <code>geo:GetMap*</code> - Allows all actions needed for map rendering.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Place actions</b>
  ///
  /// <ul>
  /// <li>
  /// <code>geo:SearchPlaceIndexForText</code> - Allows geocoding.
  /// </li>
  /// <li>
  /// <code>geo:SearchPlaceIndexForPosition</code> - Allows reverse geocoding.
  /// </li>
  /// <li>
  /// <code>geo:SearchPlaceIndexForSuggestions</code> - Allows generating
  /// suggestions from text.
  /// </li>
  /// <li>
  /// <code>GetPlace</code> - Allows finding a place by place ID.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Route actions</b>
  ///
  /// <ul>
  /// <li>
  /// <code>geo:CalculateRoute</code> - Allows point to point routing.
  /// </li>
  /// <li>
  /// <code>geo:CalculateRouteMatrix</code> - Allows calculating a matrix of
  /// routes.
  /// </li>
  /// </ul> </li>
  /// </ul> <note>
  /// You must use these strings exactly. For example, to provide access to map
  /// rendering, the only valid action is <code>geo:GetMap*</code> as an input to
  /// the list. <code>["geo:GetMap*"]</code> is valid but
  /// <code>["geo:GetMapTile"]</code> is not. Similarly, you cannot use
  /// <code>["geo:SearchPlaceIndexFor*"]</code> - you must list each of the Place
  /// actions separately.
  /// </note>
  final List<String> allowActions;

  /// A list of allowed resource ARNs that a API key bearer can perform actions
  /// on.
  ///
  /// <ul>
  /// <li>
  /// The ARN must be the correct ARN for a map, place, or route ARN. You may
  /// include wildcards in the resource-id to match multiple resources of the same
  /// type.
  /// </li>
  /// <li>
  /// The resources must be in the same <code>partition</code>,
  /// <code>region</code>, and <code>account-id</code> as the key that is being
  /// created.
  /// </li>
  /// <li>
  /// Other than wildcards, you must include the full ARN, including the
  /// <code>arn</code>, <code>partition</code>, <code>service</code>,
  /// <code>region</code>, <code>account-id</code> and <code>resource-id</code>
  /// delimited by colons (:).
  /// </li>
  /// <li>
  /// No spaces allowed, even with wildcards. For example,
  /// <code>arn:aws:geo:region:<i>account-id</i>:map/ExampleMap*</code>.
  /// </li>
  /// </ul>
  /// For more information about ARN format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a>.
  final List<String> allowResources;

  /// An optional list of allowed HTTP referers for which requests must originate
  /// from. Requests using this API key from other domains will not be allowed.
  ///
  /// Requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only alphanumeric characters (A–Z, a–z, 0–9) or any symbols in this
  /// list <code>$\-._+!*`(),;/?:@=&amp;</code>
  /// </li>
  /// <li>
  /// May contain a percent (%) if followed by 2 hexadecimal digits (A-F, a-f,
  /// 0-9); this is used for URL encoding purposes.
  /// </li>
  /// <li>
  /// May contain wildcard characters question mark (?) and asterisk (*).
  ///
  /// Question mark (?) will replace any single character (including hexadecimal
  /// digits).
  ///
  /// Asterisk (*) will replace any multiple characters (including multiple
  /// hexadecimal digits).
  /// </li>
  /// <li>
  /// No spaces allowed. For example, <code>https://example.com</code>.
  /// </li>
  /// </ul>
  final List<String>? allowReferers;

  ApiKeyRestrictions({
    required this.allowActions,
    required this.allowResources,
    this.allowReferers,
  });

  factory ApiKeyRestrictions.fromJson(Map<String, dynamic> json) {
    return ApiKeyRestrictions(
      allowActions: (json['AllowActions'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      allowResources: (json['AllowResources'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      allowReferers: (json['AllowReferers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowActions = this.allowActions;
    final allowResources = this.allowResources;
    final allowReferers = this.allowReferers;
    return {
      'AllowActions': allowActions,
      'AllowResources': allowResources,
      if (allowReferers != null) 'AllowReferers': allowReferers,
    };
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

extension BatchItemErrorCodeValueExtension on BatchItemErrorCode {
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

extension BatchItemErrorCodeFromString on String {
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

  /// Contains the details of the position of the geofence. Can be either a
  /// polygon or a circle. Including both will return a validation error.
  /// <note>
  /// Each <a
  /// href="https://docs.aws.amazon.com/location-geofences/latest/APIReference/API_GeofenceGeometry.html">
  /// geofence polygon</a> can have a maximum of 1,000 vertices.
  /// </note>
  final GeofenceGeometry geometry;

  /// Associates one of more properties with the geofence. A property is a
  /// key-value pair stored with the geofence and added to any geofence event
  /// triggered with that geofence.
  ///
  /// Format: <code>"key" : "value"</code>
  final Map<String, String>? geofenceProperties;

  BatchPutGeofenceRequestEntry({
    required this.geofenceId,
    required this.geometry,
    this.geofenceProperties,
  });

  Map<String, dynamic> toJson() {
    final geofenceId = this.geofenceId;
    final geometry = this.geometry;
    final geofenceProperties = this.geofenceProperties;
    return {
      'GeofenceId': geofenceId,
      'Geometry': geometry,
      if (geofenceProperties != null) 'GeofenceProperties': geofenceProperties,
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

  Map<String, dynamic> toJson() {
    final avoidFerries = this.avoidFerries;
    final avoidTolls = this.avoidTolls;
    return {
      if (avoidFerries != null) 'AvoidFerries': avoidFerries,
      if (avoidTolls != null) 'AvoidTolls': avoidTolls,
    };
  }
}

/// Returns the result of the route matrix calculation.
class CalculateRouteMatrixResponse {
  /// The calculated route matrix containing the results for all pairs of
  /// <code>DeparturePositions</code> to <code>DestinationPositions</code>. Each
  /// row corresponds to one entry in <code>DeparturePositions</code>. Each entry
  /// in the row corresponds to the route from that entry in
  /// <code>DeparturePositions</code> to an entry in
  /// <code>DestinationPositions</code>.
  final List<List<RouteMatrixEntry>> routeMatrix;

  /// Contains information about the route matrix, <code>DataSource</code>,
  /// <code>DistanceUnit</code>, <code>RouteCount</code> and
  /// <code>ErrorCount</code>.
  final CalculateRouteMatrixSummary summary;

  /// For routes calculated using an Esri route calculator resource, departure
  /// positions are snapped to the closest road. For Esri route calculator
  /// resources, this returns the list of departure/origin positions used for
  /// calculation of the <code>RouteMatrix</code>.
  final List<List<double>>? snappedDeparturePositions;

  /// The list of destination positions for the route matrix used for calculation
  /// of the <code>RouteMatrix</code>.
  final List<List<double>>? snappedDestinationPositions;

  CalculateRouteMatrixResponse({
    required this.routeMatrix,
    required this.summary,
    this.snappedDeparturePositions,
    this.snappedDestinationPositions,
  });

  factory CalculateRouteMatrixResponse.fromJson(Map<String, dynamic> json) {
    return CalculateRouteMatrixResponse(
      routeMatrix: (json['RouteMatrix'] as List)
          .whereNotNull()
          .map((e) => (e as List)
              .whereNotNull()
              .map((e) => RouteMatrixEntry.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      summary: CalculateRouteMatrixSummary.fromJson(
          json['Summary'] as Map<String, dynamic>),
      snappedDeparturePositions: (json['SnappedDeparturePositions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              (e as List).whereNotNull().map((e) => e as double).toList())
          .toList(),
      snappedDestinationPositions:
          (json['SnappedDestinationPositions'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  (e as List).whereNotNull().map((e) => e as double).toList())
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final routeMatrix = this.routeMatrix;
    final summary = this.summary;
    final snappedDeparturePositions = this.snappedDeparturePositions;
    final snappedDestinationPositions = this.snappedDestinationPositions;
    return {
      'RouteMatrix': routeMatrix,
      'Summary': summary,
      if (snappedDeparturePositions != null)
        'SnappedDeparturePositions': snappedDeparturePositions,
      if (snappedDestinationPositions != null)
        'SnappedDestinationPositions': snappedDestinationPositions,
    };
  }
}

/// A summary of the calculated route matrix.
class CalculateRouteMatrixSummary {
  /// The data provider of traffic and road network data used to calculate the
  /// routes. Indicates one of the available providers:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code>
  /// </li>
  /// <li>
  /// <code>Grab</code>
  /// </li>
  /// <li>
  /// <code>Here</code>
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The unit of measurement for route distances.
  final DistanceUnit distanceUnit;

  /// The count of error results in the route matrix. If this number is 0, all
  /// routes were calculated successfully.
  final int errorCount;

  /// The count of cells in the route matrix. Equal to the number of
  /// <code>DeparturePositions</code> multiplied by the number of
  /// <code>DestinationPositions</code>.
  final int routeCount;

  CalculateRouteMatrixSummary({
    required this.dataSource,
    required this.distanceUnit,
    required this.errorCount,
    required this.routeCount,
  });

  factory CalculateRouteMatrixSummary.fromJson(Map<String, dynamic> json) {
    return CalculateRouteMatrixSummary(
      dataSource: json['DataSource'] as String,
      distanceUnit: (json['DistanceUnit'] as String).toDistanceUnit(),
      errorCount: json['ErrorCount'] as int,
      routeCount: json['RouteCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final distanceUnit = this.distanceUnit;
    final errorCount = this.errorCount;
    final routeCount = this.routeCount;
    return {
      'DataSource': dataSource,
      'DistanceUnit': distanceUnit.toValue(),
      'ErrorCount': errorCount,
      'RouteCount': routeCount,
    };
  }
}

/// Returns the result of the route calculation. Metadata includes legs and
/// route summary.
class CalculateRouteResponse {
  /// Contains details about each path between a pair of positions included along
  /// a route such as: <code>StartPosition</code>, <code>EndPosition</code>,
  /// <code>Distance</code>, <code>DurationSeconds</code>, <code>Geometry</code>,
  /// and <code>Steps</code>. The number of legs returned corresponds to one fewer
  /// than the total number of positions in the request.
  ///
  /// For example, a route with a departure position and destination position
  /// returns one leg with the positions <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html">snapped
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
  /// returns two legs with the positions snapped to a nearby road:
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
  /// and <code>DurationSeconds</code>.
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
  /// <code>Grab</code>
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
  /// If Esri is the data source for the route calculator, the route distance
  /// can’t be greater than 400 km. If the route exceeds 400 km, the response is a
  /// <code>400 RoutesValidationException</code> error.
  /// </note>
  final double distance;

  /// The unit of measurement for route distances.
  final DistanceUnit distanceUnit;

  /// The total travel time for the route measured in seconds. The sum of the
  /// travel time between every stop on the route.
  final double durationSeconds;

  /// Specifies a geographical box surrounding a route. Used to zoom into a route
  /// when displaying it in a map. For example, <code>[min x, min y, max x, max
  /// y]</code>.
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
  /// The fourth <code>bbox</code> position is the Y coordinate, or latitude of
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

  /// Avoids tolls when calculating routes.
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

/// A circle on the earth, as defined by a center point and a radius.
class Circle {
  /// A single point geometry, specifying the center of the circle, using <a
  /// href="https://gisgeography.com/wgs84-world-geodetic-system/">WGS 84</a>
  /// coordinates, in the form <code>[longitude, latitude]</code>.
  final List<double> center;

  /// The radius of the circle in meters. Must be greater than zero and no larger
  /// than 100,000 (100 kilometers).
  final double radius;

  Circle({
    required this.center,
    required this.radius,
  });

  factory Circle.fromJson(Map<String, dynamic> json) {
    return Circle(
      center: (json['Center'] as List)
          .whereNotNull()
          .map((e) => e as double)
          .toList(),
      radius: json['Radius'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final center = this.center;
    final radius = this.radius;
    return {
      'Center': center,
      'Radius': radius,
    };
  }
}

class CreateGeofenceCollectionResponse {
  /// The Amazon Resource Name (ARN) for the geofence collection resource. Used
  /// when you need to specify a resource across all Amazon Web Services.
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

class CreateKeyResponse {
  /// The timestamp for when the API key resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The key value/string of an API key. This value is used when making API calls
  /// to authorize the call. For example, see <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_GetMapGlyphs.html">GetMapGlyphs</a>.
  final String key;

  /// The Amazon Resource Name (ARN) for the API key resource. Used when you need
  /// to specify a resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:key/ExampleKey</code>
  /// </li>
  /// </ul>
  final String keyArn;

  /// The name of the API key resource.
  final String keyName;

  CreateKeyResponse({
    required this.createTime,
    required this.key,
    required this.keyArn,
    required this.keyName,
  });

  factory CreateKeyResponse.fromJson(Map<String, dynamic> json) {
    return CreateKeyResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      key: json['Key'] as String,
      keyArn: json['KeyArn'] as String,
      keyName: json['KeyName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final key = this.key;
    final keyArn = this.keyArn;
    final keyName = this.keyName;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'Key': key,
      'KeyArn': keyArn,
      'KeyName': keyName,
    };
  }
}

class CreateMapResponse {
  /// The timestamp for when the map resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The Amazon Resource Name (ARN) for the map resource. Used to specify a
  /// resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:map/ExampleMap</code>
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
  /// a resource across Amazon Web Services.
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
  /// ARN when you specify a resource across all Amazon Web Services.
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
  /// to specify a resource across all Amazon Web Services.
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
/// <important>
/// When using Amazon Location Places:
///
/// <ul>
/// <li>
/// If using HERE Technologies as a data provider, you can't store results for
/// locations in Japan by setting <code>IntendedUse</code> to
/// <code>Storage</code>. parameter.
/// </li>
/// <li>
/// Under the <code>MobileAssetTracking</code> or
/// <code>MobilAssetManagement</code> pricing plan, you can't store results from
/// your place index resources by setting <code>IntendedUse</code> to
/// <code>Storage</code>. This returns a validation exception error.
/// </li>
/// </ul>
/// For more information, see the <a
/// href="https://aws.amazon.com/service-terms/">AWS Service Terms</a> for
/// Amazon Location Service.
/// </important>
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

class DeleteKeyResponse {
  DeleteKeyResponse();

  factory DeleteKeyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteKeyResponse();
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
  /// when you need to specify a resource across all Amazon Web Services.
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

  /// The timestamp for when the geofence collection was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  /// The number of geofences in the geofence collection.
  final int? geofenceCount;

  /// A key identifier for an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon
  /// Web Services KMS customer managed key</a> assigned to the Amazon Location
  /// resource
  final String? kmsKeyId;

  /// No longer used. Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  /// No longer used. Always returns an empty string.
  final String? pricingPlanDataSource;

  /// Displays the key, value pairs of tags associated with this resource.
  final Map<String, String>? tags;

  DescribeGeofenceCollectionResponse({
    required this.collectionArn,
    required this.collectionName,
    required this.createTime,
    required this.description,
    required this.updateTime,
    this.geofenceCount,
    this.kmsKeyId,
    this.pricingPlan,
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
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      geofenceCount: json['GeofenceCount'] as int?,
      kmsKeyId: json['KmsKeyId'] as String?,
      pricingPlan: (json['PricingPlan'] as String?)?.toPricingPlan(),
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
    final updateTime = this.updateTime;
    final geofenceCount = this.geofenceCount;
    final kmsKeyId = this.kmsKeyId;
    final pricingPlan = this.pricingPlan;
    final pricingPlanDataSource = this.pricingPlanDataSource;
    final tags = this.tags;
    return {
      'CollectionArn': collectionArn,
      'CollectionName': collectionName,
      'CreateTime': iso8601ToJson(createTime),
      'Description': description,
      'UpdateTime': iso8601ToJson(updateTime),
      if (geofenceCount != null) 'GeofenceCount': geofenceCount,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
      if (tags != null) 'Tags': tags,
    };
  }
}

class DescribeKeyResponse {
  /// The timestamp for when the API key resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The timestamp for when the API key resource will expire in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime expireTime;

  /// The key value/string of an API key.
  final String key;

  /// The Amazon Resource Name (ARN) for the API key resource. Used when you need
  /// to specify a resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:key/ExampleKey</code>
  /// </li>
  /// </ul>
  final String keyArn;

  /// The name of the API key resource.
  final String keyName;
  final ApiKeyRestrictions restrictions;

  /// The timestamp for when the API key resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// The optional description for the API key resource.
  final String? description;

  /// Tags associated with the API key resource.
  final Map<String, String>? tags;

  DescribeKeyResponse({
    required this.createTime,
    required this.expireTime,
    required this.key,
    required this.keyArn,
    required this.keyName,
    required this.restrictions,
    required this.updateTime,
    this.description,
    this.tags,
  });

  factory DescribeKeyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeKeyResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      expireTime: nonNullableTimeStampFromJson(json['ExpireTime'] as Object),
      key: json['Key'] as String,
      keyArn: json['KeyArn'] as String,
      keyName: json['KeyName'] as String,
      restrictions: ApiKeyRestrictions.fromJson(
          json['Restrictions'] as Map<String, dynamic>),
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      description: json['Description'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final expireTime = this.expireTime;
    final key = this.key;
    final keyArn = this.keyArn;
    final keyName = this.keyName;
    final restrictions = this.restrictions;
    final updateTime = this.updateTime;
    final description = this.description;
    final tags = this.tags;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'ExpireTime': iso8601ToJson(expireTime),
      'Key': key,
      'KeyArn': keyArn,
      'KeyName': keyName,
      'Restrictions': restrictions,
      'UpdateTime': iso8601ToJson(updateTime),
      if (description != null) 'Description': description,
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

  /// The Amazon Resource Name (ARN) for the map resource. Used to specify a
  /// resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:map/ExampleMap</code>
  /// </li>
  /// </ul>
  final String mapArn;

  /// The map style selected from an available provider.
  final String mapName;

  /// The timestamp for when the map resource was last update in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// No longer used. Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  /// Tags associated with the map resource.
  final Map<String, String>? tags;

  DescribeMapResponse({
    required this.configuration,
    required this.createTime,
    required this.dataSource,
    required this.description,
    required this.mapArn,
    required this.mapName,
    required this.updateTime,
    this.pricingPlan,
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
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      pricingPlan: (json['PricingPlan'] as String?)?.toPricingPlan(),
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
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    final tags = this.tags;
    return {
      'Configuration': configuration,
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'Description': description,
      'MapArn': mapArn,
      'MapName': mapName,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

class DescribePlaceIndexResponse {
  /// The timestamp for when the place index resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The data provider of geospatial data. Values can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code>
  /// </li>
  /// <li>
  /// <code>Grab</code>
  /// </li>
  /// <li>
  /// <code>Here</code>
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The specified data storage option for requesting Places.
  final DataSourceConfiguration dataSourceConfiguration;

  /// The optional description for the place index resource.
  final String description;

  /// The Amazon Resource Name (ARN) for the place index resource. Used to specify
  /// a resource across Amazon Web Services.
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

  /// The timestamp for when the place index resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// No longer used. Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  /// Tags associated with place index resource.
  final Map<String, String>? tags;

  DescribePlaceIndexResponse({
    required this.createTime,
    required this.dataSource,
    required this.dataSourceConfiguration,
    required this.description,
    required this.indexArn,
    required this.indexName,
    required this.updateTime,
    this.pricingPlan,
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
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      pricingPlan: (json['PricingPlan'] as String?)?.toPricingPlan(),
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
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    final tags = this.tags;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'DataSourceConfiguration': dataSourceConfiguration,
      'Description': description,
      'IndexArn': indexArn,
      'IndexName': indexName,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

class DescribeRouteCalculatorResponse {
  /// The Amazon Resource Name (ARN) for the Route calculator resource. Use the
  /// ARN when you specify a resource across Amazon Web Services.
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
  /// <code>Grab</code>
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

  /// Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  /// Tags associated with route calculator resource.
  final Map<String, String>? tags;

  DescribeRouteCalculatorResponse({
    required this.calculatorArn,
    required this.calculatorName,
    required this.createTime,
    required this.dataSource,
    required this.description,
    required this.updateTime,
    this.pricingPlan,
    this.tags,
  });

  factory DescribeRouteCalculatorResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRouteCalculatorResponse(
      calculatorArn: json['CalculatorArn'] as String,
      calculatorName: json['CalculatorName'] as String,
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      dataSource: json['DataSource'] as String,
      description: json['Description'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      pricingPlan: (json['PricingPlan'] as String?)?.toPricingPlan(),
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
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    final tags = this.tags;
    return {
      'CalculatorArn': calculatorArn,
      'CalculatorName': calculatorName,
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'Description': description,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
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

  /// The Amazon Resource Name (ARN) for the tracker resource. Used when you need
  /// to specify a resource across all Amazon Web Services.
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

  /// Whether <code>UPDATE</code> events from this tracker in EventBridge are
  /// enabled. If set to <code>true</code> these events will be sent to
  /// EventBridge.
  final bool? eventBridgeEnabled;

  /// Enables <code>GeospatialQueries</code> for a tracker that uses a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon
  /// Web Services KMS customer managed key</a>.
  ///
  /// This parameter is only used if you are using a KMS customer managed key.
  /// <note>
  /// If you wish to encrypt your data using your own KMS customer managed key,
  /// then the Bounding Polygon Queries feature will be disabled by default. This
  /// is because by using this feature, a representation of your device positions
  /// will not be encrypted using the your KMS managed key. The exact device
  /// position, however; is still encrypted using your managed key.
  ///
  /// You can choose to opt-in to the Bounding Polygon Quseries feature. This is
  /// done by setting the <code>KmsKeyEnableGeospatialQueries</code> parameter to
  /// true when creating or updating a Tracker.
  /// </note>
  final bool? kmsKeyEnableGeospatialQueries;

  /// A key identifier for an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon
  /// Web Services KMS customer managed key</a> assigned to the Amazon Location
  /// resource.
  final String? kmsKeyId;

  /// The position filtering method of the tracker resource.
  final PositionFiltering? positionFiltering;

  /// Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  /// No longer used. Always returns an empty string.
  final String? pricingPlanDataSource;

  /// The tags associated with the tracker resource.
  final Map<String, String>? tags;

  DescribeTrackerResponse({
    required this.createTime,
    required this.description,
    required this.trackerArn,
    required this.trackerName,
    required this.updateTime,
    this.eventBridgeEnabled,
    this.kmsKeyEnableGeospatialQueries,
    this.kmsKeyId,
    this.positionFiltering,
    this.pricingPlan,
    this.pricingPlanDataSource,
    this.tags,
  });

  factory DescribeTrackerResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTrackerResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      description: json['Description'] as String,
      trackerArn: json['TrackerArn'] as String,
      trackerName: json['TrackerName'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      eventBridgeEnabled: json['EventBridgeEnabled'] as bool?,
      kmsKeyEnableGeospatialQueries:
          json['KmsKeyEnableGeospatialQueries'] as bool?,
      kmsKeyId: json['KmsKeyId'] as String?,
      positionFiltering:
          (json['PositionFiltering'] as String?)?.toPositionFiltering(),
      pricingPlan: (json['PricingPlan'] as String?)?.toPricingPlan(),
      pricingPlanDataSource: json['PricingPlanDataSource'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final description = this.description;
    final trackerArn = this.trackerArn;
    final trackerName = this.trackerName;
    final updateTime = this.updateTime;
    final eventBridgeEnabled = this.eventBridgeEnabled;
    final kmsKeyEnableGeospatialQueries = this.kmsKeyEnableGeospatialQueries;
    final kmsKeyId = this.kmsKeyId;
    final positionFiltering = this.positionFiltering;
    final pricingPlan = this.pricingPlan;
    final pricingPlanDataSource = this.pricingPlanDataSource;
    final tags = this.tags;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'Description': description,
      'TrackerArn': trackerArn,
      'TrackerName': trackerName,
      'UpdateTime': iso8601ToJson(updateTime),
      if (eventBridgeEnabled != null) 'EventBridgeEnabled': eventBridgeEnabled,
      if (kmsKeyEnableGeospatialQueries != null)
        'KmsKeyEnableGeospatialQueries': kmsKeyEnableGeospatialQueries,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (positionFiltering != null)
        'PositionFiltering': positionFiltering.toValue(),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
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

  /// The accuracy of the device position.
  final PositionalAccuracy? accuracy;

  /// The device whose position you retrieved.
  final String? deviceId;

  /// The properties associated with the position.
  final Map<String, String>? positionProperties;

  DevicePosition({
    required this.position,
    required this.receivedTime,
    required this.sampleTime,
    this.accuracy,
    this.deviceId,
    this.positionProperties,
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
      accuracy: json['Accuracy'] != null
          ? PositionalAccuracy.fromJson(
              json['Accuracy'] as Map<String, dynamic>)
          : null,
      deviceId: json['DeviceId'] as String?,
      positionProperties: (json['PositionProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final receivedTime = this.receivedTime;
    final sampleTime = this.sampleTime;
    final accuracy = this.accuracy;
    final deviceId = this.deviceId;
    final positionProperties = this.positionProperties;
    return {
      'Position': position,
      'ReceivedTime': iso8601ToJson(receivedTime),
      'SampleTime': iso8601ToJson(sampleTime),
      if (accuracy != null) 'Accuracy': accuracy,
      if (deviceId != null) 'DeviceId': deviceId,
      if (positionProperties != null) 'PositionProperties': positionProperties,
    };
  }
}

/// Contains the position update details for a device.
class DevicePositionUpdate {
  /// The device associated to the position update.
  final String deviceId;

  /// The latest device position defined in <a
  /// href="https://earth-info.nga.mil/index.php?dir=wgs84&amp;action=wgs84">WGS
  /// 84</a> format: <code>[X or longitude, Y or latitude]</code>.
  final List<double> position;

  /// The timestamp at which the device's position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime sampleTime;

  /// The accuracy of the device position.
  final PositionalAccuracy? accuracy;

  /// Associates one of more properties with the position update. A property is a
  /// key-value pair stored with the position update and added to any geofence
  /// event the update may trigger.
  ///
  /// Format: <code>"key" : "value"</code>
  final Map<String, String>? positionProperties;

  DevicePositionUpdate({
    required this.deviceId,
    required this.position,
    required this.sampleTime,
    this.accuracy,
    this.positionProperties,
  });

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final position = this.position;
    final sampleTime = this.sampleTime;
    final accuracy = this.accuracy;
    final positionProperties = this.positionProperties;
    return {
      'DeviceId': deviceId,
      'Position': position,
      'SampleTime': iso8601ToJson(sampleTime),
      if (accuracy != null) 'Accuracy': accuracy,
      if (positionProperties != null) 'PositionProperties': positionProperties,
    };
  }
}

enum DimensionUnit {
  meters,
  feet,
}

extension DimensionUnitValueExtension on DimensionUnit {
  String toValue() {
    switch (this) {
      case DimensionUnit.meters:
        return 'Meters';
      case DimensionUnit.feet:
        return 'Feet';
    }
  }
}

extension DimensionUnitFromString on String {
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

extension DistanceUnitValueExtension on DistanceUnit {
  String toValue() {
    switch (this) {
      case DistanceUnit.kilometers:
        return 'Kilometers';
      case DistanceUnit.miles:
        return 'Miles';
    }
  }
}

extension DistanceUnitFromString on String {
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
///
/// A geofence geometry is made up of either a polygon or a circle. Can be
/// either a polygon or a circle. Including both will return a validation error.
/// <note>
/// Amazon Location doesn't currently support polygons with holes,
/// multipolygons, polygons that are wound clockwise, or that cross the
/// antimeridian.
/// </note>
class GeofenceGeometry {
  /// A circle on the earth, as defined by a center point and a radius.
  final Circle? circle;

  /// A polygon is a list of linear rings which are each made up of a list of
  /// vertices.
  ///
  /// Each vertex is a 2-dimensional point of the form: <code>[longitude,
  /// latitude]</code>. This is represented as an array of doubles of length 2 (so
  /// <code>[double, double]</code>).
  ///
  /// An array of 4 or more vertices, where the first and last vertex are the same
  /// (to form a closed boundary), is called a linear ring. The linear ring
  /// vertices must be listed in counter-clockwise order around the ring’s
  /// interior. The linear ring is represented as an array of vertices, or an
  /// array of arrays of doubles (<code>[[double, double], ...]</code>).
  ///
  /// A geofence consists of a single linear ring. To allow for future expansion,
  /// the Polygon parameter takes an array of linear rings, which is represented
  /// as an array of arrays of arrays of doubles (<code>[[[double, double], ...],
  /// ...]</code>).
  ///
  /// A linear ring for use in geofences can consist of between 4 and 1,000
  /// vertices.
  final List<List<List<double>>>? polygon;

  GeofenceGeometry({
    this.circle,
    this.polygon,
  });

  factory GeofenceGeometry.fromJson(Map<String, dynamic> json) {
    return GeofenceGeometry(
      circle: json['Circle'] != null
          ? Circle.fromJson(json['Circle'] as Map<String, dynamic>)
          : null,
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
    final circle = this.circle;
    final polygon = this.polygon;
    return {
      if (circle != null) 'Circle': circle,
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

  /// The accuracy of the device position.
  final PositionalAccuracy? accuracy;

  /// The device whose position you retrieved.
  final String? deviceId;

  /// The properties associated with the position.
  final Map<String, String>? positionProperties;

  GetDevicePositionResponse({
    required this.position,
    required this.receivedTime,
    required this.sampleTime,
    this.accuracy,
    this.deviceId,
    this.positionProperties,
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
      accuracy: json['Accuracy'] != null
          ? PositionalAccuracy.fromJson(
              json['Accuracy'] as Map<String, dynamic>)
          : null,
      deviceId: json['DeviceId'] as String?,
      positionProperties: (json['PositionProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final receivedTime = this.receivedTime;
    final sampleTime = this.sampleTime;
    final accuracy = this.accuracy;
    final deviceId = this.deviceId;
    final positionProperties = this.positionProperties;
    return {
      'Position': position,
      'ReceivedTime': iso8601ToJson(receivedTime),
      'SampleTime': iso8601ToJson(sampleTime),
      if (accuracy != null) 'Accuracy': accuracy,
      if (deviceId != null) 'DeviceId': deviceId,
      if (positionProperties != null) 'PositionProperties': positionProperties,
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

  /// Contains the geofence geometry details describing a polygon or a circle.
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

  /// User defined properties of the geofence. A property is a key-value pair
  /// stored with the geofence and added to any geofence event triggered with that
  /// geofence.
  ///
  /// Format: <code>"key" : "value"</code>
  final Map<String, String>? geofenceProperties;

  GetGeofenceResponse({
    required this.createTime,
    required this.geofenceId,
    required this.geometry,
    required this.status,
    required this.updateTime,
    this.geofenceProperties,
  });

  factory GetGeofenceResponse.fromJson(Map<String, dynamic> json) {
    return GetGeofenceResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      geofenceId: json['GeofenceId'] as String,
      geometry:
          GeofenceGeometry.fromJson(json['Geometry'] as Map<String, dynamic>),
      status: json['Status'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      geofenceProperties: (json['GeofenceProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final geofenceId = this.geofenceId;
    final geometry = this.geometry;
    final status = this.status;
    final updateTime = this.updateTime;
    final geofenceProperties = this.geofenceProperties;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'GeofenceId': geofenceId,
      'Geometry': geometry,
      'Status': status,
      'UpdateTime': iso8601ToJson(updateTime),
      if (geofenceProperties != null) 'GeofenceProperties': geofenceProperties,
    };
  }
}

class GetMapGlyphsResponse {
  /// The glyph, as binary blob.
  final Uint8List? blob;

  /// The HTTP Cache-Control directive for the value.
  final String? cacheControl;

  /// The map glyph content type. For example,
  /// <code>application/octet-stream</code>.
  final String? contentType;

  GetMapGlyphsResponse({
    this.blob,
    this.cacheControl,
    this.contentType,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final cacheControl = this.cacheControl;
    final contentType = this.contentType;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

class GetMapSpritesResponse {
  /// Contains the body of the sprite sheet or JSON offset ﬁle.
  final Uint8List? blob;

  /// The HTTP Cache-Control directive for the value.
  final String? cacheControl;

  /// The content type of the sprite sheet and offsets. For example, the sprite
  /// sheet content type is <code>image/png</code>, and the sprite offset JSON
  /// document is <code>application/json</code>.
  final String? contentType;

  GetMapSpritesResponse({
    this.blob,
    this.cacheControl,
    this.contentType,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final cacheControl = this.cacheControl;
    final contentType = this.contentType;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

class GetMapStyleDescriptorResponse {
  /// Contains the body of the style descriptor.
  final Uint8List? blob;

  /// The HTTP Cache-Control directive for the value.
  final String? cacheControl;

  /// The style descriptor's content type. For example,
  /// <code>application/json</code>.
  final String? contentType;

  GetMapStyleDescriptorResponse({
    this.blob,
    this.cacheControl,
    this.contentType,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final cacheControl = this.cacheControl;
    final contentType = this.contentType;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

class GetMapTileResponse {
  /// Contains Mapbox Vector Tile (MVT) data.
  final Uint8List? blob;

  /// The HTTP Cache-Control directive for the value.
  final String? cacheControl;

  /// The map tile's content type. For example,
  /// <code>application/vnd.mapbox-vector-tile</code>.
  final String? contentType;

  GetMapTileResponse({
    this.blob,
    this.cacheControl,
    this.contentType,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final cacheControl = this.cacheControl;
    final contentType = this.contentType;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

class GetPlaceResponse {
  /// Details about the result, such as its address and position.
  final Place place;

  GetPlaceResponse({
    required this.place,
  });

  factory GetPlaceResponse.fromJson(Map<String, dynamic> json) {
    return GetPlaceResponse(
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

enum IntendedUse {
  singleUse,
  storage,
}

extension IntendedUseValueExtension on IntendedUse {
  String toValue() {
    switch (this) {
      case IntendedUse.singleUse:
        return 'SingleUse';
      case IntendedUse.storage:
        return 'Storage';
    }
  }
}

extension IntendedUseFromString on String {
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
/// positions. The number of legs returned corresponds to one fewer than the
/// total number of positions in the request.
///
/// For example, a route with a departure position and destination position
/// returns one leg with the positions <a
/// href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html">snapped
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
/// returns two legs with the positions snapped to a nearby road:
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
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/nap-to-nearby-road.html">snapped
  /// to a nearby road</a>.
  /// </note>
  final List<double> endPosition;

  /// The starting position of the leg. Follows the format
  /// <code>[longitude,latitude]</code>.
  /// <note>
  /// If the <code>StartPosition</code> isn't located on a road, it's <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html">snapped
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
  /// Contains details about each device's last known position.
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

  /// The accuracy of the device position.
  final PositionalAccuracy? accuracy;

  /// The properties associated with the position.
  final Map<String, String>? positionProperties;

  ListDevicePositionsResponseEntry({
    required this.deviceId,
    required this.position,
    required this.sampleTime,
    this.accuracy,
    this.positionProperties,
  });

  factory ListDevicePositionsResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListDevicePositionsResponseEntry(
      deviceId: json['DeviceId'] as String,
      position: (json['Position'] as List)
          .whereNotNull()
          .map((e) => e as double)
          .toList(),
      sampleTime: nonNullableTimeStampFromJson(json['SampleTime'] as Object),
      accuracy: json['Accuracy'] != null
          ? PositionalAccuracy.fromJson(
              json['Accuracy'] as Map<String, dynamic>)
          : null,
      positionProperties: (json['PositionProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final position = this.position;
    final sampleTime = this.sampleTime;
    final accuracy = this.accuracy;
    final positionProperties = this.positionProperties;
    return {
      'DeviceId': deviceId,
      'Position': position,
      'SampleTime': iso8601ToJson(sampleTime),
      if (accuracy != null) 'Accuracy': accuracy,
      if (positionProperties != null) 'PositionProperties': positionProperties,
    };
  }
}

class ListGeofenceCollectionsResponse {
  /// Lists the geofence collections that exist in your Amazon Web Services
  /// account.
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

  /// Specifies a timestamp for when the resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  /// No longer used. Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  /// No longer used. Always returns an empty string.
  final String? pricingPlanDataSource;

  ListGeofenceCollectionsResponseEntry({
    required this.collectionName,
    required this.createTime,
    required this.description,
    required this.updateTime,
    this.pricingPlan,
    this.pricingPlanDataSource,
  });

  factory ListGeofenceCollectionsResponseEntry.fromJson(
      Map<String, dynamic> json) {
    return ListGeofenceCollectionsResponseEntry(
      collectionName: json['CollectionName'] as String,
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      description: json['Description'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      pricingPlan: (json['PricingPlan'] as String?)?.toPricingPlan(),
      pricingPlanDataSource: json['PricingPlanDataSource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collectionName = this.collectionName;
    final createTime = this.createTime;
    final description = this.description;
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    final pricingPlanDataSource = this.pricingPlanDataSource;
    return {
      'CollectionName': collectionName,
      'CreateTime': iso8601ToJson(createTime),
      'Description': description,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
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

  /// Contains the geofence geometry details describing a polygon or a circle.
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

  /// User defined properties of the geofence. A property is a key-value pair
  /// stored with the geofence and added to any geofence event triggered with that
  /// geofence.
  ///
  /// Format: <code>"key" : "value"</code>
  final Map<String, String>? geofenceProperties;

  ListGeofenceResponseEntry({
    required this.createTime,
    required this.geofenceId,
    required this.geometry,
    required this.status,
    required this.updateTime,
    this.geofenceProperties,
  });

  factory ListGeofenceResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListGeofenceResponseEntry(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      geofenceId: json['GeofenceId'] as String,
      geometry:
          GeofenceGeometry.fromJson(json['Geometry'] as Map<String, dynamic>),
      status: json['Status'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      geofenceProperties: (json['GeofenceProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final geofenceId = this.geofenceId;
    final geometry = this.geometry;
    final status = this.status;
    final updateTime = this.updateTime;
    final geofenceProperties = this.geofenceProperties;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'GeofenceId': geofenceId,
      'Geometry': geometry,
      'Status': status,
      'UpdateTime': iso8601ToJson(updateTime),
      if (geofenceProperties != null) 'GeofenceProperties': geofenceProperties,
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

class ListKeysResponse {
  /// Contains API key resources in your Amazon Web Services account. Details
  /// include API key name, allowed referers and timestamp for when the API key
  /// will expire.
  final List<ListKeysResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  ListKeysResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListKeysResponse.fromJson(Map<String, dynamic> json) {
    return ListKeysResponse(
      entries: (json['Entries'] as List)
          .whereNotNull()
          .map((e) => ListKeysResponseEntry.fromJson(e as Map<String, dynamic>))
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

/// An API key resource listed in your Amazon Web Services account.
class ListKeysResponseEntry {
  /// The timestamp of when the API key was created, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The timestamp for when the API key resource will expire, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime expireTime;

  /// The name of the API key resource.
  final String keyName;
  final ApiKeyRestrictions restrictions;

  /// The timestamp of when the API key was last updated, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// The optional description for the API key resource.
  final String? description;

  ListKeysResponseEntry({
    required this.createTime,
    required this.expireTime,
    required this.keyName,
    required this.restrictions,
    required this.updateTime,
    this.description,
  });

  factory ListKeysResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListKeysResponseEntry(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      expireTime: nonNullableTimeStampFromJson(json['ExpireTime'] as Object),
      keyName: json['KeyName'] as String,
      restrictions: ApiKeyRestrictions.fromJson(
          json['Restrictions'] as Map<String, dynamic>),
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final expireTime = this.expireTime;
    final keyName = this.keyName;
    final restrictions = this.restrictions;
    final updateTime = this.updateTime;
    final description = this.description;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'ExpireTime': iso8601ToJson(expireTime),
      'KeyName': keyName,
      'Restrictions': restrictions,
      'UpdateTime': iso8601ToJson(updateTime),
      if (description != null) 'Description': description,
    };
  }
}

class ListMapsResponse {
  /// Contains a list of maps in your Amazon Web Services account
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

/// Contains details of an existing map resource in your Amazon Web Services
/// account.
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

  /// The timestamp for when the map resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// No longer used. Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  ListMapsResponseEntry({
    required this.createTime,
    required this.dataSource,
    required this.description,
    required this.mapName,
    required this.updateTime,
    this.pricingPlan,
  });

  factory ListMapsResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListMapsResponseEntry(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      dataSource: json['DataSource'] as String,
      description: json['Description'] as String,
      mapName: json['MapName'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      pricingPlan: (json['PricingPlan'] as String?)?.toPricingPlan(),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final description = this.description;
    final mapName = this.mapName;
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'Description': description,
      'MapName': mapName,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
    };
  }
}

class ListPlaceIndexesResponse {
  /// Lists the place index resources that exist in your Amazon Web Services
  /// account
  final List<ListPlaceIndexesResponseEntry> entries;

  /// A pagination token indicating that there are additional pages available. You
  /// can use the token in a new request to fetch the next page of results.
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

/// A place index resource listed in your Amazon Web Services account.
class ListPlaceIndexesResponseEntry {
  /// The timestamp for when the place index resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The data provider of geospatial data. Values can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code>
  /// </li>
  /// <li>
  /// <code>Grab</code>
  /// </li>
  /// <li>
  /// <code>Here</code>
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The optional description for the place index resource.
  final String description;

  /// The name of the place index resource.
  final String indexName;

  /// The timestamp for when the place index resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// No longer used. Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  ListPlaceIndexesResponseEntry({
    required this.createTime,
    required this.dataSource,
    required this.description,
    required this.indexName,
    required this.updateTime,
    this.pricingPlan,
  });

  factory ListPlaceIndexesResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListPlaceIndexesResponseEntry(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      dataSource: json['DataSource'] as String,
      description: json['Description'] as String,
      indexName: json['IndexName'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      pricingPlan: (json['PricingPlan'] as String?)?.toPricingPlan(),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final description = this.description;
    final indexName = this.indexName;
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'Description': description,
      'IndexName': indexName,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
    };
  }
}

class ListRouteCalculatorsResponse {
  /// Lists the route calculator resources that exist in your Amazon Web Services
  /// account
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

/// A route calculator resource listed in your Amazon Web Services account.
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
  /// <code>Grab</code>
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

  /// Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  ListRouteCalculatorsResponseEntry({
    required this.calculatorName,
    required this.createTime,
    required this.dataSource,
    required this.description,
    required this.updateTime,
    this.pricingPlan,
  });

  factory ListRouteCalculatorsResponseEntry.fromJson(
      Map<String, dynamic> json) {
    return ListRouteCalculatorsResponseEntry(
      calculatorName: json['CalculatorName'] as String,
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      dataSource: json['DataSource'] as String,
      description: json['Description'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      pricingPlan: (json['PricingPlan'] as String?)?.toPricingPlan(),
    );
  }

  Map<String, dynamic> toJson() {
    final calculatorName = this.calculatorName;
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final description = this.description;
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    return {
      'CalculatorName': calculatorName,
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'Description': description,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
    };
  }
}

class ListTagsForResourceResponse {
  /// Tags that have been applied to the specified resource. Tags are mapped from
  /// the tag key to the tag value: <code>"TagKey" : "TagValue"</code>.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>{"tag1" : "value1", "tag2" : "value2"} </code>
  /// </li>
  /// </ul>
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
  /// Contains tracker resources in your Amazon Web Services account. Details
  /// include tracker name, description and timestamps for when the tracker was
  /// created and last updated.
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

  /// The name of the tracker resource.
  final String trackerName;

  /// The timestamp at which the device's position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  /// No longer used. Always returns an empty string.
  final String? pricingPlanDataSource;

  ListTrackersResponseEntry({
    required this.createTime,
    required this.description,
    required this.trackerName,
    required this.updateTime,
    this.pricingPlan,
    this.pricingPlanDataSource,
  });

  factory ListTrackersResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListTrackersResponseEntry(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      description: json['Description'] as String,
      trackerName: json['TrackerName'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
      pricingPlan: (json['PricingPlan'] as String?)?.toPricingPlan(),
      pricingPlanDataSource: json['PricingPlanDataSource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final description = this.description;
    final trackerName = this.trackerName;
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    final pricingPlanDataSource = this.pricingPlanDataSource;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'Description': description,
      'TrackerName': trackerName,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.toValue(),
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
    };
  }
}

/// Specifies the map tile style selected from an available provider.
class MapConfiguration {
  /// Specifies the map style selected from an available data provider.
  ///
  /// Valid <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/esri.html">Esri
  /// map styles</a>:
  ///
  /// <ul>
  /// <li>
  /// <code>VectorEsriNavigation</code> – The Esri Navigation map style, which
  /// provides a detailed basemap for the world symbolized with a custom
  /// navigation map style that's designed for use during the day in mobile
  /// devices. It also includes a richer set of places, such as shops, services,
  /// restaurants, attractions, and other points of interest. Enable the
  /// <code>POI</code> layer by setting it in CustomLayers to leverage the
  /// additional places data.
  /// <p/> </li>
  /// <li>
  /// <code>RasterEsriImagery</code> – The Esri Imagery map style. A raster
  /// basemap that provides one meter or better satellite and aerial imagery in
  /// many parts of the world and lower resolution satellite imagery worldwide.
  /// </li>
  /// <li>
  /// <code>VectorEsriLightGrayCanvas</code> – The Esri Light Gray Canvas map
  /// style, which provides a detailed vector basemap with a light gray, neutral
  /// background style with minimal colors, labels, and features that's designed
  /// to draw attention to your thematic content.
  /// </li>
  /// <li>
  /// <code>VectorEsriTopographic</code> – The Esri Light map style, which
  /// provides a detailed vector basemap with a classic Esri map style.
  /// </li>
  /// <li>
  /// <code>VectorEsriStreets</code> – The Esri Street Map style, which provides a
  /// detailed vector basemap for the world symbolized with a classic Esri street
  /// map style. The vector tile layer is similar in content and style to the
  /// World Street Map raster map.
  /// </li>
  /// <li>
  /// <code>VectorEsriDarkGrayCanvas</code> – The Esri Dark Gray Canvas map style.
  /// A vector basemap with a dark gray, neutral background with minimal colors,
  /// labels, and features that's designed to draw attention to your thematic
  /// content.
  /// </li>
  /// </ul>
  /// Valid <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/HERE.html">HERE
  /// Technologies map styles</a>:
  ///
  /// <ul>
  /// <li>
  /// <code>VectorHereExplore</code> – A default HERE map style containing a
  /// neutral, global map and its features including roads, buildings, landmarks,
  /// and water features. It also now includes a fully designed map of Japan.
  /// </li>
  /// <li>
  /// <code>RasterHereExploreSatellite</code> – A global map containing high
  /// resolution satellite imagery.
  /// </li>
  /// <li>
  /// <code>HybridHereExploreSatellite</code> – A global map displaying the road
  /// network, street names, and city labels over satellite imagery. This style
  /// will automatically retrieve both raster and vector tiles, and your charges
  /// will be based on total tiles retrieved.
  /// <note>
  /// Hybrid styles use both vector and raster tiles when rendering the map that
  /// you see. This means that more tiles are retrieved than when using either
  /// vector or raster tiles alone. Your charges will include all tiles retrieved.
  /// </note> </li>
  /// <li>
  /// <code>VectorHereContrast</code> – The HERE Contrast (Berlin) map style is a
  /// high contrast detailed base map of the world that blends 3D and 2D
  /// rendering.
  /// <note>
  /// The <code>VectorHereContrast</code> style has been renamed from
  /// <code>VectorHereBerlin</code>. <code>VectorHereBerlin</code> has been
  /// deprecated, but will continue to work in applications that use it.
  /// </note> </li>
  /// <li>
  /// <code>VectorHereExploreTruck</code> – A global map containing truck
  /// restrictions and attributes (e.g. width / height / HAZMAT) symbolized with
  /// highlighted segments and icons on top of HERE Explore to support use cases
  /// within transport and logistics.
  /// </li>
  /// </ul>
  /// Valid <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html">GrabMaps
  /// map styles</a>:
  ///
  /// <ul>
  /// <li>
  /// <code>VectorGrabStandardLight</code> – The Grab Standard Light map style
  /// provides a basemap with detailed land use coloring, area names, roads,
  /// landmarks, and points of interest covering Southeast Asia.
  /// </li>
  /// <li>
  /// <code>VectorGrabStandardDark</code> – The Grab Standard Dark map style
  /// provides a dark variation of the standard basemap covering Southeast Asia.
  /// </li>
  /// </ul> <note>
  /// Grab provides maps only for countries in Southeast Asia, and is only
  /// available in the Asia Pacific (Singapore) Region
  /// (<code>ap-southeast-1</code>). For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html#grab-coverage-area">GrabMaps
  /// countries and area covered</a>.
  /// </note>
  /// Valid <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/open-data.html">Open
  /// Data map styles</a>:
  ///
  /// <ul>
  /// <li>
  /// <code>VectorOpenDataStandardLight</code> – The Open Data Standard Light map
  /// style provides a detailed basemap for the world suitable for website and
  /// mobile application use. The map includes highways major roads, minor roads,
  /// railways, water features, cities, parks, landmarks, building footprints, and
  /// administrative boundaries.
  /// </li>
  /// <li>
  /// <code>VectorOpenDataStandardDark</code> – Open Data Standard Dark is a
  /// dark-themed map style that provides a detailed basemap for the world
  /// suitable for website and mobile application use. The map includes highways
  /// major roads, minor roads, railways, water features, cities, parks,
  /// landmarks, building footprints, and administrative boundaries.
  /// </li>
  /// <li>
  /// <code>VectorOpenDataVisualizationLight</code> – The Open Data Visualization
  /// Light map style is a light-themed style with muted colors and fewer features
  /// that aids in understanding overlaid data.
  /// </li>
  /// <li>
  /// <code>VectorOpenDataVisualizationDark</code> – The Open Data Visualization
  /// Dark map style is a dark-themed style with muted colors and fewer features
  /// that aids in understanding overlaid data.
  /// </li>
  /// </ul>
  final String style;

  /// Specifies the custom layers for the style. Leave unset to not enable any
  /// custom layer, or, for styles that support custom layers, you can enable
  /// layer(s), such as <code>POI</code> layer for the VectorEsriNavigation style.
  /// Default is <code>unset</code>.
  /// <note>
  /// Currenlty only <code>VectorEsriNavigation</code> supports CustomLayers. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/map-concepts.html#map-custom-layers">Custom
  /// Layers</a>.
  /// </note>
  final List<String>? customLayers;

  /// Specifies the political view for the style. Leave unset to not use a
  /// political view, or, for styles that support specific political views, you
  /// can choose a view, such as <code>IND</code> for the Indian view.
  ///
  /// Default is unset.
  /// <note>
  /// Not all map resources or styles support political view styles. See <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/map-concepts.html#political-views">Political
  /// views</a> for more information.
  /// </note>
  final String? politicalView;

  MapConfiguration({
    required this.style,
    this.customLayers,
    this.politicalView,
  });

  factory MapConfiguration.fromJson(Map<String, dynamic> json) {
    return MapConfiguration(
      style: json['Style'] as String,
      customLayers: (json['CustomLayers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      politicalView: json['PoliticalView'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final style = this.style;
    final customLayers = this.customLayers;
    final politicalView = this.politicalView;
    return {
      'Style': style,
      if (customLayers != null) 'CustomLayers': customLayers,
      if (politicalView != null) 'PoliticalView': politicalView,
    };
  }
}

/// Specifies the political view for the style.
class MapConfigurationUpdate {
  /// Specifies the custom layers for the style. Leave unset to not enable any
  /// custom layer, or, for styles that support custom layers, you can enable
  /// layer(s), such as <code>POI</code> layer for the VectorEsriNavigation style.
  /// Default is <code>unset</code>.
  /// <note>
  /// Currenlty only <code>VectorEsriNavigation</code> supports CustomLayers. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/map-concepts.html#map-custom-layers">Custom
  /// Layers</a>.
  /// </note>
  final List<String>? customLayers;

  /// Specifies the political view for the style. Set to an empty string to not
  /// use a political view, or, for styles that support specific political views,
  /// you can choose a view, such as <code>IND</code> for the Indian view.
  /// <note>
  /// Not all map resources or styles support political view styles. See <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/map-concepts.html#political-views">Political
  /// views</a> for more information.
  /// </note>
  final String? politicalView;

  MapConfigurationUpdate({
    this.customLayers,
    this.politicalView,
  });

  Map<String, dynamic> toJson() {
    final customLayers = this.customLayers;
    final politicalView = this.politicalView;
    return {
      if (customLayers != null) 'CustomLayers': customLayers,
      if (politicalView != null) 'PoliticalView': politicalView,
    };
  }
}

enum OptimizationMode {
  fastestRoute,
  shortestRoute,
}

extension OptimizationModeValueExtension on OptimizationMode {
  String toValue() {
    switch (this) {
      case OptimizationMode.fastestRoute:
        return 'FastestRoute';
      case OptimizationMode.shortestRoute:
        return 'ShortestRoute';
    }
  }
}

extension OptimizationModeFromString on String {
  OptimizationMode toOptimizationMode() {
    switch (this) {
      case 'FastestRoute':
        return OptimizationMode.fastestRoute;
      case 'ShortestRoute':
        return OptimizationMode.shortestRoute;
    }
    throw Exception('$this is not known in enum OptimizationMode');
  }
}

/// Contains details about addresses or points of interest that match the search
/// criteria.
///
/// Not all details are included with all responses. Some details may only be
/// returned by specific data partners.
class Place {
  final PlaceGeometry geometry;

  /// The numerical portion of an address, such as a building number.
  final String? addressNumber;

  /// The Amazon Location categories that describe this Place.
  ///
  /// For more information about using categories, including a list of Amazon
  /// Location categories, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/category-filtering.html">Categories
  /// and filtering</a>, in the <i>Amazon Location Service Developer Guide</i>.
  final List<String>? categories;

  /// A country/region specified using <a
  /// href="https://www.iso.org/iso-3166-country-codes.html">ISO 3166</a> 3-digit
  /// country/region code. For example, <code>CAN</code>.
  final String? country;

  /// <code>True</code> if the result is interpolated from other known places.
  ///
  /// <code>False</code> if the Place is a known place.
  ///
  /// Not returned when the partner does not provide the information.
  ///
  /// For example, returns <code>False</code> for an address location that is
  /// found in the partner data, but returns <code>True</code> if an address does
  /// not exist in the partner data and its location is calculated by
  /// interpolating between other known addresses.
  final bool? interpolated;

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

  /// An area that's part of a larger municipality. For example,
  /// <code>Blissville</code> is a submunicipality in the Queen County in New
  /// York.
  /// <note>
  /// This property is only returned for a place index that uses Esri as a data
  /// provider. The property is represented as a <code>district</code>.
  /// </note>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String? subMunicipality;

  /// A county, or an area that's part of a larger region. For example,
  /// <code>Metro Vancouver</code>.
  final String? subRegion;

  /// Categories from the data provider that describe the Place that are not
  /// mapped to any Amazon Location categories.
  final List<String>? supplementalCategories;

  /// The time zone in which the <code>Place</code> is located. Returned only when
  /// using HERE or Grab as the selected partner.
  final TimeZone? timeZone;

  /// For addresses with multiple units, the unit identifier. Can include numbers
  /// and letters, for example <code>3B</code> or <code>Unit 123</code>.
  /// <note>
  /// This property is returned only for a place index that uses Esri or Grab as a
  /// data provider. It is not returned for
  /// <code>SearchPlaceIndexForPosition</code>.
  /// </note>
  final String? unitNumber;

  /// For addresses with a <code>UnitNumber</code>, the type of unit. For example,
  /// <code>Apartment</code>.
  /// <note>
  /// This property is returned only for a place index that uses Esri as a data
  /// provider.
  /// </note>
  final String? unitType;

  Place({
    required this.geometry,
    this.addressNumber,
    this.categories,
    this.country,
    this.interpolated,
    this.label,
    this.municipality,
    this.neighborhood,
    this.postalCode,
    this.region,
    this.street,
    this.subMunicipality,
    this.subRegion,
    this.supplementalCategories,
    this.timeZone,
    this.unitNumber,
    this.unitType,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      geometry:
          PlaceGeometry.fromJson(json['Geometry'] as Map<String, dynamic>),
      addressNumber: json['AddressNumber'] as String?,
      categories: (json['Categories'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      country: json['Country'] as String?,
      interpolated: json['Interpolated'] as bool?,
      label: json['Label'] as String?,
      municipality: json['Municipality'] as String?,
      neighborhood: json['Neighborhood'] as String?,
      postalCode: json['PostalCode'] as String?,
      region: json['Region'] as String?,
      street: json['Street'] as String?,
      subMunicipality: json['SubMunicipality'] as String?,
      subRegion: json['SubRegion'] as String?,
      supplementalCategories: (json['SupplementalCategories'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      timeZone: json['TimeZone'] != null
          ? TimeZone.fromJson(json['TimeZone'] as Map<String, dynamic>)
          : null,
      unitNumber: json['UnitNumber'] as String?,
      unitType: json['UnitType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final geometry = this.geometry;
    final addressNumber = this.addressNumber;
    final categories = this.categories;
    final country = this.country;
    final interpolated = this.interpolated;
    final label = this.label;
    final municipality = this.municipality;
    final neighborhood = this.neighborhood;
    final postalCode = this.postalCode;
    final region = this.region;
    final street = this.street;
    final subMunicipality = this.subMunicipality;
    final subRegion = this.subRegion;
    final supplementalCategories = this.supplementalCategories;
    final timeZone = this.timeZone;
    final unitNumber = this.unitNumber;
    final unitType = this.unitType;
    return {
      'Geometry': geometry,
      if (addressNumber != null) 'AddressNumber': addressNumber,
      if (categories != null) 'Categories': categories,
      if (country != null) 'Country': country,
      if (interpolated != null) 'Interpolated': interpolated,
      if (label != null) 'Label': label,
      if (municipality != null) 'Municipality': municipality,
      if (neighborhood != null) 'Neighborhood': neighborhood,
      if (postalCode != null) 'PostalCode': postalCode,
      if (region != null) 'Region': region,
      if (street != null) 'Street': street,
      if (subMunicipality != null) 'SubMunicipality': subMunicipality,
      if (subRegion != null) 'SubRegion': subRegion,
      if (supplementalCategories != null)
        'SupplementalCategories': supplementalCategories,
      if (timeZone != null) 'TimeZone': timeZone,
      if (unitNumber != null) 'UnitNumber': unitNumber,
      if (unitType != null) 'UnitType': unitType,
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

enum PositionFiltering {
  timeBased,
  distanceBased,
  accuracyBased,
}

extension PositionFilteringValueExtension on PositionFiltering {
  String toValue() {
    switch (this) {
      case PositionFiltering.timeBased:
        return 'TimeBased';
      case PositionFiltering.distanceBased:
        return 'DistanceBased';
      case PositionFiltering.accuracyBased:
        return 'AccuracyBased';
    }
  }
}

extension PositionFilteringFromString on String {
  PositionFiltering toPositionFiltering() {
    switch (this) {
      case 'TimeBased':
        return PositionFiltering.timeBased;
      case 'DistanceBased':
        return PositionFiltering.distanceBased;
      case 'AccuracyBased':
        return PositionFiltering.accuracyBased;
    }
    throw Exception('$this is not known in enum PositionFiltering');
  }
}

/// Defines the level of certainty of the position.
class PositionalAccuracy {
  /// Estimated maximum distance, in meters, between the measured position and the
  /// true position of a device, along the Earth's surface.
  final double horizontal;

  PositionalAccuracy({
    required this.horizontal,
  });

  factory PositionalAccuracy.fromJson(Map<String, dynamic> json) {
    return PositionalAccuracy(
      horizontal: json['Horizontal'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final horizontal = this.horizontal;
    return {
      'Horizontal': horizontal,
    };
  }
}

enum PricingPlan {
  requestBasedUsage,
  mobileAssetTracking,
  mobileAssetManagement,
}

extension PricingPlanValueExtension on PricingPlan {
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

extension PricingPlanFromString on String {
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

/// The result for the calculated route of one <code>DeparturePosition</code>
/// <code>DestinationPosition</code> pair.
class RouteMatrixEntry {
  /// The total distance of travel for the route.
  final double? distance;

  /// The expected duration of travel for the route.
  final double? durationSeconds;

  /// An error corresponding to the calculation of a route between the
  /// <code>DeparturePosition</code> and <code>DestinationPosition</code>.
  final RouteMatrixEntryError? error;

  RouteMatrixEntry({
    this.distance,
    this.durationSeconds,
    this.error,
  });

  factory RouteMatrixEntry.fromJson(Map<String, dynamic> json) {
    return RouteMatrixEntry(
      distance: json['Distance'] as double?,
      durationSeconds: json['DurationSeconds'] as double?,
      error: json['Error'] != null
          ? RouteMatrixEntryError.fromJson(
              json['Error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final durationSeconds = this.durationSeconds;
    final error = this.error;
    return {
      if (distance != null) 'Distance': distance,
      if (durationSeconds != null) 'DurationSeconds': durationSeconds,
      if (error != null) 'Error': error,
    };
  }
}

/// An error corresponding to the calculation of a route between the
/// <code>DeparturePosition</code> and <code>DestinationPosition</code>.
///
/// The error code can be one of the following:
///
/// <ul>
/// <li>
/// <code>RouteNotFound</code> - Unable to find a valid route with the given
/// parameters.
/// </li>
/// </ul>
/// <ul>
/// <li>
/// <code>RouteTooLong</code> - Route calculation went beyond the maximum size
/// of a route and was terminated before completion.
/// </li>
/// </ul>
/// <ul>
/// <li>
/// <code>PositionsNotFound</code> - One or more of the input positions were not
/// found on the route network.
/// </li>
/// </ul>
/// <ul>
/// <li>
/// <code>DestinationPositionNotFound</code> - The destination position was not
/// found on the route network.
/// </li>
/// </ul>
/// <ul>
/// <li>
/// <code>DeparturePositionNotFound</code> - The departure position was not
/// found on the route network.
/// </li>
/// </ul>
/// <ul>
/// <li>
/// <code>OtherValidationError</code> - The given inputs were not valid or a
/// route was not found. More information is given in the error
/// <code>Message</code>
/// </li>
/// </ul>
class RouteMatrixEntryError {
  /// The type of error which occurred for the route calculation.
  final RouteMatrixErrorCode code;

  /// A message about the error that occurred for the route calculation.
  final String? message;

  RouteMatrixEntryError({
    required this.code,
    this.message,
  });

  factory RouteMatrixEntryError.fromJson(Map<String, dynamic> json) {
    return RouteMatrixEntryError(
      code: (json['Code'] as String).toRouteMatrixErrorCode(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      'Code': code.toValue(),
      if (message != null) 'Message': message,
    };
  }
}

enum RouteMatrixErrorCode {
  routeNotFound,
  routeTooLong,
  positionsNotFound,
  destinationPositionNotFound,
  departurePositionNotFound,
  otherValidationError,
}

extension RouteMatrixErrorCodeValueExtension on RouteMatrixErrorCode {
  String toValue() {
    switch (this) {
      case RouteMatrixErrorCode.routeNotFound:
        return 'RouteNotFound';
      case RouteMatrixErrorCode.routeTooLong:
        return 'RouteTooLong';
      case RouteMatrixErrorCode.positionsNotFound:
        return 'PositionsNotFound';
      case RouteMatrixErrorCode.destinationPositionNotFound:
        return 'DestinationPositionNotFound';
      case RouteMatrixErrorCode.departurePositionNotFound:
        return 'DeparturePositionNotFound';
      case RouteMatrixErrorCode.otherValidationError:
        return 'OtherValidationError';
    }
  }
}

extension RouteMatrixErrorCodeFromString on String {
  RouteMatrixErrorCode toRouteMatrixErrorCode() {
    switch (this) {
      case 'RouteNotFound':
        return RouteMatrixErrorCode.routeNotFound;
      case 'RouteTooLong':
        return RouteMatrixErrorCode.routeTooLong;
      case 'PositionsNotFound':
        return RouteMatrixErrorCode.positionsNotFound;
      case 'DestinationPositionNotFound':
        return RouteMatrixErrorCode.destinationPositionNotFound;
      case 'DeparturePositionNotFound':
        return RouteMatrixErrorCode.departurePositionNotFound;
      case 'OtherValidationError':
        return RouteMatrixErrorCode.otherValidationError;
    }
    throw Exception('$this is not known in enum RouteMatrixErrorCode');
  }
}

/// Contains a search result from a position search query that is run on a place
/// index resource.
class SearchForPositionResult {
  /// The distance in meters of a great-circle arc between the query position and
  /// the result.
  /// <note>
  /// A great-circle arc is the shortest path on a sphere, in this case the Earth.
  /// This returns the shortest distance between two locations.
  /// </note>
  final double distance;

  /// Details about the search result, such as its address and position.
  final Place place;

  /// The unique identifier of the place. You can use this with the
  /// <code>GetPlace</code> operation to find the place again later.
  /// <note>
  /// For <code>SearchPlaceIndexForPosition</code> operations, the
  /// <code>PlaceId</code> is returned only by place indexes that use HERE or Grab
  /// as a data provider.
  /// </note>
  final String? placeId;

  SearchForPositionResult({
    required this.distance,
    required this.place,
    this.placeId,
  });

  factory SearchForPositionResult.fromJson(Map<String, dynamic> json) {
    return SearchForPositionResult(
      distance: json['Distance'] as double,
      place: Place.fromJson(json['Place'] as Map<String, dynamic>),
      placeId: json['PlaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final place = this.place;
    final placeId = this.placeId;
    return {
      'Distance': distance,
      'Place': place,
      if (placeId != null) 'PlaceId': placeId,
    };
  }
}

/// Contains a place suggestion resulting from a place suggestion query that is
/// run on a place index resource.
class SearchForSuggestionsResult {
  /// The text of the place suggestion, typically formatted as an address string.
  final String text;

  /// The Amazon Location categories that describe the Place.
  ///
  /// For more information about using categories, including a list of Amazon
  /// Location categories, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/category-filtering.html">Categories
  /// and filtering</a>, in the <i>Amazon Location Service Developer Guide</i>.
  final List<String>? categories;

  /// The unique identifier of the Place. You can use this with the
  /// <code>GetPlace</code> operation to find the place again later, or to get
  /// full information for the Place.
  ///
  /// The <code>GetPlace</code> request must use the same <code>PlaceIndex</code>
  /// resource as the <code>SearchPlaceIndexForSuggestions</code> that generated
  /// the Place ID.
  /// <note>
  /// For <code>SearchPlaceIndexForSuggestions</code> operations, the
  /// <code>PlaceId</code> is returned by place indexes that use Esri, Grab, or
  /// HERE as data providers.
  /// </note>
  /// While you can use PlaceID in subsequent requests, PlaceID is not intended to
  /// be a permanent identifier and the ID can change between consecutive API
  /// calls. Please see the following PlaceID behaviour for each data provider:
  ///
  /// <ul>
  /// <li>
  /// Esri: Place IDs will change every quarter at a minimum. The typical time
  /// period for these changes would be March, June, September, and December.
  /// Place IDs might also change between the typical quarterly change but that
  /// will be much less frequent.
  /// </li>
  /// <li>
  /// HERE: We recommend that you cache data for no longer than a week to keep
  /// your data data fresh. You can assume that less than 1% ID shifts will
  /// release over release which is approximately 1 - 2 times per week.
  /// </li>
  /// <li>
  /// Grab: Place IDs can expire or become invalid in the following situations.
  ///
  /// <ul>
  /// <li>
  /// Data operations: The POI may be removed from Grab POI database by Grab Map
  /// Ops based on the ground-truth, such as being closed in the real world, being
  /// detected as a duplicate POI, or having incorrect information. Grab will
  /// synchronize data to the Waypoint environment on weekly basis.
  /// </li>
  /// <li>
  /// Interpolated POI: Interpolated POI is a temporary POI generated in real time
  /// when serving a request, and it will be marked as derived in the
  /// <code>place.result_type</code> field in the response. The information of
  /// interpolated POIs will be retained for at least 30 days, which means that
  /// within 30 days, you are able to obtain POI details by Place ID from Place
  /// Details API. After 30 days, the interpolated POIs(both Place ID and details)
  /// may expire and inaccessible from the Places Details API.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final String? placeId;

  /// Categories from the data provider that describe the Place that are not
  /// mapped to any Amazon Location categories.
  final List<String>? supplementalCategories;

  SearchForSuggestionsResult({
    required this.text,
    this.categories,
    this.placeId,
    this.supplementalCategories,
  });

  factory SearchForSuggestionsResult.fromJson(Map<String, dynamic> json) {
    return SearchForSuggestionsResult(
      text: json['Text'] as String,
      categories: (json['Categories'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      placeId: json['PlaceId'] as String?,
      supplementalCategories: (json['SupplementalCategories'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final categories = this.categories;
    final placeId = this.placeId;
    final supplementalCategories = this.supplementalCategories;
    return {
      'Text': text,
      if (categories != null) 'Categories': categories,
      if (placeId != null) 'PlaceId': placeId,
      if (supplementalCategories != null)
        'SupplementalCategories': supplementalCategories,
    };
  }
}

/// Contains a search result from a text search query that is run on a place
/// index resource.
class SearchForTextResult {
  /// Details about the search result, such as its address and position.
  final Place place;

  /// The distance in meters of a great-circle arc between the bias position
  /// specified and the result. <code>Distance</code> will be returned only if a
  /// bias position was specified in the query.
  /// <note>
  /// A great-circle arc is the shortest path on a sphere, in this case the Earth.
  /// This returns the shortest distance between two locations.
  /// </note>
  final double? distance;

  /// The unique identifier of the place. You can use this with the
  /// <code>GetPlace</code> operation to find the place again later.
  /// <note>
  /// For <code>SearchPlaceIndexForText</code> operations, the
  /// <code>PlaceId</code> is returned only by place indexes that use HERE or Grab
  /// as a data provider.
  /// </note>
  final String? placeId;

  /// The relative confidence in the match for a result among the results
  /// returned. For example, if more fields for an address match (including house
  /// number, street, city, country/region, and postal code), the relevance score
  /// is closer to 1.
  ///
  /// Returned only when the partner selected is Esri or Grab.
  final double? relevance;

  SearchForTextResult({
    required this.place,
    this.distance,
    this.placeId,
    this.relevance,
  });

  factory SearchForTextResult.fromJson(Map<String, dynamic> json) {
    return SearchForTextResult(
      place: Place.fromJson(json['Place'] as Map<String, dynamic>),
      distance: json['Distance'] as double?,
      placeId: json['PlaceId'] as String?,
      relevance: json['Relevance'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    final distance = this.distance;
    final placeId = this.placeId;
    final relevance = this.relevance;
    return {
      'Place': place,
      if (distance != null) 'Distance': distance,
      if (placeId != null) 'PlaceId': placeId,
      if (relevance != null) 'Relevance': relevance,
    };
  }
}

class SearchPlaceIndexForPositionResponse {
  /// Returns a list of Places closest to the specified position. Each result
  /// contains additional information about the Places returned.
  final List<SearchForPositionResult> results;

  /// Contains a summary of the request. Echoes the input values for
  /// <code>Position</code>, <code>Language</code>, <code>MaxResults</code>, and
  /// the <code>DataSource</code> of the place index.
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

/// A summary of the request sent by using
/// <code>SearchPlaceIndexForPosition</code>.
class SearchPlaceIndexForPositionSummary {
  /// The geospatial data provider attached to the place index resource specified
  /// in the request. Values can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// Esri
  /// </li>
  /// <li>
  /// Grab
  /// </li>
  /// <li>
  /// Here
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The position specified in the request.
  final List<double> position;

  /// The preferred language used to return results. Matches the language in the
  /// request. The value is a valid <a
  /// href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for
  /// example, <code>en</code> for English.
  final String? language;

  /// Contains the optional result count limit that is specified in the request.
  ///
  /// Default value: <code>50</code>
  final int? maxResults;

  SearchPlaceIndexForPositionSummary({
    required this.dataSource,
    required this.position,
    this.language,
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
      language: json['Language'] as String?,
      maxResults: json['MaxResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final position = this.position;
    final language = this.language;
    final maxResults = this.maxResults;
    return {
      'DataSource': dataSource,
      'Position': position,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
    };
  }
}

class SearchPlaceIndexForSuggestionsResponse {
  /// A list of place suggestions that best match the search text.
  final List<SearchForSuggestionsResult> results;

  /// Contains a summary of the request. Echoes the input values for
  /// <code>BiasPosition</code>, <code>FilterBBox</code>,
  /// <code>FilterCountries</code>, <code>Language</code>,
  /// <code>MaxResults</code>, and <code>Text</code>. Also includes the
  /// <code>DataSource</code> of the place index.
  final SearchPlaceIndexForSuggestionsSummary summary;

  SearchPlaceIndexForSuggestionsResponse({
    required this.results,
    required this.summary,
  });

  factory SearchPlaceIndexForSuggestionsResponse.fromJson(
      Map<String, dynamic> json) {
    return SearchPlaceIndexForSuggestionsResponse(
      results: (json['Results'] as List)
          .whereNotNull()
          .map((e) =>
              SearchForSuggestionsResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: SearchPlaceIndexForSuggestionsSummary.fromJson(
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

/// A summary of the request sent by using
/// <code>SearchPlaceIndexForSuggestions</code>.
class SearchPlaceIndexForSuggestionsSummary {
  /// The geospatial data provider attached to the place index resource specified
  /// in the request. Values can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// Esri
  /// </li>
  /// <li>
  /// Grab
  /// </li>
  /// <li>
  /// Here
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The free-form partial text input specified in the request.
  final String text;

  /// Contains the coordinates for the optional bias position specified in the
  /// request.
  ///
  /// This parameter contains a pair of numbers. The first number represents the X
  /// coordinate, or longitude; the second number represents the Y coordinate, or
  /// latitude.
  ///
  /// For example, <code>[-123.1174, 49.2847]</code> represents the position with
  /// longitude <code>-123.1174</code> and latitude <code>49.2847</code>.
  final List<double>? biasPosition;

  /// Contains the coordinates for the optional bounding box specified in the
  /// request.
  final List<double>? filterBBox;

  /// The optional category filter specified in the request.
  final List<String>? filterCategories;

  /// Contains the optional country filter specified in the request.
  final List<String>? filterCountries;

  /// The preferred language used to return results. Matches the language in the
  /// request. The value is a valid <a
  /// href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for
  /// example, <code>en</code> for English.
  final String? language;

  /// Contains the optional result count limit specified in the request.
  final int? maxResults;

  SearchPlaceIndexForSuggestionsSummary({
    required this.dataSource,
    required this.text,
    this.biasPosition,
    this.filterBBox,
    this.filterCategories,
    this.filterCountries,
    this.language,
    this.maxResults,
  });

  factory SearchPlaceIndexForSuggestionsSummary.fromJson(
      Map<String, dynamic> json) {
    return SearchPlaceIndexForSuggestionsSummary(
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
      filterCategories: (json['FilterCategories'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      filterCountries: (json['FilterCountries'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      language: json['Language'] as String?,
      maxResults: json['MaxResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final text = this.text;
    final biasPosition = this.biasPosition;
    final filterBBox = this.filterBBox;
    final filterCategories = this.filterCategories;
    final filterCountries = this.filterCountries;
    final language = this.language;
    final maxResults = this.maxResults;
    return {
      'DataSource': dataSource,
      'Text': text,
      if (biasPosition != null) 'BiasPosition': biasPosition,
      if (filterBBox != null) 'FilterBBox': filterBBox,
      if (filterCategories != null) 'FilterCategories': filterCategories,
      if (filterCountries != null) 'FilterCountries': filterCountries,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
    };
  }
}

class SearchPlaceIndexForTextResponse {
  /// A list of Places matching the input text. Each result contains additional
  /// information about the specific point of interest.
  ///
  /// Not all response properties are included with all responses. Some properties
  /// may only be returned by specific data partners.
  final List<SearchForTextResult> results;

  /// Contains a summary of the request. Echoes the input values for
  /// <code>BiasPosition</code>, <code>FilterBBox</code>,
  /// <code>FilterCountries</code>, <code>Language</code>,
  /// <code>MaxResults</code>, and <code>Text</code>. Also includes the
  /// <code>DataSource</code> of the place index and the bounding box,
  /// <code>ResultBBox</code>, which surrounds the search results.
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

/// A summary of the request sent by using <code>SearchPlaceIndexForText</code>.
class SearchPlaceIndexForTextSummary {
  /// The geospatial data provider attached to the place index resource specified
  /// in the request. Values can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// Esri
  /// </li>
  /// <li>
  /// Grab
  /// </li>
  /// <li>
  /// Here
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The search text specified in the request.
  final String text;

  /// Contains the coordinates for the optional bias position specified in the
  /// request.
  ///
  /// This parameter contains a pair of numbers. The first number represents the X
  /// coordinate, or longitude; the second number represents the Y coordinate, or
  /// latitude.
  ///
  /// For example, <code>[-123.1174, 49.2847]</code> represents the position with
  /// longitude <code>-123.1174</code> and latitude <code>49.2847</code>.
  final List<double>? biasPosition;

  /// Contains the coordinates for the optional bounding box specified in the
  /// request.
  final List<double>? filterBBox;

  /// The optional category filter specified in the request.
  final List<String>? filterCategories;

  /// Contains the optional country filter specified in the request.
  final List<String>? filterCountries;

  /// The preferred language used to return results. Matches the language in the
  /// request. The value is a valid <a
  /// href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for
  /// example, <code>en</code> for English.
  final String? language;

  /// Contains the optional result count limit specified in the request.
  final int? maxResults;

  /// The bounding box that fully contains all search results.
  /// <note>
  /// If you specified the optional <code>FilterBBox</code> parameter in the
  /// request, <code>ResultBBox</code> is contained within
  /// <code>FilterBBox</code>.
  /// </note>
  final List<double>? resultBBox;

  SearchPlaceIndexForTextSummary({
    required this.dataSource,
    required this.text,
    this.biasPosition,
    this.filterBBox,
    this.filterCategories,
    this.filterCountries,
    this.language,
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
      filterCategories: (json['FilterCategories'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      filterCountries: (json['FilterCountries'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      language: json['Language'] as String?,
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
    final filterCategories = this.filterCategories;
    final filterCountries = this.filterCountries;
    final language = this.language;
    final maxResults = this.maxResults;
    final resultBBox = this.resultBBox;
    return {
      'DataSource': dataSource,
      'Text': text,
      if (biasPosition != null) 'BiasPosition': biasPosition,
      if (filterBBox != null) 'FilterBBox': filterBBox,
      if (filterCategories != null) 'FilterCategories': filterCategories,
      if (filterCountries != null) 'FilterCountries': filterCountries,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
      if (resultBBox != null) 'ResultBBox': resultBBox,
    };
  }
}

enum Status {
  active,
  expired,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.active:
        return 'Active';
      case Status.expired:
        return 'Expired';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'Active':
        return Status.active;
      case 'Expired':
        return Status.expired;
    }
    throw Exception('$this is not known in enum Status');
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

/// Information about a time zone. Includes the name of the time zone and the
/// offset from UTC in seconds.
class TimeZone {
  /// The name of the time zone, following the <a
  /// href="https://www.iana.org/time-zones"> IANA time zone standard</a>. For
  /// example, <code>America/Los_Angeles</code>.
  final String name;

  /// The time zone's offset, in seconds, from UTC.
  final int? offset;

  TimeZone({
    required this.name,
    this.offset,
  });

  factory TimeZone.fromJson(Map<String, dynamic> json) {
    return TimeZone(
      name: json['Name'] as String,
      offset: json['Offset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final offset = this.offset;
    return {
      'Name': name,
      if (offset != null) 'Offset': offset,
    };
  }
}

/// The geomerty used to filter device positions.
class TrackingFilterGeometry {
  /// The set of arrays which define the polygon. A polygon can have between 4 and
  /// 1000 vertices.
  final List<List<List<double>>>? polygon;

  TrackingFilterGeometry({
    this.polygon,
  });

  Map<String, dynamic> toJson() {
    final polygon = this.polygon;
    return {
      if (polygon != null) 'Polygon': polygon,
    };
  }
}

enum TravelMode {
  car,
  truck,
  walking,
  bicycle,
  motorcycle,
}

extension TravelModeValueExtension on TravelMode {
  String toValue() {
    switch (this) {
      case TravelMode.car:
        return 'Car';
      case TravelMode.truck:
        return 'Truck';
      case TravelMode.walking:
        return 'Walking';
      case TravelMode.bicycle:
        return 'Bicycle';
      case TravelMode.motorcycle:
        return 'Motorcycle';
    }
  }
}

extension TravelModeFromString on String {
  TravelMode toTravelMode() {
    switch (this) {
      case 'Car':
        return TravelMode.car;
      case 'Truck':
        return TravelMode.truck;
      case 'Walking':
        return TravelMode.walking;
      case 'Bicycle':
        return TravelMode.bicycle;
      case 'Motorcycle':
        return TravelMode.motorcycle;
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
  /// </ul> <note>
  /// For routes calculated with a HERE resource, this value must be between 0 and
  /// 50 meters.
  /// </note>
  final double? height;

  /// The length of the truck.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>15.5</code>.
  /// </li>
  /// </ul> <note>
  /// For routes calculated with a HERE resource, this value must be between 0 and
  /// 300 meters.
  /// </note>
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
  /// </ul> <note>
  /// For routes calculated with a HERE resource, this value must be between 0 and
  /// 50 meters.
  /// </note>
  final double? width;

  TruckDimensions({
    this.height,
    this.length,
    this.unit,
    this.width,
  });

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

class UpdateGeofenceCollectionResponse {
  /// The Amazon Resource Name (ARN) of the updated geofence collection. Used to
  /// specify a resource across Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection</code>
  /// </li>
  /// </ul>
  final String collectionArn;

  /// The name of the updated geofence collection.
  final String collectionName;

  /// The time when the geofence collection was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  UpdateGeofenceCollectionResponse({
    required this.collectionArn,
    required this.collectionName,
    required this.updateTime,
  });

  factory UpdateGeofenceCollectionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateGeofenceCollectionResponse(
      collectionArn: json['CollectionArn'] as String,
      collectionName: json['CollectionName'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final collectionArn = this.collectionArn;
    final collectionName = this.collectionName;
    final updateTime = this.updateTime;
    return {
      'CollectionArn': collectionArn,
      'CollectionName': collectionName,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

class UpdateKeyResponse {
  /// The Amazon Resource Name (ARN) for the API key resource. Used when you need
  /// to specify a resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:key/ExampleKey</code>
  /// </li>
  /// </ul>
  final String keyArn;

  /// The name of the API key resource.
  final String keyName;

  /// The timestamp for when the API key resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  UpdateKeyResponse({
    required this.keyArn,
    required this.keyName,
    required this.updateTime,
  });

  factory UpdateKeyResponse.fromJson(Map<String, dynamic> json) {
    return UpdateKeyResponse(
      keyArn: json['KeyArn'] as String,
      keyName: json['KeyName'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final keyArn = this.keyArn;
    final keyName = this.keyName;
    final updateTime = this.updateTime;
    return {
      'KeyArn': keyArn,
      'KeyName': keyName,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

class UpdateMapResponse {
  /// The Amazon Resource Name (ARN) of the updated map resource. Used to specify
  /// a resource across AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:map/ExampleMap</code>
  /// </li>
  /// </ul>
  final String mapArn;

  /// The name of the updated map resource.
  final String mapName;

  /// The timestamp for when the map resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  UpdateMapResponse({
    required this.mapArn,
    required this.mapName,
    required this.updateTime,
  });

  factory UpdateMapResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMapResponse(
      mapArn: json['MapArn'] as String,
      mapName: json['MapName'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final mapArn = this.mapArn;
    final mapName = this.mapName;
    final updateTime = this.updateTime;
    return {
      'MapArn': mapArn,
      'MapName': mapName,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

class UpdatePlaceIndexResponse {
  /// The Amazon Resource Name (ARN) of the upated place index resource. Used to
  /// specify a resource across Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:place-
  /// index/ExamplePlaceIndex</code>
  /// </li>
  /// </ul>
  final String indexArn;

  /// The name of the updated place index resource.
  final String indexName;

  /// The timestamp for when the place index resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  UpdatePlaceIndexResponse({
    required this.indexArn,
    required this.indexName,
    required this.updateTime,
  });

  factory UpdatePlaceIndexResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePlaceIndexResponse(
      indexArn: json['IndexArn'] as String,
      indexName: json['IndexName'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final indexArn = this.indexArn;
    final indexName = this.indexName;
    final updateTime = this.updateTime;
    return {
      'IndexArn': indexArn,
      'IndexName': indexName,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

class UpdateRouteCalculatorResponse {
  /// The Amazon Resource Name (ARN) of the updated route calculator resource.
  /// Used to specify a resource across AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:route-
  /// calculator/ExampleCalculator</code>
  /// </li>
  /// </ul>
  final String calculatorArn;

  /// The name of the updated route calculator resource.
  final String calculatorName;

  /// The timestamp for when the route calculator was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  UpdateRouteCalculatorResponse({
    required this.calculatorArn,
    required this.calculatorName,
    required this.updateTime,
  });

  factory UpdateRouteCalculatorResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRouteCalculatorResponse(
      calculatorArn: json['CalculatorArn'] as String,
      calculatorName: json['CalculatorName'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final calculatorArn = this.calculatorArn;
    final calculatorName = this.calculatorName;
    final updateTime = this.updateTime;
    return {
      'CalculatorArn': calculatorArn,
      'CalculatorName': calculatorName,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

class UpdateTrackerResponse {
  /// The Amazon Resource Name (ARN) of the updated tracker resource. Used to
  /// specify a resource across AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:tracker/ExampleTracker</code>
  /// </li>
  /// </ul>
  final String trackerArn;

  /// The name of the updated tracker resource.
  final String trackerName;

  /// The timestamp for when the tracker resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  UpdateTrackerResponse({
    required this.trackerArn,
    required this.trackerName,
    required this.updateTime,
  });

  factory UpdateTrackerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTrackerResponse(
      trackerArn: json['TrackerArn'] as String,
      trackerName: json['TrackerName'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final trackerArn = this.trackerArn;
    final trackerName = this.trackerName;
    final updateTime = this.updateTime;
    return {
      'TrackerArn': trackerArn,
      'TrackerName': trackerName,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

enum VehicleWeightUnit {
  kilograms,
  pounds,
}

extension VehicleWeightUnitValueExtension on VehicleWeightUnit {
  String toValue() {
    switch (this) {
      case VehicleWeightUnit.kilograms:
        return 'Kilograms';
      case VehicleWeightUnit.pounds:
        return 'Pounds';
    }
  }
}

extension VehicleWeightUnitFromString on String {
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

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
