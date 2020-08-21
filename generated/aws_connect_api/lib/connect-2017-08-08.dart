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

part 'connect-2017-08-08.g.dart';

/// Amazon Connect is a cloud-based contact center solution that makes it easy
/// to set up and manage a customer contact center and provide reliable customer
/// engagement at any scale.
///
/// Amazon Connect provides rich metrics and real-time reporting that allow you
/// to optimize contact routing. You can also resolve customer issues more
/// efficiently by putting customers in touch with the right agents.
///
/// There are limits to the number of Amazon Connect resources that you can
/// create and limits to the number of requests that you can make per second.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon
/// Connect Service Limits</a> in the <i>Amazon Connect Administrator Guide</i>.
class Connect {
  final _s.RestJsonProtocol _protocol;
  Connect({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'connect',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a user account for the specified Amazon Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [phoneConfig] :
  /// The phone settings for the user.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile for the user.
  ///
  /// Parameter [securityProfileIds] :
  /// The identifier of the security profile for the user.
  ///
  /// Parameter [username] :
  /// The user name for the account. For instances not using SAML for identity
  /// management, the user name can include up to 20 characters. If you are
  /// using SAML for identity management, the user name can include up to 64
  /// characters from [a-zA-Z0-9_-.\@]+.
  ///
  /// Parameter [directoryUserId] :
  /// The identifier of the user account in the directory used for identity
  /// management. If Amazon Connect cannot access the directory, you can specify
  /// this identifier to authenticate users. If you include the identifier, we
  /// assume that Amazon Connect cannot access the directory. Otherwise, the
  /// identity information is used to authenticate users from your directory.
  ///
  /// This parameter is required if you are using an existing directory for
  /// identity management in Amazon Connect when Amazon Connect cannot access
  /// your directory to authenticate users. If you are using SAML for identity
  /// management and include this parameter, an error is returned.
  ///
  /// Parameter [hierarchyGroupId] :
  /// The identifier of the hierarchy group for the user.
  ///
  /// Parameter [identityInfo] :
  /// The information about the identity of the user.
  ///
  /// Parameter [password] :
  /// The password for the user account. A password is required if you are using
  /// Amazon Connect for identity management. Otherwise, it is an error to
  /// include a password.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<CreateUserResponse> createUser({
    @_s.required String instanceId,
    @_s.required UserPhoneConfig phoneConfig,
    @_s.required String routingProfileId,
    @_s.required List<String> securityProfileIds,
    @_s.required String username,
    String directoryUserId,
    String hierarchyGroupId,
    UserIdentityInfo identityInfo,
    String password,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(phoneConfig, 'phoneConfig');
    ArgumentError.checkNotNull(routingProfileId, 'routingProfileId');
    ArgumentError.checkNotNull(securityProfileIds, 'securityProfileIds');
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'password',
      password,
      r'''/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\S]{8,64}$/''',
    );
    final $payload = <String, dynamic>{
      'PhoneConfig': phoneConfig,
      'RoutingProfileId': routingProfileId,
      'SecurityProfileIds': securityProfileIds,
      'Username': username,
      'DirectoryUserId': directoryUserId,
      'HierarchyGroupId': hierarchyGroupId,
      'IdentityInfo': identityInfo,
      'Password': password,
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/users/${Uri.encodeComponent(instanceId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUserResponse.fromJson(response);
  }

  /// Deletes a user account from the specified Amazon Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [userId] :
  /// The identifier of the user.
  Future<void> deleteUser({
    @_s.required String instanceId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/users/${Uri.encodeComponent(instanceId.toString())}/${Uri.encodeComponent(userId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describes the specified user account. You can find the instance ID in the
  /// console (it’s the final part of the ARN). The console does not display the
  /// user IDs. Instead, list the users and note the IDs provided in the output.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  Future<DescribeUserResponse> describeUser({
    @_s.required String instanceId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/users/${Uri.encodeComponent(instanceId.toString())}/${Uri.encodeComponent(userId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeUserResponse.fromJson(response);
  }

  /// Describes the specified hierarchy group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [hierarchyGroupId] :
  /// The identifier of the hierarchy group.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  Future<DescribeUserHierarchyGroupResponse> describeUserHierarchyGroup({
    @_s.required String hierarchyGroupId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(hierarchyGroupId, 'hierarchyGroupId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/user-hierarchy-groups/${Uri.encodeComponent(instanceId.toString())}/${Uri.encodeComponent(hierarchyGroupId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeUserHierarchyGroupResponse.fromJson(response);
  }

  /// Describes the hierarchy structure of the specified Amazon Connect
  /// instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  Future<DescribeUserHierarchyStructureResponse>
      describeUserHierarchyStructure({
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/user-hierarchy-structure/${Uri.encodeComponent(instanceId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeUserHierarchyStructureResponse.fromJson(response);
  }

  /// Retrieves the contact attributes for the specified contact.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [initialContactId] :
  /// The identifier of the initial contact.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  Future<GetContactAttributesResponse> getContactAttributes({
    @_s.required String initialContactId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(initialContactId, 'initialContactId');
    _s.validateStringLength(
      'initialContactId',
      initialContactId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/contact/attributes/${Uri.encodeComponent(instanceId.toString())}/${Uri.encodeComponent(initialContactId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetContactAttributesResponse.fromJson(response);
  }

  /// Gets the real-time metric data from the specified Amazon Connect instance.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-reports.html">Real-time
  /// Metrics Reports</a> in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [currentMetrics] :
  /// The metrics to retrieve. Specify the name and unit for each metric. The
  /// following metrics are available:
  /// <dl> <dt>AGENTS_AFTER_CONTACT_WORK</dt> <dd>
  /// Unit: COUNT
  /// </dd> <dt>AGENTS_AVAILABLE</dt> <dd>
  /// Unit: COUNT
  /// </dd> <dt>AGENTS_ERROR</dt> <dd>
  /// Unit: COUNT
  /// </dd> <dt>AGENTS_NON_PRODUCTIVE</dt> <dd>
  /// Unit: COUNT
  /// </dd> <dt>AGENTS_ON_CALL</dt> <dd>
  /// Unit: COUNT
  /// </dd> <dt>AGENTS_ON_CONTACT</dt> <dd>
  /// Unit: COUNT
  /// </dd> <dt>AGENTS_ONLINE</dt> <dd>
  /// Unit: COUNT
  /// </dd> <dt>AGENTS_STAFFED</dt> <dd>
  /// Unit: COUNT
  /// </dd> <dt>CONTACTS_IN_QUEUE</dt> <dd>
  /// Unit: COUNT
  /// </dd> <dt>CONTACTS_SCHEDULED</dt> <dd>
  /// Unit: COUNT
  /// </dd> <dt>OLDEST_CONTACT_AGE</dt> <dd>
  /// Unit: SECONDS
  /// </dd> <dt>SLOTS_ACTIVE</dt> <dd>
  /// Unit: COUNT
  /// </dd> <dt>SLOTS_AVAILABLE</dt> <dd>
  /// Unit: COUNT
  /// </dd> </dl>
  ///
  /// Parameter [filters] :
  /// The queues, up to 100, or channels, to use to filter the metrics returned.
  /// Metric data is retrieved only for the resources associated with the queues
  /// or channels included in the filter. You can include both queue IDs and
  /// queue ARNs in the same request. The only supported channel is
  /// <code>VOICE</code>.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [groupings] :
  /// The grouping applied to the metrics returned. For example, when grouped by
  /// <code>QUEUE</code>, the metrics returned apply to each queue rather than
  /// aggregated for all queues. If you group by <code>CHANNEL</code>, you
  /// should include a Channels filter. The only supported channel is
  /// <code>VOICE</code>.
  ///
  /// If no <code>Grouping</code> is included in the request, a summary of
  /// metrics is returned.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// The token expires after 5 minutes from the time it is created. Subsequent
  /// requests that use the token must use the same request parameters as the
  /// request that generated the token.
  Future<GetCurrentMetricDataResponse> getCurrentMetricData({
    @_s.required List<CurrentMetric> currentMetrics,
    @_s.required Filters filters,
    @_s.required String instanceId,
    List<String> groupings,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(currentMetrics, 'currentMetrics');
    ArgumentError.checkNotNull(filters, 'filters');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
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
    final $payload = <String, dynamic>{
      'CurrentMetrics': currentMetrics,
      'Filters': filters,
      'Groupings': groupings,
      'MaxResults': maxResults,
      'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/metrics/current/${Uri.encodeComponent(instanceId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCurrentMetricDataResponse.fromJson(response);
  }

  /// Retrieves a token for federation.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [DuplicateResourceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  Future<GetFederationTokenResponse> getFederationToken({
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/user/federate/${Uri.encodeComponent(instanceId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFederationTokenResponse.fromJson(response);
  }

  /// Gets historical metric data from the specified Amazon Connect instance.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics.html">Historical
  /// Metrics Reports</a> in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [endTime] :
  /// The timestamp, in UNIX Epoch time format, at which to end the reporting
  /// interval for the retrieval of historical metrics data. The time must be
  /// specified using an interval of 5 minutes, such as 11:00, 11:05, 11:10, and
  /// must be later than the start time timestamp.
  ///
  /// The time range between the start and end time must be less than 24 hours.
  ///
  /// Parameter [filters] :
  /// The queues, up to 100, or channels, to use to filter the metrics returned.
  /// Metric data is retrieved only for the resources associated with the queues
  /// or channels included in the filter. You can include both queue IDs and
  /// queue ARNs in the same request. The only supported channel is
  /// <code>VOICE</code>.
  ///
  /// Parameter [historicalMetrics] :
  /// The metrics to retrieve. Specify the name, unit, and statistic for each
  /// metric. The following historical metrics are available:
  /// <dl> <dt>ABANDON_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: AVG
  /// </dd> <dt>AFTER_CONTACT_WORK_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: AVG
  /// </dd> <dt>API_CONTACTS_HANDLED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CALLBACK_CONTACTS_HANDLED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_ABANDONED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_AGENT_HUNG_UP_FIRST</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_CONSULTED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_HANDLED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_HANDLED_INCOMING</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_HANDLED_OUTBOUND</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_HOLD_ABANDONS</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_MISSED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_QUEUED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_TRANSFERRED_IN</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_TRANSFERRED_IN_FROM_QUEUE</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_TRANSFERRED_OUT</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_TRANSFERRED_OUT_FROM_QUEUE</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>HANDLE_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: AVG
  /// </dd> <dt>HOLD_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: AVG
  /// </dd> <dt>INTERACTION_AND_HOLD_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: AVG
  /// </dd> <dt>INTERACTION_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: AVG
  /// </dd> <dt>OCCUPANCY</dt> <dd>
  /// Unit: PERCENT
  ///
  /// Statistic: AVG
  /// </dd> <dt>QUEUE_ANSWER_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: AVG
  /// </dd> <dt>QUEUED_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: MAX
  /// </dd> <dt>SERVICE_LEVEL</dt> <dd>
  /// Unit: PERCENT
  ///
  /// Statistic: AVG
  ///
  /// Threshold: Only "Less than" comparisons are supported, with the following
  /// service level thresholds: 15, 20, 25, 30, 45, 60, 90, 120, 180, 240, 300,
  /// 600
  /// </dd> </dl>
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [startTime] :
  /// The timestamp, in UNIX Epoch time format, at which to start the reporting
  /// interval for the retrieval of historical metrics data. The time must be
  /// specified using a multiple of 5 minutes, such as 10:05, 10:10, 10:15.
  ///
  /// The start time cannot be earlier than 24 hours before the time of the
  /// request. Historical metrics are available only for 24 hours.
  ///
  /// Parameter [groupings] :
  /// The grouping applied to the metrics returned. For example, when results
  /// are grouped by queue, the metrics returned are grouped by queue. The
  /// values returned apply to the metrics for each queue rather than aggregated
  /// for all queues.
  ///
  /// The only supported grouping is <code>QUEUE</code>.
  ///
  /// If no grouping is specified, a summary of metrics for all queues is
  /// returned.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<GetMetricDataResponse> getMetricData({
    @_s.required DateTime endTime,
    @_s.required Filters filters,
    @_s.required List<HistoricalMetric> historicalMetrics,
    @_s.required String instanceId,
    @_s.required DateTime startTime,
    List<String> groupings,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(filters, 'filters');
    ArgumentError.checkNotNull(historicalMetrics, 'historicalMetrics');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'EndTime': endTime,
      'Filters': filters,
      'HistoricalMetrics': historicalMetrics,
      'StartTime': startTime,
      'Groupings': groupings,
      'MaxResults': maxResults,
      'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/metrics/historical/${Uri.encodeComponent(instanceId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMetricDataResponse.fromJson(response);
  }

  /// Provides information about the contact flows for the specified Amazon
  /// Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [contactFlowTypes] :
  /// The type of contact flow.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListContactFlowsResponse> listContactFlows({
    @_s.required String instanceId,
    List<String> contactFlowTypes,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (contactFlowTypes != null)
        _s.toQueryParam('contactFlowTypes', contactFlowTypes),
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/contact-flows-summary/${Uri.encodeComponent(instanceId.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListContactFlowsResponse.fromJson(response);
  }

  /// Provides information about the hours of operation for the specified Amazon
  /// Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListHoursOfOperationsResponse> listHoursOfOperations({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/hours-of-operations-summary/${Uri.encodeComponent(instanceId.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListHoursOfOperationsResponse.fromJson(response);
  }

  /// Provides information about the phone numbers for the specified Amazon
  /// Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [phoneNumberCountryCodes] :
  /// The ISO country code.
  ///
  /// Parameter [phoneNumberTypes] :
  /// The type of phone number.
  Future<ListPhoneNumbersResponse> listPhoneNumbers({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
    List<String> phoneNumberCountryCodes,
    List<String> phoneNumberTypes,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
      if (phoneNumberCountryCodes != null)
        _s.toQueryParam('phoneNumberCountryCodes', phoneNumberCountryCodes),
      if (phoneNumberTypes != null)
        _s.toQueryParam('phoneNumberTypes', phoneNumberTypes),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/phone-numbers-summary/${Uri.encodeComponent(instanceId.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListPhoneNumbersResponse.fromJson(response);
  }

  /// Provides information about the queues for the specified Amazon Connect
  /// instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [queueTypes] :
  /// The type of queue.
  Future<ListQueuesResponse> listQueues({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
    List<String> queueTypes,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
      if (queueTypes != null) _s.toQueryParam('queueTypes', queueTypes),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/queues-summary/${Uri.encodeComponent(instanceId.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListQueuesResponse.fromJson(response);
  }

  /// Provides summary information about the routing profiles for the specified
  /// Amazon Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListRoutingProfilesResponse> listRoutingProfiles({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/routing-profiles-summary/${Uri.encodeComponent(instanceId.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListRoutingProfilesResponse.fromJson(response);
  }

  /// Provides summary information about the security profiles for the specified
  /// Amazon Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListSecurityProfilesResponse> listSecurityProfiles({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/security-profiles-summary/${Uri.encodeComponent(instanceId.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListSecurityProfilesResponse.fromJson(response);
  }

  /// Lists the tags for the specified resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Provides summary information about the hierarchy groups for the specified
  /// Amazon Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListUserHierarchyGroupsResponse> listUserHierarchyGroups({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/user-hierarchy-groups-summary/${Uri.encodeComponent(instanceId.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListUserHierarchyGroupsResponse.fromJson(response);
  }

  /// Provides summary information about the users for the specified Amazon
  /// Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListUsersResponse> listUsers({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/users-summary/${Uri.encodeComponent(instanceId.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListUsersResponse.fromJson(response);
  }

  /// Initiates a contact flow to start a new chat for the customer. Response of
  /// this API provides a token required to obtain credentials from the <a
  /// href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a>
  /// API in the Amazon Connect Participant Service.
  ///
  /// When a new chat contact is successfully created, clients need to subscribe
  /// to the participant’s connection for the created chat within 5 minutes.
  /// This is achieved by invoking <a
  /// href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a>
  /// with WEBSOCKET and CONNECTION_CREDENTIALS.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [contactFlowId] :
  /// The identifier of the contact flow for the chat.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [participantDetails] :
  /// Information identifying the participant.
  ///
  /// Parameter [attributes] :
  /// A custom key-value pair using an attribute map. The attributes are
  /// standard Amazon Connect attributes, and can be accessed in contact flows
  /// just like any other contact attributes.
  ///
  /// There can be up to 32,768 UTF-8 bytes across all key-value pairs per
  /// contact. Attribute keys can include only alphanumeric, dash, and
  /// underscore characters.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [initialMessage] :
  /// The initial message to be sent to the newly created chat.
  Future<StartChatContactResponse> startChatContact({
    @_s.required String contactFlowId,
    @_s.required String instanceId,
    @_s.required ParticipantDetails participantDetails,
    Map<String, String> attributes,
    String clientToken,
    ChatMessage initialMessage,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    _s.validateStringLength(
      'contactFlowId',
      contactFlowId,
      0,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(participantDetails, 'participantDetails');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      500,
    );
    final $payload = <String, dynamic>{
      'ContactFlowId': contactFlowId,
      'InstanceId': instanceId,
      'ParticipantDetails': participantDetails,
      'Attributes': attributes,
      'ClientToken': clientToken,
      'InitialMessage': initialMessage,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/contact/chat',
      exceptionFnMap: _exceptionFns,
    );
    return StartChatContactResponse.fromJson(response);
  }

  /// Initiates a contact flow to place an outbound call to a customer.
  ///
  /// There is a 60 second dialing timeout for this operation. If the call is
  /// not connected after 60 seconds, it fails.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [LimitExceededException].
  /// May throw [DestinationNotAllowedException].
  /// May throw [OutboundContactNotPermittedException].
  ///
  /// Parameter [contactFlowId] :
  /// The identifier of the contact flow for the outbound call.
  ///
  /// Parameter [destinationPhoneNumber] :
  /// The phone number of the customer, in E.164 format.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [attributes] :
  /// A custom key-value pair using an attribute map. The attributes are
  /// standard Amazon Connect attributes, and can be accessed in contact flows
  /// just like any other contact attributes.
  ///
  /// There can be up to 32,768 UTF-8 bytes across all key-value pairs per
  /// contact. Attribute keys can include only alphanumeric, dash, and
  /// underscore characters.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. The token is valid for 7 days after creation.
  /// If a contact is already started, the contact ID is returned. If the
  /// contact is disconnected, a new contact is started.
  ///
  /// Parameter [queueId] :
  /// The queue for the call. If you specify a queue, the phone displayed for
  /// caller ID is the phone number specified in the queue. If you do not
  /// specify a queue, the queue defined in the contact flow is used. If you do
  /// not specify a queue, you must specify a source phone number.
  ///
  /// Parameter [sourcePhoneNumber] :
  /// The phone number associated with the Amazon Connect instance, in E.164
  /// format. If you do not specify a source phone number, you must specify a
  /// queue.
  Future<StartOutboundVoiceContactResponse> startOutboundVoiceContact({
    @_s.required String contactFlowId,
    @_s.required String destinationPhoneNumber,
    @_s.required String instanceId,
    Map<String, String> attributes,
    String clientToken,
    String queueId,
    String sourcePhoneNumber,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    _s.validateStringLength(
      'contactFlowId',
      contactFlowId,
      0,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        destinationPhoneNumber, 'destinationPhoneNumber');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      500,
    );
    final $payload = <String, dynamic>{
      'ContactFlowId': contactFlowId,
      'DestinationPhoneNumber': destinationPhoneNumber,
      'InstanceId': instanceId,
      'Attributes': attributes,
      'ClientToken': clientToken,
      'QueueId': queueId,
      'SourcePhoneNumber': sourcePhoneNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/contact/outbound-voice',
      exceptionFnMap: _exceptionFns,
    );
    return StartOutboundVoiceContactResponse.fromJson(response);
  }

  /// Ends the specified contact.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ContactNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactId] :
  /// The ID of the contact.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  Future<void> stopContact({
    @_s.required String contactId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    _s.validateStringLength(
      'contactId',
      contactId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ContactId': contactId,
      'InstanceId': instanceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/contact/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopContactResponse.fromJson(response);
  }

  /// Adds the specified tags to the specified resource.
  ///
  /// The supported resource type is users.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// One or more tags. For example, { "tags": {"key1":"value1",
  /// "key2":"value2"} }.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified tags from the specified resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    var _query = '';
    _query = '?${[
      if (tagKeys != null) _s.toQueryParam('tagKeys', tagKeys),
    ].where((e) => e != null).join('&')}';
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates or updates the contact attributes associated with the specified
  /// contact.
  ///
  /// You can add or update attributes for both ongoing and completed contacts.
  /// For example, you can update the customer's name or the reason the customer
  /// called while the call is active, or add notes about steps that the agent
  /// took during the call that are displayed to the next agent that takes the
  /// call. You can also update attributes for a contact using data from your
  /// CRM application and save the data with the contact in Amazon Connect. You
  /// could also flag calls for additional analysis, such as legal review or
  /// identifying abusive callers.
  ///
  /// Contact attributes are available in Amazon Connect for 24 months, and are
  /// then deleted.
  ///
  /// <b>Important:</b> You cannot use the operation to update attributes for
  /// contacts that occurred prior to the release of the API, September 12,
  /// 2018. You can update attributes only for contacts that started after the
  /// release of the API. If you attempt to update attributes for a contact that
  /// occurred prior to the release of the API, a 400 error is returned. This
  /// applies also to queued callbacks that were initiated prior to the release
  /// of the API but are still active in your instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [attributes] :
  /// The Amazon Connect attributes. These attributes can be accessed in contact
  /// flows just like any other contact attributes.
  ///
  /// You can have up to 32,768 UTF-8 bytes across all attributes for a contact.
  /// Attribute keys can include only alphanumeric, dash, and underscore
  /// characters.
  ///
  /// Parameter [initialContactId] :
  /// The identifier of the contact. This is the identifier of the contact
  /// associated with the first interaction with the contact center.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  Future<void> updateContactAttributes({
    @_s.required Map<String, String> attributes,
    @_s.required String initialContactId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(attributes, 'attributes');
    ArgumentError.checkNotNull(initialContactId, 'initialContactId');
    _s.validateStringLength(
      'initialContactId',
      initialContactId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Attributes': attributes,
      'InitialContactId': initialContactId,
      'InstanceId': instanceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/contact/attributes',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateContactAttributesResponse.fromJson(response);
  }

  /// Assigns the specified hierarchy group to the specified user.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  ///
  /// Parameter [hierarchyGroupId] :
  /// The identifier of the hierarchy group.
  Future<void> updateUserHierarchy({
    @_s.required String instanceId,
    @_s.required String userId,
    String hierarchyGroupId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    final $payload = <String, dynamic>{
      'HierarchyGroupId': hierarchyGroupId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/users/${Uri.encodeComponent(instanceId.toString())}/${Uri.encodeComponent(userId.toString())}/hierarchy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the identity information for the specified user.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [identityInfo] :
  /// The identity information for the user.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  Future<void> updateUserIdentityInfo({
    @_s.required UserIdentityInfo identityInfo,
    @_s.required String instanceId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(identityInfo, 'identityInfo');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    final $payload = <String, dynamic>{
      'IdentityInfo': identityInfo,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/users/${Uri.encodeComponent(instanceId.toString())}/${Uri.encodeComponent(userId.toString())}/identity-info',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the phone configuration settings for the specified user.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [phoneConfig] :
  /// Information about phone configuration settings for the user.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  Future<void> updateUserPhoneConfig({
    @_s.required String instanceId,
    @_s.required UserPhoneConfig phoneConfig,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(phoneConfig, 'phoneConfig');
    ArgumentError.checkNotNull(userId, 'userId');
    final $payload = <String, dynamic>{
      'PhoneConfig': phoneConfig,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/users/${Uri.encodeComponent(instanceId.toString())}/${Uri.encodeComponent(userId.toString())}/phone-config',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns the specified routing profile to the specified user.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile for the user.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  Future<void> updateUserRoutingProfile({
    @_s.required String instanceId,
    @_s.required String routingProfileId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(routingProfileId, 'routingProfileId');
    ArgumentError.checkNotNull(userId, 'userId');
    final $payload = <String, dynamic>{
      'RoutingProfileId': routingProfileId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/users/${Uri.encodeComponent(instanceId.toString())}/${Uri.encodeComponent(userId.toString())}/routing-profile',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns the specified security profiles to the specified user.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [securityProfileIds] :
  /// The identifiers of the security profiles for the user.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  Future<void> updateUserSecurityProfiles({
    @_s.required String instanceId,
    @_s.required List<String> securityProfileIds,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(securityProfileIds, 'securityProfileIds');
    ArgumentError.checkNotNull(userId, 'userId');
    final $payload = <String, dynamic>{
      'SecurityProfileIds': securityProfileIds,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/users/${Uri.encodeComponent(instanceId.toString())}/${Uri.encodeComponent(userId.toString())}/security-profiles',
      exceptionFnMap: _exceptionFns,
    );
  }
}

enum Channel {
  @_s.JsonValue('VOICE')
  voice,
  @_s.JsonValue('CHAT')
  chat,
}

/// A chat message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ChatMessage {
  /// The content of the chat message.
  @_s.JsonKey(name: 'Content')
  final String content;

  /// The type of the content. Supported types are text/plain.
  @_s.JsonKey(name: 'ContentType')
  final String contentType;

  ChatMessage({
    @_s.required this.content,
    @_s.required this.contentType,
  });
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}

enum Comparison {
  @_s.JsonValue('LT')
  lt,
}

/// Contains summary information about a contact flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContactFlowSummary {
  /// The Amazon Resource Name (ARN) of the contact flow.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The type of contact flow.
  @_s.JsonKey(name: 'ContactFlowType')
  final ContactFlowType contactFlowType;

  /// The identifier of the contact flow.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the contact flow.
  @_s.JsonKey(name: 'Name')
  final String name;

  ContactFlowSummary({
    this.arn,
    this.contactFlowType,
    this.id,
    this.name,
  });
  factory ContactFlowSummary.fromJson(Map<String, dynamic> json) =>
      _$ContactFlowSummaryFromJson(json);
}

enum ContactFlowType {
  @_s.JsonValue('CONTACT_FLOW')
  contactFlow,
  @_s.JsonValue('CUSTOMER_QUEUE')
  customerQueue,
  @_s.JsonValue('CUSTOMER_HOLD')
  customerHold,
  @_s.JsonValue('CUSTOMER_WHISPER')
  customerWhisper,
  @_s.JsonValue('AGENT_HOLD')
  agentHold,
  @_s.JsonValue('AGENT_WHISPER')
  agentWhisper,
  @_s.JsonValue('OUTBOUND_WHISPER')
  outboundWhisper,
  @_s.JsonValue('AGENT_TRANSFER')
  agentTransfer,
  @_s.JsonValue('QUEUE_TRANSFER')
  queueTransfer,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserResponse {
  /// The Amazon Resource Name (ARN) of the user account.
  @_s.JsonKey(name: 'UserArn')
  final String userArn;

  /// The identifier of the user account.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  CreateUserResponse({
    this.userArn,
    this.userId,
  });
  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);
}

/// Contains credentials to use for federation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Credentials {
  /// An access token generated for a federated user to access Amazon Connect.
  @_s.JsonKey(name: 'AccessToken')
  final String accessToken;

  /// A token generated with an expiration time for the session a user is logged
  /// in to Amazon Connect.
  @_s.JsonKey(
      name: 'AccessTokenExpiration',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime accessTokenExpiration;

  /// Renews a token generated for a user to access the Amazon Connect instance.
  @_s.JsonKey(name: 'RefreshToken')
  final String refreshToken;

  /// Renews the expiration timer for a generated token.
  @_s.JsonKey(
      name: 'RefreshTokenExpiration',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime refreshTokenExpiration;

  Credentials({
    this.accessToken,
    this.accessTokenExpiration,
    this.refreshToken,
    this.refreshTokenExpiration,
  });
  factory Credentials.fromJson(Map<String, dynamic> json) =>
      _$CredentialsFromJson(json);
}

/// Contains information about a real-time metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CurrentMetric {
  /// The name of the metric.
  @_s.JsonKey(name: 'Name')
  final CurrentMetricName name;

  /// The unit for the metric.
  @_s.JsonKey(name: 'Unit')
  final Unit unit;

  CurrentMetric({
    this.name,
    this.unit,
  });
  factory CurrentMetric.fromJson(Map<String, dynamic> json) =>
      _$CurrentMetricFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentMetricToJson(this);
}

/// Contains the data for a real-time metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CurrentMetricData {
  /// Information about the metric.
  @_s.JsonKey(name: 'Metric')
  final CurrentMetric metric;

  /// The value of the metric.
  @_s.JsonKey(name: 'Value')
  final double value;

  CurrentMetricData({
    this.metric,
    this.value,
  });
  factory CurrentMetricData.fromJson(Map<String, dynamic> json) =>
      _$CurrentMetricDataFromJson(json);
}

/// The current metric names.
enum CurrentMetricName {
  @_s.JsonValue('AGENTS_ONLINE')
  agentsOnline,
  @_s.JsonValue('AGENTS_AVAILABLE')
  agentsAvailable,
  @_s.JsonValue('AGENTS_ON_CALL')
  agentsOnCall,
  @_s.JsonValue('AGENTS_NON_PRODUCTIVE')
  agentsNonProductive,
  @_s.JsonValue('AGENTS_AFTER_CONTACT_WORK')
  agentsAfterContactWork,
  @_s.JsonValue('AGENTS_ERROR')
  agentsError,
  @_s.JsonValue('AGENTS_STAFFED')
  agentsStaffed,
  @_s.JsonValue('CONTACTS_IN_QUEUE')
  contactsInQueue,
  @_s.JsonValue('OLDEST_CONTACT_AGE')
  oldestContactAge,
  @_s.JsonValue('CONTACTS_SCHEDULED')
  contactsScheduled,
  @_s.JsonValue('AGENTS_ON_CONTACT')
  agentsOnContact,
  @_s.JsonValue('SLOTS_ACTIVE')
  slotsActive,
  @_s.JsonValue('SLOTS_AVAILABLE')
  slotsAvailable,
}

/// Contains information about a set of real-time metrics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CurrentMetricResult {
  /// The set of metrics.
  @_s.JsonKey(name: 'Collections')
  final List<CurrentMetricData> collections;

  /// The dimensions for the metrics.
  @_s.JsonKey(name: 'Dimensions')
  final Dimensions dimensions;

  CurrentMetricResult({
    this.collections,
    this.dimensions,
  });
  factory CurrentMetricResult.fromJson(Map<String, dynamic> json) =>
      _$CurrentMetricResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserHierarchyGroupResponse {
  /// Information about the hierarchy group.
  @_s.JsonKey(name: 'HierarchyGroup')
  final HierarchyGroup hierarchyGroup;

  DescribeUserHierarchyGroupResponse({
    this.hierarchyGroup,
  });
  factory DescribeUserHierarchyGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeUserHierarchyGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserHierarchyStructureResponse {
  /// Information about the hierarchy structure.
  @_s.JsonKey(name: 'HierarchyStructure')
  final HierarchyStructure hierarchyStructure;

  DescribeUserHierarchyStructureResponse({
    this.hierarchyStructure,
  });
  factory DescribeUserHierarchyStructureResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeUserHierarchyStructureResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserResponse {
  /// Information about the user account and configuration settings.
  @_s.JsonKey(name: 'User')
  final User user;

  DescribeUserResponse({
    this.user,
  });
  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeUserResponseFromJson(json);
}

/// Contains information about the dimensions for a set of metrics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Dimensions {
  /// The channel used for grouping and filters.
  @_s.JsonKey(name: 'Channel')
  final Channel channel;

  /// Information about the queue for which metrics are returned.
  @_s.JsonKey(name: 'Queue')
  final QueueReference queue;

  Dimensions({
    this.channel,
    this.queue,
  });
  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);
}

/// Contains the filter to apply when retrieving metrics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filters {
  /// The channel to use to filter the metrics.
  @_s.JsonKey(name: 'Channels')
  final List<String> channels;

  /// The queues to use to filter the metrics. You can specify up to 100 queues
  /// per request.
  @_s.JsonKey(name: 'Queues')
  final List<String> queues;

  Filters({
    this.channels,
    this.queues,
  });
  Map<String, dynamic> toJson() => _$FiltersToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContactAttributesResponse {
  /// Information about the attributes.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  GetContactAttributesResponse({
    this.attributes,
  });
  factory GetContactAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetContactAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCurrentMetricDataResponse {
  /// The time at which the metrics were retrieved and cached for pagination.
  @_s.JsonKey(
      name: 'DataSnapshotTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime dataSnapshotTime;

  /// Information about the real-time metrics.
  @_s.JsonKey(name: 'MetricResults')
  final List<CurrentMetricResult> metricResults;

  /// If there are additional results, this is the token for the next set of
  /// results.
  ///
  /// The token expires after 5 minutes from the time it is created. Subsequent
  /// requests that use the token must use the same request parameters as the
  /// request that generated the token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetCurrentMetricDataResponse({
    this.dataSnapshotTime,
    this.metricResults,
    this.nextToken,
  });
  factory GetCurrentMetricDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentMetricDataResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFederationTokenResponse {
  /// The credentials to use for federation.
  @_s.JsonKey(name: 'Credentials')
  final Credentials credentials;

  GetFederationTokenResponse({
    this.credentials,
  });
  factory GetFederationTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFederationTokenResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMetricDataResponse {
  /// Information about the historical metrics.
  ///
  /// If no grouping is specified, a summary of metric data is returned.
  @_s.JsonKey(name: 'MetricResults')
  final List<HistoricalMetricResult> metricResults;

  /// If there are additional results, this is the token for the next set of
  /// results.
  ///
  /// The token expires after 5 minutes from the time it is created. Subsequent
  /// requests that use the token must use the same request parameters as the
  /// request that generated the token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetMetricDataResponse({
    this.metricResults,
    this.nextToken,
  });
  factory GetMetricDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMetricDataResponseFromJson(json);
}

enum Grouping {
  @_s.JsonValue('QUEUE')
  queue,
  @_s.JsonValue('CHANNEL')
  channel,
}

/// Contains information about a hierarchy group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HierarchyGroup {
  /// The Amazon Resource Name (ARN) of the hierarchy group.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Information about the levels in the hierarchy group.
  @_s.JsonKey(name: 'HierarchyPath')
  final HierarchyPath hierarchyPath;

  /// The identifier of the hierarchy group.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The identifier of the level in the hierarchy group.
  @_s.JsonKey(name: 'LevelId')
  final String levelId;

  /// The name of the hierarchy group.
  @_s.JsonKey(name: 'Name')
  final String name;

  HierarchyGroup({
    this.arn,
    this.hierarchyPath,
    this.id,
    this.levelId,
    this.name,
  });
  factory HierarchyGroup.fromJson(Map<String, dynamic> json) =>
      _$HierarchyGroupFromJson(json);
}

/// Contains summary information about a hierarchy group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HierarchyGroupSummary {
  /// The Amazon Resource Name (ARN) of the hierarchy group.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the hierarchy group.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the hierarchy group.
  @_s.JsonKey(name: 'Name')
  final String name;

  HierarchyGroupSummary({
    this.arn,
    this.id,
    this.name,
  });
  factory HierarchyGroupSummary.fromJson(Map<String, dynamic> json) =>
      _$HierarchyGroupSummaryFromJson(json);
}

/// Contains information about a hierarchy level.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HierarchyLevel {
  /// The Amazon Resource Name (ARN) of the hierarchy level.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the hierarchy level.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the hierarchy level.
  @_s.JsonKey(name: 'Name')
  final String name;

  HierarchyLevel({
    this.arn,
    this.id,
    this.name,
  });
  factory HierarchyLevel.fromJson(Map<String, dynamic> json) =>
      _$HierarchyLevelFromJson(json);
}

/// Contains information about the levels of a hierarchy group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HierarchyPath {
  /// Information about level five.
  @_s.JsonKey(name: 'LevelFive')
  final HierarchyGroupSummary levelFive;

  /// Information about level four.
  @_s.JsonKey(name: 'LevelFour')
  final HierarchyGroupSummary levelFour;

  /// Information about level one.
  @_s.JsonKey(name: 'LevelOne')
  final HierarchyGroupSummary levelOne;

  /// Information about level three.
  @_s.JsonKey(name: 'LevelThree')
  final HierarchyGroupSummary levelThree;

  /// Information about level two.
  @_s.JsonKey(name: 'LevelTwo')
  final HierarchyGroupSummary levelTwo;

  HierarchyPath({
    this.levelFive,
    this.levelFour,
    this.levelOne,
    this.levelThree,
    this.levelTwo,
  });
  factory HierarchyPath.fromJson(Map<String, dynamic> json) =>
      _$HierarchyPathFromJson(json);
}

/// Contains information about a hierarchy structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HierarchyStructure {
  /// Information about level five.
  @_s.JsonKey(name: 'LevelFive')
  final HierarchyLevel levelFive;

  /// Information about level four.
  @_s.JsonKey(name: 'LevelFour')
  final HierarchyLevel levelFour;

  /// Information about level one.
  @_s.JsonKey(name: 'LevelOne')
  final HierarchyLevel levelOne;

  /// Information about level three.
  @_s.JsonKey(name: 'LevelThree')
  final HierarchyLevel levelThree;

  /// Information about level two.
  @_s.JsonKey(name: 'LevelTwo')
  final HierarchyLevel levelTwo;

  HierarchyStructure({
    this.levelFive,
    this.levelFour,
    this.levelOne,
    this.levelThree,
    this.levelTwo,
  });
  factory HierarchyStructure.fromJson(Map<String, dynamic> json) =>
      _$HierarchyStructureFromJson(json);
}

/// Contains information about a historical metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HistoricalMetric {
  /// The name of the metric.
  @_s.JsonKey(name: 'Name')
  final HistoricalMetricName name;

  /// The statistic for the metric.
  @_s.JsonKey(name: 'Statistic')
  final Statistic statistic;

  /// The threshold for the metric, used with service level metrics.
  @_s.JsonKey(name: 'Threshold')
  final Threshold threshold;

  /// The unit for the metric.
  @_s.JsonKey(name: 'Unit')
  final Unit unit;

  HistoricalMetric({
    this.name,
    this.statistic,
    this.threshold,
    this.unit,
  });
  factory HistoricalMetric.fromJson(Map<String, dynamic> json) =>
      _$HistoricalMetricFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricalMetricToJson(this);
}

/// Contains the data for a historical metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HistoricalMetricData {
  /// Information about the metric.
  @_s.JsonKey(name: 'Metric')
  final HistoricalMetric metric;

  /// The value of the metric.
  @_s.JsonKey(name: 'Value')
  final double value;

  HistoricalMetricData({
    this.metric,
    this.value,
  });
  factory HistoricalMetricData.fromJson(Map<String, dynamic> json) =>
      _$HistoricalMetricDataFromJson(json);
}

/// The historical metric names.
enum HistoricalMetricName {
  @_s.JsonValue('CONTACTS_QUEUED')
  contactsQueued,
  @_s.JsonValue('CONTACTS_HANDLED')
  contactsHandled,
  @_s.JsonValue('CONTACTS_ABANDONED')
  contactsAbandoned,
  @_s.JsonValue('CONTACTS_CONSULTED')
  contactsConsulted,
  @_s.JsonValue('CONTACTS_AGENT_HUNG_UP_FIRST')
  contactsAgentHungUpFirst,
  @_s.JsonValue('CONTACTS_HANDLED_INCOMING')
  contactsHandledIncoming,
  @_s.JsonValue('CONTACTS_HANDLED_OUTBOUND')
  contactsHandledOutbound,
  @_s.JsonValue('CONTACTS_HOLD_ABANDONS')
  contactsHoldAbandons,
  @_s.JsonValue('CONTACTS_TRANSFERRED_IN')
  contactsTransferredIn,
  @_s.JsonValue('CONTACTS_TRANSFERRED_OUT')
  contactsTransferredOut,
  @_s.JsonValue('CONTACTS_TRANSFERRED_IN_FROM_QUEUE')
  contactsTransferredInFromQueue,
  @_s.JsonValue('CONTACTS_TRANSFERRED_OUT_FROM_QUEUE')
  contactsTransferredOutFromQueue,
  @_s.JsonValue('CONTACTS_MISSED')
  contactsMissed,
  @_s.JsonValue('CALLBACK_CONTACTS_HANDLED')
  callbackContactsHandled,
  @_s.JsonValue('API_CONTACTS_HANDLED')
  apiContactsHandled,
  @_s.JsonValue('OCCUPANCY')
  occupancy,
  @_s.JsonValue('HANDLE_TIME')
  handleTime,
  @_s.JsonValue('AFTER_CONTACT_WORK_TIME')
  afterContactWorkTime,
  @_s.JsonValue('QUEUED_TIME')
  queuedTime,
  @_s.JsonValue('ABANDON_TIME')
  abandonTime,
  @_s.JsonValue('QUEUE_ANSWER_TIME')
  queueAnswerTime,
  @_s.JsonValue('HOLD_TIME')
  holdTime,
  @_s.JsonValue('INTERACTION_TIME')
  interactionTime,
  @_s.JsonValue('INTERACTION_AND_HOLD_TIME')
  interactionAndHoldTime,
  @_s.JsonValue('SERVICE_LEVEL')
  serviceLevel,
}

/// Contains information about the historical metrics retrieved.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HistoricalMetricResult {
  /// The set of metrics.
  @_s.JsonKey(name: 'Collections')
  final List<HistoricalMetricData> collections;

  /// The dimension for the metrics.
  @_s.JsonKey(name: 'Dimensions')
  final Dimensions dimensions;

  HistoricalMetricResult({
    this.collections,
    this.dimensions,
  });
  factory HistoricalMetricResult.fromJson(Map<String, dynamic> json) =>
      _$HistoricalMetricResultFromJson(json);
}

/// Contains summary information about hours of operation for a contact center.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HoursOfOperationSummary {
  /// The Amazon Resource Name (ARN) of the hours of operation.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the hours of operation.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the hours of operation.
  @_s.JsonKey(name: 'Name')
  final String name;

  HoursOfOperationSummary({
    this.arn,
    this.id,
    this.name,
  });
  factory HoursOfOperationSummary.fromJson(Map<String, dynamic> json) =>
      _$HoursOfOperationSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListContactFlowsResponse {
  /// Information about the contact flows.
  @_s.JsonKey(name: 'ContactFlowSummaryList')
  final List<ContactFlowSummary> contactFlowSummaryList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListContactFlowsResponse({
    this.contactFlowSummaryList,
    this.nextToken,
  });
  factory ListContactFlowsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListContactFlowsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListHoursOfOperationsResponse {
  /// Information about the hours of operation.
  @_s.JsonKey(name: 'HoursOfOperationSummaryList')
  final List<HoursOfOperationSummary> hoursOfOperationSummaryList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListHoursOfOperationsResponse({
    this.hoursOfOperationSummaryList,
    this.nextToken,
  });
  factory ListHoursOfOperationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListHoursOfOperationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPhoneNumbersResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the phone numbers.
  @_s.JsonKey(name: 'PhoneNumberSummaryList')
  final List<PhoneNumberSummary> phoneNumberSummaryList;

  ListPhoneNumbersResponse({
    this.nextToken,
    this.phoneNumberSummaryList,
  });
  factory ListPhoneNumbersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPhoneNumbersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListQueuesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the queues.
  @_s.JsonKey(name: 'QueueSummaryList')
  final List<QueueSummary> queueSummaryList;

  ListQueuesResponse({
    this.nextToken,
    this.queueSummaryList,
  });
  factory ListQueuesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListQueuesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRoutingProfilesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the routing profiles.
  @_s.JsonKey(name: 'RoutingProfileSummaryList')
  final List<RoutingProfileSummary> routingProfileSummaryList;

  ListRoutingProfilesResponse({
    this.nextToken,
    this.routingProfileSummaryList,
  });
  factory ListRoutingProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRoutingProfilesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSecurityProfilesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the security profiles.
  @_s.JsonKey(name: 'SecurityProfileSummaryList')
  final List<SecurityProfileSummary> securityProfileSummaryList;

  ListSecurityProfilesResponse({
    this.nextToken,
    this.securityProfileSummaryList,
  });
  factory ListSecurityProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSecurityProfilesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// Information about the tags.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUserHierarchyGroupsResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the hierarchy groups.
  @_s.JsonKey(name: 'UserHierarchyGroupSummaryList')
  final List<HierarchyGroupSummary> userHierarchyGroupSummaryList;

  ListUserHierarchyGroupsResponse({
    this.nextToken,
    this.userHierarchyGroupSummaryList,
  });
  factory ListUserHierarchyGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUserHierarchyGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUsersResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the users.
  @_s.JsonKey(name: 'UserSummaryList')
  final List<UserSummary> userSummaryList;

  ListUsersResponse({
    this.nextToken,
    this.userSummaryList,
  });
  factory ListUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUsersResponseFromJson(json);
}

/// The customer's details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ParticipantDetails {
  /// Display name of the participant.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  ParticipantDetails({
    @_s.required this.displayName,
  });
  Map<String, dynamic> toJson() => _$ParticipantDetailsToJson(this);
}

enum PhoneNumberCountryCode {
  @_s.JsonValue('AF')
  af,
  @_s.JsonValue('AL')
  al,
  @_s.JsonValue('DZ')
  dz,
  @_s.JsonValue('AS')
  as,
  @_s.JsonValue('AD')
  ad,
  @_s.JsonValue('AO')
  ao,
  @_s.JsonValue('AI')
  ai,
  @_s.JsonValue('AQ')
  aq,
  @_s.JsonValue('AG')
  ag,
  @_s.JsonValue('AR')
  ar,
  @_s.JsonValue('AM')
  am,
  @_s.JsonValue('AW')
  aw,
  @_s.JsonValue('AU')
  au,
  @_s.JsonValue('AT')
  at,
  @_s.JsonValue('AZ')
  az,
  @_s.JsonValue('BS')
  bs,
  @_s.JsonValue('BH')
  bh,
  @_s.JsonValue('BD')
  bd,
  @_s.JsonValue('BB')
  bb,
  @_s.JsonValue('BY')
  by,
  @_s.JsonValue('BE')
  be,
  @_s.JsonValue('BZ')
  bz,
  @_s.JsonValue('BJ')
  bj,
  @_s.JsonValue('BM')
  bm,
  @_s.JsonValue('BT')
  bt,
  @_s.JsonValue('BO')
  bo,
  @_s.JsonValue('BA')
  ba,
  @_s.JsonValue('BW')
  bw,
  @_s.JsonValue('BR')
  br,
  @_s.JsonValue('IO')
  io,
  @_s.JsonValue('VG')
  vg,
  @_s.JsonValue('BN')
  bn,
  @_s.JsonValue('BG')
  bg,
  @_s.JsonValue('BF')
  bf,
  @_s.JsonValue('BI')
  bi,
  @_s.JsonValue('KH')
  kh,
  @_s.JsonValue('CM')
  cm,
  @_s.JsonValue('CA')
  ca,
  @_s.JsonValue('CV')
  cv,
  @_s.JsonValue('KY')
  ky,
  @_s.JsonValue('CF')
  cf,
  @_s.JsonValue('TD')
  td,
  @_s.JsonValue('CL')
  cl,
  @_s.JsonValue('CN')
  cn,
  @_s.JsonValue('CX')
  cx,
  @_s.JsonValue('CC')
  cc,
  @_s.JsonValue('CO')
  co,
  @_s.JsonValue('KM')
  km,
  @_s.JsonValue('CK')
  ck,
  @_s.JsonValue('CR')
  cr,
  @_s.JsonValue('HR')
  hr,
  @_s.JsonValue('CU')
  cu,
  @_s.JsonValue('CW')
  cw,
  @_s.JsonValue('CY')
  cy,
  @_s.JsonValue('CZ')
  cz,
  @_s.JsonValue('CD')
  cd,
  @_s.JsonValue('DK')
  dk,
  @_s.JsonValue('DJ')
  dj,
  @_s.JsonValue('DM')
  dm,
  @_s.JsonValue('DO')
  $do,
  @_s.JsonValue('TL')
  tl,
  @_s.JsonValue('EC')
  ec,
  @_s.JsonValue('EG')
  eg,
  @_s.JsonValue('SV')
  sv,
  @_s.JsonValue('GQ')
  gq,
  @_s.JsonValue('ER')
  er,
  @_s.JsonValue('EE')
  ee,
  @_s.JsonValue('ET')
  et,
  @_s.JsonValue('FK')
  fk,
  @_s.JsonValue('FO')
  fo,
  @_s.JsonValue('FJ')
  fj,
  @_s.JsonValue('FI')
  fi,
  @_s.JsonValue('FR')
  fr,
  @_s.JsonValue('PF')
  pf,
  @_s.JsonValue('GA')
  ga,
  @_s.JsonValue('GM')
  gm,
  @_s.JsonValue('GE')
  ge,
  @_s.JsonValue('DE')
  de,
  @_s.JsonValue('GH')
  gh,
  @_s.JsonValue('GI')
  gi,
  @_s.JsonValue('GR')
  gr,
  @_s.JsonValue('GL')
  gl,
  @_s.JsonValue('GD')
  gd,
  @_s.JsonValue('GU')
  gu,
  @_s.JsonValue('GT')
  gt,
  @_s.JsonValue('GG')
  gg,
  @_s.JsonValue('GN')
  gn,
  @_s.JsonValue('GW')
  gw,
  @_s.JsonValue('GY')
  gy,
  @_s.JsonValue('HT')
  ht,
  @_s.JsonValue('HN')
  hn,
  @_s.JsonValue('HK')
  hk,
  @_s.JsonValue('HU')
  hu,
  @_s.JsonValue('IS')
  $is,
  @_s.JsonValue('IN')
  $in,
  @_s.JsonValue('ID')
  id,
  @_s.JsonValue('IR')
  ir,
  @_s.JsonValue('IQ')
  iq,
  @_s.JsonValue('IE')
  ie,
  @_s.JsonValue('IM')
  im,
  @_s.JsonValue('IL')
  il,
  @_s.JsonValue('IT')
  it,
  @_s.JsonValue('CI')
  ci,
  @_s.JsonValue('JM')
  jm,
  @_s.JsonValue('JP')
  jp,
  @_s.JsonValue('JE')
  je,
  @_s.JsonValue('JO')
  jo,
  @_s.JsonValue('KZ')
  kz,
  @_s.JsonValue('KE')
  ke,
  @_s.JsonValue('KI')
  ki,
  @_s.JsonValue('KW')
  kw,
  @_s.JsonValue('KG')
  kg,
  @_s.JsonValue('LA')
  la,
  @_s.JsonValue('LV')
  lv,
  @_s.JsonValue('LB')
  lb,
  @_s.JsonValue('LS')
  ls,
  @_s.JsonValue('LR')
  lr,
  @_s.JsonValue('LY')
  ly,
  @_s.JsonValue('LI')
  li,
  @_s.JsonValue('LT')
  lt,
  @_s.JsonValue('LU')
  lu,
  @_s.JsonValue('MO')
  mo,
  @_s.JsonValue('MK')
  mk,
  @_s.JsonValue('MG')
  mg,
  @_s.JsonValue('MW')
  mw,
  @_s.JsonValue('MY')
  my,
  @_s.JsonValue('MV')
  mv,
  @_s.JsonValue('ML')
  ml,
  @_s.JsonValue('MT')
  mt,
  @_s.JsonValue('MH')
  mh,
  @_s.JsonValue('MR')
  mr,
  @_s.JsonValue('MU')
  mu,
  @_s.JsonValue('YT')
  yt,
  @_s.JsonValue('MX')
  mx,
  @_s.JsonValue('FM')
  fm,
  @_s.JsonValue('MD')
  md,
  @_s.JsonValue('MC')
  mc,
  @_s.JsonValue('MN')
  mn,
  @_s.JsonValue('ME')
  me,
  @_s.JsonValue('MS')
  ms,
  @_s.JsonValue('MA')
  ma,
  @_s.JsonValue('MZ')
  mz,
  @_s.JsonValue('MM')
  mm,
  @_s.JsonValue('NA')
  na,
  @_s.JsonValue('NR')
  nr,
  @_s.JsonValue('NP')
  np,
  @_s.JsonValue('NL')
  nl,
  @_s.JsonValue('AN')
  an,
  @_s.JsonValue('NC')
  nc,
  @_s.JsonValue('NZ')
  nz,
  @_s.JsonValue('NI')
  ni,
  @_s.JsonValue('NE')
  ne,
  @_s.JsonValue('NG')
  ng,
  @_s.JsonValue('NU')
  nu,
  @_s.JsonValue('KP')
  kp,
  @_s.JsonValue('MP')
  mp,
  @_s.JsonValue('NO')
  no,
  @_s.JsonValue('OM')
  om,
  @_s.JsonValue('PK')
  pk,
  @_s.JsonValue('PW')
  pw,
  @_s.JsonValue('PA')
  pa,
  @_s.JsonValue('PG')
  pg,
  @_s.JsonValue('PY')
  py,
  @_s.JsonValue('PE')
  pe,
  @_s.JsonValue('PH')
  ph,
  @_s.JsonValue('PN')
  pn,
  @_s.JsonValue('PL')
  pl,
  @_s.JsonValue('PT')
  pt,
  @_s.JsonValue('PR')
  pr,
  @_s.JsonValue('QA')
  qa,
  @_s.JsonValue('CG')
  cg,
  @_s.JsonValue('RE')
  re,
  @_s.JsonValue('RO')
  ro,
  @_s.JsonValue('RU')
  ru,
  @_s.JsonValue('RW')
  rw,
  @_s.JsonValue('BL')
  bl,
  @_s.JsonValue('SH')
  sh,
  @_s.JsonValue('KN')
  kn,
  @_s.JsonValue('LC')
  lc,
  @_s.JsonValue('MF')
  mf,
  @_s.JsonValue('PM')
  pm,
  @_s.JsonValue('VC')
  vc,
  @_s.JsonValue('WS')
  ws,
  @_s.JsonValue('SM')
  sm,
  @_s.JsonValue('ST')
  st,
  @_s.JsonValue('SA')
  sa,
  @_s.JsonValue('SN')
  sn,
  @_s.JsonValue('RS')
  rs,
  @_s.JsonValue('SC')
  sc,
  @_s.JsonValue('SL')
  sl,
  @_s.JsonValue('SG')
  sg,
  @_s.JsonValue('SX')
  sx,
  @_s.JsonValue('SK')
  sk,
  @_s.JsonValue('SI')
  si,
  @_s.JsonValue('SB')
  sb,
  @_s.JsonValue('SO')
  so,
  @_s.JsonValue('ZA')
  za,
  @_s.JsonValue('KR')
  kr,
  @_s.JsonValue('ES')
  es,
  @_s.JsonValue('LK')
  lk,
  @_s.JsonValue('SD')
  sd,
  @_s.JsonValue('SR')
  sr,
  @_s.JsonValue('SJ')
  sj,
  @_s.JsonValue('SZ')
  sz,
  @_s.JsonValue('SE')
  se,
  @_s.JsonValue('CH')
  ch,
  @_s.JsonValue('SY')
  sy,
  @_s.JsonValue('TW')
  tw,
  @_s.JsonValue('TJ')
  tj,
  @_s.JsonValue('TZ')
  tz,
  @_s.JsonValue('TH')
  th,
  @_s.JsonValue('TG')
  tg,
  @_s.JsonValue('TK')
  tk,
  @_s.JsonValue('TO')
  to,
  @_s.JsonValue('TT')
  tt,
  @_s.JsonValue('TN')
  tn,
  @_s.JsonValue('TR')
  tr,
  @_s.JsonValue('TM')
  tm,
  @_s.JsonValue('TC')
  tc,
  @_s.JsonValue('TV')
  tv,
  @_s.JsonValue('VI')
  vi,
  @_s.JsonValue('UG')
  ug,
  @_s.JsonValue('UA')
  ua,
  @_s.JsonValue('AE')
  ae,
  @_s.JsonValue('GB')
  gb,
  @_s.JsonValue('US')
  us,
  @_s.JsonValue('UY')
  uy,
  @_s.JsonValue('UZ')
  uz,
  @_s.JsonValue('VU')
  vu,
  @_s.JsonValue('VA')
  va,
  @_s.JsonValue('VE')
  ve,
  @_s.JsonValue('VN')
  vn,
  @_s.JsonValue('WF')
  wf,
  @_s.JsonValue('EH')
  eh,
  @_s.JsonValue('YE')
  ye,
  @_s.JsonValue('ZM')
  zm,
  @_s.JsonValue('ZW')
  zw,
}

/// Contains summary information about a phone number for a contact center.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PhoneNumberSummary {
  /// The Amazon Resource Name (ARN) of the phone number.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the phone number.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The phone number.
  @_s.JsonKey(name: 'PhoneNumber')
  final String phoneNumber;

  /// The ISO country code.
  @_s.JsonKey(name: 'PhoneNumberCountryCode')
  final PhoneNumberCountryCode phoneNumberCountryCode;

  /// The type of phone number.
  @_s.JsonKey(name: 'PhoneNumberType')
  final PhoneNumberType phoneNumberType;

  PhoneNumberSummary({
    this.arn,
    this.id,
    this.phoneNumber,
    this.phoneNumberCountryCode,
    this.phoneNumberType,
  });
  factory PhoneNumberSummary.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberSummaryFromJson(json);
}

enum PhoneNumberType {
  @_s.JsonValue('TOLL_FREE')
  tollFree,
  @_s.JsonValue('DID')
  did,
}

enum PhoneType {
  @_s.JsonValue('SOFT_PHONE')
  softPhone,
  @_s.JsonValue('DESK_PHONE')
  deskPhone,
}

/// Contains information about a queue resource for which metrics are returned.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueueReference {
  /// The Amazon Resource Name (ARN) of the queue.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the queue.
  @_s.JsonKey(name: 'Id')
  final String id;

  QueueReference({
    this.arn,
    this.id,
  });
  factory QueueReference.fromJson(Map<String, dynamic> json) =>
      _$QueueReferenceFromJson(json);
}

/// Contains summary information about a queue.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueueSummary {
  /// The Amazon Resource Name (ARN) of the queue.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the queue.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the queue.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of queue.
  @_s.JsonKey(name: 'QueueType')
  final QueueType queueType;

  QueueSummary({
    this.arn,
    this.id,
    this.name,
    this.queueType,
  });
  factory QueueSummary.fromJson(Map<String, dynamic> json) =>
      _$QueueSummaryFromJson(json);
}

enum QueueType {
  @_s.JsonValue('STANDARD')
  standard,
  @_s.JsonValue('AGENT')
  agent,
}

/// Contains summary information about a routing profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RoutingProfileSummary {
  /// The Amazon Resource Name (ARN) of the routing profile.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the routing profile.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the routing profile.
  @_s.JsonKey(name: 'Name')
  final String name;

