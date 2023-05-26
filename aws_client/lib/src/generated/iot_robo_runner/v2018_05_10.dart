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

/// An example service, deployed with the Octane Service creator, which will
/// echo the string
class IoTRoboRunner {
  final _s.RestJsonProtocol _protocol;
  IoTRoboRunner({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iotroborunner',
            signingName: 'iotroborunner',
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

  /// Grants permission to create a destination
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [state] :
  /// The state of the destination. Default used if not specified.
  Future<CreateDestinationResponse> createDestination({
    required String name,
    required String site,
    String? additionalFixedProperties,
    String? clientToken,
    DestinationState? state,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'site': site,
      if (additionalFixedProperties != null)
        'additionalFixedProperties': additionalFixedProperties,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (state != null) 'state': state.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createDestination',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDestinationResponse.fromJson(response);
  }

  /// Grants permission to create a site
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  Future<CreateSiteResponse> createSite({
    required String countryCode,
    required String name,
    String? clientToken,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'countryCode': countryCode,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createSite',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSiteResponse.fromJson(response);
  }

  /// Grants permission to create a worker
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  Future<CreateWorkerResponse> createWorker({
    required String fleet,
    required String name,
    String? additionalFixedProperties,
    String? additionalTransientProperties,
    String? clientToken,
    Orientation? orientation,
    PositionCoordinates? position,
    VendorProperties? vendorProperties,
  }) async {
    final $payload = <String, dynamic>{
      'fleet': fleet,
      'name': name,
      if (additionalFixedProperties != null)
        'additionalFixedProperties': additionalFixedProperties,
      if (additionalTransientProperties != null)
        'additionalTransientProperties': additionalTransientProperties,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (orientation != null) 'orientation': orientation,
      if (position != null) 'position': position,
      if (vendorProperties != null) 'vendorProperties': vendorProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createWorker',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkerResponse.fromJson(response);
  }

  /// Grants permission to create a worker fleet
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  Future<CreateWorkerFleetResponse> createWorkerFleet({
    required String name,
    required String site,
    String? additionalFixedProperties,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'site': site,
      if (additionalFixedProperties != null)
        'additionalFixedProperties': additionalFixedProperties,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createWorkerFleet',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkerFleetResponse.fromJson(response);
  }

  /// Grants permission to delete a destination
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<void> deleteDestination({
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'id': id,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteDestination',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Grants permission to delete a site
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<void> deleteSite({
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'id': id,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteSite',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Grants permission to delete a worker
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<void> deleteWorker({
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'id': id,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteWorker',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Grants permission to delete a worker fleet
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<void> deleteWorkerFleet({
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'id': id,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteWorkerFleet',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Grants permission to get a destination
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<GetDestinationResponse> getDestination({
    required String id,
  }) async {
    final $query = <String, List<String>>{
      'id': [id],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/getDestination',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDestinationResponse.fromJson(response);
  }

  /// Grants permission to get a site
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<GetSiteResponse> getSite({
    required String id,
  }) async {
    final $query = <String, List<String>>{
      'id': [id],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/getSite',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSiteResponse.fromJson(response);
  }

  /// Grants permission to get a worker
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<GetWorkerResponse> getWorker({
    required String id,
  }) async {
    final $query = <String, List<String>>{
      'id': [id],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/getWorker',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkerResponse.fromJson(response);
  }

  /// Grants permission to get a worker fleet
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<GetWorkerFleetResponse> getWorkerFleet({
    required String id,
  }) async {
    final $query = <String, List<String>>{
      'id': [id],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/getWorkerFleet',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkerFleetResponse.fromJson(response);
  }

  /// Grants permission to list destinations
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<ListDestinationsResponse> listDestinations({
    required String site,
    int? maxResults,
    String? nextToken,
    DestinationState? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'site': [site],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (state != null) 'state': [state.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/listDestinations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDestinationsResponse.fromJson(response);
  }

  /// Grants permission to list sites
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<ListSitesResponse> listSites({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/listSites',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSitesResponse.fromJson(response);
  }

  /// Grants permission to list worker fleets
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<ListWorkerFleetsResponse> listWorkerFleets({
    required String site,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      'site': [site],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/listWorkerFleets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkerFleetsResponse.fromJson(response);
  }

  /// Grants permission to list workers
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<ListWorkersResponse> listWorkers({
    required String site,
    String? fleet,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      'site': [site],
      if (fleet != null) 'fleet': [fleet],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/listWorkers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkersResponse.fromJson(response);
  }

  /// Grants permission to update a destination
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<UpdateDestinationResponse> updateDestination({
    required String id,
    String? additionalFixedProperties,
    String? name,
    DestinationState? state,
  }) async {
    final $payload = <String, dynamic>{
      'id': id,
      if (additionalFixedProperties != null)
        'additionalFixedProperties': additionalFixedProperties,
      if (name != null) 'name': name,
      if (state != null) 'state': state.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateDestination',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDestinationResponse.fromJson(response);
  }

  /// Grants permission to update a site
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<UpdateSiteResponse> updateSite({
    required String id,
    String? countryCode,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'id': id,
      if (countryCode != null) 'countryCode': countryCode,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateSite',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSiteResponse.fromJson(response);
  }

  /// Grants permission to update a worker
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<UpdateWorkerResponse> updateWorker({
    required String id,
    String? additionalFixedProperties,
    String? additionalTransientProperties,
    String? name,
    Orientation? orientation,
    PositionCoordinates? position,
    VendorProperties? vendorProperties,
  }) async {
    final $payload = <String, dynamic>{
      'id': id,
      if (additionalFixedProperties != null)
        'additionalFixedProperties': additionalFixedProperties,
      if (additionalTransientProperties != null)
        'additionalTransientProperties': additionalTransientProperties,
      if (name != null) 'name': name,
      if (orientation != null) 'orientation': orientation,
      if (position != null) 'position': position,
      if (vendorProperties != null) 'vendorProperties': vendorProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateWorker',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkerResponse.fromJson(response);
  }

  /// Grants permission to update a worker fleet
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<UpdateWorkerFleetResponse> updateWorkerFleet({
    required String id,
    String? additionalFixedProperties,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'id': id,
      if (additionalFixedProperties != null)
        'additionalFixedProperties': additionalFixedProperties,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateWorkerFleet',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkerFleetResponse.fromJson(response);
  }
}

/// Cartesian coordinates in 3D space relative to the RoboRunner origin.
class CartesianCoordinates {
  /// X coordinate.
  final double x;

  /// Y coordinate.
  final double y;

  /// Z coordinate.
  final double? z;

  CartesianCoordinates({
    required this.x,
    required this.y,
    this.z,
  });

  factory CartesianCoordinates.fromJson(Map<String, dynamic> json) {
    return CartesianCoordinates(
      x: json['x'] as double,
      y: json['y'] as double,
      z: json['z'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final x = this.x;
    final y = this.y;
    final z = this.z;
    return {
      'x': x,
      'y': y,
      if (z != null) 'z': z,
    };
  }
}

class CreateDestinationResponse {
  final String arn;
  final DateTime createdAt;
  final String id;
  final DestinationState state;
  final DateTime updatedAt;

  CreateDestinationResponse({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.state,
    required this.updatedAt,
  });

  factory CreateDestinationResponse.fromJson(Map<String, dynamic> json) {
    return CreateDestinationResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      state: (json['state'] as String).toDestinationState(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final state = this.state;
    final updatedAt = this.updatedAt;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'id': id,
      'state': state.toValue(),
      'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class CreateSiteResponse {
  final String arn;
  final DateTime createdAt;
  final String id;
  final DateTime updatedAt;

  CreateSiteResponse({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
  });

  factory CreateSiteResponse.fromJson(Map<String, dynamic> json) {
    return CreateSiteResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final updatedAt = this.updatedAt;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'id': id,
      'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class CreateWorkerFleetResponse {
  final String arn;
  final DateTime createdAt;
  final String id;
  final DateTime updatedAt;

  CreateWorkerFleetResponse({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
  });

  factory CreateWorkerFleetResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkerFleetResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final updatedAt = this.updatedAt;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'id': id,
      'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class CreateWorkerResponse {
  final String arn;
  final DateTime createdAt;
  final String id;
  final String site;
  final DateTime updatedAt;

  CreateWorkerResponse({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.site,
    required this.updatedAt,
  });

  factory CreateWorkerResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkerResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      site: json['site'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final site = this.site;
    final updatedAt = this.updatedAt;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'id': id,
      'site': site,
      'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class DeleteDestinationResponse {
  DeleteDestinationResponse();

  factory DeleteDestinationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSiteResponse {
  DeleteSiteResponse();

  factory DeleteSiteResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSiteResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWorkerFleetResponse {
  DeleteWorkerFleetResponse();

  factory DeleteWorkerFleetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWorkerFleetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWorkerResponse {
  DeleteWorkerResponse();

  factory DeleteWorkerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWorkerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Area within a facility where work can be performed.
class Destination {
  final String arn;
  final DateTime createdAt;
  final String id;
  final String name;
  final String site;
  final DestinationState state;
  final DateTime updatedAt;
  final String? additionalFixedProperties;

  Destination({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.site,
    required this.state,
    required this.updatedAt,
    this.additionalFixedProperties,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      site: json['site'] as String,
      state: (json['state'] as String).toDestinationState(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      additionalFixedProperties: json['additionalFixedProperties'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final site = this.site;
    final state = this.state;
    final updatedAt = this.updatedAt;
    final additionalFixedProperties = this.additionalFixedProperties;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'id': id,
      'name': name,
      'site': site,
      'state': state.toValue(),
      'updatedAt': unixTimestampToJson(updatedAt),
      if (additionalFixedProperties != null)
        'additionalFixedProperties': additionalFixedProperties,
    };
  }
}

/// State of the destination.
enum DestinationState {
  enabled,
  disabled,
  decommissioned,
}

extension DestinationStateValueExtension on DestinationState {
  String toValue() {
    switch (this) {
      case DestinationState.enabled:
        return 'ENABLED';
      case DestinationState.disabled:
        return 'DISABLED';
      case DestinationState.decommissioned:
        return 'DECOMMISSIONED';
    }
  }
}

extension DestinationStateFromString on String {
  DestinationState toDestinationState() {
    switch (this) {
      case 'ENABLED':
        return DestinationState.enabled;
      case 'DISABLED':
        return DestinationState.disabled;
      case 'DECOMMISSIONED':
        return DestinationState.decommissioned;
    }
    throw Exception('$this is not known in enum DestinationState');
  }
}

class GetDestinationResponse {
  final String arn;
  final DateTime createdAt;
  final String id;
  final String name;
  final String site;
  final DestinationState state;
  final DateTime updatedAt;
  final String? additionalFixedProperties;

  GetDestinationResponse({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.site,
    required this.state,
    required this.updatedAt,
    this.additionalFixedProperties,
  });

  factory GetDestinationResponse.fromJson(Map<String, dynamic> json) {
    return GetDestinationResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      site: json['site'] as String,
      state: (json['state'] as String).toDestinationState(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      additionalFixedProperties: json['additionalFixedProperties'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final site = this.site;
    final state = this.state;
    final updatedAt = this.updatedAt;
    final additionalFixedProperties = this.additionalFixedProperties;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'id': id,
      'name': name,
      'site': site,
      'state': state.toValue(),
      'updatedAt': unixTimestampToJson(updatedAt),
      if (additionalFixedProperties != null)
        'additionalFixedProperties': additionalFixedProperties,
    };
  }
}

class GetSiteResponse {
  final String arn;
  final String countryCode;
  final DateTime createdAt;
  final String id;
  final String name;
  final DateTime updatedAt;
  final String? description;

  GetSiteResponse({
    required this.arn,
    required this.countryCode,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.updatedAt,
    this.description,
  });

  factory GetSiteResponse.fromJson(Map<String, dynamic> json) {
    return GetSiteResponse(
      arn: json['arn'] as String,
      countryCode: json['countryCode'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final countryCode = this.countryCode;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'arn': arn,
      'countryCode': countryCode,
      'createdAt': unixTimestampToJson(createdAt),
      'id': id,
      'name': name,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

class GetWorkerFleetResponse {
  final String arn;
  final DateTime createdAt;
  final String id;
  final String name;
  final String site;
  final DateTime updatedAt;
  final String? additionalFixedProperties;

  GetWorkerFleetResponse({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.site,
    required this.updatedAt,
    this.additionalFixedProperties,
  });

  factory GetWorkerFleetResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkerFleetResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      site: json['site'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      additionalFixedProperties: json['additionalFixedProperties'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final site = this.site;
    final updatedAt = this.updatedAt;
    final additionalFixedProperties = this.additionalFixedProperties;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'id': id,
      'name': name,
      'site': site,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (additionalFixedProperties != null)
        'additionalFixedProperties': additionalFixedProperties,
    };
  }
}

class GetWorkerResponse {
  final String arn;
  final DateTime createdAt;
  final String fleet;
  final String id;
  final String name;
  final String site;
  final DateTime updatedAt;
  final String? additionalFixedProperties;
  final String? additionalTransientProperties;
  final Orientation? orientation;
  final PositionCoordinates? position;
  final VendorProperties? vendorProperties;

  GetWorkerResponse({
    required this.arn,
    required this.createdAt,
    required this.fleet,
    required this.id,
    required this.name,
    required this.site,
    required this.updatedAt,
    this.additionalFixedProperties,
    this.additionalTransientProperties,
    this.orientation,
    this.position,
    this.vendorProperties,
  });

  factory GetWorkerResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkerResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      fleet: json['fleet'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      site: json['site'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      additionalFixedProperties: json['additionalFixedProperties'] as String?,
      additionalTransientProperties:
          json['additionalTransientProperties'] as String?,
      orientation: json['orientation'] != null
          ? Orientation.fromJson(json['orientation'] as Map<String, dynamic>)
          : null,
      position: json['position'] != null
          ? PositionCoordinates.fromJson(
              json['position'] as Map<String, dynamic>)
          : null,
      vendorProperties: json['vendorProperties'] != null
          ? VendorProperties.fromJson(
              json['vendorProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final fleet = this.fleet;
    final id = this.id;
    final name = this.name;
    final site = this.site;
    final updatedAt = this.updatedAt;
    final additionalFixedProperties = this.additionalFixedProperties;
    final additionalTransientProperties = this.additionalTransientProperties;
    final orientation = this.orientation;
    final position = this.position;
    final vendorProperties = this.vendorProperties;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'fleet': fleet,
      'id': id,
      'name': name,
      'site': site,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (additionalFixedProperties != null)
        'additionalFixedProperties': additionalFixedProperties,
      if (additionalTransientProperties != null)
        'additionalTransientProperties': additionalTransientProperties,
      if (orientation != null) 'orientation': orientation,
      if (position != null) 'position': position,
      if (vendorProperties != null) 'vendorProperties': vendorProperties,
    };
  }
}

class ListDestinationsResponse {
  final List<Destination>? destinations;
  final String? nextToken;

  ListDestinationsResponse({
    this.destinations,
    this.nextToken,
  });

  factory ListDestinationsResponse.fromJson(Map<String, dynamic> json) {
    return ListDestinationsResponse(
      destinations: (json['destinations'] as List?)
          ?.whereNotNull()
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinations = this.destinations;
    final nextToken = this.nextToken;
    return {
      if (destinations != null) 'destinations': destinations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSitesResponse {
  final String? nextToken;
  final List<Site>? sites;

  ListSitesResponse({
    this.nextToken,
    this.sites,
  });

  factory ListSitesResponse.fromJson(Map<String, dynamic> json) {
    return ListSitesResponse(
      nextToken: json['nextToken'] as String?,
      sites: (json['sites'] as List?)
          ?.whereNotNull()
          .map((e) => Site.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sites = this.sites;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (sites != null) 'sites': sites,
    };
  }
}

class ListWorkerFleetsResponse {
  final String? nextToken;
  final List<WorkerFleet>? workerFleets;

  ListWorkerFleetsResponse({
    this.nextToken,
    this.workerFleets,
  });

  factory ListWorkerFleetsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkerFleetsResponse(
      nextToken: json['nextToken'] as String?,
      workerFleets: (json['workerFleets'] as List?)
          ?.whereNotNull()
          .map((e) => WorkerFleet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workerFleets = this.workerFleets;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (workerFleets != null) 'workerFleets': workerFleets,
    };
  }
}

class ListWorkersResponse {
  final String? nextToken;
  final List<Worker>? workers;

  ListWorkersResponse({
    this.nextToken,
    this.workers,
  });

  factory ListWorkersResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkersResponse(
      nextToken: json['nextToken'] as String?,
      workers: (json['workers'] as List?)
          ?.whereNotNull()
          .map((e) => Worker.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workers = this.workers;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (workers != null) 'workers': workers,
    };
  }
}

/// Worker orientation measured in units clockwise from north.
class Orientation {
  /// Degrees, limited on [0, 360)
  final double? degrees;

  Orientation({
    this.degrees,
  });

  factory Orientation.fromJson(Map<String, dynamic> json) {
    return Orientation(
      degrees: json['degrees'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final degrees = this.degrees;
    return {
      if (degrees != null) 'degrees': degrees,
    };
  }
}

/// Supported coordinates for worker position.
class PositionCoordinates {
  /// Cartesian coordinates.
  final CartesianCoordinates? cartesianCoordinates;

  PositionCoordinates({
    this.cartesianCoordinates,
  });

  factory PositionCoordinates.fromJson(Map<String, dynamic> json) {
    return PositionCoordinates(
      cartesianCoordinates: json['cartesianCoordinates'] != null
          ? CartesianCoordinates.fromJson(
              json['cartesianCoordinates'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cartesianCoordinates = this.cartesianCoordinates;
    return {
      if (cartesianCoordinates != null)
        'cartesianCoordinates': cartesianCoordinates,
    };
  }
}

/// Facility containing destinations, workers, activities, and tasks.
class Site {
  final String arn;
  final String countryCode;
  final DateTime createdAt;

  /// The name of the site. Mutable after creation and unique within a given
  /// account.
  final String name;

  Site({
    required this.arn,
    required this.countryCode,
    required this.createdAt,
    required this.name,
  });

  factory Site.fromJson(Map<String, dynamic> json) {
    return Site(
      arn: json['arn'] as String,
      countryCode: json['countryCode'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final countryCode = this.countryCode;
    final createdAt = this.createdAt;
    final name = this.name;
    return {
      'arn': arn,
      'countryCode': countryCode,
      'createdAt': unixTimestampToJson(createdAt),
      'name': name,
    };
  }
}

class UpdateDestinationResponse {
  final String arn;
  final String id;
  final String name;
  final DestinationState state;
  final DateTime updatedAt;
  final String? additionalFixedProperties;

  UpdateDestinationResponse({
    required this.arn,
    required this.id,
    required this.name,
    required this.state,
    required this.updatedAt,
    this.additionalFixedProperties,
  });

  factory UpdateDestinationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDestinationResponse(
      arn: json['arn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      state: (json['state'] as String).toDestinationState(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      additionalFixedProperties: json['additionalFixedProperties'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final state = this.state;
    final updatedAt = this.updatedAt;
    final additionalFixedProperties = this.additionalFixedProperties;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      'state': state.toValue(),
      'updatedAt': unixTimestampToJson(updatedAt),
      if (additionalFixedProperties != null)
        'additionalFixedProperties': additionalFixedProperties,
    };
  }
}

class UpdateSiteResponse {
  final String arn;
  final String id;
  final String name;
  final DateTime updatedAt;
  final String? countryCode;
  final String? description;

  UpdateSiteResponse({
    required this.arn,
    required this.id,
    required this.name,
    required this.updatedAt,
    this.countryCode,
    this.description,
  });

  factory UpdateSiteResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSiteResponse(
      arn: json['arn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      countryCode: json['countryCode'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final updatedAt = this.updatedAt;
    final countryCode = this.countryCode;
    final description = this.description;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (countryCode != null) 'countryCode': countryCode,
      if (description != null) 'description': description,
    };
  }
}

class UpdateWorkerFleetResponse {
  final String arn;
  final String id;
  final String name;
  final DateTime updatedAt;
  final String? additionalFixedProperties;

  UpdateWorkerFleetResponse({
    required this.arn,
    required this.id,
    required this.name,
    required this.updatedAt,
    this.additionalFixedProperties,
  });

  factory UpdateWorkerFleetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorkerFleetResponse(
      arn: json['arn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      additionalFixedProperties: json['additionalFixedProperties'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final updatedAt = this.updatedAt;
    final additionalFixedProperties = this.additionalFixedProperties;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (additionalFixedProperties != null)
        'additionalFixedProperties': additionalFixedProperties,
    };
  }
}

class UpdateWorkerResponse {
  final String arn;
  final String fleet;
  final String id;
  final String name;
  final DateTime updatedAt;
  final String? additionalFixedProperties;
  final String? additionalTransientProperties;
  final Orientation? orientation;
  final PositionCoordinates? position;
  final VendorProperties? vendorProperties;

  UpdateWorkerResponse({
    required this.arn,
    required this.fleet,
    required this.id,
    required this.name,
    required this.updatedAt,
    this.additionalFixedProperties,
    this.additionalTransientProperties,
    this.orientation,
    this.position,
    this.vendorProperties,
  });

  factory UpdateWorkerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorkerResponse(
      arn: json['arn'] as String,
      fleet: json['fleet'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      additionalFixedProperties: json['additionalFixedProperties'] as String?,
      additionalTransientProperties:
          json['additionalTransientProperties'] as String?,
      orientation: json['orientation'] != null
          ? Orientation.fromJson(json['orientation'] as Map<String, dynamic>)
          : null,
      position: json['position'] != null
          ? PositionCoordinates.fromJson(
              json['position'] as Map<String, dynamic>)
          : null,
      vendorProperties: json['vendorProperties'] != null
          ? VendorProperties.fromJson(
              json['vendorProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final fleet = this.fleet;
    final id = this.id;
    final name = this.name;
    final updatedAt = this.updatedAt;
    final additionalFixedProperties = this.additionalFixedProperties;
    final additionalTransientProperties = this.additionalTransientProperties;
    final orientation = this.orientation;
    final position = this.position;
    final vendorProperties = this.vendorProperties;
    return {
      'arn': arn,
      'fleet': fleet,
      'id': id,
      'name': name,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (additionalFixedProperties != null)
        'additionalFixedProperties': additionalFixedProperties,
      if (additionalTransientProperties != null)
        'additionalTransientProperties': additionalTransientProperties,
      if (orientation != null) 'orientation': orientation,
      if (position != null) 'position': position,
      if (vendorProperties != null) 'vendorProperties': vendorProperties,
    };
  }
}

/// Properties of the worker that are provided by the vendor FMS.
class VendorProperties {
  final String vendorWorkerId;
  final String? vendorAdditionalFixedProperties;
  final String? vendorAdditionalTransientProperties;
  final String? vendorWorkerIpAddress;

  VendorProperties({
    required this.vendorWorkerId,
    this.vendorAdditionalFixedProperties,
    this.vendorAdditionalTransientProperties,
    this.vendorWorkerIpAddress,
  });

  factory VendorProperties.fromJson(Map<String, dynamic> json) {
    return VendorProperties(
      vendorWorkerId: json['vendorWorkerId'] as String,
      vendorAdditionalFixedProperties:
          json['vendorAdditionalFixedProperties'] as String?,
      vendorAdditionalTransientProperties:
          json['vendorAdditionalTransientProperties'] as String?,
      vendorWorkerIpAddress: json['vendorWorkerIpAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final vendorWorkerId = this.vendorWorkerId;
    final vendorAdditionalFixedProperties =
        this.vendorAdditionalFixedProperties;
    final vendorAdditionalTransientProperties =
        this.vendorAdditionalTransientProperties;
    final vendorWorkerIpAddress = this.vendorWorkerIpAddress;
    return {
      'vendorWorkerId': vendorWorkerId,
      if (vendorAdditionalFixedProperties != null)
        'vendorAdditionalFixedProperties': vendorAdditionalFixedProperties,
      if (vendorAdditionalTransientProperties != null)
        'vendorAdditionalTransientProperties':
            vendorAdditionalTransientProperties,
      if (vendorWorkerIpAddress != null)
        'vendorWorkerIpAddress': vendorWorkerIpAddress,
    };
  }
}

/// A unit capable of performing tasks.
class Worker {
  final String arn;
  final DateTime createdAt;
  final String fleet;
  final String id;
  final String name;
  final String site;
  final DateTime updatedAt;
  final String? additionalFixedProperties;
  final String? additionalTransientProperties;
  final Orientation? orientation;
  final PositionCoordinates? position;
  final VendorProperties? vendorProperties;

  Worker({
    required this.arn,
    required this.createdAt,
    required this.fleet,
    required this.id,
    required this.name,
    required this.site,
    required this.updatedAt,
    this.additionalFixedProperties,
    this.additionalTransientProperties,
    this.orientation,
    this.position,
    this.vendorProperties,
  });

  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      fleet: json['fleet'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      site: json['site'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      additionalFixedProperties: json['additionalFixedProperties'] as String?,
      additionalTransientProperties:
          json['additionalTransientProperties'] as String?,
      orientation: json['orientation'] != null
          ? Orientation.fromJson(json['orientation'] as Map<String, dynamic>)
          : null,
      position: json['position'] != null
          ? PositionCoordinates.fromJson(
              json['position'] as Map<String, dynamic>)
          : null,
      vendorProperties: json['vendorProperties'] != null
          ? VendorProperties.fromJson(
              json['vendorProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final fleet = this.fleet;
    final id = this.id;
    final name = this.name;
    final site = this.site;
    final updatedAt = this.updatedAt;
    final additionalFixedProperties = this.additionalFixedProperties;
    final additionalTransientProperties = this.additionalTransientProperties;
    final orientation = this.orientation;
    final position = this.position;
    final vendorProperties = this.vendorProperties;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'fleet': fleet,
      'id': id,
      'name': name,
      'site': site,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (additionalFixedProperties != null)
        'additionalFixedProperties': additionalFixedProperties,
      if (additionalTransientProperties != null)
        'additionalTransientProperties': additionalTransientProperties,
      if (orientation != null) 'orientation': orientation,
      if (position != null) 'position': position,
      if (vendorProperties != null) 'vendorProperties': vendorProperties,
    };
  }
}

/// A collection of workers organized within a facility.
class WorkerFleet {
  final String arn;
  final DateTime createdAt;
  final String id;
  final String name;
  final String site;
  final DateTime updatedAt;
  final String? additionalFixedProperties;

  WorkerFleet({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.site,
    required this.updatedAt,
    this.additionalFixedProperties,
  });

  factory WorkerFleet.fromJson(Map<String, dynamic> json) {
    return WorkerFleet(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      site: json['site'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      additionalFixedProperties: json['additionalFixedProperties'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final site = this.site;
    final updatedAt = this.updatedAt;
    final additionalFixedProperties = this.additionalFixedProperties;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'id': id,
      'name': name,
      'site': site,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (additionalFixedProperties != null)
        'additionalFixedProperties': additionalFixedProperties,
    };
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
