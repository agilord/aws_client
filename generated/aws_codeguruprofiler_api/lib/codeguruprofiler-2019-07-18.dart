// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'codeguruprofiler-2019-07-18.g.dart';

/// This section provides documentation for the Amazon CodeGuru Profiler API
/// operations.
class CodeGuruProfiler {
  final _s.RestJsonProtocol _protocol;
  CodeGuruProfiler({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codeguru-profiler',
            signingName: 'codeguru-profiler',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// <p/>
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [profilingGroupName] :
  /// <p/>
  ///
  /// Parameter [fleetInstanceId] :
  /// <p/>
  Future<ConfigureAgentResponse> configureAgent({
    @_s.required String profilingGroupName,
    String fleetInstanceId,
  }) async {
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'fleetInstanceId',
      fleetInstanceId,
      1,
      255,
    );
    _s.validateStringPattern(
      'fleetInstanceId',
      fleetInstanceId,
      r'''^[\w-.:/]+$''',
    );
    final $payload = <String, dynamic>{
      if (fleetInstanceId != null) 'fleetInstanceId': fleetInstanceId,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName.toString())}/configureAgent',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return ConfigureAgentResponse(
      configuration: AgentConfiguration.fromJson($json),
    );
  }

  /// Creates a profiling group.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// This parameter specifies a unique identifier for the new profiling group
  /// that helps ensure idempotency.
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group.
  ///
  /// Parameter [agentOrchestrationConfig] :
  /// The agent orchestration configuration.
  Future<CreateProfilingGroupResponse> createProfilingGroup({
    @_s.required String clientToken,
    @_s.required String profilingGroupName,
    AgentOrchestrationConfig agentOrchestrationConfig,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    var _query = '';
    _query = '?${[
      if (clientToken != null) _s.toQueryParam('clientToken', clientToken),
    ].where((e) => e != null).join('&')}';
    final $payload = <String, dynamic>{
      'profilingGroupName': profilingGroupName,
      if (agentOrchestrationConfig != null)
        'agentOrchestrationConfig': agentOrchestrationConfig,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/profilingGroups$_query',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateProfilingGroupResponse(
      profilingGroup: ProfilingGroupDescription.fromJson($json),
    );
  }

  /// Deletes a profiling group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [profilingGroupName] :
  /// The profiling group name to delete.
  Future<void> deleteProfilingGroup({
    @_s.required String profilingGroupName,
  }) async {
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProfilingGroupResponse.fromJson(response);
  }

  /// Describes a profiling group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [profilingGroupName] :
  /// The profiling group name.
  Future<DescribeProfilingGroupResponse> describeProfilingGroup({
    @_s.required String profilingGroupName,
  }) async {
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DescribeProfilingGroupResponse(
      profilingGroup: ProfilingGroupDescription.fromJson($json),
    );
  }

  /// Gets the profiling group policy.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group.
  Future<GetPolicyResponse> getPolicy({
    @_s.required String profilingGroupName,
  }) async {
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName.toString())}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetPolicyResponse.fromJson(response);
  }

  /// Gets the aggregated profile of a profiling group for the specified time
  /// range. If the requested time range does not align with the available
  /// aggregated profiles, it is expanded to attain alignment. If aggregated
  /// profiles are available only for part of the period requested, the profile
  /// is returned from the earliest available to the latest within the requested
  /// time range.
  ///
  /// For example, if the requested time range is from 00:00 to 00:20 and the
  /// available profiles are from 00:15 to 00:25, the returned profile will be
  /// from 00:15 to 00:20.
  ///
  /// You must specify exactly two of the following parameters:
  /// <code>startTime</code>, <code>period</code>, and <code>endTime</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group to get.
  ///
  /// Parameter [accept] :
  /// The format of the profile to return. You can choose
  /// <code>application/json</code> or the default
  /// <code>application/x-amzn-ion</code>.
  ///
  /// Parameter [endTime] :
  /// <p/>
  /// You must specify exactly two of the following parameters:
  /// <code>startTime</code>, <code>period</code>, and <code>endTime</code>.
  ///
  /// Parameter [maxDepth] :
  /// The maximum depth of the graph.
  ///
  /// Parameter [period] :
  /// The period of the profile to get. The time range must be in the past and
  /// not longer than one week.
  ///
  /// You must specify exactly two of the following parameters:
  /// <code>startTime</code>, <code>period</code>, and <code>endTime</code>.
  ///
  /// Parameter [startTime] :
  /// The start time of the profile to get.
  ///
  /// You must specify exactly two of the following parameters:
  /// <code>startTime</code>, <code>period</code>, and <code>endTime</code>.
  Future<GetProfileResponse> getProfile({
    @_s.required String profilingGroupName,
    String accept,
    DateTime endTime,
    int maxDepth,
    String period,
    DateTime startTime,
  }) async {
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxDepth',
      maxDepth,
      1,
      10000,
    );
    _s.validateStringLength(
      'period',
      period,
      1,
      64,
    );
    final headers = <String, String>{};
    accept?.let((v) => headers['Accept'] = v.toString());
    var _query = '';
    _query = '?${[
      if (endTime != null)
        _s.toQueryParam('endTime', _s.iso8601ToJson(endTime)),
      if (maxDepth != null) _s.toQueryParam('maxDepth', maxDepth),
      if (period != null) _s.toQueryParam('period', period),
      if (startTime != null)
        _s.toQueryParam('startTime', _s.iso8601ToJson(startTime)),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.sendRaw(
      payload: null,
      headers: headers,
      method: 'GET',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName.toString())}/profile$_query',
      exceptionFnMap: _exceptionFns,
    );
    return GetProfileResponse(
      profile: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      contentEncoding:
          _s.extractHeaderStringValue(response.headers, 'Content-Encoding'),
    );
  }

  /// List the start times of the available aggregated profiles of a profiling
  /// group for an aggregation period within the specified time range.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [endTime] :
  /// The end time of the time range from which to list the profiles.
  ///
  /// Parameter [period] :
  /// The aggregation period.
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group.
  ///
  /// Parameter [startTime] :
  /// The start time of the time range from which to list the profiles.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of profile time results returned by
  /// <code>ListProfileTimes</code> in paginated output. When this parameter is
  /// used, <code>ListProfileTimes</code> only returns <code>maxResults</code>
  /// results in a single page with a <code>nextToken</code> response element.
  /// The remaining results of the initial request can be seen by sending
  /// another <code>ListProfileTimes</code> request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListProfileTimes</code> request where <code>maxResults</code> was
  /// used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [orderBy] :
  /// The order (ascending or descending by start time of the profile) to use
  /// when listing profiles. Defaults to <code>TIMESTAMP_DESCENDING</code>.
  Future<ListProfileTimesResponse> listProfileTimes({
    @_s.required DateTime endTime,
    @_s.required AggregationPeriod period,
    @_s.required String profilingGroupName,
    @_s.required DateTime startTime,
    int maxResults,
    String nextToken,
    OrderBy orderBy,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(period, 'period');
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w-]+$''',
    );
    var _query = '';
    _query = '?${[
      if (endTime != null)
        _s.toQueryParam('endTime', _s.iso8601ToJson(endTime)),
      if (period != null) _s.toQueryParam('period', period.toValue()),
      if (startTime != null)
        _s.toQueryParam('startTime', _s.iso8601ToJson(startTime)),
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
      if (orderBy != null) _s.toQueryParam('orderBy', orderBy.toValue()),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName.toString())}/profileTimes$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListProfileTimesResponse.fromJson(response);
  }

  /// Lists profiling groups.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [includeDescription] :
  /// A Boolean value indicating whether to include a description.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of profiling groups results returned by
  /// <code>ListProfilingGroups</code> in paginated output. When this parameter
  /// is used, <code>ListProfilingGroups</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListProfilingGroups</code> request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListProfilingGroups</code> request where <code>maxResults</code> was
  /// used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListProfilingGroupsResponse> listProfilingGroups({
    bool includeDescription,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w-]+$''',
    );
    var _query = '';
    _query = '?${[
      if (includeDescription != null)
        _s.toQueryParam('includeDescription', includeDescription),
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/profilingGroups$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListProfilingGroupsResponse.fromJson(response);
  }

  /// <p/>
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentProfile] :
  /// <p/>
  ///
  /// Parameter [contentType] :
  /// <p/>
  ///
  /// Parameter [profilingGroupName] :
  /// <p/>
  ///
  /// Parameter [profileToken] :
  /// <p/>
  Future<void> postAgentProfile({
    @_s.required Uint8List agentProfile,
    @_s.required String contentType,
    @_s.required String profilingGroupName,
    String profileToken,
  }) async {
    ArgumentError.checkNotNull(agentProfile, 'agentProfile');
    ArgumentError.checkNotNull(contentType, 'contentType');
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'profileToken',
      profileToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'profileToken',
      profileToken,
      r'''^[\w-]+$''',
    );
    final headers = <String, String>{};
    contentType?.let((v) => headers['Content-Type'] = v.toString());
    var _query = '';
    _query = '?${[
      if (profileToken != null) _s.toQueryParam('profileToken', profileToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: agentProfile,
      headers: headers,
      method: 'POST',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName.toString())}/agentProfile$_query',
      exceptionFnMap: _exceptionFns,
    );
    return PostAgentProfileResponse.fromJson(response);
  }

  /// Provides permission to the principals. This overwrites the existing
  /// permissions, and is not additive.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [actionGroup] :
  /// The list of actions that the users and roles can perform on the profiling
  /// group.
  ///
  /// Parameter [principals] :
  /// The list of role and user ARNs or the accountId that needs access
  /// (wildcards are not allowed).
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group.
  ///
  /// Parameter [revisionId] :
  /// A unique identifier for the current revision of the policy. This is
  /// required, if a policy exists for the profiling group. This is not required
  /// when creating the policy for the first time.
  Future<PutPermissionResponse> putPermission({
    @_s.required ActionGroup actionGroup,
    @_s.required List<String> principals,
    @_s.required String profilingGroupName,
    String revisionId,
  }) async {
    ArgumentError.checkNotNull(actionGroup, 'actionGroup');
    ArgumentError.checkNotNull(principals, 'principals');
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'revisionId',
      revisionId,
      r'''[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}''',
    );
    final $payload = <String, dynamic>{
      'principals': principals,
      if (revisionId != null) 'revisionId': revisionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName.toString())}/policy/${Uri.encodeComponent(actionGroup.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return PutPermissionResponse.fromJson(response);
  }

  /// Removes statement for the provided action group from the policy.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [actionGroup] :
  /// The list of actions that the users and roles can perform on the profiling
  /// group.
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group.
  ///
  /// Parameter [revisionId] :
  /// A unique identifier for the current revision of the policy.
  Future<RemovePermissionResponse> removePermission({
    @_s.required ActionGroup actionGroup,
    @_s.required String profilingGroupName,
    @_s.required String revisionId,
  }) async {
    ArgumentError.checkNotNull(actionGroup, 'actionGroup');
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(revisionId, 'revisionId');
    _s.validateStringPattern(
      'revisionId',
      revisionId,
      r'''[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}''',
      isRequired: true,
    );
    var _query = '';
    _query = '?${[
      if (revisionId != null) _s.toQueryParam('revisionId', revisionId),
    ].where((e) => e != null).join('&')}';
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName.toString())}/policy/${Uri.encodeComponent(actionGroup.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return RemovePermissionResponse.fromJson(response);
  }

  /// Updates a profiling group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentOrchestrationConfig] :
  /// <p/>
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group to update.
  Future<UpdateProfilingGroupResponse> updateProfilingGroup({
    @_s.required AgentOrchestrationConfig agentOrchestrationConfig,
    @_s.required String profilingGroupName,
  }) async {
    ArgumentError.checkNotNull(
        agentOrchestrationConfig, 'agentOrchestrationConfig');
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'agentOrchestrationConfig': agentOrchestrationConfig,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateProfilingGroupResponse(
      profilingGroup: ProfilingGroupDescription.fromJson($json),
    );
  }
}

