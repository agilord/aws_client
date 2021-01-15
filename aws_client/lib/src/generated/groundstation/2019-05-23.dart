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

part '2019-05-23.g.dart';

/// Welcome to the AWS Ground Station API Reference. AWS Ground Station is a
/// fully managed service that enables you to control satellite communications,
/// downlink and process satellite data, and scale your satellite operations
/// efficiently and cost-effectively without having to build or manage your own
/// ground station infrastructure.
class GroundStation {
  final _s.RestJsonProtocol _protocol;
  GroundStation({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'groundstation',
            signingName: 'groundstation',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Cancels a contact with a specified contact ID.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [contactId] :
  /// UUID of a contact.
  Future<ContactIdResponse> cancelContact({
    @_s.required String contactId,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
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
    @_s.required ConfigTypeData configData,
    @_s.required String name,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(configData, 'configData');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[ a-zA-Z0-9_:-]{1,256}$''',
      isRequired: true,
    );
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
  /// Parameter [tags] :
  /// Tags of a dataflow endpoint group.
  Future<DataflowEndpointGroupIdResponse> createDataflowEndpointGroup({
    @_s.required List<EndpointDetails> endpointDetails,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(endpointDetails, 'endpointDetails');
    final $payload = <String, dynamic>{
      'endpointDetails': endpointDetails,
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
  /// Amount of time after a contact ends that you’d like to receive a
  /// CloudWatch event indicating the pass has finished.
  ///
  /// Parameter [contactPrePassDurationSeconds] :
  /// Amount of time prior to contact start you’d like to receive a CloudWatch
  /// event indicating an upcoming pass.
  ///
  /// Parameter [tags] :
  /// Tags assigned to a mission profile.
  Future<MissionProfileIdResponse> createMissionProfile({
    @_s.required List<List<String>> dataflowEdges,
    @_s.required int minimumViableContactDurationSeconds,
    @_s.required String name,
    @_s.required String trackingConfigArn,
    int contactPostPassDurationSeconds,
    int contactPrePassDurationSeconds,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(dataflowEdges, 'dataflowEdges');
    ArgumentError.checkNotNull(minimumViableContactDurationSeconds,
        'minimumViableContactDurationSeconds');
    _s.validateNumRange(
      'minimumViableContactDurationSeconds',
      minimumViableContactDurationSeconds,
      1,
      21600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[ a-zA-Z0-9_:-]{1,256}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(trackingConfigArn, 'trackingConfigArn');
    _s.validateNumRange(
      'contactPostPassDurationSeconds',
      contactPostPassDurationSeconds,
      1,
      21600,
    );
    _s.validateNumRange(
      'contactPrePassDurationSeconds',
      contactPrePassDurationSeconds,
      1,
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
    @_s.required String configId,
    @_s.required ConfigCapabilityType configType,
  }) async {
    ArgumentError.checkNotNull(configId, 'configId');
    ArgumentError.checkNotNull(configType, 'configType');
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
    @_s.required String dataflowEndpointGroupId,
  }) async {
    ArgumentError.checkNotNull(
        dataflowEndpointGroupId, 'dataflowEndpointGroupId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/dataflowEndpointGroup/${Uri.encodeComponent(dataflowEndpointGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DataflowEndpointGroupIdResponse.fromJson(response);
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
    @_s.required String missionProfileId,
  }) async {
    ArgumentError.checkNotNull(missionProfileId, 'missionProfileId');
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
    @_s.required String contactId,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/contact/${Uri.encodeComponent(contactId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeContactResponse.fromJson(response);
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
    @_s.required String configId,
    @_s.required ConfigCapabilityType configType,
  }) async {
    ArgumentError.checkNotNull(configId, 'configId');
    ArgumentError.checkNotNull(configType, 'configType');
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
    @_s.required String dataflowEndpointGroupId,
  }) async {
    ArgumentError.checkNotNull(
        dataflowEndpointGroupId, 'dataflowEndpointGroupId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/dataflowEndpointGroup/${Uri.encodeComponent(dataflowEndpointGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataflowEndpointGroupResponse.fromJson(response);
  }

  /// Returns the number of minutes used by account.
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
    @_s.required int month,
    @_s.required int year,
  }) async {
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(year, 'year');
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
    @_s.required String missionProfileId,
  }) async {
    ArgumentError.checkNotNull(missionProfileId, 'missionProfileId');
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
    @_s.required String satelliteId,
  }) async {
    ArgumentError.checkNotNull(satelliteId, 'satelliteId');
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
    int maxResults,
    String nextToken,
  }) async {
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
  /// End time of a contact.
  ///
  /// Parameter [startTime] :
  /// Start time of a contact.
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
    @_s.required DateTime endTime,
    @_s.required DateTime startTime,
    @_s.required List<ContactStatus> statusList,
    String groundStation,
    int maxResults,
    String missionProfileArn,
    String nextToken,
    String satelliteArn,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(startTime, 'startTime');
    ArgumentError.checkNotNull(statusList, 'statusList');
    final $payload = <String, dynamic>{
      'endTime': unixTimestampToJson(endTime),
      'startTime': unixTimestampToJson(startTime),
      'statusList': statusList?.map((e) => e?.toValue() ?? '')?.toList(),
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
    int maxResults,
    String nextToken,
  }) async {
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
    int maxResults,
    String nextToken,
    String satelliteId,
  }) async {
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
    int maxResults,
    String nextToken,
  }) async {
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
    int maxResults,
    String nextToken,
  }) async {
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Reserves a contact using specified parameters.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DependencyException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [endTime] :
  /// End time of a contact.
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
  /// Start time of a contact.
  ///
  /// Parameter [tags] :
  /// Tags assigned to a contact.
  Future<ContactIdResponse> reserveContact({
    @_s.required DateTime endTime,
    @_s.required String groundStation,
    @_s.required String missionProfileArn,
    @_s.required String satelliteArn,
    @_s.required DateTime startTime,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(groundStation, 'groundStation');
    ArgumentError.checkNotNull(missionProfileArn, 'missionProfileArn');
    ArgumentError.checkNotNull(satelliteArn, 'satelliteArn');
    ArgumentError.checkNotNull(startTime, 'startTime');
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
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
    @_s.required ConfigTypeData configData,
    @_s.required String configId,
    @_s.required ConfigCapabilityType configType,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(configData, 'configData');
    ArgumentError.checkNotNull(configId, 'configId');
    ArgumentError.checkNotNull(configType, 'configType');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[ a-zA-Z0-9_:-]{1,256}$''',
      isRequired: true,
    );
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
  /// Amount of time after a contact ends that you’d like to receive a
  /// CloudWatch event indicating the pass has finished.
  ///
  /// Parameter [contactPrePassDurationSeconds] :
  /// Amount of time after a contact ends that you’d like to receive a
  /// CloudWatch event indicating the pass has finished.
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
  Future<MissionProfileIdResponse> updateMissionProfile({
    @_s.required String missionProfileId,
    int contactPostPassDurationSeconds,
    int contactPrePassDurationSeconds,
    List<List<String>> dataflowEdges,
    int minimumViableContactDurationSeconds,
    String name,
    String trackingConfigArn,
  }) async {
    ArgumentError.checkNotNull(missionProfileId, 'missionProfileId');
    _s.validateNumRange(
      'contactPostPassDurationSeconds',
      contactPostPassDurationSeconds,
      1,
      21600,
    );
    _s.validateNumRange(
      'contactPrePassDurationSeconds',
      contactPrePassDurationSeconds,
      1,
      21600,
    );
    _s.validateNumRange(
      'minimumViableContactDurationSeconds',
      minimumViableContactDurationSeconds,
      1,
      21600,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[ a-zA-Z0-9_:-]{1,256}$''',
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

enum AngleUnits {
  @_s.JsonValue('DEGREE_ANGLE')
  degreeAngle,
  @_s.JsonValue('RADIAN')
  radian,
}

/// Details about an antenna demod decode <code>Config</code> used in a contact.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AntennaDemodDecodeDetails {
  /// Name of an antenna demod decode output node used in a contact.
  @_s.JsonKey(name: 'outputNode')
  final String outputNode;

  AntennaDemodDecodeDetails({
    this.outputNode,
  });
  factory AntennaDemodDecodeDetails.fromJson(Map<String, dynamic> json) =>
      _$AntennaDemodDecodeDetailsFromJson(json);
}

/// Information about how AWS Ground Station should configure an antenna for
/// downlink during a contact.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AntennaDownlinkConfig {
  /// Object that describes a spectral <code>Config</code>.
  @_s.JsonKey(name: 'spectrumConfig')
  final SpectrumConfig spectrumConfig;

  AntennaDownlinkConfig({
    @_s.required this.spectrumConfig,
  });
  factory AntennaDownlinkConfig.fromJson(Map<String, dynamic> json) =>
      _$AntennaDownlinkConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AntennaDownlinkConfigToJson(this);
}

/// Information about how AWS Ground Station should conﬁgure an antenna for
/// downlink demod decode during a contact.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AntennaDownlinkDemodDecodeConfig {
  /// Information about the decode <code>Config</code>.
  @_s.JsonKey(name: 'decodeConfig')
  final DecodeConfig decodeConfig;

  /// Information about the demodulation <code>Config</code>.
  @_s.JsonKey(name: 'demodulationConfig')
  final DemodulationConfig demodulationConfig;

  /// Information about the spectral <code>Config</code>.
  @_s.JsonKey(name: 'spectrumConfig')
  final SpectrumConfig spectrumConfig;

  AntennaDownlinkDemodDecodeConfig({
    @_s.required this.decodeConfig,
    @_s.required this.demodulationConfig,
    @_s.required this.spectrumConfig,
  });
  factory AntennaDownlinkDemodDecodeConfig.fromJson(
          Map<String, dynamic> json) =>
      _$AntennaDownlinkDemodDecodeConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AntennaDownlinkDemodDecodeConfigToJson(this);
}

/// Information about the uplink <code>Config</code> of an antenna.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AntennaUplinkConfig {
  /// Information about the uplink spectral <code>Config</code>.
  @_s.JsonKey(name: 'spectrumConfig')
  final UplinkSpectrumConfig spectrumConfig;

  /// EIRP of the target.
  @_s.JsonKey(name: 'targetEirp')
  final Eirp targetEirp;

  /// Whether or not uplink transmit is disabled.
  @_s.JsonKey(name: 'transmitDisabled')
  final bool transmitDisabled;

  AntennaUplinkConfig({
    @_s.required this.spectrumConfig,
    @_s.required this.targetEirp,
    this.transmitDisabled,
  });
  factory AntennaUplinkConfig.fromJson(Map<String, dynamic> json) =>
      _$AntennaUplinkConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AntennaUplinkConfigToJson(this);
}

enum BandwidthUnits {
  @_s.JsonValue('GHz')
  gHz,
  @_s.JsonValue('MHz')
  mHz,
  @_s.JsonValue('kHz')
  kHz,
}

enum ConfigCapabilityType {
  @_s.JsonValue('antenna-downlink')
  antennaDownlink,
  @_s.JsonValue('antenna-downlink-demod-decode')
  antennaDownlinkDemodDecode,
  @_s.JsonValue('antenna-uplink')
  antennaUplink,
  @_s.JsonValue('dataflow-endpoint')
  dataflowEndpoint,
  @_s.JsonValue('tracking')
  tracking,
  @_s.JsonValue('uplink-echo')
  uplinkEcho,
}

extension on ConfigCapabilityType {
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Details for certain <code>Config</code> object types in a contact.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigDetails {
  /// Details for antenna demod decode <code>Config</code> in a contact.
  @_s.JsonKey(name: 'antennaDemodDecodeDetails')
  final AntennaDemodDecodeDetails antennaDemodDecodeDetails;
  @_s.JsonKey(name: 'endpointDetails')
  final EndpointDetails endpointDetails;

  ConfigDetails({
    this.antennaDemodDecodeDetails,
    this.endpointDetails,
  });
  factory ConfigDetails.fromJson(Map<String, dynamic> json) =>
      _$ConfigDetailsFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigIdResponse {
  /// ARN of a <code>Config</code>.
  @_s.JsonKey(name: 'configArn')
  final String configArn;

  /// UUID of a <code>Config</code>.
  @_s.JsonKey(name: 'configId')
  final String configId;

  /// Type of a <code>Config</code>.
  @_s.JsonKey(name: 'configType')
  final ConfigCapabilityType configType;

  ConfigIdResponse({
    this.configArn,
    this.configId,
    this.configType,
  });
  factory ConfigIdResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfigIdResponseFromJson(json);
}

/// An item in a list of <code>Config</code> objects.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigListItem {
  /// ARN of a <code>Config</code>.
  @_s.JsonKey(name: 'configArn')
  final String configArn;

  /// UUID of a <code>Config</code>.
  @_s.JsonKey(name: 'configId')
  final String configId;

  /// Type of a <code>Config</code>.
  @_s.JsonKey(name: 'configType')
  final ConfigCapabilityType configType;

  /// Name of a <code>Config</code>.
  @_s.JsonKey(name: 'name')
  final String name;

  ConfigListItem({
    this.configArn,
    this.configId,
    this.configType,
    this.name,
  });
  factory ConfigListItem.fromJson(Map<String, dynamic> json) =>
      _$ConfigListItemFromJson(json);
}

/// Object containing the parameters of a <code>Config</code>.
///
/// See the subtype definitions for what each type of <code>Config</code>
/// contains.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConfigTypeData {
  /// Information about how AWS Ground Station should configure an antenna for
  /// downlink during a contact.
  @_s.JsonKey(name: 'antennaDownlinkConfig')
  final AntennaDownlinkConfig antennaDownlinkConfig;

  /// Information about how AWS Ground Station should conﬁgure an antenna for
  /// downlink demod decode during a contact.
  @_s.JsonKey(name: 'antennaDownlinkDemodDecodeConfig')
  final AntennaDownlinkDemodDecodeConfig antennaDownlinkDemodDecodeConfig;

  /// Information about how AWS Ground Station should conﬁgure an antenna for
  /// uplink during a contact.
  @_s.JsonKey(name: 'antennaUplinkConfig')
  final AntennaUplinkConfig antennaUplinkConfig;

  /// Information about the dataflow endpoint <code>Config</code>.
  @_s.JsonKey(name: 'dataflowEndpointConfig')
  final DataflowEndpointConfig dataflowEndpointConfig;

  /// Object that determines whether tracking should be used during a contact
  /// executed with this <code>Config</code> in the mission profile.
  @_s.JsonKey(name: 'trackingConfig')
  final TrackingConfig trackingConfig;

  /// Information about an uplink echo <code>Config</code>.
  ///
  /// Parameters from the <code>AntennaUplinkConfig</code>, corresponding to the
  /// specified <code>AntennaUplinkConfigArn</code>, are used when this
  /// <code>UplinkEchoConfig</code> is used in a contact.
  @_s.JsonKey(name: 'uplinkEchoConfig')
  final UplinkEchoConfig uplinkEchoConfig;

  ConfigTypeData({
    this.antennaDownlinkConfig,
    this.antennaDownlinkDemodDecodeConfig,
    this.antennaUplinkConfig,
    this.dataflowEndpointConfig,
    this.trackingConfig,
    this.uplinkEchoConfig,
  });
  factory ConfigTypeData.fromJson(Map<String, dynamic> json) =>
      _$ConfigTypeDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigTypeDataToJson(this);
}

/// Data describing a contact.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContactData {
  /// UUID of a contact.
  @_s.JsonKey(name: 'contactId')
  final String contactId;

  /// Status of a contact.
  @_s.JsonKey(name: 'contactStatus')
  final ContactStatus contactStatus;

  /// End time of a contact.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// Error message of a contact.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// Name of a ground station.
  @_s.JsonKey(name: 'groundStation')
  final String groundStation;

  /// Maximum elevation angle of a contact.
  @_s.JsonKey(name: 'maximumElevation')
  final Elevation maximumElevation;

  /// ARN of a mission profile.
  @_s.JsonKey(name: 'missionProfileArn')
  final String missionProfileArn;

  /// Amount of time after a contact ends that you’d like to receive a CloudWatch
  /// event indicating the pass has finished.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'postPassEndTime')
  final DateTime postPassEndTime;

  /// Amount of time prior to contact start you’d like to receive a CloudWatch
  /// event indicating an upcoming pass.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'prePassStartTime')
  final DateTime prePassStartTime;

  /// Region of a contact.
  @_s.JsonKey(name: 'region')
  final String region;

  /// ARN of a satellite.
  @_s.JsonKey(name: 'satelliteArn')
  final String satelliteArn;

  /// Start time of a contact.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// Tags assigned to a contact.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  });
  factory ContactData.fromJson(Map<String, dynamic> json) =>
      _$ContactDataFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContactIdResponse {
  /// UUID of a contact.
  @_s.JsonKey(name: 'contactId')
  final String contactId;

  ContactIdResponse({
    this.contactId,
  });
  factory ContactIdResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactIdResponseFromJson(json);
}

enum ContactStatus {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('AWS_CANCELLED')
  awsCancelled,
  @_s.JsonValue('AWS_FAILED')
  awsFailed,
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('CANCELLING')
  cancelling,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('FAILED_TO_SCHEDULE')
  failedToSchedule,
  @_s.JsonValue('PASS')
  pass,
  @_s.JsonValue('POSTPASS')
  postpass,
  @_s.JsonValue('PREPASS')
  prepass,
  @_s.JsonValue('SCHEDULED')
  scheduled,
  @_s.JsonValue('SCHEDULING')
  scheduling,
}

extension on ContactStatus {
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
    throw Exception('Unknown enum value: $this');
  }
}

enum Criticality {
  @_s.JsonValue('PREFERRED')
  preferred,
  @_s.JsonValue('REMOVED')
  removed,
  @_s.JsonValue('REQUIRED')
  required,
}

/// Information about a dataflow edge used in a contact.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataflowDetail {
  @_s.JsonKey(name: 'destination')
  final Destination destination;

  /// Error message for a dataflow.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;
  @_s.JsonKey(name: 'source')
  final Source source;

  DataflowDetail({
    this.destination,
    this.errorMessage,
    this.source,
  });
  factory DataflowDetail.fromJson(Map<String, dynamic> json) =>
      _$DataflowDetailFromJson(json);
}

/// Information about a dataflow endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataflowEndpoint {
  /// Socket address of a dataflow endpoint.
  @_s.JsonKey(name: 'address')
  final SocketAddress address;

  /// Maximum transmission unit (MTU) size in bytes of a dataflow endpoint.
  @_s.JsonKey(name: 'mtu')
  final int mtu;

  /// Name of a dataflow endpoint.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Status of a dataflow endpoint.
  @_s.JsonKey(name: 'status')
  final EndpointStatus status;

  DataflowEndpoint({
    this.address,
    this.mtu,
    this.name,
    this.status,
  });
  factory DataflowEndpoint.fromJson(Map<String, dynamic> json) =>
      _$DataflowEndpointFromJson(json);

  Map<String, dynamic> toJson() => _$DataflowEndpointToJson(this);
}

/// Information about the dataflow endpoint <code>Config</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataflowEndpointConfig {
  /// Name of a dataflow endpoint.
  @_s.JsonKey(name: 'dataflowEndpointName')
  final String dataflowEndpointName;

  /// Region of a dataflow endpoint.
  @_s.JsonKey(name: 'dataflowEndpointRegion')
  final String dataflowEndpointRegion;

  DataflowEndpointConfig({
    @_s.required this.dataflowEndpointName,
    this.dataflowEndpointRegion,
  });
  factory DataflowEndpointConfig.fromJson(Map<String, dynamic> json) =>
      _$DataflowEndpointConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DataflowEndpointConfigToJson(this);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataflowEndpointGroupIdResponse {
  /// UUID of a dataflow endpoint group.
  @_s.JsonKey(name: 'dataflowEndpointGroupId')
  final String dataflowEndpointGroupId;

  DataflowEndpointGroupIdResponse({
    this.dataflowEndpointGroupId,
  });
  factory DataflowEndpointGroupIdResponse.fromJson(Map<String, dynamic> json) =>
      _$DataflowEndpointGroupIdResponseFromJson(json);
}

/// Item in a list of <code>DataflowEndpoint</code> groups.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataflowEndpointListItem {
  /// ARN of a dataflow endpoint group.
  @_s.JsonKey(name: 'dataflowEndpointGroupArn')
  final String dataflowEndpointGroupArn;

  /// UUID of a dataflow endpoint group.
  @_s.JsonKey(name: 'dataflowEndpointGroupId')
  final String dataflowEndpointGroupId;

  DataflowEndpointListItem({
    this.dataflowEndpointGroupArn,
    this.dataflowEndpointGroupId,
  });
  factory DataflowEndpointListItem.fromJson(Map<String, dynamic> json) =>
      _$DataflowEndpointListItemFromJson(json);
}

/// Information about the decode <code>Config</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DecodeConfig {
  /// Unvalidated JSON of a decode <code>Config</code>.
  @_s.JsonKey(name: 'unvalidatedJSON')
  final String unvalidatedJSON;

  DecodeConfig({
    @_s.required this.unvalidatedJSON,
  });
  factory DecodeConfig.fromJson(Map<String, dynamic> json) =>
      _$DecodeConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DecodeConfigToJson(this);
}

/// Information about the demodulation <code>Config</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DemodulationConfig {
  /// Unvalidated JSON of a demodulation <code>Config</code>.
  @_s.JsonKey(name: 'unvalidatedJSON')
  final String unvalidatedJSON;

  DemodulationConfig({
    @_s.required this.unvalidatedJSON,
  });
  factory DemodulationConfig.fromJson(Map<String, dynamic> json) =>
      _$DemodulationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DemodulationConfigToJson(this);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeContactResponse {
  /// UUID of a contact.
  @_s.JsonKey(name: 'contactId')
  final String contactId;

  /// Status of a contact.
  @_s.JsonKey(name: 'contactStatus')
  final ContactStatus contactStatus;

  /// List describing source and destination details for each dataflow edge.
  @_s.JsonKey(name: 'dataflowList')
  final List<DataflowDetail> dataflowList;

  /// End time of a contact.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// Error message for a contact.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// Ground station for a contact.
  @_s.JsonKey(name: 'groundStation')
  final String groundStation;

  /// Maximum elevation angle of a contact.
  @_s.JsonKey(name: 'maximumElevation')
  final Elevation maximumElevation;

  /// ARN of a mission profile.
  @_s.JsonKey(name: 'missionProfileArn')
  final String missionProfileArn;

  /// Amount of time after a contact ends that you’d like to receive a CloudWatch
  /// event indicating the pass has finished.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'postPassEndTime')
  final DateTime postPassEndTime;

  /// Amount of time prior to contact start you’d like to receive a CloudWatch
  /// event indicating an upcoming pass.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'prePassStartTime')
  final DateTime prePassStartTime;

  /// Region of a contact.
  @_s.JsonKey(name: 'region')
  final String region;

  /// ARN of a satellite.
  @_s.JsonKey(name: 'satelliteArn')
  final String satelliteArn;

  /// Start time of a contact.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// Tags assigned to a contact.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  });
  factory DescribeContactResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeContactResponseFromJson(json);
}

/// Dataflow details for the destination side.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Destination {
  /// Additional details for a <code>Config</code>, if type is dataflow endpoint
  /// or antenna demod decode.
  @_s.JsonKey(name: 'configDetails')
  final ConfigDetails configDetails;

  /// UUID of a <code>Config</code>.
  @_s.JsonKey(name: 'configId')
  final String configId;

  /// Type of a <code>Config</code>.
  @_s.JsonKey(name: 'configType')
  final ConfigCapabilityType configType;

  /// Region of a dataflow destination.
  @_s.JsonKey(name: 'dataflowDestinationRegion')
  final String dataflowDestinationRegion;

  Destination({
    this.configDetails,
    this.configId,
    this.configType,
    this.dataflowDestinationRegion,
  });
  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);
}

/// Object that represents EIRP.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Eirp {
  /// Units of an EIRP.
  @_s.JsonKey(name: 'units')
  final EirpUnits units;

  /// Value of an EIRP. Valid values are between 20.0 to 50.0 dBW.
  @_s.JsonKey(name: 'value')
  final double value;

  Eirp({
    @_s.required this.units,
    @_s.required this.value,
  });
  factory Eirp.fromJson(Map<String, dynamic> json) => _$EirpFromJson(json);

  Map<String, dynamic> toJson() => _$EirpToJson(this);
}

enum EirpUnits {
  @_s.JsonValue('dBW')
  dbw,
}

/// Elevation angle of the satellite in the sky during a contact.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Elevation {
  /// Elevation angle units.
  @_s.JsonKey(name: 'unit')
  final AngleUnits unit;

  /// Elevation angle value.
  @_s.JsonKey(name: 'value')
  final double value;

  Elevation({
    @_s.required this.unit,
    @_s.required this.value,
  });
  factory Elevation.fromJson(Map<String, dynamic> json) =>
      _$ElevationFromJson(json);
}

/// Information about the endpoint details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EndpointDetails {
  /// A dataflow endpoint.
  @_s.JsonKey(name: 'endpoint')
  final DataflowEndpoint endpoint;

  /// Endpoint security details.
  @_s.JsonKey(name: 'securityDetails')
  final SecurityDetails securityDetails;

  EndpointDetails({
    this.endpoint,
    this.securityDetails,
  });
  factory EndpointDetails.fromJson(Map<String, dynamic> json) =>
      _$EndpointDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointDetailsToJson(this);
}

enum EndpointStatus {
  @_s.JsonValue('created')
  created,
  @_s.JsonValue('creating')
  creating,
  @_s.JsonValue('deleted')
  deleted,
  @_s.JsonValue('deleting')
  deleting,
  @_s.JsonValue('failed')
  failed,
}

/// Object that describes the frequency.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Frequency {
  /// Frequency units.
  @_s.JsonKey(name: 'units')
  final FrequencyUnits units;

  /// Frequency value. Valid values are between 2200 to 2300 MHz and 7750 to 8400
  /// MHz for downlink and 2025 to 2120 MHz for uplink.
  @_s.JsonKey(name: 'value')
  final double value;

  Frequency({
    @_s.required this.units,
    @_s.required this.value,
  });
  factory Frequency.fromJson(Map<String, dynamic> json) =>
      _$FrequencyFromJson(json);

  Map<String, dynamic> toJson() => _$FrequencyToJson(this);
}

/// Object that describes the frequency bandwidth.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FrequencyBandwidth {
  /// Frequency bandwidth units.
  @_s.JsonKey(name: 'units')
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
  @_s.JsonKey(name: 'value')
  final double value;

  FrequencyBandwidth({
    @_s.required this.units,
    @_s.required this.value,
  });
  factory FrequencyBandwidth.fromJson(Map<String, dynamic> json) =>
      _$FrequencyBandwidthFromJson(json);

  Map<String, dynamic> toJson() => _$FrequencyBandwidthToJson(this);
}

enum FrequencyUnits {
  @_s.JsonValue('GHz')
  gHz,
  @_s.JsonValue('MHz')
  mHz,
  @_s.JsonValue('kHz')
  kHz,
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConfigResponse {
  /// ARN of a <code>Config</code>
  @_s.JsonKey(name: 'configArn')
  final String configArn;

  /// Data elements in a <code>Config</code>.
  @_s.JsonKey(name: 'configData')
  final ConfigTypeData configData;

  /// UUID of a <code>Config</code>.
  @_s.JsonKey(name: 'configId')
  final String configId;

  /// Name of a <code>Config</code>.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Type of a <code>Config</code>.
  @_s.JsonKey(name: 'configType')
  final ConfigCapabilityType configType;

  /// Tags assigned to a <code>Config</code>.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetConfigResponse({
    @_s.required this.configArn,
    @_s.required this.configData,
    @_s.required this.configId,
    @_s.required this.name,
    this.configType,
    this.tags,
  });
  factory GetConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConfigResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDataflowEndpointGroupResponse {
  /// ARN of a dataflow endpoint group.
  @_s.JsonKey(name: 'dataflowEndpointGroupArn')
  final String dataflowEndpointGroupArn;

  /// UUID of a dataflow endpoint group.
  @_s.JsonKey(name: 'dataflowEndpointGroupId')
  final String dataflowEndpointGroupId;

  /// Details of a dataflow endpoint.
  @_s.JsonKey(name: 'endpointsDetails')
  final List<EndpointDetails> endpointsDetails;

  /// Tags assigned to a dataflow endpoint group.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetDataflowEndpointGroupResponse({
    this.dataflowEndpointGroupArn,
    this.dataflowEndpointGroupId,
    this.endpointsDetails,
    this.tags,
  });
  factory GetDataflowEndpointGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetDataflowEndpointGroupResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMinuteUsageResponse {
  /// Estimated number of minutes remaining for an account, specific to the month
  /// being requested.
  @_s.JsonKey(name: 'estimatedMinutesRemaining')
  final int estimatedMinutesRemaining;

  /// Returns whether or not an account has signed up for the reserved minutes
  /// pricing plan, specific to the month being requested.
  @_s.JsonKey(name: 'isReservedMinutesCustomer')
  final bool isReservedMinutesCustomer;

  /// Total number of reserved minutes allocated, specific to the month being
  /// requested.
  @_s.JsonKey(name: 'totalReservedMinuteAllocation')
  final int totalReservedMinuteAllocation;

  /// Total scheduled minutes for an account, specific to the month being
  /// requested.
  @_s.JsonKey(name: 'totalScheduledMinutes')
  final int totalScheduledMinutes;

  /// Upcoming minutes scheduled for an account, specific to the month being
  /// requested.
  @_s.JsonKey(name: 'upcomingMinutesScheduled')
  final int upcomingMinutesScheduled;

  GetMinuteUsageResponse({
    this.estimatedMinutesRemaining,
    this.isReservedMinutesCustomer,
    this.totalReservedMinuteAllocation,
    this.totalScheduledMinutes,
    this.upcomingMinutesScheduled,
  });
  factory GetMinuteUsageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMinuteUsageResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMissionProfileResponse {
  /// Amount of time after a contact ends that you’d like to receive a CloudWatch
  /// event indicating the pass has finished.
  @_s.JsonKey(name: 'contactPostPassDurationSeconds')
  final int contactPostPassDurationSeconds;

  /// Amount of time prior to contact start you’d like to receive a CloudWatch
  /// event indicating an upcoming pass.
  @_s.JsonKey(name: 'contactPrePassDurationSeconds')
  final int contactPrePassDurationSeconds;

  /// A list of lists of ARNs. Each list of ARNs is an edge, with a <i>from</i>
  /// <code>Config</code> and a <i>to</i> <code>Config</code>.
  @_s.JsonKey(name: 'dataflowEdges')
  final List<List<String>> dataflowEdges;

  /// Smallest amount of time in seconds that you’d like to see for an available
  /// contact. AWS Ground Station will not present you with contacts shorter than
  /// this duration.
  @_s.JsonKey(name: 'minimumViableContactDurationSeconds')
  final int minimumViableContactDurationSeconds;

  /// ARN of a mission profile.
  @_s.JsonKey(name: 'missionProfileArn')
  final String missionProfileArn;

  /// UUID of a mission profile.
  @_s.JsonKey(name: 'missionProfileId')
  final String missionProfileId;

  /// Name of a mission profile.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Region of a mission profile.
  @_s.JsonKey(name: 'region')
  final String region;

  /// Tags assigned to a mission profile.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// ARN of a tracking <code>Config</code>.
  @_s.JsonKey(name: 'trackingConfigArn')
  final String trackingConfigArn;

  GetMissionProfileResponse({
    this.contactPostPassDurationSeconds,
    this.contactPrePassDurationSeconds,
    this.dataflowEdges,
    this.minimumViableContactDurationSeconds,
    this.missionProfileArn,
    this.missionProfileId,
    this.name,
    this.region,
    this.tags,
    this.trackingConfigArn,
  });
  factory GetMissionProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMissionProfileResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSatelliteResponse {
  /// A list of ground stations to which the satellite is on-boarded.
  @_s.JsonKey(name: 'groundStations')
  final List<String> groundStations;

  /// NORAD satellite ID number.
  @_s.JsonKey(name: 'noradSatelliteID')
  final int noradSatelliteID;

  /// ARN of a satellite.
  @_s.JsonKey(name: 'satelliteArn')
  final String satelliteArn;

  /// UUID of a satellite.
  @_s.JsonKey(name: 'satelliteId')
  final String satelliteId;

  GetSatelliteResponse({
    this.groundStations,
    this.noradSatelliteID,
    this.satelliteArn,
    this.satelliteId,
  });
  factory GetSatelliteResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSatelliteResponseFromJson(json);
}

/// Information about the ground station data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroundStationData {
  /// UUID of a ground station.
  @_s.JsonKey(name: 'groundStationId')
  final String groundStationId;

  /// Name of a ground station.
  @_s.JsonKey(name: 'groundStationName')
  final String groundStationName;

  /// Ground station Region.
  @_s.JsonKey(name: 'region')
  final String region;

  GroundStationData({
    this.groundStationId,
    this.groundStationName,
    this.region,
  });
  factory GroundStationData.fromJson(Map<String, dynamic> json) =>
      _$GroundStationDataFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListConfigsResponse {
  /// List of <code>Config</code> items.
  @_s.JsonKey(name: 'configList')
  final List<ConfigListItem> configList;

  /// Next token returned in the response of a previous <code>ListConfigs</code>
  /// call. Used to get the next page of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListConfigsResponse({
    this.configList,
    this.nextToken,
  });
  factory ListConfigsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListConfigsResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListContactsResponse {
  /// List of contacts.
  @_s.JsonKey(name: 'contactList')
  final List<ContactData> contactList;

  /// Next token returned in the response of a previous <code>ListContacts</code>
  /// call. Used to get the next page of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListContactsResponse({
    this.contactList,
    this.nextToken,
  });
  factory ListContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListContactsResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDataflowEndpointGroupsResponse {
  /// A list of dataflow endpoint groups.
  @_s.JsonKey(name: 'dataflowEndpointGroupList')
  final List<DataflowEndpointListItem> dataflowEndpointGroupList;

  /// Next token returned in the response of a previous
  /// <code>ListDataflowEndpointGroups</code> call. Used to get the next page of
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDataflowEndpointGroupsResponse({
    this.dataflowEndpointGroupList,
    this.nextToken,
  });
  factory ListDataflowEndpointGroupsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListDataflowEndpointGroupsResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGroundStationsResponse {
  /// List of ground stations.
  @_s.JsonKey(name: 'groundStationList')
  final List<GroundStationData> groundStationList;

  /// Next token that can be supplied in the next call to get the next page of
  /// ground stations.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListGroundStationsResponse({
    this.groundStationList,
    this.nextToken,
  });
  factory ListGroundStationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGroundStationsResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMissionProfilesResponse {
  /// List of mission profiles.
  @_s.JsonKey(name: 'missionProfileList')
  final List<MissionProfileListItem> missionProfileList;

  /// Next token returned in the response of a previous
  /// <code>ListMissionProfiles</code> call. Used to get the next page of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListMissionProfilesResponse({
    this.missionProfileList,
    this.nextToken,
  });
  factory ListMissionProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMissionProfilesResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSatellitesResponse {
  /// Next token that can be supplied in the next call to get the next page of
  /// satellites.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// List of satellites.
  @_s.JsonKey(name: 'satellites')
  final List<SatelliteListItem> satellites;

  ListSatellitesResponse({
    this.nextToken,
    this.satellites,
  });
  factory ListSatellitesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSatellitesResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// Tags assigned to a resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MissionProfileIdResponse {
  /// UUID of a mission profile.
  @_s.JsonKey(name: 'missionProfileId')
  final String missionProfileId;

  MissionProfileIdResponse({
    this.missionProfileId,
  });
  factory MissionProfileIdResponse.fromJson(Map<String, dynamic> json) =>
      _$MissionProfileIdResponseFromJson(json);
}

/// Item in a list of mission profiles.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MissionProfileListItem {
  /// ARN of a mission profile.
  @_s.JsonKey(name: 'missionProfileArn')
  final String missionProfileArn;

  /// UUID of a mission profile.
  @_s.JsonKey(name: 'missionProfileId')
  final String missionProfileId;

  /// Name of a mission profile.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Region of a mission profile.
  @_s.JsonKey(name: 'region')
  final String region;

  MissionProfileListItem({
    this.missionProfileArn,
    this.missionProfileId,
    this.name,
    this.region,
  });
  factory MissionProfileListItem.fromJson(Map<String, dynamic> json) =>
      _$MissionProfileListItemFromJson(json);
}

enum Polarization {
  @_s.JsonValue('LEFT_HAND')
  leftHand,
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('RIGHT_HAND')
  rightHand,
}

/// Item in a list of satellites.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SatelliteListItem {
  /// A list of ground stations to which the satellite is on-boarded.
  @_s.JsonKey(name: 'groundStations')
  final List<String> groundStations;

  /// NORAD satellite ID number.
  @_s.JsonKey(name: 'noradSatelliteID')
  final int noradSatelliteID;

  /// ARN of a satellite.
  @_s.JsonKey(name: 'satelliteArn')
  final String satelliteArn;

  /// UUID of a satellite.
  @_s.JsonKey(name: 'satelliteId')
  final String satelliteId;

  SatelliteListItem({
    this.groundStations,
    this.noradSatelliteID,
    this.satelliteArn,
    this.satelliteId,
  });
  factory SatelliteListItem.fromJson(Map<String, dynamic> json) =>
      _$SatelliteListItemFromJson(json);
}

/// Information about endpoints.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SecurityDetails {
  /// ARN to a role needed for connecting streams to your instances.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The security groups to attach to the elastic network interfaces.
  @_s.JsonKey(name: 'securityGroupIds')
  final List<String> securityGroupIds;

  /// A list of subnets where AWS Ground Station places elastic network interfaces
  /// to send streams to your instances.
  @_s.JsonKey(name: 'subnetIds')
  final List<String> subnetIds;

  SecurityDetails({
    @_s.required this.roleArn,
    @_s.required this.securityGroupIds,
    @_s.required this.subnetIds,
  });
  factory SecurityDetails.fromJson(Map<String, dynamic> json) =>
      _$SecurityDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SecurityDetailsToJson(this);
}

/// Information about the socket address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SocketAddress {
  /// Name of a socket address.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Port of a socket address.
  @_s.JsonKey(name: 'port')
  final int port;

  SocketAddress({
    @_s.required this.name,
    @_s.required this.port,
  });
  factory SocketAddress.fromJson(Map<String, dynamic> json) =>
      _$SocketAddressFromJson(json);

  Map<String, dynamic> toJson() => _$SocketAddressToJson(this);
}

/// Dataflow details for the source side.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Source {
  /// Additional details for a <code>Config</code>, if type is dataflow endpoint
  /// or antenna demod decode.
  @_s.JsonKey(name: 'configDetails')
  final ConfigDetails configDetails;

  /// UUID of a <code>Config</code>.
  @_s.JsonKey(name: 'configId')
  final String configId;

  /// Type of a <code>Config</code>.
  @_s.JsonKey(name: 'configType')
  final ConfigCapabilityType configType;

  /// Region of a dataflow source.
  @_s.JsonKey(name: 'dataflowSourceRegion')
  final String dataflowSourceRegion;

  Source({
    this.configDetails,
    this.configId,
    this.configType,
    this.dataflowSourceRegion,
  });
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

/// Object that describes a spectral <code>Config</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'bandwidth')
  final FrequencyBandwidth bandwidth;

  /// Center frequency of a spectral <code>Config</code>. Valid values are between
  /// 2200 to 2300 MHz and 7750 to 8400 MHz for downlink and 2025 to 2120 MHz for
  /// uplink.
  @_s.JsonKey(name: 'centerFrequency')
  final Frequency centerFrequency;

  /// Polarization of a spectral <code>Config</code>. Capturing both
  /// <code>"RIGHT_HAND"</code> and <code>"LEFT_HAND"</code> polarization requires
  /// two separate configs.
  @_s.JsonKey(name: 'polarization')
  final Polarization polarization;

  SpectrumConfig({
    @_s.required this.bandwidth,
    @_s.required this.centerFrequency,
    this.polarization,
  });
  factory SpectrumConfig.fromJson(Map<String, dynamic> json) =>
      _$SpectrumConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SpectrumConfigToJson(this);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// Object that determines whether tracking should be used during a contact
/// executed with this <code>Config</code> in the mission profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TrackingConfig {
  /// Current setting for autotrack.
  @_s.JsonKey(name: 'autotrack')
  final Criticality autotrack;

  TrackingConfig({
    @_s.required this.autotrack,
  });
  factory TrackingConfig.fromJson(Map<String, dynamic> json) =>
      _$TrackingConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingConfigToJson(this);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

/// Information about an uplink echo <code>Config</code>.
///
/// Parameters from the <code>AntennaUplinkConfig</code>, corresponding to the
/// specified <code>AntennaUplinkConfigArn</code>, are used when this
/// <code>UplinkEchoConfig</code> is used in a contact.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UplinkEchoConfig {
  /// ARN of an uplink <code>Config</code>.
  @_s.JsonKey(name: 'antennaUplinkConfigArn')
  final String antennaUplinkConfigArn;

  /// Whether or not an uplink <code>Config</code> is enabled.
  @_s.JsonKey(name: 'enabled')
  final bool enabled;

  UplinkEchoConfig({
    @_s.required this.antennaUplinkConfigArn,
    @_s.required this.enabled,
  });
  factory UplinkEchoConfig.fromJson(Map<String, dynamic> json) =>
      _$UplinkEchoConfigFromJson(json);

  Map<String, dynamic> toJson() => _$UplinkEchoConfigToJson(this);
}

/// Information about the uplink spectral <code>Config</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UplinkSpectrumConfig {
  /// Center frequency of an uplink spectral <code>Config</code>. Valid values are
  /// between 2025 to 2120 MHz.
  @_s.JsonKey(name: 'centerFrequency')
  final Frequency centerFrequency;

  /// Polarization of an uplink spectral <code>Config</code>. Capturing both
  /// <code>"RIGHT_HAND"</code> and <code>"LEFT_HAND"</code> polarization requires
  /// two separate configs.
  @_s.JsonKey(name: 'polarization')
  final Polarization polarization;

  UplinkSpectrumConfig({
    @_s.required this.centerFrequency,
    this.polarization,
  });
  factory UplinkSpectrumConfig.fromJson(Map<String, dynamic> json) =>
      _$UplinkSpectrumConfigFromJson(json);

  Map<String, dynamic> toJson() => _$UplinkSpectrumConfigToJson(this);
}

class DependencyException extends _s.GenericAwsException {
  DependencyException({String type, String message})
      : super(type: type, code: 'DependencyException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
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
