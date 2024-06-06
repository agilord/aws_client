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

/// Welcome to the AWS Ground Station API Reference. AWS Ground Station is a
/// fully managed service that enables you to control satellite communications,
/// downlink and process satellite data, and scale your satellite operations
/// efficiently and cost-effectively without having to build or manage your own
/// ground station infrastructure.
class GroundStation {
  final _s.RestJsonProtocol _protocol;
  GroundStation({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'groundstation',
            signingName: 'groundstation',
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

  /// Cancels a contact with a specified contact ID.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [contactId] :
  /// UUID of a contact.
  Future<ContactIdResponse> cancelContact({
    required String contactId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/contact/${Uri.encodeComponent(contactId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ContactIdResponse.fromJson(response);
  }

  /// Creates a <code>Config</code> with the specified <code>configData</code>
  /// parameters.
  ///
  /// Only one type of <code>configData</code> can be specified.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [configData] :
  /// Parameters of a <code>Config</code>.
  ///
  /// Parameter [name] :
  /// Name of a <code>Config</code>.
  ///
  /// Parameter [tags] :
  /// Tags assigned to a <code>Config</code>.
  Future<ConfigIdResponse> createConfig({
    required ConfigTypeData configData,
    required String name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'configData': configData,
      'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/config',
      exceptionFnMap: _exceptionFns,
    );
    return ConfigIdResponse.fromJson(response);
  }

  /// Creates a <code>DataflowEndpoint</code> group containing the specified
  /// list of <code>DataflowEndpoint</code> objects.
  ///
  /// The <code>name</code> field in each endpoint is used in your mission
  /// profile <code>DataflowEndpointConfig</code> to specify which endpoints to
  /// use during a contact.
  ///
  /// When a contact uses multiple <code>DataflowEndpointConfig</code> objects,
  /// each <code>Config</code> must match a <code>DataflowEndpoint</code> in the
  /// same group.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [endpointDetails] :
  /// Endpoint details of each endpoint in the dataflow endpoint group.
  ///
  /// Parameter [contactPostPassDurationSeconds] :
  /// Amount of time, in seconds, after a contact ends that the Ground Station
  /// Dataflow Endpoint Group will be in a <code>POSTPASS</code> state. A Ground
  /// Station Dataflow Endpoint Group State Change event will be emitted when
  /// the Dataflow Endpoint Group enters and exits the <code>POSTPASS</code>
  /// state.
  ///
  /// Parameter [contactPrePassDurationSeconds] :
  /// Amount of time, in seconds, before a contact starts that the Ground
  /// Station Dataflow Endpoint Group will be in a <code>PREPASS</code> state. A
  /// Ground Station Dataflow Endpoint Group State Change event will be emitted
  /// when the Dataflow Endpoint Group enters and exits the <code>PREPASS</code>
  /// state.
  ///
  /// Parameter [tags] :
  /// Tags of a dataflow endpoint group.
  Future<DataflowEndpointGroupIdResponse> createDataflowEndpointGroup({
    required List<EndpointDetails> endpointDetails,
    int? contactPostPassDurationSeconds,
    int? contactPrePassDurationSeconds,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'contactPostPassDurationSeconds',
      contactPostPassDurationSeconds,
      120,
      480,
    );
    _s.validateNumRange(
      'contactPrePassDurationSeconds',
      contactPrePassDurationSeconds,
      120,
      480,
    );
    final $payload = <String, dynamic>{
      'endpointDetails': endpointDetails,
      if (contactPostPassDurationSeconds != null)
        'contactPostPassDurationSeconds': contactPostPassDurationSeconds,
      if (contactPrePassDurationSeconds != null)
        'contactPrePassDurationSeconds': contactPrePassDurationSeconds,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/dataflowEndpointGroup',
      exceptionFnMap: _exceptionFns,
    );
    return DataflowEndpointGroupIdResponse.fromJson(response);
  }

  /// Creates an Ephemeris with the specified <code>EphemerisData</code>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// A name string associated with the ephemeris. Used as a human-readable
  /// identifier for the ephemeris.
  ///
  /// Parameter [satelliteId] :
  /// AWS Ground Station satellite ID for this ephemeris.
  ///
  /// Parameter [enabled] :
  /// Whether to set the ephemeris status to <code>ENABLED</code> after
  /// validation.
  ///
  /// Setting this to false will set the ephemeris status to
  /// <code>DISABLED</code> after validation.
  ///
  /// Parameter [ephemeris] :
  /// Ephemeris data.
  ///
  /// Parameter [expirationTime] :
  /// An overall expiration time for the ephemeris in UTC, after which it will
  /// become <code>EXPIRED</code>.
  ///
  /// Parameter [kmsKeyArn] :
  /// The ARN of a KMS key used to encrypt the ephemeris in Ground Station.
  ///
  /// Parameter [priority] :
  /// Customer-provided priority score to establish the order in which
  /// overlapping ephemerides should be used.
  ///
  /// The default for customer-provided ephemeris priority is 1, and higher
  /// numbers take precedence.
  ///
  /// Priority must be 1 or greater
  ///
  /// Parameter [tags] :
  /// Tags assigned to an ephemeris.
  Future<EphemerisIdResponse> createEphemeris({
    required String name,
    required String satelliteId,
    bool? enabled,
    EphemerisData? ephemeris,
    DateTime? expirationTime,
    String? kmsKeyArn,
    int? priority,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      1,
      99999,
    );
    final $payload = <String, dynamic>{
      'name': name,
      'satelliteId': satelliteId,
      if (enabled != null) 'enabled': enabled,
      if (ephemeris != null) 'ephemeris': ephemeris,
      if (expirationTime != null)
        'expirationTime': unixTimestampToJson(expirationTime),
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (priority != null) 'priority': priority,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ephemeris',
      exceptionFnMap: _exceptionFns,
    );
    return EphemerisIdResponse.fromJson(response);
  }

  /// Creates a mission profile.
  ///
  /// <code>dataflowEdges</code> is a list of lists of strings. Each lower level
  /// list of strings has two elements: a <i>from</i> ARN and a <i>to</i> ARN.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [dataflowEdges] :
  /// A list of lists of ARNs. Each list of ARNs is an edge, with a <i>from</i>
  /// <code>Config</code> and a <i>to</i> <code>Config</code>.
  ///
  /// Parameter [minimumViableContactDurationSeconds] :
  /// Smallest amount of time in seconds that you’d like to see for an available
  /// contact. AWS Ground Station will not present you with contacts shorter
  /// than this duration.
  ///
  /// Parameter [name] :
  /// Name of a mission profile.
  ///
  /// Parameter [trackingConfigArn] :
  /// ARN of a tracking <code>Config</code>.
  ///
  /// Parameter [contactPostPassDurationSeconds] :
  /// Amount of time after a contact ends that you’d like to receive a Ground
  /// Station Contact State Change event indicating the pass has finished.
  ///
  /// Parameter [contactPrePassDurationSeconds] :
  /// Amount of time prior to contact start you’d like to receive a Ground
  /// Station Contact State Change event indicating an upcoming pass.
  ///
  /// Parameter [streamsKmsKey] :
  /// KMS key to use for encrypting streams.
  ///
  /// Parameter [streamsKmsRole] :
  /// Role to use for encrypting streams with KMS key.
  ///
  /// Parameter [tags] :
  /// Tags assigned to a mission profile.
  Future<MissionProfileIdResponse> createMissionProfile({
    required List<List<String>> dataflowEdges,
    required int minimumViableContactDurationSeconds,
    required String name,
    required String trackingConfigArn,
    int? contactPostPassDurationSeconds,
    int? contactPrePassDurationSeconds,
    KmsKey? streamsKmsKey,
    String? streamsKmsRole,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'minimumViableContactDurationSeconds',
      minimumViableContactDurationSeconds,
      1,
      21600,
      isRequired: true,
    );
    _s.validateNumRange(
      'contactPostPassDurationSeconds',
      contactPostPassDurationSeconds,
      0,
      21600,
    );
    _s.validateNumRange(
      'contactPrePassDurationSeconds',
      contactPrePassDurationSeconds,
      0,
      21600,
    );
    final $payload = <String, dynamic>{
      'dataflowEdges': dataflowEdges,
      'minimumViableContactDurationSeconds':
          minimumViableContactDurationSeconds,
      'name': name,
      'trackingConfigArn': trackingConfigArn,
      if (contactPostPassDurationSeconds != null)
        'contactPostPassDurationSeconds': contactPostPassDurationSeconds,
      if (contactPrePassDurationSeconds != null)
        'contactPrePassDurationSeconds': contactPrePassDurationSeconds,
      if (streamsKmsKey != null) 'streamsKmsKey': streamsKmsKey,
      if (streamsKmsRole != null) 'streamsKmsRole': streamsKmsRole,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/missionprofile',
      exceptionFnMap: _exceptionFns,
    );
    return MissionProfileIdResponse.fromJson(response);
  }

  /// Deletes a <code>Config</code>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [configId] :
  /// UUID of a <code>Config</code>.
  ///
  /// Parameter [configType] :
  /// Type of a <code>Config</code>.
  Future<ConfigIdResponse> deleteConfig({
    required String configId,
    required ConfigCapabilityType configType,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/config/${Uri.encodeComponent(configType.toValue())}/${Uri.encodeComponent(configId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ConfigIdResponse.fromJson(response);
  }

  /// Deletes a dataflow endpoint group.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [dataflowEndpointGroupId] :
  /// UUID of a dataflow endpoint group.
  Future<DataflowEndpointGroupIdResponse> deleteDataflowEndpointGroup({
    required String dataflowEndpointGroupId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/dataflowEndpointGroup/${Uri.encodeComponent(dataflowEndpointGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DataflowEndpointGroupIdResponse.fromJson(response);
  }

  /// Deletes an ephemeris
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [ephemerisId] :
  /// The AWS Ground Station ephemeris ID.
  Future<EphemerisIdResponse> deleteEphemeris({
    required String ephemerisId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/ephemeris/${Uri.encodeComponent(ephemerisId)}',
      exceptionFnMap: _exceptionFns,
    );
    return EphemerisIdResponse.fromJson(response);
  }

  /// Deletes a mission profile.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [missionProfileId] :
  /// UUID of a mission profile.
  Future<MissionProfileIdResponse> deleteMissionProfile({
    required String missionProfileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/missionprofile/${Uri.encodeComponent(missionProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return MissionProfileIdResponse.fromJson(response);
  }

  /// Describes an existing contact.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [contactId] :
  /// UUID of a contact.
  Future<DescribeContactResponse> describeContact({
    required String contactId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/contact/${Uri.encodeComponent(contactId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeContactResponse.fromJson(response);
  }

  /// Describes an existing ephemeris.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [ephemerisId] :
  /// The AWS Ground Station ephemeris ID.
  Future<DescribeEphemerisResponse> describeEphemeris({
    required String ephemerisId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ephemeris/${Uri.encodeComponent(ephemerisId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeEphemerisResponse.fromJson(response);
  }

  /// <note>
  /// For use by AWS Ground Station Agent and shouldn't be called directly.
  /// </note>
  /// Gets the latest configuration information for a registered agent.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentId] :
  /// UUID of agent to get configuration information for.
  Future<GetAgentConfigurationResponse> getAgentConfiguration({
    required String agentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/agent/${Uri.encodeComponent(agentId)}/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetAgentConfigurationResponse.fromJson(response);
  }

  /// Returns <code>Config</code> information.
  ///
  /// Only one <code>Config</code> response can be returned.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [configId] :
  /// UUID of a <code>Config</code>.
  ///
  /// Parameter [configType] :
  /// Type of a <code>Config</code>.
  Future<GetConfigResponse> getConfig({
    required String configId,
    required ConfigCapabilityType configType,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/config/${Uri.encodeComponent(configType.toValue())}/${Uri.encodeComponent(configId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfigResponse.fromJson(response);
  }

  /// Returns the dataflow endpoint group.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [dataflowEndpointGroupId] :
  /// UUID of a dataflow endpoint group.
  Future<GetDataflowEndpointGroupResponse> getDataflowEndpointGroup({
    required String dataflowEndpointGroupId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/dataflowEndpointGroup/${Uri.encodeComponent(dataflowEndpointGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataflowEndpointGroupResponse.fromJson(response);
  }

  /// Returns the number of reserved minutes used by account.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [month] :
  /// The month being requested, with a value of 1-12.
  ///
  /// Parameter [year] :
  /// The year being requested, in the format of YYYY.
  Future<GetMinuteUsageResponse> getMinuteUsage({
    required int month,
    required int year,
  }) async {
    _s.validateNumRange(
      'month',
      month,
      1,
      12,
      isRequired: true,
    );
    _s.validateNumRange(
      'year',
      year,
      2018,
      3000,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'month': month,
      'year': year,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/minute-usage',
      exceptionFnMap: _exceptionFns,
    );
    return GetMinuteUsageResponse.fromJson(response);
  }

  /// Returns a mission profile.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [missionProfileId] :
  /// UUID of a mission profile.
  Future<GetMissionProfileResponse> getMissionProfile({
    required String missionProfileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/missionprofile/${Uri.encodeComponent(missionProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMissionProfileResponse.fromJson(response);
  }

  /// Returns a satellite.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [satelliteId] :
  /// UUID of a satellite.
  Future<GetSatelliteResponse> getSatellite({
    required String satelliteId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/satellite/${Uri.encodeComponent(satelliteId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSatelliteResponse.fromJson(response);
  }

  /// Returns a list of <code>Config</code> objects.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of <code>Configs</code> returned.
  ///
  /// Parameter [nextToken] :
  /// Next token returned in the request of a previous <code>ListConfigs</code>
  /// call. Used to get the next page of results.
  Future<ListConfigsResponse> listConfigs({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConfigsResponse.fromJson(response);
  }

  /// Returns a list of contacts.
  ///
  /// If <code>statusList</code> contains AVAILABLE, the request must include
  /// <code>groundStation</code>, <code>missionprofileArn</code>, and
  /// <code>satelliteArn</code>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [endTime] :
  /// End time of a contact in UTC.
  ///
  /// Parameter [startTime] :
  /// Start time of a contact in UTC.
  ///
  /// Parameter [statusList] :
  /// Status of a contact reservation.
  ///
  /// Parameter [groundStation] :
  /// Name of a ground station.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of contacts returned.
  ///
  /// Parameter [missionProfileArn] :
  /// ARN of a mission profile.
  ///
  /// Parameter [nextToken] :
  /// Next token returned in the request of a previous <code>ListContacts</code>
  /// call. Used to get the next page of results.
  ///
  /// Parameter [satelliteArn] :
  /// ARN of a satellite.
  Future<ListContactsResponse> listContacts({
    required DateTime endTime,
    required DateTime startTime,
    required List<ContactStatus> statusList,
    String? groundStation,
    int? maxResults,
    String? missionProfileArn,
    String? nextToken,
    String? satelliteArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $payload = <String, dynamic>{
      'endTime': unixTimestampToJson(endTime),
      'startTime': unixTimestampToJson(startTime),
      'statusList': statusList.map((e) => e.toValue()).toList(),
      if (groundStation != null) 'groundStation': groundStation,
      if (maxResults != null) 'maxResults': maxResults,
      if (missionProfileArn != null) 'missionProfileArn': missionProfileArn,
      if (nextToken != null) 'nextToken': nextToken,
      if (satelliteArn != null) 'satelliteArn': satelliteArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/contacts',
      exceptionFnMap: _exceptionFns,
    );
    return ListContactsResponse.fromJson(response);
  }

  /// Returns a list of <code>DataflowEndpoint</code> groups.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of dataflow endpoint groups returned.
  ///
  /// Parameter [nextToken] :
  /// Next token returned in the request of a previous
  /// <code>ListDataflowEndpointGroups</code> call. Used to get the next page of
  /// results.
  Future<ListDataflowEndpointGroupsResponse> listDataflowEndpointGroups({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/dataflowEndpointGroup',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataflowEndpointGroupsResponse.fromJson(response);
  }

  /// List existing ephemerides.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [endTime] :
  /// The end time to list in UTC. The operation will return an ephemeris if its
  /// expiration time is within the time range defined by the
  /// <code>startTime</code> and <code>endTime</code>.
  ///
  /// Parameter [satelliteId] :
  /// The AWS Ground Station satellite ID to list ephemeris for.
  ///
  /// Parameter [startTime] :
  /// The start time to list in UTC. The operation will return an ephemeris if
  /// its expiration time is within the time range defined by the
  /// <code>startTime</code> and <code>endTime</code>.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of ephemerides to return.
  ///
  /// Parameter [nextToken] :
  /// Pagination token.
  ///
  /// Parameter [statusList] :
  /// The list of ephemeris status to return.
  Future<ListEphemeridesResponse> listEphemerides({
    required DateTime endTime,
    required String satelliteId,
    required DateTime startTime,
    int? maxResults,
    String? nextToken,
    List<EphemerisStatus>? statusList,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      'endTime': unixTimestampToJson(endTime),
      'satelliteId': satelliteId,
      'startTime': unixTimestampToJson(startTime),
      if (statusList != null)
        'statusList': statusList.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ephemerides',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEphemeridesResponse.fromJson(response);
  }

  /// Returns a list of ground stations.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of ground stations returned.
  ///
  /// Parameter [nextToken] :
  /// Next token that can be supplied in the next call to get the next page of
  /// ground stations.
  ///
  /// Parameter [satelliteId] :
  /// Satellite ID to retrieve on-boarded ground stations.
  Future<ListGroundStationsResponse> listGroundStations({
    int? maxResults,
    String? nextToken,
    String? satelliteId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (satelliteId != null) 'satelliteId': [satelliteId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/groundstation',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGroundStationsResponse.fromJson(response);
  }

  /// Returns a list of mission profiles.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of mission profiles returned.
  ///
  /// Parameter [nextToken] :
  /// Next token returned in the request of a previous
  /// <code>ListMissionProfiles</code> call. Used to get the next page of
  /// results.
  Future<ListMissionProfilesResponse> listMissionProfiles({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/missionprofile',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMissionProfilesResponse.fromJson(response);
  }

  /// Returns a list of satellites.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of satellites returned.
  ///
  /// Parameter [nextToken] :
  /// Next token that can be supplied in the next call to get the next page of
  /// satellites.
  Future<ListSatellitesResponse> listSatellites({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/satellite',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSatellitesResponse.fromJson(response);
  }

  /// Returns a list of tags for a specified resource.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// ARN of a resource.
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

  /// <note>
  /// For use by AWS Ground Station Agent and shouldn't be called directly.
  /// </note>
  /// Registers a new agent with AWS Ground Station.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentDetails] :
  /// Detailed information about the agent being registered.
  ///
  /// Parameter [discoveryData] :
  /// Data for associating an agent with the capabilities it is managing.
  Future<RegisterAgentResponse> registerAgent({
    required AgentDetails agentDetails,
    required DiscoveryData discoveryData,
  }) async {
    final $payload = <String, dynamic>{
      'agentDetails': agentDetails,
      'discoveryData': discoveryData,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/agent',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterAgentResponse.fromJson(response);
  }

  /// Reserves a contact using specified parameters.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [endTime] :
  /// End time of a contact in UTC.
  ///
  /// Parameter [groundStation] :
  /// Name of a ground station.
  ///
  /// Parameter [missionProfileArn] :
  /// ARN of a mission profile.
  ///
  /// Parameter [satelliteArn] :
  /// ARN of a satellite
  ///
  /// Parameter [startTime] :
  /// Start time of a contact in UTC.
  ///
  /// Parameter [tags] :
  /// Tags assigned to a contact.
  Future<ContactIdResponse> reserveContact({
    required DateTime endTime,
    required String groundStation,
    required String missionProfileArn,
    required String satelliteArn,
    required DateTime startTime,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'endTime': unixTimestampToJson(endTime),
      'groundStation': groundStation,
      'missionProfileArn': missionProfileArn,
      'satelliteArn': satelliteArn,
      'startTime': unixTimestampToJson(startTime),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/contact',
      exceptionFnMap: _exceptionFns,
    );
    return ContactIdResponse.fromJson(response);
  }

  /// Assigns a tag to a resource.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// ARN of a resource tag.
  ///
  /// Parameter [tags] :
  /// Tags assigned to a resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deassigns a resource tag.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// ARN of a resource.
  ///
  /// Parameter [tagKeys] :
  /// Keys of a resource tag.
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

  /// <note>
  /// For use by AWS Ground Station Agent and shouldn't be called directly.
  /// </note>
  /// Update the status of the agent.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentId] :
  /// UUID of agent to update.
  ///
  /// Parameter [aggregateStatus] :
  /// Aggregate status for agent.
  ///
  /// Parameter [componentStatuses] :
  /// List of component statuses for agent.
  ///
  /// Parameter [taskId] :
  /// GUID of agent task.
  Future<UpdateAgentStatusResponse> updateAgentStatus({
    required String agentId,
    required AggregateStatus aggregateStatus,
    required List<ComponentStatusData> componentStatuses,
    required String taskId,
  }) async {
    final $payload = <String, dynamic>{
      'aggregateStatus': aggregateStatus,
      'componentStatuses': componentStatuses,
      'taskId': taskId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/agent/${Uri.encodeComponent(agentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAgentStatusResponse.fromJson(response);
  }

  /// Updates the <code>Config</code> used when scheduling contacts.
  ///
  /// Updating a <code>Config</code> will not update the execution parameters
  /// for existing future contacts scheduled with this <code>Config</code>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [configData] :
  /// Parameters of a <code>Config</code>.
  ///
  /// Parameter [configId] :
  /// UUID of a <code>Config</code>.
  ///
  /// Parameter [configType] :
  /// Type of a <code>Config</code>.
  ///
  /// Parameter [name] :
  /// Name of a <code>Config</code>.
  Future<ConfigIdResponse> updateConfig({
    required ConfigTypeData configData,
    required String configId,
    required ConfigCapabilityType configType,
    required String name,
  }) async {
    final $payload = <String, dynamic>{
      'configData': configData,
      'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/config/${Uri.encodeComponent(configType.toValue())}/${Uri.encodeComponent(configId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ConfigIdResponse.fromJson(response);
  }

  /// Updates an existing ephemeris
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [enabled] :
  /// Whether the ephemeris is enabled or not. Changing this value will not
  /// require the ephemeris to be re-validated.
  ///
  /// Parameter [ephemerisId] :
  /// The AWS Ground Station ephemeris ID.
  ///
  /// Parameter [name] :
  /// A name string associated with the ephemeris. Used as a human-readable
  /// identifier for the ephemeris.
  ///
  /// Parameter [priority] :
  /// Customer-provided priority score to establish the order in which
  /// overlapping ephemerides should be used.
  ///
  /// The default for customer-provided ephemeris priority is 1, and higher
  /// numbers take precedence.
  ///
  /// Priority must be 1 or greater
  Future<EphemerisIdResponse> updateEphemeris({
    required bool enabled,
    required String ephemerisId,
    String? name,
    int? priority,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      0,
      99999,
    );
    final $payload = <String, dynamic>{
      'enabled': enabled,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/ephemeris/${Uri.encodeComponent(ephemerisId)}',
      exceptionFnMap: _exceptionFns,
    );
    return EphemerisIdResponse.fromJson(response);
  }

  /// Updates a mission profile.
  ///
  /// Updating a mission profile will not update the execution parameters for
  /// existing future contacts.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [missionProfileId] :
  /// UUID of a mission profile.
  ///
  /// Parameter [contactPostPassDurationSeconds] :
  /// Amount of time after a contact ends that you’d like to receive a Ground
  /// Station Contact State Change event indicating the pass has finished.
  ///
  /// Parameter [contactPrePassDurationSeconds] :
  /// Amount of time after a contact ends that you’d like to receive a Ground
  /// Station Contact State Change event indicating the pass has finished.
  ///
  /// Parameter [dataflowEdges] :
  /// A list of lists of ARNs. Each list of ARNs is an edge, with a <i>from</i>
  /// <code>Config</code> and a <i>to</i> <code>Config</code>.
  ///
  /// Parameter [minimumViableContactDurationSeconds] :
  /// Smallest amount of time in seconds that you’d like to see for an available
  /// contact. AWS Ground Station will not present you with contacts shorter
  /// than this duration.
  ///
  /// Parameter [name] :
  /// Name of a mission profile.
  ///
  /// Parameter [streamsKmsKey] :
  /// KMS key to use for encrypting streams.
  ///
  /// Parameter [streamsKmsRole] :
  /// Role to use for encrypting streams with KMS key.
  ///
  /// Parameter [trackingConfigArn] :
  /// ARN of a tracking <code>Config</code>.
  Future<MissionProfileIdResponse> updateMissionProfile({
    required String missionProfileId,
    int? contactPostPassDurationSeconds,
    int? contactPrePassDurationSeconds,
    List<List<String>>? dataflowEdges,
    int? minimumViableContactDurationSeconds,
    String? name,
    KmsKey? streamsKmsKey,
    String? streamsKmsRole,
    String? trackingConfigArn,
  }) async {
    _s.validateNumRange(
      'contactPostPassDurationSeconds',
      contactPostPassDurationSeconds,
      0,
      21600,
    );
    _s.validateNumRange(
      'contactPrePassDurationSeconds',
      contactPrePassDurationSeconds,
      0,
      21600,
    );
    _s.validateNumRange(
      'minimumViableContactDurationSeconds',
      minimumViableContactDurationSeconds,
      1,
      21600,
    );
    final $payload = <String, dynamic>{
      if (contactPostPassDurationSeconds != null)
        'contactPostPassDurationSeconds': contactPostPassDurationSeconds,
      if (contactPrePassDurationSeconds != null)
        'contactPrePassDurationSeconds': contactPrePassDurationSeconds,
      if (dataflowEdges != null) 'dataflowEdges': dataflowEdges,
      if (minimumViableContactDurationSeconds != null)
        'minimumViableContactDurationSeconds':
            minimumViableContactDurationSeconds,
      if (name != null) 'name': name,
      if (streamsKmsKey != null) 'streamsKmsKey': streamsKmsKey,
      if (streamsKmsRole != null) 'streamsKmsRole': streamsKmsRole,
      if (trackingConfigArn != null) 'trackingConfigArn': trackingConfigArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/missionprofile/${Uri.encodeComponent(missionProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return MissionProfileIdResponse.fromJson(response);
  }
}

/// Detailed information about the agent.
class AgentDetails {
  /// Current agent version.
  final String agentVersion;

  /// List of versions being used by agent components.
  final List<ComponentVersion> componentVersions;

  /// ID of EC2 instance agent is running on.
  final String instanceId;

  /// Type of EC2 instance agent is running on.
  final String instanceType;

  /// List of CPU cores reserved for the agent.
  final List<int>? agentCpuCores;

  /// <note>
  /// This field should not be used. Use agentCpuCores instead.
  /// </note>
  /// List of CPU cores reserved for processes other than the agent running on the
  /// EC2 instance.
  final List<int>? reservedCpuCores;

  AgentDetails({
    required this.agentVersion,
    required this.componentVersions,
    required this.instanceId,
    required this.instanceType,
    this.agentCpuCores,
    this.reservedCpuCores,
  });

  Map<String, dynamic> toJson() {
    final agentVersion = this.agentVersion;
    final componentVersions = this.componentVersions;
    final instanceId = this.instanceId;
    final instanceType = this.instanceType;
    final agentCpuCores = this.agentCpuCores;
    final reservedCpuCores = this.reservedCpuCores;
    return {
      'agentVersion': agentVersion,
      'componentVersions': componentVersions,
      'instanceId': instanceId,
      'instanceType': instanceType,
      if (agentCpuCores != null) 'agentCpuCores': agentCpuCores,
      if (reservedCpuCores != null) 'reservedCpuCores': reservedCpuCores,
    };
  }
}

enum AgentStatus {
  success,
  failed,
  active,
  inactive,
}

extension AgentStatusValueExtension on AgentStatus {
  String toValue() {
    switch (this) {
      case AgentStatus.success:
        return 'SUCCESS';
      case AgentStatus.failed:
        return 'FAILED';
      case AgentStatus.active:
        return 'ACTIVE';
      case AgentStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension AgentStatusFromString on String {
  AgentStatus toAgentStatus() {
    switch (this) {
      case 'SUCCESS':
        return AgentStatus.success;
      case 'FAILED':
        return AgentStatus.failed;
      case 'ACTIVE':
        return AgentStatus.active;
      case 'INACTIVE':
        return AgentStatus.inactive;
    }
    throw Exception('$this is not known in enum AgentStatus');
  }
}

/// Aggregate status of Agent components.
class AggregateStatus {
  /// Aggregate status.
  final AgentStatus status;

  /// Sparse map of failure signatures.
  final Map<String, bool>? signatureMap;

  AggregateStatus({
    required this.status,
    this.signatureMap,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    final signatureMap = this.signatureMap;
    return {
      'status': status.toValue(),
      if (signatureMap != null) 'signatureMap': signatureMap,
    };
  }
}

enum AngleUnits {
  degreeAngle,
  radian,
}

extension AngleUnitsValueExtension on AngleUnits {
  String toValue() {
    switch (this) {
      case AngleUnits.degreeAngle:
        return 'DEGREE_ANGLE';
      case AngleUnits.radian:
        return 'RADIAN';
    }
  }
}

extension AngleUnitsFromString on String {
  AngleUnits toAngleUnits() {
    switch (this) {
      case 'DEGREE_ANGLE':
        return AngleUnits.degreeAngle;
      case 'RADIAN':
        return AngleUnits.radian;
    }
    throw Exception('$this is not known in enum AngleUnits');
  }
}

/// Details about an antenna demod decode <code>Config</code> used in a contact.
class AntennaDemodDecodeDetails {
  /// Name of an antenna demod decode output node used in a contact.
  final String? outputNode;

  AntennaDemodDecodeDetails({
    this.outputNode,
  });

  factory AntennaDemodDecodeDetails.fromJson(Map<String, dynamic> json) {
    return AntennaDemodDecodeDetails(
      outputNode: json['outputNode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputNode = this.outputNode;
    return {
      if (outputNode != null) 'outputNode': outputNode,
    };
  }
}

/// Information about how AWS Ground Station should configure an antenna for
/// downlink during a contact.
class AntennaDownlinkConfig {
  /// Object that describes a spectral <code>Config</code>.
  final SpectrumConfig spectrumConfig;

  AntennaDownlinkConfig({
    required this.spectrumConfig,
  });

  factory AntennaDownlinkConfig.fromJson(Map<String, dynamic> json) {
    return AntennaDownlinkConfig(
      spectrumConfig: SpectrumConfig.fromJson(
          json['spectrumConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final spectrumConfig = this.spectrumConfig;
    return {
      'spectrumConfig': spectrumConfig,
    };
  }
}

/// Information about how AWS Ground Station should conﬁgure an antenna for
/// downlink demod decode during a contact.
class AntennaDownlinkDemodDecodeConfig {
  /// Information about the decode <code>Config</code>.
  final DecodeConfig decodeConfig;

  /// Information about the demodulation <code>Config</code>.
  final DemodulationConfig demodulationConfig;

  /// Information about the spectral <code>Config</code>.
  final SpectrumConfig spectrumConfig;

  AntennaDownlinkDemodDecodeConfig({
    required this.decodeConfig,
    required this.demodulationConfig,
    required this.spectrumConfig,
  });

  factory AntennaDownlinkDemodDecodeConfig.fromJson(Map<String, dynamic> json) {
    return AntennaDownlinkDemodDecodeConfig(
      decodeConfig:
          DecodeConfig.fromJson(json['decodeConfig'] as Map<String, dynamic>),
      demodulationConfig: DemodulationConfig.fromJson(
          json['demodulationConfig'] as Map<String, dynamic>),
      spectrumConfig: SpectrumConfig.fromJson(
          json['spectrumConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final decodeConfig = this.decodeConfig;
    final demodulationConfig = this.demodulationConfig;
    final spectrumConfig = this.spectrumConfig;
    return {
      'decodeConfig': decodeConfig,
      'demodulationConfig': demodulationConfig,
      'spectrumConfig': spectrumConfig,
    };
  }
}

/// Information about the uplink <code>Config</code> of an antenna.
class AntennaUplinkConfig {
  /// Information about the uplink spectral <code>Config</code>.
  final UplinkSpectrumConfig spectrumConfig;

  /// EIRP of the target.
  final Eirp targetEirp;

  /// Whether or not uplink transmit is disabled.
  final bool? transmitDisabled;

  AntennaUplinkConfig({
    required this.spectrumConfig,
    required this.targetEirp,
    this.transmitDisabled,
  });

  factory AntennaUplinkConfig.fromJson(Map<String, dynamic> json) {
    return AntennaUplinkConfig(
      spectrumConfig: UplinkSpectrumConfig.fromJson(
          json['spectrumConfig'] as Map<String, dynamic>),
      targetEirp: Eirp.fromJson(json['targetEirp'] as Map<String, dynamic>),
      transmitDisabled: json['transmitDisabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final spectrumConfig = this.spectrumConfig;
    final targetEirp = this.targetEirp;
    final transmitDisabled = this.transmitDisabled;
    return {
      'spectrumConfig': spectrumConfig,
      'targetEirp': targetEirp,
      if (transmitDisabled != null) 'transmitDisabled': transmitDisabled,
    };
  }
}

enum AuditResults {
  healthy,
  unhealthy,
}

extension AuditResultsValueExtension on AuditResults {
  String toValue() {
    switch (this) {
      case AuditResults.healthy:
        return 'HEALTHY';
      case AuditResults.unhealthy:
        return 'UNHEALTHY';
    }
  }
}

extension AuditResultsFromString on String {
  AuditResults toAuditResults() {
    switch (this) {
      case 'HEALTHY':
        return AuditResults.healthy;
      case 'UNHEALTHY':
        return AuditResults.unhealthy;
    }
    throw Exception('$this is not known in enum AuditResults');
  }
}

/// Information about AwsGroundStationAgentEndpoint.
class AwsGroundStationAgentEndpoint {
  /// The egress address of AgentEndpoint.
  final ConnectionDetails egressAddress;

  /// The ingress address of AgentEndpoint.
  final RangedConnectionDetails ingressAddress;

  /// Name string associated with AgentEndpoint. Used as a human-readable
  /// identifier for AgentEndpoint.
  final String name;

  /// The status of AgentEndpoint.
  final AgentStatus? agentStatus;

  /// The results of the audit.
  final AuditResults? auditResults;

  AwsGroundStationAgentEndpoint({
    required this.egressAddress,
    required this.ingressAddress,
    required this.name,
    this.agentStatus,
    this.auditResults,
  });

  factory AwsGroundStationAgentEndpoint.fromJson(Map<String, dynamic> json) {
    return AwsGroundStationAgentEndpoint(
      egressAddress: ConnectionDetails.fromJson(
          json['egressAddress'] as Map<String, dynamic>),
      ingressAddress: RangedConnectionDetails.fromJson(
          json['ingressAddress'] as Map<String, dynamic>),
      name: json['name'] as String,
      agentStatus: (json['agentStatus'] as String?)?.toAgentStatus(),
      auditResults: (json['auditResults'] as String?)?.toAuditResults(),
    );
  }

  Map<String, dynamic> toJson() {
    final egressAddress = this.egressAddress;
    final ingressAddress = this.ingressAddress;
    final name = this.name;
    final agentStatus = this.agentStatus;
    final auditResults = this.auditResults;
    return {
      'egressAddress': egressAddress,
      'ingressAddress': ingressAddress,
      'name': name,
      if (agentStatus != null) 'agentStatus': agentStatus.toValue(),
      if (auditResults != null) 'auditResults': auditResults.toValue(),
    };
  }
}

enum BandwidthUnits {
  gHz,
  mHz,
  kHz,
}

extension BandwidthUnitsValueExtension on BandwidthUnits {
  String toValue() {
    switch (this) {
      case BandwidthUnits.gHz:
        return 'GHz';
      case BandwidthUnits.mHz:
        return 'MHz';
      case BandwidthUnits.kHz:
        return 'kHz';
    }
  }
}

extension BandwidthUnitsFromString on String {
  BandwidthUnits toBandwidthUnits() {
    switch (this) {
      case 'GHz':
        return BandwidthUnits.gHz;
      case 'MHz':
        return BandwidthUnits.mHz;
      case 'kHz':
        return BandwidthUnits.kHz;
    }
    throw Exception('$this is not known in enum BandwidthUnits');
  }
}

enum CapabilityHealth {
  unhealthy,
  healthy,
}

extension CapabilityHealthValueExtension on CapabilityHealth {
  String toValue() {
    switch (this) {
      case CapabilityHealth.unhealthy:
        return 'UNHEALTHY';
      case CapabilityHealth.healthy:
        return 'HEALTHY';
    }
  }
}

extension CapabilityHealthFromString on String {
  CapabilityHealth toCapabilityHealth() {
    switch (this) {
      case 'UNHEALTHY':
        return CapabilityHealth.unhealthy;
      case 'HEALTHY':
        return CapabilityHealth.healthy;
    }
    throw Exception('$this is not known in enum CapabilityHealth');
  }
}

enum CapabilityHealthReason {
  noRegisteredAgent,
  invalidIpOwnership,
  notAuthorizedToCreateSlr,
  unverifiedIpOwnership,
  initializingDataplane,
  dataplaneFailure,
  healthy,
}

extension CapabilityHealthReasonValueExtension on CapabilityHealthReason {
  String toValue() {
    switch (this) {
      case CapabilityHealthReason.noRegisteredAgent:
        return 'NO_REGISTERED_AGENT';
      case CapabilityHealthReason.invalidIpOwnership:
        return 'INVALID_IP_OWNERSHIP';
      case CapabilityHealthReason.notAuthorizedToCreateSlr:
        return 'NOT_AUTHORIZED_TO_CREATE_SLR';
      case CapabilityHealthReason.unverifiedIpOwnership:
        return 'UNVERIFIED_IP_OWNERSHIP';
      case CapabilityHealthReason.initializingDataplane:
        return 'INITIALIZING_DATAPLANE';
      case CapabilityHealthReason.dataplaneFailure:
        return 'DATAPLANE_FAILURE';
      case CapabilityHealthReason.healthy:
        return 'HEALTHY';
    }
  }
}

extension CapabilityHealthReasonFromString on String {
  CapabilityHealthReason toCapabilityHealthReason() {
    switch (this) {
      case 'NO_REGISTERED_AGENT':
        return CapabilityHealthReason.noRegisteredAgent;
      case 'INVALID_IP_OWNERSHIP':
        return CapabilityHealthReason.invalidIpOwnership;
      case 'NOT_AUTHORIZED_TO_CREATE_SLR':
        return CapabilityHealthReason.notAuthorizedToCreateSlr;
      case 'UNVERIFIED_IP_OWNERSHIP':
        return CapabilityHealthReason.unverifiedIpOwnership;
      case 'INITIALIZING_DATAPLANE':
        return CapabilityHealthReason.initializingDataplane;
      case 'DATAPLANE_FAILURE':
        return CapabilityHealthReason.dataplaneFailure;
      case 'HEALTHY':
        return CapabilityHealthReason.healthy;
    }
    throw Exception('$this is not known in enum CapabilityHealthReason');
  }
}

/// Data on the status of agent components.
class ComponentStatusData {
  /// Capability ARN of the component.
  final String capabilityArn;

  /// The Component type.
  final String componentType;

  /// Dataflow UUID associated with the component.
  final String dataflowId;

  /// Component status.
  final AgentStatus status;

  /// Bytes received by the component.
  final int? bytesReceived;

  /// Bytes sent by the component.
  final int? bytesSent;

  /// Packets dropped by component.
  final int? packetsDropped;

  ComponentStatusData({
    required this.capabilityArn,
    required this.componentType,
    required this.dataflowId,
    required this.status,
    this.bytesReceived,
    this.bytesSent,
    this.packetsDropped,
  });

  Map<String, dynamic> toJson() {
    final capabilityArn = this.capabilityArn;
    final componentType = this.componentType;
    final dataflowId = this.dataflowId;
    final status = this.status;
    final bytesReceived = this.bytesReceived;
    final bytesSent = this.bytesSent;
    final packetsDropped = this.packetsDropped;
    return {
      'capabilityArn': capabilityArn,
      'componentType': componentType,
      'dataflowId': dataflowId,
      'status': status.toValue(),
      if (bytesReceived != null) 'bytesReceived': bytesReceived,
      if (bytesSent != null) 'bytesSent': bytesSent,
      if (packetsDropped != null) 'packetsDropped': packetsDropped,
    };
  }
}

/// Version information for agent components.
class ComponentVersion {
  /// Component type.
  final String componentType;

  /// List of versions.
  final List<String> versions;

  ComponentVersion({
    required this.componentType,
    required this.versions,
  });

  Map<String, dynamic> toJson() {
    final componentType = this.componentType;
    final versions = this.versions;
    return {
      'componentType': componentType,
      'versions': versions,
    };
  }
}

enum ConfigCapabilityType {
  antennaDownlink,
  antennaDownlinkDemodDecode,
  antennaUplink,
  dataflowEndpoint,
  tracking,
  uplinkEcho,
  s3Recording,
}

extension ConfigCapabilityTypeValueExtension on ConfigCapabilityType {
  String toValue() {
    switch (this) {
      case ConfigCapabilityType.antennaDownlink:
        return 'antenna-downlink';
      case ConfigCapabilityType.antennaDownlinkDemodDecode:
        return 'antenna-downlink-demod-decode';
      case ConfigCapabilityType.antennaUplink:
        return 'antenna-uplink';
      case ConfigCapabilityType.dataflowEndpoint:
        return 'dataflow-endpoint';
      case ConfigCapabilityType.tracking:
        return 'tracking';
      case ConfigCapabilityType.uplinkEcho:
        return 'uplink-echo';
      case ConfigCapabilityType.s3Recording:
        return 's3-recording';
    }
  }
}

extension ConfigCapabilityTypeFromString on String {
  ConfigCapabilityType toConfigCapabilityType() {
    switch (this) {
      case 'antenna-downlink':
        return ConfigCapabilityType.antennaDownlink;
      case 'antenna-downlink-demod-decode':
        return ConfigCapabilityType.antennaDownlinkDemodDecode;
      case 'antenna-uplink':
        return ConfigCapabilityType.antennaUplink;
      case 'dataflow-endpoint':
        return ConfigCapabilityType.dataflowEndpoint;
      case 'tracking':
        return ConfigCapabilityType.tracking;
      case 'uplink-echo':
        return ConfigCapabilityType.uplinkEcho;
      case 's3-recording':
        return ConfigCapabilityType.s3Recording;
    }
    throw Exception('$this is not known in enum ConfigCapabilityType');
  }
}

/// Details for certain <code>Config</code> object types in a contact.
class ConfigDetails {
  /// Details for antenna demod decode <code>Config</code> in a contact.
  final AntennaDemodDecodeDetails? antennaDemodDecodeDetails;
  final EndpointDetails? endpointDetails;

  /// Details for an S3 recording <code>Config</code> in a contact.
  final S3RecordingDetails? s3RecordingDetails;

  ConfigDetails({
    this.antennaDemodDecodeDetails,
    this.endpointDetails,
    this.s3RecordingDetails,
  });

  factory ConfigDetails.fromJson(Map<String, dynamic> json) {
    return ConfigDetails(
      antennaDemodDecodeDetails: json['antennaDemodDecodeDetails'] != null
          ? AntennaDemodDecodeDetails.fromJson(
              json['antennaDemodDecodeDetails'] as Map<String, dynamic>)
          : null,
      endpointDetails: json['endpointDetails'] != null
          ? EndpointDetails.fromJson(
              json['endpointDetails'] as Map<String, dynamic>)
          : null,
      s3RecordingDetails: json['s3RecordingDetails'] != null
          ? S3RecordingDetails.fromJson(
              json['s3RecordingDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final antennaDemodDecodeDetails = this.antennaDemodDecodeDetails;
    final endpointDetails = this.endpointDetails;
    final s3RecordingDetails = this.s3RecordingDetails;
    return {
      if (antennaDemodDecodeDetails != null)
        'antennaDemodDecodeDetails': antennaDemodDecodeDetails,
      if (endpointDetails != null) 'endpointDetails': endpointDetails,
      if (s3RecordingDetails != null) 's3RecordingDetails': s3RecordingDetails,
    };
  }
}

/// <p/>
class ConfigIdResponse {
  /// ARN of a <code>Config</code>.
  final String? configArn;

  /// UUID of a <code>Config</code>.
  final String? configId;

  /// Type of a <code>Config</code>.
  final ConfigCapabilityType? configType;

  ConfigIdResponse({
    this.configArn,
    this.configId,
    this.configType,
  });

  factory ConfigIdResponse.fromJson(Map<String, dynamic> json) {
    return ConfigIdResponse(
      configArn: json['configArn'] as String?,
      configId: json['configId'] as String?,
      configType: (json['configType'] as String?)?.toConfigCapabilityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final configArn = this.configArn;
    final configId = this.configId;
    final configType = this.configType;
    return {
      if (configArn != null) 'configArn': configArn,
      if (configId != null) 'configId': configId,
      if (configType != null) 'configType': configType.toValue(),
    };
  }
}

/// An item in a list of <code>Config</code> objects.
class ConfigListItem {
  /// ARN of a <code>Config</code>.
  final String? configArn;

  /// UUID of a <code>Config</code>.
  final String? configId;

  /// Type of a <code>Config</code>.
  final ConfigCapabilityType? configType;

  /// Name of a <code>Config</code>.
  final String? name;

  ConfigListItem({
    this.configArn,
    this.configId,
    this.configType,
    this.name,
  });

  factory ConfigListItem.fromJson(Map<String, dynamic> json) {
    return ConfigListItem(
      configArn: json['configArn'] as String?,
      configId: json['configId'] as String?,
      configType: (json['configType'] as String?)?.toConfigCapabilityType(),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configArn = this.configArn;
    final configId = this.configId;
    final configType = this.configType;
    final name = this.name;
    return {
      if (configArn != null) 'configArn': configArn,
      if (configId != null) 'configId': configId,
      if (configType != null) 'configType': configType.toValue(),
      if (name != null) 'name': name,
    };
  }
}

/// Object containing the parameters of a <code>Config</code>.
///
/// See the subtype definitions for what each type of <code>Config</code>
/// contains.
class ConfigTypeData {
  /// Information about how AWS Ground Station should configure an antenna for
  /// downlink during a contact.
  final AntennaDownlinkConfig? antennaDownlinkConfig;

  /// Information about how AWS Ground Station should conﬁgure an antenna for
  /// downlink demod decode during a contact.
  final AntennaDownlinkDemodDecodeConfig? antennaDownlinkDemodDecodeConfig;

  /// Information about how AWS Ground Station should conﬁgure an antenna for
  /// uplink during a contact.
  final AntennaUplinkConfig? antennaUplinkConfig;

  /// Information about the dataflow endpoint <code>Config</code>.
  final DataflowEndpointConfig? dataflowEndpointConfig;

  /// Information about an S3 recording <code>Config</code>.
  final S3RecordingConfig? s3RecordingConfig;

  /// Object that determines whether tracking should be used during a contact
  /// executed with this <code>Config</code> in the mission profile.
  final TrackingConfig? trackingConfig;

  /// Information about an uplink echo <code>Config</code>.
  ///
  /// Parameters from the <code>AntennaUplinkConfig</code>, corresponding to the
  /// specified <code>AntennaUplinkConfigArn</code>, are used when this
  /// <code>UplinkEchoConfig</code> is used in a contact.
  final UplinkEchoConfig? uplinkEchoConfig;

  ConfigTypeData({
    this.antennaDownlinkConfig,
    this.antennaDownlinkDemodDecodeConfig,
    this.antennaUplinkConfig,
    this.dataflowEndpointConfig,
    this.s3RecordingConfig,
    this.trackingConfig,
    this.uplinkEchoConfig,
  });

  factory ConfigTypeData.fromJson(Map<String, dynamic> json) {
    return ConfigTypeData(
      antennaDownlinkConfig: json['antennaDownlinkConfig'] != null
          ? AntennaDownlinkConfig.fromJson(
              json['antennaDownlinkConfig'] as Map<String, dynamic>)
          : null,
      antennaDownlinkDemodDecodeConfig:
          json['antennaDownlinkDemodDecodeConfig'] != null
              ? AntennaDownlinkDemodDecodeConfig.fromJson(
                  json['antennaDownlinkDemodDecodeConfig']
                      as Map<String, dynamic>)
              : null,
      antennaUplinkConfig: json['antennaUplinkConfig'] != null
          ? AntennaUplinkConfig.fromJson(
              json['antennaUplinkConfig'] as Map<String, dynamic>)
          : null,
      dataflowEndpointConfig: json['dataflowEndpointConfig'] != null
          ? DataflowEndpointConfig.fromJson(
              json['dataflowEndpointConfig'] as Map<String, dynamic>)
          : null,
      s3RecordingConfig: json['s3RecordingConfig'] != null
          ? S3RecordingConfig.fromJson(
              json['s3RecordingConfig'] as Map<String, dynamic>)
          : null,
      trackingConfig: json['trackingConfig'] != null
          ? TrackingConfig.fromJson(
              json['trackingConfig'] as Map<String, dynamic>)
          : null,
      uplinkEchoConfig: json['uplinkEchoConfig'] != null
          ? UplinkEchoConfig.fromJson(
              json['uplinkEchoConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final antennaDownlinkConfig = this.antennaDownlinkConfig;
    final antennaDownlinkDemodDecodeConfig =
        this.antennaDownlinkDemodDecodeConfig;
    final antennaUplinkConfig = this.antennaUplinkConfig;
    final dataflowEndpointConfig = this.dataflowEndpointConfig;
    final s3RecordingConfig = this.s3RecordingConfig;
    final trackingConfig = this.trackingConfig;
    final uplinkEchoConfig = this.uplinkEchoConfig;
    return {
      if (antennaDownlinkConfig != null)
        'antennaDownlinkConfig': antennaDownlinkConfig,
      if (antennaDownlinkDemodDecodeConfig != null)
        'antennaDownlinkDemodDecodeConfig': antennaDownlinkDemodDecodeConfig,
      if (antennaUplinkConfig != null)
        'antennaUplinkConfig': antennaUplinkConfig,
      if (dataflowEndpointConfig != null)
        'dataflowEndpointConfig': dataflowEndpointConfig,
      if (s3RecordingConfig != null) 's3RecordingConfig': s3RecordingConfig,
      if (trackingConfig != null) 'trackingConfig': trackingConfig,
      if (uplinkEchoConfig != null) 'uplinkEchoConfig': uplinkEchoConfig,
    };
  }
}

/// Egress address of AgentEndpoint with an optional mtu.
class ConnectionDetails {
  /// A socket address.
  final SocketAddress socketAddress;

  /// Maximum transmission unit (MTU) size in bytes of a dataflow endpoint.
  final int? mtu;

  ConnectionDetails({
    required this.socketAddress,
    this.mtu,
  });

  factory ConnectionDetails.fromJson(Map<String, dynamic> json) {
    return ConnectionDetails(
      socketAddress:
          SocketAddress.fromJson(json['socketAddress'] as Map<String, dynamic>),
      mtu: json['mtu'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final socketAddress = this.socketAddress;
    final mtu = this.mtu;
    return {
      'socketAddress': socketAddress,
      if (mtu != null) 'mtu': mtu,
    };
  }
}

/// Data describing a contact.
class ContactData {
  /// UUID of a contact.
  final String? contactId;

  /// Status of a contact.
  final ContactStatus? contactStatus;

  /// End time of a contact in UTC.
  final DateTime? endTime;

  /// Error message of a contact.
  final String? errorMessage;

  /// Name of a ground station.
  final String? groundStation;

  /// Maximum elevation angle of a contact.
  final Elevation? maximumElevation;

  /// ARN of a mission profile.
  final String? missionProfileArn;

  /// Amount of time after a contact ends that you’d like to receive a CloudWatch
  /// event indicating the pass has finished.
  final DateTime? postPassEndTime;

  /// Amount of time prior to contact start you’d like to receive a CloudWatch
  /// event indicating an upcoming pass.
  final DateTime? prePassStartTime;

  /// Region of a contact.
  final String? region;

  /// ARN of a satellite.
  final String? satelliteArn;

  /// Start time of a contact in UTC.
  final DateTime? startTime;

  /// Tags assigned to a contact.
  final Map<String, String>? tags;

  /// Projected time in UTC your satellite will set below the <a
  /// href="https://docs.aws.amazon.com/ground-station/latest/ug/site-masks.html">receive
  /// mask</a>. This time is based on the satellite's current active ephemeris for
  /// future contacts and the ephemeris that was active during contact execution
  /// for completed contacts. <i>This field is not present for contacts with a
  /// <code>SCHEDULING</code> or <code>SCHEDULED</code> status.</i>
  final DateTime? visibilityEndTime;

  /// Projected time in UTC your satellite will rise above the <a
  /// href="https://docs.aws.amazon.com/ground-station/latest/ug/site-masks.html">receive
  /// mask</a>. This time is based on the satellite's current active ephemeris for
  /// future contacts and the ephemeris that was active during contact execution
  /// for completed contacts. <i>This field is not present for contacts with a
  /// <code>SCHEDULING</code> or <code>SCHEDULED</code> status.</i>
  final DateTime? visibilityStartTime;

  ContactData({
    this.contactId,
    this.contactStatus,
    this.endTime,
    this.errorMessage,
    this.groundStation,
    this.maximumElevation,
    this.missionProfileArn,
    this.postPassEndTime,
    this.prePassStartTime,
    this.region,
    this.satelliteArn,
    this.startTime,
    this.tags,
    this.visibilityEndTime,
    this.visibilityStartTime,
  });

  factory ContactData.fromJson(Map<String, dynamic> json) {
    return ContactData(
      contactId: json['contactId'] as String?,
      contactStatus: (json['contactStatus'] as String?)?.toContactStatus(),
      endTime: timeStampFromJson(json['endTime']),
      errorMessage: json['errorMessage'] as String?,
      groundStation: json['groundStation'] as String?,
      maximumElevation: json['maximumElevation'] != null
          ? Elevation.fromJson(json['maximumElevation'] as Map<String, dynamic>)
          : null,
      missionProfileArn: json['missionProfileArn'] as String?,
      postPassEndTime: timeStampFromJson(json['postPassEndTime']),
      prePassStartTime: timeStampFromJson(json['prePassStartTime']),
      region: json['region'] as String?,
      satelliteArn: json['satelliteArn'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      visibilityEndTime: timeStampFromJson(json['visibilityEndTime']),
      visibilityStartTime: timeStampFromJson(json['visibilityStartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final contactId = this.contactId;
    final contactStatus = this.contactStatus;
    final endTime = this.endTime;
    final errorMessage = this.errorMessage;
    final groundStation = this.groundStation;
    final maximumElevation = this.maximumElevation;
    final missionProfileArn = this.missionProfileArn;
    final postPassEndTime = this.postPassEndTime;
    final prePassStartTime = this.prePassStartTime;
    final region = this.region;
    final satelliteArn = this.satelliteArn;
    final startTime = this.startTime;
    final tags = this.tags;
    final visibilityEndTime = this.visibilityEndTime;
    final visibilityStartTime = this.visibilityStartTime;
    return {
      if (contactId != null) 'contactId': contactId,
      if (contactStatus != null) 'contactStatus': contactStatus.toValue(),
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (groundStation != null) 'groundStation': groundStation,
      if (maximumElevation != null) 'maximumElevation': maximumElevation,
      if (missionProfileArn != null) 'missionProfileArn': missionProfileArn,
      if (postPassEndTime != null)
        'postPassEndTime': unixTimestampToJson(postPassEndTime),
      if (prePassStartTime != null)
        'prePassStartTime': unixTimestampToJson(prePassStartTime),
      if (region != null) 'region': region,
      if (satelliteArn != null) 'satelliteArn': satelliteArn,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (tags != null) 'tags': tags,
      if (visibilityEndTime != null)
        'visibilityEndTime': unixTimestampToJson(visibilityEndTime),
      if (visibilityStartTime != null)
        'visibilityStartTime': unixTimestampToJson(visibilityStartTime),
    };
  }
}

/// <p/>
class ContactIdResponse {
  /// UUID of a contact.
  final String? contactId;

  ContactIdResponse({
    this.contactId,
  });

  factory ContactIdResponse.fromJson(Map<String, dynamic> json) {
    return ContactIdResponse(
      contactId: json['contactId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactId = this.contactId;
    return {
      if (contactId != null) 'contactId': contactId,
    };
  }
}

enum ContactStatus {
  available,
  awsCancelled,
  awsFailed,
  cancelled,
  cancelling,
  completed,
  failed,
  failedToSchedule,
  pass,
  postpass,
  prepass,
  scheduled,
  scheduling,
}

extension ContactStatusValueExtension on ContactStatus {
  String toValue() {
    switch (this) {
      case ContactStatus.available:
        return 'AVAILABLE';
      case ContactStatus.awsCancelled:
        return 'AWS_CANCELLED';
      case ContactStatus.awsFailed:
        return 'AWS_FAILED';
      case ContactStatus.cancelled:
        return 'CANCELLED';
      case ContactStatus.cancelling:
        return 'CANCELLING';
      case ContactStatus.completed:
        return 'COMPLETED';
      case ContactStatus.failed:
        return 'FAILED';
      case ContactStatus.failedToSchedule:
        return 'FAILED_TO_SCHEDULE';
      case ContactStatus.pass:
        return 'PASS';
      case ContactStatus.postpass:
        return 'POSTPASS';
      case ContactStatus.prepass:
        return 'PREPASS';
      case ContactStatus.scheduled:
        return 'SCHEDULED';
      case ContactStatus.scheduling:
        return 'SCHEDULING';
    }
  }
}

extension ContactStatusFromString on String {
  ContactStatus toContactStatus() {
    switch (this) {
      case 'AVAILABLE':
        return ContactStatus.available;
      case 'AWS_CANCELLED':
        return ContactStatus.awsCancelled;
      case 'AWS_FAILED':
        return ContactStatus.awsFailed;
      case 'CANCELLED':
        return ContactStatus.cancelled;
      case 'CANCELLING':
        return ContactStatus.cancelling;
      case 'COMPLETED':
        return ContactStatus.completed;
      case 'FAILED':
        return ContactStatus.failed;
      case 'FAILED_TO_SCHEDULE':
        return ContactStatus.failedToSchedule;
      case 'PASS':
        return ContactStatus.pass;
      case 'POSTPASS':
        return ContactStatus.postpass;
      case 'PREPASS':
        return ContactStatus.prepass;
      case 'SCHEDULED':
        return ContactStatus.scheduled;
      case 'SCHEDULING':
        return ContactStatus.scheduling;
    }
    throw Exception('$this is not known in enum ContactStatus');
  }
}

enum Criticality {
  preferred,
  removed,
  required,
}

extension CriticalityValueExtension on Criticality {
  String toValue() {
    switch (this) {
      case Criticality.preferred:
        return 'PREFERRED';
      case Criticality.removed:
        return 'REMOVED';
      case Criticality.required:
        return 'REQUIRED';
    }
  }
}

extension CriticalityFromString on String {
  Criticality toCriticality() {
    switch (this) {
      case 'PREFERRED':
        return Criticality.preferred;
      case 'REMOVED':
        return Criticality.removed;
      case 'REQUIRED':
        return Criticality.required;
    }
    throw Exception('$this is not known in enum Criticality');
  }
}

/// Information about a dataflow edge used in a contact.
class DataflowDetail {
  final Destination? destination;

  /// Error message for a dataflow.
  final String? errorMessage;
  final Source? source;

  DataflowDetail({
    this.destination,
    this.errorMessage,
    this.source,
  });

  factory DataflowDetail.fromJson(Map<String, dynamic> json) {
    return DataflowDetail(
      destination: json['destination'] != null
          ? Destination.fromJson(json['destination'] as Map<String, dynamic>)
          : null,
      errorMessage: json['errorMessage'] as String?,
      source: json['source'] != null
          ? Source.fromJson(json['source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final errorMessage = this.errorMessage;
    final source = this.source;
    return {
      if (destination != null) 'destination': destination,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (source != null) 'source': source,
    };
  }
}

/// Information about a dataflow endpoint.
class DataflowEndpoint {
  /// Socket address of a dataflow endpoint.
  final SocketAddress? address;

  /// Maximum transmission unit (MTU) size in bytes of a dataflow endpoint.
  final int? mtu;

  /// Name of a dataflow endpoint.
  final String? name;

  /// Status of a dataflow endpoint.
  final EndpointStatus? status;

  DataflowEndpoint({
    this.address,
    this.mtu,
    this.name,
    this.status,
  });

  factory DataflowEndpoint.fromJson(Map<String, dynamic> json) {
    return DataflowEndpoint(
      address: json['address'] != null
          ? SocketAddress.fromJson(json['address'] as Map<String, dynamic>)
          : null,
      mtu: json['mtu'] as int?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toEndpointStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final mtu = this.mtu;
    final name = this.name;
    final status = this.status;
    return {
      if (address != null) 'address': address,
      if (mtu != null) 'mtu': mtu,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Information about the dataflow endpoint <code>Config</code>.
class DataflowEndpointConfig {
  /// Name of a dataflow endpoint.
  final String dataflowEndpointName;

  /// Region of a dataflow endpoint.
  final String? dataflowEndpointRegion;

  DataflowEndpointConfig({
    required this.dataflowEndpointName,
    this.dataflowEndpointRegion,
  });

  factory DataflowEndpointConfig.fromJson(Map<String, dynamic> json) {
    return DataflowEndpointConfig(
      dataflowEndpointName: json['dataflowEndpointName'] as String,
      dataflowEndpointRegion: json['dataflowEndpointRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataflowEndpointName = this.dataflowEndpointName;
    final dataflowEndpointRegion = this.dataflowEndpointRegion;
    return {
      'dataflowEndpointName': dataflowEndpointName,
      if (dataflowEndpointRegion != null)
        'dataflowEndpointRegion': dataflowEndpointRegion,
    };
  }
}

/// <p/>
class DataflowEndpointGroupIdResponse {
  /// UUID of a dataflow endpoint group.
  final String? dataflowEndpointGroupId;

  DataflowEndpointGroupIdResponse({
    this.dataflowEndpointGroupId,
  });

  factory DataflowEndpointGroupIdResponse.fromJson(Map<String, dynamic> json) {
    return DataflowEndpointGroupIdResponse(
      dataflowEndpointGroupId: json['dataflowEndpointGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataflowEndpointGroupId = this.dataflowEndpointGroupId;
    return {
      if (dataflowEndpointGroupId != null)
        'dataflowEndpointGroupId': dataflowEndpointGroupId,
    };
  }
}

/// Item in a list of <code>DataflowEndpoint</code> groups.
class DataflowEndpointListItem {
  /// ARN of a dataflow endpoint group.
  final String? dataflowEndpointGroupArn;

  /// UUID of a dataflow endpoint group.
  final String? dataflowEndpointGroupId;

  DataflowEndpointListItem({
    this.dataflowEndpointGroupArn,
    this.dataflowEndpointGroupId,
  });

  factory DataflowEndpointListItem.fromJson(Map<String, dynamic> json) {
    return DataflowEndpointListItem(
      dataflowEndpointGroupArn: json['dataflowEndpointGroupArn'] as String?,
      dataflowEndpointGroupId: json['dataflowEndpointGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataflowEndpointGroupArn = this.dataflowEndpointGroupArn;
    final dataflowEndpointGroupId = this.dataflowEndpointGroupId;
    return {
      if (dataflowEndpointGroupArn != null)
        'dataflowEndpointGroupArn': dataflowEndpointGroupArn,
      if (dataflowEndpointGroupId != null)
        'dataflowEndpointGroupId': dataflowEndpointGroupId,
    };
  }
}

/// Information about the decode <code>Config</code>.
class DecodeConfig {
  /// Unvalidated JSON of a decode <code>Config</code>.
  final String unvalidatedJSON;

  DecodeConfig({
    required this.unvalidatedJSON,
  });

  factory DecodeConfig.fromJson(Map<String, dynamic> json) {
    return DecodeConfig(
      unvalidatedJSON: json['unvalidatedJSON'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final unvalidatedJSON = this.unvalidatedJSON;
    return {
      'unvalidatedJSON': unvalidatedJSON,
    };
  }
}

/// Information about the demodulation <code>Config</code>.
class DemodulationConfig {
  /// Unvalidated JSON of a demodulation <code>Config</code>.
  final String unvalidatedJSON;

  DemodulationConfig({
    required this.unvalidatedJSON,
  });

  factory DemodulationConfig.fromJson(Map<String, dynamic> json) {
    return DemodulationConfig(
      unvalidatedJSON: json['unvalidatedJSON'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final unvalidatedJSON = this.unvalidatedJSON;
    return {
      'unvalidatedJSON': unvalidatedJSON,
    };
  }
}

/// <p/>
class DescribeContactResponse {
  /// UUID of a contact.
  final String? contactId;

  /// Status of a contact.
  final ContactStatus? contactStatus;

  /// List describing source and destination details for each dataflow edge.
  final List<DataflowDetail>? dataflowList;

  /// End time of a contact in UTC.
  final DateTime? endTime;

  /// Error message for a contact.
  final String? errorMessage;

  /// Ground station for a contact.
  final String? groundStation;

  /// Maximum elevation angle of a contact.
  final Elevation? maximumElevation;

  /// ARN of a mission profile.
  final String? missionProfileArn;

  /// Amount of time after a contact ends that you’d like to receive a CloudWatch
  /// event indicating the pass has finished.
  final DateTime? postPassEndTime;

  /// Amount of time prior to contact start you’d like to receive a CloudWatch
  /// event indicating an upcoming pass.
  final DateTime? prePassStartTime;

  /// Region of a contact.
  final String? region;

  /// ARN of a satellite.
  final String? satelliteArn;

  /// Start time of a contact in UTC.
  final DateTime? startTime;

  /// Tags assigned to a contact.
  final Map<String, String>? tags;

  /// Projected time in UTC your satellite will set below the <a
  /// href="https://docs.aws.amazon.com/ground-station/latest/ug/site-masks.html">receive
  /// mask</a>. This time is based on the satellite's current active ephemeris for
  /// future contacts and the ephemeris that was active during contact execution
  /// for completed contacts.
  final DateTime? visibilityEndTime;

  /// Projected time in UTC your satellite will rise above the <a
  /// href="https://docs.aws.amazon.com/ground-station/latest/ug/site-masks.html">receive
  /// mask</a>. This time is based on the satellite's current active ephemeris for
  /// future contacts and the ephemeris that was active during contact execution
  /// for completed contacts.
  final DateTime? visibilityStartTime;

  DescribeContactResponse({
    this.contactId,
    this.contactStatus,
    this.dataflowList,
    this.endTime,
    this.errorMessage,
    this.groundStation,
    this.maximumElevation,
    this.missionProfileArn,
    this.postPassEndTime,
    this.prePassStartTime,
    this.region,
    this.satelliteArn,
    this.startTime,
    this.tags,
    this.visibilityEndTime,
    this.visibilityStartTime,
  });

  factory DescribeContactResponse.fromJson(Map<String, dynamic> json) {
    return DescribeContactResponse(
      contactId: json['contactId'] as String?,
      contactStatus: (json['contactStatus'] as String?)?.toContactStatus(),
      dataflowList: (json['dataflowList'] as List?)
          ?.whereNotNull()
          .map((e) => DataflowDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      endTime: timeStampFromJson(json['endTime']),
      errorMessage: json['errorMessage'] as String?,
      groundStation: json['groundStation'] as String?,
      maximumElevation: json['maximumElevation'] != null
          ? Elevation.fromJson(json['maximumElevation'] as Map<String, dynamic>)
          : null,
      missionProfileArn: json['missionProfileArn'] as String?,
      postPassEndTime: timeStampFromJson(json['postPassEndTime']),
      prePassStartTime: timeStampFromJson(json['prePassStartTime']),
      region: json['region'] as String?,
      satelliteArn: json['satelliteArn'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      visibilityEndTime: timeStampFromJson(json['visibilityEndTime']),
      visibilityStartTime: timeStampFromJson(json['visibilityStartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final contactId = this.contactId;
    final contactStatus = this.contactStatus;
    final dataflowList = this.dataflowList;
    final endTime = this.endTime;
    final errorMessage = this.errorMessage;
    final groundStation = this.groundStation;
    final maximumElevation = this.maximumElevation;
    final missionProfileArn = this.missionProfileArn;
    final postPassEndTime = this.postPassEndTime;
    final prePassStartTime = this.prePassStartTime;
    final region = this.region;
    final satelliteArn = this.satelliteArn;
    final startTime = this.startTime;
    final tags = this.tags;
    final visibilityEndTime = this.visibilityEndTime;
    final visibilityStartTime = this.visibilityStartTime;
    return {
      if (contactId != null) 'contactId': contactId,
      if (contactStatus != null) 'contactStatus': contactStatus.toValue(),
      if (dataflowList != null) 'dataflowList': dataflowList,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (groundStation != null) 'groundStation': groundStation,
      if (maximumElevation != null) 'maximumElevation': maximumElevation,
      if (missionProfileArn != null) 'missionProfileArn': missionProfileArn,
      if (postPassEndTime != null)
        'postPassEndTime': unixTimestampToJson(postPassEndTime),
      if (prePassStartTime != null)
        'prePassStartTime': unixTimestampToJson(prePassStartTime),
      if (region != null) 'region': region,
      if (satelliteArn != null) 'satelliteArn': satelliteArn,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (tags != null) 'tags': tags,
      if (visibilityEndTime != null)
        'visibilityEndTime': unixTimestampToJson(visibilityEndTime),
      if (visibilityStartTime != null)
        'visibilityStartTime': unixTimestampToJson(visibilityStartTime),
    };
  }
}

class DescribeEphemerisResponse {
  /// The time the ephemeris was uploaded in UTC.
  final DateTime? creationTime;

  /// Whether or not the ephemeris is enabled.
  final bool? enabled;

  /// The AWS Ground Station ephemeris ID.
  final String? ephemerisId;

  /// Reason that an ephemeris failed validation. Only provided for ephemerides
  /// with <code>INVALID</code> status.
  final EphemerisInvalidReason? invalidReason;

  /// A name string associated with the ephemeris. Used as a human-readable
  /// identifier for the ephemeris.
  final String? name;

  /// Customer-provided priority score to establish the order in which overlapping
  /// ephemerides should be used.
  ///
  /// The default for customer-provided ephemeris priority is 1, and higher
  /// numbers take precedence.
  ///
  /// Priority must be 1 or greater
  final int? priority;

  /// The AWS Ground Station satellite ID associated with ephemeris.
  final String? satelliteId;

  /// The status of the ephemeris.
  final EphemerisStatus? status;

  /// Supplied ephemeris data.
  final EphemerisTypeDescription? suppliedData;

  /// Tags assigned to an ephemeris.
  final Map<String, String>? tags;

  DescribeEphemerisResponse({
    this.creationTime,
    this.enabled,
    this.ephemerisId,
    this.invalidReason,
    this.name,
    this.priority,
    this.satelliteId,
    this.status,
    this.suppliedData,
    this.tags,
  });

  factory DescribeEphemerisResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEphemerisResponse(
      creationTime: timeStampFromJson(json['creationTime']),
      enabled: json['enabled'] as bool?,
      ephemerisId: json['ephemerisId'] as String?,
      invalidReason:
          (json['invalidReason'] as String?)?.toEphemerisInvalidReason(),
      name: json['name'] as String?,
      priority: json['priority'] as int?,
      satelliteId: json['satelliteId'] as String?,
      status: (json['status'] as String?)?.toEphemerisStatus(),
      suppliedData: json['suppliedData'] != null
          ? EphemerisTypeDescription.fromJson(
              json['suppliedData'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final enabled = this.enabled;
    final ephemerisId = this.ephemerisId;
    final invalidReason = this.invalidReason;
    final name = this.name;
    final priority = this.priority;
    final satelliteId = this.satelliteId;
    final status = this.status;
    final suppliedData = this.suppliedData;
    final tags = this.tags;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (enabled != null) 'enabled': enabled,
      if (ephemerisId != null) 'ephemerisId': ephemerisId,
      if (invalidReason != null) 'invalidReason': invalidReason.toValue(),
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
      if (satelliteId != null) 'satelliteId': satelliteId,
      if (status != null) 'status': status.toValue(),
      if (suppliedData != null) 'suppliedData': suppliedData,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Dataflow details for the destination side.
class Destination {
  /// Additional details for a <code>Config</code>, if type is dataflow endpoint
  /// or antenna demod decode.
  final ConfigDetails? configDetails;

  /// UUID of a <code>Config</code>.
  final String? configId;

  /// Type of a <code>Config</code>.
  final ConfigCapabilityType? configType;

  /// Region of a dataflow destination.
  final String? dataflowDestinationRegion;

  Destination({
    this.configDetails,
    this.configId,
    this.configType,
    this.dataflowDestinationRegion,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      configDetails: json['configDetails'] != null
          ? ConfigDetails.fromJson(
              json['configDetails'] as Map<String, dynamic>)
          : null,
      configId: json['configId'] as String?,
      configType: (json['configType'] as String?)?.toConfigCapabilityType(),
      dataflowDestinationRegion: json['dataflowDestinationRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configDetails = this.configDetails;
    final configId = this.configId;
    final configType = this.configType;
    final dataflowDestinationRegion = this.dataflowDestinationRegion;
    return {
      if (configDetails != null) 'configDetails': configDetails,
      if (configId != null) 'configId': configId,
      if (configType != null) 'configType': configType.toValue(),
      if (dataflowDestinationRegion != null)
        'dataflowDestinationRegion': dataflowDestinationRegion,
    };
  }
}

/// Data for agent discovery.
class DiscoveryData {
  /// List of capabilities to associate with agent.
  final List<String> capabilityArns;

  /// List of private IP addresses to associate with agent.
  final List<String> privateIpAddresses;

  /// List of public IP addresses to associate with agent.
  final List<String> publicIpAddresses;

  DiscoveryData({
    required this.capabilityArns,
    required this.privateIpAddresses,
    required this.publicIpAddresses,
  });

  Map<String, dynamic> toJson() {
    final capabilityArns = this.capabilityArns;
    final privateIpAddresses = this.privateIpAddresses;
    final publicIpAddresses = this.publicIpAddresses;
    return {
      'capabilityArns': capabilityArns,
      'privateIpAddresses': privateIpAddresses,
      'publicIpAddresses': publicIpAddresses,
    };
  }
}

/// Object that represents EIRP.
class Eirp {
  /// Units of an EIRP.
  final EirpUnits units;

  /// Value of an EIRP. Valid values are between 20.0 to 50.0 dBW.
  final double value;

  Eirp({
    required this.units,
    required this.value,
  });

  factory Eirp.fromJson(Map<String, dynamic> json) {
    return Eirp(
      units: (json['units'] as String).toEirpUnits(),
      value: json['value'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final units = this.units;
    final value = this.value;
    return {
      'units': units.toValue(),
      'value': value,
    };
  }
}

enum EirpUnits {
  dbw,
}

extension EirpUnitsValueExtension on EirpUnits {
  String toValue() {
    switch (this) {
      case EirpUnits.dbw:
        return 'dBW';
    }
  }
}

extension EirpUnitsFromString on String {
  EirpUnits toEirpUnits() {
    switch (this) {
      case 'dBW':
        return EirpUnits.dbw;
    }
    throw Exception('$this is not known in enum EirpUnits');
  }
}

/// Elevation angle of the satellite in the sky during a contact.
class Elevation {
  /// Elevation angle units.
  final AngleUnits unit;

  /// Elevation angle value.
  final double value;

  Elevation({
    required this.unit,
    required this.value,
  });

  factory Elevation.fromJson(Map<String, dynamic> json) {
    return Elevation(
      unit: (json['unit'] as String).toAngleUnits(),
      value: json['value'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      'unit': unit.toValue(),
      'value': value,
    };
  }
}

/// Information about the endpoint details.
class EndpointDetails {
  /// An agent endpoint.
  final AwsGroundStationAgentEndpoint? awsGroundStationAgentEndpoint;

  /// A dataflow endpoint.
  final DataflowEndpoint? endpoint;

  /// Health reasons for a dataflow endpoint. This field is ignored when calling
  /// <code>CreateDataflowEndpointGroup</code>.
  final List<CapabilityHealthReason>? healthReasons;

  /// A dataflow endpoint health status. This field is ignored when calling
  /// <code>CreateDataflowEndpointGroup</code>.
  final CapabilityHealth? healthStatus;

  /// Endpoint security details including a list of subnets, a list of security
  /// groups and a role to connect streams to instances.
  final SecurityDetails? securityDetails;

  EndpointDetails({
    this.awsGroundStationAgentEndpoint,
    this.endpoint,
    this.healthReasons,
    this.healthStatus,
    this.securityDetails,
  });

  factory EndpointDetails.fromJson(Map<String, dynamic> json) {
    return EndpointDetails(
      awsGroundStationAgentEndpoint:
          json['awsGroundStationAgentEndpoint'] != null
              ? AwsGroundStationAgentEndpoint.fromJson(
                  json['awsGroundStationAgentEndpoint'] as Map<String, dynamic>)
              : null,
      endpoint: json['endpoint'] != null
          ? DataflowEndpoint.fromJson(json['endpoint'] as Map<String, dynamic>)
          : null,
      healthReasons: (json['healthReasons'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toCapabilityHealthReason())
          .toList(),
      healthStatus: (json['healthStatus'] as String?)?.toCapabilityHealth(),
      securityDetails: json['securityDetails'] != null
          ? SecurityDetails.fromJson(
              json['securityDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsGroundStationAgentEndpoint = this.awsGroundStationAgentEndpoint;
    final endpoint = this.endpoint;
    final healthReasons = this.healthReasons;
    final healthStatus = this.healthStatus;
    final securityDetails = this.securityDetails;
    return {
      if (awsGroundStationAgentEndpoint != null)
        'awsGroundStationAgentEndpoint': awsGroundStationAgentEndpoint,
      if (endpoint != null) 'endpoint': endpoint,
      if (healthReasons != null)
        'healthReasons': healthReasons.map((e) => e.toValue()).toList(),
      if (healthStatus != null) 'healthStatus': healthStatus.toValue(),
      if (securityDetails != null) 'securityDetails': securityDetails,
    };
  }
}

enum EndpointStatus {
  created,
  creating,
  deleted,
  deleting,
  failed,
}

extension EndpointStatusValueExtension on EndpointStatus {
  String toValue() {
    switch (this) {
      case EndpointStatus.created:
        return 'created';
      case EndpointStatus.creating:
        return 'creating';
      case EndpointStatus.deleted:
        return 'deleted';
      case EndpointStatus.deleting:
        return 'deleting';
      case EndpointStatus.failed:
        return 'failed';
    }
  }
}

extension EndpointStatusFromString on String {
  EndpointStatus toEndpointStatus() {
    switch (this) {
      case 'created':
        return EndpointStatus.created;
      case 'creating':
        return EndpointStatus.creating;
      case 'deleted':
        return EndpointStatus.deleted;
      case 'deleting':
        return EndpointStatus.deleting;
      case 'failed':
        return EndpointStatus.failed;
    }
    throw Exception('$this is not known in enum EndpointStatus');
  }
}

/// Ephemeris data.
class EphemerisData {
  final OEMEphemeris? oem;
  final TLEEphemeris? tle;

  EphemerisData({
    this.oem,
    this.tle,
  });

  Map<String, dynamic> toJson() {
    final oem = this.oem;
    final tle = this.tle;
    return {
      if (oem != null) 'oem': oem,
      if (tle != null) 'tle': tle,
    };
  }
}

/// Description of ephemeris.
class EphemerisDescription {
  /// Supplied ephemeris data.
  final String? ephemerisData;

  /// Source S3 object used for the ephemeris.
  final S3Object? sourceS3Object;

  EphemerisDescription({
    this.ephemerisData,
    this.sourceS3Object,
  });

  factory EphemerisDescription.fromJson(Map<String, dynamic> json) {
    return EphemerisDescription(
      ephemerisData: json['ephemerisData'] as String?,
      sourceS3Object: json['sourceS3Object'] != null
          ? S3Object.fromJson(json['sourceS3Object'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ephemerisData = this.ephemerisData;
    final sourceS3Object = this.sourceS3Object;
    return {
      if (ephemerisData != null) 'ephemerisData': ephemerisData,
      if (sourceS3Object != null) 'sourceS3Object': sourceS3Object,
    };
  }
}

class EphemerisIdResponse {
  /// The AWS Ground Station ephemeris ID.
  final String? ephemerisId;

  EphemerisIdResponse({
    this.ephemerisId,
  });

  factory EphemerisIdResponse.fromJson(Map<String, dynamic> json) {
    return EphemerisIdResponse(
      ephemerisId: json['ephemerisId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ephemerisId = this.ephemerisId;
    return {
      if (ephemerisId != null) 'ephemerisId': ephemerisId,
    };
  }
}

enum EphemerisInvalidReason {
  metadataInvalid,
  timeRangeInvalid,
  trajectoryInvalid,
  kmsKeyInvalid,
  validationError,
}

extension EphemerisInvalidReasonValueExtension on EphemerisInvalidReason {
  String toValue() {
    switch (this) {
      case EphemerisInvalidReason.metadataInvalid:
        return 'METADATA_INVALID';
      case EphemerisInvalidReason.timeRangeInvalid:
        return 'TIME_RANGE_INVALID';
      case EphemerisInvalidReason.trajectoryInvalid:
        return 'TRAJECTORY_INVALID';
      case EphemerisInvalidReason.kmsKeyInvalid:
        return 'KMS_KEY_INVALID';
      case EphemerisInvalidReason.validationError:
        return 'VALIDATION_ERROR';
    }
  }
}

extension EphemerisInvalidReasonFromString on String {
  EphemerisInvalidReason toEphemerisInvalidReason() {
    switch (this) {
      case 'METADATA_INVALID':
        return EphemerisInvalidReason.metadataInvalid;
      case 'TIME_RANGE_INVALID':
        return EphemerisInvalidReason.timeRangeInvalid;
      case 'TRAJECTORY_INVALID':
        return EphemerisInvalidReason.trajectoryInvalid;
      case 'KMS_KEY_INVALID':
        return EphemerisInvalidReason.kmsKeyInvalid;
      case 'VALIDATION_ERROR':
        return EphemerisInvalidReason.validationError;
    }
    throw Exception('$this is not known in enum EphemerisInvalidReason');
  }
}

/// Ephemeris item.
class EphemerisItem {
  /// The time the ephemeris was uploaded in UTC.
  final DateTime? creationTime;

  /// Whether or not the ephemeris is enabled.
  final bool? enabled;

  /// The AWS Ground Station ephemeris ID.
  final String? ephemerisId;

  /// A name string associated with the ephemeris. Used as a human-readable
  /// identifier for the ephemeris.
  final String? name;

  /// Customer-provided priority score to establish the order in which overlapping
  /// ephemerides should be used.
  ///
  /// The default for customer-provided ephemeris priority is 1, and higher
  /// numbers take precedence.
  ///
  /// Priority must be 1 or greater
  final int? priority;

  /// Source S3 object used for the ephemeris.
  final S3Object? sourceS3Object;

  /// The status of the ephemeris.
  final EphemerisStatus? status;

  EphemerisItem({
    this.creationTime,
    this.enabled,
    this.ephemerisId,
    this.name,
    this.priority,
    this.sourceS3Object,
    this.status,
  });

  factory EphemerisItem.fromJson(Map<String, dynamic> json) {
    return EphemerisItem(
      creationTime: timeStampFromJson(json['creationTime']),
      enabled: json['enabled'] as bool?,
      ephemerisId: json['ephemerisId'] as String?,
      name: json['name'] as String?,
      priority: json['priority'] as int?,
      sourceS3Object: json['sourceS3Object'] != null
          ? S3Object.fromJson(json['sourceS3Object'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toEphemerisStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final enabled = this.enabled;
    final ephemerisId = this.ephemerisId;
    final name = this.name;
    final priority = this.priority;
    final sourceS3Object = this.sourceS3Object;
    final status = this.status;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (enabled != null) 'enabled': enabled,
      if (ephemerisId != null) 'ephemerisId': ephemerisId,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
      if (sourceS3Object != null) 'sourceS3Object': sourceS3Object,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Metadata describing a particular ephemeris.
class EphemerisMetaData {
  /// The <code>EphemerisSource</code> that generated a given ephemeris.
  final EphemerisSource source;

  /// UUID of a customer-provided ephemeris.
  ///
  /// This field is not populated for default ephemerides from Space Track.
  final String? ephemerisId;

  /// The epoch of a default, ephemeris from Space Track in UTC.
  ///
  /// This field is not populated for customer-provided ephemerides.
  final DateTime? epoch;

  /// A name string associated with the ephemeris. Used as a human-readable
  /// identifier for the ephemeris.
  ///
  /// A name is only returned for customer-provider ephemerides that have a name
  /// associated.
  final String? name;

  EphemerisMetaData({
    required this.source,
    this.ephemerisId,
    this.epoch,
    this.name,
  });

  factory EphemerisMetaData.fromJson(Map<String, dynamic> json) {
    return EphemerisMetaData(
      source: (json['source'] as String).toEphemerisSource(),
      ephemerisId: json['ephemerisId'] as String?,
      epoch: timeStampFromJson(json['epoch']),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final ephemerisId = this.ephemerisId;
    final epoch = this.epoch;
    final name = this.name;
    return {
      'source': source.toValue(),
      if (ephemerisId != null) 'ephemerisId': ephemerisId,
      if (epoch != null) 'epoch': unixTimestampToJson(epoch),
      if (name != null) 'name': name,
    };
  }
}

enum EphemerisSource {
  customerProvided,
  spaceTrack,
}

extension EphemerisSourceValueExtension on EphemerisSource {
  String toValue() {
    switch (this) {
      case EphemerisSource.customerProvided:
        return 'CUSTOMER_PROVIDED';
      case EphemerisSource.spaceTrack:
        return 'SPACE_TRACK';
    }
  }
}

extension EphemerisSourceFromString on String {
  EphemerisSource toEphemerisSource() {
    switch (this) {
      case 'CUSTOMER_PROVIDED':
        return EphemerisSource.customerProvided;
      case 'SPACE_TRACK':
        return EphemerisSource.spaceTrack;
    }
    throw Exception('$this is not known in enum EphemerisSource');
  }
}

enum EphemerisStatus {
  validating,
  invalid,
  error,
  enabled,
  disabled,
  expired,
}

extension EphemerisStatusValueExtension on EphemerisStatus {
  String toValue() {
    switch (this) {
      case EphemerisStatus.validating:
        return 'VALIDATING';
      case EphemerisStatus.invalid:
        return 'INVALID';
      case EphemerisStatus.error:
        return 'ERROR';
      case EphemerisStatus.enabled:
        return 'ENABLED';
      case EphemerisStatus.disabled:
        return 'DISABLED';
      case EphemerisStatus.expired:
        return 'EXPIRED';
    }
  }
}

extension EphemerisStatusFromString on String {
  EphemerisStatus toEphemerisStatus() {
    switch (this) {
      case 'VALIDATING':
        return EphemerisStatus.validating;
      case 'INVALID':
        return EphemerisStatus.invalid;
      case 'ERROR':
        return EphemerisStatus.error;
      case 'ENABLED':
        return EphemerisStatus.enabled;
      case 'DISABLED':
        return EphemerisStatus.disabled;
      case 'EXPIRED':
        return EphemerisStatus.expired;
    }
    throw Exception('$this is not known in enum EphemerisStatus');
  }
}

/// <p/>
class EphemerisTypeDescription {
  final EphemerisDescription? oem;
  final EphemerisDescription? tle;

  EphemerisTypeDescription({
    this.oem,
    this.tle,
  });

  factory EphemerisTypeDescription.fromJson(Map<String, dynamic> json) {
    return EphemerisTypeDescription(
      oem: json['oem'] != null
          ? EphemerisDescription.fromJson(json['oem'] as Map<String, dynamic>)
          : null,
      tle: json['tle'] != null
          ? EphemerisDescription.fromJson(json['tle'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final oem = this.oem;
    final tle = this.tle;
    return {
      if (oem != null) 'oem': oem,
      if (tle != null) 'tle': tle,
    };
  }
}

/// Object that describes the frequency.
class Frequency {
  /// Frequency units.
  final FrequencyUnits units;

  /// Frequency value. Valid values are between 2200 to 2300 MHz and 7750 to 8400
  /// MHz for downlink and 2025 to 2120 MHz for uplink.
  final double value;

  Frequency({
    required this.units,
    required this.value,
  });

  factory Frequency.fromJson(Map<String, dynamic> json) {
    return Frequency(
      units: (json['units'] as String).toFrequencyUnits(),
      value: json['value'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final units = this.units;
    final value = this.value;
    return {
      'units': units.toValue(),
      'value': value,
    };
  }
}

/// Object that describes the frequency bandwidth.
class FrequencyBandwidth {
  /// Frequency bandwidth units.
  final BandwidthUnits units;

  /// Frequency bandwidth value. AWS Ground Station currently has the following
  /// bandwidth limitations:
  ///
  /// <ul>
  /// <li>
  /// For <code>AntennaDownlinkDemodDecodeconfig</code>, valid values are between
  /// 125 kHz to 650 MHz.
  /// </li>
  /// <li>
  /// For <code>AntennaDownlinkconfig</code>, valid values are between 10 kHz to
  /// 54 MHz.
  /// </li>
  /// <li>
  /// For <code>AntennaUplinkConfig</code>, valid values are between 10 kHz to 54
  /// MHz.
  /// </li>
  /// </ul>
  final double value;

  FrequencyBandwidth({
    required this.units,
    required this.value,
  });

  factory FrequencyBandwidth.fromJson(Map<String, dynamic> json) {
    return FrequencyBandwidth(
      units: (json['units'] as String).toBandwidthUnits(),
      value: json['value'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final units = this.units;
    final value = this.value;
    return {
      'units': units.toValue(),
      'value': value,
    };
  }
}

enum FrequencyUnits {
  gHz,
  mHz,
  kHz,
}

extension FrequencyUnitsValueExtension on FrequencyUnits {
  String toValue() {
    switch (this) {
      case FrequencyUnits.gHz:
        return 'GHz';
      case FrequencyUnits.mHz:
        return 'MHz';
      case FrequencyUnits.kHz:
        return 'kHz';
    }
  }
}

extension FrequencyUnitsFromString on String {
  FrequencyUnits toFrequencyUnits() {
    switch (this) {
      case 'GHz':
        return FrequencyUnits.gHz;
      case 'MHz':
        return FrequencyUnits.mHz;
      case 'kHz':
        return FrequencyUnits.kHz;
    }
    throw Exception('$this is not known in enum FrequencyUnits');
  }
}

class GetAgentConfigurationResponse {
  /// UUID of agent.
  final String? agentId;

  /// Tasking document for agent.
  final String? taskingDocument;

  GetAgentConfigurationResponse({
    this.agentId,
    this.taskingDocument,
  });

  factory GetAgentConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetAgentConfigurationResponse(
      agentId: json['agentId'] as String?,
      taskingDocument: json['taskingDocument'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentId = this.agentId;
    final taskingDocument = this.taskingDocument;
    return {
      if (agentId != null) 'agentId': agentId,
      if (taskingDocument != null) 'taskingDocument': taskingDocument,
    };
  }
}

/// <p/>
class GetConfigResponse {
  /// ARN of a <code>Config</code>
  final String configArn;

  /// Data elements in a <code>Config</code>.
  final ConfigTypeData configData;

  /// UUID of a <code>Config</code>.
  final String configId;

  /// Name of a <code>Config</code>.
  final String name;

  /// Type of a <code>Config</code>.
  final ConfigCapabilityType? configType;

  /// Tags assigned to a <code>Config</code>.
  final Map<String, String>? tags;

  GetConfigResponse({
    required this.configArn,
    required this.configData,
    required this.configId,
    required this.name,
    this.configType,
    this.tags,
  });

  factory GetConfigResponse.fromJson(Map<String, dynamic> json) {
    return GetConfigResponse(
      configArn: json['configArn'] as String,
      configData:
          ConfigTypeData.fromJson(json['configData'] as Map<String, dynamic>),
      configId: json['configId'] as String,
      name: json['name'] as String,
      configType: (json['configType'] as String?)?.toConfigCapabilityType(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final configArn = this.configArn;
    final configData = this.configData;
    final configId = this.configId;
    final name = this.name;
    final configType = this.configType;
    final tags = this.tags;
    return {
      'configArn': configArn,
      'configData': configData,
      'configId': configId,
      'name': name,
      if (configType != null) 'configType': configType.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// <p/>
class GetDataflowEndpointGroupResponse {
  /// Amount of time, in seconds, after a contact ends that the Ground Station
  /// Dataflow Endpoint Group will be in a <code>POSTPASS</code> state. A Ground
  /// Station Dataflow Endpoint Group State Change event will be emitted when the
  /// Dataflow Endpoint Group enters and exits the <code>POSTPASS</code> state.
  final int? contactPostPassDurationSeconds;

  /// Amount of time, in seconds, before a contact starts that the Ground Station
  /// Dataflow Endpoint Group will be in a <code>PREPASS</code> state. A Ground
  /// Station Dataflow Endpoint Group State Change event will be emitted when the
  /// Dataflow Endpoint Group enters and exits the <code>PREPASS</code> state.
  final int? contactPrePassDurationSeconds;

  /// ARN of a dataflow endpoint group.
  final String? dataflowEndpointGroupArn;

  /// UUID of a dataflow endpoint group.
  final String? dataflowEndpointGroupId;

  /// Details of a dataflow endpoint.
  final List<EndpointDetails>? endpointsDetails;

  /// Tags assigned to a dataflow endpoint group.
  final Map<String, String>? tags;

  GetDataflowEndpointGroupResponse({
    this.contactPostPassDurationSeconds,
    this.contactPrePassDurationSeconds,
    this.dataflowEndpointGroupArn,
    this.dataflowEndpointGroupId,
    this.endpointsDetails,
    this.tags,
  });

  factory GetDataflowEndpointGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetDataflowEndpointGroupResponse(
      contactPostPassDurationSeconds:
          json['contactPostPassDurationSeconds'] as int?,
      contactPrePassDurationSeconds:
          json['contactPrePassDurationSeconds'] as int?,
      dataflowEndpointGroupArn: json['dataflowEndpointGroupArn'] as String?,
      dataflowEndpointGroupId: json['dataflowEndpointGroupId'] as String?,
      endpointsDetails: (json['endpointsDetails'] as List?)
          ?.whereNotNull()
          .map((e) => EndpointDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final contactPostPassDurationSeconds = this.contactPostPassDurationSeconds;
    final contactPrePassDurationSeconds = this.contactPrePassDurationSeconds;
    final dataflowEndpointGroupArn = this.dataflowEndpointGroupArn;
    final dataflowEndpointGroupId = this.dataflowEndpointGroupId;
    final endpointsDetails = this.endpointsDetails;
    final tags = this.tags;
    return {
      if (contactPostPassDurationSeconds != null)
        'contactPostPassDurationSeconds': contactPostPassDurationSeconds,
      if (contactPrePassDurationSeconds != null)
        'contactPrePassDurationSeconds': contactPrePassDurationSeconds,
      if (dataflowEndpointGroupArn != null)
        'dataflowEndpointGroupArn': dataflowEndpointGroupArn,
      if (dataflowEndpointGroupId != null)
        'dataflowEndpointGroupId': dataflowEndpointGroupId,
      if (endpointsDetails != null) 'endpointsDetails': endpointsDetails,
      if (tags != null) 'tags': tags,
    };
  }
}

/// <p/>
class GetMinuteUsageResponse {
  /// Estimated number of minutes remaining for an account, specific to the month
  /// being requested.
  final int? estimatedMinutesRemaining;

  /// Returns whether or not an account has signed up for the reserved minutes
  /// pricing plan, specific to the month being requested.
  final bool? isReservedMinutesCustomer;

  /// Total number of reserved minutes allocated, specific to the month being
  /// requested.
  final int? totalReservedMinuteAllocation;

  /// Total scheduled minutes for an account, specific to the month being
  /// requested.
  final int? totalScheduledMinutes;

  /// Upcoming minutes scheduled for an account, specific to the month being
  /// requested.
  final int? upcomingMinutesScheduled;

  GetMinuteUsageResponse({
    this.estimatedMinutesRemaining,
    this.isReservedMinutesCustomer,
    this.totalReservedMinuteAllocation,
    this.totalScheduledMinutes,
    this.upcomingMinutesScheduled,
  });

  factory GetMinuteUsageResponse.fromJson(Map<String, dynamic> json) {
    return GetMinuteUsageResponse(
      estimatedMinutesRemaining: json['estimatedMinutesRemaining'] as int?,
      isReservedMinutesCustomer: json['isReservedMinutesCustomer'] as bool?,
      totalReservedMinuteAllocation:
          json['totalReservedMinuteAllocation'] as int?,
      totalScheduledMinutes: json['totalScheduledMinutes'] as int?,
      upcomingMinutesScheduled: json['upcomingMinutesScheduled'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedMinutesRemaining = this.estimatedMinutesRemaining;
    final isReservedMinutesCustomer = this.isReservedMinutesCustomer;
    final totalReservedMinuteAllocation = this.totalReservedMinuteAllocation;
    final totalScheduledMinutes = this.totalScheduledMinutes;
    final upcomingMinutesScheduled = this.upcomingMinutesScheduled;
    return {
      if (estimatedMinutesRemaining != null)
        'estimatedMinutesRemaining': estimatedMinutesRemaining,
      if (isReservedMinutesCustomer != null)
        'isReservedMinutesCustomer': isReservedMinutesCustomer,
      if (totalReservedMinuteAllocation != null)
        'totalReservedMinuteAllocation': totalReservedMinuteAllocation,
      if (totalScheduledMinutes != null)
        'totalScheduledMinutes': totalScheduledMinutes,
      if (upcomingMinutesScheduled != null)
        'upcomingMinutesScheduled': upcomingMinutesScheduled,
    };
  }
}

/// <p/>
class GetMissionProfileResponse {
  /// Amount of time after a contact ends that you’d like to receive a CloudWatch
  /// event indicating the pass has finished.
  final int? contactPostPassDurationSeconds;

  /// Amount of time prior to contact start you’d like to receive a CloudWatch
  /// event indicating an upcoming pass.
  final int? contactPrePassDurationSeconds;

  /// A list of lists of ARNs. Each list of ARNs is an edge, with a <i>from</i>
  /// <code>Config</code> and a <i>to</i> <code>Config</code>.
  final List<List<String>>? dataflowEdges;

  /// Smallest amount of time in seconds that you’d like to see for an available
  /// contact. AWS Ground Station will not present you with contacts shorter than
  /// this duration.
  final int? minimumViableContactDurationSeconds;

  /// ARN of a mission profile.
  final String? missionProfileArn;

  /// UUID of a mission profile.
  final String? missionProfileId;

  /// Name of a mission profile.
  final String? name;

  /// Region of a mission profile.
  final String? region;

  /// KMS key to use for encrypting streams.
  final KmsKey? streamsKmsKey;

  /// Role to use for encrypting streams with KMS key.
  final String? streamsKmsRole;

  /// Tags assigned to a mission profile.
  final Map<String, String>? tags;

  /// ARN of a tracking <code>Config</code>.
  final String? trackingConfigArn;

  GetMissionProfileResponse({
    this.contactPostPassDurationSeconds,
    this.contactPrePassDurationSeconds,
    this.dataflowEdges,
    this.minimumViableContactDurationSeconds,
    this.missionProfileArn,
    this.missionProfileId,
    this.name,
    this.region,
    this.streamsKmsKey,
    this.streamsKmsRole,
    this.tags,
    this.trackingConfigArn,
  });

  factory GetMissionProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetMissionProfileResponse(
      contactPostPassDurationSeconds:
          json['contactPostPassDurationSeconds'] as int?,
      contactPrePassDurationSeconds:
          json['contactPrePassDurationSeconds'] as int?,
      dataflowEdges: (json['dataflowEdges'] as List?)
          ?.whereNotNull()
          .map((e) =>
              (e as List).whereNotNull().map((e) => e as String).toList())
          .toList(),
      minimumViableContactDurationSeconds:
          json['minimumViableContactDurationSeconds'] as int?,
      missionProfileArn: json['missionProfileArn'] as String?,
      missionProfileId: json['missionProfileId'] as String?,
      name: json['name'] as String?,
      region: json['region'] as String?,
      streamsKmsKey: json['streamsKmsKey'] != null
          ? KmsKey.fromJson(json['streamsKmsKey'] as Map<String, dynamic>)
          : null,
      streamsKmsRole: json['streamsKmsRole'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      trackingConfigArn: json['trackingConfigArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactPostPassDurationSeconds = this.contactPostPassDurationSeconds;
    final contactPrePassDurationSeconds = this.contactPrePassDurationSeconds;
    final dataflowEdges = this.dataflowEdges;
    final minimumViableContactDurationSeconds =
        this.minimumViableContactDurationSeconds;
    final missionProfileArn = this.missionProfileArn;
    final missionProfileId = this.missionProfileId;
    final name = this.name;
    final region = this.region;
    final streamsKmsKey = this.streamsKmsKey;
    final streamsKmsRole = this.streamsKmsRole;
    final tags = this.tags;
    final trackingConfigArn = this.trackingConfigArn;
    return {
      if (contactPostPassDurationSeconds != null)
        'contactPostPassDurationSeconds': contactPostPassDurationSeconds,
      if (contactPrePassDurationSeconds != null)
        'contactPrePassDurationSeconds': contactPrePassDurationSeconds,
      if (dataflowEdges != null) 'dataflowEdges': dataflowEdges,
      if (minimumViableContactDurationSeconds != null)
        'minimumViableContactDurationSeconds':
            minimumViableContactDurationSeconds,
      if (missionProfileArn != null) 'missionProfileArn': missionProfileArn,
      if (missionProfileId != null) 'missionProfileId': missionProfileId,
      if (name != null) 'name': name,
      if (region != null) 'region': region,
      if (streamsKmsKey != null) 'streamsKmsKey': streamsKmsKey,
      if (streamsKmsRole != null) 'streamsKmsRole': streamsKmsRole,
      if (tags != null) 'tags': tags,
      if (trackingConfigArn != null) 'trackingConfigArn': trackingConfigArn,
    };
  }
}

/// <p/>
class GetSatelliteResponse {
  /// The current ephemeris being used to compute the trajectory of the satellite.
  final EphemerisMetaData? currentEphemeris;

  /// A list of ground stations to which the satellite is on-boarded.
  final List<String>? groundStations;

  /// NORAD satellite ID number.
  final int? noradSatelliteID;

  /// ARN of a satellite.
  final String? satelliteArn;

  /// UUID of a satellite.
  final String? satelliteId;

  GetSatelliteResponse({
    this.currentEphemeris,
    this.groundStations,
    this.noradSatelliteID,
    this.satelliteArn,
    this.satelliteId,
  });

  factory GetSatelliteResponse.fromJson(Map<String, dynamic> json) {
    return GetSatelliteResponse(
      currentEphemeris: json['currentEphemeris'] != null
          ? EphemerisMetaData.fromJson(
              json['currentEphemeris'] as Map<String, dynamic>)
          : null,
      groundStations: (json['groundStations'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      noradSatelliteID: json['noradSatelliteID'] as int?,
      satelliteArn: json['satelliteArn'] as String?,
      satelliteId: json['satelliteId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentEphemeris = this.currentEphemeris;
    final groundStations = this.groundStations;
    final noradSatelliteID = this.noradSatelliteID;
    final satelliteArn = this.satelliteArn;
    final satelliteId = this.satelliteId;
    return {
      if (currentEphemeris != null) 'currentEphemeris': currentEphemeris,
      if (groundStations != null) 'groundStations': groundStations,
      if (noradSatelliteID != null) 'noradSatelliteID': noradSatelliteID,
      if (satelliteArn != null) 'satelliteArn': satelliteArn,
      if (satelliteId != null) 'satelliteId': satelliteId,
    };
  }
}

/// Information about the ground station data.
class GroundStationData {
  /// UUID of a ground station.
  final String? groundStationId;

  /// Name of a ground station.
  final String? groundStationName;

  /// Ground station Region.
  final String? region;

  GroundStationData({
    this.groundStationId,
    this.groundStationName,
    this.region,
  });

  factory GroundStationData.fromJson(Map<String, dynamic> json) {
    return GroundStationData(
      groundStationId: json['groundStationId'] as String?,
      groundStationName: json['groundStationName'] as String?,
      region: json['region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groundStationId = this.groundStationId;
    final groundStationName = this.groundStationName;
    final region = this.region;
    return {
      if (groundStationId != null) 'groundStationId': groundStationId,
      if (groundStationName != null) 'groundStationName': groundStationName,
      if (region != null) 'region': region,
    };
  }
}

/// An integer range that has a minimum and maximum value.
class IntegerRange {
  /// A maximum value.
  final int maximum;

  /// A minimum value.
  final int minimum;

  IntegerRange({
    required this.maximum,
    required this.minimum,
  });

  factory IntegerRange.fromJson(Map<String, dynamic> json) {
    return IntegerRange(
      maximum: json['maximum'] as int,
      minimum: json['minimum'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maximum = this.maximum;
    final minimum = this.minimum;
    return {
      'maximum': maximum,
      'minimum': minimum,
    };
  }
}

/// AWS Key Management Service (KMS) Key.
class KmsKey {
  /// KMS Alias Arn.
  final String? kmsAliasArn;

  /// KMS Alias Name.
  final String? kmsAliasName;

  /// KMS Key Arn.
  final String? kmsKeyArn;

  KmsKey({
    this.kmsAliasArn,
    this.kmsAliasName,
    this.kmsKeyArn,
  });

  factory KmsKey.fromJson(Map<String, dynamic> json) {
    return KmsKey(
      kmsAliasArn: json['kmsAliasArn'] as String?,
      kmsAliasName: json['kmsAliasName'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsAliasArn = this.kmsAliasArn;
    final kmsAliasName = this.kmsAliasName;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      if (kmsAliasArn != null) 'kmsAliasArn': kmsAliasArn,
      if (kmsAliasName != null) 'kmsAliasName': kmsAliasName,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

/// <p/>
class ListConfigsResponse {
  /// List of <code>Config</code> items.
  final List<ConfigListItem>? configList;

  /// Next token returned in the response of a previous <code>ListConfigs</code>
  /// call. Used to get the next page of results.
  final String? nextToken;

  ListConfigsResponse({
    this.configList,
    this.nextToken,
  });

  factory ListConfigsResponse.fromJson(Map<String, dynamic> json) {
    return ListConfigsResponse(
      configList: (json['configList'] as List?)
          ?.whereNotNull()
          .map((e) => ConfigListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configList = this.configList;
    final nextToken = this.nextToken;
    return {
      if (configList != null) 'configList': configList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// <p/>
class ListContactsResponse {
  /// List of contacts.
  final List<ContactData>? contactList;

  /// Next token returned in the response of a previous <code>ListContacts</code>
  /// call. Used to get the next page of results.
  final String? nextToken;

  ListContactsResponse({
    this.contactList,
    this.nextToken,
  });

  factory ListContactsResponse.fromJson(Map<String, dynamic> json) {
    return ListContactsResponse(
      contactList: (json['contactList'] as List?)
          ?.whereNotNull()
          .map((e) => ContactData.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactList = this.contactList;
    final nextToken = this.nextToken;
    return {
      if (contactList != null) 'contactList': contactList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// <p/>
class ListDataflowEndpointGroupsResponse {
  /// A list of dataflow endpoint groups.
  final List<DataflowEndpointListItem>? dataflowEndpointGroupList;

  /// Next token returned in the response of a previous
  /// <code>ListDataflowEndpointGroups</code> call. Used to get the next page of
  /// results.
  final String? nextToken;

  ListDataflowEndpointGroupsResponse({
    this.dataflowEndpointGroupList,
    this.nextToken,
  });

  factory ListDataflowEndpointGroupsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDataflowEndpointGroupsResponse(
      dataflowEndpointGroupList: (json['dataflowEndpointGroupList'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataflowEndpointListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataflowEndpointGroupList = this.dataflowEndpointGroupList;
    final nextToken = this.nextToken;
    return {
      if (dataflowEndpointGroupList != null)
        'dataflowEndpointGroupList': dataflowEndpointGroupList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEphemeridesResponse {
  /// List of ephemerides.
  final List<EphemerisItem>? ephemerides;

  /// Pagination token.
  final String? nextToken;

  ListEphemeridesResponse({
    this.ephemerides,
    this.nextToken,
  });

  factory ListEphemeridesResponse.fromJson(Map<String, dynamic> json) {
    return ListEphemeridesResponse(
      ephemerides: (json['ephemerides'] as List?)
          ?.whereNotNull()
          .map((e) => EphemerisItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ephemerides = this.ephemerides;
    final nextToken = this.nextToken;
    return {
      if (ephemerides != null) 'ephemerides': ephemerides,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// <p/>
class ListGroundStationsResponse {
  /// List of ground stations.
  final List<GroundStationData>? groundStationList;

  /// Next token that can be supplied in the next call to get the next page of
  /// ground stations.
  final String? nextToken;

  ListGroundStationsResponse({
    this.groundStationList,
    this.nextToken,
  });

  factory ListGroundStationsResponse.fromJson(Map<String, dynamic> json) {
    return ListGroundStationsResponse(
      groundStationList: (json['groundStationList'] as List?)
          ?.whereNotNull()
          .map((e) => GroundStationData.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groundStationList = this.groundStationList;
    final nextToken = this.nextToken;
    return {
      if (groundStationList != null) 'groundStationList': groundStationList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// <p/>
class ListMissionProfilesResponse {
  /// List of mission profiles.
  final List<MissionProfileListItem>? missionProfileList;

  /// Next token returned in the response of a previous
  /// <code>ListMissionProfiles</code> call. Used to get the next page of results.
  final String? nextToken;

  ListMissionProfilesResponse({
    this.missionProfileList,
    this.nextToken,
  });

  factory ListMissionProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListMissionProfilesResponse(
      missionProfileList: (json['missionProfileList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => MissionProfileListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final missionProfileList = this.missionProfileList;
    final nextToken = this.nextToken;
    return {
      if (missionProfileList != null) 'missionProfileList': missionProfileList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// <p/>
class ListSatellitesResponse {
  /// Next token that can be supplied in the next call to get the next page of
  /// satellites.
  final String? nextToken;

  /// List of satellites.
  final List<SatelliteListItem>? satellites;

  ListSatellitesResponse({
    this.nextToken,
    this.satellites,
  });

  factory ListSatellitesResponse.fromJson(Map<String, dynamic> json) {
    return ListSatellitesResponse(
      nextToken: json['nextToken'] as String?,
      satellites: (json['satellites'] as List?)
          ?.whereNotNull()
          .map((e) => SatelliteListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final satellites = this.satellites;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (satellites != null) 'satellites': satellites,
    };
  }
}

/// <p/>
class ListTagsForResourceResponse {
  /// Tags assigned to a resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// <p/>
class MissionProfileIdResponse {
  /// UUID of a mission profile.
  final String? missionProfileId;

  MissionProfileIdResponse({
    this.missionProfileId,
  });

  factory MissionProfileIdResponse.fromJson(Map<String, dynamic> json) {
    return MissionProfileIdResponse(
      missionProfileId: json['missionProfileId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final missionProfileId = this.missionProfileId;
    return {
      if (missionProfileId != null) 'missionProfileId': missionProfileId,
    };
  }
}

/// Item in a list of mission profiles.
class MissionProfileListItem {
  /// ARN of a mission profile.
  final String? missionProfileArn;

  /// UUID of a mission profile.
  final String? missionProfileId;

  /// Name of a mission profile.
  final String? name;

  /// Region of a mission profile.
  final String? region;

  MissionProfileListItem({
    this.missionProfileArn,
    this.missionProfileId,
    this.name,
    this.region,
  });

  factory MissionProfileListItem.fromJson(Map<String, dynamic> json) {
    return MissionProfileListItem(
      missionProfileArn: json['missionProfileArn'] as String?,
      missionProfileId: json['missionProfileId'] as String?,
      name: json['name'] as String?,
      region: json['region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final missionProfileArn = this.missionProfileArn;
    final missionProfileId = this.missionProfileId;
    final name = this.name;
    final region = this.region;
    return {
      if (missionProfileArn != null) 'missionProfileArn': missionProfileArn,
      if (missionProfileId != null) 'missionProfileId': missionProfileId,
      if (name != null) 'name': name,
      if (region != null) 'region': region,
    };
  }
}

/// Ephemeris data in Orbit Ephemeris Message (OEM) format.
class OEMEphemeris {
  /// The data for an OEM ephemeris, supplied directly in the request rather than
  /// through an S3 object.
  final String? oemData;

  /// Identifies the S3 object to be used as the ephemeris.
  final S3Object? s3Object;

  OEMEphemeris({
    this.oemData,
    this.s3Object,
  });

  Map<String, dynamic> toJson() {
    final oemData = this.oemData;
    final s3Object = this.s3Object;
    return {
      if (oemData != null) 'oemData': oemData,
      if (s3Object != null) 's3Object': s3Object,
    };
  }
}

enum Polarization {
  leftHand,
  none,
  rightHand,
}

extension PolarizationValueExtension on Polarization {
  String toValue() {
    switch (this) {
      case Polarization.leftHand:
        return 'LEFT_HAND';
      case Polarization.none:
        return 'NONE';
      case Polarization.rightHand:
        return 'RIGHT_HAND';
    }
  }
}

extension PolarizationFromString on String {
  Polarization toPolarization() {
    switch (this) {
      case 'LEFT_HAND':
        return Polarization.leftHand;
      case 'NONE':
        return Polarization.none;
      case 'RIGHT_HAND':
        return Polarization.rightHand;
    }
    throw Exception('$this is not known in enum Polarization');
  }
}

/// Ingress address of AgentEndpoint with a port range and an optional mtu.
class RangedConnectionDetails {
  /// A ranged socket address.
  final RangedSocketAddress socketAddress;

  /// Maximum transmission unit (MTU) size in bytes of a dataflow endpoint.
  final int? mtu;

  RangedConnectionDetails({
    required this.socketAddress,
    this.mtu,
  });

  factory RangedConnectionDetails.fromJson(Map<String, dynamic> json) {
    return RangedConnectionDetails(
      socketAddress: RangedSocketAddress.fromJson(
          json['socketAddress'] as Map<String, dynamic>),
      mtu: json['mtu'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final socketAddress = this.socketAddress;
    final mtu = this.mtu;
    return {
      'socketAddress': socketAddress,
      if (mtu != null) 'mtu': mtu,
    };
  }
}

/// A socket address with a port range.
class RangedSocketAddress {
  /// IPv4 socket address.
  final String name;

  /// Port range of a socket address.
  final IntegerRange portRange;

  RangedSocketAddress({
    required this.name,
    required this.portRange,
  });

  factory RangedSocketAddress.fromJson(Map<String, dynamic> json) {
    return RangedSocketAddress(
      name: json['name'] as String,
      portRange:
          IntegerRange.fromJson(json['portRange'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final portRange = this.portRange;
    return {
      'name': name,
      'portRange': portRange,
    };
  }
}

class RegisterAgentResponse {
  /// UUID of registered agent.
  final String? agentId;

  RegisterAgentResponse({
    this.agentId,
  });

  factory RegisterAgentResponse.fromJson(Map<String, dynamic> json) {
    return RegisterAgentResponse(
      agentId: json['agentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentId = this.agentId;
    return {
      if (agentId != null) 'agentId': agentId,
    };
  }
}

/// Object stored in S3 containing ephemeris data.
class S3Object {
  /// An Amazon S3 Bucket name.
  final String? bucket;

  /// An Amazon S3 key for the ephemeris.
  final String? key;

  /// For versioned S3 objects, the version to use for the ephemeris.
  final String? version;

  S3Object({
    this.bucket,
    this.key,
    this.version,
  });

  factory S3Object.fromJson(Map<String, dynamic> json) {
    return S3Object(
      bucket: json['bucket'] as String?,
      key: json['key'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    final version = this.version;
    return {
      if (bucket != null) 'bucket': bucket,
      if (key != null) 'key': key,
      if (version != null) 'version': version,
    };
  }
}

/// Information about an S3 recording <code>Config</code>.
class S3RecordingConfig {
  /// ARN of the bucket to record to.
  final String bucketArn;

  /// ARN of the role Ground Station assumes to write data to the bucket.
  final String roleArn;

  /// S3 Key prefix to prefice data files.
  final String? prefix;

  S3RecordingConfig({
    required this.bucketArn,
    required this.roleArn,
    this.prefix,
  });

  factory S3RecordingConfig.fromJson(Map<String, dynamic> json) {
    return S3RecordingConfig(
      bucketArn: json['bucketArn'] as String,
      roleArn: json['roleArn'] as String,
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketArn = this.bucketArn;
    final roleArn = this.roleArn;
    final prefix = this.prefix;
    return {
      'bucketArn': bucketArn,
      'roleArn': roleArn,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// Details about an S3 recording <code>Config</code> used in a contact.
class S3RecordingDetails {
  /// ARN of the bucket used.
  final String? bucketArn;

  /// Key template used for the S3 Recording Configuration
  final String? keyTemplate;

  S3RecordingDetails({
    this.bucketArn,
    this.keyTemplate,
  });

  factory S3RecordingDetails.fromJson(Map<String, dynamic> json) {
    return S3RecordingDetails(
      bucketArn: json['bucketArn'] as String?,
      keyTemplate: json['keyTemplate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketArn = this.bucketArn;
    final keyTemplate = this.keyTemplate;
    return {
      if (bucketArn != null) 'bucketArn': bucketArn,
      if (keyTemplate != null) 'keyTemplate': keyTemplate,
    };
  }
}

/// Item in a list of satellites.
class SatelliteListItem {
  /// The current ephemeris being used to compute the trajectory of the satellite.
  final EphemerisMetaData? currentEphemeris;

  /// A list of ground stations to which the satellite is on-boarded.
  final List<String>? groundStations;

  /// NORAD satellite ID number.
  final int? noradSatelliteID;

  /// ARN of a satellite.
  final String? satelliteArn;

  /// UUID of a satellite.
  final String? satelliteId;

  SatelliteListItem({
    this.currentEphemeris,
    this.groundStations,
    this.noradSatelliteID,
    this.satelliteArn,
    this.satelliteId,
  });

  factory SatelliteListItem.fromJson(Map<String, dynamic> json) {
    return SatelliteListItem(
      currentEphemeris: json['currentEphemeris'] != null
          ? EphemerisMetaData.fromJson(
              json['currentEphemeris'] as Map<String, dynamic>)
          : null,
      groundStations: (json['groundStations'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      noradSatelliteID: json['noradSatelliteID'] as int?,
      satelliteArn: json['satelliteArn'] as String?,
      satelliteId: json['satelliteId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentEphemeris = this.currentEphemeris;
    final groundStations = this.groundStations;
    final noradSatelliteID = this.noradSatelliteID;
    final satelliteArn = this.satelliteArn;
    final satelliteId = this.satelliteId;
    return {
      if (currentEphemeris != null) 'currentEphemeris': currentEphemeris,
      if (groundStations != null) 'groundStations': groundStations,
      if (noradSatelliteID != null) 'noradSatelliteID': noradSatelliteID,
      if (satelliteArn != null) 'satelliteArn': satelliteArn,
      if (satelliteId != null) 'satelliteId': satelliteId,
    };
  }
}

/// Information about endpoints.
class SecurityDetails {
  /// ARN to a role needed for connecting streams to your instances.
  final String roleArn;

  /// The security groups to attach to the elastic network interfaces.
  final List<String> securityGroupIds;

  /// A list of subnets where AWS Ground Station places elastic network interfaces
  /// to send streams to your instances.
  final List<String> subnetIds;

  SecurityDetails({
    required this.roleArn,
    required this.securityGroupIds,
    required this.subnetIds,
  });

  factory SecurityDetails.fromJson(Map<String, dynamic> json) {
    return SecurityDetails(
      roleArn: json['roleArn'] as String,
      securityGroupIds: (json['securityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      'roleArn': roleArn,
      'securityGroupIds': securityGroupIds,
      'subnetIds': subnetIds,
    };
  }
}

/// Information about the socket address.
class SocketAddress {
  /// Name of a socket address.
  final String name;

  /// Port of a socket address.
  final int port;

  SocketAddress({
    required this.name,
    required this.port,
  });

  factory SocketAddress.fromJson(Map<String, dynamic> json) {
    return SocketAddress(
      name: json['name'] as String,
      port: json['port'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final port = this.port;
    return {
      'name': name,
      'port': port,
    };
  }
}

/// Dataflow details for the source side.
class Source {
  /// Additional details for a <code>Config</code>, if type is
  /// <code>dataflow-endpoint</code> or <code>antenna-downlink-demod-decode</code>
  final ConfigDetails? configDetails;

  /// UUID of a <code>Config</code>.
  final String? configId;

  /// Type of a <code>Config</code>.
  final ConfigCapabilityType? configType;

  /// Region of a dataflow source.
  final String? dataflowSourceRegion;

  Source({
    this.configDetails,
    this.configId,
    this.configType,
    this.dataflowSourceRegion,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      configDetails: json['configDetails'] != null
          ? ConfigDetails.fromJson(
              json['configDetails'] as Map<String, dynamic>)
          : null,
      configId: json['configId'] as String?,
      configType: (json['configType'] as String?)?.toConfigCapabilityType(),
      dataflowSourceRegion: json['dataflowSourceRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configDetails = this.configDetails;
    final configId = this.configId;
    final configType = this.configType;
    final dataflowSourceRegion = this.dataflowSourceRegion;
    return {
      if (configDetails != null) 'configDetails': configDetails,
      if (configId != null) 'configId': configId,
      if (configType != null) 'configType': configType.toValue(),
      if (dataflowSourceRegion != null)
        'dataflowSourceRegion': dataflowSourceRegion,
    };
  }
}

/// Object that describes a spectral <code>Config</code>.
class SpectrumConfig {
  /// Bandwidth of a spectral <code>Config</code>. AWS Ground Station currently
  /// has the following bandwidth limitations:
  ///
  /// <ul>
  /// <li>
  /// For <code>AntennaDownlinkDemodDecodeconfig</code>, valid values are between
  /// 125 kHz to 650 MHz.
  /// </li>
  /// <li>
  /// For <code>AntennaDownlinkconfig</code> valid values are between 10 kHz to 54
  /// MHz.
  /// </li>
  /// <li>
  /// For <code>AntennaUplinkConfig</code>, valid values are between 10 kHz to 54
  /// MHz.
  /// </li>
  /// </ul>
  final FrequencyBandwidth bandwidth;

  /// Center frequency of a spectral <code>Config</code>. Valid values are between
  /// 2200 to 2300 MHz and 7750 to 8400 MHz for downlink and 2025 to 2120 MHz for
  /// uplink.
  final Frequency centerFrequency;

  /// Polarization of a spectral <code>Config</code>. Capturing both
  /// <code>"RIGHT_HAND"</code> and <code>"LEFT_HAND"</code> polarization requires
  /// two separate configs.
  final Polarization? polarization;

  SpectrumConfig({
    required this.bandwidth,
    required this.centerFrequency,
    this.polarization,
  });

  factory SpectrumConfig.fromJson(Map<String, dynamic> json) {
    return SpectrumConfig(
      bandwidth: FrequencyBandwidth.fromJson(
          json['bandwidth'] as Map<String, dynamic>),
      centerFrequency:
          Frequency.fromJson(json['centerFrequency'] as Map<String, dynamic>),
      polarization: (json['polarization'] as String?)?.toPolarization(),
    );
  }

  Map<String, dynamic> toJson() {
    final bandwidth = this.bandwidth;
    final centerFrequency = this.centerFrequency;
    final polarization = this.polarization;
    return {
      'bandwidth': bandwidth,
      'centerFrequency': centerFrequency,
      if (polarization != null) 'polarization': polarization.toValue(),
    };
  }
}

/// Two-line element set (TLE) data.
class TLEData {
  /// First line of two-line element set (TLE) data.
  final String tleLine1;

  /// Second line of two-line element set (TLE) data.
  final String tleLine2;

  /// The valid time range for the TLE. Gaps or overlap are not permitted.
  final TimeRange validTimeRange;

  TLEData({
    required this.tleLine1,
    required this.tleLine2,
    required this.validTimeRange,
  });

  Map<String, dynamic> toJson() {
    final tleLine1 = this.tleLine1;
    final tleLine2 = this.tleLine2;
    final validTimeRange = this.validTimeRange;
    return {
      'tleLine1': tleLine1,
      'tleLine2': tleLine2,
      'validTimeRange': validTimeRange,
    };
  }
}

/// Two-line element set (TLE) ephemeris.
class TLEEphemeris {
  /// Identifies the S3 object to be used as the ephemeris.
  final S3Object? s3Object;

  /// The data for a TLE ephemeris, supplied directly in the request rather than
  /// through an S3 object.
  final List<TLEData>? tleData;

  TLEEphemeris({
    this.s3Object,
    this.tleData,
  });

  Map<String, dynamic> toJson() {
    final s3Object = this.s3Object;
    final tleData = this.tleData;
    return {
      if (s3Object != null) 's3Object': s3Object,
      if (tleData != null) 'tleData': tleData,
    };
  }
}

/// <p/>
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A time range with a start and end time.
class TimeRange {
  /// Time in UTC at which the time range ends.
  final DateTime endTime;

  /// Time in UTC at which the time range starts.
  final DateTime startTime;

  TimeRange({
    required this.endTime,
    required this.startTime,
  });

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'endTime': unixTimestampToJson(endTime),
      'startTime': unixTimestampToJson(startTime),
    };
  }
}

/// Object that determines whether tracking should be used during a contact
/// executed with this <code>Config</code> in the mission profile.
class TrackingConfig {
  /// Current setting for autotrack.
  final Criticality autotrack;

  TrackingConfig({
    required this.autotrack,
  });

  factory TrackingConfig.fromJson(Map<String, dynamic> json) {
    return TrackingConfig(
      autotrack: (json['autotrack'] as String).toCriticality(),
    );
  }

  Map<String, dynamic> toJson() {
    final autotrack = this.autotrack;
    return {
      'autotrack': autotrack.toValue(),
    };
  }
}

/// <p/>
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateAgentStatusResponse {
  /// UUID of updated agent.
  final String agentId;

  UpdateAgentStatusResponse({
    required this.agentId,
  });

  factory UpdateAgentStatusResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAgentStatusResponse(
      agentId: json['agentId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final agentId = this.agentId;
    return {
      'agentId': agentId,
    };
  }
}

/// Information about an uplink echo <code>Config</code>.
///
/// Parameters from the <code>AntennaUplinkConfig</code>, corresponding to the
/// specified <code>AntennaUplinkConfigArn</code>, are used when this
/// <code>UplinkEchoConfig</code> is used in a contact.
class UplinkEchoConfig {
  /// ARN of an uplink <code>Config</code>.
  final String antennaUplinkConfigArn;

  /// Whether or not an uplink <code>Config</code> is enabled.
  final bool enabled;

  UplinkEchoConfig({
    required this.antennaUplinkConfigArn,
    required this.enabled,
  });

  factory UplinkEchoConfig.fromJson(Map<String, dynamic> json) {
    return UplinkEchoConfig(
      antennaUplinkConfigArn: json['antennaUplinkConfigArn'] as String,
      enabled: json['enabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final antennaUplinkConfigArn = this.antennaUplinkConfigArn;
    final enabled = this.enabled;
    return {
      'antennaUplinkConfigArn': antennaUplinkConfigArn,
      'enabled': enabled,
    };
  }
}

/// Information about the uplink spectral <code>Config</code>.
class UplinkSpectrumConfig {
  /// Center frequency of an uplink spectral <code>Config</code>. Valid values are
  /// between 2025 to 2120 MHz.
  final Frequency centerFrequency;

  /// Polarization of an uplink spectral <code>Config</code>. Capturing both
  /// <code>"RIGHT_HAND"</code> and <code>"LEFT_HAND"</code> polarization requires
  /// two separate configs.
  final Polarization? polarization;

  UplinkSpectrumConfig({
    required this.centerFrequency,
    this.polarization,
  });

  factory UplinkSpectrumConfig.fromJson(Map<String, dynamic> json) {
    return UplinkSpectrumConfig(
      centerFrequency:
          Frequency.fromJson(json['centerFrequency'] as Map<String, dynamic>),
      polarization: (json['polarization'] as String?)?.toPolarization(),
    );
  }

  Map<String, dynamic> toJson() {
    final centerFrequency = this.centerFrequency;
    final polarization = this.polarization;
    return {
      'centerFrequency': centerFrequency,
      if (polarization != null) 'polarization': polarization.toValue(),
    };
  }
}

class DependencyException extends _s.GenericAwsException {
  DependencyException({String? type, String? message})
      : super(type: type, code: 'DependencyException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'DependencyException': (type, message) =>
      DependencyException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'ResourceLimitExceededException': (type, message) =>
      ResourceLimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