enum ActionGroup {
  @_s.JsonValue('agentPermissions')
  agentPermissions,
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AgentConfiguration {
  /// <p/>
  @_s.JsonKey(name: 'periodInSeconds')
  final int periodInSeconds;

  /// <p/>
  @_s.JsonKey(name: 'shouldProfile')
  final bool shouldProfile;

  AgentConfiguration({
    @_s.required this.periodInSeconds,
    @_s.required this.shouldProfile,
  });
  factory AgentConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AgentConfigurationFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AgentOrchestrationConfig {
  /// <p/>
  @_s.JsonKey(name: 'profilingEnabled')
  final bool profilingEnabled;

  AgentOrchestrationConfig({
    @_s.required this.profilingEnabled,
  });
  factory AgentOrchestrationConfig.fromJson(Map<String, dynamic> json) =>
      _$AgentOrchestrationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AgentOrchestrationConfigToJson(this);
}

/// Information about the time range of the latest available aggregated profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AggregatedProfileTime {
  /// The time period.
  @_s.JsonKey(name: 'period')
  final AggregationPeriod period;

  /// The start time.
  @_s.JsonKey(name: 'start', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime start;

  AggregatedProfileTime({
    this.period,
    this.start,
  });
  factory AggregatedProfileTime.fromJson(Map<String, dynamic> json) =>
      _$AggregatedProfileTimeFromJson(json);
}

enum AggregationPeriod {
  @_s.JsonValue('P1D')
  p1d,
  @_s.JsonValue('PT1H')
  pt1h,
  @_s.JsonValue('PT5M')
  pt5m,
}

extension on AggregationPeriod {
  String toValue() {
    switch (this) {
      case AggregationPeriod.p1d:
        return 'P1D';
      case AggregationPeriod.pt1h:
        return 'PT1H';
      case AggregationPeriod.pt5m:
        return 'PT5M';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The structure representing the configureAgentResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigureAgentResponse {
  /// <p/>
  @_s.JsonKey(name: 'configuration')
  final AgentConfiguration configuration;

  ConfigureAgentResponse({
    @_s.required this.configuration,
  });
  factory ConfigureAgentResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfigureAgentResponseFromJson(json);
}

/// The structure representing the createProfilingGroupResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProfilingGroupResponse {
  /// Information about the new profiling group
  @_s.JsonKey(name: 'profilingGroup')
  final ProfilingGroupDescription profilingGroup;

  CreateProfilingGroupResponse({
    @_s.required this.profilingGroup,
  });
  factory CreateProfilingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProfilingGroupResponseFromJson(json);
}

/// The structure representing the deleteProfilingGroupResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProfilingGroupResponse {
  DeleteProfilingGroupResponse();
  factory DeleteProfilingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProfilingGroupResponseFromJson(json);
}

/// The structure representing the describeProfilingGroupResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProfilingGroupResponse {
  /// Information about a profiling group.
  @_s.JsonKey(name: 'profilingGroup')
  final ProfilingGroupDescription profilingGroup;

  DescribeProfilingGroupResponse({
    @_s.required this.profilingGroup,
  });
  factory DescribeProfilingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeProfilingGroupResponseFromJson(json);
}

/// The structure representing the getPolicyResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPolicyResponse {
  /// The resource-based policy attached to the <code>ProfilingGroup</code>.
  @_s.JsonKey(name: 'policy')
  final String policy;

  /// A unique identifier for the current revision of the policy.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  GetPolicyResponse({
    @_s.required this.policy,
    @_s.required this.revisionId,
  });
  factory GetPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPolicyResponseFromJson(json);
}

