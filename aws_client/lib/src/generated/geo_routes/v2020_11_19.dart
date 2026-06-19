// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// With the Routes API you can calculate routes and estimate travel time based
/// on up-to-date road network and live traffic information. Key features
/// include:
///
/// <ul>
/// <li>
/// Point-to-point routing with estimated travel time, distance, and
/// turn-by-turn directions. See <a
/// href="https://docs.aws.amazon.com/location/latest/APIReference/API_CalculateRoutes.html">CalculateRoutes</a>.
/// </li>
/// <li>
/// Multi-point route optimization to minimize travel time or distance. See <a
/// href="https://docs.aws.amazon.com/location/latest/APIReference/API_OptimizeWaypoints.html">OptimizeWaypoints</a>.
/// </li>
/// <li>
/// Route matrices for efficient multi-destination planning. See <a
/// href="https://docs.aws.amazon.com/location/latest/APIReference/API_CalculateRouteMatrix.html">CalculateRouteMatrix</a>.
/// </li>
/// <li>
/// Isoline calculations to determine reachable areas within specified time or
/// distance thresholds. See <a
/// href="https://docs.aws.amazon.com/location/latest/APIReference/API_CalculateIsolines.html">CalculateIsolines</a>.
/// </li>
/// <li>
/// Map-matching to align GPS traces with the road network. See <a
/// href="https://docs.aws.amazon.com/location/latest/APIReference/API_SnapToRoads.html">SnapToRoads</a>.
/// </li>
/// </ul>
class GeoRoutes {
  final _s.RestJsonProtocol _protocol;
  GeoRoutes({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'geo-routes',
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

  /// Calculates areas that can be reached within specified time or distance
  /// thresholds from a given point. For example, you can use this operation to
  /// determine the area within a 30-minute drive of a store location, find
  /// neighborhoods within walking distance of a school, or identify delivery
  /// zones based on drive time.
  ///
  /// Isolines (also known as isochrones for time-based calculations) are useful
  /// for various applications including:
  ///
  /// <ul>
  /// <li>
  /// Service area visualization - Show customers the area you can serve within
  /// promised delivery times
  /// </li>
  /// <li>
  /// Site selection - Analyze potential business locations based on population
  /// within travel distance
  /// </li>
  /// <li>
  /// Site selection - Determine areas that can be reached within specified
  /// response times
  /// </li>
  /// </ul> <note>
  /// Route preferences such as avoiding toll roads or ferries are treated as
  /// preferences rather than absolute restrictions. If a viable route cannot be
  /// calculated while honoring all preferences, some may be ignored.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-isolines.html">Calculate
  /// isolines</a> in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [thresholds] :
  /// The distance or time thresholds used to determine reachable areas. You can
  /// specify up to five thresholds (which all must be the same type) to
  /// calculate multiple isolines in a single request. For example, to determine
  /// the areas that are reachable within 10 and 20 minutes of the origin,
  /// specify time thresholds of 600 and 1200 seconds.
  ///
  /// You incur a calculation charge for each threshold. Using a large number of
  /// thresholds in a request can lead to unexpected charges. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/routes-pricing.html">Routes
  /// pricing</a> in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// Parameter [allow] :
  /// Enables special road types or features that should be considered for
  /// routing even if they might be restricted by default for the selected
  /// travel mode. These include high-occupancy vehicle and toll lanes.
  ///
  /// Parameter [arrivalTime] :
  /// Determine areas from which <code>Destination</code> can be reached by this
  /// time, taking into account predicted traffic conditions and working
  /// backward to account for congestion patterns. This attribute cannot be used
  /// together with <code>DepartureTime</code> or <code>DepartNow</code>.
  /// Specified as an ISO-8601 timestamp with timezone offset.
  ///
  /// Time format: <code>YYYY-MM-DDThh:mm:ss.sssZ |
  /// YYYY-MM-DDThh:mm:ss.sss+hh:mm</code>
  ///
  /// Examples:
  ///
  /// <code>2020-04-22T17:57:24Z</code>
  ///
  /// <code>2020-04-22T17:57:24+02:00</code>
  ///
  /// Parameter [avoid] :
  /// Specifies road types, features, or areas to avoid (if possible) when
  /// calculating reachable areas. These are treated as preferences rather than
  /// strict constraints—if a route cannot be calculated without using an
  /// avoided feature, that avoidance preference may be ignored.
  ///
  /// Parameter [departNow] :
  /// When true, uses the current time as the departure time and takes current
  /// traffic conditions into account. This attribute cannot be used together
  /// with <code>DepartureTime</code> or <code>ArrivalTime</code>.
  ///
  /// Parameter [departureTime] :
  /// Determine areas that can be reached when departing at this time, taking
  /// into account predicted traffic conditions. This attribute cannot be used
  /// together with <code>ArrivalTime</code> or <code>DepartNow</code>.
  /// Specified as an ISO-8601 timestamp with timezone offset.
  ///
  /// Time format:<code>YYYY-MM-DDThh:mm:ss.sssZ |
  /// YYYY-MM-DDThh:mm:ss.sss+hh:mm</code>
  ///
  /// Examples:
  ///
  /// <code>2020-04-22T17:57:24Z</code>
  ///
  /// <code>2020-04-22T17:57:24+02:00</code>
  ///
  /// Parameter [destination] :
  /// An optional destination point, specified as <code>\[longitude,
  /// latitude\]</code> coordinates. When provided, the service calculates areas
  /// from which this destination can be reached within the specified
  /// thresholds. This reverses the usual isoline calculation to show areas that
  /// could reach your location, rather than areas you could reach from your
  /// location. Either <code>Origin</code> or <code>Destination</code> must be
  /// provided.
  ///
  /// Parameter [destinationOptions] :
  /// Options that control how the destination point is matched to the road
  /// network and how routes can approach it. These options help improve travel
  /// time accuracy by accounting for real-world access to the destination.
  ///
  /// Parameter [isolineGeometryFormat] :
  /// The format of the returned IsolineGeometry.
  ///
  /// Default value:<code>FlexiblePolyline</code>
  ///
  /// Parameter [isolineGranularity] :
  /// Controls the detail level of the generated isolines. Higher granularity
  /// produces smoother shapes but requires more processing time and results in
  /// larger responses.
  ///
  /// Parameter [key] :
  /// An Amazon Location Service API Key with access to this action. If omitted,
  /// the request must be signed using Signature Version 4.
  ///
  /// Parameter [optimizeIsolineFor] :
  /// Controls the trade-off between calculation speed and isoline precision.
  /// Choose <code> FastCalculation</code> for quicker results with less detail,
  /// <code>AccurateCalculation</code> for more precise results, or
  /// <code>BalancedCalculation</code> for a middle ground.
  ///
  /// Default value: <code>BalancedCalculation</code>
  ///
  /// Parameter [optimizeRoutingFor] :
  /// Determines whether routes prioritize shortest travel time
  /// (<code>FastestRoute</code>) or shortest physical distance
  /// (<code>ShortestRoute</code>) when calculating reachable areas.
  ///
  /// Default value: <code>FastestRoute</code>
  ///
  /// Parameter [origin] :
  /// The starting point for isoline calculations, specified as
  /// <code>\[longitude, latitude\]</code> coordinates. For example, this could
  /// be a store location, service center, or any point from which you want to
  /// calculate reachable areas. Either <code>Origin</code> or
  /// <code>Destination</code> must be provided.
  ///
  /// Parameter [originOptions] :
  /// Options that control how the origin point is matched to the road network
  /// and how routes can depart from it. These options help improve travel time
  /// accuracy by accounting for real-world access from the origin.
  ///
  /// Parameter [traffic] :
  /// Configures how real-time and historical traffic data affects isoline
  /// calculations. Traffic patterns can significantly impact reachable areas,
  /// especially during peak hours.
  ///
  /// Parameter [travelMode] :
  /// The mode of transportation to use for calculations. This affects which
  /// road types or features can be used, estimated speed, and the traffic
  /// levels that are applied.
  ///
  /// <ul>
  /// <li>
  /// <code>Car</code>—Standard passenger vehicle routing using roads accessible
  /// to cars
  /// </li>
  /// <li>
  /// <code>Pedestrian</code>—Walking routes using pedestrian paths, sidewalks,
  /// and crossings
  /// </li>
  /// <li>
  /// <code>Scooter</code>—Light two-wheeled vehicle routing using roads and
  /// paths accessible to scooters
  /// </li>
  /// <li>
  /// <code>Truck</code>—Commercial truck routing considering vehicle
  /// dimensions, weight restrictions, and hazardous material regulations
  /// </li>
  /// </ul> <note>
  /// The mode <code>Scooter</code> also applies to motorcycles; set this to
  /// <code>Scooter</code> when calculating isolines for motorcycles.
  /// </note>
  /// Default value: <code>Car</code>
  ///
  /// Parameter [travelModeOptions] :
  /// Additional attributes that refine how reachable areas are calculated based
  /// on specific vehicle characteristics. These options help produce more
  /// accurate results by accounting for real-world constraints and
  /// capabilities.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// For trucks (<code>Truck</code>), specify dimensions, weight limits, and
  /// hazardous cargo restrictions to ensure isolines only include roads that
  /// can physically and legally accommodate the vehicle
  /// </li>
  /// <li>
  /// For cars (<code>Car</code>), set maximum speed capabilities or indicate
  /// high-occupancy vehicle eligibility to better estimate reachable areas
  /// </li>
  /// <li>
  /// For scooters (<code>Scooter</code>), specify engine type and speed
  /// limitations to more accurately model their travel capabilities
  /// </li>
  /// </ul>
  /// Without these options, calculations use default assumptions that may not
  /// match your specific use case.
  Future<CalculateIsolinesResponse> calculateIsolines({
    required IsolineThresholds thresholds,
    IsolineAllowOptions? allow,
    String? arrivalTime,
    IsolineAvoidanceOptions? avoid,
    bool? departNow,
    String? departureTime,
    List<double>? destination,
    IsolineDestinationOptions? destinationOptions,
    GeometryFormat? isolineGeometryFormat,
    IsolineGranularityOptions? isolineGranularity,
    String? key,
    IsolineOptimizationObjective? optimizeIsolineFor,
    RoutingObjective? optimizeRoutingFor,
    List<double>? origin,
    IsolineOriginOptions? originOptions,
    IsolineTrafficOptions? traffic,
    IsolineTravelMode? travelMode,
    IsolineTravelModeOptions? travelModeOptions,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'Thresholds': thresholds,
      if (allow != null) 'Allow': allow,
      if (arrivalTime != null) 'ArrivalTime': arrivalTime,
      if (avoid != null) 'Avoid': avoid,
      if (departNow != null) 'DepartNow': departNow,
      if (departureTime != null) 'DepartureTime': departureTime,
      if (destination != null) 'Destination': destination,
      if (destinationOptions != null) 'DestinationOptions': destinationOptions,
      if (isolineGeometryFormat != null)
        'IsolineGeometryFormat': isolineGeometryFormat.value,
      if (isolineGranularity != null) 'IsolineGranularity': isolineGranularity,
      if (optimizeIsolineFor != null)
        'OptimizeIsolineFor': optimizeIsolineFor.value,
      if (optimizeRoutingFor != null)
        'OptimizeRoutingFor': optimizeRoutingFor.value,
      if (origin != null) 'Origin': origin,
      if (originOptions != null) 'OriginOptions': originOptions,
      if (traffic != null) 'Traffic': traffic,
      if (travelMode != null) 'TravelMode': travelMode.value,
      if (travelModeOptions != null) 'TravelModeOptions': travelModeOptions,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/isolines',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CalculateIsolinesResponse(
      isolineGeometryFormat: GeometryFormat.fromString(
          ($json['IsolineGeometryFormat'] as String?) ?? ''),
      isolines: (($json['Isolines'] as List?) ?? const [])
          .nonNulls
          .map((e) => Isoline.fromJson(e as Map<String, dynamic>))
          .toList(),
      arrivalTime: $json['ArrivalTime'] as String?,
      departureTime: $json['DepartureTime'] as String?,
      snappedDestination: ($json['SnappedDestination'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      snappedOrigin: ($json['SnappedOrigin'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      pricingBucket: _s.extractHeaderStringValue(
          response.headers, 'x-amz-geo-pricing-bucket')!,
    );
  }

  /// Use <code>CalculateRouteMatrix</code> to compute results for all pairs of
  /// Origins to Destinations. Each row corresponds to one entry in Origins.
  /// Each entry in the row corresponds to the route from that entry in Origins
  /// to an entry in Destinations positions.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route-matrix.html">Calculate
  /// route matrix</a> in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinations] :
  /// List of destinations for the route in World Geodetic System (WGS 84)
  /// format: \[longitude, latitude\].
  /// <note>
  /// Route calculations are billed for each origin and destination pair. If you
  /// use a large matrix of origins and destinations, your costs will increase
  /// accordingly. For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/routes-pricing.html">Routes
  /// pricing</a> in the <i>Amazon Location Service Developer Guide</i>.
  /// </note>
  /// The maximum number of destinations depends on the routing boundary
  /// configuration:
  ///
  /// <ul>
  /// <li>
  /// With <code>RoutingBoundary.Geometry</code> set: maximum 500 destinations
  /// </li>
  /// <li>
  /// With <code>RoutingBoundary.Unbounded</code> set to <code>true</code>:
  /// maximum 100 destinations
  /// </li>
  /// <li>
  /// For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>:
  /// maximum 350 destinations
  /// </li>
  /// </ul>
  /// The total matrix size (origins × destinations) must not exceed:
  ///
  /// <ul>
  /// <li>
  /// With <code>RoutingBoundary.Geometry</code>: 160,000
  /// </li>
  /// <li>
  /// With <code>RoutingBoundary.Unbounded</code>: 100
  /// </li>
  /// <li>
  /// For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>:
  /// 122,500
  /// </li>
  /// </ul>
  ///
  /// Parameter [origins] :
  /// List of origins for the route in World Geodetic System (WGS 84) format:
  /// \[longitude, latitude\].
  /// <note>
  /// Route calculations are billed for each origin and destination pair. Using
  /// a large amount of Origins in a request can lead you to incur unexpected
  /// charges. For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/routes-pricing.html">Routes
  /// pricing</a> in the <i>Amazon Location Service Developer Guide</i>.
  /// </note>
  /// The maximum number of origins depends on the routing boundary
  /// configuration:
  ///
  /// <ul>
  /// <li>
  /// With <code>RoutingBoundary.Geometry</code> set: maximum 500 origins
  /// </li>
  /// <li>
  /// With <code>RoutingBoundary.Unbounded</code> set to <code>true</code>:
  /// maximum 15 origins
  /// </li>
  /// <li>
  /// For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>:
  /// maximum 350 origins
  /// </li>
  /// </ul>
  /// The total matrix size (origins × destinations) must not exceed:
  ///
  /// <ul>
  /// <li>
  /// With <code>RoutingBoundary.Geometry</code>: 160,000
  /// </li>
  /// <li>
  /// With <code>RoutingBoundary.Unbounded</code>: 100
  /// </li>
  /// <li>
  /// For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>:
  /// 122,500
  /// </li>
  /// </ul>
  ///
  /// Parameter [allow] :
  /// Features that are allowed while calculating a route.
  ///
  /// Parameter [avoid] :
  /// Features that are avoided while calculating a route. Avoidance is on a
  /// best-case basis. If an avoidance can't be satisfied for a particular case,
  /// it violates the avoidance and the returned response produces a notice for
  /// the violation. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only <code>TollRoads</code>, <code>Ferries</code>, and
  /// <code>ControlledAccessHighways</code>.
  ///
  /// Parameter [departNow] :
  /// Uses the current time as the time of departure.
  ///
  /// Parameter [departureTime] :
  /// Time of departure from the origin.
  ///
  /// Time format:<code>YYYY-MM-DDThh:mm:ss.sssZ |
  /// YYYY-MM-DDThh:mm:ss.sss+hh:mm</code>
  ///
  /// Examples:
  ///
  /// <code>2020-04-22T17:57:24Z</code>
  ///
  /// <code>2020-04-22T17:57:24+02:00</code>
  ///
  /// Parameter [exclude] :
  /// Features to be strictly excluded while calculating the route. Not
  /// supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Parameter [key] :
  /// Optional: The API key to be used for authorization. Either an API key or
  /// valid SigV4 signature must be provided when making a request.
  ///
  /// Parameter [optimizeRoutingFor] :
  /// Controls the trade-off between finding the shortest travel time
  /// (<code>FastestRoute</code>) and the shortest distance
  /// (<code>ShortestRoute</code>) when calculating reachable areas.
  ///
  /// Default value: <code>FastestRoute</code>
  ///
  /// Parameter [routingBoundary] :
  /// Boundary within which the matrix is to be calculated. All data, origins
  /// and destinations outside the boundary are considered invalid. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only <code>Unbounded</code> set to <code>true</code>.
  ///
  /// Default value: <code>Unbounded set to true</code>
  /// <note>
  /// When <code>AutoCircle</code> is set in the request, the response routing
  /// boundary will return <code>Circle</code> derived from the
  /// <code>AutoCircle</code> settings.
  /// </note>
  ///
  /// Parameter [traffic] :
  /// Traffic related options. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Parameter [travelMode] :
  /// Specifies the mode of transport when calculating a route. Used in
  /// estimating the speed of travel and road compatibility. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only <code>Car</code>, <code>Pedestrian</code>, and
  /// <code>Scooter</code>.
  ///
  /// Default value: <code>Car</code>
  ///
  /// Parameter [travelModeOptions] :
  /// Travel mode related options for the provided travel mode. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  Future<CalculateRouteMatrixResponse> calculateRouteMatrix({
    required List<RouteMatrixDestination> destinations,
    required List<RouteMatrixOrigin> origins,
    RouteMatrixAllowOptions? allow,
    RouteMatrixAvoidanceOptions? avoid,
    bool? departNow,
    String? departureTime,
    RouteMatrixExclusionOptions? exclude,
    String? key,
    RoutingObjective? optimizeRoutingFor,
    RouteMatrixBoundary? routingBoundary,
    RouteMatrixTrafficOptions? traffic,
    RouteMatrixTravelMode? travelMode,
    RouteMatrixTravelModeOptions? travelModeOptions,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'Destinations': destinations,
      'Origins': origins,
      if (allow != null) 'Allow': allow,
      if (avoid != null) 'Avoid': avoid,
      if (departNow != null) 'DepartNow': departNow,
      if (departureTime != null) 'DepartureTime': departureTime,
      if (exclude != null) 'Exclude': exclude,
      if (optimizeRoutingFor != null)
        'OptimizeRoutingFor': optimizeRoutingFor.value,
      if (routingBoundary != null) 'RoutingBoundary': routingBoundary,
      if (traffic != null) 'Traffic': traffic,
      if (travelMode != null) 'TravelMode': travelMode.value,
      if (travelModeOptions != null) 'TravelModeOptions': travelModeOptions,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/route-matrix',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CalculateRouteMatrixResponse(
      errorCount: ($json['ErrorCount'] as int?) ?? 0,
      routeMatrix: (($json['RouteMatrix'] as List?) ?? const [])
          .nonNulls
          .map((e) => (e as List)
              .nonNulls
              .map((e) => RouteMatrixEntry.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      routingBoundary: RouteMatrixBoundary.fromJson(
          ($json['RoutingBoundary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      pricingBucket: _s.extractHeaderStringValue(
          response.headers, 'x-amz-geo-pricing-bucket')!,
    );
  }

  /// <code>CalculateRoutes</code> computes routes given the following required
  /// parameters: <code>Origin</code> and <code>Destination</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-routes.html">Calculate
  /// routes</a> in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destination] :
  /// The final position for the route. In the World Geodetic System (WGS 84)
  /// format: <code>\[longitude, latitude\]</code>.
  ///
  /// Parameter [origin] :
  /// The start position for the route in World Geodetic System (WGS 84) format:
  /// \[longitude, latitude\].
  ///
  /// Parameter [allow] :
  /// Features that are allowed while calculating a route. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Parameter [arrivalTime] :
  /// Time of arrival at the destination. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Time format:<code>YYYY-MM-DDThh:mm:ss.sssZ |
  /// YYYY-MM-DDThh:mm:ss.sss+hh:mm</code>
  ///
  /// Examples:
  ///
  /// <code>2020-04-22T17:57:24Z</code>
  ///
  /// <code>2020-04-22T17:57:24+02:00</code>
  ///
  /// Parameter [avoid] :
  /// Features that are avoided while calculating a route. Avoidance is on a
  /// best-case basis. If an avoidance can't be satisfied for a particular case,
  /// it violates the avoidance and the returned response produces a notice for
  /// the violation. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only <code>ControlledAccessHighways</code>,
  /// <code>Ferries</code>, and <code>TollRoads</code>
  ///
  /// Parameter [departNow] :
  /// Uses the current time as the time of departure.
  ///
  /// Parameter [departureTime] :
  /// Time of departure from the origin.
  ///
  /// Time format:<code>YYYY-MM-DDThh:mm:ss.sssZ |
  /// YYYY-MM-DDThh:mm:ss.sss+hh:mm</code>
  ///
  /// Examples:
  ///
  /// <code>2020-04-22T17:57:24Z</code>
  ///
  /// <code>2020-04-22T17:57:24+02:00</code>
  ///
  /// Parameter [destinationOptions] :
  /// Destination related options. Not supported in <code>ap-southeast-1</code>
  /// and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Parameter [driver] :
  /// Driver related options. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Parameter [exclude] :
  /// Features to be strictly excluded while calculating the route. Not
  /// supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Parameter [instructionsMeasurementSystem] :
  /// Measurement system to be used for instructions within steps in the
  /// response.
  ///
  /// Parameter [key] :
  /// Optional: The API key to be used for authorization. Either an API key or
  /// valid SigV4 signature must be provided when making a request.
  ///
  /// Parameter [languages] :
  /// List of languages for instructions within steps in the response. Not
  /// supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  /// <note>
  /// Instructions in the requested language are returned only if they are
  /// available.
  /// </note>
  ///
  /// Parameter [legAdditionalFeatures] :
  /// A list of optional additional parameters such as timezone that can be
  /// requested for each result. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only <code>PassThroughWaypoints</code>,
  /// <code>Summary</code>, and <code>TravelStepInstructions</code>
  ///
  /// <ul>
  /// <li>
  /// <code>Elevation</code>: Retrieves the elevation information for each
  /// location.
  /// </li>
  /// <li>
  /// <code>Incidents</code>: Provides information on traffic incidents along
  /// the route.
  /// </li>
  /// <li>
  /// <code>PassThroughWaypoints</code>: Indicates waypoints that are passed
  /// through without stopping.
  /// </li>
  /// <li>
  /// <code>Summary</code>: Returns a summary of the route, including distance
  /// and duration.
  /// </li>
  /// <li>
  /// <code>Tolls</code>: Supplies toll cost information along the route.
  /// </li>
  /// <li>
  /// <code>TravelStepInstructions</code>: Provides step-by-step instructions
  /// for travel along the route.
  /// </li>
  /// <li>
  /// <code>TruckRoadTypes</code>: Returns information about road types suitable
  /// for trucks.
  /// </li>
  /// <li>
  /// <code>TypicalDuration</code>: Gives typical travel duration based on
  /// historical data.
  /// </li>
  /// <li>
  /// <code>Zones</code>: Specifies the time zone information for each waypoint.
  /// </li>
  /// </ul>
  ///
  /// Parameter [legGeometryFormat] :
  /// Specifies the format of the geometry returned for each leg of the route.
  /// You can choose between two different geometry encoding formats.
  ///
  /// <code>FlexiblePolyline</code>: A compact and precise encoding format for
  /// the leg geometry. For more information on the format, see the GitHub
  /// repository for <a
  /// href="https://github.com/aws-geospatial/polyline">https://github.com/aws-geospatial/polyline</a>.
  ///
  /// <code>Simple</code>: A less compact encoding, which is easier to decode
  /// but may be less precise and result in larger payloads.
  ///
  /// Parameter [maxAlternatives] :
  /// Maximum number of alternative routes to be provided in the response, if
  /// available. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only up to 3 alternative routes.
  ///
  /// Parameter [optimizeRoutingFor] :
  /// Controls the trade-off between achieving the shortest travel time
  /// (<code>FastestRoute</code>) and achieving the shortest physical distance
  /// ((<code>ShortestRoute</code>) when calculating each route in the matrix.
  ///
  /// Default value: <code>FastestRoute</code>
  ///
  /// Parameter [originOptions] :
  /// Specifies how the origin point should be matched to the road network and
  /// any routing constraints that apply when the traveler is departing the
  /// origin. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Parameter [spanAdditionalFeatures] :
  /// A list of optional features such as <code>SpeedLimit</code> that can be
  /// requested for a Span. A span is a section of a Leg for which the requested
  /// features have the same values. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Parameter [tolls] :
  /// Toll related options. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Parameter [traffic] :
  /// Traffic related options. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Parameter [travelMode] :
  /// Specifies the mode of transport when calculating a route. Used in
  /// estimating the speed of travel and road compatibility. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only <code>Car</code>, <code>Pedestrian</code>, and
  /// <code>Scooter</code> values.
  ///
  /// Default value: <code>Car</code>
  ///
  /// Parameter [travelModeOptions] :
  /// Travel mode related options for the provided travel mode. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only <code>Car</code> and <code>Pedestrian</code> travel
  /// mode options.
  ///
  /// Parameter [travelStepType] :
  /// Type of step returned by the response. <code>Default</code> provides basic
  /// steps intended for web based applications. <code>TurnByTurn</code>
  /// provides detailed instructions with more granularity intended for a turn
  /// based navigation system. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions <code>Default</code> does not return any steps.
  ///
  /// Parameter [waypoints] :
  /// List of waypoints between the Origin and Destination. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions max length is <code>100</code>.
  ///
  /// Max length: <code>23</code>
  Future<CalculateRoutesResponse> calculateRoutes({
    required List<double> destination,
    required List<double> origin,
    RouteAllowOptions? allow,
    String? arrivalTime,
    RouteAvoidanceOptions? avoid,
    bool? departNow,
    String? departureTime,
    RouteDestinationOptions? destinationOptions,
    RouteDriverOptions? driver,
    RouteExclusionOptions? exclude,
    MeasurementSystem? instructionsMeasurementSystem,
    String? key,
    List<String>? languages,
    List<RouteLegAdditionalFeature>? legAdditionalFeatures,
    GeometryFormat? legGeometryFormat,
    int? maxAlternatives,
    RoutingObjective? optimizeRoutingFor,
    RouteOriginOptions? originOptions,
    List<RouteSpanAdditionalFeature>? spanAdditionalFeatures,
    RouteTollOptions? tolls,
    RouteTrafficOptions? traffic,
    RouteTravelMode? travelMode,
    RouteTravelModeOptions? travelModeOptions,
    RouteTravelStepType? travelStepType,
    List<RouteWaypoint>? waypoints,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'Destination': destination,
      'Origin': origin,
      if (allow != null) 'Allow': allow,
      if (arrivalTime != null) 'ArrivalTime': arrivalTime,
      if (avoid != null) 'Avoid': avoid,
      if (departNow != null) 'DepartNow': departNow,
      if (departureTime != null) 'DepartureTime': departureTime,
      if (destinationOptions != null) 'DestinationOptions': destinationOptions,
      if (driver != null) 'Driver': driver,
      if (exclude != null) 'Exclude': exclude,
      if (instructionsMeasurementSystem != null)
        'InstructionsMeasurementSystem': instructionsMeasurementSystem.value,
      if (languages != null) 'Languages': languages,
      if (legAdditionalFeatures != null)
        'LegAdditionalFeatures':
            legAdditionalFeatures.map((e) => e.value).toList(),
      if (legGeometryFormat != null)
        'LegGeometryFormat': legGeometryFormat.value,
      if (maxAlternatives != null) 'MaxAlternatives': maxAlternatives,
      if (optimizeRoutingFor != null)
        'OptimizeRoutingFor': optimizeRoutingFor.value,
      if (originOptions != null) 'OriginOptions': originOptions,
      if (spanAdditionalFeatures != null)
        'SpanAdditionalFeatures':
            spanAdditionalFeatures.map((e) => e.value).toList(),
      if (tolls != null) 'Tolls': tolls,
      if (traffic != null) 'Traffic': traffic,
      if (travelMode != null) 'TravelMode': travelMode.value,
      if (travelModeOptions != null) 'TravelModeOptions': travelModeOptions,
      if (travelStepType != null) 'TravelStepType': travelStepType.value,
      if (waypoints != null) 'Waypoints': waypoints,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/routes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CalculateRoutesResponse(
      legGeometryFormat: GeometryFormat.fromString(
          ($json['LegGeometryFormat'] as String?) ?? ''),
      notices: (($json['Notices'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteResponseNotice.fromJson(e as Map<String, dynamic>))
          .toList(),
      routes: (($json['Routes'] as List?) ?? const [])
          .nonNulls
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      pricingBucket: _s.extractHeaderStringValue(
          response.headers, 'x-amz-geo-pricing-bucket')!,
    );
  }

  /// <code>OptimizeWaypoints</code> calculates the optimal order to travel
  /// between a set of waypoints to minimize either the travel time or the
  /// distance travelled during the journey, based on road network restrictions
  /// and the traffic pattern data.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/actions-optimize-waypoints.html">Optimize
  /// waypoints</a> in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [origin] :
  /// The start position for the route in World Geodetic System (WGS 84) format:
  /// \[longitude, latitude\].
  ///
  /// Parameter [avoid] :
  /// Features that are avoided. Avoidance is on a best-case basis. If an
  /// avoidance can't be satisfied for a particular case, this setting is
  /// ignored.
  ///
  /// Parameter [clustering] :
  /// Clustering allows you to specify how nearby waypoints can be clustered to
  /// improve the optimized sequence.
  ///
  /// Parameter [departureTime] :
  /// Departure time from the waypoint.
  ///
  /// Time format:<code>YYYY-MM-DDThh:mm:ss.sssZ |
  /// YYYY-MM-DDThh:mm:ss.sss+hh:mm</code>
  ///
  /// Examples:
  ///
  /// <code>2020-04-22T17:57:24Z</code>
  ///
  /// <code>2020-04-22T17:57:24+02:00</code>
  ///
  /// Parameter [destination] :
  /// The final position for the route in the World Geodetic System (WGS 84)
  /// format: <code>\[longitude, latitude\]</code>.
  ///
  /// Parameter [destinationOptions] :
  /// Destination related options.
  ///
  /// Parameter [driver] :
  /// Driver related options.
  ///
  /// Parameter [exclude] :
  /// Features to be strictly excluded while calculating the route.
  ///
  /// Parameter [key] :
  /// Optional: The API key to be used for authorization. Either an API key or
  /// valid SigV4 signature must be provided when making a request.
  ///
  /// Parameter [optimizeSequencingFor] :
  /// Specifies the optimization criteria for the calculated sequence.
  ///
  /// Default value: <code>FastestRoute</code>.
  ///
  /// Parameter [originOptions] :
  /// Origin related options.
  ///
  /// Parameter [traffic] :
  /// Traffic-related options.
  ///
  /// Parameter [travelMode] :
  /// Specifies the mode of transport when calculating a route. Used in
  /// estimating the speed of travel and road compatibility.
  ///
  /// Default value: <code>Car</code>
  ///
  /// Parameter [travelModeOptions] :
  /// Travel mode related options for the provided travel mode.
  ///
  /// Parameter [waypoints] :
  /// List of waypoints between the <code>Origin</code> and
  /// <code>Destination</code>, in World Geodetic System (WGS 84) format:
  /// \[longitude, latitude\].
  ///
  /// The maximum number of waypoints allowed per request:
  ///
  /// <ul>
  /// <li>
  /// Maximum 50 waypoints per request
  /// </li>
  /// <li>
  /// Maximum 20 waypoints when using constraints (<code>AccessHours</code>,
  /// <code>AppointmentTime</code>, <code>ServiceDuration</code>,
  /// <code>Heading</code>, <code>SideOfStreet</code>, <code>Before</code>)
  /// </li>
  /// </ul>
  Future<OptimizeWaypointsResponse> optimizeWaypoints({
    required List<double> origin,
    WaypointOptimizationAvoidanceOptions? avoid,
    WaypointOptimizationClusteringOptions? clustering,
    String? departureTime,
    List<double>? destination,
    WaypointOptimizationDestinationOptions? destinationOptions,
    WaypointOptimizationDriverOptions? driver,
    WaypointOptimizationExclusionOptions? exclude,
    String? key,
    WaypointOptimizationSequencingObjective? optimizeSequencingFor,
    WaypointOptimizationOriginOptions? originOptions,
    WaypointOptimizationTrafficOptions? traffic,
    WaypointOptimizationTravelMode? travelMode,
    WaypointOptimizationTravelModeOptions? travelModeOptions,
    List<WaypointOptimizationWaypoint>? waypoints,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'Origin': origin,
      if (avoid != null) 'Avoid': avoid,
      if (clustering != null) 'Clustering': clustering,
      if (departureTime != null) 'DepartureTime': departureTime,
      if (destination != null) 'Destination': destination,
      if (destinationOptions != null) 'DestinationOptions': destinationOptions,
      if (driver != null) 'Driver': driver,
      if (exclude != null) 'Exclude': exclude,
      if (optimizeSequencingFor != null)
        'OptimizeSequencingFor': optimizeSequencingFor.value,
      if (originOptions != null) 'OriginOptions': originOptions,
      if (traffic != null) 'Traffic': traffic,
      if (travelMode != null) 'TravelMode': travelMode.value,
      if (travelModeOptions != null) 'TravelModeOptions': travelModeOptions,
      if (waypoints != null) 'Waypoints': waypoints,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/optimize-waypoints',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return OptimizeWaypointsResponse(
      connections: (($json['Connections'] as List?) ?? const [])
          .nonNulls
          .map((e) => WaypointOptimizationConnection.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      distance: ($json['Distance'] as int?) ?? 0,
      duration: ($json['Duration'] as int?) ?? 0,
      impedingWaypoints: (($json['ImpedingWaypoints'] as List?) ?? const [])
          .nonNulls
          .map((e) => WaypointOptimizationImpedingWaypoint.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      optimizedWaypoints: (($json['OptimizedWaypoints'] as List?) ?? const [])
          .nonNulls
          .map((e) => WaypointOptimizationOptimizedWaypoint.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      timeBreakdown: WaypointOptimizationTimeBreakdown.fromJson(
          ($json['TimeBreakdown'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      pricingBucket: _s.extractHeaderStringValue(
          response.headers, 'x-amz-geo-pricing-bucket')!,
    );
  }

  /// <code>SnapToRoads</code> matches GPS trace to roads most likely traveled
  /// on.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-roads.html">Snap
  /// to Roads</a> in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [tracePoints] :
  /// List of trace points to be snapped onto the road network.
  ///
  /// Parameter [key] :
  /// Optional: The API key to be used for authorization. Either an API key or
  /// valid SigV4 signature must be provided when making a request.
  ///
  /// Parameter [snapRadius] :
  /// The radius around the provided tracepoint that is considered for snapping.
  ///
  /// <b>Unit</b>: <code>meters</code>
  ///
  /// Default value: <code>300</code>
  ///
  /// Parameter [snappedGeometryFormat] :
  /// Chooses what the returned SnappedGeometry format should be.
  ///
  /// Default value: <code>FlexiblePolyline</code>
  ///
  /// Parameter [travelMode] :
  /// Specifies the mode of transport when calculating a route. Used in
  /// estimating the speed of travel and road compatibility.
  ///
  /// Default value: <code>Car</code>
  ///
  /// Parameter [travelModeOptions] :
  /// Travel mode related options for the provided travel mode.
  Future<SnapToRoadsResponse> snapToRoads({
    required List<RoadSnapTracePoint> tracePoints,
    String? key,
    int? snapRadius,
    GeometryFormat? snappedGeometryFormat,
    RoadSnapTravelMode? travelMode,
    RoadSnapTravelModeOptions? travelModeOptions,
  }) async {
    _s.validateNumRange(
      'snapRadius',
      snapRadius,
      0,
      4294967295,
    );
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'TracePoints': tracePoints,
      if (snapRadius != null) 'SnapRadius': snapRadius,
      if (snappedGeometryFormat != null)
        'SnappedGeometryFormat': snappedGeometryFormat.value,
      if (travelMode != null) 'TravelMode': travelMode.value,
      if (travelModeOptions != null) 'TravelModeOptions': travelModeOptions,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/snap-to-roads',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return SnapToRoadsResponse(
      notices: (($json['Notices'] as List?) ?? const [])
          .nonNulls
          .map((e) => RoadSnapNotice.fromJson(e as Map<String, dynamic>))
          .toList(),
      snappedGeometryFormat: GeometryFormat.fromString(
          ($json['SnappedGeometryFormat'] as String?) ?? ''),
      snappedTracePoints: (($json['SnappedTracePoints'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RoadSnapSnappedTracePoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      snappedGeometry: $json['SnappedGeometry'] != null
          ? RoadSnapSnappedGeometry.fromJson(
              $json['SnappedGeometry'] as Map<String, dynamic>)
          : null,
      pricingBucket: _s.extractHeaderStringValue(
          response.headers, 'x-amz-geo-pricing-bucket')!,
    );
  }
}

/// @nodoc
class CalculateIsolinesResponse {
  /// The format of the returned geometries, matching the format specified in the
  /// request. Either <code> FlexiblePolyline</code> for compact encoding or
  /// <code>Simple</code> for GeoJSON-compatible coordinates.
  ///
  /// Default value:<code>FlexiblePolyline</code>
  final GeometryFormat isolineGeometryFormat;

  /// Reachable areas, or isolines, for each threshold specified in the request.
  final List<Isoline> isolines;

  /// The pricing bucket applied to this calculation. Different buckets apply
  /// based on the travel mode and thresholds used.
  final String pricingBucket;

  /// Time of arrival at the destination, used for traffic calculations. This
  /// attribute is returned only if the <code>Destination</code> and
  /// <code>ArrivalTime</code> attributes were provided in the request.
  ///
  /// Time format: <code>YYYY-MM-DDThh:mm:ss.sssZ |
  /// YYYY-MM-DDThh:mm:ss.sss+hh:mm</code>
  ///
  /// Examples:
  ///
  /// <code>2020-04-22T17:57:24Z</code>
  ///
  /// <code>2020-04-22T17:57:24+02:00</code>
  final String? arrivalTime;

  /// Time of departure from the origin, used for traffic calculations. This
  /// attribute is returned when <code>Origin</code> was provided in the request
  /// and either a specific departure time was requested
  /// (<code>DepartureTime</code>) or <code>DepartNow</code> was set to true.
  ///
  /// Time format: <code>YYYY-MM-DDThh:mm:ss.sssZ |
  /// YYYY-MM-DDThh:mm:ss.sss+hh:mm</code>
  ///
  /// Examples:
  ///
  /// <code>2020-04-22T17:57:24Z</code>
  ///
  /// <code>2020-04-22T17:57:24+02:00</code>
  final String? departureTime;

  /// The actual point on the road network used for calculations, which may differ
  /// from the requested destination if <code>Destination</code> was not directly
  /// on a road.
  final List<double>? snappedDestination;

  /// The actual point on the road network used for calculations, which may differ
  /// from the requested origin if <code>Origin</code> was not directly on a road.
  final List<double>? snappedOrigin;

  CalculateIsolinesResponse({
    required this.isolineGeometryFormat,
    required this.isolines,
    required this.pricingBucket,
    this.arrivalTime,
    this.departureTime,
    this.snappedDestination,
    this.snappedOrigin,
  });

  Map<String, dynamic> toJson() {
    final isolineGeometryFormat = this.isolineGeometryFormat;
    final isolines = this.isolines;
    final pricingBucket = this.pricingBucket;
    final arrivalTime = this.arrivalTime;
    final departureTime = this.departureTime;
    final snappedDestination = this.snappedDestination;
    final snappedOrigin = this.snappedOrigin;
    return {
      'IsolineGeometryFormat': isolineGeometryFormat.value,
      'Isolines': isolines,
      if (arrivalTime != null) 'ArrivalTime': arrivalTime,
      if (departureTime != null) 'DepartureTime': departureTime,
      if (snappedDestination != null) 'SnappedDestination': snappedDestination,
      if (snappedOrigin != null) 'SnappedOrigin': snappedOrigin,
    };
  }
}

/// @nodoc
class CalculateRouteMatrixResponse {
  /// The count of error results in the route matrix. If this number is 0, all
  /// routes were calculated successfully.
  final int errorCount;

  /// The pricing bucket for which the query is charged at.
  final String pricingBucket;

  /// The calculated route matrix containing the results for all pairs of Origins
  /// to Destination positions. Each row corresponds to one entry in Origins. Each
  /// entry in the row corresponds to the route from that entry in Origins to an
  /// entry in Destination positions.
  final List<List<RouteMatrixEntry>> routeMatrix;

  /// Boundary within which the matrix is to be calculated. All data, origins and
  /// destinations outside the boundary are considered invalid.
  /// <note>
  /// When <code>AutoCircle</code> is set in the request, the response routing
  /// boundary will return <code>Circle</code> derived from the
  /// <code>AutoCircle</code> settings.
  /// </note>
  final RouteMatrixBoundary routingBoundary;

  CalculateRouteMatrixResponse({
    required this.errorCount,
    required this.pricingBucket,
    required this.routeMatrix,
    required this.routingBoundary,
  });

  Map<String, dynamic> toJson() {
    final errorCount = this.errorCount;
    final pricingBucket = this.pricingBucket;
    final routeMatrix = this.routeMatrix;
    final routingBoundary = this.routingBoundary;
    return {
      'ErrorCount': errorCount,
      'RouteMatrix': routeMatrix,
      'RoutingBoundary': routingBoundary,
    };
  }
}

/// @nodoc
class CalculateRoutesResponse {
  /// Specifies the format of the geometry returned for each leg of the route.
  final GeometryFormat legGeometryFormat;

  /// Notices are additional information returned that indicate issues that
  /// occurred during route calculation. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<RouteResponseNotice> notices;

  /// The pricing bucket for which the query is charged at.
  final String pricingBucket;

  /// The path from the origin to the destination.
  final List<Route> routes;

  CalculateRoutesResponse({
    required this.legGeometryFormat,
    required this.notices,
    required this.pricingBucket,
    required this.routes,
  });

  Map<String, dynamic> toJson() {
    final legGeometryFormat = this.legGeometryFormat;
    final notices = this.notices;
    final pricingBucket = this.pricingBucket;
    final routes = this.routes;
    return {
      'LegGeometryFormat': legGeometryFormat.value,
      'Notices': notices,
      'Routes': routes,
    };
  }
}

/// @nodoc
class OptimizeWaypointsResponse {
  /// Details about the connection from one waypoint to the next, within the
  /// optimized sequence.
  final List<WaypointOptimizationConnection> connections;

  /// Overall distance to travel the whole sequence.
  final int distance;

  /// Overall duration to travel the whole sequence.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Returns waypoints that caused the optimization problem to fail, and the
  /// constraints that were unsatisfied leading to the failure.
  final List<WaypointOptimizationImpedingWaypoint> impedingWaypoints;

  /// Waypoints in the order of the optimized sequence.
  final List<WaypointOptimizationOptimizedWaypoint> optimizedWaypoints;

  /// The pricing bucket for which the query is charged at.
  final String pricingBucket;

  /// Time breakdown for the sequence.
  final WaypointOptimizationTimeBreakdown timeBreakdown;

  OptimizeWaypointsResponse({
    required this.connections,
    required this.distance,
    required this.duration,
    required this.impedingWaypoints,
    required this.optimizedWaypoints,
    required this.pricingBucket,
    required this.timeBreakdown,
  });

  Map<String, dynamic> toJson() {
    final connections = this.connections;
    final distance = this.distance;
    final duration = this.duration;
    final impedingWaypoints = this.impedingWaypoints;
    final optimizedWaypoints = this.optimizedWaypoints;
    final pricingBucket = this.pricingBucket;
    final timeBreakdown = this.timeBreakdown;
    return {
      'Connections': connections,
      'Distance': distance,
      'Duration': duration,
      'ImpedingWaypoints': impedingWaypoints,
      'OptimizedWaypoints': optimizedWaypoints,
      'TimeBreakdown': timeBreakdown,
    };
  }
}

/// @nodoc
class SnapToRoadsResponse {
  /// Notices are additional information returned that indicate issues that
  /// occurred during route calculation.
  final List<RoadSnapNotice> notices;

  /// The pricing bucket for which the query is charged at.
  final String pricingBucket;

  /// Specifies the format of the geometry returned for each leg of the route.
  final GeometryFormat snappedGeometryFormat;

  /// The trace points snapped onto the road network.
  final List<RoadSnapSnappedTracePoint> snappedTracePoints;

  /// The interpolated geometry for the snapped route onto the road network.
  final RoadSnapSnappedGeometry? snappedGeometry;

  SnapToRoadsResponse({
    required this.notices,
    required this.pricingBucket,
    required this.snappedGeometryFormat,
    required this.snappedTracePoints,
    this.snappedGeometry,
  });

  Map<String, dynamic> toJson() {
    final notices = this.notices;
    final pricingBucket = this.pricingBucket;
    final snappedGeometryFormat = this.snappedGeometryFormat;
    final snappedTracePoints = this.snappedTracePoints;
    final snappedGeometry = this.snappedGeometry;
    return {
      'Notices': notices,
      'SnappedGeometryFormat': snappedGeometryFormat.value,
      'SnappedTracePoints': snappedTracePoints,
      if (snappedGeometry != null) 'SnappedGeometry': snappedGeometry,
    };
  }
}

/// Interpolated geometry for the snapped route that is overlay-able onto a map.
///
/// @nodoc
class RoadSnapSnappedGeometry {
  /// An ordered list of positions used to plot a route on a map.
  /// <note>
  /// LineString and Polyline are mutually exclusive properties.
  /// </note>
  final List<List<double>>? lineString;

  /// An ordered list of positions used to plot a route on a map in a lossy
  /// compression format.
  /// <note>
  /// LineString and Polyline are mutually exclusive properties.
  /// </note>
  final String? polyline;

  RoadSnapSnappedGeometry({
    this.lineString,
    this.polyline,
  });

  factory RoadSnapSnappedGeometry.fromJson(Map<String, dynamic> json) {
    return RoadSnapSnappedGeometry(
      lineString: (json['LineString'] as List?)
          ?.nonNulls
          .map((e) => (e as List).nonNulls.map((e) => e as double).toList())
          .toList(),
      polyline: json['Polyline'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lineString = this.lineString;
    final polyline = this.polyline;
    return {
      if (lineString != null) 'LineString': lineString,
      if (polyline != null) 'Polyline': polyline,
    };
  }
}

/// @nodoc
class GeometryFormat {
  static const flexiblePolyline = GeometryFormat._('FlexiblePolyline');
  static const simple = GeometryFormat._('Simple');

  final String value;

  const GeometryFormat._(this.value);

  static const values = [flexiblePolyline, simple];

  static GeometryFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GeometryFormat._(value));

  @override
  bool operator ==(other) => other is GeometryFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// TracePoints snapped onto the road network.
///
/// @nodoc
class RoadSnapSnappedTracePoint {
  /// Confidence value for the correctness of this point match.
  final double confidence;

  /// Position of the TracePoint provided within the request, at the same index.
  final List<double> originalPosition;

  /// Snapped position of the TracePoint provided within the request, at the same
  /// index.
  final List<double> snappedPosition;

  RoadSnapSnappedTracePoint({
    required this.confidence,
    required this.originalPosition,
    required this.snappedPosition,
  });

  factory RoadSnapSnappedTracePoint.fromJson(Map<String, dynamic> json) {
    return RoadSnapSnappedTracePoint(
      confidence: (json['Confidence'] as double?) ?? 0,
      originalPosition: ((json['OriginalPosition'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      snappedPosition: ((json['SnappedPosition'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final originalPosition = this.originalPosition;
    final snappedPosition = this.snappedPosition;
    return {
      'Confidence': confidence,
      'OriginalPosition': originalPosition,
      'SnappedPosition': snappedPosition,
    };
  }
}

/// Notices provide information around factors that may have influenced snapping
/// in a manner atypical to the standard use cases.
///
/// @nodoc
class RoadSnapNotice {
  /// Code corresponding to the issue.
  final RoadSnapNoticeCode code;

  /// The notice title.
  final String title;

  /// TracePoint indices for which the provided notice code corresponds to.
  final List<int> tracePointIndexes;

  RoadSnapNotice({
    required this.code,
    required this.title,
    required this.tracePointIndexes,
  });

  factory RoadSnapNotice.fromJson(Map<String, dynamic> json) {
    return RoadSnapNotice(
      code: RoadSnapNoticeCode.fromString((json['Code'] as String?) ?? ''),
      title: (json['Title'] as String?) ?? '',
      tracePointIndexes: ((json['TracePointIndexes'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final title = this.title;
    final tracePointIndexes = this.tracePointIndexes;
    return {
      'Code': code.value,
      'Title': title,
      'TracePointIndexes': tracePointIndexes,
    };
  }
}

/// @nodoc
class RoadSnapNoticeCode {
  static const tracePointsHeadingIgnored =
      RoadSnapNoticeCode._('TracePointsHeadingIgnored');
  static const tracePointsIgnored = RoadSnapNoticeCode._('TracePointsIgnored');
  static const tracePointsMovedByLargeDistance =
      RoadSnapNoticeCode._('TracePointsMovedByLargeDistance');
  static const tracePointsNotMatched =
      RoadSnapNoticeCode._('TracePointsNotMatched');
  static const tracePointsOutOfSequence =
      RoadSnapNoticeCode._('TracePointsOutOfSequence');
  static const tracePointsSpeedEstimated =
      RoadSnapNoticeCode._('TracePointsSpeedEstimated');
  static const tracePointsSpeedIgnored =
      RoadSnapNoticeCode._('TracePointsSpeedIgnored');

  final String value;

  const RoadSnapNoticeCode._(this.value);

  static const values = [
    tracePointsHeadingIgnored,
    tracePointsIgnored,
    tracePointsMovedByLargeDistance,
    tracePointsNotMatched,
    tracePointsOutOfSequence,
    tracePointsSpeedEstimated,
    tracePointsSpeedIgnored
  ];

  static RoadSnapNoticeCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RoadSnapNoticeCode._(value));

  @override
  bool operator ==(other) =>
      other is RoadSnapNoticeCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RoadSnapTravelMode {
  static const car = RoadSnapTravelMode._('Car');
  static const pedestrian = RoadSnapTravelMode._('Pedestrian');
  static const scooter = RoadSnapTravelMode._('Scooter');
  static const truck = RoadSnapTravelMode._('Truck');

  final String value;

  const RoadSnapTravelMode._(this.value);

  static const values = [car, pedestrian, scooter, truck];

  static RoadSnapTravelMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RoadSnapTravelMode._(value));

  @override
  bool operator ==(other) =>
      other is RoadSnapTravelMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Travel mode related options for the provided travel mode.
///
/// @nodoc
class RoadSnapTravelModeOptions {
  /// Travel mode options when the provided travel mode is <code>Truck</code>.
  final RoadSnapTruckOptions? truck;

  RoadSnapTravelModeOptions({
    this.truck,
  });

  Map<String, dynamic> toJson() {
    final truck = this.truck;
    return {
      if (truck != null) 'Truck': truck,
    };
  }
}

/// Travel mode options when the provided travel mode is <code>Truck</code>.
///
/// @nodoc
class RoadSnapTruckOptions {
  /// Gross weight of the vehicle including trailers, and goods at capacity.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? grossWeight;

  /// List of Hazardous cargos contained in the vehicle.
  final List<RoadSnapHazardousCargoType>? hazardousCargos;

  /// Height of the vehicle.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? height;

  /// Length of the vehicle.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? length;

  /// Trailer options corresponding to the vehicle.
  final RoadSnapTrailerOptions? trailer;

  /// The tunnel restriction code.
  ///
  /// Tunnel categories in this list indicate the restrictions which apply to
  /// certain tunnels in Great Britain. They relate to the types of dangerous
  /// goods that can be transported through them.
  ///
  /// <ul>
  /// <li>
  /// <i>Tunnel Category B</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Limited risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Few restrictions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category C</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Medium risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Some restrictions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category D</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: High risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Many restrictions occur
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category E</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Very high risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Restricted tunnel
  /// </li>
  /// </ul> </li>
  /// </ul>
  final String? tunnelRestrictionCode;

  /// Width of the vehicle in centimeters.
  final int? width;

  RoadSnapTruckOptions({
    this.grossWeight,
    this.hazardousCargos,
    this.height,
    this.length,
    this.trailer,
    this.tunnelRestrictionCode,
    this.width,
  });

  Map<String, dynamic> toJson() {
    final grossWeight = this.grossWeight;
    final hazardousCargos = this.hazardousCargos;
    final height = this.height;
    final length = this.length;
    final trailer = this.trailer;
    final tunnelRestrictionCode = this.tunnelRestrictionCode;
    final width = this.width;
    return {
      if (grossWeight != null) 'GrossWeight': grossWeight,
      if (hazardousCargos != null)
        'HazardousCargos': hazardousCargos.map((e) => e.value).toList(),
      if (height != null) 'Height': height,
      if (length != null) 'Length': length,
      if (trailer != null) 'Trailer': trailer,
      if (tunnelRestrictionCode != null)
        'TunnelRestrictionCode': tunnelRestrictionCode,
      if (width != null) 'Width': width,
    };
  }
}

/// Trailer options corresponding to the vehicle.
///
/// @nodoc
class RoadSnapTrailerOptions {
  /// Number of trailers attached to the vehicle.
  ///
  /// Default value: <code>0</code>
  final int? trailerCount;

  RoadSnapTrailerOptions({
    this.trailerCount,
  });

  Map<String, dynamic> toJson() {
    final trailerCount = this.trailerCount;
    return {
      if (trailerCount != null) 'TrailerCount': trailerCount,
    };
  }
}

/// @nodoc
class RoadSnapHazardousCargoType {
  static const combustible = RoadSnapHazardousCargoType._('Combustible');
  static const corrosive = RoadSnapHazardousCargoType._('Corrosive');
  static const explosive = RoadSnapHazardousCargoType._('Explosive');
  static const flammable = RoadSnapHazardousCargoType._('Flammable');
  static const gas = RoadSnapHazardousCargoType._('Gas');
  static const harmfulToWater = RoadSnapHazardousCargoType._('HarmfulToWater');
  static const organic = RoadSnapHazardousCargoType._('Organic');
  static const other = RoadSnapHazardousCargoType._('Other');
  static const poison = RoadSnapHazardousCargoType._('Poison');
  static const poisonousInhalation =
      RoadSnapHazardousCargoType._('PoisonousInhalation');
  static const radioactive = RoadSnapHazardousCargoType._('Radioactive');

  final String value;

  const RoadSnapHazardousCargoType._(this.value);

  static const values = [
    combustible,
    corrosive,
    explosive,
    flammable,
    gas,
    harmfulToWater,
    organic,
    other,
    poison,
    poisonousInhalation,
    radioactive
  ];

  static RoadSnapHazardousCargoType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RoadSnapHazardousCargoType._(value));

  @override
  bool operator ==(other) =>
      other is RoadSnapHazardousCargoType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// TracePoint indices for which the provided notice code corresponds to.
///
/// @nodoc
class RoadSnapTracePoint {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// GPS Heading at the position.
  final double? heading;

  /// Speed at the specified trace point .
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? speed;

  /// Timestamp of the event.
  final String? timestamp;

  RoadSnapTracePoint({
    required this.position,
    this.heading,
    this.speed,
    this.timestamp,
  });

  Map<String, dynamic> toJson() {
    final position = this.position;
    final heading = this.heading;
    final speed = this.speed;
    final timestamp = this.timestamp;
    return {
      'Position': position,
      if (heading != null) 'Heading': heading,
      if (speed != null) 'Speed': speed,
      if (timestamp != null) 'Timestamp': timestamp,
    };
  }
}

/// Time breakdown for the sequence.
///
/// @nodoc
class WaypointOptimizationTimeBreakdown {
  /// Resting phase of the cycle.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int restDuration;

  /// Service time spent at the destination. At an appointment, the service time
  /// should be the appointment duration.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int serviceDuration;

  /// Traveling phase of the cycle.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int travelDuration;

  /// Waiting phase of the cycle.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int waitDuration;

  WaypointOptimizationTimeBreakdown({
    required this.restDuration,
    required this.serviceDuration,
    required this.travelDuration,
    required this.waitDuration,
  });

  factory WaypointOptimizationTimeBreakdown.fromJson(
      Map<String, dynamic> json) {
    return WaypointOptimizationTimeBreakdown(
      restDuration: (json['RestDuration'] as int?) ?? 0,
      serviceDuration: (json['ServiceDuration'] as int?) ?? 0,
      travelDuration: (json['TravelDuration'] as int?) ?? 0,
      waitDuration: (json['WaitDuration'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final restDuration = this.restDuration;
    final serviceDuration = this.serviceDuration;
    final travelDuration = this.travelDuration;
    final waitDuration = this.waitDuration;
    return {
      'RestDuration': restDuration,
      'ServiceDuration': serviceDuration,
      'TravelDuration': travelDuration,
      'WaitDuration': waitDuration,
    };
  }
}

/// The optimized waypoint.
///
/// @nodoc
class WaypointOptimizationOptimizedWaypoint {
  /// Estimated time of departure from the origin.
  ///
  /// Time format:<code>YYYY-MM-DDThh:mm:ss.sssZ |
  /// YYYY-MM-DDThh:mm:ss.sss+hh:mm</code>
  ///
  /// Examples:
  ///
  /// <code>2020-04-22T17:57:24Z</code>
  ///
  /// <code>2020-04-22T17:57:24+02:00</code>
  final String departureTime;

  /// The waypoint Id.
  final String id;

  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// Estimated time of arrival at the destination.
  ///
  /// Time format:<code>YYYY-MM-DDThh:mm:ss.sssZ |
  /// YYYY-MM-DDThh:mm:ss.sss+hh:mm</code>
  ///
  /// Examples:
  ///
  /// <code>2020-04-22T17:57:24Z</code>
  ///
  /// <code>2020-04-22T17:57:24+02:00</code>
  final String? arrivalTime;

  /// Index of the cluster the waypoint is associated with. The index is included
  /// in the response only if clustering was performed while processing the
  /// request.
  final int? clusterIndex;

  WaypointOptimizationOptimizedWaypoint({
    required this.departureTime,
    required this.id,
    required this.position,
    this.arrivalTime,
    this.clusterIndex,
  });

  factory WaypointOptimizationOptimizedWaypoint.fromJson(
      Map<String, dynamic> json) {
    return WaypointOptimizationOptimizedWaypoint(
      departureTime: (json['DepartureTime'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      position: ((json['Position'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      arrivalTime: json['ArrivalTime'] as String?,
      clusterIndex: json['ClusterIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final departureTime = this.departureTime;
    final id = this.id;
    final position = this.position;
    final arrivalTime = this.arrivalTime;
    final clusterIndex = this.clusterIndex;
    return {
      'DepartureTime': departureTime,
      'Id': id,
      'Position': position,
      if (arrivalTime != null) 'ArrivalTime': arrivalTime,
      if (clusterIndex != null) 'ClusterIndex': clusterIndex,
    };
  }
}

/// The impeding waypoint.
///
/// @nodoc
class WaypointOptimizationImpedingWaypoint {
  /// Failed constraints for an impeding waypoint.
  final List<WaypointOptimizationFailedConstraint> failedConstraints;

  /// The waypoint Id.
  final String id;

  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  WaypointOptimizationImpedingWaypoint({
    required this.failedConstraints,
    required this.id,
    required this.position,
  });

  factory WaypointOptimizationImpedingWaypoint.fromJson(
      Map<String, dynamic> json) {
    return WaypointOptimizationImpedingWaypoint(
      failedConstraints: ((json['FailedConstraints'] as List?) ?? const [])
          .nonNulls
          .map((e) => WaypointOptimizationFailedConstraint.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      id: (json['Id'] as String?) ?? '',
      position: ((json['Position'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedConstraints = this.failedConstraints;
    final id = this.id;
    final position = this.position;
    return {
      'FailedConstraints': failedConstraints,
      'Id': id,
      'Position': position,
    };
  }
}

/// The failed constraint.
///
/// @nodoc
class WaypointOptimizationFailedConstraint {
  /// The failed constraint.
  final WaypointOptimizationConstraint? constraint;

  /// Reason for the failed constraint.
  final String? reason;

  WaypointOptimizationFailedConstraint({
    this.constraint,
    this.reason,
  });

  factory WaypointOptimizationFailedConstraint.fromJson(
      Map<String, dynamic> json) {
    return WaypointOptimizationFailedConstraint(
      constraint: (json['Constraint'] as String?)
          ?.let(WaypointOptimizationConstraint.fromString),
      reason: json['Reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final constraint = this.constraint;
    final reason = this.reason;
    return {
      if (constraint != null) 'Constraint': constraint.value,
      if (reason != null) 'Reason': reason,
    };
  }
}

/// @nodoc
class WaypointOptimizationConstraint {
  static const accessHours = WaypointOptimizationConstraint._('AccessHours');
  static const appointmentTime =
      WaypointOptimizationConstraint._('AppointmentTime');
  static const before = WaypointOptimizationConstraint._('Before');
  static const heading = WaypointOptimizationConstraint._('Heading');
  static const serviceDuration =
      WaypointOptimizationConstraint._('ServiceDuration');
  static const sideOfStreet = WaypointOptimizationConstraint._('SideOfStreet');

  final String value;

  const WaypointOptimizationConstraint._(this.value);

  static const values = [
    accessHours,
    appointmentTime,
    before,
    heading,
    serviceDuration,
    sideOfStreet
  ];

  static WaypointOptimizationConstraint fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WaypointOptimizationConstraint._(value));

  @override
  bool operator ==(other) =>
      other is WaypointOptimizationConstraint && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This contains information such as distance and duration from one waypoint to
/// the next waypoint in the sequence.
///
/// @nodoc
class WaypointOptimizationConnection {
  /// Distance of the step.
  final int distance;

  /// contains the ID of the starting waypoint in this connection.
  final String from;

  /// Resting time before the driver can continue driving.
  final int restDuration;

  /// Contains the ID of the ending waypoint in this connection.
  final String to;

  /// Total duration.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int travelDuration;

  /// Duration of a wait step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int waitDuration;

  WaypointOptimizationConnection({
    required this.distance,
    required this.from,
    required this.restDuration,
    required this.to,
    required this.travelDuration,
    required this.waitDuration,
  });

  factory WaypointOptimizationConnection.fromJson(Map<String, dynamic> json) {
    return WaypointOptimizationConnection(
      distance: (json['Distance'] as int?) ?? 0,
      from: (json['From'] as String?) ?? '',
      restDuration: (json['RestDuration'] as int?) ?? 0,
      to: (json['To'] as String?) ?? '',
      travelDuration: (json['TravelDuration'] as int?) ?? 0,
      waitDuration: (json['WaitDuration'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final from = this.from;
    final restDuration = this.restDuration;
    final to = this.to;
    final travelDuration = this.travelDuration;
    final waitDuration = this.waitDuration;
    return {
      'Distance': distance,
      'From': from,
      'RestDuration': restDuration,
      'To': to,
      'TravelDuration': travelDuration,
      'WaitDuration': waitDuration,
    };
  }
}

/// Specifies options for areas to avoid. This is a best-effort avoidance
/// setting, meaning the router will try to honor the avoidance preferences but
/// may still include restricted areas if no feasible alternative route exists.
/// If avoidance options are not followed, the response will indicate that the
/// avoidance criteria were violated.
///
/// @nodoc
class WaypointOptimizationAvoidanceOptions {
  /// Areas to be avoided.
  final List<WaypointOptimizationAvoidanceArea>? areas;

  /// Avoidance options for cars-shuttles-trains.
  final bool? carShuttleTrains;

  /// Avoid controlled access highways while calculating the route.
  final bool? controlledAccessHighways;

  /// Avoid dirt roads while calculating the route.
  final bool? dirtRoads;

  /// Avoidance options for ferries.
  final bool? ferries;

  /// Avoids roads where the specified toll transponders are the only mode of
  /// payment.
  final bool? tollRoads;

  /// Avoid tunnels while calculating the route.
  final bool? tunnels;

  /// Avoid U-turns for calculation on highways and motorways.
  final bool? uTurns;

  WaypointOptimizationAvoidanceOptions({
    this.areas,
    this.carShuttleTrains,
    this.controlledAccessHighways,
    this.dirtRoads,
    this.ferries,
    this.tollRoads,
    this.tunnels,
    this.uTurns,
  });

  Map<String, dynamic> toJson() {
    final areas = this.areas;
    final carShuttleTrains = this.carShuttleTrains;
    final controlledAccessHighways = this.controlledAccessHighways;
    final dirtRoads = this.dirtRoads;
    final ferries = this.ferries;
    final tollRoads = this.tollRoads;
    final tunnels = this.tunnels;
    final uTurns = this.uTurns;
    return {
      if (areas != null) 'Areas': areas,
      if (carShuttleTrains != null) 'CarShuttleTrains': carShuttleTrains,
      if (controlledAccessHighways != null)
        'ControlledAccessHighways': controlledAccessHighways,
      if (dirtRoads != null) 'DirtRoads': dirtRoads,
      if (ferries != null) 'Ferries': ferries,
      if (tollRoads != null) 'TollRoads': tollRoads,
      if (tunnels != null) 'Tunnels': tunnels,
      if (uTurns != null) 'UTurns': uTurns,
    };
  }
}

/// Options for WaypointOptimizationClustering.
///
/// @nodoc
class WaypointOptimizationClusteringOptions {
  /// The algorithm to be used. <code>DrivingDistance</code> assigns all the
  /// waypoints that are within driving distance of each other into a single
  /// cluster. <code>TopologySegment</code> assigns all the waypoints that are
  /// within the same topology segment into a single cluster. A Topology segment
  /// is a linear stretch of road between two junctions.
  final WaypointOptimizationClusteringAlgorithm algorithm;

  /// Driving distance options to be used when the clustering algorithm is
  /// DrivingDistance.
  final WaypointOptimizationDrivingDistanceOptions? drivingDistanceOptions;

  WaypointOptimizationClusteringOptions({
    required this.algorithm,
    this.drivingDistanceOptions,
  });

  Map<String, dynamic> toJson() {
    final algorithm = this.algorithm;
    final drivingDistanceOptions = this.drivingDistanceOptions;
    return {
      'Algorithm': algorithm.value,
      if (drivingDistanceOptions != null)
        'DrivingDistanceOptions': drivingDistanceOptions,
    };
  }
}

/// Destination related options.
///
/// @nodoc
class WaypointOptimizationDestinationOptions {
  /// Access hours corresponding to when a waypoint can be visited.
  final WaypointOptimizationAccessHours? accessHours;

  /// Appointment time at the destination.
  final String? appointmentTime;

  /// GPS Heading at the position.
  final double? heading;

  /// The waypoint Id.
  final String? id;

  /// Service time spent at the destination. At an appointment, the service time
  /// should be the appointment duration.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? serviceDuration;

  /// Options to configure matching the provided position to a side of the street.
  final WaypointOptimizationSideOfStreetOptions? sideOfStreet;

  WaypointOptimizationDestinationOptions({
    this.accessHours,
    this.appointmentTime,
    this.heading,
    this.id,
    this.serviceDuration,
    this.sideOfStreet,
  });

  Map<String, dynamic> toJson() {
    final accessHours = this.accessHours;
    final appointmentTime = this.appointmentTime;
    final heading = this.heading;
    final id = this.id;
    final serviceDuration = this.serviceDuration;
    final sideOfStreet = this.sideOfStreet;
    return {
      if (accessHours != null) 'AccessHours': accessHours,
      if (appointmentTime != null) 'AppointmentTime': appointmentTime,
      if (heading != null) 'Heading': heading,
      if (id != null) 'Id': id,
      if (serviceDuration != null) 'ServiceDuration': serviceDuration,
      if (sideOfStreet != null) 'SideOfStreet': sideOfStreet,
    };
  }
}

/// Driver related options.
///
/// @nodoc
class WaypointOptimizationDriverOptions {
  /// Driver work-rest schedules defined by a short and long cycle. A rest needs
  /// to be taken after the short work duration. The short cycle can be repeated
  /// until you hit the long work duration, at which point the long rest duration
  /// should be taken before restarting.
  final WaypointOptimizationRestCycles? restCycles;

  /// Pre defined rest profiles for a driver schedule. The only currently
  /// supported profile is EU.
  final WaypointOptimizationRestProfile? restProfile;

  /// If the service time provided at a waypoint/destination should be considered
  /// as rest or work. This contributes to the total time breakdown returned
  /// within the response.
  final WaypointOptimizationServiceTimeTreatment? treatServiceTimeAs;

  WaypointOptimizationDriverOptions({
    this.restCycles,
    this.restProfile,
    this.treatServiceTimeAs,
  });

  Map<String, dynamic> toJson() {
    final restCycles = this.restCycles;
    final restProfile = this.restProfile;
    final treatServiceTimeAs = this.treatServiceTimeAs;
    return {
      if (restCycles != null) 'RestCycles': restCycles,
      if (restProfile != null) 'RestProfile': restProfile,
      if (treatServiceTimeAs != null)
        'TreatServiceTimeAs': treatServiceTimeAs.value,
    };
  }
}

/// Specifies strict exclusion options for the route calculation. This setting
/// mandates that the router will avoid any routes that include the specified
/// options, rather than merely attempting to minimize them.
///
/// @nodoc
class WaypointOptimizationExclusionOptions {
  /// List of countries to be avoided defined by two-letter or three-letter
  /// country codes.
  final List<String> countries;

  WaypointOptimizationExclusionOptions({
    required this.countries,
  });

  Map<String, dynamic> toJson() {
    final countries = this.countries;
    return {
      'Countries': countries,
    };
  }
}

/// @nodoc
class WaypointOptimizationSequencingObjective {
  static const fastestRoute =
      WaypointOptimizationSequencingObjective._('FastestRoute');
  static const shortestRoute =
      WaypointOptimizationSequencingObjective._('ShortestRoute');

  final String value;

  const WaypointOptimizationSequencingObjective._(this.value);

  static const values = [fastestRoute, shortestRoute];

  static WaypointOptimizationSequencingObjective fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WaypointOptimizationSequencingObjective._(value));

  @override
  bool operator ==(other) =>
      other is WaypointOptimizationSequencingObjective && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Origin related options.
///
/// @nodoc
class WaypointOptimizationOriginOptions {
  /// The Origin Id.
  final String? id;

  WaypointOptimizationOriginOptions({
    this.id,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

/// Options related to traffic.
///
/// @nodoc
class WaypointOptimizationTrafficOptions {
  /// Determines if traffic should be used or ignored while calculating the route.
  ///
  /// Default value: <code>UseTrafficData</code>
  final TrafficUsage? usage;

  WaypointOptimizationTrafficOptions({
    this.usage,
  });

  Map<String, dynamic> toJson() {
    final usage = this.usage;
    return {
      if (usage != null) 'Usage': usage.value,
    };
  }
}

/// @nodoc
class WaypointOptimizationTravelMode {
  static const car = WaypointOptimizationTravelMode._('Car');
  static const pedestrian = WaypointOptimizationTravelMode._('Pedestrian');
  static const scooter = WaypointOptimizationTravelMode._('Scooter');
  static const truck = WaypointOptimizationTravelMode._('Truck');

  final String value;

  const WaypointOptimizationTravelMode._(this.value);

  static const values = [car, pedestrian, scooter, truck];

  static WaypointOptimizationTravelMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WaypointOptimizationTravelMode._(value));

  @override
  bool operator ==(other) =>
      other is WaypointOptimizationTravelMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Travel mode related options for the provided travel mode.
///
/// @nodoc
class WaypointOptimizationTravelModeOptions {
  /// Travel mode options when the provided travel mode is
  /// <code>Pedestrian</code>.
  final WaypointOptimizationPedestrianOptions? pedestrian;

  /// Travel mode options when the provided travel mode is <code>Truck</code>.
  final WaypointOptimizationTruckOptions? truck;

  WaypointOptimizationTravelModeOptions({
    this.pedestrian,
    this.truck,
  });

  Map<String, dynamic> toJson() {
    final pedestrian = this.pedestrian;
    final truck = this.truck;
    return {
      if (pedestrian != null) 'Pedestrian': pedestrian,
      if (truck != null) 'Truck': truck,
    };
  }
}

/// Waypoint between the Origin and Destination.
///
/// @nodoc
class WaypointOptimizationWaypoint {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// Access hours corresponding to when a waypoint can be visited.
  final WaypointOptimizationAccessHours? accessHours;

  /// Appointment time at the waypoint.
  final String? appointmentTime;

  /// Constraint defining what waypoints are to be visited after this waypoint.
  final List<int>? before;

  /// GPS Heading at the position.
  final double? heading;

  /// The waypoint Id.
  final String? id;

  /// Service time spent at the waypoint. At an appointment, the service time
  /// should be the appointment duration.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? serviceDuration;

  /// Options to configure matching the provided position to a side of the street.
  final WaypointOptimizationSideOfStreetOptions? sideOfStreet;

  WaypointOptimizationWaypoint({
    required this.position,
    this.accessHours,
    this.appointmentTime,
    this.before,
    this.heading,
    this.id,
    this.serviceDuration,
    this.sideOfStreet,
  });

  Map<String, dynamic> toJson() {
    final position = this.position;
    final accessHours = this.accessHours;
    final appointmentTime = this.appointmentTime;
    final before = this.before;
    final heading = this.heading;
    final id = this.id;
    final serviceDuration = this.serviceDuration;
    final sideOfStreet = this.sideOfStreet;
    return {
      'Position': position,
      if (accessHours != null) 'AccessHours': accessHours,
      if (appointmentTime != null) 'AppointmentTime': appointmentTime,
      if (before != null) 'Before': before,
      if (heading != null) 'Heading': heading,
      if (id != null) 'Id': id,
      if (serviceDuration != null) 'ServiceDuration': serviceDuration,
      if (sideOfStreet != null) 'SideOfStreet': sideOfStreet,
    };
  }
}

/// Access hours corresponding to when a destination can be visited.
///
/// @nodoc
class WaypointOptimizationAccessHours {
  /// Contains the ID of the starting waypoint in this connection.
  final WaypointOptimizationAccessHoursEntry from;

  /// Contains the ID of the ending waypoint in this connection.
  final WaypointOptimizationAccessHoursEntry to;

  WaypointOptimizationAccessHours({
    required this.from,
    required this.to,
  });

  Map<String, dynamic> toJson() {
    final from = this.from;
    final to = this.to;
    return {
      'From': from,
      'To': to,
    };
  }
}

/// Options to configure matching the provided position to a side of the street.
///
/// @nodoc
class WaypointOptimizationSideOfStreetOptions {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// Strategy that defines when the side of street position should be used.
  /// AnyStreet will always use the provided position.
  ///
  /// Default value: <code>DividedStreetOnly</code>
  final SideOfStreetMatchingStrategy? useWith;

  WaypointOptimizationSideOfStreetOptions({
    required this.position,
    this.useWith,
  });

  Map<String, dynamic> toJson() {
    final position = this.position;
    final useWith = this.useWith;
    return {
      'Position': position,
      if (useWith != null) 'UseWith': useWith.value,
    };
  }
}

/// @nodoc
class SideOfStreetMatchingStrategy {
  static const anyStreet = SideOfStreetMatchingStrategy._('AnyStreet');
  static const dividedStreetOnly =
      SideOfStreetMatchingStrategy._('DividedStreetOnly');

  final String value;

  const SideOfStreetMatchingStrategy._(this.value);

  static const values = [anyStreet, dividedStreetOnly];

  static SideOfStreetMatchingStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SideOfStreetMatchingStrategy._(value));

  @override
  bool operator ==(other) =>
      other is SideOfStreetMatchingStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Hours of entry.
///
/// @nodoc
class WaypointOptimizationAccessHoursEntry {
  /// Day of the week.
  final DayOfWeek dayOfWeek;

  /// Time of the day.
  final String timeOfDay;

  WaypointOptimizationAccessHoursEntry({
    required this.dayOfWeek,
    required this.timeOfDay,
  });

  Map<String, dynamic> toJson() {
    final dayOfWeek = this.dayOfWeek;
    final timeOfDay = this.timeOfDay;
    return {
      'DayOfWeek': dayOfWeek.value,
      'TimeOfDay': timeOfDay,
    };
  }
}

/// @nodoc
class DayOfWeek {
  static const monday = DayOfWeek._('Monday');
  static const tuesday = DayOfWeek._('Tuesday');
  static const wednesday = DayOfWeek._('Wednesday');
  static const thursday = DayOfWeek._('Thursday');
  static const friday = DayOfWeek._('Friday');
  static const saturday = DayOfWeek._('Saturday');
  static const sunday = DayOfWeek._('Sunday');

  final String value;

  const DayOfWeek._(this.value);

  static const values = [
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday
  ];

  static DayOfWeek fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DayOfWeek._(value));

  @override
  bool operator ==(other) => other is DayOfWeek && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Options related to a pedestrian.
///
/// @nodoc
class WaypointOptimizationPedestrianOptions {
  /// Walking speed.
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? speed;

  WaypointOptimizationPedestrianOptions({
    this.speed,
  });

  Map<String, dynamic> toJson() {
    final speed = this.speed;
    return {
      if (speed != null) 'Speed': speed,
    };
  }
}

/// Travel mode options when the provided travel mode is <code>Truck</code>.
///
/// @nodoc
class WaypointOptimizationTruckOptions {
  /// Gross weight of the vehicle including trailers, and goods at capacity.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? grossWeight;

  /// List of Hazardous cargo contained in the vehicle.
  final List<WaypointOptimizationHazardousCargoType>? hazardousCargos;

  /// Height of the vehicle.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? height;

  /// Length of the vehicle.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? length;

  /// Trailer options corresponding to the vehicle.
  final WaypointOptimizationTrailerOptions? trailer;

  /// The type of truck: <code>LightTruck</code> for smaller delivery vehicles,
  /// <code> StraightTruck</code> for rigid body trucks, or <code>Tractor</code>
  /// for tractor-trailer combinations.
  final WaypointOptimizationTruckType? truckType;

  /// The tunnel restriction code.
  ///
  /// Tunnel categories in this list indicate the restrictions which apply to
  /// certain tunnels in Great Britain. They relate to the types of dangerous
  /// goods that can be transported through them.
  ///
  /// <ul>
  /// <li>
  /// <i>Tunnel Category B</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Limited risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Few restrictions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category C</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Medium risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Some restrictions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category D</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: High risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Many restrictions occur
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category E</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Very high risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Restricted tunnel
  /// </li>
  /// </ul> </li>
  /// </ul>
  final String? tunnelRestrictionCode;

  /// Heaviest weight per axle irrespective of the axle type or the axle group.
  /// Meant for usage in countries where the differences in axle types or axle
  /// groups are not distinguished.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? weightPerAxle;

  /// Width of the vehicle.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? width;

  WaypointOptimizationTruckOptions({
    this.grossWeight,
    this.hazardousCargos,
    this.height,
    this.length,
    this.trailer,
    this.truckType,
    this.tunnelRestrictionCode,
    this.weightPerAxle,
    this.width,
  });

  Map<String, dynamic> toJson() {
    final grossWeight = this.grossWeight;
    final hazardousCargos = this.hazardousCargos;
    final height = this.height;
    final length = this.length;
    final trailer = this.trailer;
    final truckType = this.truckType;
    final tunnelRestrictionCode = this.tunnelRestrictionCode;
    final weightPerAxle = this.weightPerAxle;
    final width = this.width;
    return {
      if (grossWeight != null) 'GrossWeight': grossWeight,
      if (hazardousCargos != null)
        'HazardousCargos': hazardousCargos.map((e) => e.value).toList(),
      if (height != null) 'Height': height,
      if (length != null) 'Length': length,
      if (trailer != null) 'Trailer': trailer,
      if (truckType != null) 'TruckType': truckType.value,
      if (tunnelRestrictionCode != null)
        'TunnelRestrictionCode': tunnelRestrictionCode,
      if (weightPerAxle != null) 'WeightPerAxle': weightPerAxle,
      if (width != null) 'Width': width,
    };
  }
}

/// Trailer options corresponding to the vehicle.
///
/// @nodoc
class WaypointOptimizationTrailerOptions {
  /// Number of trailers attached to the vehicle.
  ///
  /// Default value: <code>0</code>
  final int? trailerCount;

  WaypointOptimizationTrailerOptions({
    this.trailerCount,
  });

  Map<String, dynamic> toJson() {
    final trailerCount = this.trailerCount;
    return {
      if (trailerCount != null) 'TrailerCount': trailerCount,
    };
  }
}

/// @nodoc
class WaypointOptimizationTruckType {
  static const straightTruck = WaypointOptimizationTruckType._('StraightTruck');
  static const tractor = WaypointOptimizationTruckType._('Tractor');

  final String value;

  const WaypointOptimizationTruckType._(this.value);

  static const values = [straightTruck, tractor];

  static WaypointOptimizationTruckType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WaypointOptimizationTruckType._(value));

  @override
  bool operator ==(other) =>
      other is WaypointOptimizationTruckType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class WaypointOptimizationHazardousCargoType {
  static const combustible =
      WaypointOptimizationHazardousCargoType._('Combustible');
  static const corrosive =
      WaypointOptimizationHazardousCargoType._('Corrosive');
  static const explosive =
      WaypointOptimizationHazardousCargoType._('Explosive');
  static const flammable =
      WaypointOptimizationHazardousCargoType._('Flammable');
  static const gas = WaypointOptimizationHazardousCargoType._('Gas');
  static const harmfulToWater =
      WaypointOptimizationHazardousCargoType._('HarmfulToWater');
  static const organic = WaypointOptimizationHazardousCargoType._('Organic');
  static const other = WaypointOptimizationHazardousCargoType._('Other');
  static const poison = WaypointOptimizationHazardousCargoType._('Poison');
  static const poisonousInhalation =
      WaypointOptimizationHazardousCargoType._('PoisonousInhalation');
  static const radioactive =
      WaypointOptimizationHazardousCargoType._('Radioactive');

  final String value;

  const WaypointOptimizationHazardousCargoType._(this.value);

  static const values = [
    combustible,
    corrosive,
    explosive,
    flammable,
    gas,
    harmfulToWater,
    organic,
    other,
    poison,
    poisonousInhalation,
    radioactive
  ];

  static WaypointOptimizationHazardousCargoType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WaypointOptimizationHazardousCargoType._(value));

  @override
  bool operator ==(other) =>
      other is WaypointOptimizationHazardousCargoType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TrafficUsage {
  static const ignoreTrafficData = TrafficUsage._('IgnoreTrafficData');
  static const useTrafficData = TrafficUsage._('UseTrafficData');

  final String value;

  const TrafficUsage._(this.value);

  static const values = [ignoreTrafficData, useTrafficData];

  static TrafficUsage fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TrafficUsage._(value));

  @override
  bool operator ==(other) => other is TrafficUsage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Resting phase of the cycle.
///
/// @nodoc
class WaypointOptimizationRestCycles {
  /// Long cycle for a driver work-rest schedule.
  final WaypointOptimizationRestCycleDurations longCycle;

  /// Short cycle for a driver work-rest schedule
  final WaypointOptimizationRestCycleDurations shortCycle;

  WaypointOptimizationRestCycles({
    required this.longCycle,
    required this.shortCycle,
  });

  Map<String, dynamic> toJson() {
    final longCycle = this.longCycle;
    final shortCycle = this.shortCycle;
    return {
      'LongCycle': longCycle,
      'ShortCycle': shortCycle,
    };
  }
}

/// Pre defined rest profiles for a driver schedule. The only currently
/// supported profile is EU.
///
/// @nodoc
class WaypointOptimizationRestProfile {
  /// Pre defined rest profiles for a driver schedule. The only currently
  /// supported profile is EU.
  final String profile;

  WaypointOptimizationRestProfile({
    required this.profile,
  });

  Map<String, dynamic> toJson() {
    final profile = this.profile;
    return {
      'Profile': profile,
    };
  }
}

/// @nodoc
class WaypointOptimizationServiceTimeTreatment {
  static const rest = WaypointOptimizationServiceTimeTreatment._('Rest');
  static const work = WaypointOptimizationServiceTimeTreatment._('Work');

  final String value;

  const WaypointOptimizationServiceTimeTreatment._(this.value);

  static const values = [rest, work];

  static WaypointOptimizationServiceTimeTreatment fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WaypointOptimizationServiceTimeTreatment._(value));

  @override
  bool operator ==(other) =>
      other is WaypointOptimizationServiceTimeTreatment && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Driver work-rest schedules defined by a short and long cycle. A rest needs
/// to be taken after the short work duration. The short cycle can be repeated
/// until you hit the long work duration, at which point the long rest duration
/// should be taken before restarting.
///
/// <b>Unit</b>: <code>seconds</code>
///
/// @nodoc
class WaypointOptimizationRestCycleDurations {
  /// Resting phase of the cycle.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int restDuration;

  /// Working phase of the cycle.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int workDuration;

  WaypointOptimizationRestCycleDurations({
    required this.restDuration,
    required this.workDuration,
  });

  Map<String, dynamic> toJson() {
    final restDuration = this.restDuration;
    final workDuration = this.workDuration;
    return {
      'RestDuration': restDuration,
      'WorkDuration': workDuration,
    };
  }
}

/// @nodoc
class WaypointOptimizationClusteringAlgorithm {
  static const drivingDistance =
      WaypointOptimizationClusteringAlgorithm._('DrivingDistance');
  static const topologySegment =
      WaypointOptimizationClusteringAlgorithm._('TopologySegment');

  final String value;

  const WaypointOptimizationClusteringAlgorithm._(this.value);

  static const values = [drivingDistance, topologySegment];

  static WaypointOptimizationClusteringAlgorithm fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WaypointOptimizationClusteringAlgorithm._(value));

  @override
  bool operator ==(other) =>
      other is WaypointOptimizationClusteringAlgorithm && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Driving distance related options.
///
/// @nodoc
class WaypointOptimizationDrivingDistanceOptions {
  /// DrivingDistance assigns all the waypoints that are within driving distance
  /// of each other into a single cluster.
  final int drivingDistance;

  WaypointOptimizationDrivingDistanceOptions({
    required this.drivingDistance,
  });

  Map<String, dynamic> toJson() {
    final drivingDistance = this.drivingDistance;
    return {
      'DrivingDistance': drivingDistance,
    };
  }
}

/// The area to be avoided.
///
/// @nodoc
class WaypointOptimizationAvoidanceArea {
  /// Geometry of the area to be avoided.
  final WaypointOptimizationAvoidanceAreaGeometry geometry;

  WaypointOptimizationAvoidanceArea({
    required this.geometry,
  });

  Map<String, dynamic> toJson() {
    final geometry = this.geometry;
    return {
      'Geometry': geometry,
    };
  }
}

/// Geometry of the area to be avoided.
///
/// @nodoc
class WaypointOptimizationAvoidanceAreaGeometry {
  /// Geometry defined as a bounding box. The first pair represents the X and Y
  /// coordinates (longitude and latitude,) of the southwest corner of the
  /// bounding box; the second pair represents the X and Y coordinates (longitude
  /// and latitude) of the northeast corner.
  final List<double>? boundingBox;

  WaypointOptimizationAvoidanceAreaGeometry({
    this.boundingBox,
  });

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
    };
  }
}

/// The route.
///
/// @nodoc
class Route {
  /// A leg is a section of a route from one waypoint to the next. A leg could be
  /// of type Vehicle, Pedestrian or Ferry. Legs of different types could occur
  /// together within a single route. For example, a car employing the use of a
  /// Ferry will contain Vehicle legs corresponding to journey on land, and Ferry
  /// legs corresponding to the journey via Ferry.
  final List<RouteLeg> legs;

  /// Important labels including names and route numbers that differentiate the
  /// current route from the alternatives presented.
  final List<RouteMajorRoadLabel> majorRoadLabels;

  /// Summarized details of the leg.
  final RouteSummary? summary;

  Route({
    required this.legs,
    required this.majorRoadLabels,
    this.summary,
  });

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      legs: ((json['Legs'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteLeg.fromJson(e as Map<String, dynamic>))
          .toList(),
      majorRoadLabels: ((json['MajorRoadLabels'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteMajorRoadLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: json['Summary'] != null
          ? RouteSummary.fromJson(json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final legs = this.legs;
    final majorRoadLabels = this.majorRoadLabels;
    final summary = this.summary;
    return {
      'Legs': legs,
      'MajorRoadLabels': majorRoadLabels,
      if (summary != null) 'Summary': summary,
    };
  }
}

/// Summarized details for the leg including travel steps only. The Distance for
/// the travel only portion of the journey is the same as the Distance within
/// the Overview summary.
///
/// @nodoc
class RouteSummary {
  /// Distance of the route.
  final int? distance;

  /// Duration of the route.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? duration;

  /// Toll summary for the complete route.
  final RouteTollSummary? tolls;

  RouteSummary({
    this.distance,
    this.duration,
    this.tolls,
  });

  factory RouteSummary.fromJson(Map<String, dynamic> json) {
    return RouteSummary(
      distance: json['Distance'] as int?,
      duration: json['Duration'] as int?,
      tolls: json['Tolls'] != null
          ? RouteTollSummary.fromJson(json['Tolls'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final duration = this.duration;
    final tolls = this.tolls;
    return {
      if (distance != null) 'Distance': distance,
      if (duration != null) 'Duration': duration,
      if (tolls != null) 'Tolls': tolls,
    };
  }
}

/// The toll summary for the complete route.
///
/// @nodoc
class RouteTollSummary {
  /// Total toll summary for the complete route. Total is the only summary
  /// available today.
  final RouteTollPriceSummary? total;

  RouteTollSummary({
    this.total,
  });

  factory RouteTollSummary.fromJson(Map<String, dynamic> json) {
    return RouteTollSummary(
      total: json['Total'] != null
          ? RouteTollPriceSummary.fromJson(
              json['Total'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final total = this.total;
    return {
      if (total != null) 'Total': total,
    };
  }
}

/// Summary of the route and toll price.
///
/// @nodoc
class RouteTollPriceSummary {
  /// Currency code corresponding to the price. This is the same as Currency
  /// specified in the request.
  final String currency;

  /// If the price is an estimate or an exact value.
  final bool estimate;

  /// If the price is a range or an exact value. If any of the toll fares making
  /// up the route is a range, the overall price is also a range.
  final bool range;

  /// Exact price, if not a range.
  final double value;

  /// Price range with a minimum and maximum value, if a range.
  final RouteTollPriceValueRange? rangeValue;

  RouteTollPriceSummary({
    required this.currency,
    required this.estimate,
    required this.range,
    required this.value,
    this.rangeValue,
  });

  factory RouteTollPriceSummary.fromJson(Map<String, dynamic> json) {
    return RouteTollPriceSummary(
      currency: (json['Currency'] as String?) ?? '',
      estimate: (json['Estimate'] as bool?) ?? false,
      range: (json['Range'] as bool?) ?? false,
      value: (json['Value'] as double?) ?? 0,
      rangeValue: json['RangeValue'] != null
          ? RouteTollPriceValueRange.fromJson(
              json['RangeValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final currency = this.currency;
    final estimate = this.estimate;
    final range = this.range;
    final value = this.value;
    final rangeValue = this.rangeValue;
    return {
      'Currency': currency,
      'Estimate': estimate,
      'Range': range,
      'Value': value,
      if (rangeValue != null) 'RangeValue': rangeValue,
    };
  }
}

/// Price range with a minimum and maximum value, if a range.
///
/// @nodoc
class RouteTollPriceValueRange {
  /// Maximum price.
  final double max;

  /// Minimum price.
  final double min;

  RouteTollPriceValueRange({
    required this.max,
    required this.min,
  });

  factory RouteTollPriceValueRange.fromJson(Map<String, dynamic> json) {
    return RouteTollPriceValueRange(
      max: (json['Max'] as double?) ?? 0,
      min: (json['Min'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final max = this.max;
    final min = this.min;
    return {
      'Max': max,
      'Min': min,
    };
  }
}

/// Important labels including names and route numbers that differentiate the
/// current route from the alternatives presented.
///
/// @nodoc
class RouteMajorRoadLabel {
  /// Name of the road (localized).
  final LocalizedString? roadName;

  /// Route number of the road.
  final RouteNumber? routeNumber;

  RouteMajorRoadLabel({
    this.roadName,
    this.routeNumber,
  });

  factory RouteMajorRoadLabel.fromJson(Map<String, dynamic> json) {
    return RouteMajorRoadLabel(
      roadName: json['RoadName'] != null
          ? LocalizedString.fromJson(json['RoadName'] as Map<String, dynamic>)
          : null,
      routeNumber: json['RouteNumber'] != null
          ? RouteNumber.fromJson(json['RouteNumber'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final roadName = this.roadName;
    final routeNumber = this.routeNumber;
    return {
      if (roadName != null) 'RoadName': roadName,
      if (routeNumber != null) 'RouteNumber': routeNumber,
    };
  }
}

/// The localized string.
///
/// @nodoc
class LocalizedString {
  /// The value of the localized string.
  final String value;

  /// A list of BCP 47 compliant language codes for the results to be rendered in.
  /// The request uses the regional default as the fallback if the requested
  /// language can't be provided.
  final String? language;

  LocalizedString({
    required this.value,
    this.language,
  });

  factory LocalizedString.fromJson(Map<String, dynamic> json) {
    return LocalizedString(
      value: (json['Value'] as String?) ?? '',
      language: json['Language'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final language = this.language;
    return {
      'Value': value,
      if (language != null) 'Language': language,
    };
  }
}

/// The route number.
///
/// @nodoc
class RouteNumber {
  /// The route number.
  final String value;

  /// Directional identifier of the route.
  final RouteDirection? direction;

  /// List of languages for instructions corresponding to the route number.
  final String? language;

  RouteNumber({
    required this.value,
    this.direction,
    this.language,
  });

  factory RouteNumber.fromJson(Map<String, dynamic> json) {
    return RouteNumber(
      value: (json['Value'] as String?) ?? '',
      direction: (json['Direction'] as String?)?.let(RouteDirection.fromString),
      language: json['Language'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final direction = this.direction;
    final language = this.language;
    return {
      'Value': value,
      if (direction != null) 'Direction': direction.value,
      if (language != null) 'Language': language,
    };
  }
}

/// @nodoc
class RouteDirection {
  static const east = RouteDirection._('East');
  static const north = RouteDirection._('North');
  static const south = RouteDirection._('South');
  static const west = RouteDirection._('West');

  final String value;

  const RouteDirection._(this.value);

  static const values = [east, north, south, west];

  static RouteDirection fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteDirection._(value));

  @override
  bool operator ==(other) => other is RouteDirection && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A leg is a section of a route from one waypoint to the next. A leg could be
/// of type Vehicle, Pedestrian or Ferry. Legs of different types could occur
/// together within a single route. For example, a car employing the use of a
/// Ferry will contain Vehicle legs corresponding to journey on land, and Ferry
/// legs corresponding to the journey via Ferry.
///
/// @nodoc
class RouteLeg {
  /// Geometry of the area to be avoided.
  final RouteLegGeometry geometry;

  /// Specifies the mode of transport when calculating a route. Used in estimating
  /// the speed of travel and road compatibility.
  ///
  /// Default value: <code>Car</code>
  final RouteLegTravelMode travelMode;

  /// Type of the leg.
  final RouteLegType type;

  /// FerryLegDetails is populated when the Leg type is Ferry, and provides
  /// additional information that is specific to ferry travel. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final RouteFerryLegDetails? ferryLegDetails;

  /// List of languages for instructions within steps in the response. Not
  /// supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final String? language;

  /// Details related to the pedestrian leg.
  final RoutePedestrianLegDetails? pedestrianLegDetails;

  /// Details related to the rental leg.
  /// <note>
  /// Not supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  /// </note>
  final RouteRentalLegDetails? rentalLegDetails;

  /// Details related to the taxi leg.
  /// <note>
  /// Not supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  /// </note>
  final RouteTaxiLegDetails? taxiLegDetails;

  /// Details related to the transit leg.
  final RouteTransitLegDetails? transitLegDetails;

  /// Details related to the vehicle leg.
  final RouteVehicleLegDetails? vehicleLegDetails;

  RouteLeg({
    required this.geometry,
    required this.travelMode,
    required this.type,
    this.ferryLegDetails,
    this.language,
    this.pedestrianLegDetails,
    this.rentalLegDetails,
    this.taxiLegDetails,
    this.transitLegDetails,
    this.vehicleLegDetails,
  });

  factory RouteLeg.fromJson(Map<String, dynamic> json) {
    return RouteLeg(
      geometry: RouteLegGeometry.fromJson(
          (json['Geometry'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      travelMode:
          RouteLegTravelMode.fromString((json['TravelMode'] as String?) ?? ''),
      type: RouteLegType.fromString((json['Type'] as String?) ?? ''),
      ferryLegDetails: json['FerryLegDetails'] != null
          ? RouteFerryLegDetails.fromJson(
              json['FerryLegDetails'] as Map<String, dynamic>)
          : null,
      language: json['Language'] as String?,
      pedestrianLegDetails: json['PedestrianLegDetails'] != null
          ? RoutePedestrianLegDetails.fromJson(
              json['PedestrianLegDetails'] as Map<String, dynamic>)
          : null,
      rentalLegDetails: json['RentalLegDetails'] != null
          ? RouteRentalLegDetails.fromJson(
              json['RentalLegDetails'] as Map<String, dynamic>)
          : null,
      taxiLegDetails: json['TaxiLegDetails'] != null
          ? RouteTaxiLegDetails.fromJson(
              json['TaxiLegDetails'] as Map<String, dynamic>)
          : null,
      transitLegDetails: json['TransitLegDetails'] != null
          ? RouteTransitLegDetails.fromJson(
              json['TransitLegDetails'] as Map<String, dynamic>)
          : null,
      vehicleLegDetails: json['VehicleLegDetails'] != null
          ? RouteVehicleLegDetails.fromJson(
              json['VehicleLegDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final geometry = this.geometry;
    final travelMode = this.travelMode;
    final type = this.type;
    final ferryLegDetails = this.ferryLegDetails;
    final language = this.language;
    final pedestrianLegDetails = this.pedestrianLegDetails;
    final rentalLegDetails = this.rentalLegDetails;
    final taxiLegDetails = this.taxiLegDetails;
    final transitLegDetails = this.transitLegDetails;
    final vehicleLegDetails = this.vehicleLegDetails;
    return {
      'Geometry': geometry,
      'TravelMode': travelMode.value,
      'Type': type.value,
      if (ferryLegDetails != null) 'FerryLegDetails': ferryLegDetails,
      if (language != null) 'Language': language,
      if (pedestrianLegDetails != null)
        'PedestrianLegDetails': pedestrianLegDetails,
      if (rentalLegDetails != null) 'RentalLegDetails': rentalLegDetails,
      if (taxiLegDetails != null) 'TaxiLegDetails': taxiLegDetails,
      if (transitLegDetails != null) 'TransitLegDetails': transitLegDetails,
      if (vehicleLegDetails != null) 'VehicleLegDetails': vehicleLegDetails,
    };
  }
}

/// FerryLegDetails is populated when the Leg type is Ferry, and provides
/// additional information that is specific to ferry travel.
///
/// @nodoc
class RouteFerryLegDetails {
  /// Steps of a leg that must be performed after the travel portion of the leg.
  final List<RouteFerryAfterTravelStep> afterTravelSteps;

  /// Details corresponding to the arrival for the leg.
  final RouteFerryArrival arrival;

  /// Steps of a leg that must be performed before the travel portion of the leg.
  final List<RouteFerryBeforeTravelStep> beforeTravelSteps;

  /// Details corresponding to the departure for the leg.
  final RouteFerryDeparture departure;

  /// Notices are additional information returned that indicate issues that
  /// occurred during route calculation.
  final List<RouteFerryNotice> notices;

  /// Waypoints that were passed through during the leg. This includes the
  /// waypoints that were configured with the PassThrough option.
  final List<RoutePassThroughWaypoint> passThroughWaypoints;

  /// Spans that were computed for the requested SpanAdditionalFeatures.
  final List<RouteFerrySpan> spans;

  /// Steps of a leg that must be performed before the travel portion of the leg.
  final List<RouteFerryTravelStep> travelSteps;

  /// Route name of the ferry line.
  final String? routeName;

  /// Summarized details of the leg.
  final RouteFerrySummary? summary;

  RouteFerryLegDetails({
    required this.afterTravelSteps,
    required this.arrival,
    required this.beforeTravelSteps,
    required this.departure,
    required this.notices,
    required this.passThroughWaypoints,
    required this.spans,
    required this.travelSteps,
    this.routeName,
    this.summary,
  });

  factory RouteFerryLegDetails.fromJson(Map<String, dynamic> json) {
    return RouteFerryLegDetails(
      afterTravelSteps: ((json['AfterTravelSteps'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RouteFerryAfterTravelStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      arrival: RouteFerryArrival.fromJson(
          (json['Arrival'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      beforeTravelSteps: ((json['BeforeTravelSteps'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RouteFerryBeforeTravelStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      departure: RouteFerryDeparture.fromJson(
          (json['Departure'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      notices: ((json['Notices'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteFerryNotice.fromJson(e as Map<String, dynamic>))
          .toList(),
      passThroughWaypoints:
          ((json['PassThroughWaypoints'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  RoutePassThroughWaypoint.fromJson(e as Map<String, dynamic>))
              .toList(),
      spans: ((json['Spans'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteFerrySpan.fromJson(e as Map<String, dynamic>))
          .toList(),
      travelSteps: ((json['TravelSteps'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteFerryTravelStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      routeName: json['RouteName'] as String?,
      summary: json['Summary'] != null
          ? RouteFerrySummary.fromJson(json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final afterTravelSteps = this.afterTravelSteps;
    final arrival = this.arrival;
    final beforeTravelSteps = this.beforeTravelSteps;
    final departure = this.departure;
    final notices = this.notices;
    final passThroughWaypoints = this.passThroughWaypoints;
    final spans = this.spans;
    final travelSteps = this.travelSteps;
    final routeName = this.routeName;
    final summary = this.summary;
    return {
      'AfterTravelSteps': afterTravelSteps,
      'Arrival': arrival,
      'BeforeTravelSteps': beforeTravelSteps,
      'Departure': departure,
      'Notices': notices,
      'PassThroughWaypoints': passThroughWaypoints,
      'Spans': spans,
      'TravelSteps': travelSteps,
      if (routeName != null) 'RouteName': routeName,
      if (summary != null) 'Summary': summary,
    };
  }
}

/// The returned Route leg geometry.
///
/// @nodoc
class RouteLegGeometry {
  /// An ordered list of positions used to plot a route on a map.
  /// <note>
  /// LineString and Polyline are mutually exclusive properties.
  /// </note>
  final List<List<double>>? lineString;

  /// An ordered list of positions used to plot a route on a map in a lossy
  /// compression format.
  /// <note>
  /// LineString and Polyline are mutually exclusive properties.
  /// </note>
  final String? polyline;

  RouteLegGeometry({
    this.lineString,
    this.polyline,
  });

  factory RouteLegGeometry.fromJson(Map<String, dynamic> json) {
    return RouteLegGeometry(
      lineString: (json['LineString'] as List?)
          ?.nonNulls
          .map((e) => (e as List).nonNulls.map((e) => e as double).toList())
          .toList(),
      polyline: json['Polyline'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lineString = this.lineString;
    final polyline = this.polyline;
    return {
      if (lineString != null) 'LineString': lineString,
      if (polyline != null) 'Polyline': polyline,
    };
  }
}

/// Details that are specific to a pedestrian leg.
///
/// @nodoc
class RoutePedestrianLegDetails {
  /// Steps of a leg that must be performed after the travel portion of the leg.
  final List<RoutePedestrianAfterTravelStep> afterTravelSteps;

  /// Details corresponding to the arrival for the leg.
  final RoutePedestrianArrival arrival;

  /// Details corresponding to the departure for the leg.
  final RoutePedestrianDeparture departure;

  /// Notices are additional information returned that indicate issues that
  /// occurred during route calculation. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<RoutePedestrianNotice> notices;

  /// Waypoints that were passed through during the leg. This includes the
  /// waypoints that were configured with the PassThrough option.
  final List<RoutePassThroughWaypoint> passThroughWaypoints;

  /// Spans that were computed for the requested SpanAdditionalFeatures. Not
  /// supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<RoutePedestrianSpan> spans;

  /// Steps of a leg that must be performed before the travel portion of the leg.
  final List<RoutePedestrianTravelStep> travelSteps;

  /// Summarized details of the leg.
  final RoutePedestrianSummary? summary;

  RoutePedestrianLegDetails({
    required this.afterTravelSteps,
    required this.arrival,
    required this.departure,
    required this.notices,
    required this.passThroughWaypoints,
    required this.spans,
    required this.travelSteps,
    this.summary,
  });

  factory RoutePedestrianLegDetails.fromJson(Map<String, dynamic> json) {
    return RoutePedestrianLegDetails(
      afterTravelSteps: ((json['AfterTravelSteps'] as List?) ?? const [])
          .nonNulls
          .map((e) => RoutePedestrianAfterTravelStep.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      arrival: RoutePedestrianArrival.fromJson(
          (json['Arrival'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      departure: RoutePedestrianDeparture.fromJson(
          (json['Departure'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      notices: ((json['Notices'] as List?) ?? const [])
          .nonNulls
          .map((e) => RoutePedestrianNotice.fromJson(e as Map<String, dynamic>))
          .toList(),
      passThroughWaypoints:
          ((json['PassThroughWaypoints'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  RoutePassThroughWaypoint.fromJson(e as Map<String, dynamic>))
              .toList(),
      spans: ((json['Spans'] as List?) ?? const [])
          .nonNulls
          .map((e) => RoutePedestrianSpan.fromJson(e as Map<String, dynamic>))
          .toList(),
      travelSteps: ((json['TravelSteps'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RoutePedestrianTravelStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: json['Summary'] != null
          ? RoutePedestrianSummary.fromJson(
              json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final afterTravelSteps = this.afterTravelSteps;
    final arrival = this.arrival;
    final departure = this.departure;
    final notices = this.notices;
    final passThroughWaypoints = this.passThroughWaypoints;
    final spans = this.spans;
    final travelSteps = this.travelSteps;
    final summary = this.summary;
    return {
      'AfterTravelSteps': afterTravelSteps,
      'Arrival': arrival,
      'Departure': departure,
      'Notices': notices,
      'PassThroughWaypoints': passThroughWaypoints,
      'Spans': spans,
      'TravelSteps': travelSteps,
      if (summary != null) 'Summary': summary,
    };
  }
}

/// @nodoc
class RouteLegTravelMode {
  static const car = RouteLegTravelMode._('Car');
  static const ferry = RouteLegTravelMode._('Ferry');
  static const pedestrian = RouteLegTravelMode._('Pedestrian');
  static const scooter = RouteLegTravelMode._('Scooter');
  static const truck = RouteLegTravelMode._('Truck');
  static const carShuttleTrain = RouteLegTravelMode._('CarShuttleTrain');
  static const aerialTramway = RouteLegTravelMode._('AerialTramway');
  static const airplane = RouteLegTravelMode._('Airplane');
  static const bus = RouteLegTravelMode._('Bus');
  static const busRapidTransit = RouteLegTravelMode._('BusRapidTransit');
  static const cityTrain = RouteLegTravelMode._('CityTrain');
  static const funicularRailway = RouteLegTravelMode._('FunicularRailway');
  static const highSpeedTrain = RouteLegTravelMode._('HighSpeedTrain');
  static const intercityTrain = RouteLegTravelMode._('IntercityTrain');
  static const interregionalTrain = RouteLegTravelMode._('InterregionalTrain');
  static const lightRail = RouteLegTravelMode._('LightRail');
  static const monorail = RouteLegTravelMode._('Monorail');
  static const privateBus = RouteLegTravelMode._('PrivateBus');
  static const regionalTrain = RouteLegTravelMode._('RegionalTrain');
  static const subway = RouteLegTravelMode._('Subway');

  final String value;

  const RouteLegTravelMode._(this.value);

  static const values = [
    car,
    ferry,
    pedestrian,
    scooter,
    truck,
    carShuttleTrain,
    aerialTramway,
    airplane,
    bus,
    busRapidTransit,
    cityTrain,
    funicularRailway,
    highSpeedTrain,
    intercityTrain,
    interregionalTrain,
    lightRail,
    monorail,
    privateBus,
    regionalTrain,
    subway
  ];

  static RouteLegTravelMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteLegTravelMode._(value));

  @override
  bool operator ==(other) =>
      other is RouteLegTravelMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteLegType {
  static const ferry = RouteLegType._('Ferry');
  static const pedestrian = RouteLegType._('Pedestrian');
  static const vehicle = RouteLegType._('Vehicle');
  static const rental = RouteLegType._('Rental');
  static const taxi = RouteLegType._('Taxi');
  static const transit = RouteLegType._('Transit');

  final String value;

  const RouteLegType._(this.value);

  static const values = [ferry, pedestrian, vehicle, rental, taxi, transit];

  static RouteLegType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RouteLegType._(value));

  @override
  bool operator ==(other) => other is RouteLegType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Steps of a leg that correspond to the travel portion of the leg.
///
/// @nodoc
class RouteVehicleLegDetails {
  /// Steps of a leg that must be performed after the travel portion of the leg.
  final List<RouteVehicleAfterTravelStep> afterTravelSteps;

  /// Details corresponding to the arrival for the leg.
  final RouteVehicleArrival arrival;

  /// Details corresponding to the departure for the leg.
  final RouteVehicleDeparture departure;

  /// Incidents corresponding to this leg of the route. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<RouteVehicleIncident> incidents;

  /// Notices are additional information returned that indicate issues that
  /// occurred during route calculation. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<RouteVehicleNotice> notices;

  /// Waypoints that were passed through during the leg. This includes the
  /// waypoints that were configured with the PassThrough option.
  final List<RoutePassThroughWaypoint> passThroughWaypoints;

  /// Spans that were computed for the requested SpanAdditionalFeatures. Not
  /// supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<RouteVehicleSpan> spans;

  /// Toll systems are authorities that collect payments for the toll. Not
  /// supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<RouteTollSystem> tollSystems;

  /// Toll related options. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<RouteToll> tolls;

  /// Steps of a leg that must be performed before the travel portion of the leg.
  final List<RouteVehicleTravelStep> travelSteps;

  /// Truck road type identifiers. <code>BK1</code> through <code>BK4</code> apply
  /// only to Sweden. <code>A2,A4,B2,B4,C,D,ET2,ET4</code> apply only to Mexico.
  /// Not supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  /// <note>
  /// There are currently no other supported values as of 26th April 2024.
  /// </note>
  final List<String> truckRoadTypes;

  /// Zones corresponding to this leg of the route. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<RouteZone> zones;

  /// Summarized details of the leg.
  final RouteVehicleSummary? summary;

  RouteVehicleLegDetails({
    required this.afterTravelSteps,
    required this.arrival,
    required this.departure,
    required this.incidents,
    required this.notices,
    required this.passThroughWaypoints,
    required this.spans,
    required this.tollSystems,
    required this.tolls,
    required this.travelSteps,
    required this.truckRoadTypes,
    required this.zones,
    this.summary,
  });

  factory RouteVehicleLegDetails.fromJson(Map<String, dynamic> json) {
    return RouteVehicleLegDetails(
      afterTravelSteps: ((json['AfterTravelSteps'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RouteVehicleAfterTravelStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      arrival: RouteVehicleArrival.fromJson(
          (json['Arrival'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      departure: RouteVehicleDeparture.fromJson(
          (json['Departure'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      incidents: ((json['Incidents'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteVehicleIncident.fromJson(e as Map<String, dynamic>))
          .toList(),
      notices: ((json['Notices'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteVehicleNotice.fromJson(e as Map<String, dynamic>))
          .toList(),
      passThroughWaypoints:
          ((json['PassThroughWaypoints'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  RoutePassThroughWaypoint.fromJson(e as Map<String, dynamic>))
              .toList(),
      spans: ((json['Spans'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteVehicleSpan.fromJson(e as Map<String, dynamic>))
          .toList(),
      tollSystems: ((json['TollSystems'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteTollSystem.fromJson(e as Map<String, dynamic>))
          .toList(),
      tolls: ((json['Tolls'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteToll.fromJson(e as Map<String, dynamic>))
          .toList(),
      travelSteps: ((json['TravelSteps'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => RouteVehicleTravelStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      truckRoadTypes: ((json['TruckRoadTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      zones: ((json['Zones'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteZone.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: json['Summary'] != null
          ? RouteVehicleSummary.fromJson(
              json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final afterTravelSteps = this.afterTravelSteps;
    final arrival = this.arrival;
    final departure = this.departure;
    final incidents = this.incidents;
    final notices = this.notices;
    final passThroughWaypoints = this.passThroughWaypoints;
    final spans = this.spans;
    final tollSystems = this.tollSystems;
    final tolls = this.tolls;
    final travelSteps = this.travelSteps;
    final truckRoadTypes = this.truckRoadTypes;
    final zones = this.zones;
    final summary = this.summary;
    return {
      'AfterTravelSteps': afterTravelSteps,
      'Arrival': arrival,
      'Departure': departure,
      'Incidents': incidents,
      'Notices': notices,
      'PassThroughWaypoints': passThroughWaypoints,
      'Spans': spans,
      'TollSystems': tollSystems,
      'Tolls': tolls,
      'TravelSteps': travelSteps,
      'TruckRoadTypes': truckRoadTypes,
      'Zones': zones,
      if (summary != null) 'Summary': summary,
    };
  }
}

/// Populated when the Leg type is Rental, and provides additional information
/// that is specific to rental vehicle travel.
///
/// @nodoc
class RouteRentalLegDetails {
  /// Steps of a leg that must be performed after the travel portion of the leg.
  final List<RouteRentalAfterTravelStep> afterTravelSteps;

  /// Details about the rental agency.
  final RouteRentalAgency agency;

  /// Details corresponding to the arrival for the leg.
  final RouteRentalArrival arrival;

  /// List of required attributions to display.
  final List<RouteAttribution> attributions;

  /// Steps of a leg that must be performed before the travel portion of the leg.
  final List<RouteRentalBeforeTravelStep> beforeTravelSteps;

  /// Web links to external ticket booking services for the rental.
  final List<RouteWebLink> bookingWebLinks;

  /// Details corresponding to the departure for the leg.
  final RouteRentalDeparture departure;

  /// Transport mode details for the rental leg.
  final RouteRentalTransportModeDetails transport;

  /// Steps of a leg that must be performed during the travel portion of the leg.
  final List<RouteRentalTravelStep> travelSteps;

  /// Summary of the rental leg.
  final RouteRentalSummary? summary;

  RouteRentalLegDetails({
    required this.afterTravelSteps,
    required this.agency,
    required this.arrival,
    required this.attributions,
    required this.beforeTravelSteps,
    required this.bookingWebLinks,
    required this.departure,
    required this.transport,
    required this.travelSteps,
    this.summary,
  });

  factory RouteRentalLegDetails.fromJson(Map<String, dynamic> json) {
    return RouteRentalLegDetails(
      afterTravelSteps: ((json['AfterTravelSteps'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RouteRentalAfterTravelStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      agency: RouteRentalAgency.fromJson(
          (json['Agency'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      arrival: RouteRentalArrival.fromJson(
          (json['Arrival'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      attributions: ((json['Attributions'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteAttribution.fromJson(e as Map<String, dynamic>))
          .toList(),
      beforeTravelSteps: ((json['BeforeTravelSteps'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RouteRentalBeforeTravelStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookingWebLinks: ((json['BookingWebLinks'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteWebLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      departure: RouteRentalDeparture.fromJson(
          (json['Departure'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      transport: RouteRentalTransportModeDetails.fromJson(
          (json['Transport'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      travelSteps: ((json['TravelSteps'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteRentalTravelStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: json['Summary'] != null
          ? RouteRentalSummary.fromJson(json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final afterTravelSteps = this.afterTravelSteps;
    final agency = this.agency;
    final arrival = this.arrival;
    final attributions = this.attributions;
    final beforeTravelSteps = this.beforeTravelSteps;
    final bookingWebLinks = this.bookingWebLinks;
    final departure = this.departure;
    final transport = this.transport;
    final travelSteps = this.travelSteps;
    final summary = this.summary;
    return {
      'AfterTravelSteps': afterTravelSteps,
      'Agency': agency,
      'Arrival': arrival,
      'Attributions': attributions,
      'BeforeTravelSteps': beforeTravelSteps,
      'BookingWebLinks': bookingWebLinks,
      'Departure': departure,
      'Transport': transport,
      'TravelSteps': travelSteps,
      if (summary != null) 'Summary': summary,
    };
  }
}

/// Populated when the Leg type is Taxi, and provides additional information
/// that is specific to taxi travel.
///
/// @nodoc
class RouteTaxiLegDetails {
  /// Steps of a leg that must be performed after the travel portion of the leg.
  final List<RouteTaxiAfterTravelStep> afterTravelSteps;

  /// Details about the taxi agency.
  final RouteTaxiAgency agency;

  /// Details corresponding to the arrival for the leg.
  final RouteTaxiArrival arrival;

  /// List of required attributions to display.
  final List<RouteAttribution> attributions;

  /// Steps of a leg that must be performed before the travel portion of the leg.
  final List<RouteTaxiBeforeTravelStep> beforeTravelSteps;

  /// Web links to external ticket booking services for the taxi.
  final List<RouteWebLink> bookingWebLinks;

  /// Details corresponding to the departure for the leg.
  final RouteTaxiDeparture departure;

  /// List of notices that indicate issues that occurred during route calculation.
  final List<RouteTaxiNotice> notices;

  /// Transport mode details for the taxi leg.
  final RouteTaxiTransportModeDetails transport;

  /// Steps of a leg that must be performed during the travel portion of the leg.
  final List<RouteTaxiTravelStep> travelSteps;

  /// Summary of the taxi leg.
  final RouteTaxiSummary? summary;

  RouteTaxiLegDetails({
    required this.afterTravelSteps,
    required this.agency,
    required this.arrival,
    required this.attributions,
    required this.beforeTravelSteps,
    required this.bookingWebLinks,
    required this.departure,
    required this.notices,
    required this.transport,
    required this.travelSteps,
    this.summary,
  });

  factory RouteTaxiLegDetails.fromJson(Map<String, dynamic> json) {
    return RouteTaxiLegDetails(
      afterTravelSteps: ((json['AfterTravelSteps'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RouteTaxiAfterTravelStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      agency: RouteTaxiAgency.fromJson(
          (json['Agency'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      arrival: RouteTaxiArrival.fromJson(
          (json['Arrival'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      attributions: ((json['Attributions'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteAttribution.fromJson(e as Map<String, dynamic>))
          .toList(),
      beforeTravelSteps: ((json['BeforeTravelSteps'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RouteTaxiBeforeTravelStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookingWebLinks: ((json['BookingWebLinks'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteWebLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      departure: RouteTaxiDeparture.fromJson(
          (json['Departure'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      notices: ((json['Notices'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteTaxiNotice.fromJson(e as Map<String, dynamic>))
          .toList(),
      transport: RouteTaxiTransportModeDetails.fromJson(
          (json['Transport'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      travelSteps: ((json['TravelSteps'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteTaxiTravelStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: json['Summary'] != null
          ? RouteTaxiSummary.fromJson(json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final afterTravelSteps = this.afterTravelSteps;
    final agency = this.agency;
    final arrival = this.arrival;
    final attributions = this.attributions;
    final beforeTravelSteps = this.beforeTravelSteps;
    final bookingWebLinks = this.bookingWebLinks;
    final departure = this.departure;
    final notices = this.notices;
    final transport = this.transport;
    final travelSteps = this.travelSteps;
    final summary = this.summary;
    return {
      'AfterTravelSteps': afterTravelSteps,
      'Agency': agency,
      'Arrival': arrival,
      'Attributions': attributions,
      'BeforeTravelSteps': beforeTravelSteps,
      'BookingWebLinks': bookingWebLinks,
      'Departure': departure,
      'Notices': notices,
      'Transport': transport,
      'TravelSteps': travelSteps,
      if (summary != null) 'Summary': summary,
    };
  }
}

/// Populated when the Leg type is Transit, and provides additional information
/// that is specific to public transit travel.
///
/// @nodoc
class RouteTransitLegDetails {
  /// Steps of a leg that must be performed after the travel portion of the leg.
  final List<RouteTransitAfterTravelStep> afterTravelSteps;

  /// Details corresponding to the arrival for the leg.
  final RouteTransitArrival arrival;

  /// List of required attributions to display.
  final List<RouteAttribution> attributions;

  /// Steps of a leg that must be performed before the travel portion of the leg.
  final List<RouteTransitBeforeTravelStep> beforeTravelSteps;

  /// Web links to external ticket booking services for the transit.
  final List<RouteWebLink> bookingWebLinks;

  /// Details corresponding to the departure for the leg.
  final RouteTransitDeparture departure;

  /// Incidents affecting this leg of the transit route.
  final List<RouteTransitIncident> incidents;

  /// Intermediate stops between departure and destination of the transit route.
  final List<RouteTransitIntermediateStop> intermediateStops;

  /// List of next departures that cover the same section of the route.
  final List<RouteTransitNextDeparture> nextDepartures;

  /// List of notices that indicate issues that occurred during route calculation.
  final List<RouteTransitNotice> notices;

  /// Waypoints that were passed through during the leg. This includes the
  /// waypoints that were configured with the PassThrough option. Not populated
  /// when the TravelMode is <code>Transit</code> or <code>Intermodal</code>.
  final List<RoutePassThroughWaypoint> passThroughWaypoints;

  /// Spans that were computed for the requested SpanAdditionalFeatures. Not
  /// populated when the TravelMode is <code>Transit</code> or
  /// <code>Intermodal</code>.
  final List<RouteTransitSpan> spans;

  /// Transport mode details for the transit leg.
  final RouteTransitTransportModeDetails transport;

  /// Steps of a leg that must be performed during the travel portion of the leg.
  final List<RouteTransitTravelStep> travelSteps;

  /// Details about the transit agency.
  final RouteTransitAgency? agency;

  /// Summary of the transit leg.
  final RouteTransitSummary? summary;

  RouteTransitLegDetails({
    required this.afterTravelSteps,
    required this.arrival,
    required this.attributions,
    required this.beforeTravelSteps,
    required this.bookingWebLinks,
    required this.departure,
    required this.incidents,
    required this.intermediateStops,
    required this.nextDepartures,
    required this.notices,
    required this.passThroughWaypoints,
    required this.spans,
    required this.transport,
    required this.travelSteps,
    this.agency,
    this.summary,
  });

  factory RouteTransitLegDetails.fromJson(Map<String, dynamic> json) {
    return RouteTransitLegDetails(
      afterTravelSteps: ((json['AfterTravelSteps'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RouteTransitAfterTravelStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      arrival: RouteTransitArrival.fromJson(
          (json['Arrival'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      attributions: ((json['Attributions'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteAttribution.fromJson(e as Map<String, dynamic>))
          .toList(),
      beforeTravelSteps: ((json['BeforeTravelSteps'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RouteTransitBeforeTravelStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookingWebLinks: ((json['BookingWebLinks'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteWebLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      departure: RouteTransitDeparture.fromJson(
          (json['Departure'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      incidents: ((json['Incidents'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteTransitIncident.fromJson(e as Map<String, dynamic>))
          .toList(),
      intermediateStops: ((json['IntermediateStops'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RouteTransitIntermediateStop.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextDepartures: ((json['NextDepartures'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RouteTransitNextDeparture.fromJson(e as Map<String, dynamic>))
          .toList(),
      notices: ((json['Notices'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteTransitNotice.fromJson(e as Map<String, dynamic>))
          .toList(),
      passThroughWaypoints:
          ((json['PassThroughWaypoints'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  RoutePassThroughWaypoint.fromJson(e as Map<String, dynamic>))
              .toList(),
      spans: ((json['Spans'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteTransitSpan.fromJson(e as Map<String, dynamic>))
          .toList(),
      transport: RouteTransitTransportModeDetails.fromJson(
          (json['Transport'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      travelSteps: ((json['TravelSteps'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => RouteTransitTravelStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      agency: json['Agency'] != null
          ? RouteTransitAgency.fromJson(json['Agency'] as Map<String, dynamic>)
          : null,
      summary: json['Summary'] != null
          ? RouteTransitSummary.fromJson(
              json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final afterTravelSteps = this.afterTravelSteps;
    final arrival = this.arrival;
    final attributions = this.attributions;
    final beforeTravelSteps = this.beforeTravelSteps;
    final bookingWebLinks = this.bookingWebLinks;
    final departure = this.departure;
    final incidents = this.incidents;
    final intermediateStops = this.intermediateStops;
    final nextDepartures = this.nextDepartures;
    final notices = this.notices;
    final passThroughWaypoints = this.passThroughWaypoints;
    final spans = this.spans;
    final transport = this.transport;
    final travelSteps = this.travelSteps;
    final agency = this.agency;
    final summary = this.summary;
    return {
      'AfterTravelSteps': afterTravelSteps,
      'Arrival': arrival,
      'Attributions': attributions,
      'BeforeTravelSteps': beforeTravelSteps,
      'BookingWebLinks': bookingWebLinks,
      'Departure': departure,
      'Incidents': incidents,
      'IntermediateStops': intermediateStops,
      'NextDepartures': nextDepartures,
      'Notices': notices,
      'PassThroughWaypoints': passThroughWaypoints,
      'Spans': spans,
      'Transport': transport,
      'TravelSteps': travelSteps,
      if (agency != null) 'Agency': agency,
      if (summary != null) 'Summary': summary,
    };
  }
}

/// Details about the transit agency.
///
/// @nodoc
class RouteTransitAgency {
  /// Name of the agency.
  final String name;

  /// URL to the agency's website.
  final String? url;

  RouteTransitAgency({
    required this.name,
    this.url,
  });

  factory RouteTransitAgency.fromJson(Map<String, dynamic> json) {
    return RouteTransitAgency(
      name: (json['Name'] as String?) ?? '',
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final url = this.url;
    return {
      'Name': name,
      if (url != null) 'Url': url,
    };
  }
}

/// Details corresponding to the arrival for the leg.
///
/// @nodoc
class RouteTransitArrival {
  /// Place details corresponding to the arrival.
  final RouteTransitPlace place;

  /// The delay from the scheduled arrival time.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? delay;

  /// The status of the arrival.
  final RouteTransitTripStatus? status;

  /// The arrival time.
  final String? time;

  RouteTransitArrival({
    required this.place,
    this.delay,
    this.status,
    this.time,
  });

  factory RouteTransitArrival.fromJson(Map<String, dynamic> json) {
    return RouteTransitArrival(
      place: RouteTransitPlace.fromJson(
          (json['Place'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      delay: json['Delay'] as int?,
      status:
          (json['Status'] as String?)?.let(RouteTransitTripStatus.fromString),
      time: json['Time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    final delay = this.delay;
    final status = this.status;
    final time = this.time;
    return {
      'Place': place,
      if (delay != null) 'Delay': delay,
      if (status != null) 'Status': status.value,
      if (time != null) 'Time': time,
    };
  }
}

/// Details corresponding to the departure for the leg.
///
/// @nodoc
class RouteTransitDeparture {
  /// Place details corresponding to the departure.
  final RouteTransitPlace place;

  /// The delay from the scheduled departure time.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? delay;

  /// The status of the departure.
  final RouteTransitTripStatus? status;

  /// The departure time.
  final String? time;

  RouteTransitDeparture({
    required this.place,
    this.delay,
    this.status,
    this.time,
  });

  factory RouteTransitDeparture.fromJson(Map<String, dynamic> json) {
    return RouteTransitDeparture(
      place: RouteTransitPlace.fromJson(
          (json['Place'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      delay: json['Delay'] as int?,
      status:
          (json['Status'] as String?)?.let(RouteTransitTripStatus.fromString),
      time: json['Time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    final delay = this.delay;
    final status = this.status;
    final time = this.time;
    return {
      'Place': place,
      if (delay != null) 'Delay': delay,
      if (status != null) 'Status': status.value,
      if (time != null) 'Time': time,
    };
  }
}

/// Summary of the transit leg.
///
/// @nodoc
class RouteTransitSummary {
  /// Summary including duration and distance for the entire leg.
  final RouteTransitOverviewSummary? overview;

  /// Summary including duration and distance for the travel portion of the leg
  /// only.
  final RouteTransitTravelOnlySummary? travelOnly;

  RouteTransitSummary({
    this.overview,
    this.travelOnly,
  });

  factory RouteTransitSummary.fromJson(Map<String, dynamic> json) {
    return RouteTransitSummary(
      overview: json['Overview'] != null
          ? RouteTransitOverviewSummary.fromJson(
              json['Overview'] as Map<String, dynamic>)
          : null,
      travelOnly: json['TravelOnly'] != null
          ? RouteTransitTravelOnlySummary.fromJson(
              json['TravelOnly'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final overview = this.overview;
    final travelOnly = this.travelOnly;
    return {
      if (overview != null) 'Overview': overview,
      if (travelOnly != null) 'TravelOnly': travelOnly,
    };
  }
}

/// Transport mode details for the transit leg.
///
/// @nodoc
class RouteTransitTransportModeDetails {
  /// Mode of the transit transport.
  final RouteTransitMode mode;

  /// Wheelchair accessibility information for the transit vehicle.
  final RouteAccessibilityAvailabilityDetails? accessibility;

  /// Color of the transport polyline and background for the transport name.
  final String? color;

  /// Transit route headsign.
  final String? headsign;

  /// Long name of the transit route.
  final String? longRouteName;

  /// Transit route name.
  final String? routeName;

  /// Short name of the transit route.
  final String? shortRouteName;

  /// Color of the transport name text.
  final String? textColor;

  RouteTransitTransportModeDetails({
    required this.mode,
    this.accessibility,
    this.color,
    this.headsign,
    this.longRouteName,
    this.routeName,
    this.shortRouteName,
    this.textColor,
  });

  factory RouteTransitTransportModeDetails.fromJson(Map<String, dynamic> json) {
    return RouteTransitTransportModeDetails(
      mode: RouteTransitMode.fromString((json['Mode'] as String?) ?? ''),
      accessibility: json['Accessibility'] != null
          ? RouteAccessibilityAvailabilityDetails.fromJson(
              json['Accessibility'] as Map<String, dynamic>)
          : null,
      color: json['Color'] as String?,
      headsign: json['Headsign'] as String?,
      longRouteName: json['LongRouteName'] as String?,
      routeName: json['RouteName'] as String?,
      shortRouteName: json['ShortRouteName'] as String?,
      textColor: json['TextColor'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final accessibility = this.accessibility;
    final color = this.color;
    final headsign = this.headsign;
    final longRouteName = this.longRouteName;
    final routeName = this.routeName;
    final shortRouteName = this.shortRouteName;
    final textColor = this.textColor;
    return {
      'Mode': mode.value,
      if (accessibility != null) 'Accessibility': accessibility,
      if (color != null) 'Color': color,
      if (headsign != null) 'Headsign': headsign,
      if (longRouteName != null) 'LongRouteName': longRouteName,
      if (routeName != null) 'RouteName': routeName,
      if (shortRouteName != null) 'ShortRouteName': shortRouteName,
      if (textColor != null) 'TextColor': textColor,
    };
  }
}

/// A step that must be performed during the travel portion of the leg.
///
/// @nodoc
class RouteTransitTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RouteTransitTravelStepType type;

  /// Distance of the step.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int? distance;

  /// Offset in the leg geometry corresponding to the start of this step.
  final int? geometryOffset;

  /// Brief description of the step in the requested language.
  final String? instruction;

  RouteTransitTravelStep({
    required this.duration,
    required this.type,
    this.distance,
    this.geometryOffset,
    this.instruction,
  });

  factory RouteTransitTravelStep.fromJson(Map<String, dynamic> json) {
    return RouteTransitTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type: RouteTransitTravelStepType.fromString(
          (json['Type'] as String?) ?? ''),
      distance: json['Distance'] as int?,
      geometryOffset: json['GeometryOffset'] as int?,
      instruction: json['Instruction'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final distance = this.distance;
    final geometryOffset = this.geometryOffset;
    final instruction = this.instruction;
    return {
      'Duration': duration,
      'Type': type.value,
      if (distance != null) 'Distance': distance,
      if (geometryOffset != null) 'GeometryOffset': geometryOffset,
      if (instruction != null) 'Instruction': instruction,
    };
  }
}

/// @nodoc
class RouteTransitTravelStepType {
  static const depart = RouteTransitTravelStepType._('Depart');

  final String value;

  const RouteTransitTravelStepType._(this.value);

  static const values = [depart];

  static RouteTransitTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTransitTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RouteTransitTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the availability of accessibility features.
///
/// @nodoc
class RouteAccessibilityAvailabilityDetails {
  /// Wheelchair accessibility status.
  final RouteAccessibilityAvailability? wheelchair;

  RouteAccessibilityAvailabilityDetails({
    this.wheelchair,
  });

  factory RouteAccessibilityAvailabilityDetails.fromJson(
      Map<String, dynamic> json) {
    return RouteAccessibilityAvailabilityDetails(
      wheelchair: (json['Wheelchair'] as String?)
          ?.let(RouteAccessibilityAvailability.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final wheelchair = this.wheelchair;
    return {
      if (wheelchair != null) 'Wheelchair': wheelchair.value,
    };
  }
}

/// @nodoc
class RouteTransitMode {
  static const aerialTramway = RouteTransitMode._('AerialTramway');
  static const airplane = RouteTransitMode._('Airplane');
  static const all = RouteTransitMode._('All');
  static const bus = RouteTransitMode._('Bus');
  static const busRapidTransit = RouteTransitMode._('BusRapidTransit');
  static const cityTrain = RouteTransitMode._('CityTrain');
  static const ferry = RouteTransitMode._('Ferry');
  static const funicularRailway = RouteTransitMode._('FunicularRailway');
  static const highSpeedTrain = RouteTransitMode._('HighSpeedTrain');
  static const intercityTrain = RouteTransitMode._('IntercityTrain');
  static const interregionalTrain = RouteTransitMode._('InterregionalTrain');
  static const lightRail = RouteTransitMode._('LightRail');
  static const monorail = RouteTransitMode._('Monorail');
  static const privateBus = RouteTransitMode._('PrivateBus');
  static const regionalTrain = RouteTransitMode._('RegionalTrain');
  static const subway = RouteTransitMode._('Subway');

  final String value;

  const RouteTransitMode._(this.value);

  static const values = [
    aerialTramway,
    airplane,
    all,
    bus,
    busRapidTransit,
    cityTrain,
    ferry,
    funicularRailway,
    highSpeedTrain,
    intercityTrain,
    interregionalTrain,
    lightRail,
    monorail,
    privateBus,
    regionalTrain,
    subway
  ];

  static RouteTransitMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTransitMode._(value));

  @override
  bool operator ==(other) => other is RouteTransitMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteAccessibilityAvailability {
  static const available = RouteAccessibilityAvailability._('Available');
  static const limited = RouteAccessibilityAvailability._('Limited');
  static const unavailable = RouteAccessibilityAvailability._('Unavailable');
  static const unknown = RouteAccessibilityAvailability._('Unknown');

  final String value;

  const RouteAccessibilityAvailability._(this.value);

  static const values = [available, limited, unavailable, unknown];

  static RouteAccessibilityAvailability fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteAccessibilityAvailability._(value));

  @override
  bool operator ==(other) =>
      other is RouteAccessibilityAvailability && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary including duration and distance for the entire leg.
///
/// @nodoc
class RouteTransitOverviewSummary {
  /// Distance of the entire leg.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int distance;

  /// Duration of the entire leg.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  RouteTransitOverviewSummary({
    required this.distance,
    required this.duration,
  });

  factory RouteTransitOverviewSummary.fromJson(Map<String, dynamic> json) {
    return RouteTransitOverviewSummary(
      distance: (json['Distance'] as int?) ?? 0,
      duration: (json['Duration'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final duration = this.duration;
    return {
      'Distance': distance,
      'Duration': duration,
    };
  }
}

/// Summary including duration and distance for the travel portion of the leg
/// only.
///
/// @nodoc
class RouteTransitTravelOnlySummary {
  /// Duration of the travel portion of the transit leg.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  RouteTransitTravelOnlySummary({
    required this.duration,
  });

  factory RouteTransitTravelOnlySummary.fromJson(Map<String, dynamic> json) {
    return RouteTransitTravelOnlySummary(
      duration: (json['Duration'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    return {
      'Duration': duration,
    };
  }
}

/// Span computed for the requested SpanAdditionalFeatures.
///
/// @nodoc
class RouteTransitSpan {
  /// 3 letter Country code corresponding to the Span.
  final String? country;

  /// Distance of the computed span. This feature doesn't split a span, but is
  /// always computed on a span split by other properties.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int? distance;

  /// Duration of the computed span. This feature doesn't split a span, but is
  /// always computed on a span split by other properties.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? duration;

  /// Offset in the leg geometry corresponding to the start of this span.
  final int? geometryOffset;

  /// Names of the transit span in available languages.
  final List<LocalizedString>? names;

  /// 2-3 letter Region code corresponding to the Span. This is either a province
  /// or a state.
  final String? region;

  RouteTransitSpan({
    this.country,
    this.distance,
    this.duration,
    this.geometryOffset,
    this.names,
    this.region,
  });

  factory RouteTransitSpan.fromJson(Map<String, dynamic> json) {
    return RouteTransitSpan(
      country: json['Country'] as String?,
      distance: json['Distance'] as int?,
      duration: json['Duration'] as int?,
      geometryOffset: json['GeometryOffset'] as int?,
      names: (json['Names'] as List?)
          ?.nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      region: json['Region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final country = this.country;
    final distance = this.distance;
    final duration = this.duration;
    final geometryOffset = this.geometryOffset;
    final names = this.names;
    final region = this.region;
    return {
      if (country != null) 'Country': country,
      if (distance != null) 'Distance': distance,
      if (duration != null) 'Duration': duration,
      if (geometryOffset != null) 'GeometryOffset': geometryOffset,
      if (names != null) 'Names': names,
      if (region != null) 'Region': region,
    };
  }
}

/// If the waypoint should be treated as a stop. If yes, the route is split up
/// into different legs around the stop.
///
/// @nodoc
class RoutePassThroughWaypoint {
  /// Place details corresponding to the pass-through waypoint.
  final RoutePassThroughPlace place;

  /// Offset in the leg geometry corresponding to the start of this step.
  final int? geometryOffset;

  RoutePassThroughWaypoint({
    required this.place,
    this.geometryOffset,
  });

  factory RoutePassThroughWaypoint.fromJson(Map<String, dynamic> json) {
    return RoutePassThroughWaypoint(
      place: RoutePassThroughPlace.fromJson(
          (json['Place'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      geometryOffset: json['GeometryOffset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    final geometryOffset = this.geometryOffset;
    return {
      'Place': place,
      if (geometryOffset != null) 'GeometryOffset': geometryOffset,
    };
  }
}

/// The place where the waypoint is passed through and not treated as a stop.
///
/// @nodoc
class RoutePassThroughPlace {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// Position provided in the request.
  final List<double>? originalPosition;

  /// Index of the waypoint in the request.
  final int? waypointIndex;

  RoutePassThroughPlace({
    required this.position,
    this.originalPosition,
    this.waypointIndex,
  });

  factory RoutePassThroughPlace.fromJson(Map<String, dynamic> json) {
    return RoutePassThroughPlace(
      position: ((json['Position'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      originalPosition: (json['OriginalPosition'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      waypointIndex: json['WaypointIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final originalPosition = this.originalPosition;
    final waypointIndex = this.waypointIndex;
    return {
      'Position': position,
      if (originalPosition != null) 'OriginalPosition': originalPosition,
      if (waypointIndex != null) 'WaypointIndex': waypointIndex,
    };
  }
}

/// A notice that indicates an issue that occurred during route calculation.
///
/// @nodoc
class RouteTransitNotice {
  /// Code corresponding to the issue.
  final RouteTransitNoticeCode code;

  /// Impact corresponding to the issue. While Low impact notices can be safely
  /// ignored, High impact notices must be evaluated further to determine the
  /// impact.
  final RouteNoticeImpact? impact;

  RouteTransitNotice({
    required this.code,
    this.impact,
  });

  factory RouteTransitNotice.fromJson(Map<String, dynamic> json) {
    return RouteTransitNotice(
      code: RouteTransitNoticeCode.fromString((json['Code'] as String?) ?? ''),
      impact: (json['Impact'] as String?)?.let(RouteNoticeImpact.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final impact = this.impact;
    return {
      'Code': code.value,
      if (impact != null) 'Impact': impact.value,
    };
  }
}

/// @nodoc
class RouteTransitNoticeCode {
  static const accuratePolylineUnavailable =
      RouteTransitNoticeCode._('AccuratePolylineUnavailable');
  static const intermediateStopsUnavailable =
      RouteTransitNoticeCode._('IntermediateStopsUnavailable');
  static const noSchedule = RouteTransitNoticeCode._('NoSchedule');
  static const other = RouteTransitNoticeCode._('Other');
  static const potentialViolatedVehicleRestrictionUsage =
      RouteTransitNoticeCode._('PotentialViolatedVehicleRestrictionUsage');
  static const scheduledTimes = RouteTransitNoticeCode._('ScheduledTimes');
  static const seasonalClosure = RouteTransitNoticeCode._('SeasonalClosure');
  static const violatedAvoidFerry =
      RouteTransitNoticeCode._('ViolatedAvoidFerry');
  static const violatedAvoidRailFerry =
      RouteTransitNoticeCode._('ViolatedAvoidRailFerry');
  static const violatedExcludedTransitMode =
      RouteTransitNoticeCode._('ViolatedExcludedTransitMode');
  static const violatedVehicleRestriction =
      RouteTransitNoticeCode._('ViolatedVehicleRestriction');
  static const violatedAvoidAreas =
      RouteTransitNoticeCode._('ViolatedAvoidAreas');

  final String value;

  const RouteTransitNoticeCode._(this.value);

  static const values = [
    accuratePolylineUnavailable,
    intermediateStopsUnavailable,
    noSchedule,
    other,
    potentialViolatedVehicleRestrictionUsage,
    scheduledTimes,
    seasonalClosure,
    violatedAvoidFerry,
    violatedAvoidRailFerry,
    violatedExcludedTransitMode,
    violatedVehicleRestriction,
    violatedAvoidAreas
  ];

  static RouteTransitNoticeCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTransitNoticeCode._(value));

  @override
  bool operator ==(other) =>
      other is RouteTransitNoticeCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteNoticeImpact {
  static const high = RouteNoticeImpact._('High');
  static const low = RouteNoticeImpact._('Low');

  final String value;

  const RouteNoticeImpact._(this.value);

  static const values = [high, low];

  static RouteNoticeImpact fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteNoticeImpact._(value));

  @override
  bool operator ==(other) => other is RouteNoticeImpact && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the next available departure for the transit service.
///
/// @nodoc
class RouteTransitNextDeparture {
  /// The departure time.
  final String time;

  /// The delay from the scheduled departure time.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? delay;

  /// Platform name or number for the departure.
  final String? platformName;

  /// The status of the departure.
  final RouteTransitTripStatus? status;

  /// Transport mode details for this departure.
  final RouteTransitTransportModeDetails? transport;

  RouteTransitNextDeparture({
    required this.time,
    this.delay,
    this.platformName,
    this.status,
    this.transport,
  });

  factory RouteTransitNextDeparture.fromJson(Map<String, dynamic> json) {
    return RouteTransitNextDeparture(
      time: (json['Time'] as String?) ?? '',
      delay: json['Delay'] as int?,
      platformName: json['PlatformName'] as String?,
      status:
          (json['Status'] as String?)?.let(RouteTransitTripStatus.fromString),
      transport: json['Transport'] != null
          ? RouteTransitTransportModeDetails.fromJson(
              json['Transport'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final time = this.time;
    final delay = this.delay;
    final platformName = this.platformName;
    final status = this.status;
    final transport = this.transport;
    return {
      'Time': time,
      if (delay != null) 'Delay': delay,
      if (platformName != null) 'PlatformName': platformName,
      if (status != null) 'Status': status.value,
      if (transport != null) 'Transport': transport,
    };
  }
}

/// @nodoc
class RouteTransitTripStatus {
  static const added = RouteTransitTripStatus._('Added');
  static const cancelled = RouteTransitTripStatus._('Cancelled');
  static const replaced = RouteTransitTripStatus._('Replaced');
  static const scheduled = RouteTransitTripStatus._('Scheduled');

  final String value;

  const RouteTransitTripStatus._(this.value);

  static const values = [added, cancelled, replaced, scheduled];

  static RouteTransitTripStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTransitTripStatus._(value));

  @override
  bool operator ==(other) =>
      other is RouteTransitTripStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An intermediate stop between departure and destination of the transit route.
///
/// @nodoc
class RouteTransitIntermediateStop {
  /// Departure details for the intermediate stop.
  final RouteTransitDeparture departure;

  /// Duration of the stop.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Attributes of the intermediate stop.
  final List<RouteTransitIntermediateStopAttribute>? attributes;

  /// Offset in the leg geometry corresponding to the start of this stop.
  final int? geometryOffset;

  /// Transport mode details at the intermediate stop.
  final RouteTransitTransportModeDetails? transport;

  RouteTransitIntermediateStop({
    required this.departure,
    required this.duration,
    this.attributes,
    this.geometryOffset,
    this.transport,
  });

  factory RouteTransitIntermediateStop.fromJson(Map<String, dynamic> json) {
    return RouteTransitIntermediateStop(
      departure: RouteTransitDeparture.fromJson(
          (json['Departure'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      duration: (json['Duration'] as int?) ?? 0,
      attributes: (json['Attributes'] as List?)
          ?.nonNulls
          .map((e) =>
              RouteTransitIntermediateStopAttribute.fromString((e as String)))
          .toList(),
      geometryOffset: json['GeometryOffset'] as int?,
      transport: json['Transport'] != null
          ? RouteTransitTransportModeDetails.fromJson(
              json['Transport'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final departure = this.departure;
    final duration = this.duration;
    final attributes = this.attributes;
    final geometryOffset = this.geometryOffset;
    final transport = this.transport;
    return {
      'Departure': departure,
      'Duration': duration,
      if (attributes != null)
        'Attributes': attributes.map((e) => e.value).toList(),
      if (geometryOffset != null) 'GeometryOffset': geometryOffset,
      if (transport != null) 'Transport': transport,
    };
  }
}

/// @nodoc
class RouteTransitIntermediateStopAttribute {
  static const noEntry = RouteTransitIntermediateStopAttribute._('NoEntry');
  static const noExit = RouteTransitIntermediateStopAttribute._('NoExit');

  final String value;

  const RouteTransitIntermediateStopAttribute._(this.value);

  static const values = [noEntry, noExit];

  static RouteTransitIntermediateStopAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTransitIntermediateStopAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RouteTransitIntermediateStopAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An incident describes disruptions on the transit route.
///
/// @nodoc
class RouteTransitIncident {
  /// The effect of the incident on the transit service.
  final RouteTransitIncidentEffect effect;

  /// Type of the incident.
  final RouteTransitIncidentType type;

  /// A human readable description of the incident.
  final String? description;

  /// The end time of the incident.
  final String? endTime;

  /// The start time of the incident.
  final String? startTime;

  /// URL to the original incident published at the agency website.
  final String? url;

  RouteTransitIncident({
    required this.effect,
    required this.type,
    this.description,
    this.endTime,
    this.startTime,
    this.url,
  });

  factory RouteTransitIncident.fromJson(Map<String, dynamic> json) {
    return RouteTransitIncident(
      effect: RouteTransitIncidentEffect.fromString(
          (json['Effect'] as String?) ?? ''),
      type:
          RouteTransitIncidentType.fromString((json['Type'] as String?) ?? ''),
      description: json['Description'] as String?,
      endTime: json['EndTime'] as String?,
      startTime: json['StartTime'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final effect = this.effect;
    final type = this.type;
    final description = this.description;
    final endTime = this.endTime;
    final startTime = this.startTime;
    final url = this.url;
    return {
      'Effect': effect.value,
      'Type': type.value,
      if (description != null) 'Description': description,
      if (endTime != null) 'EndTime': endTime,
      if (startTime != null) 'StartTime': startTime,
      if (url != null) 'Url': url,
    };
  }
}

/// @nodoc
class RouteTransitIncidentEffect {
  static const delayed = RouteTransitIncidentEffect._('Delayed');
  static const detoured = RouteTransitIncidentEffect._('Detoured');
  static const other = RouteTransitIncidentEffect._('Other');
  static const serviceAdded = RouteTransitIncidentEffect._('ServiceAdded');
  static const serviceCancelled =
      RouteTransitIncidentEffect._('ServiceCancelled');
  static const serviceModified =
      RouteTransitIncidentEffect._('ServiceModified');
  static const serviceReduced = RouteTransitIncidentEffect._('ServiceReduced');
  static const stopMoved = RouteTransitIncidentEffect._('StopMoved');

  final String value;

  const RouteTransitIncidentEffect._(this.value);

  static const values = [
    delayed,
    detoured,
    other,
    serviceAdded,
    serviceCancelled,
    serviceModified,
    serviceReduced,
    stopMoved
  ];

  static RouteTransitIncidentEffect fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTransitIncidentEffect._(value));

  @override
  bool operator ==(other) =>
      other is RouteTransitIncidentEffect && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteTransitIncidentType {
  static const accident = RouteTransitIncidentType._('Accident');
  static const construction = RouteTransitIncidentType._('Construction');
  static const demonstration = RouteTransitIncidentType._('Demonstration');
  static const holiday = RouteTransitIncidentType._('Holiday');
  static const maintenance = RouteTransitIncidentType._('Maintenance');
  static const medicalEmergency =
      RouteTransitIncidentType._('MedicalEmergency');
  static const other = RouteTransitIncidentType._('Other');
  static const policeActivity = RouteTransitIncidentType._('PoliceActivity');
  static const strike = RouteTransitIncidentType._('Strike');
  static const technicalProblem =
      RouteTransitIncidentType._('TechnicalProblem');
  static const weather = RouteTransitIncidentType._('Weather');

  final String value;

  const RouteTransitIncidentType._(this.value);

  static const values = [
    accident,
    construction,
    demonstration,
    holiday,
    maintenance,
    medicalEmergency,
    other,
    policeActivity,
    strike,
    technicalProblem,
    weather
  ];

  static RouteTransitIncidentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTransitIncidentType._(value));

  @override
  bool operator ==(other) =>
      other is RouteTransitIncidentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Place details corresponding to the arrival or departure.
///
/// @nodoc
class RouteTransitPlace {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// The name of the place.
  final String? name;

  /// Position provided in the request.
  final List<double>? originalPosition;

  /// Details about the station.
  final RouteStationDetails? stationDetails;

  /// The type of the place.
  final RouteTransitPlaceType? type;

  /// Index of the waypoint in the request.
  final int? waypointIndex;

  RouteTransitPlace({
    required this.position,
    this.name,
    this.originalPosition,
    this.stationDetails,
    this.type,
    this.waypointIndex,
  });

  factory RouteTransitPlace.fromJson(Map<String, dynamic> json) {
    return RouteTransitPlace(
      position: ((json['Position'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      name: json['Name'] as String?,
      originalPosition: (json['OriginalPosition'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      stationDetails: json['StationDetails'] != null
          ? RouteStationDetails.fromJson(
              json['StationDetails'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.let(RouteTransitPlaceType.fromString),
      waypointIndex: json['WaypointIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final name = this.name;
    final originalPosition = this.originalPosition;
    final stationDetails = this.stationDetails;
    final type = this.type;
    final waypointIndex = this.waypointIndex;
    return {
      'Position': position,
      if (name != null) 'Name': name,
      if (originalPosition != null) 'OriginalPosition': originalPosition,
      if (stationDetails != null) 'StationDetails': stationDetails,
      if (type != null) 'Type': type.value,
      if (waypointIndex != null) 'WaypointIndex': waypointIndex,
    };
  }
}

/// Details about the station.
///
/// @nodoc
class RouteStationDetails {
  /// Wheelchair accessibility information for the station.
  final RouteAccessibilityAvailabilityDetails? accessibility;

  /// Platform name or number.
  final String? platformName;

  /// Short text or a number that identifies the station.
  final String? shortName;

  RouteStationDetails({
    this.accessibility,
    this.platformName,
    this.shortName,
  });

  factory RouteStationDetails.fromJson(Map<String, dynamic> json) {
    return RouteStationDetails(
      accessibility: json['Accessibility'] != null
          ? RouteAccessibilityAvailabilityDetails.fromJson(
              json['Accessibility'] as Map<String, dynamic>)
          : null,
      platformName: json['PlatformName'] as String?,
      shortName: json['ShortName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessibility = this.accessibility;
    final platformName = this.platformName;
    final shortName = this.shortName;
    return {
      if (accessibility != null) 'Accessibility': accessibility,
      if (platformName != null) 'PlatformName': platformName,
      if (shortName != null) 'ShortName': shortName,
    };
  }
}

/// @nodoc
class RouteTransitPlaceType {
  static const station = RouteTransitPlaceType._('Station');

  final String value;

  const RouteTransitPlaceType._(this.value);

  static const values = [station];

  static RouteTransitPlaceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTransitPlaceType._(value));

  @override
  bool operator ==(other) =>
      other is RouteTransitPlaceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The URL to an external resource.
///
/// @nodoc
class RouteWebLink {
  /// Text describing the URL.
  final String description;

  /// The interactive or clickable portion of the text.
  final String? anchorText;

  /// Device type for which the link is intended.
  final RouteWebLinkDeviceType? deviceType;

  /// The URL of the link.
  final String? url;

  RouteWebLink({
    required this.description,
    this.anchorText,
    this.deviceType,
    this.url,
  });

  factory RouteWebLink.fromJson(Map<String, dynamic> json) {
    return RouteWebLink(
      description: (json['Description'] as String?) ?? '',
      anchorText: json['AnchorText'] as String?,
      deviceType: (json['DeviceType'] as String?)
          ?.let(RouteWebLinkDeviceType.fromString),
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final anchorText = this.anchorText;
    final deviceType = this.deviceType;
    final url = this.url;
    return {
      'Description': description,
      if (anchorText != null) 'AnchorText': anchorText,
      if (deviceType != null) 'DeviceType': deviceType.value,
      if (url != null) 'Url': url,
    };
  }
}

/// @nodoc
class RouteWebLinkDeviceType {
  static const android = RouteWebLinkDeviceType._('Android');
  static const ios = RouteWebLinkDeviceType._('Ios');
  static const web = RouteWebLinkDeviceType._('Web');

  final String value;

  const RouteWebLinkDeviceType._(this.value);

  static const values = [android, ios, web];

  static RouteWebLinkDeviceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteWebLinkDeviceType._(value));

  @override
  bool operator ==(other) =>
      other is RouteWebLinkDeviceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A step that must be performed before the travel portion of the leg.
///
/// @nodoc
class RouteTransitBeforeTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RouteTransitBeforeTravelStepType type;

  /// Brief description of the step in the requested language.
  final String? instruction;

  RouteTransitBeforeTravelStep({
    required this.duration,
    required this.type,
    this.instruction,
  });

  factory RouteTransitBeforeTravelStep.fromJson(Map<String, dynamic> json) {
    return RouteTransitBeforeTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type: RouteTransitBeforeTravelStepType.fromString(
          (json['Type'] as String?) ?? ''),
      instruction: json['Instruction'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final instruction = this.instruction;
    return {
      'Duration': duration,
      'Type': type.value,
      if (instruction != null) 'Instruction': instruction,
    };
  }
}

/// @nodoc
class RouteTransitBeforeTravelStepType {
  static const board = RouteTransitBeforeTravelStepType._('Board');

  final String value;

  const RouteTransitBeforeTravelStepType._(this.value);

  static const values = [board];

  static RouteTransitBeforeTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTransitBeforeTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RouteTransitBeforeTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Required attribution to display.
///
/// @nodoc
class RouteAttribution {
  /// The URL to an external resource.
  final RouteWebLink webLink;

  /// The type of the attribution link.
  final RouteAttributionType? attributionType;

  RouteAttribution({
    required this.webLink,
    this.attributionType,
  });

  factory RouteAttribution.fromJson(Map<String, dynamic> json) {
    return RouteAttribution(
      webLink: RouteWebLink.fromJson(
          (json['WebLink'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      attributionType: (json['AttributionType'] as String?)
          ?.let(RouteAttributionType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final webLink = this.webLink;
    final attributionType = this.attributionType;
    return {
      'WebLink': webLink,
      if (attributionType != null) 'AttributionType': attributionType.value,
    };
  }
}

/// @nodoc
class RouteAttributionType {
  static const disclaimer = RouteAttributionType._('Disclaimer');
  static const tariff = RouteAttributionType._('Tariff');

  final String value;

  const RouteAttributionType._(this.value);

  static const values = [disclaimer, tariff];

  static RouteAttributionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteAttributionType._(value));

  @override
  bool operator ==(other) =>
      other is RouteAttributionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A step that must be performed after the travel portion of the leg.
///
/// @nodoc
class RouteTransitAfterTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RouteTransitAfterTravelStepType type;

  /// Brief description of the step in the requested language.
  final String? instruction;

  RouteTransitAfterTravelStep({
    required this.duration,
    required this.type,
    this.instruction,
  });

  factory RouteTransitAfterTravelStep.fromJson(Map<String, dynamic> json) {
    return RouteTransitAfterTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type: RouteTransitAfterTravelStepType.fromString(
          (json['Type'] as String?) ?? ''),
      instruction: json['Instruction'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final instruction = this.instruction;
    return {
      'Duration': duration,
      'Type': type.value,
      if (instruction != null) 'Instruction': instruction,
    };
  }
}

/// @nodoc
class RouteTransitAfterTravelStepType {
  static const deboard = RouteTransitAfterTravelStepType._('Deboard');

  final String value;

  const RouteTransitAfterTravelStepType._(this.value);

  static const values = [deboard];

  static RouteTransitAfterTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTransitAfterTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RouteTransitAfterTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the taxi agency.
///
/// @nodoc
class RouteTaxiAgency {
  /// Name of the agency.
  final String name;

  /// URL to the agency's website.
  final String? url;

  RouteTaxiAgency({
    required this.name,
    this.url,
  });

  factory RouteTaxiAgency.fromJson(Map<String, dynamic> json) {
    return RouteTaxiAgency(
      name: (json['Name'] as String?) ?? '',
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final url = this.url;
    return {
      'Name': name,
      if (url != null) 'Url': url,
    };
  }
}

/// Details corresponding to the arrival for the leg.
///
/// @nodoc
class RouteTaxiArrival {
  /// Place details corresponding to the arrival.
  final RouteTaxiPlace place;

  /// The arrival time.
  final String? time;

  RouteTaxiArrival({
    required this.place,
    this.time,
  });

  factory RouteTaxiArrival.fromJson(Map<String, dynamic> json) {
    return RouteTaxiArrival(
      place: RouteTaxiPlace.fromJson((json['Place'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      time: json['Time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    final time = this.time;
    return {
      'Place': place,
      if (time != null) 'Time': time,
    };
  }
}

/// Details corresponding to the departure for the leg.
///
/// @nodoc
class RouteTaxiDeparture {
  /// Place details corresponding to the departure.
  final RouteTaxiPlace place;

  /// The departure time.
  final String? time;

  RouteTaxiDeparture({
    required this.place,
    this.time,
  });

  factory RouteTaxiDeparture.fromJson(Map<String, dynamic> json) {
    return RouteTaxiDeparture(
      place: RouteTaxiPlace.fromJson((json['Place'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      time: json['Time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    final time = this.time;
    return {
      'Place': place,
      if (time != null) 'Time': time,
    };
  }
}

/// Summary of the taxi leg.
///
/// @nodoc
class RouteTaxiSummary {
  /// Summary including duration and distance for the entire leg.
  final RouteTaxiOverviewSummary? overview;

  /// Summary including duration and distance for the travel portion of the leg
  /// only.
  final RouteTaxiTravelOnlySummary? travelOnly;

  RouteTaxiSummary({
    this.overview,
    this.travelOnly,
  });

  factory RouteTaxiSummary.fromJson(Map<String, dynamic> json) {
    return RouteTaxiSummary(
      overview: json['Overview'] != null
          ? RouteTaxiOverviewSummary.fromJson(
              json['Overview'] as Map<String, dynamic>)
          : null,
      travelOnly: json['TravelOnly'] != null
          ? RouteTaxiTravelOnlySummary.fromJson(
              json['TravelOnly'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final overview = this.overview;
    final travelOnly = this.travelOnly;
    return {
      if (overview != null) 'Overview': overview,
      if (travelOnly != null) 'TravelOnly': travelOnly,
    };
  }
}

/// Transport mode details for the taxi leg.
///
/// @nodoc
class RouteTaxiTransportModeDetails {
  /// Mode of the taxi transport.
  final RouteTaxiMode mode;

  /// Number of available seats in the vehicle.
  final int? availableSeats;

  /// Human readable transport category.
  final String? category;

  /// Color of the transport polyline and background for the transport name.
  final String? color;

  /// Vehicle engine type.
  final RouteEngineType? engine;

  /// Vehicle license plate number.
  final String? licensePlate;

  /// Vehicle model.
  final String? model;

  /// Vehicle name or mobility provider name.
  final String? name;

  /// Color of the transport name text.
  final String? textColor;

  RouteTaxiTransportModeDetails({
    required this.mode,
    this.availableSeats,
    this.category,
    this.color,
    this.engine,
    this.licensePlate,
    this.model,
    this.name,
    this.textColor,
  });

  factory RouteTaxiTransportModeDetails.fromJson(Map<String, dynamic> json) {
    return RouteTaxiTransportModeDetails(
      mode: RouteTaxiMode.fromString((json['Mode'] as String?) ?? ''),
      availableSeats: json['AvailableSeats'] as int?,
      category: json['Category'] as String?,
      color: json['Color'] as String?,
      engine: (json['Engine'] as String?)?.let(RouteEngineType.fromString),
      licensePlate: json['LicensePlate'] as String?,
      model: json['Model'] as String?,
      name: json['Name'] as String?,
      textColor: json['TextColor'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final availableSeats = this.availableSeats;
    final category = this.category;
    final color = this.color;
    final engine = this.engine;
    final licensePlate = this.licensePlate;
    final model = this.model;
    final name = this.name;
    final textColor = this.textColor;
    return {
      'Mode': mode.value,
      if (availableSeats != null) 'AvailableSeats': availableSeats,
      if (category != null) 'Category': category,
      if (color != null) 'Color': color,
      if (engine != null) 'Engine': engine.value,
      if (licensePlate != null) 'LicensePlate': licensePlate,
      if (model != null) 'Model': model,
      if (name != null) 'Name': name,
      if (textColor != null) 'TextColor': textColor,
    };
  }
}

/// A step that must be performed during the travel portion of the leg.
///
/// @nodoc
class RouteTaxiTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RouteTaxiTravelStepType type;
  final RouteContinueStepDetails? continueStepDetails;

  /// Distance of the step.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int? distance;
  final RouteExitStepDetails? exitStepDetails;

  /// Offset in the leg geometry corresponding to the start of this step.
  final int? geometryOffset;

  /// Brief description of the step in the requested language.
  final String? instruction;
  final RouteKeepStepDetails? keepStepDetails;
  final RouteRampStepDetails? rampStepDetails;
  final RouteRoundaboutEnterStepDetails? roundaboutEnterStepDetails;
  final RouteRoundaboutExitStepDetails? roundaboutExitStepDetails;
  final RouteRoundaboutPassStepDetails? roundaboutPassStepDetails;
  final RouteTurnStepDetails? turnStepDetails;
  final RouteUTurnStepDetails? uTurnStepDetails;

  RouteTaxiTravelStep({
    required this.duration,
    required this.type,
    this.continueStepDetails,
    this.distance,
    this.exitStepDetails,
    this.geometryOffset,
    this.instruction,
    this.keepStepDetails,
    this.rampStepDetails,
    this.roundaboutEnterStepDetails,
    this.roundaboutExitStepDetails,
    this.roundaboutPassStepDetails,
    this.turnStepDetails,
    this.uTurnStepDetails,
  });

  factory RouteTaxiTravelStep.fromJson(Map<String, dynamic> json) {
    return RouteTaxiTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type: RouteTaxiTravelStepType.fromString((json['Type'] as String?) ?? ''),
      continueStepDetails: json['ContinueStepDetails'] != null
          ? RouteContinueStepDetails.fromJson(
              json['ContinueStepDetails'] as Map<String, dynamic>)
          : null,
      distance: json['Distance'] as int?,
      exitStepDetails: json['ExitStepDetails'] != null
          ? RouteExitStepDetails.fromJson(
              json['ExitStepDetails'] as Map<String, dynamic>)
          : null,
      geometryOffset: json['GeometryOffset'] as int?,
      instruction: json['Instruction'] as String?,
      keepStepDetails: json['KeepStepDetails'] != null
          ? RouteKeepStepDetails.fromJson(
              json['KeepStepDetails'] as Map<String, dynamic>)
          : null,
      rampStepDetails: json['RampStepDetails'] != null
          ? RouteRampStepDetails.fromJson(
              json['RampStepDetails'] as Map<String, dynamic>)
          : null,
      roundaboutEnterStepDetails: json['RoundaboutEnterStepDetails'] != null
          ? RouteRoundaboutEnterStepDetails.fromJson(
              json['RoundaboutEnterStepDetails'] as Map<String, dynamic>)
          : null,
      roundaboutExitStepDetails: json['RoundaboutExitStepDetails'] != null
          ? RouteRoundaboutExitStepDetails.fromJson(
              json['RoundaboutExitStepDetails'] as Map<String, dynamic>)
          : null,
      roundaboutPassStepDetails: json['RoundaboutPassStepDetails'] != null
          ? RouteRoundaboutPassStepDetails.fromJson(
              json['RoundaboutPassStepDetails'] as Map<String, dynamic>)
          : null,
      turnStepDetails: json['TurnStepDetails'] != null
          ? RouteTurnStepDetails.fromJson(
              json['TurnStepDetails'] as Map<String, dynamic>)
          : null,
      uTurnStepDetails: json['UTurnStepDetails'] != null
          ? RouteUTurnStepDetails.fromJson(
              json['UTurnStepDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final continueStepDetails = this.continueStepDetails;
    final distance = this.distance;
    final exitStepDetails = this.exitStepDetails;
    final geometryOffset = this.geometryOffset;
    final instruction = this.instruction;
    final keepStepDetails = this.keepStepDetails;
    final rampStepDetails = this.rampStepDetails;
    final roundaboutEnterStepDetails = this.roundaboutEnterStepDetails;
    final roundaboutExitStepDetails = this.roundaboutExitStepDetails;
    final roundaboutPassStepDetails = this.roundaboutPassStepDetails;
    final turnStepDetails = this.turnStepDetails;
    final uTurnStepDetails = this.uTurnStepDetails;
    return {
      'Duration': duration,
      'Type': type.value,
      if (continueStepDetails != null)
        'ContinueStepDetails': continueStepDetails,
      if (distance != null) 'Distance': distance,
      if (exitStepDetails != null) 'ExitStepDetails': exitStepDetails,
      if (geometryOffset != null) 'GeometryOffset': geometryOffset,
      if (instruction != null) 'Instruction': instruction,
      if (keepStepDetails != null) 'KeepStepDetails': keepStepDetails,
      if (rampStepDetails != null) 'RampStepDetails': rampStepDetails,
      if (roundaboutEnterStepDetails != null)
        'RoundaboutEnterStepDetails': roundaboutEnterStepDetails,
      if (roundaboutExitStepDetails != null)
        'RoundaboutExitStepDetails': roundaboutExitStepDetails,
      if (roundaboutPassStepDetails != null)
        'RoundaboutPassStepDetails': roundaboutPassStepDetails,
      if (turnStepDetails != null) 'TurnStepDetails': turnStepDetails,
      if (uTurnStepDetails != null) 'UTurnStepDetails': uTurnStepDetails,
    };
  }
}

/// Details related to the continue step.
///
/// @nodoc
class RouteContinueStepDetails {
  /// Name of the intersection, if applicable to the step.
  final List<LocalizedString> intersection;

  RouteContinueStepDetails({
    required this.intersection,
  });

  factory RouteContinueStepDetails.fromJson(Map<String, dynamic> json) {
    return RouteContinueStepDetails(
      intersection: ((json['Intersection'] as List?) ?? const [])
          .nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final intersection = this.intersection;
    return {
      'Intersection': intersection,
    };
  }
}

/// Details related to the exit step.
///
/// @nodoc
class RouteExitStepDetails {
  /// Name of the intersection, if applicable to the step.
  final List<LocalizedString> intersection;

  /// Exit to be taken.
  final int? relativeExit;

  /// Steering direction for the step.
  final RouteSteeringDirection? steeringDirection;

  /// Angle of the turn.
  final double? turnAngle;

  /// Intensity of the turn.
  final RouteTurnIntensity? turnIntensity;

  RouteExitStepDetails({
    required this.intersection,
    this.relativeExit,
    this.steeringDirection,
    this.turnAngle,
    this.turnIntensity,
  });

  factory RouteExitStepDetails.fromJson(Map<String, dynamic> json) {
    return RouteExitStepDetails(
      intersection: ((json['Intersection'] as List?) ?? const [])
          .nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      relativeExit: json['RelativeExit'] as int?,
      steeringDirection: (json['SteeringDirection'] as String?)
          ?.let(RouteSteeringDirection.fromString),
      turnAngle: json['TurnAngle'] as double?,
      turnIntensity: (json['TurnIntensity'] as String?)
          ?.let(RouteTurnIntensity.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final intersection = this.intersection;
    final relativeExit = this.relativeExit;
    final steeringDirection = this.steeringDirection;
    final turnAngle = this.turnAngle;
    final turnIntensity = this.turnIntensity;
    return {
      'Intersection': intersection,
      if (relativeExit != null) 'RelativeExit': relativeExit,
      if (steeringDirection != null)
        'SteeringDirection': steeringDirection.value,
      if (turnAngle != null) 'TurnAngle': turnAngle,
      if (turnIntensity != null) 'TurnIntensity': turnIntensity.value,
    };
  }
}

/// Details that are specific to a Keep step.
///
/// @nodoc
class RouteKeepStepDetails {
  /// Name of the intersection, if applicable to the step.
  final List<LocalizedString> intersection;

  /// Steering direction for the step.
  final RouteSteeringDirection? steeringDirection;

  /// Angle of the turn.
  final double? turnAngle;

  /// Intensity of the turn.
  final RouteTurnIntensity? turnIntensity;

  RouteKeepStepDetails({
    required this.intersection,
    this.steeringDirection,
    this.turnAngle,
    this.turnIntensity,
  });

  factory RouteKeepStepDetails.fromJson(Map<String, dynamic> json) {
    return RouteKeepStepDetails(
      intersection: ((json['Intersection'] as List?) ?? const [])
          .nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      steeringDirection: (json['SteeringDirection'] as String?)
          ?.let(RouteSteeringDirection.fromString),
      turnAngle: json['TurnAngle'] as double?,
      turnIntensity: (json['TurnIntensity'] as String?)
          ?.let(RouteTurnIntensity.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final intersection = this.intersection;
    final steeringDirection = this.steeringDirection;
    final turnAngle = this.turnAngle;
    final turnIntensity = this.turnIntensity;
    return {
      'Intersection': intersection,
      if (steeringDirection != null)
        'SteeringDirection': steeringDirection.value,
      if (turnAngle != null) 'TurnAngle': turnAngle,
      if (turnIntensity != null) 'TurnIntensity': turnIntensity.value,
    };
  }
}

/// Details that are specific to a ramp step.
///
/// @nodoc
class RouteRampStepDetails {
  /// Name of the intersection, if applicable to the step.
  final List<LocalizedString> intersection;

  /// Steering direction for the step.
  final RouteSteeringDirection? steeringDirection;

  /// Angle of the turn.
  final double? turnAngle;

  /// Intensity of the turn.
  final RouteTurnIntensity? turnIntensity;

  RouteRampStepDetails({
    required this.intersection,
    this.steeringDirection,
    this.turnAngle,
    this.turnIntensity,
  });

  factory RouteRampStepDetails.fromJson(Map<String, dynamic> json) {
    return RouteRampStepDetails(
      intersection: ((json['Intersection'] as List?) ?? const [])
          .nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      steeringDirection: (json['SteeringDirection'] as String?)
          ?.let(RouteSteeringDirection.fromString),
      turnAngle: json['TurnAngle'] as double?,
      turnIntensity: (json['TurnIntensity'] as String?)
          ?.let(RouteTurnIntensity.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final intersection = this.intersection;
    final steeringDirection = this.steeringDirection;
    final turnAngle = this.turnAngle;
    final turnIntensity = this.turnIntensity;
    return {
      'Intersection': intersection,
      if (steeringDirection != null)
        'SteeringDirection': steeringDirection.value,
      if (turnAngle != null) 'TurnAngle': turnAngle,
      if (turnIntensity != null) 'TurnIntensity': turnIntensity.value,
    };
  }
}

/// Details about the roundabout leg.
///
/// @nodoc
class RouteRoundaboutEnterStepDetails {
  /// Name of the intersection, if applicable to the step.
  final List<LocalizedString> intersection;

  /// Steering direction for the step.
  final RouteSteeringDirection? steeringDirection;

  /// Angle of the turn.
  final double? turnAngle;

  /// Intensity of the turn.
  final RouteTurnIntensity? turnIntensity;

  RouteRoundaboutEnterStepDetails({
    required this.intersection,
    this.steeringDirection,
    this.turnAngle,
    this.turnIntensity,
  });

  factory RouteRoundaboutEnterStepDetails.fromJson(Map<String, dynamic> json) {
    return RouteRoundaboutEnterStepDetails(
      intersection: ((json['Intersection'] as List?) ?? const [])
          .nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      steeringDirection: (json['SteeringDirection'] as String?)
          ?.let(RouteSteeringDirection.fromString),
      turnAngle: json['TurnAngle'] as double?,
      turnIntensity: (json['TurnIntensity'] as String?)
          ?.let(RouteTurnIntensity.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final intersection = this.intersection;
    final steeringDirection = this.steeringDirection;
    final turnAngle = this.turnAngle;
    final turnIntensity = this.turnIntensity;
    return {
      'Intersection': intersection,
      if (steeringDirection != null)
        'SteeringDirection': steeringDirection.value,
      if (turnAngle != null) 'TurnAngle': turnAngle,
      if (turnIntensity != null) 'TurnIntensity': turnIntensity.value,
    };
  }
}

/// Details about the roundabout step.
///
/// @nodoc
class RouteRoundaboutExitStepDetails {
  /// Name of the intersection, if applicable to the step.
  final List<LocalizedString> intersection;

  /// Exit to be taken.
  final int? relativeExit;

  /// Angle of the roundabout.
  final double? roundaboutAngle;

  /// Steering direction for the step.
  final RouteSteeringDirection? steeringDirection;

  RouteRoundaboutExitStepDetails({
    required this.intersection,
    this.relativeExit,
    this.roundaboutAngle,
    this.steeringDirection,
  });

  factory RouteRoundaboutExitStepDetails.fromJson(Map<String, dynamic> json) {
    return RouteRoundaboutExitStepDetails(
      intersection: ((json['Intersection'] as List?) ?? const [])
          .nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      relativeExit: json['RelativeExit'] as int?,
      roundaboutAngle: json['RoundaboutAngle'] as double?,
      steeringDirection: (json['SteeringDirection'] as String?)
          ?.let(RouteSteeringDirection.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final intersection = this.intersection;
    final relativeExit = this.relativeExit;
    final roundaboutAngle = this.roundaboutAngle;
    final steeringDirection = this.steeringDirection;
    return {
      'Intersection': intersection,
      if (relativeExit != null) 'RelativeExit': relativeExit,
      if (roundaboutAngle != null) 'RoundaboutAngle': roundaboutAngle,
      if (steeringDirection != null)
        'SteeringDirection': steeringDirection.value,
    };
  }
}

/// Details about the step.
///
/// @nodoc
class RouteRoundaboutPassStepDetails {
  /// Name of the intersection, if applicable to the step.
  final List<LocalizedString> intersection;

  /// Steering direction for the step.
  final RouteSteeringDirection? steeringDirection;

  /// Angle of the turn.
  final double? turnAngle;

  /// Intensity of the turn.
  final RouteTurnIntensity? turnIntensity;

  RouteRoundaboutPassStepDetails({
    required this.intersection,
    this.steeringDirection,
    this.turnAngle,
    this.turnIntensity,
  });

  factory RouteRoundaboutPassStepDetails.fromJson(Map<String, dynamic> json) {
    return RouteRoundaboutPassStepDetails(
      intersection: ((json['Intersection'] as List?) ?? const [])
          .nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      steeringDirection: (json['SteeringDirection'] as String?)
          ?.let(RouteSteeringDirection.fromString),
      turnAngle: json['TurnAngle'] as double?,
      turnIntensity: (json['TurnIntensity'] as String?)
          ?.let(RouteTurnIntensity.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final intersection = this.intersection;
    final steeringDirection = this.steeringDirection;
    final turnAngle = this.turnAngle;
    final turnIntensity = this.turnIntensity;
    return {
      'Intersection': intersection,
      if (steeringDirection != null)
        'SteeringDirection': steeringDirection.value,
      if (turnAngle != null) 'TurnAngle': turnAngle,
      if (turnIntensity != null) 'TurnIntensity': turnIntensity.value,
    };
  }
}

/// Details related to the turn step.
///
/// @nodoc
class RouteTurnStepDetails {
  /// Name of the intersection, if applicable to the step.
  final List<LocalizedString> intersection;

  /// Steering direction for the step.
  final RouteSteeringDirection? steeringDirection;

  /// Angle of the turn.
  final double? turnAngle;

  /// Intensity of the turn.
  final RouteTurnIntensity? turnIntensity;

  RouteTurnStepDetails({
    required this.intersection,
    this.steeringDirection,
    this.turnAngle,
    this.turnIntensity,
  });

  factory RouteTurnStepDetails.fromJson(Map<String, dynamic> json) {
    return RouteTurnStepDetails(
      intersection: ((json['Intersection'] as List?) ?? const [])
          .nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      steeringDirection: (json['SteeringDirection'] as String?)
          ?.let(RouteSteeringDirection.fromString),
      turnAngle: json['TurnAngle'] as double?,
      turnIntensity: (json['TurnIntensity'] as String?)
          ?.let(RouteTurnIntensity.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final intersection = this.intersection;
    final steeringDirection = this.steeringDirection;
    final turnAngle = this.turnAngle;
    final turnIntensity = this.turnIntensity;
    return {
      'Intersection': intersection,
      if (steeringDirection != null)
        'SteeringDirection': steeringDirection.value,
      if (turnAngle != null) 'TurnAngle': turnAngle,
      if (turnIntensity != null) 'TurnIntensity': turnIntensity.value,
    };
  }
}

/// @nodoc
class RouteTaxiTravelStepType {
  static const arrive = RouteTaxiTravelStepType._('Arrive');
  static const $continue = RouteTaxiTravelStepType._('Continue');
  static const depart = RouteTaxiTravelStepType._('Depart');
  static const exit = RouteTaxiTravelStepType._('Exit');
  static const keep = RouteTaxiTravelStepType._('Keep');
  static const ramp = RouteTaxiTravelStepType._('Ramp');
  static const roundaboutEnter = RouteTaxiTravelStepType._('RoundaboutEnter');
  static const roundaboutExit = RouteTaxiTravelStepType._('RoundaboutExit');
  static const roundaboutPass = RouteTaxiTravelStepType._('RoundaboutPass');
  static const turn = RouteTaxiTravelStepType._('Turn');
  static const uTurn = RouteTaxiTravelStepType._('UTurn');

  final String value;

  const RouteTaxiTravelStepType._(this.value);

  static const values = [
    arrive,
    $continue,
    depart,
    exit,
    keep,
    ramp,
    roundaboutEnter,
    roundaboutExit,
    roundaboutPass,
    turn,
    uTurn
  ];

  static RouteTaxiTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTaxiTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RouteTaxiTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details related to the U-turn step.
///
/// @nodoc
class RouteUTurnStepDetails {
  /// Name of the intersection, if applicable to the step.
  final List<LocalizedString> intersection;

  /// Steering direction for the step.
  final RouteSteeringDirection? steeringDirection;

  /// Angle of the turn.
  final double? turnAngle;

  /// Intensity of the turn.
  final RouteTurnIntensity? turnIntensity;

  RouteUTurnStepDetails({
    required this.intersection,
    this.steeringDirection,
    this.turnAngle,
    this.turnIntensity,
  });

  factory RouteUTurnStepDetails.fromJson(Map<String, dynamic> json) {
    return RouteUTurnStepDetails(
      intersection: ((json['Intersection'] as List?) ?? const [])
          .nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      steeringDirection: (json['SteeringDirection'] as String?)
          ?.let(RouteSteeringDirection.fromString),
      turnAngle: json['TurnAngle'] as double?,
      turnIntensity: (json['TurnIntensity'] as String?)
          ?.let(RouteTurnIntensity.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final intersection = this.intersection;
    final steeringDirection = this.steeringDirection;
    final turnAngle = this.turnAngle;
    final turnIntensity = this.turnIntensity;
    return {
      'Intersection': intersection,
      if (steeringDirection != null)
        'SteeringDirection': steeringDirection.value,
      if (turnAngle != null) 'TurnAngle': turnAngle,
      if (turnIntensity != null) 'TurnIntensity': turnIntensity.value,
    };
  }
}

/// @nodoc
class RouteSteeringDirection {
  static const left = RouteSteeringDirection._('Left');
  static const right = RouteSteeringDirection._('Right');
  static const straight = RouteSteeringDirection._('Straight');

  final String value;

  const RouteSteeringDirection._(this.value);

  static const values = [left, right, straight];

  static RouteSteeringDirection fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteSteeringDirection._(value));

  @override
  bool operator ==(other) =>
      other is RouteSteeringDirection && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteTurnIntensity {
  static const sharp = RouteTurnIntensity._('Sharp');
  static const slight = RouteTurnIntensity._('Slight');
  static const typical = RouteTurnIntensity._('Typical');

  final String value;

  const RouteTurnIntensity._(this.value);

  static const values = [sharp, slight, typical];

  static RouteTurnIntensity fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTurnIntensity._(value));

  @override
  bool operator ==(other) =>
      other is RouteTurnIntensity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteEngineType {
  static const electric = RouteEngineType._('Electric');
  static const internalCombustion = RouteEngineType._('InternalCombustion');
  static const pluginHybrid = RouteEngineType._('PluginHybrid');

  final String value;

  const RouteEngineType._(this.value);

  static const values = [electric, internalCombustion, pluginHybrid];

  static RouteEngineType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteEngineType._(value));

  @override
  bool operator ==(other) => other is RouteEngineType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteTaxiMode {
  static const all = RouteTaxiMode._('All');
  static const car = RouteTaxiMode._('Car');

  final String value;

  const RouteTaxiMode._(this.value);

  static const values = [all, car];

  static RouteTaxiMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTaxiMode._(value));

  @override
  bool operator ==(other) => other is RouteTaxiMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary including duration and distance for the entire leg.
///
/// @nodoc
class RouteTaxiOverviewSummary {
  /// Distance of the entire leg.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int distance;

  /// Duration of the entire leg.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  RouteTaxiOverviewSummary({
    required this.distance,
    required this.duration,
  });

  factory RouteTaxiOverviewSummary.fromJson(Map<String, dynamic> json) {
    return RouteTaxiOverviewSummary(
      distance: (json['Distance'] as int?) ?? 0,
      duration: (json['Duration'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final duration = this.duration;
    return {
      'Distance': distance,
      'Duration': duration,
    };
  }
}

/// Summary including duration and distance for the travel portion of the leg
/// only.
///
/// @nodoc
class RouteTaxiTravelOnlySummary {
  /// Duration of the travel portion of the taxi leg.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  RouteTaxiTravelOnlySummary({
    required this.duration,
  });

  factory RouteTaxiTravelOnlySummary.fromJson(Map<String, dynamic> json) {
    return RouteTaxiTravelOnlySummary(
      duration: (json['Duration'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    return {
      'Duration': duration,
    };
  }
}

/// A notice that indicates an issue that occurred during route calculation.
///
/// @nodoc
class RouteTaxiNotice {
  /// Code corresponding to the issue.
  final RouteTaxiNoticeCode code;

  /// Impact corresponding to the issue. While Low impact notices can be safely
  /// ignored, High impact notices must be evaluated further to determine the
  /// impact.
  final RouteNoticeImpact? impact;

  RouteTaxiNotice({
    required this.code,
    this.impact,
  });

  factory RouteTaxiNotice.fromJson(Map<String, dynamic> json) {
    return RouteTaxiNotice(
      code: RouteTaxiNoticeCode.fromString((json['Code'] as String?) ?? ''),
      impact: (json['Impact'] as String?)?.let(RouteNoticeImpact.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final impact = this.impact;
    return {
      'Code': code.value,
      if (impact != null) 'Impact': impact.value,
    };
  }
}

/// @nodoc
class RouteTaxiNoticeCode {
  static const accuratePolylineUnavailable =
      RouteTaxiNoticeCode._('AccuratePolylineUnavailable');
  static const other = RouteTaxiNoticeCode._('Other');

  final String value;

  const RouteTaxiNoticeCode._(this.value);

  static const values = [accuratePolylineUnavailable, other];

  static RouteTaxiNoticeCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTaxiNoticeCode._(value));

  @override
  bool operator ==(other) =>
      other is RouteTaxiNoticeCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Place details corresponding to the arrival or departure.
///
/// @nodoc
class RouteTaxiPlace {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// Details of the access point.
  final RouteAccessPointDetails? accessPointDetails;

  /// The name of the place.
  final String? name;

  /// Position provided in the request.
  final List<double>? originalPosition;

  /// Details about the station.
  final RouteStationDetails? stationDetails;

  /// The type of the place.
  final RouteTaxiPlaceType? type;

  /// Index of the waypoint in the request.
  final int? waypointIndex;

  RouteTaxiPlace({
    required this.position,
    this.accessPointDetails,
    this.name,
    this.originalPosition,
    this.stationDetails,
    this.type,
    this.waypointIndex,
  });

  factory RouteTaxiPlace.fromJson(Map<String, dynamic> json) {
    return RouteTaxiPlace(
      position: ((json['Position'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      accessPointDetails: json['AccessPointDetails'] != null
          ? RouteAccessPointDetails.fromJson(
              json['AccessPointDetails'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      originalPosition: (json['OriginalPosition'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      stationDetails: json['StationDetails'] != null
          ? RouteStationDetails.fromJson(
              json['StationDetails'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.let(RouteTaxiPlaceType.fromString),
      waypointIndex: json['WaypointIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final accessPointDetails = this.accessPointDetails;
    final name = this.name;
    final originalPosition = this.originalPosition;
    final stationDetails = this.stationDetails;
    final type = this.type;
    final waypointIndex = this.waypointIndex;
    return {
      'Position': position,
      if (accessPointDetails != null) 'AccessPointDetails': accessPointDetails,
      if (name != null) 'Name': name,
      if (originalPosition != null) 'OriginalPosition': originalPosition,
      if (stationDetails != null) 'StationDetails': stationDetails,
      if (type != null) 'Type': type.value,
      if (waypointIndex != null) 'WaypointIndex': waypointIndex,
    };
  }
}

/// Details of the access point.
///
/// @nodoc
class RouteAccessPointDetails {
  /// Wheelchair accessibility information for the access point.
  final RouteAccessibilityAvailabilityDetails? accessibility;

  RouteAccessPointDetails({
    this.accessibility,
  });

  factory RouteAccessPointDetails.fromJson(Map<String, dynamic> json) {
    return RouteAccessPointDetails(
      accessibility: json['Accessibility'] != null
          ? RouteAccessibilityAvailabilityDetails.fromJson(
              json['Accessibility'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessibility = this.accessibility;
    return {
      if (accessibility != null) 'Accessibility': accessibility,
    };
  }
}

/// @nodoc
class RouteTaxiPlaceType {
  static const accessPoint = RouteTaxiPlaceType._('AccessPoint');
  static const station = RouteTaxiPlaceType._('Station');

  final String value;

  const RouteTaxiPlaceType._(this.value);

  static const values = [accessPoint, station];

  static RouteTaxiPlaceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTaxiPlaceType._(value));

  @override
  bool operator ==(other) =>
      other is RouteTaxiPlaceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A step that must be performed before the travel portion of the leg.
///
/// @nodoc
class RouteTaxiBeforeTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RouteTaxiBeforeTravelStepType type;

  /// Brief description of the step in the requested language.
  final String? instruction;

  RouteTaxiBeforeTravelStep({
    required this.duration,
    required this.type,
    this.instruction,
  });

  factory RouteTaxiBeforeTravelStep.fromJson(Map<String, dynamic> json) {
    return RouteTaxiBeforeTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type: RouteTaxiBeforeTravelStepType.fromString(
          (json['Type'] as String?) ?? ''),
      instruction: json['Instruction'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final instruction = this.instruction;
    return {
      'Duration': duration,
      'Type': type.value,
      if (instruction != null) 'Instruction': instruction,
    };
  }
}

/// @nodoc
class RouteTaxiBeforeTravelStepType {
  static const wait = RouteTaxiBeforeTravelStepType._('Wait');

  final String value;

  const RouteTaxiBeforeTravelStepType._(this.value);

  static const values = [wait];

  static RouteTaxiBeforeTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTaxiBeforeTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RouteTaxiBeforeTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A step that must be performed after the travel portion of the leg.
///
/// @nodoc
class RouteTaxiAfterTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RouteTaxiAfterTravelStepType type;

  /// Brief description of the step in the requested language.
  final String? instruction;

  RouteTaxiAfterTravelStep({
    required this.duration,
    required this.type,
    this.instruction,
  });

  factory RouteTaxiAfterTravelStep.fromJson(Map<String, dynamic> json) {
    return RouteTaxiAfterTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type: RouteTaxiAfterTravelStepType.fromString(
          (json['Type'] as String?) ?? ''),
      instruction: json['Instruction'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final instruction = this.instruction;
    return {
      'Duration': duration,
      'Type': type.value,
      if (instruction != null) 'Instruction': instruction,
    };
  }
}

/// @nodoc
class RouteTaxiAfterTravelStepType {
  static const park = RouteTaxiAfterTravelStepType._('Park');

  final String value;

  const RouteTaxiAfterTravelStepType._(this.value);

  static const values = [park];

  static RouteTaxiAfterTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTaxiAfterTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RouteTaxiAfterTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the rental agency.
///
/// @nodoc
class RouteRentalAgency {
  /// Name of the agency.
  final String name;

  /// URL to the agency's website.
  final String? url;

  RouteRentalAgency({
    required this.name,
    this.url,
  });

  factory RouteRentalAgency.fromJson(Map<String, dynamic> json) {
    return RouteRentalAgency(
      name: (json['Name'] as String?) ?? '',
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final url = this.url;
    return {
      'Name': name,
      if (url != null) 'Url': url,
    };
  }
}

/// Details corresponding to the arrival for the leg.
///
/// @nodoc
class RouteRentalArrival {
  /// Place details corresponding to the arrival.
  final RouteRentalPlace place;

  /// The arrival time.
  final String? time;

  RouteRentalArrival({
    required this.place,
    this.time,
  });

  factory RouteRentalArrival.fromJson(Map<String, dynamic> json) {
    return RouteRentalArrival(
      place: RouteRentalPlace.fromJson(
          (json['Place'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      time: json['Time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    final time = this.time;
    return {
      'Place': place,
      if (time != null) 'Time': time,
    };
  }
}

/// Details corresponding to the departure for the leg.
///
/// @nodoc
class RouteRentalDeparture {
  /// Place details corresponding to the departure.
  final RouteRentalPlace place;

  /// The departure time.
  final String? time;

  RouteRentalDeparture({
    required this.place,
    this.time,
  });

  factory RouteRentalDeparture.fromJson(Map<String, dynamic> json) {
    return RouteRentalDeparture(
      place: RouteRentalPlace.fromJson(
          (json['Place'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      time: json['Time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    final time = this.time;
    return {
      'Place': place,
      if (time != null) 'Time': time,
    };
  }
}

/// Summary of the rental leg.
///
/// @nodoc
class RouteRentalSummary {
  /// Summary including duration and distance for the entire leg.
  final RouteRentalOverviewSummary? overview;

  /// Summary including duration and distance for the travel portion of the leg
  /// only.
  final RouteRentalTravelOnlySummary? travelOnly;

  RouteRentalSummary({
    this.overview,
    this.travelOnly,
  });

  factory RouteRentalSummary.fromJson(Map<String, dynamic> json) {
    return RouteRentalSummary(
      overview: json['Overview'] != null
          ? RouteRentalOverviewSummary.fromJson(
              json['Overview'] as Map<String, dynamic>)
          : null,
      travelOnly: json['TravelOnly'] != null
          ? RouteRentalTravelOnlySummary.fromJson(
              json['TravelOnly'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final overview = this.overview;
    final travelOnly = this.travelOnly;
    return {
      if (overview != null) 'Overview': overview,
      if (travelOnly != null) 'TravelOnly': travelOnly,
    };
  }
}

/// Transport mode details for the rental leg.
///
/// @nodoc
class RouteRentalTransportModeDetails {
  /// Mode of the rental transport.
  final RouteRentalMode mode;

  /// Number of available seats in the vehicle.
  final int? availableSeats;

  /// Human readable transport category.
  final String? category;

  /// Color of the transport polyline and background for the transport name.
  final String? color;

  /// Vehicle engine type.
  final RouteEngineType? engine;

  /// Vehicle license plate number.
  final String? licensePlate;

  /// Vehicle model.
  final String? model;

  /// Vehicle name or mobility provider name.
  final String? name;

  /// Color of the transport name text.
  final String? textColor;

  RouteRentalTransportModeDetails({
    required this.mode,
    this.availableSeats,
    this.category,
    this.color,
    this.engine,
    this.licensePlate,
    this.model,
    this.name,
    this.textColor,
  });

  factory RouteRentalTransportModeDetails.fromJson(Map<String, dynamic> json) {
    return RouteRentalTransportModeDetails(
      mode: RouteRentalMode.fromString((json['Mode'] as String?) ?? ''),
      availableSeats: json['AvailableSeats'] as int?,
      category: json['Category'] as String?,
      color: json['Color'] as String?,
      engine: (json['Engine'] as String?)?.let(RouteEngineType.fromString),
      licensePlate: json['LicensePlate'] as String?,
      model: json['Model'] as String?,
      name: json['Name'] as String?,
      textColor: json['TextColor'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final availableSeats = this.availableSeats;
    final category = this.category;
    final color = this.color;
    final engine = this.engine;
    final licensePlate = this.licensePlate;
    final model = this.model;
    final name = this.name;
    final textColor = this.textColor;
    return {
      'Mode': mode.value,
      if (availableSeats != null) 'AvailableSeats': availableSeats,
      if (category != null) 'Category': category,
      if (color != null) 'Color': color,
      if (engine != null) 'Engine': engine.value,
      if (licensePlate != null) 'LicensePlate': licensePlate,
      if (model != null) 'Model': model,
      if (name != null) 'Name': name,
      if (textColor != null) 'TextColor': textColor,
    };
  }
}

/// A step that must be performed during the travel portion of the leg.
///
/// @nodoc
class RouteRentalTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RouteRentalTravelStepType type;
  final RouteContinueStepDetails? continueStepDetails;

  /// Distance of the step.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int? distance;
  final RouteExitStepDetails? exitStepDetails;

  /// Offset in the leg geometry corresponding to the start of this step.
  final int? geometryOffset;

  /// Brief description of the step in the requested language.
  final String? instruction;
  final RouteKeepStepDetails? keepStepDetails;
  final RouteRampStepDetails? rampStepDetails;
  final RouteRoundaboutEnterStepDetails? roundaboutEnterStepDetails;
  final RouteRoundaboutExitStepDetails? roundaboutExitStepDetails;
  final RouteRoundaboutPassStepDetails? roundaboutPassStepDetails;
  final RouteTurnStepDetails? turnStepDetails;
  final RouteUTurnStepDetails? uTurnStepDetails;

  RouteRentalTravelStep({
    required this.duration,
    required this.type,
    this.continueStepDetails,
    this.distance,
    this.exitStepDetails,
    this.geometryOffset,
    this.instruction,
    this.keepStepDetails,
    this.rampStepDetails,
    this.roundaboutEnterStepDetails,
    this.roundaboutExitStepDetails,
    this.roundaboutPassStepDetails,
    this.turnStepDetails,
    this.uTurnStepDetails,
  });

  factory RouteRentalTravelStep.fromJson(Map<String, dynamic> json) {
    return RouteRentalTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type:
          RouteRentalTravelStepType.fromString((json['Type'] as String?) ?? ''),
      continueStepDetails: json['ContinueStepDetails'] != null
          ? RouteContinueStepDetails.fromJson(
              json['ContinueStepDetails'] as Map<String, dynamic>)
          : null,
      distance: json['Distance'] as int?,
      exitStepDetails: json['ExitStepDetails'] != null
          ? RouteExitStepDetails.fromJson(
              json['ExitStepDetails'] as Map<String, dynamic>)
          : null,
      geometryOffset: json['GeometryOffset'] as int?,
      instruction: json['Instruction'] as String?,
      keepStepDetails: json['KeepStepDetails'] != null
          ? RouteKeepStepDetails.fromJson(
              json['KeepStepDetails'] as Map<String, dynamic>)
          : null,
      rampStepDetails: json['RampStepDetails'] != null
          ? RouteRampStepDetails.fromJson(
              json['RampStepDetails'] as Map<String, dynamic>)
          : null,
      roundaboutEnterStepDetails: json['RoundaboutEnterStepDetails'] != null
          ? RouteRoundaboutEnterStepDetails.fromJson(
              json['RoundaboutEnterStepDetails'] as Map<String, dynamic>)
          : null,
      roundaboutExitStepDetails: json['RoundaboutExitStepDetails'] != null
          ? RouteRoundaboutExitStepDetails.fromJson(
              json['RoundaboutExitStepDetails'] as Map<String, dynamic>)
          : null,
      roundaboutPassStepDetails: json['RoundaboutPassStepDetails'] != null
          ? RouteRoundaboutPassStepDetails.fromJson(
              json['RoundaboutPassStepDetails'] as Map<String, dynamic>)
          : null,
      turnStepDetails: json['TurnStepDetails'] != null
          ? RouteTurnStepDetails.fromJson(
              json['TurnStepDetails'] as Map<String, dynamic>)
          : null,
      uTurnStepDetails: json['UTurnStepDetails'] != null
          ? RouteUTurnStepDetails.fromJson(
              json['UTurnStepDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final continueStepDetails = this.continueStepDetails;
    final distance = this.distance;
    final exitStepDetails = this.exitStepDetails;
    final geometryOffset = this.geometryOffset;
    final instruction = this.instruction;
    final keepStepDetails = this.keepStepDetails;
    final rampStepDetails = this.rampStepDetails;
    final roundaboutEnterStepDetails = this.roundaboutEnterStepDetails;
    final roundaboutExitStepDetails = this.roundaboutExitStepDetails;
    final roundaboutPassStepDetails = this.roundaboutPassStepDetails;
    final turnStepDetails = this.turnStepDetails;
    final uTurnStepDetails = this.uTurnStepDetails;
    return {
      'Duration': duration,
      'Type': type.value,
      if (continueStepDetails != null)
        'ContinueStepDetails': continueStepDetails,
      if (distance != null) 'Distance': distance,
      if (exitStepDetails != null) 'ExitStepDetails': exitStepDetails,
      if (geometryOffset != null) 'GeometryOffset': geometryOffset,
      if (instruction != null) 'Instruction': instruction,
      if (keepStepDetails != null) 'KeepStepDetails': keepStepDetails,
      if (rampStepDetails != null) 'RampStepDetails': rampStepDetails,
      if (roundaboutEnterStepDetails != null)
        'RoundaboutEnterStepDetails': roundaboutEnterStepDetails,
      if (roundaboutExitStepDetails != null)
        'RoundaboutExitStepDetails': roundaboutExitStepDetails,
      if (roundaboutPassStepDetails != null)
        'RoundaboutPassStepDetails': roundaboutPassStepDetails,
      if (turnStepDetails != null) 'TurnStepDetails': turnStepDetails,
      if (uTurnStepDetails != null) 'UTurnStepDetails': uTurnStepDetails,
    };
  }
}

/// @nodoc
class RouteRentalTravelStepType {
  static const arrive = RouteRentalTravelStepType._('Arrive');
  static const $continue = RouteRentalTravelStepType._('Continue');
  static const depart = RouteRentalTravelStepType._('Depart');
  static const exit = RouteRentalTravelStepType._('Exit');
  static const keep = RouteRentalTravelStepType._('Keep');
  static const ramp = RouteRentalTravelStepType._('Ramp');
  static const roundaboutEnter = RouteRentalTravelStepType._('RoundaboutEnter');
  static const roundaboutExit = RouteRentalTravelStepType._('RoundaboutExit');
  static const roundaboutPass = RouteRentalTravelStepType._('RoundaboutPass');
  static const turn = RouteRentalTravelStepType._('Turn');
  static const uTurn = RouteRentalTravelStepType._('UTurn');

  final String value;

  const RouteRentalTravelStepType._(this.value);

  static const values = [
    arrive,
    $continue,
    depart,
    exit,
    keep,
    ramp,
    roundaboutEnter,
    roundaboutExit,
    roundaboutPass,
    turn,
    uTurn
  ];

  static RouteRentalTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteRentalTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RouteRentalTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteRentalMode {
  static const all = RouteRentalMode._('All');
  static const car = RouteRentalMode._('Car');

  final String value;

  const RouteRentalMode._(this.value);

  static const values = [all, car];

  static RouteRentalMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteRentalMode._(value));

  @override
  bool operator ==(other) => other is RouteRentalMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary including duration and distance for the entire leg.
///
/// @nodoc
class RouteRentalOverviewSummary {
  /// Distance of the entire leg.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int distance;

  /// Duration of the entire leg.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  RouteRentalOverviewSummary({
    required this.distance,
    required this.duration,
  });

  factory RouteRentalOverviewSummary.fromJson(Map<String, dynamic> json) {
    return RouteRentalOverviewSummary(
      distance: (json['Distance'] as int?) ?? 0,
      duration: (json['Duration'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final duration = this.duration;
    return {
      'Distance': distance,
      'Duration': duration,
    };
  }
}

/// Summary including duration and distance for the travel portion of the leg
/// only.
///
/// @nodoc
class RouteRentalTravelOnlySummary {
  /// Duration of the travel portion of the rental leg.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  RouteRentalTravelOnlySummary({
    required this.duration,
  });

  factory RouteRentalTravelOnlySummary.fromJson(Map<String, dynamic> json) {
    return RouteRentalTravelOnlySummary(
      duration: (json['Duration'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    return {
      'Duration': duration,
    };
  }
}

/// Place details corresponding to the arrival or departure.
///
/// @nodoc
class RouteRentalPlace {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// Details of the access point.
  final RouteAccessPointDetails? accessPointDetails;

  /// The name of the place.
  final String? name;

  /// Position provided in the request.
  final List<double>? originalPosition;

  /// Details about the station.
  final RouteStationDetails? stationDetails;

  /// The type of the place.
  final RouteRentalPlaceType? type;

  /// Index of the waypoint in the request.
  final int? waypointIndex;

  RouteRentalPlace({
    required this.position,
    this.accessPointDetails,
    this.name,
    this.originalPosition,
    this.stationDetails,
    this.type,
    this.waypointIndex,
  });

  factory RouteRentalPlace.fromJson(Map<String, dynamic> json) {
    return RouteRentalPlace(
      position: ((json['Position'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      accessPointDetails: json['AccessPointDetails'] != null
          ? RouteAccessPointDetails.fromJson(
              json['AccessPointDetails'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      originalPosition: (json['OriginalPosition'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      stationDetails: json['StationDetails'] != null
          ? RouteStationDetails.fromJson(
              json['StationDetails'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.let(RouteRentalPlaceType.fromString),
      waypointIndex: json['WaypointIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final accessPointDetails = this.accessPointDetails;
    final name = this.name;
    final originalPosition = this.originalPosition;
    final stationDetails = this.stationDetails;
    final type = this.type;
    final waypointIndex = this.waypointIndex;
    return {
      'Position': position,
      if (accessPointDetails != null) 'AccessPointDetails': accessPointDetails,
      if (name != null) 'Name': name,
      if (originalPosition != null) 'OriginalPosition': originalPosition,
      if (stationDetails != null) 'StationDetails': stationDetails,
      if (type != null) 'Type': type.value,
      if (waypointIndex != null) 'WaypointIndex': waypointIndex,
    };
  }
}

/// @nodoc
class RouteRentalPlaceType {
  static const accessPoint = RouteRentalPlaceType._('AccessPoint');
  static const dockingStation = RouteRentalPlaceType._('DockingStation');
  static const parkingLot = RouteRentalPlaceType._('ParkingLot');
  static const station = RouteRentalPlaceType._('Station');

  final String value;

  const RouteRentalPlaceType._(this.value);

  static const values = [accessPoint, dockingStation, parkingLot, station];

  static RouteRentalPlaceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteRentalPlaceType._(value));

  @override
  bool operator ==(other) =>
      other is RouteRentalPlaceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A step that must be performed before the travel portion of the leg.
///
/// @nodoc
class RouteRentalBeforeTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RouteRentalBeforeTravelStepType type;

  /// Brief description of the step in the requested language.
  final String? instruction;

  RouteRentalBeforeTravelStep({
    required this.duration,
    required this.type,
    this.instruction,
  });

  factory RouteRentalBeforeTravelStep.fromJson(Map<String, dynamic> json) {
    return RouteRentalBeforeTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type: RouteRentalBeforeTravelStepType.fromString(
          (json['Type'] as String?) ?? ''),
      instruction: json['Instruction'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final instruction = this.instruction;
    return {
      'Duration': duration,
      'Type': type.value,
      if (instruction != null) 'Instruction': instruction,
    };
  }
}

/// @nodoc
class RouteRentalBeforeTravelStepType {
  static const setup = RouteRentalBeforeTravelStepType._('Setup');

  final String value;

  const RouteRentalBeforeTravelStepType._(this.value);

  static const values = [setup];

  static RouteRentalBeforeTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteRentalBeforeTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RouteRentalBeforeTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A step that must be performed after the travel portion of the leg.
///
/// @nodoc
class RouteRentalAfterTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RouteRentalAfterTravelStepType type;

  /// Brief description of the step in the requested language.
  final String? instruction;

  RouteRentalAfterTravelStep({
    required this.duration,
    required this.type,
    this.instruction,
  });

  factory RouteRentalAfterTravelStep.fromJson(Map<String, dynamic> json) {
    return RouteRentalAfterTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type: RouteRentalAfterTravelStepType.fromString(
          (json['Type'] as String?) ?? ''),
      instruction: json['Instruction'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final instruction = this.instruction;
    return {
      'Duration': duration,
      'Type': type.value,
      if (instruction != null) 'Instruction': instruction,
    };
  }
}

/// @nodoc
class RouteRentalAfterTravelStepType {
  static const park = RouteRentalAfterTravelStepType._('Park');

  final String value;

  const RouteRentalAfterTravelStepType._(this.value);

  static const values = [park];

  static RouteRentalAfterTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteRentalAfterTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RouteRentalAfterTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details corresponding to the arrival for a leg.
///
/// @nodoc
class RouteVehicleArrival {
  /// Place details corresponding to the arrival.
  final RouteVehiclePlace place;

  /// The arrival time.
  final String? time;

  RouteVehicleArrival({
    required this.place,
    this.time,
  });

  factory RouteVehicleArrival.fromJson(Map<String, dynamic> json) {
    return RouteVehicleArrival(
      place: RouteVehiclePlace.fromJson(
          (json['Place'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      time: json['Time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    final time = this.time;
    return {
      'Place': place,
      if (time != null) 'Time': time,
    };
  }
}

/// Details corresponding to the departure for the leg.
///
/// @nodoc
class RouteVehicleDeparture {
  /// Place details corresponding to the departure.
  final RouteVehiclePlace place;

  /// The departure time.
  final String? time;

  RouteVehicleDeparture({
    required this.place,
    this.time,
  });

  factory RouteVehicleDeparture.fromJson(Map<String, dynamic> json) {
    return RouteVehicleDeparture(
      place: RouteVehiclePlace.fromJson(
          (json['Place'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      time: json['Time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    final time = this.time;
    return {
      'Place': place,
      if (time != null) 'Time': time,
    };
  }
}

/// Summarized details of the route.
///
/// @nodoc
class RouteVehicleSummary {
  /// Summarized details for the leg including before travel, travel and after
  /// travel steps.
  final RouteVehicleOverviewSummary? overview;

  /// Summarized details for the leg including travel steps only. The Distance for
  /// the travel only portion of the journey is in meters
  final RouteVehicleTravelOnlySummary? travelOnly;

  RouteVehicleSummary({
    this.overview,
    this.travelOnly,
  });

  factory RouteVehicleSummary.fromJson(Map<String, dynamic> json) {
    return RouteVehicleSummary(
      overview: json['Overview'] != null
          ? RouteVehicleOverviewSummary.fromJson(
              json['Overview'] as Map<String, dynamic>)
          : null,
      travelOnly: json['TravelOnly'] != null
          ? RouteVehicleTravelOnlySummary.fromJson(
              json['TravelOnly'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final overview = this.overview;
    final travelOnly = this.travelOnly;
    return {
      if (overview != null) 'Overview': overview,
      if (travelOnly != null) 'TravelOnly': travelOnly,
    };
  }
}

/// The zone.
///
/// @nodoc
class RouteZone {
  /// The zone category.
  final RouteZoneCategory? category;

  /// The name of the zone.
  final String? name;

  RouteZone({
    this.category,
    this.name,
  });

  factory RouteZone.fromJson(Map<String, dynamic> json) {
    return RouteZone(
      category:
          (json['Category'] as String?)?.let(RouteZoneCategory.fromString),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final name = this.name;
    return {
      if (category != null) 'Category': category.value,
      if (name != null) 'Name': name,
    };
  }
}

/// @nodoc
class RouteZoneCategory {
  static const congestionPricing = RouteZoneCategory._('CongestionPricing');
  static const environmental = RouteZoneCategory._('Environmental');
  static const vignette = RouteZoneCategory._('Vignette');

  final String value;

  const RouteZoneCategory._(this.value);

  static const values = [congestionPricing, environmental, vignette];

  static RouteZoneCategory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteZoneCategory._(value));

  @override
  bool operator ==(other) => other is RouteZoneCategory && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Steps of a leg that correspond to the travel portion of the leg.
///
/// @nodoc
class RouteVehicleTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RouteVehicleTravelStepType type;

  /// Details that are specific to a Continue Highway step.
  final RouteContinueHighwayStepDetails? continueHighwayStepDetails;

  /// Details that are specific to a Continue step.
  final RouteContinueStepDetails? continueStepDetails;

  /// Details of the current road.
  final RouteRoad? currentRoad;

  /// Distance of the step.
  final int? distance;

  /// Details that are specific to a Enter Highway step.
  final RouteEnterHighwayStepDetails? enterHighwayStepDetails;

  /// Exit number of the road exit, if applicable.
  final List<LocalizedString>? exitNumber;

  /// Details that are specific to a Roundabout Exit step.
  final RouteExitStepDetails? exitStepDetails;

  /// Offset in the leg geometry corresponding to the start of this step.
  final int? geometryOffset;

  /// Brief description of the step in the requested language.
  /// <note>
  /// Only available when the TravelStepType is Default.
  /// </note>
  final String? instruction;

  /// Details that are specific to a Keep step.
  final RouteKeepStepDetails? keepStepDetails;

  /// Details of the next road. See RouteRoad for details of sub-attributes.
  final RouteRoad? nextRoad;

  /// Details that are specific to a Ramp step.
  final RouteRampStepDetails? rampStepDetails;

  /// Details that are specific to a Roundabout Enter step.
  final RouteRoundaboutEnterStepDetails? roundaboutEnterStepDetails;

  /// Details that are specific to a Roundabout Exit step.
  final RouteRoundaboutExitStepDetails? roundaboutExitStepDetails;

  /// Details that are specific to a Roundabout Pass step.
  final RouteRoundaboutPassStepDetails? roundaboutPassStepDetails;

  /// Sign post information of the action, applicable only for TurnByTurn steps.
  /// See RouteSignpost for details of sub-attributes.
  final RouteSignpost? signpost;

  /// Details that are specific to a Turn step.
  final RouteTurnStepDetails? turnStepDetails;

  /// Details that are specific to a Turn step.
  final RouteUTurnStepDetails? uTurnStepDetails;

  RouteVehicleTravelStep({
    required this.duration,
    required this.type,
    this.continueHighwayStepDetails,
    this.continueStepDetails,
    this.currentRoad,
    this.distance,
    this.enterHighwayStepDetails,
    this.exitNumber,
    this.exitStepDetails,
    this.geometryOffset,
    this.instruction,
    this.keepStepDetails,
    this.nextRoad,
    this.rampStepDetails,
    this.roundaboutEnterStepDetails,
    this.roundaboutExitStepDetails,
    this.roundaboutPassStepDetails,
    this.signpost,
    this.turnStepDetails,
    this.uTurnStepDetails,
  });

  factory RouteVehicleTravelStep.fromJson(Map<String, dynamic> json) {
    return RouteVehicleTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type: RouteVehicleTravelStepType.fromString(
          (json['Type'] as String?) ?? ''),
      continueHighwayStepDetails: json['ContinueHighwayStepDetails'] != null
          ? RouteContinueHighwayStepDetails.fromJson(
              json['ContinueHighwayStepDetails'] as Map<String, dynamic>)
          : null,
      continueStepDetails: json['ContinueStepDetails'] != null
          ? RouteContinueStepDetails.fromJson(
              json['ContinueStepDetails'] as Map<String, dynamic>)
          : null,
      currentRoad: json['CurrentRoad'] != null
          ? RouteRoad.fromJson(json['CurrentRoad'] as Map<String, dynamic>)
          : null,
      distance: json['Distance'] as int?,
      enterHighwayStepDetails: json['EnterHighwayStepDetails'] != null
          ? RouteEnterHighwayStepDetails.fromJson(
              json['EnterHighwayStepDetails'] as Map<String, dynamic>)
          : null,
      exitNumber: (json['ExitNumber'] as List?)
          ?.nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      exitStepDetails: json['ExitStepDetails'] != null
          ? RouteExitStepDetails.fromJson(
              json['ExitStepDetails'] as Map<String, dynamic>)
          : null,
      geometryOffset: json['GeometryOffset'] as int?,
      instruction: json['Instruction'] as String?,
      keepStepDetails: json['KeepStepDetails'] != null
          ? RouteKeepStepDetails.fromJson(
              json['KeepStepDetails'] as Map<String, dynamic>)
          : null,
      nextRoad: json['NextRoad'] != null
          ? RouteRoad.fromJson(json['NextRoad'] as Map<String, dynamic>)
          : null,
      rampStepDetails: json['RampStepDetails'] != null
          ? RouteRampStepDetails.fromJson(
              json['RampStepDetails'] as Map<String, dynamic>)
          : null,
      roundaboutEnterStepDetails: json['RoundaboutEnterStepDetails'] != null
          ? RouteRoundaboutEnterStepDetails.fromJson(
              json['RoundaboutEnterStepDetails'] as Map<String, dynamic>)
          : null,
      roundaboutExitStepDetails: json['RoundaboutExitStepDetails'] != null
          ? RouteRoundaboutExitStepDetails.fromJson(
              json['RoundaboutExitStepDetails'] as Map<String, dynamic>)
          : null,
      roundaboutPassStepDetails: json['RoundaboutPassStepDetails'] != null
          ? RouteRoundaboutPassStepDetails.fromJson(
              json['RoundaboutPassStepDetails'] as Map<String, dynamic>)
          : null,
      signpost: json['Signpost'] != null
          ? RouteSignpost.fromJson(json['Signpost'] as Map<String, dynamic>)
          : null,
      turnStepDetails: json['TurnStepDetails'] != null
          ? RouteTurnStepDetails.fromJson(
              json['TurnStepDetails'] as Map<String, dynamic>)
          : null,
      uTurnStepDetails: json['UTurnStepDetails'] != null
          ? RouteUTurnStepDetails.fromJson(
              json['UTurnStepDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final continueHighwayStepDetails = this.continueHighwayStepDetails;
    final continueStepDetails = this.continueStepDetails;
    final currentRoad = this.currentRoad;
    final distance = this.distance;
    final enterHighwayStepDetails = this.enterHighwayStepDetails;
    final exitNumber = this.exitNumber;
    final exitStepDetails = this.exitStepDetails;
    final geometryOffset = this.geometryOffset;
    final instruction = this.instruction;
    final keepStepDetails = this.keepStepDetails;
    final nextRoad = this.nextRoad;
    final rampStepDetails = this.rampStepDetails;
    final roundaboutEnterStepDetails = this.roundaboutEnterStepDetails;
    final roundaboutExitStepDetails = this.roundaboutExitStepDetails;
    final roundaboutPassStepDetails = this.roundaboutPassStepDetails;
    final signpost = this.signpost;
    final turnStepDetails = this.turnStepDetails;
    final uTurnStepDetails = this.uTurnStepDetails;
    return {
      'Duration': duration,
      'Type': type.value,
      if (continueHighwayStepDetails != null)
        'ContinueHighwayStepDetails': continueHighwayStepDetails,
      if (continueStepDetails != null)
        'ContinueStepDetails': continueStepDetails,
      if (currentRoad != null) 'CurrentRoad': currentRoad,
      if (distance != null) 'Distance': distance,
      if (enterHighwayStepDetails != null)
        'EnterHighwayStepDetails': enterHighwayStepDetails,
      if (exitNumber != null) 'ExitNumber': exitNumber,
      if (exitStepDetails != null) 'ExitStepDetails': exitStepDetails,
      if (geometryOffset != null) 'GeometryOffset': geometryOffset,
      if (instruction != null) 'Instruction': instruction,
      if (keepStepDetails != null) 'KeepStepDetails': keepStepDetails,
      if (nextRoad != null) 'NextRoad': nextRoad,
      if (rampStepDetails != null) 'RampStepDetails': rampStepDetails,
      if (roundaboutEnterStepDetails != null)
        'RoundaboutEnterStepDetails': roundaboutEnterStepDetails,
      if (roundaboutExitStepDetails != null)
        'RoundaboutExitStepDetails': roundaboutExitStepDetails,
      if (roundaboutPassStepDetails != null)
        'RoundaboutPassStepDetails': roundaboutPassStepDetails,
      if (signpost != null) 'Signpost': signpost,
      if (turnStepDetails != null) 'TurnStepDetails': turnStepDetails,
      if (uTurnStepDetails != null) 'UTurnStepDetails': uTurnStepDetails,
    };
  }
}

/// Details related to the continue highway step.
///
/// @nodoc
class RouteContinueHighwayStepDetails {
  /// Name of the intersection, if applicable to the step.
  final List<LocalizedString> intersection;

  /// Steering direction for the step.
  final RouteSteeringDirection? steeringDirection;

  /// Angle of the turn.
  final double? turnAngle;

  /// Intensity of the turn.
  final RouteTurnIntensity? turnIntensity;

  RouteContinueHighwayStepDetails({
    required this.intersection,
    this.steeringDirection,
    this.turnAngle,
    this.turnIntensity,
  });

  factory RouteContinueHighwayStepDetails.fromJson(Map<String, dynamic> json) {
    return RouteContinueHighwayStepDetails(
      intersection: ((json['Intersection'] as List?) ?? const [])
          .nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      steeringDirection: (json['SteeringDirection'] as String?)
          ?.let(RouteSteeringDirection.fromString),
      turnAngle: json['TurnAngle'] as double?,
      turnIntensity: (json['TurnIntensity'] as String?)
          ?.let(RouteTurnIntensity.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final intersection = this.intersection;
    final steeringDirection = this.steeringDirection;
    final turnAngle = this.turnAngle;
    final turnIntensity = this.turnIntensity;
    return {
      'Intersection': intersection,
      if (steeringDirection != null)
        'SteeringDirection': steeringDirection.value,
      if (turnAngle != null) 'TurnAngle': turnAngle,
      if (turnIntensity != null) 'TurnIntensity': turnIntensity.value,
    };
  }
}

/// The road on the route.
///
/// @nodoc
class RouteRoad {
  /// Name of the road (localized).
  final List<LocalizedString> roadName;

  /// Route number of the road.
  final List<RouteNumber> routeNumber;

  /// Names of destinations that can be reached when traveling on the road.
  final List<LocalizedString> towards;

  /// The type of road.
  final RouteRoadType? type;

  RouteRoad({
    required this.roadName,
    required this.routeNumber,
    required this.towards,
    this.type,
  });

  factory RouteRoad.fromJson(Map<String, dynamic> json) {
    return RouteRoad(
      roadName: ((json['RoadName'] as List?) ?? const [])
          .nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      routeNumber: ((json['RouteNumber'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      towards: ((json['Towards'] as List?) ?? const [])
          .nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.let(RouteRoadType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final roadName = this.roadName;
    final routeNumber = this.routeNumber;
    final towards = this.towards;
    final type = this.type;
    return {
      'RoadName': roadName,
      'RouteNumber': routeNumber,
      'Towards': towards,
      if (type != null) 'Type': type.value,
    };
  }
}

/// Details related to the enter highway step.
///
/// @nodoc
class RouteEnterHighwayStepDetails {
  /// Name of the intersection, if applicable to the step.
  final List<LocalizedString> intersection;

  /// Steering direction for the step.
  final RouteSteeringDirection? steeringDirection;

  /// Angle of the turn.
  final double? turnAngle;

  /// Intensity of the turn.
  final RouteTurnIntensity? turnIntensity;

  RouteEnterHighwayStepDetails({
    required this.intersection,
    this.steeringDirection,
    this.turnAngle,
    this.turnIntensity,
  });

  factory RouteEnterHighwayStepDetails.fromJson(Map<String, dynamic> json) {
    return RouteEnterHighwayStepDetails(
      intersection: ((json['Intersection'] as List?) ?? const [])
          .nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      steeringDirection: (json['SteeringDirection'] as String?)
          ?.let(RouteSteeringDirection.fromString),
      turnAngle: json['TurnAngle'] as double?,
      turnIntensity: (json['TurnIntensity'] as String?)
          ?.let(RouteTurnIntensity.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final intersection = this.intersection;
    final steeringDirection = this.steeringDirection;
    final turnAngle = this.turnAngle;
    final turnIntensity = this.turnIntensity;
    return {
      'Intersection': intersection,
      if (steeringDirection != null)
        'SteeringDirection': steeringDirection.value,
      if (turnAngle != null) 'TurnAngle': turnAngle,
      if (turnIntensity != null) 'TurnIntensity': turnIntensity.value,
    };
  }
}

/// Sign post information of the action, applicable only for TurnByTurn steps.
/// See RouteSignpost for details of sub-attributes.
///
/// @nodoc
class RouteSignpost {
  /// Labels present on the sign post.
  final List<RouteSignpostLabel> labels;

  RouteSignpost({
    required this.labels,
  });

  factory RouteSignpost.fromJson(Map<String, dynamic> json) {
    return RouteSignpost(
      labels: ((json['Labels'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteSignpostLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final labels = this.labels;
    return {
      'Labels': labels,
    };
  }
}

/// @nodoc
class RouteVehicleTravelStepType {
  static const arrive = RouteVehicleTravelStepType._('Arrive');
  static const $continue = RouteVehicleTravelStepType._('Continue');
  static const continueHighway =
      RouteVehicleTravelStepType._('ContinueHighway');
  static const depart = RouteVehicleTravelStepType._('Depart');
  static const enterHighway = RouteVehicleTravelStepType._('EnterHighway');
  static const exit = RouteVehicleTravelStepType._('Exit');
  static const keep = RouteVehicleTravelStepType._('Keep');
  static const ramp = RouteVehicleTravelStepType._('Ramp');
  static const roundaboutEnter =
      RouteVehicleTravelStepType._('RoundaboutEnter');
  static const roundaboutExit = RouteVehicleTravelStepType._('RoundaboutExit');
  static const roundaboutPass = RouteVehicleTravelStepType._('RoundaboutPass');
  static const turn = RouteVehicleTravelStepType._('Turn');
  static const uTurn = RouteVehicleTravelStepType._('UTurn');

  final String value;

  const RouteVehicleTravelStepType._(this.value);

  static const values = [
    arrive,
    $continue,
    continueHighway,
    depart,
    enterHighway,
    exit,
    keep,
    ramp,
    roundaboutEnter,
    roundaboutExit,
    roundaboutPass,
    turn,
    uTurn
  ];

  static RouteVehicleTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteVehicleTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RouteVehicleTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Labels presented on the sign post.
///
/// @nodoc
class RouteSignpostLabel {
  /// Route number of the road.
  final RouteNumber? routeNumber;

  /// The Signpost text.
  final LocalizedString? text;

  RouteSignpostLabel({
    this.routeNumber,
    this.text,
  });

  factory RouteSignpostLabel.fromJson(Map<String, dynamic> json) {
    return RouteSignpostLabel(
      routeNumber: json['RouteNumber'] != null
          ? RouteNumber.fromJson(json['RouteNumber'] as Map<String, dynamic>)
          : null,
      text: json['Text'] != null
          ? LocalizedString.fromJson(json['Text'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final routeNumber = this.routeNumber;
    final text = this.text;
    return {
      if (routeNumber != null) 'RouteNumber': routeNumber,
      if (text != null) 'Text': text,
    };
  }
}

/// @nodoc
class RouteRoadType {
  static const highway = RouteRoadType._('Highway');
  static const rural = RouteRoadType._('Rural');
  static const urban = RouteRoadType._('Urban');

  final String value;

  const RouteRoadType._(this.value);

  static const values = [highway, rural, urban];

  static RouteRoadType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteRoadType._(value));

  @override
  bool operator ==(other) => other is RouteRoadType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Toll systems are authorities that collect payments for the toll.
///
/// @nodoc
class RouteTollSystem {
  /// The toll system name.
  final String? name;

  RouteTollSystem({
    this.name,
  });

  factory RouteTollSystem.fromJson(Map<String, dynamic> json) {
    return RouteTollSystem(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// Provides details about toll information along a route, including the payment
/// sites, applicable toll rates, toll systems, and the country associated with
/// the toll collection.
///
/// @nodoc
class RouteToll {
  /// Locations or sites where the toll fare is collected.
  final List<RouteTollPaymentSite> paymentSites;

  /// Toll rates that need to be paid to travel this leg of the route.
  final List<RouteTollRate> rates;

  /// Toll systems are authorities that collect payments for the toll.
  final List<int> systems;

  /// The alpha-2 or alpha-3 character code for the country.
  final String? country;

  RouteToll({
    required this.paymentSites,
    required this.rates,
    required this.systems,
    this.country,
  });

  factory RouteToll.fromJson(Map<String, dynamic> json) {
    return RouteToll(
      paymentSites: ((json['PaymentSites'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteTollPaymentSite.fromJson(e as Map<String, dynamic>))
          .toList(),
      rates: ((json['Rates'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteTollRate.fromJson(e as Map<String, dynamic>))
          .toList(),
      systems: ((json['Systems'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as int)
          .toList(),
      country: json['Country'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final paymentSites = this.paymentSites;
    final rates = this.rates;
    final systems = this.systems;
    final country = this.country;
    return {
      'PaymentSites': paymentSites,
      'Rates': rates,
      'Systems': systems,
      if (country != null) 'Country': country,
    };
  }
}

/// The toll rate.
///
/// @nodoc
class RouteTollRate {
  /// The Toll rate Id.
  final String id;

  /// Price in the local regional currency.
  final RouteTollPrice localPrice;

  /// The name of the toll.
  final String name;

  /// Accepted payment methods at the toll.
  final List<RouteTollPaymentMethod> paymentMethods;

  /// Transponders for which this toll can be applied.
  final List<RouteTransponder> transponders;

  /// Time when the rate is valid.
  final String? applicableTimes;

  /// Price in the converted currency as specified in the request.
  final RouteTollPrice? convertedPrice;

  /// Details if the toll rate can be a pass that supports multiple trips.
  final RouteTollPass? pass;

  RouteTollRate({
    required this.id,
    required this.localPrice,
    required this.name,
    required this.paymentMethods,
    required this.transponders,
    this.applicableTimes,
    this.convertedPrice,
    this.pass,
  });

  factory RouteTollRate.fromJson(Map<String, dynamic> json) {
    return RouteTollRate(
      id: (json['Id'] as String?) ?? '',
      localPrice: RouteTollPrice.fromJson(
          (json['LocalPrice'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['Name'] as String?) ?? '',
      paymentMethods: ((json['PaymentMethods'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteTollPaymentMethod.fromString((e as String)))
          .toList(),
      transponders: ((json['Transponders'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteTransponder.fromJson(e as Map<String, dynamic>))
          .toList(),
      applicableTimes: json['ApplicableTimes'] as String?,
      convertedPrice: json['ConvertedPrice'] != null
          ? RouteTollPrice.fromJson(
              json['ConvertedPrice'] as Map<String, dynamic>)
          : null,
      pass: json['Pass'] != null
          ? RouteTollPass.fromJson(json['Pass'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final localPrice = this.localPrice;
    final name = this.name;
    final paymentMethods = this.paymentMethods;
    final transponders = this.transponders;
    final applicableTimes = this.applicableTimes;
    final convertedPrice = this.convertedPrice;
    final pass = this.pass;
    return {
      'Id': id,
      'LocalPrice': localPrice,
      'Name': name,
      'PaymentMethods': paymentMethods.map((e) => e.value).toList(),
      'Transponders': transponders,
      if (applicableTimes != null) 'ApplicableTimes': applicableTimes,
      if (convertedPrice != null) 'ConvertedPrice': convertedPrice,
      if (pass != null) 'Pass': pass,
    };
  }
}

/// The toll price.
///
/// @nodoc
class RouteTollPrice {
  /// Currency code corresponding to the price. This is the same as Currency
  /// specified in the request.
  final String currency;

  /// If the price is an estimate or an exact value.
  final bool estimate;

  /// If the price is a range or an exact value. If any of the toll fares making
  /// up the route is a range, the overall price is also a range.
  final bool range;

  /// Exact price, if not a range.
  final double value;

  /// Duration for which the price corresponds to.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? perDuration;

  /// Price range with a minimum and maximum value, if a range.
  final RouteTollPriceValueRange? rangeValue;

  RouteTollPrice({
    required this.currency,
    required this.estimate,
    required this.range,
    required this.value,
    this.perDuration,
    this.rangeValue,
  });

  factory RouteTollPrice.fromJson(Map<String, dynamic> json) {
    return RouteTollPrice(
      currency: (json['Currency'] as String?) ?? '',
      estimate: (json['Estimate'] as bool?) ?? false,
      range: (json['Range'] as bool?) ?? false,
      value: (json['Value'] as double?) ?? 0,
      perDuration: json['PerDuration'] as int?,
      rangeValue: json['RangeValue'] != null
          ? RouteTollPriceValueRange.fromJson(
              json['RangeValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final currency = this.currency;
    final estimate = this.estimate;
    final range = this.range;
    final value = this.value;
    final perDuration = this.perDuration;
    final rangeValue = this.rangeValue;
    return {
      'Currency': currency,
      'Estimate': estimate,
      'Range': range,
      'Value': value,
      if (perDuration != null) 'PerDuration': perDuration,
      if (rangeValue != null) 'RangeValue': rangeValue,
    };
  }
}

/// Details if the toll rate can be a pass that supports multiple trips.
///
/// @nodoc
class RouteTollPass {
  /// If the pass includes the rate for the return leg of the trip.
  final bool? includesReturnTrip;

  /// If the pass is only valid for senior persons.
  final bool? seniorPass;

  /// If the toll pass can be transferred, and how many times.
  final int? transferCount;

  /// Number of trips the pass is valid for.
  final int? tripCount;

  /// Period for which the pass is valid.
  final RouteTollPassValidityPeriod? validityPeriod;

  RouteTollPass({
    this.includesReturnTrip,
    this.seniorPass,
    this.transferCount,
    this.tripCount,
    this.validityPeriod,
  });

  factory RouteTollPass.fromJson(Map<String, dynamic> json) {
    return RouteTollPass(
      includesReturnTrip: json['IncludesReturnTrip'] as bool?,
      seniorPass: json['SeniorPass'] as bool?,
      transferCount: json['TransferCount'] as int?,
      tripCount: json['TripCount'] as int?,
      validityPeriod: json['ValidityPeriod'] != null
          ? RouteTollPassValidityPeriod.fromJson(
              json['ValidityPeriod'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final includesReturnTrip = this.includesReturnTrip;
    final seniorPass = this.seniorPass;
    final transferCount = this.transferCount;
    final tripCount = this.tripCount;
    final validityPeriod = this.validityPeriod;
    return {
      if (includesReturnTrip != null) 'IncludesReturnTrip': includesReturnTrip,
      if (seniorPass != null) 'SeniorPass': seniorPass,
      if (transferCount != null) 'TransferCount': transferCount,
      if (tripCount != null) 'TripCount': tripCount,
      if (validityPeriod != null) 'ValidityPeriod': validityPeriod,
    };
  }
}

/// Transponders for which this toll can be applied.
///
/// @nodoc
class RouteTransponder {
  /// Names of the toll system collecting the toll.
  final String? systemName;

  RouteTransponder({
    this.systemName,
  });

  factory RouteTransponder.fromJson(Map<String, dynamic> json) {
    return RouteTransponder(
      systemName: json['SystemName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final systemName = this.systemName;
    return {
      if (systemName != null) 'SystemName': systemName,
    };
  }
}

/// @nodoc
class RouteTollPaymentMethod {
  static const bankCard = RouteTollPaymentMethod._('BankCard');
  static const cash = RouteTollPaymentMethod._('Cash');
  static const cashExact = RouteTollPaymentMethod._('CashExact');
  static const creditCard = RouteTollPaymentMethod._('CreditCard');
  static const passSubscription = RouteTollPaymentMethod._('PassSubscription');
  static const travelCard = RouteTollPaymentMethod._('TravelCard');
  static const transponder = RouteTollPaymentMethod._('Transponder');
  static const videoToll = RouteTollPaymentMethod._('VideoToll');

  final String value;

  const RouteTollPaymentMethod._(this.value);

  static const values = [
    bankCard,
    cash,
    cashExact,
    creditCard,
    passSubscription,
    travelCard,
    transponder,
    videoToll
  ];

  static RouteTollPaymentMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTollPaymentMethod._(value));

  @override
  bool operator ==(other) =>
      other is RouteTollPaymentMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Period for which the pass is valid.
///
/// @nodoc
class RouteTollPassValidityPeriod {
  /// Validity period.
  final RouteTollPassValidityPeriodType period;

  /// Counts for the validity period.
  final int? periodCount;

  RouteTollPassValidityPeriod({
    required this.period,
    this.periodCount,
  });

  factory RouteTollPassValidityPeriod.fromJson(Map<String, dynamic> json) {
    return RouteTollPassValidityPeriod(
      period: RouteTollPassValidityPeriodType.fromString(
          (json['Period'] as String?) ?? ''),
      periodCount: json['PeriodCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final period = this.period;
    final periodCount = this.periodCount;
    return {
      'Period': period.value,
      if (periodCount != null) 'PeriodCount': periodCount,
    };
  }
}

/// @nodoc
class RouteTollPassValidityPeriodType {
  static const annual = RouteTollPassValidityPeriodType._('Annual');
  static const days = RouteTollPassValidityPeriodType._('Days');
  static const extendedAnnual =
      RouteTollPassValidityPeriodType._('ExtendedAnnual');
  static const minutes = RouteTollPassValidityPeriodType._('Minutes');
  static const months = RouteTollPassValidityPeriodType._('Months');

  final String value;

  const RouteTollPassValidityPeriodType._(this.value);

  static const values = [annual, days, extendedAnnual, minutes, months];

  static RouteTollPassValidityPeriodType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTollPassValidityPeriodType._(value));

  @override
  bool operator ==(other) =>
      other is RouteTollPassValidityPeriodType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Locations or sites where the toll fare is collected.
///
/// @nodoc
class RouteTollPaymentSite {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// Name of the payment site.
  final String? name;

  RouteTollPaymentSite({
    required this.position,
    this.name,
  });

  factory RouteTollPaymentSite.fromJson(Map<String, dynamic> json) {
    return RouteTollPaymentSite(
      position: ((json['Position'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final name = this.name;
    return {
      'Position': position,
      if (name != null) 'Name': name,
    };
  }
}

/// Summary including duration and distance for the entire leg.
///
/// @nodoc
class RouteVehicleOverviewSummary {
  /// Distance of the entire leg.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int distance;

  /// Duration of the entire leg.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Total duration in free flowing traffic, which is the best case or shortest
  /// duration possible to cover the leg.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? bestCaseDuration;

  /// Duration of the leg under typical traffic congestion.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? typicalDuration;

  RouteVehicleOverviewSummary({
    required this.distance,
    required this.duration,
    this.bestCaseDuration,
    this.typicalDuration,
  });

  factory RouteVehicleOverviewSummary.fromJson(Map<String, dynamic> json) {
    return RouteVehicleOverviewSummary(
      distance: (json['Distance'] as int?) ?? 0,
      duration: (json['Duration'] as int?) ?? 0,
      bestCaseDuration: json['BestCaseDuration'] as int?,
      typicalDuration: json['TypicalDuration'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final duration = this.duration;
    final bestCaseDuration = this.bestCaseDuration;
    final typicalDuration = this.typicalDuration;
    return {
      'Distance': distance,
      'Duration': duration,
      if (bestCaseDuration != null) 'BestCaseDuration': bestCaseDuration,
      if (typicalDuration != null) 'TypicalDuration': typicalDuration,
    };
  }
}

/// Summarized details of the route.
///
/// @nodoc
class RouteVehicleTravelOnlySummary {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Total duration in free flowing traffic, which is the best case or shortest
  /// duration possible to cover the leg.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? bestCaseDuration;

  /// Duration of the leg under typical traffic congestion.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? typicalDuration;

  RouteVehicleTravelOnlySummary({
    required this.duration,
    this.bestCaseDuration,
    this.typicalDuration,
  });

  factory RouteVehicleTravelOnlySummary.fromJson(Map<String, dynamic> json) {
    return RouteVehicleTravelOnlySummary(
      duration: (json['Duration'] as int?) ?? 0,
      bestCaseDuration: json['BestCaseDuration'] as int?,
      typicalDuration: json['TypicalDuration'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final bestCaseDuration = this.bestCaseDuration;
    final typicalDuration = this.typicalDuration;
    return {
      'Duration': duration,
      if (bestCaseDuration != null) 'BestCaseDuration': bestCaseDuration,
      if (typicalDuration != null) 'TypicalDuration': typicalDuration,
    };
  }
}

/// Span computed for the requested SpanAdditionalFeatures.
///
/// @nodoc
class RouteVehicleSpan {
  /// Duration of the computed span without traffic congestion.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? bestCaseDuration;

  /// Access attributes for a car corresponding to the span.
  final List<RouteSpanCarAccessAttribute>? carAccess;

  /// 3 letter Country code corresponding to the Span.
  final String? country;

  /// Distance of the computed span. This feature doesn't split a span, but is
  /// always computed on a span split by other properties.
  final int? distance;

  /// Duration of the computed span. This feature doesn't split a span, but is
  /// always computed on a span split by other properties.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? duration;

  /// Dynamic speed details corresponding to the span.
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final RouteSpanDynamicSpeedDetails? dynamicSpeed;

  /// A numerical value indicating the functional classification of the road
  /// segment corresponding to the span.
  ///
  /// Classification values are part of the hierarchical network that helps
  /// determine a logical and efficient route, and have the following definitions:
  /// <ol>
  /// <li>
  /// Roads that allow for high volume, maximum speed traffic movement between and
  /// through major metropolitan areas.
  /// </li>
  /// <li>
  /// Roads that are used to channel traffic to functional class 1 roads for
  /// travel between and through cities in the shortest amount of time.
  /// </li>
  /// <li>
  /// Roads that intersect functional class 2 roads and provide a high volume of
  /// traffic movement at a lower level of mobility than functional class 2 roads.
  /// </li>
  /// <li>
  /// Roads that provide for a high volume of traffic movement at moderate speeds
  /// between neighborhoods.
  /// </li>
  /// <li>
  /// Roads with volume and traffic movement below the level of any other
  /// functional class.
  /// </li> </ol>
  final int? functionalClassification;

  /// Attributes corresponding to a gate. The gate is present at the end of the
  /// returned span.
  final RouteSpanGateAttribute? gate;

  /// Offset in the leg geometry corresponding to the start of this span.
  final int? geometryOffset;

  /// Incidents corresponding to the span. These index into the Incidents in the
  /// parent Leg.
  final List<int>? incidents;

  /// Provides an array of names of the vehicle span in available languages.
  final List<LocalizedString>? names;

  /// Notices are additional information returned that indicate issues that
  /// occurred during route calculation.
  final List<int>? notices;

  /// Attributes corresponding to a railway crossing. The gate is present at the
  /// end of the returned span.
  final RouteSpanRailwayCrossingAttribute? railwayCrossing;

  /// 2-3 letter Region code corresponding to the Span. This is either a province
  /// or a state.
  final String? region;

  /// Attributes for the road segment corresponding to the span.
  final List<RouteSpanRoadAttribute>? roadAttributes;

  /// Designated route name or number corresponding to the span.
  final List<RouteNumber>? routeNumbers;

  /// Access attributes for a scooter corresponding to the span.
  final List<RouteSpanScooterAccessAttribute>? scooterAccess;

  /// Speed limit details corresponding to the span.
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final RouteSpanSpeedLimitDetails? speedLimit;

  /// Toll systems are authorities that collect payments for the toll.
  final List<int>? tollSystems;

  /// Access attributes for a truck corresponding to the span.
  final List<RouteSpanTruckAccessAttribute>? truckAccess;

  /// Truck road type identifiers. <code>BK1</code> through <code>BK4</code> apply
  /// only to Sweden. <code>A2,A4,B2,B4,C,D,ET2,ET4</code> apply only to Mexico.
  /// <note>
  /// There are currently no other supported values as of 26th April 2024.
  /// </note>
  final List<int>? truckRoadTypes;

  /// Duration of the computed span under typical traffic congestion.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? typicalDuration;

  /// Zones corresponding to this leg of the route.
  final List<int>? zones;

  RouteVehicleSpan({
    this.bestCaseDuration,
    this.carAccess,
    this.country,
    this.distance,
    this.duration,
    this.dynamicSpeed,
    this.functionalClassification,
    this.gate,
    this.geometryOffset,
    this.incidents,
    this.names,
    this.notices,
    this.railwayCrossing,
    this.region,
    this.roadAttributes,
    this.routeNumbers,
    this.scooterAccess,
    this.speedLimit,
    this.tollSystems,
    this.truckAccess,
    this.truckRoadTypes,
    this.typicalDuration,
    this.zones,
  });

  factory RouteVehicleSpan.fromJson(Map<String, dynamic> json) {
    return RouteVehicleSpan(
      bestCaseDuration: json['BestCaseDuration'] as int?,
      carAccess: (json['CarAccess'] as List?)
          ?.nonNulls
          .map((e) => RouteSpanCarAccessAttribute.fromString((e as String)))
          .toList(),
      country: json['Country'] as String?,
      distance: json['Distance'] as int?,
      duration: json['Duration'] as int?,
      dynamicSpeed: json['DynamicSpeed'] != null
          ? RouteSpanDynamicSpeedDetails.fromJson(
              json['DynamicSpeed'] as Map<String, dynamic>)
          : null,
      functionalClassification: json['FunctionalClassification'] as int?,
      gate: (json['Gate'] as String?)?.let(RouteSpanGateAttribute.fromString),
      geometryOffset: json['GeometryOffset'] as int?,
      incidents:
          (json['Incidents'] as List?)?.nonNulls.map((e) => e as int).toList(),
      names: (json['Names'] as List?)
          ?.nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      notices:
          (json['Notices'] as List?)?.nonNulls.map((e) => e as int).toList(),
      railwayCrossing: (json['RailwayCrossing'] as String?)
          ?.let(RouteSpanRailwayCrossingAttribute.fromString),
      region: json['Region'] as String?,
      roadAttributes: (json['RoadAttributes'] as List?)
          ?.nonNulls
          .map((e) => RouteSpanRoadAttribute.fromString((e as String)))
          .toList(),
      routeNumbers: (json['RouteNumbers'] as List?)
          ?.nonNulls
          .map((e) => RouteNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      scooterAccess: (json['ScooterAccess'] as List?)
          ?.nonNulls
          .map((e) => RouteSpanScooterAccessAttribute.fromString((e as String)))
          .toList(),
      speedLimit: json['SpeedLimit'] != null
          ? RouteSpanSpeedLimitDetails.fromJson(
              json['SpeedLimit'] as Map<String, dynamic>)
          : null,
      tollSystems: (json['TollSystems'] as List?)
          ?.nonNulls
          .map((e) => e as int)
          .toList(),
      truckAccess: (json['TruckAccess'] as List?)
          ?.nonNulls
          .map((e) => RouteSpanTruckAccessAttribute.fromString((e as String)))
          .toList(),
      truckRoadTypes: (json['TruckRoadTypes'] as List?)
          ?.nonNulls
          .map((e) => e as int)
          .toList(),
      typicalDuration: json['TypicalDuration'] as int?,
      zones: (json['Zones'] as List?)?.nonNulls.map((e) => e as int).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bestCaseDuration = this.bestCaseDuration;
    final carAccess = this.carAccess;
    final country = this.country;
    final distance = this.distance;
    final duration = this.duration;
    final dynamicSpeed = this.dynamicSpeed;
    final functionalClassification = this.functionalClassification;
    final gate = this.gate;
    final geometryOffset = this.geometryOffset;
    final incidents = this.incidents;
    final names = this.names;
    final notices = this.notices;
    final railwayCrossing = this.railwayCrossing;
    final region = this.region;
    final roadAttributes = this.roadAttributes;
    final routeNumbers = this.routeNumbers;
    final scooterAccess = this.scooterAccess;
    final speedLimit = this.speedLimit;
    final tollSystems = this.tollSystems;
    final truckAccess = this.truckAccess;
    final truckRoadTypes = this.truckRoadTypes;
    final typicalDuration = this.typicalDuration;
    final zones = this.zones;
    return {
      if (bestCaseDuration != null) 'BestCaseDuration': bestCaseDuration,
      if (carAccess != null)
        'CarAccess': carAccess.map((e) => e.value).toList(),
      if (country != null) 'Country': country,
      if (distance != null) 'Distance': distance,
      if (duration != null) 'Duration': duration,
      if (dynamicSpeed != null) 'DynamicSpeed': dynamicSpeed,
      if (functionalClassification != null)
        'FunctionalClassification': functionalClassification,
      if (gate != null) 'Gate': gate.value,
      if (geometryOffset != null) 'GeometryOffset': geometryOffset,
      if (incidents != null) 'Incidents': incidents,
      if (names != null) 'Names': names,
      if (notices != null) 'Notices': notices,
      if (railwayCrossing != null) 'RailwayCrossing': railwayCrossing.value,
      if (region != null) 'Region': region,
      if (roadAttributes != null)
        'RoadAttributes': roadAttributes.map((e) => e.value).toList(),
      if (routeNumbers != null) 'RouteNumbers': routeNumbers,
      if (scooterAccess != null)
        'ScooterAccess': scooterAccess.map((e) => e.value).toList(),
      if (speedLimit != null) 'SpeedLimit': speedLimit,
      if (tollSystems != null) 'TollSystems': tollSystems,
      if (truckAccess != null)
        'TruckAccess': truckAccess.map((e) => e.value).toList(),
      if (truckRoadTypes != null) 'TruckRoadTypes': truckRoadTypes,
      if (typicalDuration != null) 'TypicalDuration': typicalDuration,
      if (zones != null) 'Zones': zones,
    };
  }
}

/// Details about the dynamic speed.
///
/// <b>Unit</b>: <code>kilometers per hour</code>
///
/// @nodoc
class RouteSpanDynamicSpeedDetails {
  /// Estimated speed while traversing the span without traffic congestion.
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? bestCaseSpeed;

  /// Estimated time to turn from this span into the next.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? turnDuration;

  /// Estimated speed while traversing the span under typical traffic congestion.
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? typicalSpeed;

  RouteSpanDynamicSpeedDetails({
    this.bestCaseSpeed,
    this.turnDuration,
    this.typicalSpeed,
  });

  factory RouteSpanDynamicSpeedDetails.fromJson(Map<String, dynamic> json) {
    return RouteSpanDynamicSpeedDetails(
      bestCaseSpeed: json['BestCaseSpeed'] as double?,
      turnDuration: json['TurnDuration'] as int?,
      typicalSpeed: json['TypicalSpeed'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final bestCaseSpeed = this.bestCaseSpeed;
    final turnDuration = this.turnDuration;
    final typicalSpeed = this.typicalSpeed;
    return {
      if (bestCaseSpeed != null) 'BestCaseSpeed': bestCaseSpeed,
      if (turnDuration != null) 'TurnDuration': turnDuration,
      if (typicalSpeed != null) 'TypicalSpeed': typicalSpeed,
    };
  }
}

/// @nodoc
class RouteSpanGateAttribute {
  static const emergency = RouteSpanGateAttribute._('Emergency');
  static const keyAccess = RouteSpanGateAttribute._('KeyAccess');
  static const permissionRequired =
      RouteSpanGateAttribute._('PermissionRequired');

  final String value;

  const RouteSpanGateAttribute._(this.value);

  static const values = [emergency, keyAccess, permissionRequired];

  static RouteSpanGateAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteSpanGateAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RouteSpanGateAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteSpanRailwayCrossingAttribute {
  static const protected = RouteSpanRailwayCrossingAttribute._('Protected');
  static const unprotected = RouteSpanRailwayCrossingAttribute._('Unprotected');

  final String value;

  const RouteSpanRailwayCrossingAttribute._(this.value);

  static const values = [protected, unprotected];

  static RouteSpanRailwayCrossingAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteSpanRailwayCrossingAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RouteSpanRailwayCrossingAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the speed limit corresponding to the span.
///
/// <b>Unit</b>: <code>kilometers per hour</code>
///
/// @nodoc
class RouteSpanSpeedLimitDetails {
  /// Maximum speed.
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? maxSpeed;

  /// If the span doesn't have a speed limit like the Autobahn.
  final bool? unlimited;

  RouteSpanSpeedLimitDetails({
    this.maxSpeed,
    this.unlimited,
  });

  factory RouteSpanSpeedLimitDetails.fromJson(Map<String, dynamic> json) {
    return RouteSpanSpeedLimitDetails(
      maxSpeed: json['MaxSpeed'] as double?,
      unlimited: json['Unlimited'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxSpeed = this.maxSpeed;
    final unlimited = this.unlimited;
    return {
      if (maxSpeed != null) 'MaxSpeed': maxSpeed,
      if (unlimited != null) 'Unlimited': unlimited,
    };
  }
}

/// @nodoc
class RouteSpanTruckAccessAttribute {
  static const allowed = RouteSpanTruckAccessAttribute._('Allowed');
  static const noThroughTraffic =
      RouteSpanTruckAccessAttribute._('NoThroughTraffic');
  static const tollRoad = RouteSpanTruckAccessAttribute._('TollRoad');

  final String value;

  const RouteSpanTruckAccessAttribute._(this.value);

  static const values = [allowed, noThroughTraffic, tollRoad];

  static RouteSpanTruckAccessAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteSpanTruckAccessAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RouteSpanTruckAccessAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteSpanScooterAccessAttribute {
  static const allowed = RouteSpanScooterAccessAttribute._('Allowed');
  static const noThroughTraffic =
      RouteSpanScooterAccessAttribute._('NoThroughTraffic');
  static const tollRoad = RouteSpanScooterAccessAttribute._('TollRoad');

  final String value;

  const RouteSpanScooterAccessAttribute._(this.value);

  static const values = [allowed, noThroughTraffic, tollRoad];

  static RouteSpanScooterAccessAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteSpanScooterAccessAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RouteSpanScooterAccessAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteSpanRoadAttribute {
  static const bridge = RouteSpanRoadAttribute._('Bridge');
  static const builtUpArea = RouteSpanRoadAttribute._('BuiltUpArea');
  static const controlledAccessHighway =
      RouteSpanRoadAttribute._('ControlledAccessHighway');
  static const dirtRoad = RouteSpanRoadAttribute._('DirtRoad');
  static const dividedRoad = RouteSpanRoadAttribute._('DividedRoad');
  static const motorway = RouteSpanRoadAttribute._('Motorway');
  static const privateRoad = RouteSpanRoadAttribute._('PrivateRoad');
  static const ramp = RouteSpanRoadAttribute._('Ramp');
  static const rightHandTraffic = RouteSpanRoadAttribute._('RightHandTraffic');
  static const roundabout = RouteSpanRoadAttribute._('Roundabout');
  static const tunnel = RouteSpanRoadAttribute._('Tunnel');
  static const underConstruction =
      RouteSpanRoadAttribute._('UnderConstruction');

  final String value;

  const RouteSpanRoadAttribute._(this.value);

  static const values = [
    bridge,
    builtUpArea,
    controlledAccessHighway,
    dirtRoad,
    dividedRoad,
    motorway,
    privateRoad,
    ramp,
    rightHandTraffic,
    roundabout,
    tunnel,
    underConstruction
  ];

  static RouteSpanRoadAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteSpanRoadAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RouteSpanRoadAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteSpanCarAccessAttribute {
  static const allowed = RouteSpanCarAccessAttribute._('Allowed');
  static const noThroughTraffic =
      RouteSpanCarAccessAttribute._('NoThroughTraffic');
  static const tollRoad = RouteSpanCarAccessAttribute._('TollRoad');

  final String value;

  const RouteSpanCarAccessAttribute._(this.value);

  static const values = [allowed, noThroughTraffic, tollRoad];

  static RouteSpanCarAccessAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteSpanCarAccessAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RouteSpanCarAccessAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Notices are additional information returned that indicate issues that
/// occurred during route calculation.
///
/// @nodoc
class RouteVehicleNotice {
  /// Code corresponding to the issue.
  final RouteVehicleNoticeCode code;

  /// Additional details of the notice.
  final List<RouteVehicleNoticeDetail> details;

  /// Impact corresponding to the issue. While Low impact notices can be safely
  /// ignored, High impact notices must be evaluated further to determine the
  /// impact.
  final RouteNoticeImpact? impact;

  RouteVehicleNotice({
    required this.code,
    required this.details,
    this.impact,
  });

  factory RouteVehicleNotice.fromJson(Map<String, dynamic> json) {
    return RouteVehicleNotice(
      code: RouteVehicleNoticeCode.fromString((json['Code'] as String?) ?? ''),
      details: ((json['Details'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RouteVehicleNoticeDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      impact: (json['Impact'] as String?)?.let(RouteNoticeImpact.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final details = this.details;
    final impact = this.impact;
    return {
      'Code': code.value,
      'Details': details,
      if (impact != null) 'Impact': impact.value,
    };
  }
}

/// @nodoc
class RouteVehicleNoticeCode {
  static const accuratePolylineUnavailable =
      RouteVehicleNoticeCode._('AccuratePolylineUnavailable');
  static const other = RouteVehicleNoticeCode._('Other');
  static const potentialViolatedAvoidTollRoadUsage =
      RouteVehicleNoticeCode._('PotentialViolatedAvoidTollRoadUsage');
  static const potentialViolatedCarpoolUsage =
      RouteVehicleNoticeCode._('PotentialViolatedCarpoolUsage');
  static const potentialViolatedTurnRestrictionUsage =
      RouteVehicleNoticeCode._('PotentialViolatedTurnRestrictionUsage');
  static const potentialViolatedVehicleRestrictionUsage =
      RouteVehicleNoticeCode._('PotentialViolatedVehicleRestrictionUsage');
  static const potentialViolatedZoneRestrictionUsage =
      RouteVehicleNoticeCode._('PotentialViolatedZoneRestrictionUsage');
  static const seasonalClosure = RouteVehicleNoticeCode._('SeasonalClosure');
  static const tollsDataTemporarilyUnavailable =
      RouteVehicleNoticeCode._('TollsDataTemporarilyUnavailable');
  static const tollsDataUnavailable =
      RouteVehicleNoticeCode._('TollsDataUnavailable');
  static const tollTransponder = RouteVehicleNoticeCode._('TollTransponder');
  static const violatedAvoidControlledAccessHighway =
      RouteVehicleNoticeCode._('ViolatedAvoidControlledAccessHighway');
  static const violatedAvoidDifficultTurns =
      RouteVehicleNoticeCode._('ViolatedAvoidDifficultTurns');
  static const violatedAvoidDirtRoad =
      RouteVehicleNoticeCode._('ViolatedAvoidDirtRoad');
  static const violatedAvoidSeasonalClosure =
      RouteVehicleNoticeCode._('ViolatedAvoidSeasonalClosure');
  static const violatedAvoidTollRoad =
      RouteVehicleNoticeCode._('ViolatedAvoidTollRoad');
  static const violatedAvoidTollTransponder =
      RouteVehicleNoticeCode._('ViolatedAvoidTollTransponder');
  static const violatedAvoidTruckRoadType =
      RouteVehicleNoticeCode._('ViolatedAvoidTruckRoadType');
  static const violatedAvoidTunnel =
      RouteVehicleNoticeCode._('ViolatedAvoidTunnel');
  static const violatedAvoidUTurns =
      RouteVehicleNoticeCode._('ViolatedAvoidUTurns');
  static const violatedBlockedRoad =
      RouteVehicleNoticeCode._('ViolatedBlockedRoad');
  static const violatedCarpool = RouteVehicleNoticeCode._('ViolatedCarpool');
  static const violatedEmergencyGate =
      RouteVehicleNoticeCode._('ViolatedEmergencyGate');
  static const violatedStartDirection =
      RouteVehicleNoticeCode._('ViolatedStartDirection');
  static const violatedTurnRestriction =
      RouteVehicleNoticeCode._('ViolatedTurnRestriction');
  static const violatedVehicleRestriction =
      RouteVehicleNoticeCode._('ViolatedVehicleRestriction');
  static const violatedZoneRestriction =
      RouteVehicleNoticeCode._('ViolatedZoneRestriction');
  static const travelTimeExceedsDriverWorkHours =
      RouteVehicleNoticeCode._('TravelTimeExceedsDriverWorkHours');

  final String value;

  const RouteVehicleNoticeCode._(this.value);

  static const values = [
    accuratePolylineUnavailable,
    other,
    potentialViolatedAvoidTollRoadUsage,
    potentialViolatedCarpoolUsage,
    potentialViolatedTurnRestrictionUsage,
    potentialViolatedVehicleRestrictionUsage,
    potentialViolatedZoneRestrictionUsage,
    seasonalClosure,
    tollsDataTemporarilyUnavailable,
    tollsDataUnavailable,
    tollTransponder,
    violatedAvoidControlledAccessHighway,
    violatedAvoidDifficultTurns,
    violatedAvoidDirtRoad,
    violatedAvoidSeasonalClosure,
    violatedAvoidTollRoad,
    violatedAvoidTollTransponder,
    violatedAvoidTruckRoadType,
    violatedAvoidTunnel,
    violatedAvoidUTurns,
    violatedBlockedRoad,
    violatedCarpool,
    violatedEmergencyGate,
    violatedStartDirection,
    violatedTurnRestriction,
    violatedVehicleRestriction,
    violatedZoneRestriction,
    travelTimeExceedsDriverWorkHours
  ];

  static RouteVehicleNoticeCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteVehicleNoticeCode._(value));

  @override
  bool operator ==(other) =>
      other is RouteVehicleNoticeCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Additional details of the notice.
///
/// @nodoc
class RouteVehicleNoticeDetail {
  /// The notice title.
  final String? title;

  /// Any violated constraints.
  final RouteViolatedConstraints? violatedConstraints;

  RouteVehicleNoticeDetail({
    this.title,
    this.violatedConstraints,
  });

  factory RouteVehicleNoticeDetail.fromJson(Map<String, dynamic> json) {
    return RouteVehicleNoticeDetail(
      title: json['Title'] as String?,
      violatedConstraints: json['ViolatedConstraints'] != null
          ? RouteViolatedConstraints.fromJson(
              json['ViolatedConstraints'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final title = this.title;
    final violatedConstraints = this.violatedConstraints;
    return {
      if (title != null) 'Title': title,
      if (violatedConstraints != null)
        'ViolatedConstraints': violatedConstraints,
    };
  }
}

/// This property contains a summary of violated constraints.
///
/// @nodoc
class RouteViolatedConstraints {
  /// List of Hazardous cargo contained in the vehicle.
  final List<RouteHazardousCargoType> hazardousCargos;

  /// This restriction applies to truck cargo, where the resulting route excludes
  /// roads on which hazardous materials are prohibited from being transported.
  final bool? allHazardsRestricted;

  /// Total number of axles of the vehicle.
  final RouteNoticeDetailRange? axleCount;

  /// The maximum height of the vehicle.
  final int? maxHeight;

  /// The maximum Kpra length of the vehicle.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? maxKpraLength;

  /// The maximum length of the vehicle.
  final int? maxLength;

  /// The maximum load capacity of the vehicle.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? maxPayloadCapacity;

  /// The maximum weight of the route.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final RouteWeightConstraint? maxWeight;

  /// The maximum weight per axle of the vehicle.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? maxWeightPerAxle;

  /// The maximum weight per axle group of the vehicle.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final WeightPerAxleGroup? maxWeightPerAxleGroup;

  /// The maximum width of the vehicle.
  final int? maxWidth;

  /// The number of occupants in the vehicle.
  ///
  /// Default value: <code>1</code>
  final RouteNoticeDetailRange? occupancy;

  /// Access radius restrictions based on time.
  final String? restrictedTimes;

  /// The time dependent constraint.
  final bool? timeDependent;

  /// Number of trailers attached to the vehicle.
  ///
  /// Default value: <code>0</code>
  final RouteNoticeDetailRange? trailerCount;

  /// Travel mode corresponding to the leg.
  final bool? travelMode;

  /// Truck road type identifiers. <code>BK1</code> through <code>BK4</code> apply
  /// only to Sweden. <code>A2,A4,B2,B4,C,D,ET2,ET4</code> apply only to Mexico.
  /// <note>
  /// There are currently no other supported values as of 26th April 2024.
  /// </note>
  final String? truckRoadType;

  /// The type of truck: <code>LightTruck</code> for smaller delivery vehicles,
  /// <code> StraightTruck</code> for rigid body trucks, or <code>Tractor</code>
  /// for tractor-trailer combinations.
  final RouteTruckType? truckType;

  /// The tunnel restriction code.
  ///
  /// Tunnel categories in this list indicate the restrictions which apply to
  /// certain tunnels in Great Britain. They relate to the types of dangerous
  /// goods that can be transported through them.
  ///
  /// <ul>
  /// <li>
  /// <i>Tunnel Category B</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Limited risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Few restrictions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category C</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Medium risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Some restrictions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category D</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: High risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Many restrictions occur
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category E</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Very high risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Restricted tunnel
  /// </li>
  /// </ul> </li>
  /// </ul>
  final String? tunnelRestrictionCode;

  RouteViolatedConstraints({
    required this.hazardousCargos,
    this.allHazardsRestricted,
    this.axleCount,
    this.maxHeight,
    this.maxKpraLength,
    this.maxLength,
    this.maxPayloadCapacity,
    this.maxWeight,
    this.maxWeightPerAxle,
    this.maxWeightPerAxleGroup,
    this.maxWidth,
    this.occupancy,
    this.restrictedTimes,
    this.timeDependent,
    this.trailerCount,
    this.travelMode,
    this.truckRoadType,
    this.truckType,
    this.tunnelRestrictionCode,
  });

  factory RouteViolatedConstraints.fromJson(Map<String, dynamic> json) {
    return RouteViolatedConstraints(
      hazardousCargos: ((json['HazardousCargos'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouteHazardousCargoType.fromString((e as String)))
          .toList(),
      allHazardsRestricted: json['AllHazardsRestricted'] as bool?,
      axleCount: json['AxleCount'] != null
          ? RouteNoticeDetailRange.fromJson(
              json['AxleCount'] as Map<String, dynamic>)
          : null,
      maxHeight: json['MaxHeight'] as int?,
      maxKpraLength: json['MaxKpraLength'] as int?,
      maxLength: json['MaxLength'] as int?,
      maxPayloadCapacity: json['MaxPayloadCapacity'] as int?,
      maxWeight: json['MaxWeight'] != null
          ? RouteWeightConstraint.fromJson(
              json['MaxWeight'] as Map<String, dynamic>)
          : null,
      maxWeightPerAxle: json['MaxWeightPerAxle'] as int?,
      maxWeightPerAxleGroup: json['MaxWeightPerAxleGroup'] != null
          ? WeightPerAxleGroup.fromJson(
              json['MaxWeightPerAxleGroup'] as Map<String, dynamic>)
          : null,
      maxWidth: json['MaxWidth'] as int?,
      occupancy: json['Occupancy'] != null
          ? RouteNoticeDetailRange.fromJson(
              json['Occupancy'] as Map<String, dynamic>)
          : null,
      restrictedTimes: json['RestrictedTimes'] as String?,
      timeDependent: json['TimeDependent'] as bool?,
      trailerCount: json['TrailerCount'] != null
          ? RouteNoticeDetailRange.fromJson(
              json['TrailerCount'] as Map<String, dynamic>)
          : null,
      travelMode: json['TravelMode'] as bool?,
      truckRoadType: json['TruckRoadType'] as String?,
      truckType: (json['TruckType'] as String?)?.let(RouteTruckType.fromString),
      tunnelRestrictionCode: json['TunnelRestrictionCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hazardousCargos = this.hazardousCargos;
    final allHazardsRestricted = this.allHazardsRestricted;
    final axleCount = this.axleCount;
    final maxHeight = this.maxHeight;
    final maxKpraLength = this.maxKpraLength;
    final maxLength = this.maxLength;
    final maxPayloadCapacity = this.maxPayloadCapacity;
    final maxWeight = this.maxWeight;
    final maxWeightPerAxle = this.maxWeightPerAxle;
    final maxWeightPerAxleGroup = this.maxWeightPerAxleGroup;
    final maxWidth = this.maxWidth;
    final occupancy = this.occupancy;
    final restrictedTimes = this.restrictedTimes;
    final timeDependent = this.timeDependent;
    final trailerCount = this.trailerCount;
    final travelMode = this.travelMode;
    final truckRoadType = this.truckRoadType;
    final truckType = this.truckType;
    final tunnelRestrictionCode = this.tunnelRestrictionCode;
    return {
      'HazardousCargos': hazardousCargos.map((e) => e.value).toList(),
      if (allHazardsRestricted != null)
        'AllHazardsRestricted': allHazardsRestricted,
      if (axleCount != null) 'AxleCount': axleCount,
      if (maxHeight != null) 'MaxHeight': maxHeight,
      if (maxKpraLength != null) 'MaxKpraLength': maxKpraLength,
      if (maxLength != null) 'MaxLength': maxLength,
      if (maxPayloadCapacity != null) 'MaxPayloadCapacity': maxPayloadCapacity,
      if (maxWeight != null) 'MaxWeight': maxWeight,
      if (maxWeightPerAxle != null) 'MaxWeightPerAxle': maxWeightPerAxle,
      if (maxWeightPerAxleGroup != null)
        'MaxWeightPerAxleGroup': maxWeightPerAxleGroup,
      if (maxWidth != null) 'MaxWidth': maxWidth,
      if (occupancy != null) 'Occupancy': occupancy,
      if (restrictedTimes != null) 'RestrictedTimes': restrictedTimes,
      if (timeDependent != null) 'TimeDependent': timeDependent,
      if (trailerCount != null) 'TrailerCount': trailerCount,
      if (travelMode != null) 'TravelMode': travelMode,
      if (truckRoadType != null) 'TruckRoadType': truckRoadType,
      if (truckType != null) 'TruckType': truckType.value,
      if (tunnelRestrictionCode != null)
        'TunnelRestrictionCode': tunnelRestrictionCode,
    };
  }
}

/// Notice Detail that is a range.
///
/// @nodoc
class RouteNoticeDetailRange {
  /// Maximum value for the range.
  final int? max;

  /// Minimum value for the range.
  final int? min;

  RouteNoticeDetailRange({
    this.max,
    this.min,
  });

  factory RouteNoticeDetailRange.fromJson(Map<String, dynamic> json) {
    return RouteNoticeDetailRange(
      max: json['Max'] as int?,
      min: json['Min'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final max = this.max;
    final min = this.min;
    return {
      if (max != null) 'Max': max,
      if (min != null) 'Min': min,
    };
  }
}

/// The weight constraint for the route.
///
/// <b>Unit</b>: <code>kilograms</code>
///
/// @nodoc
class RouteWeightConstraint {
  /// The type of constraint.
  final RouteWeightConstraintType type;

  /// The constraint value.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int value;

  RouteWeightConstraint({
    required this.type,
    required this.value,
  });

  factory RouteWeightConstraint.fromJson(Map<String, dynamic> json) {
    return RouteWeightConstraint(
      type:
          RouteWeightConstraintType.fromString((json['Type'] as String?) ?? ''),
      value: (json['Value'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'Type': type.value,
      'Value': value,
    };
  }
}

/// Specifies the total weight for different axle group configurations. Used in
/// regions where regulations set different weight limits based on axle group
/// types.
///
/// <b>Unit</b>: <code>kilograms</code>
///
/// @nodoc
class WeightPerAxleGroup {
  /// Total weight in kilograms for quad (four adjacent) axle configurations.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? quad;

  /// Total weight in kilograms for quint (five adjacent) axle configurations.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? quint;

  /// Total weight in kilograms for single axle configurations.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? single;

  /// Total weight in kilograms for tandem (two adjacent) axle configurations.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? tandem;

  /// Total weight in kilograms for triple (three adjacent) axle configurations.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? triple;

  WeightPerAxleGroup({
    this.quad,
    this.quint,
    this.single,
    this.tandem,
    this.triple,
  });

  factory WeightPerAxleGroup.fromJson(Map<String, dynamic> json) {
    return WeightPerAxleGroup(
      quad: json['Quad'] as int?,
      quint: json['Quint'] as int?,
      single: json['Single'] as int?,
      tandem: json['Tandem'] as int?,
      triple: json['Triple'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final quad = this.quad;
    final quint = this.quint;
    final single = this.single;
    final tandem = this.tandem;
    final triple = this.triple;
    return {
      if (quad != null) 'Quad': quad,
      if (quint != null) 'Quint': quint,
      if (single != null) 'Single': single,
      if (tandem != null) 'Tandem': tandem,
      if (triple != null) 'Triple': triple,
    };
  }
}

/// @nodoc
class RouteTruckType {
  static const lightTruck = RouteTruckType._('LightTruck');
  static const straightTruck = RouteTruckType._('StraightTruck');
  static const tractor = RouteTruckType._('Tractor');

  final String value;

  const RouteTruckType._(this.value);

  static const values = [lightTruck, straightTruck, tractor];

  static RouteTruckType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTruckType._(value));

  @override
  bool operator ==(other) => other is RouteTruckType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteWeightConstraintType {
  static const current = RouteWeightConstraintType._('Current');
  static const gross = RouteWeightConstraintType._('Gross');
  static const unknown = RouteWeightConstraintType._('Unknown');

  final String value;

  const RouteWeightConstraintType._(this.value);

  static const values = [current, gross, unknown];

  static RouteWeightConstraintType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteWeightConstraintType._(value));

  @override
  bool operator ==(other) =>
      other is RouteWeightConstraintType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteHazardousCargoType {
  static const combustible = RouteHazardousCargoType._('Combustible');
  static const corrosive = RouteHazardousCargoType._('Corrosive');
  static const explosive = RouteHazardousCargoType._('Explosive');
  static const flammable = RouteHazardousCargoType._('Flammable');
  static const gas = RouteHazardousCargoType._('Gas');
  static const harmfulToWater = RouteHazardousCargoType._('HarmfulToWater');
  static const organic = RouteHazardousCargoType._('Organic');
  static const other = RouteHazardousCargoType._('Other');
  static const poison = RouteHazardousCargoType._('Poison');
  static const poisonousInhalation =
      RouteHazardousCargoType._('PoisonousInhalation');
  static const radioactive = RouteHazardousCargoType._('Radioactive');

  final String value;

  const RouteHazardousCargoType._(this.value);

  static const values = [
    combustible,
    corrosive,
    explosive,
    flammable,
    gas,
    harmfulToWater,
    organic,
    other,
    poison,
    poisonousInhalation,
    radioactive
  ];

  static RouteHazardousCargoType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteHazardousCargoType._(value));

  @override
  bool operator ==(other) =>
      other is RouteHazardousCargoType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Incidents corresponding to this leg of the route.
///
/// @nodoc
class RouteVehicleIncident {
  /// Brief readable description of the incident.
  final String? description;

  /// End timestamp of the incident.
  final String? endTime;

  /// Severity of the incident Critical - The part of the route the incident
  /// affects is unusable. Major- Major impact on the leg duration, for example
  /// stop and go Minor- Minor impact on the leg duration, for example traffic jam
  /// Low - Low on duration, for example slightly increased traffic
  final RouteVehicleIncidentSeverity? severity;

  /// Start time of the incident.
  final String? startTime;

  /// Type of the incident.
  final RouteVehicleIncidentType? type;

  RouteVehicleIncident({
    this.description,
    this.endTime,
    this.severity,
    this.startTime,
    this.type,
  });

  factory RouteVehicleIncident.fromJson(Map<String, dynamic> json) {
    return RouteVehicleIncident(
      description: json['Description'] as String?,
      endTime: json['EndTime'] as String?,
      severity: (json['Severity'] as String?)
          ?.let(RouteVehicleIncidentSeverity.fromString),
      startTime: json['StartTime'] as String?,
      type: (json['Type'] as String?)?.let(RouteVehicleIncidentType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final endTime = this.endTime;
    final severity = this.severity;
    final startTime = this.startTime;
    final type = this.type;
    return {
      if (description != null) 'Description': description,
      if (endTime != null) 'EndTime': endTime,
      if (severity != null) 'Severity': severity.value,
      if (startTime != null) 'StartTime': startTime,
      if (type != null) 'Type': type.value,
    };
  }
}

/// @nodoc
class RouteVehicleIncidentSeverity {
  static const critical = RouteVehicleIncidentSeverity._('Critical');
  static const high = RouteVehicleIncidentSeverity._('High');
  static const medium = RouteVehicleIncidentSeverity._('Medium');
  static const low = RouteVehicleIncidentSeverity._('Low');

  final String value;

  const RouteVehicleIncidentSeverity._(this.value);

  static const values = [critical, high, medium, low];

  static RouteVehicleIncidentSeverity fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteVehicleIncidentSeverity._(value));

  @override
  bool operator ==(other) =>
      other is RouteVehicleIncidentSeverity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteVehicleIncidentType {
  static const accident = RouteVehicleIncidentType._('Accident');
  static const congestion = RouteVehicleIncidentType._('Congestion');
  static const construction = RouteVehicleIncidentType._('Construction');
  static const disabledVehicle = RouteVehicleIncidentType._('DisabledVehicle');
  static const laneRestriction = RouteVehicleIncidentType._('LaneRestriction');
  static const massTransit = RouteVehicleIncidentType._('MassTransit');
  static const other = RouteVehicleIncidentType._('Other');
  static const plannedEvent = RouteVehicleIncidentType._('PlannedEvent');
  static const roadClosure = RouteVehicleIncidentType._('RoadClosure');
  static const roadHazard = RouteVehicleIncidentType._('RoadHazard');
  static const weather = RouteVehicleIncidentType._('Weather');

  final String value;

  const RouteVehicleIncidentType._(this.value);

  static const values = [
    accident,
    congestion,
    construction,
    disabledVehicle,
    laneRestriction,
    massTransit,
    other,
    plannedEvent,
    roadClosure,
    roadHazard,
    weather
  ];

  static RouteVehicleIncidentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteVehicleIncidentType._(value));

  @override
  bool operator ==(other) =>
      other is RouteVehicleIncidentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Place details corresponding to the arrival or departure.
///
/// @nodoc
class RouteVehiclePlace {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// Details of the access point.
  final RouteAccessPointDetails? accessPointDetails;

  /// The name of the place.
  final String? name;

  /// Position provided in the request.
  final List<double>? originalPosition;

  /// Options to configure matching the provided position to a side of the street.
  final RouteSideOfStreet? sideOfStreet;

  /// Details about the station.
  final RouteStationDetails? stationDetails;

  /// The type of the place.
  final RouteVehiclePlaceType? type;

  /// Index of the waypoint in the request.
  final int? waypointIndex;

  RouteVehiclePlace({
    required this.position,
    this.accessPointDetails,
    this.name,
    this.originalPosition,
    this.sideOfStreet,
    this.stationDetails,
    this.type,
    this.waypointIndex,
  });

  factory RouteVehiclePlace.fromJson(Map<String, dynamic> json) {
    return RouteVehiclePlace(
      position: ((json['Position'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      accessPointDetails: json['AccessPointDetails'] != null
          ? RouteAccessPointDetails.fromJson(
              json['AccessPointDetails'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      originalPosition: (json['OriginalPosition'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      sideOfStreet:
          (json['SideOfStreet'] as String?)?.let(RouteSideOfStreet.fromString),
      stationDetails: json['StationDetails'] != null
          ? RouteStationDetails.fromJson(
              json['StationDetails'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.let(RouteVehiclePlaceType.fromString),
      waypointIndex: json['WaypointIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final accessPointDetails = this.accessPointDetails;
    final name = this.name;
    final originalPosition = this.originalPosition;
    final sideOfStreet = this.sideOfStreet;
    final stationDetails = this.stationDetails;
    final type = this.type;
    final waypointIndex = this.waypointIndex;
    return {
      'Position': position,
      if (accessPointDetails != null) 'AccessPointDetails': accessPointDetails,
      if (name != null) 'Name': name,
      if (originalPosition != null) 'OriginalPosition': originalPosition,
      if (sideOfStreet != null) 'SideOfStreet': sideOfStreet.value,
      if (stationDetails != null) 'StationDetails': stationDetails,
      if (type != null) 'Type': type.value,
      if (waypointIndex != null) 'WaypointIndex': waypointIndex,
    };
  }
}

/// @nodoc
class RouteSideOfStreet {
  static const left = RouteSideOfStreet._('Left');
  static const right = RouteSideOfStreet._('Right');

  final String value;

  const RouteSideOfStreet._(this.value);

  static const values = [left, right];

  static RouteSideOfStreet fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteSideOfStreet._(value));

  @override
  bool operator ==(other) => other is RouteSideOfStreet && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteVehiclePlaceType {
  static const accessPoint = RouteVehiclePlaceType._('AccessPoint');
  static const dockingStation = RouteVehiclePlaceType._('DockingStation');
  static const parkingLot = RouteVehiclePlaceType._('ParkingLot');
  static const station = RouteVehiclePlaceType._('Station');

  final String value;

  const RouteVehiclePlaceType._(this.value);

  static const values = [accessPoint, dockingStation, parkingLot, station];

  static RouteVehiclePlaceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteVehiclePlaceType._(value));

  @override
  bool operator ==(other) =>
      other is RouteVehiclePlaceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Steps of a leg that must be performed after the travel portion of the leg.
///
/// @nodoc
class RouteVehicleAfterTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RouteVehicleAfterTravelStepType type;

  /// Details that are specific to a Charge step.
  ///
  /// <b>Unit</b>: <code>KwH </code>
  final RouteChargeStepDetails? chargeStepDetails;

  /// Brief description of the step in the requested language.
  /// <note>
  /// Only available when the TravelStepType is Default.
  /// </note>
  final String? instruction;

  RouteVehicleAfterTravelStep({
    required this.duration,
    required this.type,
    this.chargeStepDetails,
    this.instruction,
  });

  factory RouteVehicleAfterTravelStep.fromJson(Map<String, dynamic> json) {
    return RouteVehicleAfterTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type: RouteVehicleAfterTravelStepType.fromString(
          (json['Type'] as String?) ?? ''),
      chargeStepDetails: json['ChargeStepDetails'] != null
          ? RouteChargeStepDetails.fromJson(
              json['ChargeStepDetails'] as Map<String, dynamic>)
          : null,
      instruction: json['Instruction'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final chargeStepDetails = this.chargeStepDetails;
    final instruction = this.instruction;
    return {
      'Duration': duration,
      'Type': type.value,
      if (chargeStepDetails != null) 'ChargeStepDetails': chargeStepDetails,
      if (instruction != null) 'Instruction': instruction,
    };
  }
}

/// Details about the EV charge at the current step.
///
/// @nodoc
class RouteChargeStepDetails {
  /// Estimated vehicle battery charge before this step (in kWh).
  final double? arrivalCharge;

  /// Maximum charging power available to the vehicle.
  ///
  /// <b>Unit</b>: <code>KwH</code>
  final double? consumablePower;

  /// Details that are specific to a Charge step.
  ///
  /// <b>Unit</b>: <code>KwH</code>
  final double? desiredCharge;

  RouteChargeStepDetails({
    this.arrivalCharge,
    this.consumablePower,
    this.desiredCharge,
  });

  factory RouteChargeStepDetails.fromJson(Map<String, dynamic> json) {
    return RouteChargeStepDetails(
      arrivalCharge: json['ArrivalCharge'] as double?,
      consumablePower: json['ConsumablePower'] as double?,
      desiredCharge: json['DesiredCharge'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final arrivalCharge = this.arrivalCharge;
    final consumablePower = this.consumablePower;
    final desiredCharge = this.desiredCharge;
    return {
      if (arrivalCharge != null) 'ArrivalCharge': arrivalCharge,
      if (consumablePower != null) 'ConsumablePower': consumablePower,
      if (desiredCharge != null) 'DesiredCharge': desiredCharge,
    };
  }
}

/// @nodoc
class RouteVehicleAfterTravelStepType {
  static const park = RouteVehicleAfterTravelStepType._('Park');

  final String value;

  const RouteVehicleAfterTravelStepType._(this.value);

  static const values = [park];

  static RouteVehicleAfterTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteVehicleAfterTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RouteVehicleAfterTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details corresponding to the arrival for a leg.
///
/// Time format:<code>YYYY-MM-DDThh:mm:ss.sssZ |
/// YYYY-MM-DDThh:mm:ss.sss+hh:mm</code>
///
/// Examples:
///
/// <code>2020-04-22T17:57:24Z</code>
///
/// <code>2020-04-22T17:57:24+02:00</code>
///
/// @nodoc
class RoutePedestrianArrival {
  /// Place details corresponding to the arrival.
  final RoutePedestrianPlace place;

  /// The arrival time.
  final String? time;

  RoutePedestrianArrival({
    required this.place,
    this.time,
  });

  factory RoutePedestrianArrival.fromJson(Map<String, dynamic> json) {
    return RoutePedestrianArrival(
      place: RoutePedestrianPlace.fromJson(
          (json['Place'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      time: json['Time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    final time = this.time;
    return {
      'Place': place,
      if (time != null) 'Time': time,
    };
  }
}

/// Details corresponding to the departure for a leg.
///
/// Time format:<code>YYYY-MM-DDThh:mm:ss.sssZ |
/// YYYY-MM-DDThh:mm:ss.sss+hh:mm</code>
///
/// Examples:
///
/// <code>2020-04-22T17:57:24Z</code>
///
/// <code>2020-04-22T17:57:24+02:00</code>
///
/// @nodoc
class RoutePedestrianDeparture {
  /// Place details corresponding to the departure.
  final RoutePedestrianPlace place;

  /// The departure time.
  final String? time;

  RoutePedestrianDeparture({
    required this.place,
    this.time,
  });

  factory RoutePedestrianDeparture.fromJson(Map<String, dynamic> json) {
    return RoutePedestrianDeparture(
      place: RoutePedestrianPlace.fromJson(
          (json['Place'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      time: json['Time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    final time = this.time;
    return {
      'Place': place,
      if (time != null) 'Time': time,
    };
  }
}

/// Summarized details for the leg including before travel, travel and after
/// travel steps.
///
/// @nodoc
class RoutePedestrianSummary {
  /// Summarized details for the leg including before travel, travel and after
  /// travel steps.
  final RoutePedestrianOverviewSummary? overview;

  /// Summarized details for the leg including travel steps only. The Distance for
  /// the travel only portion of the journey is in meters
  final RoutePedestrianTravelOnlySummary? travelOnly;

  RoutePedestrianSummary({
    this.overview,
    this.travelOnly,
  });

  factory RoutePedestrianSummary.fromJson(Map<String, dynamic> json) {
    return RoutePedestrianSummary(
      overview: json['Overview'] != null
          ? RoutePedestrianOverviewSummary.fromJson(
              json['Overview'] as Map<String, dynamic>)
          : null,
      travelOnly: json['TravelOnly'] != null
          ? RoutePedestrianTravelOnlySummary.fromJson(
              json['TravelOnly'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final overview = this.overview;
    final travelOnly = this.travelOnly;
    return {
      if (overview != null) 'Overview': overview,
      if (travelOnly != null) 'TravelOnly': travelOnly,
    };
  }
}

/// Steps of a leg that must be performed during the travel portion of the leg.
///
/// @nodoc
class RoutePedestrianTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RoutePedestrianTravelStepType type;

  /// Details related to the continue step.
  final RouteContinueStepDetails? continueStepDetails;

  /// Details of the current road. See RouteRoad for details of sub-attributes.
  final RouteRoad? currentRoad;

  /// Distance of the step.
  final int? distance;

  /// Exit number of the road exit, if applicable.
  final List<LocalizedString>? exitNumber;

  /// Offset in the leg geometry corresponding to the start of this step.
  final int? geometryOffset;

  /// Brief description of the step in the requested language.
  /// <note>
  /// Only available when the TravelStepType is Default.
  /// </note>
  final String? instruction;

  /// Details that are specific to a Keep step.
  final RouteKeepStepDetails? keepStepDetails;

  /// Details of the next road. See RouteRoad for details of sub-attributes.
  final RouteRoad? nextRoad;

  /// Details that are specific to a Roundabout Enter step.
  final RouteRoundaboutEnterStepDetails? roundaboutEnterStepDetails;

  /// Details that are specific to a Roundabout Exit step.
  final RouteRoundaboutExitStepDetails? roundaboutExitStepDetails;

  /// Details that are specific to a Roundabout Pass step.
  final RouteRoundaboutPassStepDetails? roundaboutPassStepDetails;

  /// Sign post information of the action, applicable only for TurnByTurn steps.
  /// See RouteSignpost for details of sub-attributes.
  final RouteSignpost? signpost;

  /// Details that are specific to a turn step.
  final RouteTurnStepDetails? turnStepDetails;

  RoutePedestrianTravelStep({
    required this.duration,
    required this.type,
    this.continueStepDetails,
    this.currentRoad,
    this.distance,
    this.exitNumber,
    this.geometryOffset,
    this.instruction,
    this.keepStepDetails,
    this.nextRoad,
    this.roundaboutEnterStepDetails,
    this.roundaboutExitStepDetails,
    this.roundaboutPassStepDetails,
    this.signpost,
    this.turnStepDetails,
  });

  factory RoutePedestrianTravelStep.fromJson(Map<String, dynamic> json) {
    return RoutePedestrianTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type: RoutePedestrianTravelStepType.fromString(
          (json['Type'] as String?) ?? ''),
      continueStepDetails: json['ContinueStepDetails'] != null
          ? RouteContinueStepDetails.fromJson(
              json['ContinueStepDetails'] as Map<String, dynamic>)
          : null,
      currentRoad: json['CurrentRoad'] != null
          ? RouteRoad.fromJson(json['CurrentRoad'] as Map<String, dynamic>)
          : null,
      distance: json['Distance'] as int?,
      exitNumber: (json['ExitNumber'] as List?)
          ?.nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      geometryOffset: json['GeometryOffset'] as int?,
      instruction: json['Instruction'] as String?,
      keepStepDetails: json['KeepStepDetails'] != null
          ? RouteKeepStepDetails.fromJson(
              json['KeepStepDetails'] as Map<String, dynamic>)
          : null,
      nextRoad: json['NextRoad'] != null
          ? RouteRoad.fromJson(json['NextRoad'] as Map<String, dynamic>)
          : null,
      roundaboutEnterStepDetails: json['RoundaboutEnterStepDetails'] != null
          ? RouteRoundaboutEnterStepDetails.fromJson(
              json['RoundaboutEnterStepDetails'] as Map<String, dynamic>)
          : null,
      roundaboutExitStepDetails: json['RoundaboutExitStepDetails'] != null
          ? RouteRoundaboutExitStepDetails.fromJson(
              json['RoundaboutExitStepDetails'] as Map<String, dynamic>)
          : null,
      roundaboutPassStepDetails: json['RoundaboutPassStepDetails'] != null
          ? RouteRoundaboutPassStepDetails.fromJson(
              json['RoundaboutPassStepDetails'] as Map<String, dynamic>)
          : null,
      signpost: json['Signpost'] != null
          ? RouteSignpost.fromJson(json['Signpost'] as Map<String, dynamic>)
          : null,
      turnStepDetails: json['TurnStepDetails'] != null
          ? RouteTurnStepDetails.fromJson(
              json['TurnStepDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final continueStepDetails = this.continueStepDetails;
    final currentRoad = this.currentRoad;
    final distance = this.distance;
    final exitNumber = this.exitNumber;
    final geometryOffset = this.geometryOffset;
    final instruction = this.instruction;
    final keepStepDetails = this.keepStepDetails;
    final nextRoad = this.nextRoad;
    final roundaboutEnterStepDetails = this.roundaboutEnterStepDetails;
    final roundaboutExitStepDetails = this.roundaboutExitStepDetails;
    final roundaboutPassStepDetails = this.roundaboutPassStepDetails;
    final signpost = this.signpost;
    final turnStepDetails = this.turnStepDetails;
    return {
      'Duration': duration,
      'Type': type.value,
      if (continueStepDetails != null)
        'ContinueStepDetails': continueStepDetails,
      if (currentRoad != null) 'CurrentRoad': currentRoad,
      if (distance != null) 'Distance': distance,
      if (exitNumber != null) 'ExitNumber': exitNumber,
      if (geometryOffset != null) 'GeometryOffset': geometryOffset,
      if (instruction != null) 'Instruction': instruction,
      if (keepStepDetails != null) 'KeepStepDetails': keepStepDetails,
      if (nextRoad != null) 'NextRoad': nextRoad,
      if (roundaboutEnterStepDetails != null)
        'RoundaboutEnterStepDetails': roundaboutEnterStepDetails,
      if (roundaboutExitStepDetails != null)
        'RoundaboutExitStepDetails': roundaboutExitStepDetails,
      if (roundaboutPassStepDetails != null)
        'RoundaboutPassStepDetails': roundaboutPassStepDetails,
      if (signpost != null) 'Signpost': signpost,
      if (turnStepDetails != null) 'TurnStepDetails': turnStepDetails,
    };
  }
}

/// @nodoc
class RoutePedestrianTravelStepType {
  static const arrive = RoutePedestrianTravelStepType._('Arrive');
  static const $continue = RoutePedestrianTravelStepType._('Continue');
  static const depart = RoutePedestrianTravelStepType._('Depart');
  static const keep = RoutePedestrianTravelStepType._('Keep');
  static const roundaboutEnter =
      RoutePedestrianTravelStepType._('RoundaboutEnter');
  static const roundaboutExit =
      RoutePedestrianTravelStepType._('RoundaboutExit');
  static const roundaboutPass =
      RoutePedestrianTravelStepType._('RoundaboutPass');
  static const turn = RoutePedestrianTravelStepType._('Turn');

  final String value;

  const RoutePedestrianTravelStepType._(this.value);

  static const values = [
    arrive,
    $continue,
    depart,
    keep,
    roundaboutEnter,
    roundaboutExit,
    roundaboutPass,
    turn
  ];

  static RoutePedestrianTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RoutePedestrianTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RoutePedestrianTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary including duration and distance for the entire leg.
///
/// @nodoc
class RoutePedestrianOverviewSummary {
  /// Distance of the entire leg.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int distance;

  /// Duration of the entire leg.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  RoutePedestrianOverviewSummary({
    required this.distance,
    required this.duration,
  });

  factory RoutePedestrianOverviewSummary.fromJson(Map<String, dynamic> json) {
    return RoutePedestrianOverviewSummary(
      distance: (json['Distance'] as int?) ?? 0,
      duration: (json['Duration'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final duration = this.duration;
    return {
      'Distance': distance,
      'Duration': duration,
    };
  }
}

/// Summarized details for the leg including travel steps.
///
/// @nodoc
class RoutePedestrianTravelOnlySummary {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  RoutePedestrianTravelOnlySummary({
    required this.duration,
  });

  factory RoutePedestrianTravelOnlySummary.fromJson(Map<String, dynamic> json) {
    return RoutePedestrianTravelOnlySummary(
      duration: (json['Duration'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    return {
      'Duration': duration,
    };
  }
}

/// Span computed for the requested SpanAdditionalFeatures.
///
/// @nodoc
class RoutePedestrianSpan {
  /// Duration of the computed span without traffic congestion.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? bestCaseDuration;

  /// 3 letter Country code corresponding to the Span.
  final String? country;

  /// Distance of the computed span. This feature doesn't split a span, but is
  /// always computed on a span split by other properties.
  final int? distance;

  /// Duration of the computed span. This feature doesn't split a span, but is
  /// always computed on a span split by other properties.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? duration;

  /// Dynamic speed details corresponding to the span.
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final RouteSpanDynamicSpeedDetails? dynamicSpeed;

  /// A numerical value indicating the functional classification of the road
  /// segment corresponding to the span.
  ///
  /// Classification values are part of the hierarchical network that helps
  /// determine a logical and efficient route, and have the following definitions:
  /// <ol>
  /// <li>
  /// Roads that allow for high volume, maximum speed traffic movement between and
  /// through major metropolitan areas.
  /// </li>
  /// <li>
  /// Roads that are used to channel traffic to functional class 1 roads for
  /// travel between and through cities in the shortest amount of time.
  /// </li>
  /// <li>
  /// Roads that intersect functional class 2 roads and provide a high volume of
  /// traffic movement at a lower level of mobility than functional class 2 roads.
  /// </li>
  /// <li>
  /// Roads that provide for a high volume of traffic movement at moderate speeds
  /// between neighborhoods.
  /// </li>
  /// <li>
  /// Roads with volume and traffic movement below the level of any other
  /// functional class.
  /// </li> </ol>
  final int? functionalClassification;

  /// Offset in the leg geometry corresponding to the start of this span.
  final int? geometryOffset;

  /// Incidents corresponding to the span. These index into the Incidents in the
  /// parent Leg.
  final List<int>? incidents;

  /// Provides an array of names of the pedestrian span in available languages.
  final List<LocalizedString>? names;

  /// Access attributes for a pedestrian corresponding to the span.
  final List<RouteSpanPedestrianAccessAttribute>? pedestrianAccess;

  /// 2-3 letter Region code corresponding to the Span. This is either a province
  /// or a state.
  final String? region;

  /// Attributes for the road segment corresponding to the span.
  final List<RouteSpanRoadAttribute>? roadAttributes;

  /// Designated route name or number corresponding to the span.
  final List<RouteNumber>? routeNumbers;

  /// Speed limit details corresponding to the span.
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final RouteSpanSpeedLimitDetails? speedLimit;

  /// Duration of the computed span under typical traffic congestion.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? typicalDuration;

  RoutePedestrianSpan({
    this.bestCaseDuration,
    this.country,
    this.distance,
    this.duration,
    this.dynamicSpeed,
    this.functionalClassification,
    this.geometryOffset,
    this.incidents,
    this.names,
    this.pedestrianAccess,
    this.region,
    this.roadAttributes,
    this.routeNumbers,
    this.speedLimit,
    this.typicalDuration,
  });

  factory RoutePedestrianSpan.fromJson(Map<String, dynamic> json) {
    return RoutePedestrianSpan(
      bestCaseDuration: json['BestCaseDuration'] as int?,
      country: json['Country'] as String?,
      distance: json['Distance'] as int?,
      duration: json['Duration'] as int?,
      dynamicSpeed: json['DynamicSpeed'] != null
          ? RouteSpanDynamicSpeedDetails.fromJson(
              json['DynamicSpeed'] as Map<String, dynamic>)
          : null,
      functionalClassification: json['FunctionalClassification'] as int?,
      geometryOffset: json['GeometryOffset'] as int?,
      incidents:
          (json['Incidents'] as List?)?.nonNulls.map((e) => e as int).toList(),
      names: (json['Names'] as List?)
          ?.nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      pedestrianAccess: (json['PedestrianAccess'] as List?)
          ?.nonNulls
          .map((e) =>
              RouteSpanPedestrianAccessAttribute.fromString((e as String)))
          .toList(),
      region: json['Region'] as String?,
      roadAttributes: (json['RoadAttributes'] as List?)
          ?.nonNulls
          .map((e) => RouteSpanRoadAttribute.fromString((e as String)))
          .toList(),
      routeNumbers: (json['RouteNumbers'] as List?)
          ?.nonNulls
          .map((e) => RouteNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      speedLimit: json['SpeedLimit'] != null
          ? RouteSpanSpeedLimitDetails.fromJson(
              json['SpeedLimit'] as Map<String, dynamic>)
          : null,
      typicalDuration: json['TypicalDuration'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bestCaseDuration = this.bestCaseDuration;
    final country = this.country;
    final distance = this.distance;
    final duration = this.duration;
    final dynamicSpeed = this.dynamicSpeed;
    final functionalClassification = this.functionalClassification;
    final geometryOffset = this.geometryOffset;
    final incidents = this.incidents;
    final names = this.names;
    final pedestrianAccess = this.pedestrianAccess;
    final region = this.region;
    final roadAttributes = this.roadAttributes;
    final routeNumbers = this.routeNumbers;
    final speedLimit = this.speedLimit;
    final typicalDuration = this.typicalDuration;
    return {
      if (bestCaseDuration != null) 'BestCaseDuration': bestCaseDuration,
      if (country != null) 'Country': country,
      if (distance != null) 'Distance': distance,
      if (duration != null) 'Duration': duration,
      if (dynamicSpeed != null) 'DynamicSpeed': dynamicSpeed,
      if (functionalClassification != null)
        'FunctionalClassification': functionalClassification,
      if (geometryOffset != null) 'GeometryOffset': geometryOffset,
      if (incidents != null) 'Incidents': incidents,
      if (names != null) 'Names': names,
      if (pedestrianAccess != null)
        'PedestrianAccess': pedestrianAccess.map((e) => e.value).toList(),
      if (region != null) 'Region': region,
      if (roadAttributes != null)
        'RoadAttributes': roadAttributes.map((e) => e.value).toList(),
      if (routeNumbers != null) 'RouteNumbers': routeNumbers,
      if (speedLimit != null) 'SpeedLimit': speedLimit,
      if (typicalDuration != null) 'TypicalDuration': typicalDuration,
    };
  }
}

/// @nodoc
class RouteSpanPedestrianAccessAttribute {
  static const allowed = RouteSpanPedestrianAccessAttribute._('Allowed');
  static const indoors = RouteSpanPedestrianAccessAttribute._('Indoors');
  static const noThroughTraffic =
      RouteSpanPedestrianAccessAttribute._('NoThroughTraffic');
  static const park = RouteSpanPedestrianAccessAttribute._('Park');
  static const stairs = RouteSpanPedestrianAccessAttribute._('Stairs');
  static const tollRoad = RouteSpanPedestrianAccessAttribute._('TollRoad');

  final String value;

  const RouteSpanPedestrianAccessAttribute._(this.value);

  static const values = [
    allowed,
    indoors,
    noThroughTraffic,
    park,
    stairs,
    tollRoad
  ];

  static RouteSpanPedestrianAccessAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteSpanPedestrianAccessAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RouteSpanPedestrianAccessAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Notices are additional information returned that indicate issues that
/// occurred during route calculation.
///
/// @nodoc
class RoutePedestrianNotice {
  /// Code corresponding to the issue.
  final RoutePedestrianNoticeCode code;

  /// Impact corresponding to the issue. While Low impact notices can be safely
  /// ignored, High impact notices must be evaluated further to determine the
  /// impact.
  final RouteNoticeImpact? impact;

  RoutePedestrianNotice({
    required this.code,
    this.impact,
  });

  factory RoutePedestrianNotice.fromJson(Map<String, dynamic> json) {
    return RoutePedestrianNotice(
      code:
          RoutePedestrianNoticeCode.fromString((json['Code'] as String?) ?? ''),
      impact: (json['Impact'] as String?)?.let(RouteNoticeImpact.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final impact = this.impact;
    return {
      'Code': code.value,
      if (impact != null) 'Impact': impact.value,
    };
  }
}

/// @nodoc
class RoutePedestrianNoticeCode {
  static const accuratePolylineUnavailable =
      RoutePedestrianNoticeCode._('AccuratePolylineUnavailable');
  static const other = RoutePedestrianNoticeCode._('Other');
  static const violatedAvoidDirtRoad =
      RoutePedestrianNoticeCode._('ViolatedAvoidDirtRoad');
  static const violatedAvoidTunnel =
      RoutePedestrianNoticeCode._('ViolatedAvoidTunnel');
  static const violatedPedestrianOption =
      RoutePedestrianNoticeCode._('ViolatedPedestrianOption');
  static const violatedAvoidAreas =
      RoutePedestrianNoticeCode._('ViolatedAvoidAreas');

  final String value;

  const RoutePedestrianNoticeCode._(this.value);

  static const values = [
    accuratePolylineUnavailable,
    other,
    violatedAvoidDirtRoad,
    violatedAvoidTunnel,
    violatedPedestrianOption,
    violatedAvoidAreas
  ];

  static RoutePedestrianNoticeCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RoutePedestrianNoticeCode._(value));

  @override
  bool operator ==(other) =>
      other is RoutePedestrianNoticeCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Place details corresponding to the arrival or departure.
///
/// @nodoc
class RoutePedestrianPlace {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// Details of the access point.
  final RouteAccessPointDetails? accessPointDetails;

  /// The name of the place.
  final String? name;

  /// Position provided in the request.
  final List<double>? originalPosition;

  /// Options to configure matching the provided position to a side of the street.
  final RouteSideOfStreet? sideOfStreet;

  /// Details about the station.
  final RouteStationDetails? stationDetails;

  /// The type of the place.
  final RoutePedestrianPlaceType? type;

  /// Index of the waypoint in the request.
  final int? waypointIndex;

  RoutePedestrianPlace({
    required this.position,
    this.accessPointDetails,
    this.name,
    this.originalPosition,
    this.sideOfStreet,
    this.stationDetails,
    this.type,
    this.waypointIndex,
  });

  factory RoutePedestrianPlace.fromJson(Map<String, dynamic> json) {
    return RoutePedestrianPlace(
      position: ((json['Position'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      accessPointDetails: json['AccessPointDetails'] != null
          ? RouteAccessPointDetails.fromJson(
              json['AccessPointDetails'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      originalPosition: (json['OriginalPosition'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      sideOfStreet:
          (json['SideOfStreet'] as String?)?.let(RouteSideOfStreet.fromString),
      stationDetails: json['StationDetails'] != null
          ? RouteStationDetails.fromJson(
              json['StationDetails'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.let(RoutePedestrianPlaceType.fromString),
      waypointIndex: json['WaypointIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final accessPointDetails = this.accessPointDetails;
    final name = this.name;
    final originalPosition = this.originalPosition;
    final sideOfStreet = this.sideOfStreet;
    final stationDetails = this.stationDetails;
    final type = this.type;
    final waypointIndex = this.waypointIndex;
    return {
      'Position': position,
      if (accessPointDetails != null) 'AccessPointDetails': accessPointDetails,
      if (name != null) 'Name': name,
      if (originalPosition != null) 'OriginalPosition': originalPosition,
      if (sideOfStreet != null) 'SideOfStreet': sideOfStreet.value,
      if (stationDetails != null) 'StationDetails': stationDetails,
      if (type != null) 'Type': type.value,
      if (waypointIndex != null) 'WaypointIndex': waypointIndex,
    };
  }
}

/// @nodoc
class RoutePedestrianPlaceType {
  static const accessPoint = RoutePedestrianPlaceType._('AccessPoint');
  static const dockingStation = RoutePedestrianPlaceType._('DockingStation');
  static const parkingLot = RoutePedestrianPlaceType._('ParkingLot');
  static const station = RoutePedestrianPlaceType._('Station');

  final String value;

  const RoutePedestrianPlaceType._(this.value);

  static const values = [accessPoint, dockingStation, parkingLot, station];

  static RoutePedestrianPlaceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RoutePedestrianPlaceType._(value));

  @override
  bool operator ==(other) =>
      other is RoutePedestrianPlaceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Steps of a leg that must be performed after the travel portion of the leg.
///
/// @nodoc
class RoutePedestrianAfterTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RoutePedestrianAfterTravelStepType type;

  /// Brief description of the step in the requested language.
  /// <note>
  /// Only available when the TravelStepType is Default.
  /// </note>
  final String? instruction;

  RoutePedestrianAfterTravelStep({
    required this.duration,
    required this.type,
    this.instruction,
  });

  factory RoutePedestrianAfterTravelStep.fromJson(Map<String, dynamic> json) {
    return RoutePedestrianAfterTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type: RoutePedestrianAfterTravelStepType.fromString(
          (json['Type'] as String?) ?? ''),
      instruction: json['Instruction'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final instruction = this.instruction;
    return {
      'Duration': duration,
      'Type': type.value,
      if (instruction != null) 'Instruction': instruction,
    };
  }
}

/// @nodoc
class RoutePedestrianAfterTravelStepType {
  static const wait = RoutePedestrianAfterTravelStepType._('Wait');

  final String value;

  const RoutePedestrianAfterTravelStepType._(this.value);

  static const values = [wait];

  static RoutePedestrianAfterTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RoutePedestrianAfterTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RoutePedestrianAfterTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details corresponding to the arrival for the leg.
///
/// @nodoc
class RouteFerryArrival {
  /// Place details corresponding to the arrival.
  final RouteFerryPlace place;

  /// The arrival time.
  final String? time;

  RouteFerryArrival({
    required this.place,
    this.time,
  });

  factory RouteFerryArrival.fromJson(Map<String, dynamic> json) {
    return RouteFerryArrival(
      place: RouteFerryPlace.fromJson(
          (json['Place'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      time: json['Time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    final time = this.time;
    return {
      'Place': place,
      if (time != null) 'Time': time,
    };
  }
}

/// Details corresponding to the departure for the leg.
///
/// @nodoc
class RouteFerryDeparture {
  /// Place details corresponding to the departure.
  final RouteFerryPlace place;

  /// The departure time.
  final String? time;

  RouteFerryDeparture({
    required this.place,
    this.time,
  });

  factory RouteFerryDeparture.fromJson(Map<String, dynamic> json) {
    return RouteFerryDeparture(
      place: RouteFerryPlace.fromJson(
          (json['Place'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      time: json['Time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    final time = this.time;
    return {
      'Place': place,
      if (time != null) 'Time': time,
    };
  }
}

/// Summarized details for the leg including travel steps only. The Distance for
/// the travel only portion of the journey is the same as the Distance within
/// the Overview summary.
///
/// @nodoc
class RouteFerrySummary {
  /// Summarized details for the leg including before travel, travel and after
  /// travel steps.
  final RouteFerryOverviewSummary? overview;

  /// Summarized details for the leg including travel steps only. The Distance for
  /// the travel only portion of the journey is in meters
  final RouteFerryTravelOnlySummary? travelOnly;

  RouteFerrySummary({
    this.overview,
    this.travelOnly,
  });

  factory RouteFerrySummary.fromJson(Map<String, dynamic> json) {
    return RouteFerrySummary(
      overview: json['Overview'] != null
          ? RouteFerryOverviewSummary.fromJson(
              json['Overview'] as Map<String, dynamic>)
          : null,
      travelOnly: json['TravelOnly'] != null
          ? RouteFerryTravelOnlySummary.fromJson(
              json['TravelOnly'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final overview = this.overview;
    final travelOnly = this.travelOnly;
    return {
      if (overview != null) 'Overview': overview,
      if (travelOnly != null) 'TravelOnly': travelOnly,
    };
  }
}

/// Steps of a leg that must be performed during the travel portion of the leg.
///
/// @nodoc
class RouteFerryTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RouteFerryTravelStepType type;

  /// Distance of the step.
  final int? distance;

  /// Offset in the leg geometry corresponding to the start of this step.
  final int? geometryOffset;

  /// Brief description of the step in the requested language.
  /// <note>
  /// Only available when the TravelStepType is Default.
  /// </note>
  final String? instruction;

  RouteFerryTravelStep({
    required this.duration,
    required this.type,
    this.distance,
    this.geometryOffset,
    this.instruction,
  });

  factory RouteFerryTravelStep.fromJson(Map<String, dynamic> json) {
    return RouteFerryTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type:
          RouteFerryTravelStepType.fromString((json['Type'] as String?) ?? ''),
      distance: json['Distance'] as int?,
      geometryOffset: json['GeometryOffset'] as int?,
      instruction: json['Instruction'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final distance = this.distance;
    final geometryOffset = this.geometryOffset;
    final instruction = this.instruction;
    return {
      'Duration': duration,
      'Type': type.value,
      if (distance != null) 'Distance': distance,
      if (geometryOffset != null) 'GeometryOffset': geometryOffset,
      if (instruction != null) 'Instruction': instruction,
    };
  }
}

/// @nodoc
class RouteFerryTravelStepType {
  static const depart = RouteFerryTravelStepType._('Depart');
  static const $continue = RouteFerryTravelStepType._('Continue');
  static const arrive = RouteFerryTravelStepType._('Arrive');

  final String value;

  const RouteFerryTravelStepType._(this.value);

  static const values = [depart, $continue, arrive];

  static RouteFerryTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteFerryTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RouteFerryTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary including duration and distance for the entire leg.
///
/// @nodoc
class RouteFerryOverviewSummary {
  /// Distance of the entire leg.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int distance;

  /// Duration of the entire leg.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  RouteFerryOverviewSummary({
    required this.distance,
    required this.duration,
  });

  factory RouteFerryOverviewSummary.fromJson(Map<String, dynamic> json) {
    return RouteFerryOverviewSummary(
      distance: (json['Distance'] as int?) ?? 0,
      duration: (json['Duration'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final duration = this.duration;
    return {
      'Distance': distance,
      'Duration': duration,
    };
  }
}

/// Summarized details for the leg including travel steps only. The Distance for
/// the travel only portion of the journey is the same as the Distance within
/// the Overview summary.
///
/// @nodoc
class RouteFerryTravelOnlySummary {
  /// Total duration in free flowing traffic, which is the best case or shortest
  /// duration possible to cover the leg.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  RouteFerryTravelOnlySummary({
    required this.duration,
  });

  factory RouteFerryTravelOnlySummary.fromJson(Map<String, dynamic> json) {
    return RouteFerryTravelOnlySummary(
      duration: (json['Duration'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    return {
      'Duration': duration,
    };
  }
}

/// Span computed for the requested SpanAdditionalFeatures.
///
/// @nodoc
class RouteFerrySpan {
  /// 3 letter Country code corresponding to the Span.
  final String? country;

  /// Distance of the computed span. This feature doesn't split a span, but is
  /// always computed on a span split by other properties.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int? distance;

  /// Duration of the computed span. This feature doesn't split a span, but is
  /// always computed on a span split by other properties.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? duration;

  /// Offset in the leg geometry corresponding to the start of this span.
  final int? geometryOffset;

  /// Names of the ferry span in available languages.
  final List<LocalizedString>? names;

  /// 2-3 letter Region code corresponding to the Span. This is either a province
  /// or a state.
  final String? region;

  RouteFerrySpan({
    this.country,
    this.distance,
    this.duration,
    this.geometryOffset,
    this.names,
    this.region,
  });

  factory RouteFerrySpan.fromJson(Map<String, dynamic> json) {
    return RouteFerrySpan(
      country: json['Country'] as String?,
      distance: json['Distance'] as int?,
      duration: json['Duration'] as int?,
      geometryOffset: json['GeometryOffset'] as int?,
      names: (json['Names'] as List?)
          ?.nonNulls
          .map((e) => LocalizedString.fromJson(e as Map<String, dynamic>))
          .toList(),
      region: json['Region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final country = this.country;
    final distance = this.distance;
    final duration = this.duration;
    final geometryOffset = this.geometryOffset;
    final names = this.names;
    final region = this.region;
    return {
      if (country != null) 'Country': country,
      if (distance != null) 'Distance': distance,
      if (duration != null) 'Duration': duration,
      if (geometryOffset != null) 'GeometryOffset': geometryOffset,
      if (names != null) 'Names': names,
      if (region != null) 'Region': region,
    };
  }
}

/// Notices are additional information returned that indicate issues that
/// occurred during route calculation.
///
/// @nodoc
class RouteFerryNotice {
  /// Code corresponding to the issue.
  final RouteFerryNoticeCode code;

  /// Impact corresponding to the issue. While Low impact notices can be safely
  /// ignored, High impact notices must be evaluated further to determine the
  /// impact.
  final RouteNoticeImpact? impact;

  RouteFerryNotice({
    required this.code,
    this.impact,
  });

  factory RouteFerryNotice.fromJson(Map<String, dynamic> json) {
    return RouteFerryNotice(
      code: RouteFerryNoticeCode.fromString((json['Code'] as String?) ?? ''),
      impact: (json['Impact'] as String?)?.let(RouteNoticeImpact.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final impact = this.impact;
    return {
      'Code': code.value,
      if (impact != null) 'Impact': impact.value,
    };
  }
}

/// @nodoc
class RouteFerryNoticeCode {
  static const accuratePolylineUnavailable =
      RouteFerryNoticeCode._('AccuratePolylineUnavailable');
  static const noSchedule = RouteFerryNoticeCode._('NoSchedule');
  static const other = RouteFerryNoticeCode._('Other');
  static const violatedAvoidFerry =
      RouteFerryNoticeCode._('ViolatedAvoidFerry');
  static const violatedAvoidRailFerry =
      RouteFerryNoticeCode._('ViolatedAvoidRailFerry');
  static const seasonalClosure = RouteFerryNoticeCode._('SeasonalClosure');
  static const potentialViolatedVehicleRestrictionUsage =
      RouteFerryNoticeCode._('PotentialViolatedVehicleRestrictionUsage');
  static const violatedAvoidAreas =
      RouteFerryNoticeCode._('ViolatedAvoidAreas');
  static const violatedVehicleRestriction =
      RouteFerryNoticeCode._('ViolatedVehicleRestriction');

  final String value;

  const RouteFerryNoticeCode._(this.value);

  static const values = [
    accuratePolylineUnavailable,
    noSchedule,
    other,
    violatedAvoidFerry,
    violatedAvoidRailFerry,
    seasonalClosure,
    potentialViolatedVehicleRestrictionUsage,
    violatedAvoidAreas,
    violatedVehicleRestriction
  ];

  static RouteFerryNoticeCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteFerryNoticeCode._(value));

  @override
  bool operator ==(other) =>
      other is RouteFerryNoticeCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Position provided in the request.
///
/// @nodoc
class RouteFerryPlace {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// The name of the place.
  final String? name;

  /// Position provided in the request.
  final List<double>? originalPosition;

  /// Index of the waypoint in the request.
  final int? waypointIndex;

  RouteFerryPlace({
    required this.position,
    this.name,
    this.originalPosition,
    this.waypointIndex,
  });

  factory RouteFerryPlace.fromJson(Map<String, dynamic> json) {
    return RouteFerryPlace(
      position: ((json['Position'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      name: json['Name'] as String?,
      originalPosition: (json['OriginalPosition'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      waypointIndex: json['WaypointIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final name = this.name;
    final originalPosition = this.originalPosition;
    final waypointIndex = this.waypointIndex;
    return {
      'Position': position,
      if (name != null) 'Name': name,
      if (originalPosition != null) 'OriginalPosition': originalPosition,
      if (waypointIndex != null) 'WaypointIndex': waypointIndex,
    };
  }
}

/// Steps of a leg that must be performed before the travel portion of the leg.
///
/// @nodoc
class RouteFerryBeforeTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RouteFerryBeforeTravelStepType type;

  /// Brief description of the step in the requested language.
  /// <note>
  /// Only available when the TravelStepType is Default.
  /// </note>
  final String? instruction;

  RouteFerryBeforeTravelStep({
    required this.duration,
    required this.type,
    this.instruction,
  });

  factory RouteFerryBeforeTravelStep.fromJson(Map<String, dynamic> json) {
    return RouteFerryBeforeTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type: RouteFerryBeforeTravelStepType.fromString(
          (json['Type'] as String?) ?? ''),
      instruction: json['Instruction'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final instruction = this.instruction;
    return {
      'Duration': duration,
      'Type': type.value,
      if (instruction != null) 'Instruction': instruction,
    };
  }
}

/// @nodoc
class RouteFerryBeforeTravelStepType {
  static const board = RouteFerryBeforeTravelStepType._('Board');

  final String value;

  const RouteFerryBeforeTravelStepType._(this.value);

  static const values = [board];

  static RouteFerryBeforeTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteFerryBeforeTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RouteFerryBeforeTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Steps of a leg that must be performed after the travel portion of the leg.
///
/// @nodoc
class RouteFerryAfterTravelStep {
  /// Duration of the step.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Type of the step.
  final RouteFerryAfterTravelStepType type;

  /// Brief description of the step in the requested language.
  /// <note>
  /// Only available when the TravelStepType is Default.
  /// </note>
  final String? instruction;

  RouteFerryAfterTravelStep({
    required this.duration,
    required this.type,
    this.instruction,
  });

  factory RouteFerryAfterTravelStep.fromJson(Map<String, dynamic> json) {
    return RouteFerryAfterTravelStep(
      duration: (json['Duration'] as int?) ?? 0,
      type: RouteFerryAfterTravelStepType.fromString(
          (json['Type'] as String?) ?? ''),
      instruction: json['Instruction'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final type = this.type;
    final instruction = this.instruction;
    return {
      'Duration': duration,
      'Type': type.value,
      if (instruction != null) 'Instruction': instruction,
    };
  }
}

/// @nodoc
class RouteFerryAfterTravelStepType {
  static const deboard = RouteFerryAfterTravelStepType._('Deboard');

  final String value;

  const RouteFerryAfterTravelStepType._(this.value);

  static const values = [deboard];

  static RouteFerryAfterTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteFerryAfterTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RouteFerryAfterTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Notices are additional information returned that indicate issues that
/// occurred during route calculation.
///
/// @nodoc
class RouteResponseNotice {
  /// Code corresponding to the issue.
  final RouteResponseNoticeCode code;

  /// Impact corresponding to the issue. While Low impact notices can be safely
  /// ignored, High impact notices must be evaluated further to determine the
  /// impact.
  final RouteNoticeImpact? impact;

  RouteResponseNotice({
    required this.code,
    this.impact,
  });

  factory RouteResponseNotice.fromJson(Map<String, dynamic> json) {
    return RouteResponseNotice(
      code: RouteResponseNoticeCode.fromString((json['Code'] as String?) ?? ''),
      impact: (json['Impact'] as String?)?.let(RouteNoticeImpact.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final impact = this.impact;
    return {
      'Code': code.value,
      if (impact != null) 'Impact': impact.value,
    };
  }
}

/// @nodoc
class RouteResponseNoticeCode {
  static const mainLanguageNotFound =
      RouteResponseNoticeCode._('MainLanguageNotFound');
  static const other = RouteResponseNoticeCode._('Other');
  static const travelTimeExceedsDriverWorkHours =
      RouteResponseNoticeCode._('TravelTimeExceedsDriverWorkHours');
  static const transitDataUnavailable =
      RouteResponseNoticeCode._('TransitDataUnavailable');
  static const transitRouteUnavailable =
      RouteResponseNoticeCode._('TransitRouteUnavailable');
  static const noTransitStationsFound =
      RouteResponseNoticeCode._('NoTransitStationsFound');

  final String value;

  const RouteResponseNoticeCode._(this.value);

  static const values = [
    mainLanguageNotFound,
    other,
    travelTimeExceedsDriverWorkHours,
    transitDataUnavailable,
    transitRouteUnavailable,
    noTransitStationsFound
  ];

  static RouteResponseNoticeCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteResponseNoticeCode._(value));

  @override
  bool operator ==(other) =>
      other is RouteResponseNoticeCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Features that are allowed while calculating a route.
///
/// @nodoc
class RouteAllowOptions {
  /// Allow Hot (High Occupancy Toll) lanes while calculating the route.
  ///
  /// Default value: <code>false</code>
  final bool? hot;

  /// Allow Hov (High Occupancy vehicle) lanes while calculating the route.
  ///
  /// Default value: <code>false</code>
  final bool? hov;

  RouteAllowOptions({
    this.hot,
    this.hov,
  });

  Map<String, dynamic> toJson() {
    final hot = this.hot;
    final hov = this.hov;
    return {
      if (hot != null) 'Hot': hot,
      if (hov != null) 'Hov': hov,
    };
  }
}

/// Specifies options for areas to avoid when calculating the route. This is a
/// best-effort avoidance setting, meaning the router will try to honor the
/// avoidance preferences but may still include restricted areas if no feasible
/// alternative route exists. If avoidance options are not followed, the
/// response will indicate that the avoidance criteria were violated.
///
/// @nodoc
class RouteAvoidanceOptions {
  /// Areas to be avoided. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<RouteAvoidanceArea>? areas;

  /// Avoid car-shuttle-trains while calculating the route. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final bool? carShuttleTrains;

  /// Avoid controlled access highways while calculating the route.
  final bool? controlledAccessHighways;

  /// Avoid dirt roads while calculating the route. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final bool? dirtRoads;

  /// Avoid ferries while calculating the route.
  final bool? ferries;

  /// Avoid roads that have seasonal closure while calculating the route. Not
  /// supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final bool? seasonalClosure;

  /// Avoids roads where the specified toll transponders are the only mode of
  /// payment.
  final bool? tollRoads;

  /// Avoids roads where the specified toll transponders are the only mode of
  /// payment. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final bool? tollTransponders;

  /// Truck road type identifiers. <code>BK1</code> through <code>BK4</code> apply
  /// only to Sweden. <code>A2,A4,B2,B4,C,D,ET2,ET4</code> apply only to Mexico.
  /// Not supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  /// <note>
  /// There are currently no other supported values as of 26th April 2024.
  /// </note>
  final List<String>? truckRoadTypes;

  /// Avoid tunnels while calculating the route. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final bool? tunnels;

  /// Avoid U-turns for calculation on highways and motorways. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final bool? uTurns;

  /// Zone categories to be avoided. Not supported in <code>ap-southeast-1</code>
  /// and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<RouteAvoidanceZoneCategory>? zoneCategories;

  RouteAvoidanceOptions({
    this.areas,
    this.carShuttleTrains,
    this.controlledAccessHighways,
    this.dirtRoads,
    this.ferries,
    this.seasonalClosure,
    this.tollRoads,
    this.tollTransponders,
    this.truckRoadTypes,
    this.tunnels,
    this.uTurns,
    this.zoneCategories,
  });

  Map<String, dynamic> toJson() {
    final areas = this.areas;
    final carShuttleTrains = this.carShuttleTrains;
    final controlledAccessHighways = this.controlledAccessHighways;
    final dirtRoads = this.dirtRoads;
    final ferries = this.ferries;
    final seasonalClosure = this.seasonalClosure;
    final tollRoads = this.tollRoads;
    final tollTransponders = this.tollTransponders;
    final truckRoadTypes = this.truckRoadTypes;
    final tunnels = this.tunnels;
    final uTurns = this.uTurns;
    final zoneCategories = this.zoneCategories;
    return {
      if (areas != null) 'Areas': areas,
      if (carShuttleTrains != null) 'CarShuttleTrains': carShuttleTrains,
      if (controlledAccessHighways != null)
        'ControlledAccessHighways': controlledAccessHighways,
      if (dirtRoads != null) 'DirtRoads': dirtRoads,
      if (ferries != null) 'Ferries': ferries,
      if (seasonalClosure != null) 'SeasonalClosure': seasonalClosure,
      if (tollRoads != null) 'TollRoads': tollRoads,
      if (tollTransponders != null) 'TollTransponders': tollTransponders,
      if (truckRoadTypes != null) 'TruckRoadTypes': truckRoadTypes,
      if (tunnels != null) 'Tunnels': tunnels,
      if (uTurns != null) 'UTurns': uTurns,
      if (zoneCategories != null) 'ZoneCategories': zoneCategories,
    };
  }
}

/// Options related to the destination.
///
/// @nodoc
class RouteDestinationOptions {
  /// The distance in meters from the destination point within which certain
  /// routing actions (such as U-turns or left turns across traffic) are
  /// restricted. This helps generate more practical routes by avoiding
  /// potentially dangerous maneuvers near the endpoint.
  final int? avoidActionsForDistance;

  /// Avoid U-turns for calculation on highways and motorways.
  final bool? avoidUTurns;

  /// GPS Heading at the position.
  final double? heading;

  /// Options to configure matching the provided position to the road network.
  final RouteMatchingOptions? matching;

  /// Options to configure matching the provided position to a side of the street.
  final RouteSideOfStreetOptions? sideOfStreet;

  /// Duration of the stop.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? stopDuration;

  RouteDestinationOptions({
    this.avoidActionsForDistance,
    this.avoidUTurns,
    this.heading,
    this.matching,
    this.sideOfStreet,
    this.stopDuration,
  });

  Map<String, dynamic> toJson() {
    final avoidActionsForDistance = this.avoidActionsForDistance;
    final avoidUTurns = this.avoidUTurns;
    final heading = this.heading;
    final matching = this.matching;
    final sideOfStreet = this.sideOfStreet;
    final stopDuration = this.stopDuration;
    return {
      if (avoidActionsForDistance != null)
        'AvoidActionsForDistance': avoidActionsForDistance,
      if (avoidUTurns != null) 'AvoidUTurns': avoidUTurns,
      if (heading != null) 'Heading': heading,
      if (matching != null) 'Matching': matching,
      if (sideOfStreet != null) 'SideOfStreet': sideOfStreet,
      if (stopDuration != null) 'StopDuration': stopDuration,
    };
  }
}

/// Driver related options.
///
/// @nodoc
class RouteDriverOptions {
  /// Driver work-rest schedule. Stops are added to fulfil the provided rest
  /// schedule.
  final List<RouteDriverScheduleInterval>? schedule;

  RouteDriverOptions({
    this.schedule,
  });

  Map<String, dynamic> toJson() {
    final schedule = this.schedule;
    return {
      if (schedule != null) 'Schedule': schedule,
    };
  }
}

/// Specifies strict exclusion options for the route calculation. This setting
/// mandates that the router will avoid any routes that include the specified
/// options, rather than merely attempting to minimize them.
///
/// @nodoc
class RouteExclusionOptions {
  /// List of countries to be avoided defined by two-letter or three-letter
  /// country codes.
  final List<String> countries;

  RouteExclusionOptions({
    required this.countries,
  });

  Map<String, dynamic> toJson() {
    final countries = this.countries;
    return {
      'Countries': countries,
    };
  }
}

/// @nodoc
class MeasurementSystem {
  static const metric = MeasurementSystem._('Metric');
  static const imperial = MeasurementSystem._('Imperial');

  final String value;

  const MeasurementSystem._(this.value);

  static const values = [metric, imperial];

  static MeasurementSystem fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MeasurementSystem._(value));

  @override
  bool operator ==(other) => other is MeasurementSystem && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RoutingObjective {
  static const fastestRoute = RoutingObjective._('FastestRoute');
  static const shortestRoute = RoutingObjective._('ShortestRoute');

  final String value;

  const RoutingObjective._(this.value);

  static const values = [fastestRoute, shortestRoute];

  static RoutingObjective fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RoutingObjective._(value));

  @override
  bool operator ==(other) => other is RoutingObjective && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Origin related options.
///
/// @nodoc
class RouteOriginOptions {
  /// Avoids actions for the provided distance. This is typically to consider for
  /// users in moving vehicles who may not have sufficient time to make an action
  /// at an origin or a destination.
  final int? avoidActionsForDistance;

  /// Avoid U-turns for calculation on highways and motorways.
  final bool? avoidUTurns;

  /// GPS Heading at the position.
  final double? heading;

  /// Options to configure matching the provided position to the road network.
  final RouteMatchingOptions? matching;

  /// Options to configure matching the provided position to a side of the street.
  final RouteSideOfStreetOptions? sideOfStreet;

  RouteOriginOptions({
    this.avoidActionsForDistance,
    this.avoidUTurns,
    this.heading,
    this.matching,
    this.sideOfStreet,
  });

  Map<String, dynamic> toJson() {
    final avoidActionsForDistance = this.avoidActionsForDistance;
    final avoidUTurns = this.avoidUTurns;
    final heading = this.heading;
    final matching = this.matching;
    final sideOfStreet = this.sideOfStreet;
    return {
      if (avoidActionsForDistance != null)
        'AvoidActionsForDistance': avoidActionsForDistance,
      if (avoidUTurns != null) 'AvoidUTurns': avoidUTurns,
      if (heading != null) 'Heading': heading,
      if (matching != null) 'Matching': matching,
      if (sideOfStreet != null) 'SideOfStreet': sideOfStreet,
    };
  }
}

/// Options related to Tolls on a route.
///
/// @nodoc
class RouteTollOptions {
  /// Specifies if the user has valid transponder with access to all toll systems.
  /// This impacts toll calculation, and if true the price with transponders is
  /// used.
  final bool? allTransponders;

  /// Specifies if the user has valid vignettes with access for all toll roads. If
  /// a user has a vignette for a toll road, then toll cost for that road is
  /// omitted since no further payment is necessary.
  final bool? allVignettes;

  /// Currency code corresponding to the price. This is the same as Currency
  /// specified in the request.
  final String? currency;

  /// Emission type of the vehicle for toll cost calculation.
  ///
  /// <b>Valid values</b>: <code>Euro1, Euro2, Euro3, Euro4, Euro5, Euro6,
  /// EuroEev</code>
  final RouteEmissionType? emissionType;

  /// Vehicle category for toll cost calculation.
  final RouteTollVehicleCategory? vehicleCategory;

  RouteTollOptions({
    this.allTransponders,
    this.allVignettes,
    this.currency,
    this.emissionType,
    this.vehicleCategory,
  });

  Map<String, dynamic> toJson() {
    final allTransponders = this.allTransponders;
    final allVignettes = this.allVignettes;
    final currency = this.currency;
    final emissionType = this.emissionType;
    final vehicleCategory = this.vehicleCategory;
    return {
      if (allTransponders != null) 'AllTransponders': allTransponders,
      if (allVignettes != null) 'AllVignettes': allVignettes,
      if (currency != null) 'Currency': currency,
      if (emissionType != null) 'EmissionType': emissionType,
      if (vehicleCategory != null) 'VehicleCategory': vehicleCategory.value,
    };
  }
}

/// Traffic options for the route.
///
/// @nodoc
class RouteTrafficOptions {
  /// Duration for which flow traffic is considered valid. For this period, the
  /// flow traffic is used over historical traffic data. Flow traffic refers to
  /// congestion, which changes very quickly. Duration in seconds for which flow
  /// traffic event would be considered valid. While flow traffic event is valid
  /// it will be used over the historical traffic data.
  final int? flowEventThresholdOverride;

  /// Specifies how traffic data should be used when calculating routes.
  ///
  /// Default Value: <code>UseTrafficData</code>
  /// <note>
  /// Traffic data usage depends on the time parameters in your route request:
  ///
  /// <ul>
  /// <li>
  /// When <code>Usage</code> is set to <code>UseTrafficData</code>:
  ///
  /// <ul>
  /// <li>
  /// If <code>DepartNow</code> is set to <code>true</code>, or if you specify
  /// <code>DepartureTime</code> or <code>ArrivalTime</code>, then all traffic
  /// data is considered (including live traffic and closures).
  /// </li>
  /// <li>
  /// If <code>DepartNow</code>, <code>DepartureTime</code>, and
  /// <code>ArrivalTime</code> are all unspecified, then only long-term closures
  /// are considered, regardless of this setting.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// When <code>Usage</code> is set to <code>IgnoreTrafficData</code>, then all
  /// traffic data is ignored regardless of the time parameters in your route
  /// request.
  /// </li>
  /// </ul> </note>
  final TrafficUsage? usage;

  RouteTrafficOptions({
    this.flowEventThresholdOverride,
    this.usage,
  });

  Map<String, dynamic> toJson() {
    final flowEventThresholdOverride = this.flowEventThresholdOverride;
    final usage = this.usage;
    return {
      if (flowEventThresholdOverride != null)
        'FlowEventThresholdOverride': flowEventThresholdOverride,
      if (usage != null) 'Usage': usage.value,
    };
  }
}

/// @nodoc
class RouteTravelMode {
  static const car = RouteTravelMode._('Car');
  static const pedestrian = RouteTravelMode._('Pedestrian');
  static const scooter = RouteTravelMode._('Scooter');
  static const truck = RouteTravelMode._('Truck');
  static const intermodal = RouteTravelMode._('Intermodal');
  static const transit = RouteTravelMode._('Transit');

  final String value;

  const RouteTravelMode._(this.value);

  static const values = [car, pedestrian, scooter, truck, intermodal, transit];

  static RouteTravelMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTravelMode._(value));

  @override
  bool operator ==(other) => other is RouteTravelMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Travel mode related options for the provided travel mode.
///
/// @nodoc
class RouteTravelModeOptions {
  /// Travel mode options when the provided travel mode is <code>Car</code>.
  final RouteCarOptions? car;

  /// Travel mode options when the provided travel mode is
  /// <code>Intermodal</code>.
  /// <note>
  /// Not supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  /// </note>
  final RouteIntermodalOptions? intermodal;

  /// Travel mode options when the provided travel mode is
  /// <code>Pedestrian</code>.
  final RoutePedestrianOptions? pedestrian;

  /// Travel mode options when the provided travel mode is <code>Scooter</code>.
  /// <note>
  /// When travel mode is set to <code>Scooter</code>, then the avoidance option
  /// <code>ControlledAccessHighways</code> defaults to <code>true</code>.
  /// </note>
  final RouteScooterOptions? scooter;

  /// Travel mode options when the provided travel mode is <code>Transit</code>.
  /// <note>
  /// Not supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  /// </note>
  final RouteTransitOptions? transit;

  /// Travel mode options when the provided travel mode is <code>Truck</code>.
  final RouteTruckOptions? truck;

  RouteTravelModeOptions({
    this.car,
    this.intermodal,
    this.pedestrian,
    this.scooter,
    this.transit,
    this.truck,
  });

  Map<String, dynamic> toJson() {
    final car = this.car;
    final intermodal = this.intermodal;
    final pedestrian = this.pedestrian;
    final scooter = this.scooter;
    final transit = this.transit;
    final truck = this.truck;
    return {
      if (car != null) 'Car': car,
      if (intermodal != null) 'Intermodal': intermodal,
      if (pedestrian != null) 'Pedestrian': pedestrian,
      if (scooter != null) 'Scooter': scooter,
      if (transit != null) 'Transit': transit,
      if (truck != null) 'Truck': truck,
    };
  }
}

/// @nodoc
class RouteTravelStepType {
  static const $default = RouteTravelStepType._('Default');
  static const turnByTurn = RouteTravelStepType._('TurnByTurn');

  final String value;

  const RouteTravelStepType._(this.value);

  static const values = [$default, turnByTurn];

  static RouteTravelStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTravelStepType._(value));

  @override
  bool operator ==(other) =>
      other is RouteTravelStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Waypoint between the Origin and Destination.
///
/// @nodoc
class RouteWaypoint {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// Avoids actions for the provided distance. This is typically to consider for
  /// users in moving vehicles who may not have sufficient time to make an action
  /// at an origin or a destination. Not supported in <code>ap-southeast-1</code>
  /// and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final int? avoidActionsForDistance;

  /// Avoid U-turns for calculation on highways and motorways. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final bool? avoidUTurns;

  /// GPS Heading at the position. Not supported in <code>ap-southeast-1</code>
  /// and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final double? heading;

  /// Options to configure matching the provided position to the road network. Not
  /// supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final RouteMatchingOptions? matching;

  /// If the waypoint should not be treated as a stop. If yes, the waypoint is
  /// passed through and doesn't split the route into different legs. Not
  /// supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final bool? passThrough;

  /// Options to configure matching the provided position to a side of the street.
  /// Not supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final RouteSideOfStreetOptions? sideOfStreet;

  /// Duration of the stop. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? stopDuration;

  RouteWaypoint({
    required this.position,
    this.avoidActionsForDistance,
    this.avoidUTurns,
    this.heading,
    this.matching,
    this.passThrough,
    this.sideOfStreet,
    this.stopDuration,
  });

  Map<String, dynamic> toJson() {
    final position = this.position;
    final avoidActionsForDistance = this.avoidActionsForDistance;
    final avoidUTurns = this.avoidUTurns;
    final heading = this.heading;
    final matching = this.matching;
    final passThrough = this.passThrough;
    final sideOfStreet = this.sideOfStreet;
    final stopDuration = this.stopDuration;
    return {
      'Position': position,
      if (avoidActionsForDistance != null)
        'AvoidActionsForDistance': avoidActionsForDistance,
      if (avoidUTurns != null) 'AvoidUTurns': avoidUTurns,
      if (heading != null) 'Heading': heading,
      if (matching != null) 'Matching': matching,
      if (passThrough != null) 'PassThrough': passThrough,
      if (sideOfStreet != null) 'SideOfStreet': sideOfStreet,
      if (stopDuration != null) 'StopDuration': stopDuration,
    };
  }
}

/// Options related to route matching.
///
/// @nodoc
class RouteMatchingOptions {
  /// Attempts to match the provided position to a road similar to the provided
  /// name.
  final String? nameHint;

  /// If the distance to a highway/bridge/tunnel/sliproad is within threshold, the
  /// waypoint will be snapped to the highway/bridge/tunnel/sliproad.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int? onRoadThreshold;

  /// Considers all roads within the provided radius to match the provided
  /// destination to. The roads that are considered are determined by the provided
  /// Strategy.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int? radius;

  /// Strategy that defines matching of the position onto the road network.
  /// MatchAny considers all roads possible, whereas MatchMostSignificantRoad
  /// matches to the most significant road.
  final MatchingStrategy? strategy;

  RouteMatchingOptions({
    this.nameHint,
    this.onRoadThreshold,
    this.radius,
    this.strategy,
  });

  Map<String, dynamic> toJson() {
    final nameHint = this.nameHint;
    final onRoadThreshold = this.onRoadThreshold;
    final radius = this.radius;
    final strategy = this.strategy;
    return {
      if (nameHint != null) 'NameHint': nameHint,
      if (onRoadThreshold != null) 'OnRoadThreshold': onRoadThreshold,
      if (radius != null) 'Radius': radius,
      if (strategy != null) 'Strategy': strategy.value,
    };
  }
}

/// Options to configure matching the provided position to a side of the street.
///
/// @nodoc
class RouteSideOfStreetOptions {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// Strategy that defines when the side of street position should be used.
  ///
  /// Default value: <code>DividedStreetOnly</code>
  final SideOfStreetMatchingStrategy? useWith;

  RouteSideOfStreetOptions({
    required this.position,
    this.useWith,
  });

  Map<String, dynamic> toJson() {
    final position = this.position;
    final useWith = this.useWith;
    return {
      'Position': position,
      if (useWith != null) 'UseWith': useWith.value,
    };
  }
}

/// @nodoc
class MatchingStrategy {
  static const matchAny = MatchingStrategy._('MatchAny');
  static const matchMostSignificantRoad =
      MatchingStrategy._('MatchMostSignificantRoad');

  final String value;

  const MatchingStrategy._(this.value);

  static const values = [matchAny, matchMostSignificantRoad];

  static MatchingStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MatchingStrategy._(value));

  @override
  bool operator ==(other) => other is MatchingStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Travel mode options when the provided travel mode is <code>Car</code>. For
/// <a
/// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
/// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
/// regions support only <code>LicensePlate</code> options.
///
/// @nodoc
class RouteCarOptions {
  /// Engine type of the vehicle. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final RouteEngineType? engineType;

  /// The vehicle License Plate.
  final RouteVehicleLicensePlate? licensePlate;

  /// Maximum speed specified. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? maxSpeed;

  /// The number of occupants in the vehicle. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Default value: <code>1</code>
  final int? occupancy;

  RouteCarOptions({
    this.engineType,
    this.licensePlate,
    this.maxSpeed,
    this.occupancy,
  });

  Map<String, dynamic> toJson() {
    final engineType = this.engineType;
    final licensePlate = this.licensePlate;
    final maxSpeed = this.maxSpeed;
    final occupancy = this.occupancy;
    return {
      if (engineType != null) 'EngineType': engineType.value,
      if (licensePlate != null) 'LicensePlate': licensePlate,
      if (maxSpeed != null) 'MaxSpeed': maxSpeed,
      if (occupancy != null) 'Occupancy': occupancy,
    };
  }
}

/// Options related to the pedestrian. Not supported in
/// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
/// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
/// customers.
///
/// @nodoc
class RoutePedestrianOptions {
  /// Walking speed in Kilometers per hour.
  final double? speed;

  RoutePedestrianOptions({
    this.speed,
  });

  Map<String, dynamic> toJson() {
    final speed = this.speed;
    return {
      if (speed != null) 'Speed': speed,
    };
  }
}

/// Travel mode options when the provided travel mode is <code>Scooter</code>.
/// For <a
/// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
/// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
/// regions support only <code>LicensePlate</code> options.
///
/// @nodoc
class RouteScooterOptions {
  /// Engine type of the vehicle. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final RouteEngineType? engineType;

  /// The vehicle License Plate.
  final RouteVehicleLicensePlate? licensePlate;

  /// Maximum speed Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? maxSpeed;

  /// The number of occupants in the vehicle. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Default value: <code>1</code>
  final int? occupancy;

  RouteScooterOptions({
    this.engineType,
    this.licensePlate,
    this.maxSpeed,
    this.occupancy,
  });

  Map<String, dynamic> toJson() {
    final engineType = this.engineType;
    final licensePlate = this.licensePlate;
    final maxSpeed = this.maxSpeed;
    final occupancy = this.occupancy;
    return {
      if (engineType != null) 'EngineType': engineType.value,
      if (licensePlate != null) 'LicensePlate': licensePlate,
      if (maxSpeed != null) 'MaxSpeed': maxSpeed,
      if (occupancy != null) 'Occupancy': occupancy,
    };
  }
}

/// Travel mode options when the provided travel mode is <code>Truck</code>. Not
/// supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
/// regions for <a
/// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
/// customers.
///
/// @nodoc
class RouteTruckOptions {
  /// Total number of axles of the vehicle.
  final int? axleCount;

  /// Engine type of the vehicle.
  final RouteEngineType? engineType;

  /// Gross weight of the vehicle including trailers, and goods at capacity.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? grossWeight;

  /// List of Hazardous cargo contained in the vehicle.
  final List<RouteHazardousCargoType>? hazardousCargos;

  /// Height of the vehicle.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? height;

  /// Height of the vehicle above its first axle.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? heightAboveFirstAxle;

  /// Kingpin to rear axle length of the vehicle.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? kpraLength;

  /// Length of the vehicle.
  ///
  /// <b>Unit</b>: <code>c</code>
  final int? length;

  /// The vehicle License Plate.
  final RouteVehicleLicensePlate? licensePlate;

  /// Maximum speed
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? maxSpeed;

  /// The number of occupants in the vehicle.
  ///
  /// Default value: <code>1</code>
  final int? occupancy;

  /// Payload capacity of the vehicle and trailers attached.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? payloadCapacity;

  /// Number of tires on the vehicle.
  final int? tireCount;

  /// Trailer options corresponding to the vehicle.
  final RouteTrailerOptions? trailer;

  /// The type of truck: <code>LightTruck</code> for smaller delivery vehicles,
  /// <code> StraightTruck</code> for rigid body trucks, or <code>Tractor</code>
  /// for tractor-trailer combinations.
  final RouteTruckType? truckType;

  /// The tunnel restriction code.
  ///
  /// Tunnel categories in this list indicate the restrictions which apply to
  /// certain tunnels in Great Britain. They relate to the types of dangerous
  /// goods that can be transported through them.
  ///
  /// <ul>
  /// <li>
  /// <i>Tunnel Category B</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Limited risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Few restrictions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category C</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Medium risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Some restrictions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category D</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: High risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Many restrictions occur
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category E</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Very high risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Restricted tunnel
  /// </li>
  /// </ul> </li>
  /// </ul>
  final String? tunnelRestrictionCode;

  /// Heaviest weight per axle irrespective of the axle type or the axle group.
  /// Meant for usage in countries where the differences in axle types or axle
  /// groups are not distinguished.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? weightPerAxle;

  /// Specifies the total weight for the specified axle group. Meant for usage in
  /// countries that have different regulations based on the axle group type.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final WeightPerAxleGroup? weightPerAxleGroup;

  /// Width of the vehicle.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? width;

  RouteTruckOptions({
    this.axleCount,
    this.engineType,
    this.grossWeight,
    this.hazardousCargos,
    this.height,
    this.heightAboveFirstAxle,
    this.kpraLength,
    this.length,
    this.licensePlate,
    this.maxSpeed,
    this.occupancy,
    this.payloadCapacity,
    this.tireCount,
    this.trailer,
    this.truckType,
    this.tunnelRestrictionCode,
    this.weightPerAxle,
    this.weightPerAxleGroup,
    this.width,
  });

  Map<String, dynamic> toJson() {
    final axleCount = this.axleCount;
    final engineType = this.engineType;
    final grossWeight = this.grossWeight;
    final hazardousCargos = this.hazardousCargos;
    final height = this.height;
    final heightAboveFirstAxle = this.heightAboveFirstAxle;
    final kpraLength = this.kpraLength;
    final length = this.length;
    final licensePlate = this.licensePlate;
    final maxSpeed = this.maxSpeed;
    final occupancy = this.occupancy;
    final payloadCapacity = this.payloadCapacity;
    final tireCount = this.tireCount;
    final trailer = this.trailer;
    final truckType = this.truckType;
    final tunnelRestrictionCode = this.tunnelRestrictionCode;
    final weightPerAxle = this.weightPerAxle;
    final weightPerAxleGroup = this.weightPerAxleGroup;
    final width = this.width;
    return {
      if (axleCount != null) 'AxleCount': axleCount,
      if (engineType != null) 'EngineType': engineType.value,
      if (grossWeight != null) 'GrossWeight': grossWeight,
      if (hazardousCargos != null)
        'HazardousCargos': hazardousCargos.map((e) => e.value).toList(),
      if (height != null) 'Height': height,
      if (heightAboveFirstAxle != null)
        'HeightAboveFirstAxle': heightAboveFirstAxle,
      if (kpraLength != null) 'KpraLength': kpraLength,
      if (length != null) 'Length': length,
      if (licensePlate != null) 'LicensePlate': licensePlate,
      if (maxSpeed != null) 'MaxSpeed': maxSpeed,
      if (occupancy != null) 'Occupancy': occupancy,
      if (payloadCapacity != null) 'PayloadCapacity': payloadCapacity,
      if (tireCount != null) 'TireCount': tireCount,
      if (trailer != null) 'Trailer': trailer,
      if (truckType != null) 'TruckType': truckType.value,
      if (tunnelRestrictionCode != null)
        'TunnelRestrictionCode': tunnelRestrictionCode,
      if (weightPerAxle != null) 'WeightPerAxle': weightPerAxle,
      if (weightPerAxleGroup != null) 'WeightPerAxleGroup': weightPerAxleGroup,
      if (width != null) 'Width': width,
    };
  }
}

/// Options related to intermodal routing.
/// <note>
/// Not supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
/// regions for <a
/// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
/// customers.
/// </note>
///
/// @nodoc
class RouteIntermodalOptions {
  /// Accessibility attributes to consider when calculating the route.
  final List<RouteAccessibilityAttribute>? accessibilityAttributes;

  /// Maximum number of transfers allowed when calculating the route.
  final int? maxTransfers;

  /// Options for the pedestrian leg of the intermodal route.
  final RouteIntermodalPedestrianOptions? pedestrian;

  /// Options for the rental leg of the intermodal route.
  final RouteIntermodalRentalOptions? rental;

  /// Options for the taxi leg of the intermodal route.
  final RouteIntermodalTaxiOptions? taxi;

  /// Options for the transit leg of the intermodal route.
  final RouteIntermodalTransitOptions? transit;

  /// Options for the vehicle leg of the intermodal route.
  final RouteIntermodalVehicleOptions? vehicle;

  RouteIntermodalOptions({
    this.accessibilityAttributes,
    this.maxTransfers,
    this.pedestrian,
    this.rental,
    this.taxi,
    this.transit,
    this.vehicle,
  });

  Map<String, dynamic> toJson() {
    final accessibilityAttributes = this.accessibilityAttributes;
    final maxTransfers = this.maxTransfers;
    final pedestrian = this.pedestrian;
    final rental = this.rental;
    final taxi = this.taxi;
    final transit = this.transit;
    final vehicle = this.vehicle;
    return {
      if (accessibilityAttributes != null)
        'AccessibilityAttributes':
            accessibilityAttributes.map((e) => e.value).toList(),
      if (maxTransfers != null) 'MaxTransfers': maxTransfers,
      if (pedestrian != null) 'Pedestrian': pedestrian,
      if (rental != null) 'Rental': rental,
      if (taxi != null) 'Taxi': taxi,
      if (transit != null) 'Transit': transit,
      if (vehicle != null) 'Vehicle': vehicle,
    };
  }
}

/// Options related to transit routing.
/// <note>
/// Not supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
/// regions for <a
/// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
/// customers.
/// </note>
///
/// @nodoc
class RouteTransitOptions {
  /// Accessibility attributes to consider when calculating the route.
  final List<RouteAccessibilityAttribute>? accessibilityAttributes;

  /// Allowed transit transport modes when calculating the route. By default, all
  /// transport modes are allowed. Cannot be used together with
  /// <code>ExcludedModes</code>.
  final List<RouteTransitMode>? allowedModes;

  /// Excluded transit transport modes when calculating the route. By default, all
  /// transport modes are allowed. Cannot be used together with
  /// <code>AllowedModes</code>.
  final List<RouteTransitMode>? excludedModes;

  /// Maximum number of transfers allowed when calculating the route.
  final int? maxTransfers;

  /// Options for the pedestrian leg of the transit route.
  final RouteTransitPedestrianOptions? pedestrian;

  RouteTransitOptions({
    this.accessibilityAttributes,
    this.allowedModes,
    this.excludedModes,
    this.maxTransfers,
    this.pedestrian,
  });

  Map<String, dynamic> toJson() {
    final accessibilityAttributes = this.accessibilityAttributes;
    final allowedModes = this.allowedModes;
    final excludedModes = this.excludedModes;
    final maxTransfers = this.maxTransfers;
    final pedestrian = this.pedestrian;
    return {
      if (accessibilityAttributes != null)
        'AccessibilityAttributes':
            accessibilityAttributes.map((e) => e.value).toList(),
      if (allowedModes != null)
        'AllowedModes': allowedModes.map((e) => e.value).toList(),
      if (excludedModes != null)
        'ExcludedModes': excludedModes.map((e) => e.value).toList(),
      if (maxTransfers != null) 'MaxTransfers': maxTransfers,
      if (pedestrian != null) 'Pedestrian': pedestrian,
    };
  }
}

/// Options for the pedestrian leg of the transit route.
///
/// @nodoc
class RouteTransitPedestrianOptions {
  /// Maximum walking distance allowed.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int? maxDistance;

  /// Walking speed.
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? speed;

  RouteTransitPedestrianOptions({
    this.maxDistance,
    this.speed,
  });

  Map<String, dynamic> toJson() {
    final maxDistance = this.maxDistance;
    final speed = this.speed;
    return {
      if (maxDistance != null) 'MaxDistance': maxDistance,
      if (speed != null) 'Speed': speed,
    };
  }
}

/// @nodoc
class RouteAccessibilityAttribute {
  static const wheelchair = RouteAccessibilityAttribute._('Wheelchair');

  final String value;

  const RouteAccessibilityAttribute._(this.value);

  static const values = [wheelchair];

  static RouteAccessibilityAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteAccessibilityAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RouteAccessibilityAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Options for the pedestrian leg of the intermodal route.
///
/// @nodoc
class RouteIntermodalPedestrianOptions {
  /// Maximum walking distance allowed.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int? maxDistance;

  /// Walking speed.
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? speed;

  RouteIntermodalPedestrianOptions({
    this.maxDistance,
    this.speed,
  });

  Map<String, dynamic> toJson() {
    final maxDistance = this.maxDistance;
    final speed = this.speed;
    return {
      if (maxDistance != null) 'MaxDistance': maxDistance,
      if (speed != null) 'Speed': speed,
    };
  }
}

/// Options for the rental leg of the intermodal route.
///
/// @nodoc
class RouteIntermodalRentalOptions {
  /// Allowed rental transport modes when calculating the route. By default, all
  /// transport modes are allowed. Cannot be used together with
  /// <code>ExcludedModes</code>.
  final List<RouteRentalMode>? allowedModes;

  /// Specifies the portion of the route for which this leg type is enabled. By
  /// default, the leg type is enabled for all legs. Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>FirstLeg</code> - Enable this leg type for the first non-pedestrian
  /// leg of the route.
  /// </li>
  /// <li>
  /// <code>LastLeg</code> - Enable this leg type for the last non-pedestrian leg
  /// of the route.
  /// </li>
  /// <li>
  /// <code>EntireRoute</code> - Enable this leg type for the entire route.
  /// </li>
  /// <li>
  /// <code>None</code> - Disable this leg type entirely.
  /// </li>
  /// </ul>
  final List<RouteIntermodalEnabledLegs>? enabledFor;

  /// Excluded rental transport modes when calculating the route. By default, all
  /// transport modes are allowed. Cannot be used together with
  /// <code>AllowedModes</code>.
  final List<RouteRentalMode>? excludedModes;

  RouteIntermodalRentalOptions({
    this.allowedModes,
    this.enabledFor,
    this.excludedModes,
  });

  Map<String, dynamic> toJson() {
    final allowedModes = this.allowedModes;
    final enabledFor = this.enabledFor;
    final excludedModes = this.excludedModes;
    return {
      if (allowedModes != null)
        'AllowedModes': allowedModes.map((e) => e.value).toList(),
      if (enabledFor != null)
        'EnabledFor': enabledFor.map((e) => e.value).toList(),
      if (excludedModes != null)
        'ExcludedModes': excludedModes.map((e) => e.value).toList(),
    };
  }
}

/// Options for the taxi leg of the intermodal route.
///
/// @nodoc
class RouteIntermodalTaxiOptions {
  /// Allowed taxi transport modes when calculating the route. By default, all
  /// transport modes are allowed. Cannot be used together with
  /// <code>ExcludedModes</code>.
  final List<RouteTaxiMode>? allowedModes;

  /// Specifies the portion of the route for which this leg type is enabled. By
  /// default, the leg type is enabled for all legs. Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>FirstLeg</code> - Enable this leg type for the first non-pedestrian
  /// leg of the route.
  /// </li>
  /// <li>
  /// <code>LastLeg</code> - Enable this leg type for the last non-pedestrian leg
  /// of the route.
  /// </li>
  /// <li>
  /// <code>EntireRoute</code> - Enable this leg type for the entire route.
  /// </li>
  /// <li>
  /// <code>None</code> - Disable this leg type entirely.
  /// </li>
  /// </ul>
  final List<RouteIntermodalEnabledLegs>? enabledFor;

  /// Excluded taxi transport modes when calculating the route. By default, all
  /// transport modes are allowed. Cannot be used together with
  /// <code>AllowedModes</code>.
  final List<RouteTaxiMode>? excludedModes;

  RouteIntermodalTaxiOptions({
    this.allowedModes,
    this.enabledFor,
    this.excludedModes,
  });

  Map<String, dynamic> toJson() {
    final allowedModes = this.allowedModes;
    final enabledFor = this.enabledFor;
    final excludedModes = this.excludedModes;
    return {
      if (allowedModes != null)
        'AllowedModes': allowedModes.map((e) => e.value).toList(),
      if (enabledFor != null)
        'EnabledFor': enabledFor.map((e) => e.value).toList(),
      if (excludedModes != null)
        'ExcludedModes': excludedModes.map((e) => e.value).toList(),
    };
  }
}

/// Options for the transit leg of the intermodal route.
///
/// @nodoc
class RouteIntermodalTransitOptions {
  /// Allowed transit transport modes when calculating the route. By default, all
  /// transport modes are allowed. Cannot be used together with
  /// <code>ExcludedModes</code>.
  final List<RouteTransitMode>? allowedModes;

  /// Specifies the portion of the route for which this leg type is enabled. By
  /// default, the leg type is enabled for all legs. Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>FirstLeg</code> - Enable this leg type for the first non-pedestrian
  /// leg of the route.
  /// </li>
  /// <li>
  /// <code>LastLeg</code> - Enable this leg type for the last non-pedestrian leg
  /// of the route.
  /// </li>
  /// <li>
  /// <code>EntireRoute</code> - Enable this leg type for the entire route.
  /// </li>
  /// <li>
  /// <code>None</code> - Disable this leg type entirely.
  /// </li>
  /// </ul>
  final List<RouteIntermodalEnabledLegs>? enabledFor;

  /// Excluded transit transport modes when calculating the route. By default, all
  /// transport modes are allowed. Cannot be used together with
  /// <code>AllowedModes</code>.
  final List<RouteTransitMode>? excludedModes;

  RouteIntermodalTransitOptions({
    this.allowedModes,
    this.enabledFor,
    this.excludedModes,
  });

  Map<String, dynamic> toJson() {
    final allowedModes = this.allowedModes;
    final enabledFor = this.enabledFor;
    final excludedModes = this.excludedModes;
    return {
      if (allowedModes != null)
        'AllowedModes': allowedModes.map((e) => e.value).toList(),
      if (enabledFor != null)
        'EnabledFor': enabledFor.map((e) => e.value).toList(),
      if (excludedModes != null)
        'ExcludedModes': excludedModes.map((e) => e.value).toList(),
    };
  }
}

/// Options for the vehicle leg of the intermodal route.
///
/// @nodoc
class RouteIntermodalVehicleOptions {
  /// Allowed vehicle transport modes when calculating the route. By default, all
  /// transport modes are allowed. Cannot be used together with
  /// <code>ExcludedModes</code>.
  final List<RouteVehicleMode>? allowedModes;

  /// Specifies the portion of the route for which this leg type is enabled. By
  /// default, the leg type is enabled for all legs. Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>FirstLeg</code> - Enable this leg type for the first non-pedestrian
  /// leg of the route.
  /// </li>
  /// <li>
  /// <code>LastLeg</code> - Enable this leg type for the last non-pedestrian leg
  /// of the route.
  /// </li>
  /// <li>
  /// <code>EntireRoute</code> - Enable this leg type for the entire route.
  /// </li>
  /// <li>
  /// <code>None</code> - Disable this leg type entirely.
  /// </li>
  /// </ul>
  final List<RouteIntermodalEnabledLegs>? enabledFor;

  /// Excluded vehicle transport modes when calculating the route. By default, all
  /// transport modes are allowed. Cannot be used together with
  /// <code>AllowedModes</code>.
  final List<RouteVehicleMode>? excludedModes;

  RouteIntermodalVehicleOptions({
    this.allowedModes,
    this.enabledFor,
    this.excludedModes,
  });

  Map<String, dynamic> toJson() {
    final allowedModes = this.allowedModes;
    final enabledFor = this.enabledFor;
    final excludedModes = this.excludedModes;
    return {
      if (allowedModes != null)
        'AllowedModes': allowedModes.map((e) => e.value).toList(),
      if (enabledFor != null)
        'EnabledFor': enabledFor.map((e) => e.value).toList(),
      if (excludedModes != null)
        'ExcludedModes': excludedModes.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class RouteIntermodalEnabledLegs {
  static const firstLeg = RouteIntermodalEnabledLegs._('FirstLeg');
  static const lastLeg = RouteIntermodalEnabledLegs._('LastLeg');
  static const entireRoute = RouteIntermodalEnabledLegs._('EntireRoute');
  static const none = RouteIntermodalEnabledLegs._('None');

  final String value;

  const RouteIntermodalEnabledLegs._(this.value);

  static const values = [firstLeg, lastLeg, entireRoute, none];

  static RouteIntermodalEnabledLegs fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteIntermodalEnabledLegs._(value));

  @override
  bool operator ==(other) =>
      other is RouteIntermodalEnabledLegs && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteVehicleMode {
  static const all = RouteVehicleMode._('All');
  static const car = RouteVehicleMode._('Car');

  final String value;

  const RouteVehicleMode._(this.value);

  static const values = [all, car];

  static RouteVehicleMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteVehicleMode._(value));

  @override
  bool operator ==(other) => other is RouteVehicleMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// License plate information of the vehicle. Currently, only the last character
/// is used where license plate based controlled access is enforced.
///
/// @nodoc
class RouteVehicleLicensePlate {
  /// The last character of the License Plate.
  final String? lastCharacter;

  RouteVehicleLicensePlate({
    this.lastCharacter,
  });

  Map<String, dynamic> toJson() {
    final lastCharacter = this.lastCharacter;
    return {
      if (lastCharacter != null) 'LastCharacter': lastCharacter,
    };
  }
}

/// Trailer options corresponding to the vehicle.
///
/// @nodoc
class RouteTrailerOptions {
  /// Total number of axles of the vehicle.
  final int? axleCount;

  /// Number of trailers attached to the vehicle.
  ///
  /// Default value: <code>0</code>
  final int? trailerCount;

  RouteTrailerOptions({
    this.axleCount,
    this.trailerCount,
  });

  Map<String, dynamic> toJson() {
    final axleCount = this.axleCount;
    final trailerCount = this.trailerCount;
    return {
      if (axleCount != null) 'AxleCount': axleCount,
      if (trailerCount != null) 'TrailerCount': trailerCount,
    };
  }
}

/// Type of the emission.
///
/// <b>Valid values</b>: <code>Euro1, Euro2, Euro3, Euro4, Euro5, Euro6,
/// EuroEev</code>
///
/// @nodoc
class RouteEmissionType {
  /// Type of the emission.
  ///
  /// <b>Valid values</b>: <code>Euro1, Euro2, Euro3, Euro4, Euro5, Euro6,
  /// EuroEev</code>
  final String type;

  /// The CO 2 emission classes.
  final String? co2EmissionClass;

  RouteEmissionType({
    required this.type,
    this.co2EmissionClass,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    final co2EmissionClass = this.co2EmissionClass;
    return {
      'Type': type,
      if (co2EmissionClass != null) 'Co2EmissionClass': co2EmissionClass,
    };
  }
}

/// @nodoc
class RouteTollVehicleCategory {
  static const minibus = RouteTollVehicleCategory._('Minibus');

  final String value;

  const RouteTollVehicleCategory._(this.value);

  static const values = [minibus];

  static RouteTollVehicleCategory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteTollVehicleCategory._(value));

  @override
  bool operator ==(other) =>
      other is RouteTollVehicleCategory && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteSpanAdditionalFeature {
  static const bestCaseDuration =
      RouteSpanAdditionalFeature._('BestCaseDuration');
  static const carAccess = RouteSpanAdditionalFeature._('CarAccess');
  static const country = RouteSpanAdditionalFeature._('Country');
  static const distance = RouteSpanAdditionalFeature._('Distance');
  static const duration = RouteSpanAdditionalFeature._('Duration');
  static const dynamicSpeed = RouteSpanAdditionalFeature._('DynamicSpeed');
  static const functionalClassification =
      RouteSpanAdditionalFeature._('FunctionalClassification');
  static const gates = RouteSpanAdditionalFeature._('Gates');
  static const incidents = RouteSpanAdditionalFeature._('Incidents');
  static const names = RouteSpanAdditionalFeature._('Names');
  static const notices = RouteSpanAdditionalFeature._('Notices');
  static const pedestrianAccess =
      RouteSpanAdditionalFeature._('PedestrianAccess');
  static const railwayCrossings =
      RouteSpanAdditionalFeature._('RailwayCrossings');
  static const region = RouteSpanAdditionalFeature._('Region');
  static const roadAttributes = RouteSpanAdditionalFeature._('RoadAttributes');
  static const routeNumbers = RouteSpanAdditionalFeature._('RouteNumbers');
  static const scooterAccess = RouteSpanAdditionalFeature._('ScooterAccess');
  static const speedLimit = RouteSpanAdditionalFeature._('SpeedLimit');
  static const tollSystems = RouteSpanAdditionalFeature._('TollSystems');
  static const truckAccess = RouteSpanAdditionalFeature._('TruckAccess');
  static const truckRoadTypes = RouteSpanAdditionalFeature._('TruckRoadTypes');
  static const typicalDuration =
      RouteSpanAdditionalFeature._('TypicalDuration');
  static const zones = RouteSpanAdditionalFeature._('Zones');
  static const consumption = RouteSpanAdditionalFeature._('Consumption');

  final String value;

  const RouteSpanAdditionalFeature._(this.value);

  static const values = [
    bestCaseDuration,
    carAccess,
    country,
    distance,
    duration,
    dynamicSpeed,
    functionalClassification,
    gates,
    incidents,
    names,
    notices,
    pedestrianAccess,
    railwayCrossings,
    region,
    roadAttributes,
    routeNumbers,
    scooterAccess,
    speedLimit,
    tollSystems,
    truckAccess,
    truckRoadTypes,
    typicalDuration,
    zones,
    consumption
  ];

  static RouteSpanAdditionalFeature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteSpanAdditionalFeature._(value));

  @override
  bool operator ==(other) =>
      other is RouteSpanAdditionalFeature && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteLegAdditionalFeature {
  static const elevation = RouteLegAdditionalFeature._('Elevation');
  static const incidents = RouteLegAdditionalFeature._('Incidents');
  static const passThroughWaypoints =
      RouteLegAdditionalFeature._('PassThroughWaypoints');
  static const summary = RouteLegAdditionalFeature._('Summary');
  static const tolls = RouteLegAdditionalFeature._('Tolls');
  static const travelStepInstructions =
      RouteLegAdditionalFeature._('TravelStepInstructions');
  static const truckRoadTypes = RouteLegAdditionalFeature._('TruckRoadTypes');
  static const typicalDuration = RouteLegAdditionalFeature._('TypicalDuration');
  static const zones = RouteLegAdditionalFeature._('Zones');
  static const bookings = RouteLegAdditionalFeature._('Bookings');
  static const intermediateStops =
      RouteLegAdditionalFeature._('IntermediateStops');
  static const nextDepartures = RouteLegAdditionalFeature._('NextDepartures');

  final String value;

  const RouteLegAdditionalFeature._(this.value);

  static const values = [
    elevation,
    incidents,
    passThroughWaypoints,
    summary,
    tolls,
    travelStepInstructions,
    truckRoadTypes,
    typicalDuration,
    zones,
    bookings,
    intermediateStops,
    nextDepartures
  ];

  static RouteLegAdditionalFeature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteLegAdditionalFeature._(value));

  @override
  bool operator ==(other) =>
      other is RouteLegAdditionalFeature && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Interval of the driver work-rest schedule. Stops are added to fulfil the
/// provided rest schedule.
///
/// @nodoc
class RouteDriverScheduleInterval {
  /// Maximum allowed driving time before stopping to rest.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int driveDuration;

  /// Resting time before the driver can continue driving.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int restDuration;

  RouteDriverScheduleInterval({
    required this.driveDuration,
    required this.restDuration,
  });

  Map<String, dynamic> toJson() {
    final driveDuration = this.driveDuration;
    final restDuration = this.restDuration;
    return {
      'DriveDuration': driveDuration,
      'RestDuration': restDuration,
    };
  }
}

/// Zone categories to be avoided. Not supported in <code>ap-southeast-1</code>
/// and <code>ap-southeast-5</code> regions for <a
/// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
/// customers.
///
/// @nodoc
class RouteAvoidanceZoneCategory {
  /// Zone category to be avoided.
  final RouteZoneCategory category;

  RouteAvoidanceZoneCategory({
    required this.category,
  });

  Map<String, dynamic> toJson() {
    final category = this.category;
    return {
      'Category': category.value,
    };
  }
}

/// Areas to be avoided.
///
/// @nodoc
class RouteAvoidanceArea {
  final RouteAvoidanceAreaGeometry geometry;

  /// Exceptions to the provided avoidance geometry, to be included while
  /// calculating the route.
  final List<RouteAvoidanceAreaGeometry>? except;

  RouteAvoidanceArea({
    required this.geometry,
    this.except,
  });

  Map<String, dynamic> toJson() {
    final geometry = this.geometry;
    final except = this.except;
    return {
      'Geometry': geometry,
      if (except != null) 'Except': except,
    };
  }
}

/// Geometry of the area to be avoided.
///
/// @nodoc
class RouteAvoidanceAreaGeometry {
  /// Geometry defined as a bounding box. The first pair represents the X and Y
  /// coordinates (longitude and latitude,) of the southwest corner of the
  /// bounding box; the second pair represents the X and Y coordinates (longitude
  /// and latitude) of the northeast corner.
  final List<double>? boundingBox;

  /// Geometry defined as a corridor - a LineString with a radius that defines the
  /// width of the corridor.
  final Corridor? corridor;

  /// Geometry defined as a polygon with only one linear ring.
  final List<List<List<double>>>? polygon;

  /// Geometry defined as an encoded corridor - an encoded polyline with a radius
  /// that defines the width of the corridor.
  final PolylineCorridor? polylineCorridor;

  /// A list of Isoline PolylinePolygon, for each isoline PolylinePolygon, it
  /// contains PolylinePolygon of the first linear ring (the outer ring) and from
  /// 2nd item to the last item (the inner rings). For more information on
  /// polyline encoding, see <a
  /// href="https://github.com/aws-geospatial/polyline">https://github.com/aws-geospatial/polyline</a>.
  final List<String>? polylinePolygon;

  RouteAvoidanceAreaGeometry({
    this.boundingBox,
    this.corridor,
    this.polygon,
    this.polylineCorridor,
    this.polylinePolygon,
  });

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final corridor = this.corridor;
    final polygon = this.polygon;
    final polylineCorridor = this.polylineCorridor;
    final polylinePolygon = this.polylinePolygon;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (corridor != null) 'Corridor': corridor,
      if (polygon != null) 'Polygon': polygon,
      if (polylineCorridor != null) 'PolylineCorridor': polylineCorridor,
      if (polylinePolygon != null) 'PolylinePolygon': polylinePolygon,
    };
  }
}

/// Geometry defined as a corridor - a LineString with a radius that defines the
/// width of the corridor.
///
/// @nodoc
class Corridor {
  /// An ordered list of positions used to plot a route on a map.
  /// <note>
  /// LineString and Polyline are mutually exclusive properties.
  /// </note>
  final List<List<double>> lineString;

  /// Radius that defines the width of the corridor.
  final int radius;

  Corridor({
    required this.lineString,
    required this.radius,
  });

  Map<String, dynamic> toJson() {
    final lineString = this.lineString;
    final radius = this.radius;
    return {
      'LineString': lineString,
      'Radius': radius,
    };
  }
}

/// Geometry defined as an encoded corridor - an encoded polyline with a radius
/// that defines the width of the corridor.
///
/// @nodoc
class PolylineCorridor {
  /// An ordered list of positions used to plot a route on a map in a lossy
  /// compression format.
  /// <note>
  /// LineString and Polyline are mutually exclusive properties.
  /// </note>
  final String polyline;

  /// Considers all roads within the provided radius to match the provided
  /// destination to. The roads that are considered are determined by the provided
  /// Strategy.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int radius;

  PolylineCorridor({
    required this.polyline,
    required this.radius,
  });

  Map<String, dynamic> toJson() {
    final polyline = this.polyline;
    final radius = this.radius;
    return {
      'Polyline': polyline,
      'Radius': radius,
    };
  }
}

/// Boundary within which the matrix is to be calculated. All data, origins and
/// destinations outside the boundary are considered invalid.
///
/// @nodoc
class RouteMatrixBoundary {
  /// Geometry of the area to be avoided.
  final RouteMatrixBoundaryGeometry? geometry;

  /// No restrictions in terms of a routing boundary, and is typically used for
  /// longer routes.
  final bool? unbounded;

  RouteMatrixBoundary({
    this.geometry,
    this.unbounded,
  });

  factory RouteMatrixBoundary.fromJson(Map<String, dynamic> json) {
    return RouteMatrixBoundary(
      geometry: json['Geometry'] != null
          ? RouteMatrixBoundaryGeometry.fromJson(
              json['Geometry'] as Map<String, dynamic>)
          : null,
      unbounded: json['Unbounded'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final geometry = this.geometry;
    final unbounded = this.unbounded;
    return {
      if (geometry != null) 'Geometry': geometry,
      if (unbounded != null) 'Unbounded': unbounded,
    };
  }
}

/// Geometry of the routing boundary.
///
/// @nodoc
class RouteMatrixBoundaryGeometry {
  /// <code>AutoCircle</code> requests the route matrix service to define a
  /// <code>Circle</code> boundary that best attempts to include most waypoints
  /// (<code>Origins</code> and <code>Destinations</code>) using the
  /// <code>AutoCircle</code> settings. Any waypoints outside of the auto-defined
  /// <code>Circle</code> boundary will be considered out of the routing boundary,
  /// which results in a route matrix entry error.
  ///
  /// <code>AutoCircle</code> is only used in the request to configure a
  /// <code>Circle</code> for the route calculation. The derived
  /// <code>Circle</code> will also be provided in the response.
  final RouteMatrixAutoCircle? autoCircle;

  /// Geometry defined as a bounding box. The first pair represents the X and Y
  /// coordinates (longitude and latitude,) of the southwest corner of the
  /// bounding box; the second pair represents the X and Y coordinates (longitude
  /// and latitude) of the northeast corner.
  ///
  /// Diagonal distance of the bounding box must be less than or equal to 400,000
  /// meters.
  final List<double>? boundingBox;

  /// Geometry defined as a circle. The circle defines the routing boundary area.
  /// Any waypoints outside the circle will result in a route matrix entry error.
  ///
  /// You can specify a <code>Circle</code> directly in the request, or it will be
  /// auto-derived when <code>AutoCircle</code> is used. When
  /// <code>AutoCircle</code> is set in the request, the response routing boundary
  /// will return <code>Circle</code> derived from the <code>AutoCircle</code>
  /// settings.
  final Circle? circle;

  /// Geometry defined as a polygon with only one linear ring. A linear ring is a
  /// closed sequence of four or more coordinates. The first and last coordinates
  /// are the same, forming a closed boundary. Each coordinate is a position in
  /// \[longitude, latitude\] format.
  ///
  /// The structure is an array of linear rings (only 1 allowed). Each linear ring
  /// is an array of coordinates (minimum 4), and each coordinate is an array of
  /// two doubles \[longitude, latitude\].
  ///
  /// Maximum distance between any two vertices must be less than or equal to
  /// 400,000 meters.
  final List<List<List<double>>>? polygon;

  RouteMatrixBoundaryGeometry({
    this.autoCircle,
    this.boundingBox,
    this.circle,
    this.polygon,
  });

  factory RouteMatrixBoundaryGeometry.fromJson(Map<String, dynamic> json) {
    return RouteMatrixBoundaryGeometry(
      autoCircle: json['AutoCircle'] != null
          ? RouteMatrixAutoCircle.fromJson(
              json['AutoCircle'] as Map<String, dynamic>)
          : null,
      boundingBox: (json['BoundingBox'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      circle: json['Circle'] != null
          ? Circle.fromJson(json['Circle'] as Map<String, dynamic>)
          : null,
      polygon: (json['Polygon'] as List?)
          ?.nonNulls
          .map((e) => (e as List)
              .nonNulls
              .map((e) => (e as List).nonNulls.map((e) => e as double).toList())
              .toList())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoCircle = this.autoCircle;
    final boundingBox = this.boundingBox;
    final circle = this.circle;
    final polygon = this.polygon;
    return {
      if (autoCircle != null) 'AutoCircle': autoCircle,
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (circle != null) 'Circle': circle,
      if (polygon != null) 'Polygon': polygon,
    };
  }
}

/// <code>AutoCircle</code> requests the route matrix service to define a
/// <code>Circle</code> boundary that best attempts to include most waypoints
/// (<code>Origins</code> and <code>Destinations</code>) using the
/// <code>AutoCircle</code> settings. Any waypoints outside of the auto-defined
/// <code>Circle</code> boundary will be considered out of the routing boundary,
/// which results in a route matrix entry error.
///
/// <code>AutoCircle</code> is only used in the request to configure a
/// <code>Circle</code> for the route calculation. The derived
/// <code>Circle</code> will also be provided in the response.
///
/// @nodoc
class RouteMatrixAutoCircle {
  /// The minimal distance, in meters, between any waypoint and the perimeter of
  /// the circle auto-defined for the boundary. Some margin is usually recommended
  /// so that the routing has enough leeway to travel from one waypoint to another
  /// optimally without conflicting with the routing boundary.
  ///
  /// The total of <code>MaxRadius</code> and <code>Margin</code> must be less
  /// than or equal to 200,000 meters.
  final int? margin;

  /// The maximum radius, in meters, that the auto-defined <code>Circle</code>
  /// boundary should have, before the <code>Margin</code> distance is added to
  /// the circle.
  ///
  /// The total of <code>MaxRadius</code> and <code>Margin</code> must be less
  /// than or equal to 200,000 meters.
  final int? maxRadius;

  RouteMatrixAutoCircle({
    this.margin,
    this.maxRadius,
  });

  factory RouteMatrixAutoCircle.fromJson(Map<String, dynamic> json) {
    return RouteMatrixAutoCircle(
      margin: json['Margin'] as int?,
      maxRadius: json['MaxRadius'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final margin = this.margin;
    final maxRadius = this.maxRadius;
    return {
      if (margin != null) 'Margin': margin,
      if (maxRadius != null) 'MaxRadius': maxRadius,
    };
  }
}

/// Geometry defined as a circle. The circle defines the routing boundary area.
/// Any waypoints outside the circle will result in a route matrix entry error.
///
/// You can specify a <code>Circle</code> directly in the request, or it will be
/// auto-derived when <code>AutoCircle</code> is used. When
/// <code>AutoCircle</code> is set in the request, the response routing boundary
/// will return <code>Circle</code> derived from the <code>AutoCircle</code>
/// settings.
///
/// @nodoc
class Circle {
  /// Center of the Circle in World Geodetic System (WGS 84) format: \[longitude,
  /// latitude\].
  ///
  /// Example: <code>\[-123.1174, 49.2847\]</code> represents the position with
  /// longitude <code>-123.1174</code> and latitude <code>49.2847</code>.
  final List<double> center;

  /// Radius of the Circle.
  ///
  /// <b>Unit</b>: <code>meters</code>
  ///
  /// Valid Range: Minimum value of 0. Maximum value of 200000.
  final double radius;

  Circle({
    required this.center,
    required this.radius,
  });

  factory Circle.fromJson(Map<String, dynamic> json) {
    return Circle(
      center: ((json['Center'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      radius: (json['Radius'] as double?) ?? 0,
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

/// The calculated route matrix containing the results for all pairs of Origins
/// to Destination positions. Each row corresponds to one entry in Origins. Each
/// entry in the row corresponds to the route from that entry in Origins to an
/// entry in Destination positions.
///
/// @nodoc
class RouteMatrixEntry {
  /// The total distance of travel for the route.
  final int distance;

  /// The expected duration of travel for the route.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int duration;

  /// Error code that occurred during calculation of the route.
  final RouteMatrixErrorCode? error;

  RouteMatrixEntry({
    required this.distance,
    required this.duration,
    this.error,
  });

  factory RouteMatrixEntry.fromJson(Map<String, dynamic> json) {
    return RouteMatrixEntry(
      distance: (json['Distance'] as int?) ?? 0,
      duration: (json['Duration'] as int?) ?? 0,
      error: (json['Error'] as String?)?.let(RouteMatrixErrorCode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final duration = this.duration;
    final error = this.error;
    return {
      'Distance': distance,
      'Duration': duration,
      if (error != null) 'Error': error.value,
    };
  }
}

/// @nodoc
class RouteMatrixErrorCode {
  static const noMatch = RouteMatrixErrorCode._('NoMatch');
  static const noMatchDestination =
      RouteMatrixErrorCode._('NoMatchDestination');
  static const noMatchOrigin = RouteMatrixErrorCode._('NoMatchOrigin');
  static const noRoute = RouteMatrixErrorCode._('NoRoute');
  static const outOfBounds = RouteMatrixErrorCode._('OutOfBounds');
  static const outOfBoundsDestination =
      RouteMatrixErrorCode._('OutOfBoundsDestination');
  static const outOfBoundsOrigin = RouteMatrixErrorCode._('OutOfBoundsOrigin');
  static const other = RouteMatrixErrorCode._('Other');
  static const violation = RouteMatrixErrorCode._('Violation');

  final String value;

  const RouteMatrixErrorCode._(this.value);

  static const values = [
    noMatch,
    noMatchDestination,
    noMatchOrigin,
    noRoute,
    outOfBounds,
    outOfBoundsDestination,
    outOfBoundsOrigin,
    other,
    violation
  ];

  static RouteMatrixErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteMatrixErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is RouteMatrixErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Allow Options related to the route matrix.
///
/// @nodoc
class RouteMatrixAllowOptions {
  /// Allow Hot (High Occupancy Toll) lanes while calculating the route.
  ///
  /// Default value: <code>false</code>
  final bool? hot;

  /// Allow Hov (High Occupancy vehicle) lanes while calculating the route.
  ///
  /// Default value: <code>false</code>
  final bool? hov;

  RouteMatrixAllowOptions({
    this.hot,
    this.hov,
  });

  Map<String, dynamic> toJson() {
    final hot = this.hot;
    final hov = this.hov;
    return {
      if (hot != null) 'Hot': hot,
      if (hov != null) 'Hov': hov,
    };
  }
}

/// Specifies options for areas to avoid when calculating the route. This is a
/// best-effort avoidance setting, meaning the router will try to honor the
/// avoidance preferences but may still include restricted areas if no feasible
/// alternative route exists. If avoidance options are not followed, the
/// response will indicate that the avoidance criteria were violated.
///
/// @nodoc
class RouteMatrixAvoidanceOptions {
  /// Areas to be avoided.
  final List<RouteMatrixAvoidanceArea>? areas;

  /// Avoid car-shuttle-trains while calculating the route.
  final bool? carShuttleTrains;

  /// Avoid controlled access highways while calculating the route.
  final bool? controlledAccessHighways;

  /// Avoid dirt roads while calculating the route.
  final bool? dirtRoads;

  /// Avoid ferries while calculating the route.
  final bool? ferries;

  /// Avoids roads where the specified toll transponders are the only mode of
  /// payment.
  final bool? tollRoads;

  /// Avoids roads where the specified toll transponders are the only mode of
  /// payment.
  final bool? tollTransponders;

  /// Truck road type identifiers. <code>BK1</code> through <code>BK4</code> apply
  /// only to Sweden. <code>A2,A4,B2,B4,C,D,ET2,ET4</code> apply only to Mexico.
  /// <note>
  /// There are currently no other supported values as of 26th April 2024.
  /// </note>
  final List<String>? truckRoadTypes;

  /// Avoid tunnels while calculating the route.
  final bool? tunnels;

  /// Avoid U-turns for calculation on highways and motorways.
  final bool? uTurns;

  /// Zone categories to be avoided.
  final List<RouteMatrixAvoidanceZoneCategory>? zoneCategories;

  RouteMatrixAvoidanceOptions({
    this.areas,
    this.carShuttleTrains,
    this.controlledAccessHighways,
    this.dirtRoads,
    this.ferries,
    this.tollRoads,
    this.tollTransponders,
    this.truckRoadTypes,
    this.tunnels,
    this.uTurns,
    this.zoneCategories,
  });

  Map<String, dynamic> toJson() {
    final areas = this.areas;
    final carShuttleTrains = this.carShuttleTrains;
    final controlledAccessHighways = this.controlledAccessHighways;
    final dirtRoads = this.dirtRoads;
    final ferries = this.ferries;
    final tollRoads = this.tollRoads;
    final tollTransponders = this.tollTransponders;
    final truckRoadTypes = this.truckRoadTypes;
    final tunnels = this.tunnels;
    final uTurns = this.uTurns;
    final zoneCategories = this.zoneCategories;
    return {
      if (areas != null) 'Areas': areas,
      if (carShuttleTrains != null) 'CarShuttleTrains': carShuttleTrains,
      if (controlledAccessHighways != null)
        'ControlledAccessHighways': controlledAccessHighways,
      if (dirtRoads != null) 'DirtRoads': dirtRoads,
      if (ferries != null) 'Ferries': ferries,
      if (tollRoads != null) 'TollRoads': tollRoads,
      if (tollTransponders != null) 'TollTransponders': tollTransponders,
      if (truckRoadTypes != null) 'TruckRoadTypes': truckRoadTypes,
      if (tunnels != null) 'Tunnels': tunnels,
      if (uTurns != null) 'UTurns': uTurns,
      if (zoneCategories != null) 'ZoneCategories': zoneCategories,
    };
  }
}

/// Specifies strict exclusion options for the route calculation. This setting
/// mandates that the router will avoid any routes that include the specified
/// options, rather than merely attempting to minimize them.
///
/// @nodoc
class RouteMatrixExclusionOptions {
  /// List of countries to be avoided defined by two-letter or three-letter
  /// country codes.
  final List<String> countries;

  RouteMatrixExclusionOptions({
    required this.countries,
  });

  Map<String, dynamic> toJson() {
    final countries = this.countries;
    return {
      'Countries': countries,
    };
  }
}

/// Traffic related options.
///
/// @nodoc
class RouteMatrixTrafficOptions {
  /// Duration for which flow traffic is considered valid. For this period, the
  /// flow traffic is used over historical traffic data. Flow traffic refers to
  /// congestion, which changes very quickly. Duration in seconds for which flow
  /// traffic event would be considered valid. While flow traffic event is valid
  /// it will be used over the historical traffic data.
  final int? flowEventThresholdOverride;

  /// Determines if traffic should be used or ignored while calculating the route.
  ///
  /// Default value: <code>UseTrafficData</code>
  final TrafficUsage? usage;

  RouteMatrixTrafficOptions({
    this.flowEventThresholdOverride,
    this.usage,
  });

  Map<String, dynamic> toJson() {
    final flowEventThresholdOverride = this.flowEventThresholdOverride;
    final usage = this.usage;
    return {
      if (flowEventThresholdOverride != null)
        'FlowEventThresholdOverride': flowEventThresholdOverride,
      if (usage != null) 'Usage': usage.value,
    };
  }
}

/// @nodoc
class RouteMatrixTravelMode {
  static const car = RouteMatrixTravelMode._('Car');
  static const pedestrian = RouteMatrixTravelMode._('Pedestrian');
  static const scooter = RouteMatrixTravelMode._('Scooter');
  static const truck = RouteMatrixTravelMode._('Truck');

  final String value;

  const RouteMatrixTravelMode._(this.value);

  static const values = [car, pedestrian, scooter, truck];

  static RouteMatrixTravelMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteMatrixTravelMode._(value));

  @override
  bool operator ==(other) =>
      other is RouteMatrixTravelMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Travel mode related options for the provided travel mode.
///
/// @nodoc
class RouteMatrixTravelModeOptions {
  /// Travel mode options when the provided travel mode is <code>Car</code>.
  final RouteMatrixCarOptions? car;

  /// Travel mode options when the provided travel mode is <code>Scooter</code>.
  /// <note>
  /// When travel mode is set to <code>Scooter</code>, then the avoidance option
  /// <code>ControlledAccessHighways</code> defaults to <code>true</code>.
  /// </note>
  final RouteMatrixScooterOptions? scooter;

  /// Travel mode options when the provided travel mode is <code>Truck</code>.
  final RouteMatrixTruckOptions? truck;

  RouteMatrixTravelModeOptions({
    this.car,
    this.scooter,
    this.truck,
  });

  Map<String, dynamic> toJson() {
    final car = this.car;
    final scooter = this.scooter;
    final truck = this.truck;
    return {
      if (car != null) 'Car': car,
      if (scooter != null) 'Scooter': scooter,
      if (truck != null) 'Truck': truck,
    };
  }
}

/// Travel mode options when the provided travel mode is <code>Car</code>.
///
/// @nodoc
class RouteMatrixCarOptions {
  /// The vehicle License Plate.
  final RouteMatrixVehicleLicensePlate? licensePlate;

  /// Maximum speed
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? maxSpeed;

  /// The number of occupants in the vehicle.
  ///
  /// Default value: <code>1</code>
  final int? occupancy;

  RouteMatrixCarOptions({
    this.licensePlate,
    this.maxSpeed,
    this.occupancy,
  });

  Map<String, dynamic> toJson() {
    final licensePlate = this.licensePlate;
    final maxSpeed = this.maxSpeed;
    final occupancy = this.occupancy;
    return {
      if (licensePlate != null) 'LicensePlate': licensePlate,
      if (maxSpeed != null) 'MaxSpeed': maxSpeed,
      if (occupancy != null) 'Occupancy': occupancy,
    };
  }
}

/// Travel mode options when the provided travel mode is <code>Scooter</code>.
///
/// @nodoc
class RouteMatrixScooterOptions {
  /// The vehicle License Plate.
  final RouteMatrixVehicleLicensePlate? licensePlate;

  /// Maximum speed.
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? maxSpeed;

  /// The number of occupants in the vehicle.
  ///
  /// Default value: <code>1</code>
  final int? occupancy;

  RouteMatrixScooterOptions({
    this.licensePlate,
    this.maxSpeed,
    this.occupancy,
  });

  Map<String, dynamic> toJson() {
    final licensePlate = this.licensePlate;
    final maxSpeed = this.maxSpeed;
    final occupancy = this.occupancy;
    return {
      if (licensePlate != null) 'LicensePlate': licensePlate,
      if (maxSpeed != null) 'MaxSpeed': maxSpeed,
      if (occupancy != null) 'Occupancy': occupancy,
    };
  }
}

/// Travel mode options when the provided travel mode is <code>Truck</code>.
///
/// @nodoc
class RouteMatrixTruckOptions {
  /// Total number of axles of the vehicle.
  final int? axleCount;

  /// Gross weight of the vehicle including trailers, and goods at capacity.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? grossWeight;

  /// List of Hazardous cargo contained in the vehicle.
  final List<RouteMatrixHazardousCargoType>? hazardousCargos;

  /// Height of the vehicle.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? height;

  /// Kingpin to rear axle length of the vehicle
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? kpraLength;

  /// Length of the vehicle.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? length;

  /// The vehicle License Plate.
  final RouteMatrixVehicleLicensePlate? licensePlate;

  /// Maximum speed
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? maxSpeed;

  /// The number of occupants in the vehicle.
  ///
  /// Default value: <code>1</code>
  final int? occupancy;

  /// Payload capacity of the vehicle and trailers attached.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? payloadCapacity;

  /// Trailer options corresponding to the vehicle.
  final RouteMatrixTrailerOptions? trailer;

  /// The type of truck: <code>LightTruck</code> for smaller delivery vehicles,
  /// <code> StraightTruck</code> for rigid body trucks, or <code>Tractor</code>
  /// for tractor-trailer combinations.
  final RouteMatrixTruckType? truckType;

  /// The tunnel restriction code.
  ///
  /// Tunnel categories in this list indicate the restrictions which apply to
  /// certain tunnels in Great Britain. They relate to the types of dangerous
  /// goods that can be transported through them.
  ///
  /// <ul>
  /// <li>
  /// <i>Tunnel Category B</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Limited risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Few restrictions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category C</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Medium risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Some restrictions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category D</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: High risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Many restrictions occur
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category E</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Very high risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Restricted tunnel
  /// </li>
  /// </ul> </li>
  /// </ul>
  final String? tunnelRestrictionCode;

  /// Heaviest weight per axle irrespective of the axle type or the axle group.
  /// Meant for usage in countries where the differences in axle types or axle
  /// groups are not distinguished.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? weightPerAxle;

  /// Specifies the total weight for the specified axle group. Meant for usage in
  /// countries that have different regulations based on the axle group type.
  final WeightPerAxleGroup? weightPerAxleGroup;

  /// Width of the vehicle.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? width;

  RouteMatrixTruckOptions({
    this.axleCount,
    this.grossWeight,
    this.hazardousCargos,
    this.height,
    this.kpraLength,
    this.length,
    this.licensePlate,
    this.maxSpeed,
    this.occupancy,
    this.payloadCapacity,
    this.trailer,
    this.truckType,
    this.tunnelRestrictionCode,
    this.weightPerAxle,
    this.weightPerAxleGroup,
    this.width,
  });

  Map<String, dynamic> toJson() {
    final axleCount = this.axleCount;
    final grossWeight = this.grossWeight;
    final hazardousCargos = this.hazardousCargos;
    final height = this.height;
    final kpraLength = this.kpraLength;
    final length = this.length;
    final licensePlate = this.licensePlate;
    final maxSpeed = this.maxSpeed;
    final occupancy = this.occupancy;
    final payloadCapacity = this.payloadCapacity;
    final trailer = this.trailer;
    final truckType = this.truckType;
    final tunnelRestrictionCode = this.tunnelRestrictionCode;
    final weightPerAxle = this.weightPerAxle;
    final weightPerAxleGroup = this.weightPerAxleGroup;
    final width = this.width;
    return {
      if (axleCount != null) 'AxleCount': axleCount,
      if (grossWeight != null) 'GrossWeight': grossWeight,
      if (hazardousCargos != null)
        'HazardousCargos': hazardousCargos.map((e) => e.value).toList(),
      if (height != null) 'Height': height,
      if (kpraLength != null) 'KpraLength': kpraLength,
      if (length != null) 'Length': length,
      if (licensePlate != null) 'LicensePlate': licensePlate,
      if (maxSpeed != null) 'MaxSpeed': maxSpeed,
      if (occupancy != null) 'Occupancy': occupancy,
      if (payloadCapacity != null) 'PayloadCapacity': payloadCapacity,
      if (trailer != null) 'Trailer': trailer,
      if (truckType != null) 'TruckType': truckType.value,
      if (tunnelRestrictionCode != null)
        'TunnelRestrictionCode': tunnelRestrictionCode,
      if (weightPerAxle != null) 'WeightPerAxle': weightPerAxle,
      if (weightPerAxleGroup != null) 'WeightPerAxleGroup': weightPerAxleGroup,
      if (width != null) 'Width': width,
    };
  }
}

/// The vehicle License Plate.
///
/// @nodoc
class RouteMatrixVehicleLicensePlate {
  /// The last character of the License Plate.
  final String? lastCharacter;

  RouteMatrixVehicleLicensePlate({
    this.lastCharacter,
  });

  Map<String, dynamic> toJson() {
    final lastCharacter = this.lastCharacter;
    return {
      if (lastCharacter != null) 'LastCharacter': lastCharacter,
    };
  }
}

/// Trailer options corresponding to the vehicle.
///
/// @nodoc
class RouteMatrixTrailerOptions {
  /// Number of trailers attached to the vehicle.
  ///
  /// Default value: <code>0</code>
  final int? trailerCount;

  RouteMatrixTrailerOptions({
    this.trailerCount,
  });

  Map<String, dynamic> toJson() {
    final trailerCount = this.trailerCount;
    return {
      if (trailerCount != null) 'TrailerCount': trailerCount,
    };
  }
}

/// @nodoc
class RouteMatrixTruckType {
  static const lightTruck = RouteMatrixTruckType._('LightTruck');
  static const straightTruck = RouteMatrixTruckType._('StraightTruck');
  static const tractor = RouteMatrixTruckType._('Tractor');

  final String value;

  const RouteMatrixTruckType._(this.value);

  static const values = [lightTruck, straightTruck, tractor];

  static RouteMatrixTruckType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteMatrixTruckType._(value));

  @override
  bool operator ==(other) =>
      other is RouteMatrixTruckType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouteMatrixHazardousCargoType {
  static const combustible = RouteMatrixHazardousCargoType._('Combustible');
  static const corrosive = RouteMatrixHazardousCargoType._('Corrosive');
  static const explosive = RouteMatrixHazardousCargoType._('Explosive');
  static const flammable = RouteMatrixHazardousCargoType._('Flammable');
  static const gas = RouteMatrixHazardousCargoType._('Gas');
  static const harmfulToWater =
      RouteMatrixHazardousCargoType._('HarmfulToWater');
  static const organic = RouteMatrixHazardousCargoType._('Organic');
  static const other = RouteMatrixHazardousCargoType._('Other');
  static const poison = RouteMatrixHazardousCargoType._('Poison');
  static const poisonousInhalation =
      RouteMatrixHazardousCargoType._('PoisonousInhalation');
  static const radioactive = RouteMatrixHazardousCargoType._('Radioactive');

  final String value;

  const RouteMatrixHazardousCargoType._(this.value);

  static const values = [
    combustible,
    corrosive,
    explosive,
    flammable,
    gas,
    harmfulToWater,
    organic,
    other,
    poison,
    poisonousInhalation,
    radioactive
  ];

  static RouteMatrixHazardousCargoType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteMatrixHazardousCargoType._(value));

  @override
  bool operator ==(other) =>
      other is RouteMatrixHazardousCargoType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The start position for the route in World Geodetic System (WGS 84) format:
/// \[longitude, latitude\].
///
/// @nodoc
class RouteMatrixOrigin {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// Origin related options. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final RouteMatrixOriginOptions? options;

  RouteMatrixOrigin({
    required this.position,
    this.options,
  });

  Map<String, dynamic> toJson() {
    final position = this.position;
    final options = this.options;
    return {
      'Position': position,
      if (options != null) 'Options': options,
    };
  }
}

/// Origin related options.
///
/// @nodoc
class RouteMatrixOriginOptions {
  /// Avoids actions for the provided distance. This is typically to consider for
  /// users in moving vehicles who may not have sufficient time to make an action
  /// at an origin or a destination.
  final int? avoidActionsForDistance;

  /// GPS Heading at the position.
  final double? heading;

  /// Options to configure matching the provided position to the road network.
  final RouteMatrixMatchingOptions? matching;

  /// Options to configure matching the provided position to a side of the street.
  final RouteMatrixSideOfStreetOptions? sideOfStreet;

  RouteMatrixOriginOptions({
    this.avoidActionsForDistance,
    this.heading,
    this.matching,
    this.sideOfStreet,
  });

  Map<String, dynamic> toJson() {
    final avoidActionsForDistance = this.avoidActionsForDistance;
    final heading = this.heading;
    final matching = this.matching;
    final sideOfStreet = this.sideOfStreet;
    return {
      if (avoidActionsForDistance != null)
        'AvoidActionsForDistance': avoidActionsForDistance,
      if (heading != null) 'Heading': heading,
      if (matching != null) 'Matching': matching,
      if (sideOfStreet != null) 'SideOfStreet': sideOfStreet,
    };
  }
}

/// Matching options.
///
/// @nodoc
class RouteMatrixMatchingOptions {
  /// Attempts to match the provided position to a road similar to the provided
  /// name.
  final String? nameHint;

  /// If the distance to a highway/bridge/tunnel/sliproad is within threshold, the
  /// waypoint will be snapped to the highway/bridge/tunnel/sliproad.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int? onRoadThreshold;

  /// Considers all roads within the provided radius to match the provided
  /// destination to. The roads that are considered are determined by the provided
  /// Strategy.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int? radius;

  /// Strategy that defines matching of the position onto the road network.
  /// MatchAny considers all roads possible, whereas MatchMostSignificantRoad
  /// matches to the most significant road.
  final MatchingStrategy? strategy;

  RouteMatrixMatchingOptions({
    this.nameHint,
    this.onRoadThreshold,
    this.radius,
    this.strategy,
  });

  Map<String, dynamic> toJson() {
    final nameHint = this.nameHint;
    final onRoadThreshold = this.onRoadThreshold;
    final radius = this.radius;
    final strategy = this.strategy;
    return {
      if (nameHint != null) 'NameHint': nameHint,
      if (onRoadThreshold != null) 'OnRoadThreshold': onRoadThreshold,
      if (radius != null) 'Radius': radius,
      if (strategy != null) 'Strategy': strategy.value,
    };
  }
}

/// Options to configure matching the provided position to a side of the street.
///
/// @nodoc
class RouteMatrixSideOfStreetOptions {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// Strategy that defines when the side of street position should be used.
  /// AnyStreet will always use the provided position.
  ///
  /// Default value: <code>DividedStreetOnly</code>
  final SideOfStreetMatchingStrategy? useWith;

  RouteMatrixSideOfStreetOptions({
    required this.position,
    this.useWith,
  });

  Map<String, dynamic> toJson() {
    final position = this.position;
    final useWith = this.useWith;
    return {
      'Position': position,
      if (useWith != null) 'UseWith': useWith.value,
    };
  }
}

/// The route destination.
///
/// @nodoc
class RouteMatrixDestination {
  /// Position in World Geodetic System (WGS 84) format: \[longitude, latitude\].
  final List<double> position;

  /// Destination related options. Not supported in <code>ap-southeast-1</code>
  /// and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final RouteMatrixDestinationOptions? options;

  RouteMatrixDestination({
    required this.position,
    this.options,
  });

  Map<String, dynamic> toJson() {
    final position = this.position;
    final options = this.options;
    return {
      'Position': position,
      if (options != null) 'Options': options,
    };
  }
}

/// Options related to the destination.
///
/// @nodoc
class RouteMatrixDestinationOptions {
  /// Avoids actions for the provided distance. This is typically to consider for
  /// users in moving vehicles who may not have sufficient time to make an action
  /// at an origin or a destination.
  final int? avoidActionsForDistance;

  /// GPS Heading at the position.
  final double? heading;

  /// Options to configure matching the provided position to the road network.
  final RouteMatrixMatchingOptions? matching;

  /// Options to configure matching the provided position to a side of the street.
  final RouteMatrixSideOfStreetOptions? sideOfStreet;

  RouteMatrixDestinationOptions({
    this.avoidActionsForDistance,
    this.heading,
    this.matching,
    this.sideOfStreet,
  });

  Map<String, dynamic> toJson() {
    final avoidActionsForDistance = this.avoidActionsForDistance;
    final heading = this.heading;
    final matching = this.matching;
    final sideOfStreet = this.sideOfStreet;
    return {
      if (avoidActionsForDistance != null)
        'AvoidActionsForDistance': avoidActionsForDistance,
      if (heading != null) 'Heading': heading,
      if (matching != null) 'Matching': matching,
      if (sideOfStreet != null) 'SideOfStreet': sideOfStreet,
    };
  }
}

/// Zone categories to be avoided.
///
/// @nodoc
class RouteMatrixAvoidanceZoneCategory {
  /// Zone category to be avoided.
  final RouteMatrixZoneCategory? category;

  RouteMatrixAvoidanceZoneCategory({
    this.category,
  });

  Map<String, dynamic> toJson() {
    final category = this.category;
    return {
      if (category != null) 'Category': category.value,
    };
  }
}

/// @nodoc
class RouteMatrixZoneCategory {
  static const congestionPricing =
      RouteMatrixZoneCategory._('CongestionPricing');
  static const environmental = RouteMatrixZoneCategory._('Environmental');
  static const vignette = RouteMatrixZoneCategory._('Vignette');

  final String value;

  const RouteMatrixZoneCategory._(this.value);

  static const values = [congestionPricing, environmental, vignette];

  static RouteMatrixZoneCategory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteMatrixZoneCategory._(value));

  @override
  bool operator ==(other) =>
      other is RouteMatrixZoneCategory && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Area to be avoided.
///
/// @nodoc
class RouteMatrixAvoidanceArea {
  /// Geometry of the area to be avoided.
  final RouteMatrixAvoidanceAreaGeometry geometry;

  RouteMatrixAvoidanceArea({
    required this.geometry,
  });

  Map<String, dynamic> toJson() {
    final geometry = this.geometry;
    return {
      'Geometry': geometry,
    };
  }
}

/// Geometry of the area to be avoided.
///
/// @nodoc
class RouteMatrixAvoidanceAreaGeometry {
  /// Geometry defined as a bounding box. The first pair represents the X and Y
  /// coordinates (longitude and latitude,) of the southwest corner of the
  /// bounding box; the second pair represents the X and Y coordinates (longitude
  /// and latitude) of the northeast corner.
  final List<double>? boundingBox;

  /// Geometry defined as a polygon with only one linear ring.
  final List<List<List<double>>>? polygon;

  /// A list of Isoline PolylinePolygon, for each isoline PolylinePolygon, it
  /// contains PolylinePolygon of the first linear ring (the outer ring) and from
  /// second item to the last item (the inner rings). For more information on
  /// polyline encoding, see <a
  /// href="https://github.com/aws-geospatial/polyline">https://github.com/aws-geospatial/polyline</a>.
  final List<String>? polylinePolygon;

  RouteMatrixAvoidanceAreaGeometry({
    this.boundingBox,
    this.polygon,
    this.polylinePolygon,
  });

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final polygon = this.polygon;
    final polylinePolygon = this.polylinePolygon;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (polygon != null) 'Polygon': polygon,
      if (polylinePolygon != null) 'PolylinePolygon': polylinePolygon,
    };
  }
}

/// Represents a single reachable area calculated for a specific threshold.
///
/// @nodoc
class Isoline {
  /// Lines connecting separate parts of the reachable area that can be reached
  /// within the same threshold. These occur when areas are reachable but not
  /// contiguous, such as when separated by water or unroutable areas. When
  /// present, these lines represent actual transportation network segments (such
  /// as ferry routes or bridges) that connect the separated areas.
  final List<IsolineConnection> connections;

  /// The shapes that define the reachable area, provided in the requested
  /// geometry format.
  final List<IsolineShapeGeometry> geometries;

  /// The travel distance in meters used to calculate this isoline, if
  /// distance-based thresholds were specified in the request.
  final int? distanceThreshold;

  /// The travel time in seconds used to calculate this isoline, if time-based
  /// thresholds were specified in the request.
  final int? timeThreshold;

  Isoline({
    required this.connections,
    required this.geometries,
    this.distanceThreshold,
    this.timeThreshold,
  });

  factory Isoline.fromJson(Map<String, dynamic> json) {
    return Isoline(
      connections: ((json['Connections'] as List?) ?? const [])
          .nonNulls
          .map((e) => IsolineConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
      geometries: ((json['Geometries'] as List?) ?? const [])
          .nonNulls
          .map((e) => IsolineShapeGeometry.fromJson(e as Map<String, dynamic>))
          .toList(),
      distanceThreshold: json['DistanceThreshold'] as int?,
      timeThreshold: json['TimeThreshold'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final connections = this.connections;
    final geometries = this.geometries;
    final distanceThreshold = this.distanceThreshold;
    final timeThreshold = this.timeThreshold;
    return {
      'Connections': connections,
      'Geometries': geometries,
      if (distanceThreshold != null) 'DistanceThreshold': distanceThreshold,
      if (timeThreshold != null) 'TimeThreshold': timeThreshold,
    };
  }
}

/// Represents the shape of a reachable area. The geometry can be provided
/// either as coordinate pairs (<code>Polygon</code>) or in encoded format
/// (<code>PolylinePolygon</code>), matching the format specified in the
/// request.
///
/// @nodoc
class IsolineShapeGeometry {
  /// A series of coordinate rings defining the reachable area when Simple
  /// geometry format is requested. Each ring is a list of <code>\[longitude,
  /// latitude\]</code> coordinate pairs. The first ring defines the outer
  /// boundary; subsequent rings define holes representing unreachable areas.
  /// <note>
  /// Polygon and PolylinePolygon are mutually exclusive properties.
  /// </note>
  final List<List<List<double>>>? polygon;

  /// An encoded representation of the reachable area when FlexiblePolyline
  /// geometry format is requested. Provides a compact representation suitable for
  /// transmission and storage. The first string defines the outer boundary;
  /// subsequent strings define holes representing unreachable areas. For more
  /// information on polyline encoding, see <a
  /// href="https://github.com/aws-geospatial/polyline">https://github.com/aws-geospatial/polyline</a>.
  /// <note>
  /// Polygon and PolylinePolygon are mutually exclusive properties.
  /// </note>
  final List<String>? polylinePolygon;

  IsolineShapeGeometry({
    this.polygon,
    this.polylinePolygon,
  });

  factory IsolineShapeGeometry.fromJson(Map<String, dynamic> json) {
    return IsolineShapeGeometry(
      polygon: (json['Polygon'] as List?)
          ?.nonNulls
          .map((e) => (e as List)
              .nonNulls
              .map((e) => (e as List).nonNulls.map((e) => e as double).toList())
              .toList())
          .toList(),
      polylinePolygon: (json['PolylinePolygon'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final polygon = this.polygon;
    final polylinePolygon = this.polylinePolygon;
    return {
      if (polygon != null) 'Polygon': polygon,
      if (polylinePolygon != null) 'PolylinePolygon': polylinePolygon,
    };
  }
}

/// Represents a segment of the transportation network that connects separate
/// parts of a reachable area. These connections show how discontinuous areas
/// are linked, such as by ferry routes or bridges crossing unroutable terrain.
///
/// @nodoc
class IsolineConnection {
  /// The index of the starting polygon in the isoline's <code>Geometries</code>
  /// list.
  final int fromPolygonIndex;

  /// The shape of the connection, representing the actual path through the
  /// transportation network that links the polygons.
  final IsolineConnectionGeometry geometry;

  /// The index of the ending polygon in the isoline's <code>Geometries</code>
  /// list.
  final int toPolygonIndex;

  IsolineConnection({
    required this.fromPolygonIndex,
    required this.geometry,
    required this.toPolygonIndex,
  });

  factory IsolineConnection.fromJson(Map<String, dynamic> json) {
    return IsolineConnection(
      fromPolygonIndex: (json['FromPolygonIndex'] as int?) ?? 0,
      geometry: IsolineConnectionGeometry.fromJson(
          (json['Geometry'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      toPolygonIndex: (json['ToPolygonIndex'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final fromPolygonIndex = this.fromPolygonIndex;
    final geometry = this.geometry;
    final toPolygonIndex = this.toPolygonIndex;
    return {
      'FromPolygonIndex': fromPolygonIndex,
      'Geometry': geometry,
      'ToPolygonIndex': toPolygonIndex,
    };
  }
}

/// Represents the geometry of connections between non-contiguous parts of an
/// isoline. These connections can be provided in either coordinate pairs
/// (LineString) or encoded (Polyline) format, matching the format specified in
/// the request.
///
/// @nodoc
class IsolineConnectionGeometry {
  /// A series of <code>\[longitude, latitude\]</code> coordinate pairs defining
  /// the connection path when <code>Simple</code> geometry format is requested.
  /// These coordinates can be directly used as the coordinates array in a GeoJSON
  /// LineString without transformation.
  /// <note>
  /// LineString and Polyline are mutually exclusive properties.
  /// </note>
  final List<List<double>>? lineString;

  /// An encoded representation of the connection path when
  /// <code>FlexiblePolyline</code> geometry format is requested. This provides a
  /// more compact representation suitable for transmission and storage. To
  /// convert to GeoJSON, first decode to obtain coordinate pairs, then use those
  /// coordinates as the coordinates array in a GeoJSON LineString.
  /// <note>
  /// LineString and Polyline are mutually exclusive properties.
  /// </note>
  final String? polyline;

  IsolineConnectionGeometry({
    this.lineString,
    this.polyline,
  });

  factory IsolineConnectionGeometry.fromJson(Map<String, dynamic> json) {
    return IsolineConnectionGeometry(
      lineString: (json['LineString'] as List?)
          ?.nonNulls
          .map((e) => (e as List).nonNulls.map((e) => e as double).toList())
          .toList(),
      polyline: json['Polyline'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lineString = this.lineString;
    final polyline = this.polyline;
    return {
      if (lineString != null) 'LineString': lineString,
      if (polyline != null) 'Polyline': polyline,
    };
  }
}

/// Special road types or features that should be considered available for
/// routing. For example, this attribute can be used to allow the use of HOV
/// (high-occupancy vehicle) or HOT (high-occupancy toll) lanes, even if they
/// would otherwise not be.
///
/// @nodoc
class IsolineAllowOptions {
  /// When true, allows the use of HOT (high-occupancy toll) lanes, which may
  /// affect travel times and reachable areas.
  ///
  /// Default value: <code>false</code>
  final bool? hot;

  /// When true, allows the use of HOV (high-occupancy vehicle) lanes, which may
  /// affect travel times and reachable areas.
  ///
  /// Default value: <code>false</code>
  final bool? hov;

  IsolineAllowOptions({
    this.hot,
    this.hov,
  });

  Map<String, dynamic> toJson() {
    final hot = this.hot;
    final hov = this.hov;
    return {
      if (hot != null) 'Hot': hot,
      if (hov != null) 'Hov': hov,
    };
  }
}

/// Specifies features of the road network to avoid when calculating reachable
/// areas. These preferences guide route calculations but may be overridden when
/// no reasonable alternative exists. For example, if avoiding toll roads would
/// make an area unreachable, toll roads may still be used.
///
/// Avoidance options include physical features (like ferries and tunnels), road
/// characteristics (like dirt roads and highways), and regulated areas (like
/// congestion zones). They can be combined to match specific routing needs,
/// such as avoiding both toll roads and ferries.
///
/// @nodoc
class IsolineAvoidanceOptions {
  /// Specifies geographic areas to avoid where possible. Routes may still pass
  /// through these areas if no reasonable alternative exists.
  final List<IsolineAvoidanceArea>? areas;

  /// Indicates a preference to avoid car shuttle trains (auto trains) where
  /// possible. These may still be included if no reasonable alternative route
  /// exists.
  final bool? carShuttleTrains;

  /// Indicates a preference to avoid controlled-access highways (such as
  /// interstate highways or motorways) where possible. If a viable route cannot
  /// be calculated using only local roads, controlled-access highways may still
  /// be included.
  final bool? controlledAccessHighways;

  /// Indicates a preference to avoid unpaved or dirt roads where possible. Routes
  /// may still include dirt roads if no reasonable paved alternative exists.
  final bool? dirtRoads;

  /// Indicates a preference to avoid ferries where possible. If a viable route
  /// cannot be calculated without using ferries, they may still be included.
  final bool? ferries;

  /// Indicates a preference to avoid roads that may be subject to seasonal
  /// closures where possible. These roads may still be included if no reasonable
  /// year-round alternative exists.
  final bool? seasonalClosure;

  /// Indicates a preference to avoid toll roads where possible. If a viable route
  /// cannot be calculated without using toll roads, they may still be included.
  final bool? tollRoads;

  /// Indicates a preference to avoid roads that require electronic toll
  /// collection transponders where possible. These roads may still be included if
  /// no viable alternative route exists.
  final bool? tollTransponders;

  /// For truck travel modes, indicates specific road classification types in
  /// Sweden (<code> BK1</code> through <code>BK4</code>) and Mexico (<code>A2,
  /// A4, B2, B4, C, D, ET2, ET4</code>) to avoid where possible. These road types
  /// may still be used if no reasonable alternative exists.
  /// <note>
  /// There are currently no other supported values as of 26th April 2024.
  /// </note>
  final List<String>? truckRoadTypes;

  /// Indicates a preference to avoid tunnels where possible. If a viable route
  /// cannot be calculated without using tunnels, they may still be included.
  final bool? tunnels;

  /// Indicates a preference to avoid U-turns where possible. U-turns may still be
  /// included if necessary to reach certain areas or when no reasonable
  /// alternative exists.
  final bool? uTurns;

  /// Indicates types of regulated zones (such as congestion pricing or
  /// environmental zones) to avoid where possible. Routes may still pass through
  /// these zones if no reasonable alternative exists.
  final List<IsolineAvoidanceZoneCategory>? zoneCategories;

  IsolineAvoidanceOptions({
    this.areas,
    this.carShuttleTrains,
    this.controlledAccessHighways,
    this.dirtRoads,
    this.ferries,
    this.seasonalClosure,
    this.tollRoads,
    this.tollTransponders,
    this.truckRoadTypes,
    this.tunnels,
    this.uTurns,
    this.zoneCategories,
  });

  Map<String, dynamic> toJson() {
    final areas = this.areas;
    final carShuttleTrains = this.carShuttleTrains;
    final controlledAccessHighways = this.controlledAccessHighways;
    final dirtRoads = this.dirtRoads;
    final ferries = this.ferries;
    final seasonalClosure = this.seasonalClosure;
    final tollRoads = this.tollRoads;
    final tollTransponders = this.tollTransponders;
    final truckRoadTypes = this.truckRoadTypes;
    final tunnels = this.tunnels;
    final uTurns = this.uTurns;
    final zoneCategories = this.zoneCategories;
    return {
      if (areas != null) 'Areas': areas,
      if (carShuttleTrains != null) 'CarShuttleTrains': carShuttleTrains,
      if (controlledAccessHighways != null)
        'ControlledAccessHighways': controlledAccessHighways,
      if (dirtRoads != null) 'DirtRoads': dirtRoads,
      if (ferries != null) 'Ferries': ferries,
      if (seasonalClosure != null) 'SeasonalClosure': seasonalClosure,
      if (tollRoads != null) 'TollRoads': tollRoads,
      if (tollTransponders != null) 'TollTransponders': tollTransponders,
      if (truckRoadTypes != null) 'TruckRoadTypes': truckRoadTypes,
      if (tunnels != null) 'Tunnels': tunnels,
      if (uTurns != null) 'UTurns': uTurns,
      if (zoneCategories != null) 'ZoneCategories': zoneCategories,
    };
  }
}

/// Options that control how the destination point is interpreted and matched to
/// the road network when calculating reachable areas. This affects which roads
/// are considered accessible near the destination and how the final approach is
/// calculated.
///
/// @nodoc
class IsolineDestinationOptions {
  /// The distance in meters from the destination point within which certain
  /// routing actions (such as U-turns or left turns across traffic) are
  /// restricted. This helps generate more practical routes by avoiding
  /// potentially dangerous maneuvers near the endpoint.
  final int? avoidActionsForDistance;

  /// The initial direction of travel in degrees (0-360, where 0 is north). This
  /// can affect which road segments are considered accessible from the starting
  /// point.
  final double? heading;

  /// Controls how the destination point is matched to the road network, including
  /// search radius and name-based matching preferences.
  final IsolineMatchingOptions? matching;

  /// Specifies which side of the street should be considered accessible, which is
  /// important when building entrances or parking access points are only
  /// reachable from one side of the road.
  final IsolineSideOfStreetOptions? sideOfStreet;

  IsolineDestinationOptions({
    this.avoidActionsForDistance,
    this.heading,
    this.matching,
    this.sideOfStreet,
  });

  Map<String, dynamic> toJson() {
    final avoidActionsForDistance = this.avoidActionsForDistance;
    final heading = this.heading;
    final matching = this.matching;
    final sideOfStreet = this.sideOfStreet;
    return {
      if (avoidActionsForDistance != null)
        'AvoidActionsForDistance': avoidActionsForDistance,
      if (heading != null) 'Heading': heading,
      if (matching != null) 'Matching': matching,
      if (sideOfStreet != null) 'SideOfStreet': sideOfStreet,
    };
  }
}

/// Controls the detail level and smoothness of generated isolines. More
/// detailed isolines provide better visual representation of reachable areas
/// but require more processing time and result in larger responses.
///
/// @nodoc
class IsolineGranularityOptions {
  /// The maximum number of points used to define each isoline. Higher values
  /// create smoother, more detailed shapes.
  final int? maxPoints;

  /// The maximum distance in meters between points along the isoline. Smaller
  /// values create more detailed shapes.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int? maxResolution;

  IsolineGranularityOptions({
    this.maxPoints,
    this.maxResolution,
  });

  Map<String, dynamic> toJson() {
    final maxPoints = this.maxPoints;
    final maxResolution = this.maxResolution;
    return {
      if (maxPoints != null) 'MaxPoints': maxPoints,
      if (maxResolution != null) 'MaxResolution': maxResolution,
    };
  }
}

/// @nodoc
class IsolineOptimizationObjective {
  static const accurateCalculation =
      IsolineOptimizationObjective._('AccurateCalculation');
  static const balancedCalculation =
      IsolineOptimizationObjective._('BalancedCalculation');
  static const fastCalculation =
      IsolineOptimizationObjective._('FastCalculation');

  final String value;

  const IsolineOptimizationObjective._(this.value);

  static const values = [
    accurateCalculation,
    balancedCalculation,
    fastCalculation
  ];

  static IsolineOptimizationObjective fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IsolineOptimizationObjective._(value));

  @override
  bool operator ==(other) =>
      other is IsolineOptimizationObjective && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Options that control how the origin point is interpreted when calculating
/// reachable areas. These options affect which roads are considered accessible
/// from the starting point and how initial routing decisions are made.
///
/// @nodoc
class IsolineOriginOptions {
  /// The distance in meters from the origin point within which certain routing
  /// actions (such as U-turns or left turns across traffic) are restricted. This
  /// helps generate more practical routes by avoiding potentially dangerous
  /// maneuvers near the starting point.
  final int? avoidActionsForDistance;

  /// Initial direction of travel in degrees (0-360, where 0 is north). This
  /// affects which road segments are considered accessible from the starting
  /// point and is particularly useful when the origin is on a divided road or at
  /// a complex intersection.
  final double? heading;

  /// Controls how the origin point is matched to the road network, including
  /// search radius and matching strategy.
  final IsolineMatchingOptions? matching;

  /// Controls which side of the street is considered accessible from the origin
  /// point, particularly important for divided roads where building entrances or
  /// parking access may only be available from one direction.
  final IsolineSideOfStreetOptions? sideOfStreet;

  IsolineOriginOptions({
    this.avoidActionsForDistance,
    this.heading,
    this.matching,
    this.sideOfStreet,
  });

  Map<String, dynamic> toJson() {
    final avoidActionsForDistance = this.avoidActionsForDistance;
    final heading = this.heading;
    final matching = this.matching;
    final sideOfStreet = this.sideOfStreet;
    return {
      if (avoidActionsForDistance != null)
        'AvoidActionsForDistance': avoidActionsForDistance,
      if (heading != null) 'Heading': heading,
      if (matching != null) 'Matching': matching,
      if (sideOfStreet != null) 'SideOfStreet': sideOfStreet,
    };
  }
}

/// Specifies the time or distance limits used to calculate reachable areas. You
/// can provide up to five thresholds for a single type to generate multiple
/// isolines in a single request. For example, you might request areas reachable
/// within 5, 10, and 15 minutes, or within 1, 2, and 5 kilometers.
///
/// @nodoc
class IsolineThresholds {
  /// List of travel distances in meters. For example, \[1000, 2000, 5000\] would
  /// calculate areas reachable within 1, 2, and 5 kilometers.
  final List<int>? distance;

  /// List of travel times in seconds. For example, \[300, 600, 900\] would
  /// calculate areas reachable within 5, 10, and 15 minutes.
  final List<int>? time;

  IsolineThresholds({
    this.distance,
    this.time,
  });

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final time = this.time;
    return {
      if (distance != null) 'Distance': distance,
      if (time != null) 'Time': time,
    };
  }
}

/// Controls how real-time and historical traffic data is used when calculating
/// reachable areas. This affects both the size and shape of isolines by
/// accounting for expected travel speeds based on congestion patterns.
///
/// @nodoc
class IsolineTrafficOptions {
  /// The duration in seconds that real-time congestion data is considered valid
  /// before reverting to historical traffic patterns. This helps balance between
  /// using current conditions and more predictable historical data when
  /// calculating travel times.
  ///
  /// <b>Unit</b>: <code>seconds</code>
  final int? flowEventThresholdOverride;

  /// Controls whether traffic data is used in calculations.
  /// <code>UseTrafficData</code> considers both real-time congestion and
  /// historical patterns, while <code>IgnoreTrafficData</code> calculates routes
  /// based solely on road types and speed limits. Using traffic data provides
  /// more accurate real-world estimates but may produce different results at
  /// different times of day.
  ///
  /// Default value: <code>UseTrafficData</code>
  final TrafficUsage? usage;

  IsolineTrafficOptions({
    this.flowEventThresholdOverride,
    this.usage,
  });

  Map<String, dynamic> toJson() {
    final flowEventThresholdOverride = this.flowEventThresholdOverride;
    final usage = this.usage;
    return {
      if (flowEventThresholdOverride != null)
        'FlowEventThresholdOverride': flowEventThresholdOverride,
      if (usage != null) 'Usage': usage.value,
    };
  }
}

/// @nodoc
class IsolineTravelMode {
  static const car = IsolineTravelMode._('Car');
  static const pedestrian = IsolineTravelMode._('Pedestrian');
  static const scooter = IsolineTravelMode._('Scooter');
  static const truck = IsolineTravelMode._('Truck');

  final String value;

  const IsolineTravelMode._(this.value);

  static const values = [car, pedestrian, scooter, truck];

  static IsolineTravelMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IsolineTravelMode._(value));

  @override
  bool operator ==(other) => other is IsolineTravelMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Mode-specific routing options that further refine how reachable areas are
/// calculated. Options are only considered when they match the selected travel
/// mode.
///
/// @nodoc
class IsolineTravelModeOptions {
  /// Options specific to passenger vehicle routing (<code>Car</code>, such as
  /// vehicle characteristics and license plate restrictions.
  final IsolineCarOptions? car;

  /// Options specific to scooter routing (<code>Scooter</code>, such as vehicle
  /// characteristics and license plate restrictions.
  /// <note>
  /// When using the <code>Scooter</code> travel mode, controlled-access highways
  /// are automatically avoided unless explicitly allowed.
  /// </note>
  final IsolineScooterOptions? scooter;

  /// Options specific to commercial truck routing (<code>Truck</code>, including
  /// vehicle dimensions, weight limits, and hazardous cargo specifications.
  final IsolineTruckOptions? truck;

  IsolineTravelModeOptions({
    this.car,
    this.scooter,
    this.truck,
  });

  Map<String, dynamic> toJson() {
    final car = this.car;
    final scooter = this.scooter;
    final truck = this.truck;
    return {
      if (car != null) 'Car': car,
      if (scooter != null) 'Scooter': scooter,
      if (truck != null) 'Truck': truck,
    };
  }
}

/// Vehicle characteristics and preferences that affect routing for passenger
/// cars. This includes vehicle type, occupancy, and speed restrictions that may
/// influence which roads can be used and expected travel times.
///
/// @nodoc
class IsolineCarOptions {
  /// The type of engine powering the vehicle, which may affect route calculation
  /// due to road restrictions or vehicle characteristics.
  ///
  /// <ul>
  /// <li>
  /// <code>INTERNAL_COMBUSTION</code>—Standard gasoline or diesel engine.
  /// </li>
  /// <li>
  /// <code>ELECTRIC</code>—Battery electric vehicle.
  /// </li>
  /// <li>
  /// <code>PLUGIN_HYBRID</code>—Combination of electric and internal combustion
  /// engines with plug-in charging capability.
  /// </li>
  /// </ul>
  final IsolineEngineType? engineType;

  /// License plate information used in regions where road access or routing
  /// restrictions are based on license plate numbers.
  final IsolineVehicleLicensePlate? licensePlate;

  /// The maximum speed of the vehicle in kilometers per hour. When specified,
  /// routes will not include roads with higher speed limits. Valid values range
  /// from 3.6 km/h (1 m/s) to 252 km/h (70 m/s).
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? maxSpeed;

  /// The number of occupants in the vehicle. This can affect route calculations
  /// by enabling the use of high-occupancy vehicle (HOV) lanes where minimum
  /// occupancy requirements are met.
  ///
  /// Default value: <code>1</code>
  final int? occupancy;

  IsolineCarOptions({
    this.engineType,
    this.licensePlate,
    this.maxSpeed,
    this.occupancy,
  });

  Map<String, dynamic> toJson() {
    final engineType = this.engineType;
    final licensePlate = this.licensePlate;
    final maxSpeed = this.maxSpeed;
    final occupancy = this.occupancy;
    return {
      if (engineType != null) 'EngineType': engineType.value,
      if (licensePlate != null) 'LicensePlate': licensePlate,
      if (maxSpeed != null) 'MaxSpeed': maxSpeed,
      if (occupancy != null) 'Occupancy': occupancy,
    };
  }
}

/// Vehicle characteristics that affect which roads and paths can be used when
/// calculating reachable areas for scooters. This includes areas such as bike
/// lanes, shared paths, and roads where scooters are permitted.
///
/// @nodoc
class IsolineScooterOptions {
  /// The type of engine powering the vehicle, which may affect route calculation
  /// due to road restrictions or vehicle characteristics.
  ///
  /// <ul>
  /// <li>
  /// <code>INTERNAL_COMBUSTION</code>—Standard gasoline or diesel engine.
  /// </li>
  /// <li>
  /// <code>ELECTRIC</code>—Battery electric vehicle.
  /// </li>
  /// <li>
  /// <code>PLUGIN_HYBRID</code>—Combination of electric and internal combustion
  /// engines with plug-in charging capability.
  /// </li>
  /// </ul>
  final IsolineEngineType? engineType;

  /// License plate information used in regions where road access or routing
  /// restrictions are based on license plate numbers.
  final IsolineVehicleLicensePlate? licensePlate;

  /// The maximum speed of the vehicle in kilometers per hour. When specified,
  /// routes will not include roads with higher speed limits. Valid values range
  /// from 3.6 km/h (1 m/s) to 252 km/h (70 m/s).
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? maxSpeed;

  /// The number of occupants in the vehicle. This can affect route calculations
  /// by enabling the use of high-occupancy vehicle (HOV) lanes where minimum
  /// occupancy requirements are met.
  ///
  /// Default value: <code>1</code>
  final int? occupancy;

  IsolineScooterOptions({
    this.engineType,
    this.licensePlate,
    this.maxSpeed,
    this.occupancy,
  });

  Map<String, dynamic> toJson() {
    final engineType = this.engineType;
    final licensePlate = this.licensePlate;
    final maxSpeed = this.maxSpeed;
    final occupancy = this.occupancy;
    return {
      if (engineType != null) 'EngineType': engineType.value,
      if (licensePlate != null) 'LicensePlate': licensePlate,
      if (maxSpeed != null) 'MaxSpeed': maxSpeed,
      if (occupancy != null) 'Occupancy': occupancy,
    };
  }
}

/// Vehicle characteristics and restrictions that affect which roads can be used
/// when calculating reachable areas for trucks. These details ensure that
/// routes respect physical limitations and legal requirements.
///
/// These apply when the provided travel mode is <code>Truck</code>
///
/// @nodoc
class IsolineTruckOptions {
  /// The total number of axles on the vehicle. Required for certain road
  /// restrictions and weight limit calculations.
  final int? axleCount;

  /// The type of engine powering the vehicle, which may affect route calculation
  /// due to road restrictions or vehicle characteristics.
  ///
  /// <ul>
  /// <li>
  /// <code>INTERNAL_COMBUSTION</code>—Standard gasoline or diesel engine.
  /// </li>
  /// <li>
  /// <code>ELECTRIC</code>—Battery electric vehicle.
  /// </li>
  /// <li>
  /// <code>PLUGIN_HYBRID</code>—Combination of electric and internal combustion
  /// engines with plug-in charging capability.
  /// </li>
  /// </ul>
  final IsolineEngineType? engineType;

  /// The gross vehicle weight (the maximum weight a vehicle can safely operate
  /// at, as specified by the manufacturer) in kilograms. Used to avoid roads with
  /// weight restrictions and ensure compliance with maximum allowed vehicle
  /// weight regulations.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? grossWeight;

  /// Types of hazardous materials being transported. This affects which roads and
  /// tunnels can be used based on local regulations.
  ///
  /// <ul>
  /// <li>
  /// <code>Combustible</code>—Materials that can burn readily
  /// </li>
  /// <li>
  /// <code>Corrosive</code>—Materials that can destroy or irreversibly damage
  /// other substances
  /// </li>
  /// <li>
  /// <code>Explosive</code>—Materials that can produce an explosion by chemical
  /// reaction
  /// </li>
  /// <li>
  /// <code>Flammable</code>—Materials that can easily ignite
  /// </li>
  /// <li>
  /// <code>Gas</code>—Hazardous materials in gaseous form
  /// </li>
  /// <li>
  /// <code>HarmfulToWater</code>—Materials that pose a risk to water sources if
  /// released
  /// </li>
  /// <li>
  /// <code>Organic</code>—Hazardous organic compounds
  /// </li>
  /// <li>
  /// <code>Other</code>—Hazardous materials not covered by other categories
  /// </li>
  /// <li>
  /// <code>Poison</code>—Toxic materials
  /// </li>
  /// <li>
  /// <code>PoisonousInhalation</code>—Materials that are toxic when inhaled
  /// </li>
  /// <li>
  /// <code>Radioactive</code>—Materials that emit ionizing radiation
  /// </li>
  /// </ul>
  final List<IsolineHazardousCargoType>? hazardousCargos;

  /// The vehicle height in centimeters. Used to avoid routes with low bridges or
  /// other height restrictions.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? height;

  /// The height in centimeters measured from the ground to the highest point
  /// above the first axle. Used for specific bridge and tunnel clearance
  /// restrictions.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? heightAboveFirstAxle;

  /// The kingpin to rear axle (KPRA) length in centimeters. Used to determine if
  /// the vehicle can safely navigate turns and intersections.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? kpraLength;

  /// The total vehicle length in centimeters. Used to avoid roads with length
  /// restrictions and determine if the vehicle can safely navigate turns.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? length;

  /// License plate information used in regions where road access or routing
  /// restrictions are based on license plate numbers.
  final IsolineVehicleLicensePlate? licensePlate;

  /// The maximum speed in kilometers per hour at which the vehicle can or is
  /// permitted to travel. This affects travel time calculations and may result in
  /// different reachable areas compared to using default speed limits. Value must
  /// be between 3.6 and 252 kilometers per hour.
  ///
  /// <b>Unit</b>: <code>kilometers per hour</code>
  final double? maxSpeed;

  /// The number of occupants in the vehicle. This can affect route calculations
  /// by enabling the use of high-occupancy vehicle (HOV) lanes where minimum
  /// occupancy requirements are met.
  ///
  /// Default value: <code>1</code>
  final int? occupancy;

  /// The maximum cargo weight in kilograms that the vehicle (including attached
  /// trailers) is rated to carry.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? payloadCapacity;

  /// The total number of tires on the vehicle.
  final int? tireCount;

  /// Optional specifications for attached trailers. When provided, trailer
  /// characteristics affect route calculations to ensure compliance with
  /// trailer-specific restrictions such as length limits, weight distribution
  /// requirements, and access restrictions for multi-trailer configurations.
  final IsolineTrailerOptions? trailer;

  /// The type of truck: <code>LightTruck</code> for smaller delivery vehicles,
  /// <code> StraightTruck </code> for rigid body trucks, or <code>Tractor</code>
  /// for tractor-trailer combinations.
  final IsolineTruckType? truckType;

  /// The tunnel restriction code.
  ///
  /// Tunnel categories in this list indicate the restrictions which apply to
  /// certain tunnels in Great Britain. They relate to the types of dangerous
  /// goods that can be transported through them.
  ///
  /// <ul>
  /// <li>
  /// <i>Tunnel Category B</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Limited risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Few restrictions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category C</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Medium risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Some restrictions
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category D</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: High risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Many restrictions occur
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>Tunnel Category E</i>
  ///
  /// <ul>
  /// <li>
  /// <i>Risk Level</i>: Very high risk
  /// </li>
  /// <li>
  /// <i>Restrictions</i>: Restricted tunnel
  /// </li>
  /// </ul> </li>
  /// </ul>
  final String? tunnelRestrictionCode;

  /// The heaviest weight per axle in kilograms, regardless of axle type or
  /// grouping. Used for roads with axle-weight restrictions in regions where
  /// regulations don't distinguish between different axle configurations.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final int? weightPerAxle;

  /// Specifies the total weight for different axle group configurations. Used in
  /// regions where regulations set different weight limits based on axle group
  /// types.
  ///
  /// <b>Unit</b>: <code>kilograms</code>
  final WeightPerAxleGroup? weightPerAxleGroup;

  /// The vehicle width in centimeters. Used to avoid routes with width
  /// restrictions.
  ///
  /// <b>Unit</b>: <code>centimeters</code>
  final int? width;

  IsolineTruckOptions({
    this.axleCount,
    this.engineType,
    this.grossWeight,
    this.hazardousCargos,
    this.height,
    this.heightAboveFirstAxle,
    this.kpraLength,
    this.length,
    this.licensePlate,
    this.maxSpeed,
    this.occupancy,
    this.payloadCapacity,
    this.tireCount,
    this.trailer,
    this.truckType,
    this.tunnelRestrictionCode,
    this.weightPerAxle,
    this.weightPerAxleGroup,
    this.width,
  });

  Map<String, dynamic> toJson() {
    final axleCount = this.axleCount;
    final engineType = this.engineType;
    final grossWeight = this.grossWeight;
    final hazardousCargos = this.hazardousCargos;
    final height = this.height;
    final heightAboveFirstAxle = this.heightAboveFirstAxle;
    final kpraLength = this.kpraLength;
    final length = this.length;
    final licensePlate = this.licensePlate;
    final maxSpeed = this.maxSpeed;
    final occupancy = this.occupancy;
    final payloadCapacity = this.payloadCapacity;
    final tireCount = this.tireCount;
    final trailer = this.trailer;
    final truckType = this.truckType;
    final tunnelRestrictionCode = this.tunnelRestrictionCode;
    final weightPerAxle = this.weightPerAxle;
    final weightPerAxleGroup = this.weightPerAxleGroup;
    final width = this.width;
    return {
      if (axleCount != null) 'AxleCount': axleCount,
      if (engineType != null) 'EngineType': engineType.value,
      if (grossWeight != null) 'GrossWeight': grossWeight,
      if (hazardousCargos != null)
        'HazardousCargos': hazardousCargos.map((e) => e.value).toList(),
      if (height != null) 'Height': height,
      if (heightAboveFirstAxle != null)
        'HeightAboveFirstAxle': heightAboveFirstAxle,
      if (kpraLength != null) 'KpraLength': kpraLength,
      if (length != null) 'Length': length,
      if (licensePlate != null) 'LicensePlate': licensePlate,
      if (maxSpeed != null) 'MaxSpeed': maxSpeed,
      if (occupancy != null) 'Occupancy': occupancy,
      if (payloadCapacity != null) 'PayloadCapacity': payloadCapacity,
      if (tireCount != null) 'TireCount': tireCount,
      if (trailer != null) 'Trailer': trailer,
      if (truckType != null) 'TruckType': truckType.value,
      if (tunnelRestrictionCode != null)
        'TunnelRestrictionCode': tunnelRestrictionCode,
      if (weightPerAxle != null) 'WeightPerAxle': weightPerAxle,
      if (weightPerAxleGroup != null) 'WeightPerAxleGroup': weightPerAxleGroup,
      if (width != null) 'Width': width,
    };
  }
}

/// @nodoc
class IsolineEngineType {
  static const electric = IsolineEngineType._('Electric');
  static const internalCombustion = IsolineEngineType._('InternalCombustion');
  static const pluginHybrid = IsolineEngineType._('PluginHybrid');

  final String value;

  const IsolineEngineType._(this.value);

  static const values = [electric, internalCombustion, pluginHybrid];

  static IsolineEngineType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IsolineEngineType._(value));

  @override
  bool operator ==(other) => other is IsolineEngineType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// License plate information used in regions where road access or routing
/// restrictions are based on license plate numbers.
///
/// @nodoc
class IsolineVehicleLicensePlate {
  /// The last character of the vehicle's license plate. Used to determine road
  /// access restrictions in regions with license plate-based traffic management
  /// systems.
  final String? lastCharacter;

  IsolineVehicleLicensePlate({
    this.lastCharacter,
  });

  Map<String, dynamic> toJson() {
    final lastCharacter = this.lastCharacter;
    return {
      if (lastCharacter != null) 'LastCharacter': lastCharacter,
    };
  }
}

/// Additional specifications when the vehicle includes one or more trailers.
///
/// @nodoc
class IsolineTrailerOptions {
  /// The total number of axles across all trailers. Used for weight distribution
  /// calculations and road restrictions.
  final int? axleCount;

  /// The number of trailers being pulled. Affects which roads can be used based
  /// on local regulations.
  ///
  /// Default value: <code>0</code>
  final int? trailerCount;

  IsolineTrailerOptions({
    this.axleCount,
    this.trailerCount,
  });

  Map<String, dynamic> toJson() {
    final axleCount = this.axleCount;
    final trailerCount = this.trailerCount;
    return {
      if (axleCount != null) 'AxleCount': axleCount,
      if (trailerCount != null) 'TrailerCount': trailerCount,
    };
  }
}

/// @nodoc
class IsolineTruckType {
  static const lightTruck = IsolineTruckType._('LightTruck');
  static const straightTruck = IsolineTruckType._('StraightTruck');
  static const tractor = IsolineTruckType._('Tractor');

  final String value;

  const IsolineTruckType._(this.value);

  static const values = [lightTruck, straightTruck, tractor];

  static IsolineTruckType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IsolineTruckType._(value));

  @override
  bool operator ==(other) => other is IsolineTruckType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class IsolineHazardousCargoType {
  static const combustible = IsolineHazardousCargoType._('Combustible');
  static const corrosive = IsolineHazardousCargoType._('Corrosive');
  static const explosive = IsolineHazardousCargoType._('Explosive');
  static const flammable = IsolineHazardousCargoType._('Flammable');
  static const gas = IsolineHazardousCargoType._('Gas');
  static const harmfulToWater = IsolineHazardousCargoType._('HarmfulToWater');
  static const organic = IsolineHazardousCargoType._('Organic');
  static const other = IsolineHazardousCargoType._('Other');
  static const poison = IsolineHazardousCargoType._('Poison');
  static const poisonousInhalation =
      IsolineHazardousCargoType._('PoisonousInhalation');
  static const radioactive = IsolineHazardousCargoType._('Radioactive');

  final String value;

  const IsolineHazardousCargoType._(this.value);

  static const values = [
    combustible,
    corrosive,
    explosive,
    flammable,
    gas,
    harmfulToWater,
    organic,
    other,
    poison,
    poisonousInhalation,
    radioactive
  ];

  static IsolineHazardousCargoType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IsolineHazardousCargoType._(value));

  @override
  bool operator ==(other) =>
      other is IsolineHazardousCargoType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Controls how origin and destination points are matched to the road network
/// when they don't fall exactly on a road. Matching options help ensure
/// realistic routing by connecting points to appropriate roads.
///
/// @nodoc
class IsolineMatchingOptions {
  /// The expected street name near the point. Helps disambiguate matching when
  /// multiple roads are within range.
  final String? nameHint;

  /// The maximum distance in meters that a point can be from a road while still
  /// being considered "on" that road. Points further than this distance require
  /// explicit matching.
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int? onRoadThreshold;

  /// The maximum distance in meters to search for roads to match to. Points with
  /// no roads within this radius will fail to match. The roads that are
  /// considered within this radius are determined by the specified
  /// <code>Strategy</code>
  ///
  /// <b>Unit</b>: <code>meters</code>
  final int? radius;

  /// Determines how points are matched to the road network. <code>MatchAny</code>
  /// finds the nearest viable road segment, while
  /// <code>MatchMostSignificantRoad</code> prioritizes major roads.
  final MatchingStrategy? strategy;

  IsolineMatchingOptions({
    this.nameHint,
    this.onRoadThreshold,
    this.radius,
    this.strategy,
  });

  Map<String, dynamic> toJson() {
    final nameHint = this.nameHint;
    final onRoadThreshold = this.onRoadThreshold;
    final radius = this.radius;
    final strategy = this.strategy;
    return {
      if (nameHint != null) 'NameHint': nameHint,
      if (onRoadThreshold != null) 'OnRoadThreshold': onRoadThreshold,
      if (radius != null) 'Radius': radius,
      if (strategy != null) 'Strategy': strategy.value,
    };
  }
}

/// Controls how points are matched to specific sides of streets. This is
/// important when the side of the street matters for accessibility - for
/// example, when building entrances or parking lot access points can only be
/// reached from one side of a divided road.
///
/// @nodoc
class IsolineSideOfStreetOptions {
  /// The <code>\[longitude, latitude\]</code> coordinates of the point that
  /// should be matched to a specific side of the street.
  final List<double> position;

  /// Controls whether side-of-street matching is applied to any street
  /// (<code>AnyStreet</code>) or only to divided roads
  /// (<code>DividedStreetOnly</code>). This is important when the exact side of
  /// the street matters - for example, if a building entrance is only accessible
  /// from one side of a divided highway, or if a parking lot can only be entered
  /// from northbound lanes. Without correct side-of-street matching, travel time
  /// estimates may be inaccurate because they don't account for necessary U-turns
  /// or detours to reach the correct side.
  ///
  /// Default value: <code>DividedStreetOnly</code>
  final SideOfStreetMatchingStrategy? useWith;

  IsolineSideOfStreetOptions({
    required this.position,
    this.useWith,
  });

  Map<String, dynamic> toJson() {
    final position = this.position;
    final useWith = this.useWith;
    return {
      'Position': position,
      if (useWith != null) 'UseWith': useWith.value,
    };
  }
}

/// Types of regulated zones that may affect routing.
///
/// @nodoc
class IsolineAvoidanceZoneCategory {
  /// The type of regulated zone: <code>CongestionPricing</code> for toll zones
  /// based on traffic levels, <code>Environmental</code> for low-emission zones,
  /// or <code>Vignette</code> for areas requiring special permits or stickers.
  final IsolineZoneCategory? category;

  IsolineAvoidanceZoneCategory({
    this.category,
  });

  Map<String, dynamic> toJson() {
    final category = this.category;
    return {
      if (category != null) 'Category': category.value,
    };
  }
}

/// @nodoc
class IsolineZoneCategory {
  static const congestionPricing = IsolineZoneCategory._('CongestionPricing');
  static const environmental = IsolineZoneCategory._('Environmental');
  static const vignette = IsolineZoneCategory._('Vignette');

  final String value;

  const IsolineZoneCategory._(this.value);

  static const values = [congestionPricing, environmental, vignette];

  static IsolineZoneCategory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IsolineZoneCategory._(value));

  @override
  bool operator ==(other) =>
      other is IsolineZoneCategory && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines an area to avoid when calculating routes. Consists of a primary
/// geometry to avoid, with the ability to specify exception areas within that
/// geometry where travel is permitted.
///
/// @nodoc
class IsolineAvoidanceArea {
  /// The primary area to avoid, specified using a bounding box, corridor,
  /// polygon, or polyline corridor.
  final IsolineAvoidanceAreaGeometry geometry;

  /// Areas within the primary avoidance geometry where travel is allowed. For
  /// example, you might want to avoid a neighborhood but allow travel on a major
  /// road that passes through it.
  final List<IsolineAvoidanceAreaGeometry>? except;

  IsolineAvoidanceArea({
    required this.geometry,
    this.except,
  });

  Map<String, dynamic> toJson() {
    final geometry = this.geometry;
    final except = this.except;
    return {
      'Geometry': geometry,
      if (except != null) 'Except': except,
    };
  }
}

/// Defines an area to avoid during calculations using one of several supported
/// geometry types. The service will prefer routes that avoid these areas when
/// possible.
///
/// @nodoc
class IsolineAvoidanceAreaGeometry {
  /// A rectangular area defined by its southwest and northeast corners:
  /// <code>\[min longitude, min latitude, max longitude, max latitude\]</code>.
  final List<double>? boundingBox;

  /// A buffer zone around a line, defined by a series of coordinates and a radius
  /// in meters.
  final Corridor? corridor;

  /// A polygon defined by a list of coordinate rings. The first ring defines the
  /// outer boundary; subsequent rings will be ignored.
  final List<List<List<double>>>? polygon;

  /// A buffer zone around a compressed polyline, defined by an encoded polyline
  /// string and a radius in meters. For more information on polyline encoding,
  /// see <a
  /// href="https://github.com/aws-geospatial/polyline">https://github.com/aws-geospatial/polyline</a>.
  final PolylineCorridor? polylineCorridor;

  /// A polygon defined by encoded polyline strings. The first string defines the
  /// outer boundary; subsequent strings will be ignored. For more information on
  /// polyline encoding, see <a
  /// href="https://github.com/aws-geospatial/polyline">https://github.com/aws-geospatial/polyline</a>.
  final List<String>? polylinePolygon;

  IsolineAvoidanceAreaGeometry({
    this.boundingBox,
    this.corridor,
    this.polygon,
    this.polylineCorridor,
    this.polylinePolygon,
  });

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final corridor = this.corridor;
    final polygon = this.polygon;
    final polylineCorridor = this.polylineCorridor;
    final polylinePolygon = this.polylinePolygon;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (corridor != null) 'Corridor': corridor,
      if (polygon != null) 'Polygon': polygon,
      if (polylineCorridor != null) 'PolylineCorridor': polylineCorridor,
      if (polylinePolygon != null) 'PolylinePolygon': polylinePolygon,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