  RoutingProfileSummary({
    this.arn,
    this.id,
    this.name,
  });
  factory RoutingProfileSummary.fromJson(Map<String, dynamic> json) =>
      _$RoutingProfileSummaryFromJson(json);
}

/// Contains information about a security profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecurityProfileSummary {
  /// The Amazon Resource Name (ARN) of the security profile.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the security profile.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the security profile.
  @_s.JsonKey(name: 'Name')
  final String name;

  SecurityProfileSummary({
    this.arn,
    this.id,
    this.name,
  });
  factory SecurityProfileSummary.fromJson(Map<String, dynamic> json) =>
      _$SecurityProfileSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartChatContactResponse {
  /// The identifier of this contact within the Amazon Connect instance.
  @_s.JsonKey(name: 'ContactId')
  final String contactId;

  /// The identifier for a chat participant. The participantId for a chat
  /// participant is the same throughout the chat lifecycle.
  @_s.JsonKey(name: 'ParticipantId')
  final String participantId;

  /// The token used by the chat participant to call <a
  /// href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a>.
  /// The participant token is valid for the lifetime of a chat participant.
  @_s.JsonKey(name: 'ParticipantToken')
  final String participantToken;

  StartChatContactResponse({
    this.contactId,
    this.participantId,
    this.participantToken,
  });
  factory StartChatContactResponse.fromJson(Map<String, dynamic> json) =>
      _$StartChatContactResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartOutboundVoiceContactResponse {
  /// The identifier of this contact within the Amazon Connect instance.
  @_s.JsonKey(name: 'ContactId')
  final String contactId;

  StartOutboundVoiceContactResponse({
    this.contactId,
  });
  factory StartOutboundVoiceContactResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartOutboundVoiceContactResponseFromJson(json);
}

enum Statistic {
  @_s.JsonValue('SUM')
  sum,
  @_s.JsonValue('MAX')
  max,
  @_s.JsonValue('AVG')
  avg,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopContactResponse {
  StopContactResponse();
  factory StopContactResponse.fromJson(Map<String, dynamic> json) =>
      _$StopContactResponseFromJson(json);
}

/// Contains information about the threshold for service level metrics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Threshold {
  /// The type of comparison. Only "less than" (LT) comparisons are supported.
  @_s.JsonKey(name: 'Comparison')
  final Comparison comparison;

  /// The threshold value to compare.
  @_s.JsonKey(name: 'ThresholdValue')
  final double thresholdValue;

  Threshold({
    this.comparison,
    this.thresholdValue,
  });
  factory Threshold.fromJson(Map<String, dynamic> json) =>
      _$ThresholdFromJson(json);

  Map<String, dynamic> toJson() => _$ThresholdToJson(this);
}

enum Unit {
  @_s.JsonValue('SECONDS')
  seconds,
  @_s.JsonValue('COUNT')
  count,
  @_s.JsonValue('PERCENT')
  percent,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateContactAttributesResponse {
  UpdateContactAttributesResponse();
  factory UpdateContactAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateContactAttributesResponseFromJson(json);
}

/// Contains information about a user account for a Amazon Connect instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class User {
  /// The Amazon Resource Name (ARN) of the user account.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the user account in the directory used for identity
  /// management.
  @_s.JsonKey(name: 'DirectoryUserId')
  final String directoryUserId;

  /// The identifier of the hierarchy group for the user.
  @_s.JsonKey(name: 'HierarchyGroupId')
  final String hierarchyGroupId;

  /// The identifier of the user account.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Information about the user identity.
  @_s.JsonKey(name: 'IdentityInfo')
  final UserIdentityInfo identityInfo;

  /// Information about the phone configuration for the user.
  @_s.JsonKey(name: 'PhoneConfig')
  final UserPhoneConfig phoneConfig;

  /// The identifier of the routing profile for the user.
  @_s.JsonKey(name: 'RoutingProfileId')
  final String routingProfileId;

  /// The identifiers of the security profiles for the user.
  @_s.JsonKey(name: 'SecurityProfileIds')
  final List<String> securityProfileIds;

  /// The tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// The user name assigned to the user account.
  @_s.JsonKey(name: 'Username')
  final String username;

  User({
    this.arn,
    this.directoryUserId,
    this.hierarchyGroupId,
    this.id,
    this.identityInfo,
    this.phoneConfig,
    this.routingProfileId,
    this.securityProfileIds,
    this.tags,
    this.username,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

/// Contains information about the identity of a user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserIdentityInfo {
  /// The email address. If you are using SAML for identity management and include
  /// this parameter, an error is returned.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// The first name. This is required if you are using Amazon Connect or SAML for
  /// identity management.
  @_s.JsonKey(name: 'FirstName')
  final String firstName;

  /// The last name. This is required if you are using Amazon Connect or SAML for
  /// identity management.
  @_s.JsonKey(name: 'LastName')
  final String lastName;

  UserIdentityInfo({
    this.email,
    this.firstName,
    this.lastName,
  });
  factory UserIdentityInfo.fromJson(Map<String, dynamic> json) =>
      _$UserIdentityInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdentityInfoToJson(this);
}

/// Contains information about the phone configuration settings for a user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserPhoneConfig {
  /// The phone type.
  @_s.JsonKey(name: 'PhoneType')
  final PhoneType phoneType;

  /// The After Call Work (ACW) timeout setting, in seconds.
  @_s.JsonKey(name: 'AfterContactWorkTimeLimit')
  final int afterContactWorkTimeLimit;

  /// The Auto accept setting.
  @_s.JsonKey(name: 'AutoAccept')
  final bool autoAccept;

  /// The phone number for the user's desk phone.
  @_s.JsonKey(name: 'DeskPhoneNumber')
  final String deskPhoneNumber;

  UserPhoneConfig({
    @_s.required this.phoneType,
    this.afterContactWorkTimeLimit,
    this.autoAccept,
    this.deskPhoneNumber,
  });
  factory UserPhoneConfig.fromJson(Map<String, dynamic> json) =>
      _$UserPhoneConfigFromJson(json);

  Map<String, dynamic> toJson() => _$UserPhoneConfigToJson(this);
}

/// Contains summary information about a user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserSummary {
  /// The Amazon Resource Name (ARN) of the user account.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the user account.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The Amazon Connect user name of the user account.
  @_s.JsonKey(name: 'Username')
  final String username;

  UserSummary({
    this.arn,
    this.id,
    this.username,
  });
  factory UserSummary.fromJson(Map<String, dynamic> json) =>
      _$UserSummaryFromJson(json);
}

class ContactNotFoundException extends _s.GenericAwsException {
  ContactNotFoundException({String type, String message})
      : super(type: type, code: 'ContactNotFoundException', message: message);
}

class DestinationNotAllowedException extends _s.GenericAwsException {
  DestinationNotAllowedException({String type, String message})
      : super(
            type: type,
            code: 'DestinationNotAllowedException',
            message: message);
}

class DuplicateResourceException extends _s.GenericAwsException {
  DuplicateResourceException({String type, String message})
      : super(type: type, code: 'DuplicateResourceException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String type, String message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class OutboundContactNotPermittedException extends _s.GenericAwsException {
  OutboundContactNotPermittedException({String type, String message})
      : super(
            type: type,
            code: 'OutboundContactNotPermittedException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UserNotFoundException extends _s.GenericAwsException {
  UserNotFoundException({String type, String message})
      : super(type: type, code: 'UserNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ContactNotFoundException': (type, message) =>
      ContactNotFoundException(type: type, message: message),
  'DestinationNotAllowedException': (type, message) =>
      DestinationNotAllowedException(type: type, message: message),
  'DuplicateResourceException': (type, message) =>
      DuplicateResourceException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'OutboundContactNotPermittedException': (type, message) =>
      OutboundContactNotPermittedException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UserNotFoundException': (type, message) =>
      UserNotFoundException(type: type, message: message),
};