/// The structure representing the getProfileResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetProfileResponse {
  /// The content type of the profile in the payload. It is either
  /// <code>application/json</code> or the default
  /// <code>application/x-amzn-ion</code>.
  @_s.JsonKey(name: 'Content-Type')
  final String contentType;

  /// Information about the profile.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'profile')
  final Uint8List profile;

  /// The content encoding of the profile.
  @_s.JsonKey(name: 'Content-Encoding')
  final String contentEncoding;

  GetProfileResponse({
    @_s.required this.contentType,
    @_s.required this.profile,
    this.contentEncoding,
  });
  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfileResponseFromJson(json);
}

/// The structure representing the listProfileTimesResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProfileTimesResponse {
  /// The list of start times of the available profiles for the aggregation period
  /// in the specified time range.
  @_s.JsonKey(name: 'profileTimes')
  final List<ProfileTime> profileTimes;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListProfileTimes</code> request. When the results of a
  /// <code>ListProfileTimes</code> request exceed <code>maxResults</code>, this
  /// value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListProfileTimesResponse({
    @_s.required this.profileTimes,
    this.nextToken,
  });
  factory ListProfileTimesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProfileTimesResponseFromJson(json);
}

/// The structure representing the listProfilingGroupsResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProfilingGroupsResponse {
  /// Information about profiling group names.
  @_s.JsonKey(name: 'profilingGroupNames')
  final List<String> profilingGroupNames;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListProfilingGroups</code> request. When the results of a
  /// <code>ListProfilingGroups</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about profiling groups.
  @_s.JsonKey(name: 'profilingGroups')
  final List<ProfilingGroupDescription> profilingGroups;

  ListProfilingGroupsResponse({
    @_s.required this.profilingGroupNames,
    this.nextToken,
    this.profilingGroups,
  });
  factory ListProfilingGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProfilingGroupsResponseFromJson(json);
}

enum OrderBy {
  @_s.JsonValue('TimestampAscending')
  timestampAscending,
  @_s.JsonValue('TimestampDescending')
  timestampDescending,
}

extension on OrderBy {
  String toValue() {
    switch (this) {
      case OrderBy.timestampAscending:
        return 'TimestampAscending';
      case OrderBy.timestampDescending:
        return 'TimestampDescending';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The structure representing the postAgentProfileResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PostAgentProfileResponse {
  PostAgentProfileResponse();
  factory PostAgentProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$PostAgentProfileResponseFromJson(json);
}

/// Information about the profile time.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProfileTime {
  /// The start time of the profile.
  @_s.JsonKey(name: 'start', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime start;

  ProfileTime({
    this.start,
  });
  factory ProfileTime.fromJson(Map<String, dynamic> json) =>
      _$ProfileTimeFromJson(json);
}

/// The description of a profiling group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProfilingGroupDescription {
  /// <p/>
  @_s.JsonKey(name: 'agentOrchestrationConfig')
  final AgentOrchestrationConfig agentOrchestrationConfig;

  /// The Amazon Resource Name (ARN) identifying the profiling group.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the profiling group was
  /// created.
  @_s.JsonKey(
      name: 'createdAt', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime createdAt;

  /// The name of the profiling group.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of the profiling group.
  @_s.JsonKey(name: 'profilingStatus')
  final ProfilingStatus profilingStatus;

  /// The time, in milliseconds since the epoch, when the profiling group was last
  /// updated.
  @_s.JsonKey(
      name: 'updatedAt', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime updatedAt;

  ProfilingGroupDescription({
    this.agentOrchestrationConfig,
    this.arn,
    this.createdAt,
    this.name,
    this.profilingStatus,
    this.updatedAt,
  });
  factory ProfilingGroupDescription.fromJson(Map<String, dynamic> json) =>
      _$ProfilingGroupDescriptionFromJson(json);
}

/// Information about the profiling status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProfilingStatus {
  /// The time, in milliseconds since the epoch, when the latest agent was
  /// orchestrated.
  @_s.JsonKey(
      name: 'latestAgentOrchestratedAt',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime latestAgentOrchestratedAt;

  /// The time, in milliseconds since the epoch, when the latest agent was
  /// reported..
  @_s.JsonKey(
      name: 'latestAgentProfileReportedAt',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime latestAgentProfileReportedAt;

  /// The latest aggregated profile
  @_s.JsonKey(name: 'latestAggregatedProfile')
  final AggregatedProfileTime latestAggregatedProfile;

  ProfilingStatus({
    this.latestAgentOrchestratedAt,
    this.latestAgentProfileReportedAt,
    this.latestAggregatedProfile,
  });
  factory ProfilingStatus.fromJson(Map<String, dynamic> json) =>
      _$ProfilingStatusFromJson(json);
}

/// The structure representing the putPermissionResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutPermissionResponse {
  /// The resource-based policy.
  @_s.JsonKey(name: 'policy')
  final String policy;

  /// A unique identifier for the current revision of the policy.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  PutPermissionResponse({
    @_s.required this.policy,
    @_s.required this.revisionId,
  });
  factory PutPermissionResponse.fromJson(Map<String, dynamic> json) =>
      _$PutPermissionResponseFromJson(json);
}

/// The structure representing the removePermissionResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemovePermissionResponse {
  /// The resource-based policy.
  @_s.JsonKey(name: 'policy')
  final String policy;

  /// A unique identifier for the current revision of the policy.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  RemovePermissionResponse({
    @_s.required this.policy,
    @_s.required this.revisionId,
  });
  factory RemovePermissionResponse.fromJson(Map<String, dynamic> json) =>
      _$RemovePermissionResponseFromJson(json);
}

/// The structure representing the updateProfilingGroupResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProfilingGroupResponse {
  /// Updated information about the profiling group.
  @_s.JsonKey(name: 'profilingGroup')
  final ProfilingGroupDescription profilingGroup;

  UpdateProfilingGroupResponse({
    @_s.required this.profilingGroup,
  });
  factory UpdateProfilingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfilingGroupResponseFromJson(json);
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

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
