// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2023_04_19.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Network Flow Monitor is a feature of Amazon CloudWatch Network Monitoring
/// that provides visibility into the performance of network flows for your
/// Amazon Web Services workloads, between instances in subnets, as well as to
/// and from Amazon Web Services. Lightweight agents that you install on the
/// instances capture performance metrics for your network flows, such as packet
/// loss and latency, and send them to the Network Flow Monitor backend. Then,
/// you can view and analyze metrics from the top contributors for each metric
/// type, to help troubleshoot issues.
///
/// In addition, when you create a monitor, Network Flow Monitor provides a
/// network health indicator (NHI) that informs you whether there were Amazon
/// Web Services network issues for one or more of the network flows tracked by
/// a monitor, during a time period that you choose. By using this value, you
/// can independently determine if the Amazon Web Services network is impacting
/// your workload during a specific time frame, to help you focus
/// troubleshooting efforts.
///
/// To learn more about Network Flow Monitor, see the <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-NetworkFlowMonitor.html">Network
/// Flow Monitor User Guide</a> in the Amazon CloudWatch User Guide.
class NetworkFlowMonitor {
  final _s.RestJsonProtocol _protocol;
  factory NetworkFlowMonitor({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'networkflowmonitor',
    );
    return NetworkFlowMonitor._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  NetworkFlowMonitor._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Returns all the tags for a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Adds a tag to a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags for a resource.
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

  /// Removes a tag from a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// Keys that you specified when you tagged a resource.
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

  /// Create a monitor for specific network flows between local and remote
  /// resources, so that you can monitor network performance for one or several
  /// of your workloads. For each monitor, Network Flow Monitor publishes
  /// detailed end-to-end performance metrics and a network health indicator
  /// (NHI) that informs you whether there were Amazon Web Services network
  /// issues for one or more of the network flows tracked by a monitor, during a
  /// time period that you choose.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [localResources] :
  /// The local resources to monitor. A local resource in a workload is the
  /// location of the host, or hosts, where the Network Flow Monitor agent is
  /// installed. For example, if a workload consists of an interaction between a
  /// web service and a backend database (for example, Amazon Dynamo DB), the
  /// subnet with the EC2 instance that hosts the web service, which also runs
  /// the agent, is the local resource.
  ///
  /// Be aware that all local resources must belong to the current Region.
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor.
  ///
  /// Parameter [scopeArn] :
  /// The Amazon Resource Name (ARN) of the scope for the monitor.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive string of up to 64 ASCII characters that you
  /// specify to make an idempotent API request. Don't reuse the same client
  /// token for other API requests.
  ///
  /// Parameter [remoteResources] :
  /// The remote resources to monitor. A remote resource is the other endpoint
  /// in the bi-directional flow of a workload, with a local resource. For
  /// example, Amazon Dynamo DB can be a remote resource.
  ///
  /// When you specify remote resources, be aware that specific combinations of
  /// resources are allowed and others are not, including the following
  /// constraints:
  ///
  /// <ul>
  /// <li>
  /// All remote resources that you specify must all belong to a single Region.
  /// </li>
  /// <li>
  /// If you specify Amazon Web Services services as remote resources, any other
  /// remote resources that you specify must be in the current Region.
  /// </li>
  /// <li>
  /// When you specify a remote resource for another Region, you can only
  /// specify the <code>Region</code> resource type. You cannot specify a
  /// subnet, VPC, or Availability Zone in another Region.
  /// </li>
  /// <li>
  /// If you leave the <code>RemoteResources</code> parameter empty, the monitor
  /// will include all network flows that terminate in the current Region.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// The tags for a monitor. You can add a maximum of 200 tags.
  Future<CreateMonitorOutput> createMonitor({
    required List<MonitorLocalResource> localResources,
    required String monitorName,
    required String scopeArn,
    String? clientToken,
    List<MonitorRemoteResource>? remoteResources,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'localResources': localResources,
      'monitorName': monitorName,
      'scopeArn': scopeArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (remoteResources != null) 'remoteResources': remoteResources,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/monitors',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMonitorOutput.fromJson(response);
  }

  /// Gets information about a monitor in Network Flow Monitor based on a
  /// monitor name. The information returned includes the Amazon Resource Name
  /// (ARN), create time, modified time, resources included in the monitor, and
  /// status information.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor.
  Future<GetMonitorOutput> getMonitor({
    required String monitorName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/monitors/${Uri.encodeComponent(monitorName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMonitorOutput.fromJson(response);
  }

  /// Update a monitor to add or remove local or remote resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive string of up to 64 ASCII characters that you
  /// specify to make an idempotent API request. Don't reuse the same client
  /// token for other API requests.
  ///
  /// Parameter [localResourcesToAdd] :
  /// Additional local resources to specify network flows for a monitor, as an
  /// array of resources with identifiers and types. A local resource in a
  /// workload is the location of hosts where the Network Flow Monitor agent is
  /// installed.
  ///
  /// Parameter [localResourcesToRemove] :
  /// The local resources to remove, as an array of resources with identifiers
  /// and types.
  ///
  /// Parameter [remoteResourcesToAdd] :
  /// The remote resources to add, as an array of resources with identifiers and
  /// types.
  ///
  /// A remote resource is the other endpoint in the flow of a workload, with a
  /// local resource. For example, Amazon Dynamo DB can be a remote resource.
  ///
  /// Parameter [remoteResourcesToRemove] :
  /// The remote resources to remove, as an array of resources with identifiers
  /// and types.
  ///
  /// A remote resource is the other endpoint specified for the network flow of
  /// a workload, with a local resource. For example, Amazon Dynamo DB can be a
  /// remote resource.
  Future<UpdateMonitorOutput> updateMonitor({
    required String monitorName,
    String? clientToken,
    List<MonitorLocalResource>? localResourcesToAdd,
    List<MonitorLocalResource>? localResourcesToRemove,
    List<MonitorRemoteResource>? remoteResourcesToAdd,
    List<MonitorRemoteResource>? remoteResourcesToRemove,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (localResourcesToAdd != null)
        'localResourcesToAdd': localResourcesToAdd,
      if (localResourcesToRemove != null)
        'localResourcesToRemove': localResourcesToRemove,
      if (remoteResourcesToAdd != null)
        'remoteResourcesToAdd': remoteResourcesToAdd,
      if (remoteResourcesToRemove != null)
        'remoteResourcesToRemove': remoteResourcesToRemove,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/monitors/${Uri.encodeComponent(monitorName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMonitorOutput.fromJson(response);
  }

  /// Deletes a monitor in Network Flow Monitor.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor to delete.
  Future<void> deleteMonitor({
    required String monitorName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/monitors/${Uri.encodeComponent(monitorName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// List all monitors in an account. Optionally, you can list only monitors
  /// that have a specific status, by using the <code>STATUS</code> parameter.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The number of query results that you want to return with this call.
  ///
  /// Parameter [monitorStatus] :
  /// The status of a monitor. The status can be one of the following
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>: The monitor is in the process of being created.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The monitor is active.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code>: The monitor is inactive.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: Monitor creation failed due to an error.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: The monitor is in the process of being deleted.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  Future<ListMonitorsOutput> listMonitors({
    int? maxResults,
    MonitorStatus? monitorStatus,
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
      if (monitorStatus != null) 'monitorStatus': [monitorStatus.value],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/monitors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMonitorsOutput.fromJson(response);
  }

  /// Return the data for a query with the Network Flow Monitor query interface.
  /// You specify the query that you want to return results for by providing a
  /// query ID and a monitor name. This query returns the top contributors for a
  /// specific monitor.
  ///
  /// Create a query ID for this call by calling the corresponding API call to
  /// start the query, <code>StartQueryMonitorTopContributors</code>. Use the
  /// scope ID that was returned for your account by <code>CreateScope</code>.
  ///
  /// Top contributors in Network Flow Monitor are network flows with the
  /// highest values for a specific metric type. Top contributors can be across
  /// all workload insights, for a given scope, or for a specific monitor. Use
  /// the applicable call for the top contributors that you want to be returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor.
  ///
  /// Parameter [queryId] :
  /// The identifier for the query. A query ID is an internally-generated
  /// identifier for a specific query returned from an API call to create a
  /// query.
  ///
  /// Parameter [maxResults] :
  /// The number of query results that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  Future<GetQueryResultsMonitorTopContributorsOutput>
      getQueryResultsMonitorTopContributors({
    required String monitorName,
    required String queryId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/monitors/${Uri.encodeComponent(monitorName)}/topContributorsQueries/${Uri.encodeComponent(queryId)}/results',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetQueryResultsMonitorTopContributorsOutput.fromJson(response);
  }

  /// Returns the current status of a query for the Network Flow Monitor query
  /// interface, for a specified query ID and monitor. This call returns the
  /// query status for the top contributors for a monitor.
  ///
  /// When you create a query, use this call to check the status of the query to
  /// make sure that it has has <code>SUCCEEDED</code> before you review the
  /// results. Use the same query ID that you used for the corresponding API
  /// call to start (create) the query,
  /// <code>StartQueryMonitorTopContributors</code>.
  ///
  /// When you run a query, use this call to check the status of the query to
  /// make sure that the query has <code>SUCCEEDED</code> before you review the
  /// results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor.
  ///
  /// Parameter [queryId] :
  /// The identifier for the query. A query ID is an internally-generated
  /// identifier for a specific query returned from an API call to start a
  /// query.
  Future<GetQueryStatusMonitorTopContributorsOutput>
      getQueryStatusMonitorTopContributors({
    required String monitorName,
    required String queryId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/monitors/${Uri.encodeComponent(monitorName)}/topContributorsQueries/${Uri.encodeComponent(queryId)}/status',
      exceptionFnMap: _exceptionFns,
    );
    return GetQueryStatusMonitorTopContributorsOutput.fromJson(response);
  }

  /// Create a query that you can use with the Network Flow Monitor query
  /// interface to return the top contributors for a monitor. Specify the
  /// monitor that you want to create the query for.
  ///
  /// The call returns a query ID that you can use with <a
  /// href="https://docs.aws.amazon.com/networkflowmonitor/2.0/APIReference/API_GetQueryResultsMonitorTopContributors.html">
  /// GetQueryResultsMonitorTopContributors</a> to run the query and return the
  /// top contributors for a specific monitor.
  ///
  /// Top contributors in Network Flow Monitor are network flows with the
  /// highest values for a specific metric type. Top contributors can be across
  /// all workload insights, for a given scope, or for a specific monitor. Use
  /// the applicable APIs for the top contributors that you want to be returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationCategory] :
  /// The category that you want to query top contributors for, for a specific
  /// monitor. Destination categories can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>INTRA_AZ</code>: Top contributor network flows within a single
  /// Availability Zone
  /// </li>
  /// <li>
  /// <code>INTER_AZ</code>: Top contributor network flows between Availability
  /// Zones
  /// </li>
  /// <li>
  /// <code>INTER_REGION</code>: Top contributor network flows between Regions
  /// (to the edge of another Region)
  /// </li>
  /// <li>
  /// <code>INTER_VPC</code>: Top contributor network flows between VPCs
  /// </li>
  /// <li>
  /// <code>AMAZON_S3</code>: Top contributor network flows to or from Amazon S3
  /// </li>
  /// <li>
  /// <code>AMAZON_DYNAMODB</code>: Top contributor network flows to or from
  /// Amazon Dynamo DB
  /// </li>
  /// <li>
  /// <code>UNCLASSIFIED</code>: Top contributor network flows that do not have
  /// a bucket classification
  /// </li>
  /// </ul>
  ///
  /// Parameter [endTime] :
  /// The timestamp that is the date and time end of the period that you want to
  /// retrieve results for with your query.
  ///
  /// Parameter [metricName] :
  /// The metric that you want to query top contributors for. That is, you can
  /// specify a metric with this call and return the top contributor network
  /// flows, for that type of metric, for a monitor and (optionally) within a
  /// specific category, such as network flows between Availability Zones.
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor.
  ///
  /// Parameter [startTime] :
  /// The timestamp that is the date and time that is the beginning of the
  /// period that you want to retrieve results for with your query.
  ///
  /// Parameter [limit] :
  /// The maximum number of top contributors to return.
  Future<StartQueryMonitorTopContributorsOutput>
      startQueryMonitorTopContributors({
    required DestinationCategory destinationCategory,
    required DateTime endTime,
    required MonitorMetric metricName,
    required String monitorName,
    required DateTime startTime,
    int? limit,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'destinationCategory': destinationCategory.value,
      'endTime': iso8601ToJson(endTime),
      'metricName': metricName.value,
      'startTime': iso8601ToJson(startTime),
      if (limit != null) 'limit': limit,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/monitors/${Uri.encodeComponent(monitorName)}/topContributorsQueries',
      exceptionFnMap: _exceptionFns,
    );
    return StartQueryMonitorTopContributorsOutput.fromJson(response);
  }

  /// Stop a top contributors query for a monitor. Specify the query that you
  /// want to stop by providing a query ID and a monitor name.
  ///
  /// Top contributors in Network Flow Monitor are network flows with the
  /// highest values for a specific metric type. Top contributors can be across
  /// all workload insights, for a given scope, or for a specific monitor. Use
  /// the applicable call for the top contributors that you want to be returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor.
  ///
  /// Parameter [queryId] :
  /// The identifier for the query. A query ID is an internally-generated
  /// identifier for a specific query returned from an API call to create a
  /// query.
  Future<void> stopQueryMonitorTopContributors({
    required String monitorName,
    required String queryId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/monitors/${Uri.encodeComponent(monitorName)}/topContributorsQueries/${Uri.encodeComponent(queryId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// In Network Flow Monitor, you specify a scope for the service to generate
  /// metrics for. By using the scope, Network Flow Monitor can generate a
  /// topology of all the resources to measure performance metrics for. When you
  /// create a scope, you enable permissions for Network Flow Monitor.
  ///
  /// A scope is a Region-account pair or multiple Region-account pairs. Network
  /// Flow Monitor uses your scope to determine all the resources (the topology)
  /// where Network Flow Monitor will gather network flow performance metrics
  /// for you. To provide performance metrics, Network Flow Monitor uses the
  /// data that is sent by the Network Flow Monitor agents you install on the
  /// resources.
  ///
  /// To define the Region-account pairs for your scope, the Network Flow
  /// Monitor API uses the following constucts, which allow for future
  /// flexibility in defining scopes:
  ///
  /// <ul>
  /// <li>
  /// <i>Targets</i>, which are arrays of targetResources.
  /// </li>
  /// <li>
  /// <i>Target resources</i>, which are Region-targetIdentifier pairs.
  /// </li>
  /// <li>
  /// <i>Target identifiers</i>, made up of a targetID (currently always an
  /// account ID) and a targetType (currently always an account).
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [targets] :
  /// The targets to define the scope to be monitored. A target is an array of
  /// targetResources, which are currently Region-account pairs, defined by
  /// targetResource constructs.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive string of up to 64 ASCII characters that you
  /// specify to make an idempotent API request. Don't reuse the same client
  /// token for other API requests.
  ///
  /// Parameter [tags] :
  /// The tags for a scope. You can add a maximum of 200 tags.
  Future<CreateScopeOutput> createScope({
    required List<TargetResource> targets,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'targets': targets,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/scopes',
      exceptionFnMap: _exceptionFns,
    );
    return CreateScopeOutput.fromJson(response);
  }

  /// Gets information about a scope, including the name, status, tags, and
  /// target details. The scope in Network Flow Monitor is an account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scopeId] :
  /// The identifier for the scope that includes the resources you want to get
  /// data results for. A scope ID is an internally-generated identifier that
  /// includes all the resources for a specific root account. A scope ID is
  /// returned from a <code>CreateScope</code> API call.
  Future<GetScopeOutput> getScope({
    required String scopeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/scopes/${Uri.encodeComponent(scopeId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetScopeOutput.fromJson(response);
  }

  /// Update a scope to add or remove resources that you want to be available
  /// for Network Flow Monitor to generate metrics for, when you have active
  /// agents on those resources sending metrics reports to the Network Flow
  /// Monitor backend.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scopeId] :
  /// The identifier for the scope that includes the resources you want to get
  /// data results for. A scope ID is an internally-generated identifier that
  /// includes all the resources for a specific root account.
  ///
  /// Parameter [resourcesToAdd] :
  /// A list of resources to add to a scope.
  ///
  /// Parameter [resourcesToDelete] :
  /// A list of resources to delete from a scope.
  Future<UpdateScopeOutput> updateScope({
    required String scopeId,
    List<TargetResource>? resourcesToAdd,
    List<TargetResource>? resourcesToDelete,
  }) async {
    final $payload = <String, dynamic>{
      if (resourcesToAdd != null) 'resourcesToAdd': resourcesToAdd,
      if (resourcesToDelete != null) 'resourcesToDelete': resourcesToDelete,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/scopes/${Uri.encodeComponent(scopeId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateScopeOutput.fromJson(response);
  }

  /// Deletes a scope that has been defined.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scopeId] :
  /// The identifier for the scope that includes the resources you want to get
  /// data results for. A scope ID is an internally-generated identifier that
  /// includes all the resources for a specific root account.
  Future<void> deleteScope({
    required String scopeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/scopes/${Uri.encodeComponent(scopeId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// List all the scopes for an account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The number of query results that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  Future<ListScopesOutput> listScopes({
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
      requestUri: '/scopes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListScopesOutput.fromJson(response);
  }

  /// Return the data for a query with the Network Flow Monitor query interface.
  /// You specify the query that you want to return results for by providing a
  /// query ID and a monitor name.
  ///
  /// This query returns the top contributors for a scope for workload insights.
  /// Workload insights provide a high level view of network flow performance
  /// data collected by agents. To return the data for the top contributors, see
  /// <code>GetQueryResultsWorkloadInsightsTopContributorsData</code>.
  ///
  /// Create a query ID for this call by calling the corresponding API call to
  /// start the query, <code>StartQueryWorkloadInsightsTopContributors</code>.
  /// Use the scope ID that was returned for your account by
  /// <code>CreateScope</code>.
  ///
  /// Top contributors in Network Flow Monitor are network flows with the
  /// highest values for a specific metric type. Top contributors can be across
  /// all workload insights, for a given scope, or for a specific monitor. Use
  /// the applicable call for the top contributors that you want to be returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queryId] :
  /// The identifier for the query. A query ID is an internally-generated
  /// identifier for a specific query returned from an API call to create a
  /// query.
  ///
  /// Parameter [scopeId] :
  /// The identifier for the scope that includes the resources you want to get
  /// data results for. A scope ID is an internally-generated identifier that
  /// includes all the resources for a specific root account.
  ///
  /// Parameter [maxResults] :
  /// The number of query results that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  Future<GetQueryResultsWorkloadInsightsTopContributorsOutput>
      getQueryResultsWorkloadInsightsTopContributors({
    required String queryId,
    required String scopeId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloadInsights/${Uri.encodeComponent(scopeId)}/topContributorsQueries/${Uri.encodeComponent(queryId)}/results',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetQueryResultsWorkloadInsightsTopContributorsOutput.fromJson(
        response);
  }

  /// Return the data for a query with the Network Flow Monitor query interface.
  /// Specify the query that you want to return results for by providing a query
  /// ID and a scope ID.
  ///
  /// This query returns the data for top contributors for workload insights for
  /// a specific scope. Workload insights provide a high level view of network
  /// flow performance data collected by agents for a scope. To return just the
  /// top contributors, see
  /// <code>GetQueryResultsWorkloadInsightsTopContributors</code>.
  ///
  /// Create a query ID for this call by calling the corresponding API call to
  /// start the query,
  /// <code>StartQueryWorkloadInsightsTopContributorsData</code>. Use the scope
  /// ID that was returned for your account by <code>CreateScope</code>.
  ///
  /// Top contributors in Network Flow Monitor are network flows with the
  /// highest values for a specific metric type. Top contributors can be across
  /// all workload insights, for a given scope, or for a specific monitor. Use
  /// the applicable call for the top contributors that you want to be returned.
  ///
  /// The top contributor network flows overall are for a specific metric type,
  /// for example, the number of retransmissions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queryId] :
  /// The identifier for the query. A query ID is an internally-generated
  /// identifier for a specific query returned from an API call to create a
  /// query.
  ///
  /// Parameter [scopeId] :
  /// The identifier for the scope that includes the resources you want to get
  /// data results for. A scope ID is an internally-generated identifier that
  /// includes all the resources for a specific root account.
  ///
  /// Parameter [maxResults] :
  /// The number of query results that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  Future<GetQueryResultsWorkloadInsightsTopContributorsDataOutput>
      getQueryResultsWorkloadInsightsTopContributorsData({
    required String queryId,
    required String scopeId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloadInsights/${Uri.encodeComponent(scopeId)}/topContributorsDataQueries/${Uri.encodeComponent(queryId)}/results',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetQueryResultsWorkloadInsightsTopContributorsDataOutput.fromJson(
        response);
  }

  /// Return the data for a query with the Network Flow Monitor query interface.
  /// Specify the query that you want to return results for by providing a query
  /// ID and a monitor name. This query returns the top contributors for
  /// workload insights.
  ///
  /// When you start a query, use this call to check the status of the query to
  /// make sure that it has has <code>SUCCEEDED</code> before you review the
  /// results. Use the same query ID that you used for the corresponding API
  /// call to start the query,
  /// <code>StartQueryWorkloadInsightsTopContributors</code>.
  ///
  /// Top contributors in Network Flow Monitor are network flows with the
  /// highest values for a specific metric type. Top contributors can be across
  /// all workload insights, for a given scope, or for a specific monitor. Use
  /// the applicable call for the top contributors that you want to be returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queryId] :
  /// The identifier for the query. A query ID is an internally-generated
  /// identifier for a specific query returned from an API call to start a
  /// query.
  ///
  /// Parameter [scopeId] :
  /// The identifier for the scope that includes the resources you want to get
  /// data results for. A scope ID is an internally-generated identifier that
  /// includes all the resources for a specific root account.
  Future<GetQueryStatusWorkloadInsightsTopContributorsOutput>
      getQueryStatusWorkloadInsightsTopContributors({
    required String queryId,
    required String scopeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloadInsights/${Uri.encodeComponent(scopeId)}/topContributorsQueries/${Uri.encodeComponent(queryId)}/status',
      exceptionFnMap: _exceptionFns,
    );
    return GetQueryStatusWorkloadInsightsTopContributorsOutput.fromJson(
        response);
  }

  /// Returns the current status of a query for the Network Flow Monitor query
  /// interface, for a specified query ID and monitor. This call returns the
  /// query status for the top contributors data for workload insights.
  ///
  /// When you start a query, use this call to check the status of the query to
  /// make sure that it has has <code>SUCCEEDED</code> before you review the
  /// results. Use the same query ID that you used for the corresponding API
  /// call to start the query,
  /// <code>StartQueryWorkloadInsightsTopContributorsData</code>.
  ///
  /// Top contributors in Network Flow Monitor are network flows with the
  /// highest values for a specific metric type. Top contributors can be across
  /// all workload insights, for a given scope, or for a specific monitor. Use
  /// the applicable call for the top contributors that you want to be returned.
  ///
  /// The top contributor network flows overall are for a specific metric type,
  /// for example, the number of retransmissions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queryId] :
  /// The identifier for the query. A query ID is an internally-generated
  /// identifier for a specific query returned from an API call to start a
  /// query.
  ///
  /// Parameter [scopeId] :
  /// The identifier for the scope that includes the resources you want to get
  /// data results for. A scope ID is an internally-generated identifier that
  /// includes all the resources for a specific root account. A scope ID is
  /// returned from a <code>CreateScope</code> API call.
  Future<GetQueryStatusWorkloadInsightsTopContributorsDataOutput>
      getQueryStatusWorkloadInsightsTopContributorsData({
    required String queryId,
    required String scopeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloadInsights/${Uri.encodeComponent(scopeId)}/topContributorsDataQueries/${Uri.encodeComponent(queryId)}/status',
      exceptionFnMap: _exceptionFns,
    );
    return GetQueryStatusWorkloadInsightsTopContributorsDataOutput.fromJson(
        response);
  }

  /// Create a query with the Network Flow Monitor query interface that you can
  /// run to return workload insights top contributors. Specify the scope that
  /// you want to create a query for.
  ///
  /// The call returns a query ID that you can use with <a
  /// href="https://docs.aws.amazon.com/networkflowmonitor/2.0/APIReference/API_GetQueryResultsWorkloadInsightsTopContributors.html">
  /// GetQueryResultsWorkloadInsightsTopContributors</a> to run the query and
  /// return the top contributors for the workload insights for a scope.
  ///
  /// Top contributors in Network Flow Monitor are network flows with the
  /// highest values for a specific metric type. Top contributors can be across
  /// all workload insights, for a given scope, or for a specific monitor. Use
  /// the applicable APIs for the top contributors that you want to be returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationCategory] :
  /// The destination category for a top contributors row. Destination
  /// categories can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>INTRA_AZ</code>: Top contributor network flows within a single
  /// Availability Zone
  /// </li>
  /// <li>
  /// <code>INTER_AZ</code>: Top contributor network flows between Availability
  /// Zones
  /// </li>
  /// <li>
  /// <code>INTER_REGION</code>: Top contributor network flows between Regions
  /// (to the edge of another Region)
  /// </li>
  /// <li>
  /// <code>INTER_VPC</code>: Top contributor network flows between VPCs
  /// </li>
  /// <li>
  /// <code>AWS_SERVICES</code>: Top contributor network flows to or from Amazon
  /// Web Services services
  /// </li>
  /// <li>
  /// <code>UNCLASSIFIED</code>: Top contributor network flows that do not have
  /// a bucket classification
  /// </li>
  /// </ul>
  ///
  /// Parameter [endTime] :
  /// The timestamp that is the date and time end of the period that you want to
  /// retrieve results for with your query.
  ///
  /// Parameter [metricName] :
  /// The metric that you want to query top contributors for. That is, you can
  /// specify this metric to return the top contributor network flows, for this
  /// type of metric, for a monitor and (optionally) within a specific category,
  /// such as network flows between Availability Zones.
  ///
  /// Parameter [scopeId] :
  /// The identifier for the scope that includes the resources you want to get
  /// data results for. A scope ID is an internally-generated identifier that
  /// includes all the resources for a specific root account. A scope ID is
  /// returned from a <code>CreateScope</code> API call.
  ///
  /// Parameter [startTime] :
  /// The timestamp that is the date and time that is the beginning of the
  /// period that you want to retrieve results for with your query.
  ///
  /// Parameter [limit] :
  /// The maximum number of top contributors to return.
  Future<StartQueryWorkloadInsightsTopContributorsOutput>
      startQueryWorkloadInsightsTopContributors({
    required DestinationCategory destinationCategory,
    required DateTime endTime,
    required WorkloadInsightsMetric metricName,
    required String scopeId,
    required DateTime startTime,
    int? limit,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'destinationCategory': destinationCategory.value,
      'endTime': iso8601ToJson(endTime),
      'metricName': metricName.value,
      'startTime': iso8601ToJson(startTime),
      if (limit != null) 'limit': limit,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workloadInsights/${Uri.encodeComponent(scopeId)}/topContributorsQueries',
      exceptionFnMap: _exceptionFns,
    );
    return StartQueryWorkloadInsightsTopContributorsOutput.fromJson(response);
  }

  /// Create a query with the Network Flow Monitor query interface that you can
  /// run to return data for workload insights top contributors. Specify the
  /// scope that you want to create a query for.
  ///
  /// The call returns a query ID that you can use with <a
  /// href="https://docs.aws.amazon.com/networkflowmonitor/2.0/APIReference/API_GetQueryResultsWorkloadInsightsTopContributorsData.html">
  /// GetQueryResultsWorkloadInsightsTopContributorsData</a> to run the query
  /// and return the data for the top contributors for the workload insights for
  /// a scope.
  ///
  /// Top contributors in Network Flow Monitor are network flows with the
  /// highest values for a specific metric type. Top contributors can be across
  /// all workload insights, for a given scope, or for a specific monitor. Use
  /// the applicable call for the top contributors that you want to be returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationCategory] :
  /// The destination category for a top contributors. Destination categories
  /// can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>INTRA_AZ</code>: Top contributor network flows within a single
  /// Availability Zone
  /// </li>
  /// <li>
  /// <code>INTER_AZ</code>: Top contributor network flows between Availability
  /// Zones
  /// </li>
  /// <li>
  /// <code>INTER_REGION</code>: Top contributor network flows between Regions
  /// (to the edge of another Region)
  /// </li>
  /// <li>
  /// <code>INTER_VPC</code>: Top contributor network flows between VPCs
  /// </li>
  /// <li>
  /// <code>AWS_SERVICES</code>: Top contributor network flows to or from Amazon
  /// Web Services services
  /// </li>
  /// <li>
  /// <code>UNCLASSIFIED</code>: Top contributor network flows that do not have
  /// a bucket classification
  /// </li>
  /// </ul>
  ///
  /// Parameter [endTime] :
  /// The timestamp that is the date and time end of the period that you want to
  /// retrieve results for with your query.
  ///
  /// Parameter [metricName] :
  /// The metric that you want to query top contributors for. That is, you can
  /// specify this metric to return the top contributor network flows, for this
  /// type of metric, for a monitor and (optionally) within a specific category,
  /// such as network flows between Availability Zones.
  ///
  /// Parameter [scopeId] :
  /// The identifier for the scope that includes the resources you want to get
  /// data results for. A scope ID is an internally-generated identifier that
  /// includes all the resources for a specific root account.
  ///
  /// Parameter [startTime] :
  /// The timestamp that is the date and time that is the beginning of the
  /// period that you want to retrieve results for with your query.
  Future<StartQueryWorkloadInsightsTopContributorsDataOutput>
      startQueryWorkloadInsightsTopContributorsData({
    required DestinationCategory destinationCategory,
    required DateTime endTime,
    required WorkloadInsightsMetric metricName,
    required String scopeId,
    required DateTime startTime,
  }) async {
    final $payload = <String, dynamic>{
      'destinationCategory': destinationCategory.value,
      'endTime': iso8601ToJson(endTime),
      'metricName': metricName.value,
      'startTime': iso8601ToJson(startTime),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workloadInsights/${Uri.encodeComponent(scopeId)}/topContributorsDataQueries',
      exceptionFnMap: _exceptionFns,
    );
    return StartQueryWorkloadInsightsTopContributorsDataOutput.fromJson(
        response);
  }

  /// Stop a top contributors query for workload insights. Specify the query
  /// that you want to stop by providing a query ID and a scope ID.
  ///
  /// Top contributors in Network Flow Monitor are network flows with the
  /// highest values for a specific metric type. Top contributors can be across
  /// all workload insights, for a given scope, or for a specific monitor. Use
  /// the applicable call for the top contributors that you want to be returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queryId] :
  /// The identifier for the query. A query ID is an internally-generated
  /// identifier for a specific query returned from an API call to create a
  /// query.
  ///
  /// Parameter [scopeId] :
  /// The identifier for the scope that includes the resources you want to get
  /// data results for. A scope ID is an internally-generated identifier that
  /// includes all the resources for a specific root account.
  Future<void> stopQueryWorkloadInsightsTopContributors({
    required String queryId,
    required String scopeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workloadInsights/${Uri.encodeComponent(scopeId)}/topContributorsQueries/${Uri.encodeComponent(queryId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Stop a top contributors data query for workload insights. Specify the
  /// query that you want to stop by providing a query ID and a scope ID.
  ///
  /// Top contributors in Network Flow Monitor are network flows with the
  /// highest values for a specific metric type. Top contributors can be across
  /// all workload insights, for a given scope, or for a specific monitor. Use
  /// the applicable call for the top contributors that you want to be returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queryId] :
  /// The identifier for the query. A query ID is an internally-generated
  /// identifier for a specific query returned from an API call to create a
  /// query.
  ///
  /// Parameter [scopeId] :
  /// The identifier for the scope that includes the resources you want to get
  /// data results for. A scope ID is an internally-generated identifier that
  /// includes all the resources for a specific root account.
  Future<void> stopQueryWorkloadInsightsTopContributorsData({
    required String queryId,
    required String scopeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workloadInsights/${Uri.encodeComponent(scopeId)}/topContributorsDataQueries/${Uri.encodeComponent(queryId)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// @nodoc
class ListTagsForResourceOutput {
  /// The tags for a resource.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
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

/// @nodoc
class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateMonitorOutput {
  /// The date and time when the monitor was created.
  final DateTime createdAt;

  /// The local resources to monitor. A local resource in a workload is the
  /// location of hosts where the Network Flow Monitor agent is installed.
  final List<MonitorLocalResource> localResources;

  /// The last date and time that the monitor was modified.
  final DateTime modifiedAt;

  /// The Amazon Resource Name (ARN) of the monitor.
  final String monitorArn;

  /// The name of the monitor.
  final String monitorName;

  /// The status of a monitor. The status can be one of the following
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>: The monitor is in the process of being created.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The monitor is active.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code>: The monitor is inactive.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: Monitor creation failed due to an error.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: The monitor is in the process of being deleted.
  /// </li>
  /// </ul>
  final MonitorStatus monitorStatus;

  /// The remote resources to monitor. A remote resource is the other endpoint
  /// specified for the network flow of a workload, with a local resource. For
  /// example, Amazon Dynamo DB can be a remote resource.
  final List<MonitorRemoteResource> remoteResources;

  /// The tags for a monitor.
  final Map<String, String>? tags;

  CreateMonitorOutput({
    required this.createdAt,
    required this.localResources,
    required this.modifiedAt,
    required this.monitorArn,
    required this.monitorName,
    required this.monitorStatus,
    required this.remoteResources,
    this.tags,
  });

  factory CreateMonitorOutput.fromJson(Map<String, dynamic> json) {
    return CreateMonitorOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      localResources: ((json['localResources'] as List?) ?? const [])
          .nonNulls
          .map((e) => MonitorLocalResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      monitorArn: (json['monitorArn'] as String?) ?? '',
      monitorName: (json['monitorName'] as String?) ?? '',
      monitorStatus:
          MonitorStatus.fromString((json['monitorStatus'] as String?) ?? ''),
      remoteResources: ((json['remoteResources'] as List?) ?? const [])
          .nonNulls
          .map((e) => MonitorRemoteResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final localResources = this.localResources;
    final modifiedAt = this.modifiedAt;
    final monitorArn = this.monitorArn;
    final monitorName = this.monitorName;
    final monitorStatus = this.monitorStatus;
    final remoteResources = this.remoteResources;
    final tags = this.tags;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'localResources': localResources,
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'monitorArn': monitorArn,
      'monitorName': monitorName,
      'monitorStatus': monitorStatus.value,
      'remoteResources': remoteResources,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class GetMonitorOutput {
  /// The date and time when the monitor was created.
  final DateTime createdAt;

  /// The local resources to monitor. A local resource in a workload is the
  /// location of the hosts where the Network Flow Monitor agent is installed.
  final List<MonitorLocalResource> localResources;

  /// The date and time when the monitor was last modified.
  final DateTime modifiedAt;

  /// The Amazon Resource Name (ARN) of the monitor.
  final String monitorArn;

  /// The name of the monitor.
  final String monitorName;

  /// The status of a monitor. The status can be one of the following
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>: The monitor is in the process of being created.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The monitor is active.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code>: The monitor is inactive.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: Monitor creation failed due to an error.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: The monitor is in the process of being deleted.
  /// </li>
  /// </ul>
  final MonitorStatus monitorStatus;

  /// The remote resources to monitor. A remote resource is the other endpoint
  /// specified for the network flow of a workload, with a local resource. For
  /// example, Amazon Dynamo DB can be a remote resource.
  final List<MonitorRemoteResource> remoteResources;

  /// The tags for a monitor.
  final Map<String, String>? tags;

  GetMonitorOutput({
    required this.createdAt,
    required this.localResources,
    required this.modifiedAt,
    required this.monitorArn,
    required this.monitorName,
    required this.monitorStatus,
    required this.remoteResources,
    this.tags,
  });

  factory GetMonitorOutput.fromJson(Map<String, dynamic> json) {
    return GetMonitorOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      localResources: ((json['localResources'] as List?) ?? const [])
          .nonNulls
          .map((e) => MonitorLocalResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      monitorArn: (json['monitorArn'] as String?) ?? '',
      monitorName: (json['monitorName'] as String?) ?? '',
      monitorStatus:
          MonitorStatus.fromString((json['monitorStatus'] as String?) ?? ''),
      remoteResources: ((json['remoteResources'] as List?) ?? const [])
          .nonNulls
          .map((e) => MonitorRemoteResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final localResources = this.localResources;
    final modifiedAt = this.modifiedAt;
    final monitorArn = this.monitorArn;
    final monitorName = this.monitorName;
    final monitorStatus = this.monitorStatus;
    final remoteResources = this.remoteResources;
    final tags = this.tags;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'localResources': localResources,
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'monitorArn': monitorArn,
      'monitorName': monitorName,
      'monitorStatus': monitorStatus.value,
      'remoteResources': remoteResources,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class UpdateMonitorOutput {
  /// The date and time when the monitor was created.
  final DateTime createdAt;

  /// The local resources to monitor. A local resource in a workload is the
  /// location of hosts where the Network Flow Monitor agent is installed.
  final List<MonitorLocalResource> localResources;

  /// The last date and time that the monitor was modified.
  final DateTime modifiedAt;

  /// The Amazon Resource Name (ARN) of the monitor.
  final String monitorArn;

  /// The name of the monitor.
  final String monitorName;

  /// The status of a monitor. The status can be one of the following
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>: The monitor is in the process of being created.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The monitor is active.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code>: The monitor is inactive.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: Monitor creation failed due to an error.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: The monitor is in the process of being deleted.
  /// </li>
  /// </ul>
  final MonitorStatus monitorStatus;

  /// The remote resources updated for a monitor, as an array of resources with
  /// identifiers and types.
  ///
  /// A remote resource is the other endpoint specified for the network flow of a
  /// workload, with a local resource. For example, Amazon Dynamo DB can be a
  /// remote resource.
  final List<MonitorRemoteResource> remoteResources;

  /// The tags for a monitor.
  final Map<String, String>? tags;

  UpdateMonitorOutput({
    required this.createdAt,
    required this.localResources,
    required this.modifiedAt,
    required this.monitorArn,
    required this.monitorName,
    required this.monitorStatus,
    required this.remoteResources,
    this.tags,
  });

  factory UpdateMonitorOutput.fromJson(Map<String, dynamic> json) {
    return UpdateMonitorOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      localResources: ((json['localResources'] as List?) ?? const [])
          .nonNulls
          .map((e) => MonitorLocalResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      monitorArn: (json['monitorArn'] as String?) ?? '',
      monitorName: (json['monitorName'] as String?) ?? '',
      monitorStatus:
          MonitorStatus.fromString((json['monitorStatus'] as String?) ?? ''),
      remoteResources: ((json['remoteResources'] as List?) ?? const [])
          .nonNulls
          .map((e) => MonitorRemoteResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final localResources = this.localResources;
    final modifiedAt = this.modifiedAt;
    final monitorArn = this.monitorArn;
    final monitorName = this.monitorName;
    final monitorStatus = this.monitorStatus;
    final remoteResources = this.remoteResources;
    final tags = this.tags;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'localResources': localResources,
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'monitorArn': monitorArn,
      'monitorName': monitorName,
      'monitorStatus': monitorStatus.value,
      'remoteResources': remoteResources,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class DeleteMonitorOutput {
  DeleteMonitorOutput();

  factory DeleteMonitorOutput.fromJson(Map<String, dynamic> _) {
    return DeleteMonitorOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListMonitorsOutput {
  /// The monitors that are in an account.
  final List<MonitorSummary> monitors;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  final String? nextToken;

  ListMonitorsOutput({
    required this.monitors,
    this.nextToken,
  });

  factory ListMonitorsOutput.fromJson(Map<String, dynamic> json) {
    return ListMonitorsOutput(
      monitors: ((json['monitors'] as List?) ?? const [])
          .nonNulls
          .map((e) => MonitorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final monitors = this.monitors;
    final nextToken = this.nextToken;
    return {
      'monitors': monitors,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetQueryResultsMonitorTopContributorsOutput {
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  final String? nextToken;

  /// The top contributor network flows overall for a specific metric type, for
  /// example, the number of retransmissions.
  final List<MonitorTopContributorsRow>? topContributors;

  /// The units for a metric returned by the query.
  final MetricUnit? unit;

  GetQueryResultsMonitorTopContributorsOutput({
    this.nextToken,
    this.topContributors,
    this.unit,
  });

  factory GetQueryResultsMonitorTopContributorsOutput.fromJson(
      Map<String, dynamic> json) {
    return GetQueryResultsMonitorTopContributorsOutput(
      nextToken: json['nextToken'] as String?,
      topContributors: (json['topContributors'] as List?)
          ?.nonNulls
          .map((e) =>
              MonitorTopContributorsRow.fromJson(e as Map<String, dynamic>))
          .toList(),
      unit: (json['unit'] as String?)?.let(MetricUnit.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final topContributors = this.topContributors;
    final unit = this.unit;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (topContributors != null) 'topContributors': topContributors,
      if (unit != null) 'unit': unit.value,
    };
  }
}

/// @nodoc
class GetQueryStatusMonitorTopContributorsOutput {
  /// When you run a query, use this call to check the status of the query to make
  /// sure that the query has <code>SUCCEEDED</code> before you review the
  /// results.
  ///
  /// <ul>
  /// <li>
  /// <code>QUEUED</code>: The query is scheduled to run.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>: The query is in progress but not complete.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>: The query completed sucessfully.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The query failed due to an error.
  /// </li>
  /// <li>
  /// <code>CANCELED</code>: The query was canceled.
  /// </li>
  /// </ul>
  final QueryStatus status;

  GetQueryStatusMonitorTopContributorsOutput({
    required this.status,
  });

  factory GetQueryStatusMonitorTopContributorsOutput.fromJson(
      Map<String, dynamic> json) {
    return GetQueryStatusMonitorTopContributorsOutput(
      status: QueryStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

/// @nodoc
class StartQueryMonitorTopContributorsOutput {
  /// The identifier for the query. A query ID is an internally-generated
  /// identifier for a specific query returned from an API call to start a query.
  final String queryId;

  StartQueryMonitorTopContributorsOutput({
    required this.queryId,
  });

  factory StartQueryMonitorTopContributorsOutput.fromJson(
      Map<String, dynamic> json) {
    return StartQueryMonitorTopContributorsOutput(
      queryId: (json['queryId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final queryId = this.queryId;
    return {
      'queryId': queryId,
    };
  }
}

/// @nodoc
class StopQueryMonitorTopContributorsOutput {
  StopQueryMonitorTopContributorsOutput();

  factory StopQueryMonitorTopContributorsOutput.fromJson(
      Map<String, dynamic> _) {
    return StopQueryMonitorTopContributorsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateScopeOutput {
  /// The Amazon Resource Name (ARN) of the scope.
  final String scopeArn;

  /// The identifier for the scope that includes the resources you want to get
  /// metrics for. A scope ID is an internally-generated identifier that includes
  /// all the resources for a specific root account.
  final String scopeId;

  /// The status for a scope. The status can be one of the following:
  /// <code>SUCCEEDED</code>, <code>IN_PROGRESS</code>, <code>FAILED</code>,
  /// <code>DEACTIVATING</code>, or <code>DEACTIVATED</code>.
  ///
  /// A status of <code>DEACTIVATING</code> means that you've requested a scope to
  /// be deactivated and Network Flow Monitor is in the process of deactivating
  /// the scope. A status of <code>DEACTIVATED</code> means that the deactivating
  /// process is complete.
  final ScopeStatus status;

  /// The tags for a scope.
  final Map<String, String>? tags;

  CreateScopeOutput({
    required this.scopeArn,
    required this.scopeId,
    required this.status,
    this.tags,
  });

  factory CreateScopeOutput.fromJson(Map<String, dynamic> json) {
    return CreateScopeOutput(
      scopeArn: (json['scopeArn'] as String?) ?? '',
      scopeId: (json['scopeId'] as String?) ?? '',
      status: ScopeStatus.fromString((json['status'] as String?) ?? ''),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final scopeArn = this.scopeArn;
    final scopeId = this.scopeId;
    final status = this.status;
    final tags = this.tags;
    return {
      'scopeArn': scopeArn,
      'scopeId': scopeId,
      'status': status.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class GetScopeOutput {
  /// The Amazon Resource Name (ARN) of the scope.
  final String scopeArn;

  /// The identifier for the scope that includes the resources you want to get
  /// data results for. A scope ID is an internally-generated identifier that
  /// includes all the resources for a specific root account. A scope ID is
  /// returned from a <code>CreateScope</code> API call.
  final String scopeId;

  /// The status for a scope. The status can be one of the following:
  /// <code>SUCCEEDED</code>, <code>IN_PROGRESS</code>, <code>FAILED</code>,
  /// <code>DEACTIVATING</code>, or <code>DEACTIVATED</code>.
  ///
  /// A status of <code>DEACTIVATING</code> means that you've requested a scope to
  /// be deactivated and Network Flow Monitor is in the process of deactivating
  /// the scope. A status of <code>DEACTIVATED</code> means that the deactivating
  /// process is complete.
  final ScopeStatus status;

  /// The targets to define the scope to be monitored. A target is an array of
  /// targetResources, which are currently Region-account pairs, defined by
  /// targetResource constructs.
  final List<TargetResource> targets;

  /// The tags for a scope.
  final Map<String, String>? tags;

  GetScopeOutput({
    required this.scopeArn,
    required this.scopeId,
    required this.status,
    required this.targets,
    this.tags,
  });

  factory GetScopeOutput.fromJson(Map<String, dynamic> json) {
    return GetScopeOutput(
      scopeArn: (json['scopeArn'] as String?) ?? '',
      scopeId: (json['scopeId'] as String?) ?? '',
      status: ScopeStatus.fromString((json['status'] as String?) ?? ''),
      targets: ((json['targets'] as List?) ?? const [])
          .nonNulls
          .map((e) => TargetResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final scopeArn = this.scopeArn;
    final scopeId = this.scopeId;
    final status = this.status;
    final targets = this.targets;
    final tags = this.tags;
    return {
      'scopeArn': scopeArn,
      'scopeId': scopeId,
      'status': status.value,
      'targets': targets,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class UpdateScopeOutput {
  /// The Amazon Resource Name (ARN) of the scope.
  final String scopeArn;

  /// The identifier for the scope that includes the resources you want to get
  /// data results for. A scope ID is an internally-generated identifier that
  /// includes all the resources for a specific root account.
  final String scopeId;

  /// The status for a scope. The status can be one of the following:
  /// <code>SUCCEEDED</code>, <code>IN_PROGRESS</code>, <code>FAILED</code>,
  /// <code>DEACTIVATING</code>, or <code>DEACTIVATED</code>.
  ///
  /// A status of <code>DEACTIVATING</code> means that you've requested a scope to
  /// be deactivated and Network Flow Monitor is in the process of deactivating
  /// the scope. A status of <code>DEACTIVATED</code> means that the deactivating
  /// process is complete.
  final ScopeStatus status;

  /// The tags for a scope.
  final Map<String, String>? tags;

  UpdateScopeOutput({
    required this.scopeArn,
    required this.scopeId,
    required this.status,
    this.tags,
  });

  factory UpdateScopeOutput.fromJson(Map<String, dynamic> json) {
    return UpdateScopeOutput(
      scopeArn: (json['scopeArn'] as String?) ?? '',
      scopeId: (json['scopeId'] as String?) ?? '',
      status: ScopeStatus.fromString((json['status'] as String?) ?? ''),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final scopeArn = this.scopeArn;
    final scopeId = this.scopeId;
    final status = this.status;
    final tags = this.tags;
    return {
      'scopeArn': scopeArn,
      'scopeId': scopeId,
      'status': status.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class DeleteScopeOutput {
  DeleteScopeOutput();

  factory DeleteScopeOutput.fromJson(Map<String, dynamic> _) {
    return DeleteScopeOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListScopesOutput {
  /// The scopes returned by the call.
  final List<ScopeSummary> scopes;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  final String? nextToken;

  ListScopesOutput({
    required this.scopes,
    this.nextToken,
  });

  factory ListScopesOutput.fromJson(Map<String, dynamic> json) {
    return ListScopesOutput(
      scopes: ((json['scopes'] as List?) ?? const [])
          .nonNulls
          .map((e) => ScopeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scopes = this.scopes;
    final nextToken = this.nextToken;
    return {
      'scopes': scopes,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetQueryResultsWorkloadInsightsTopContributorsOutput {
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  final String? nextToken;

  /// The top contributor network flows overall for a specific metric type, for
  /// example, the number of retransmissions.
  final List<WorkloadInsightsTopContributorsRow>? topContributors;

  GetQueryResultsWorkloadInsightsTopContributorsOutput({
    this.nextToken,
    this.topContributors,
  });

  factory GetQueryResultsWorkloadInsightsTopContributorsOutput.fromJson(
      Map<String, dynamic> json) {
    return GetQueryResultsWorkloadInsightsTopContributorsOutput(
      nextToken: json['nextToken'] as String?,
      topContributors: (json['topContributors'] as List?)
          ?.nonNulls
          .map((e) => WorkloadInsightsTopContributorsRow.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final topContributors = this.topContributors;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (topContributors != null) 'topContributors': topContributors,
    };
  }
}

/// @nodoc
class GetQueryResultsWorkloadInsightsTopContributorsDataOutput {
  /// The datapoints returned by the query.
  final List<WorkloadInsightsTopContributorsDataPoint> datapoints;

  /// The units for a metric returned by the query.
  final MetricUnit unit;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  final String? nextToken;

  GetQueryResultsWorkloadInsightsTopContributorsDataOutput({
    required this.datapoints,
    required this.unit,
    this.nextToken,
  });

  factory GetQueryResultsWorkloadInsightsTopContributorsDataOutput.fromJson(
      Map<String, dynamic> json) {
    return GetQueryResultsWorkloadInsightsTopContributorsDataOutput(
      datapoints: ((json['datapoints'] as List?) ?? const [])
          .nonNulls
          .map((e) => WorkloadInsightsTopContributorsDataPoint.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      unit: MetricUnit.fromString((json['unit'] as String?) ?? ''),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datapoints = this.datapoints;
    final unit = this.unit;
    final nextToken = this.nextToken;
    return {
      'datapoints': datapoints,
      'unit': unit.value,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetQueryStatusWorkloadInsightsTopContributorsOutput {
  /// When you run a query, use this call to check the status of the query to make
  /// sure that the query has <code>SUCCEEDED</code> before you review the
  /// results.
  ///
  /// <ul>
  /// <li>
  /// <code>QUEUED</code>: The query is scheduled to run.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>: The query is in progress but not complete.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>: The query completed sucessfully.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The query failed due to an error.
  /// </li>
  /// <li>
  /// <code>CANCELED</code>: The query was canceled.
  /// </li>
  /// </ul>
  final QueryStatus status;

  GetQueryStatusWorkloadInsightsTopContributorsOutput({
    required this.status,
  });

  factory GetQueryStatusWorkloadInsightsTopContributorsOutput.fromJson(
      Map<String, dynamic> json) {
    return GetQueryStatusWorkloadInsightsTopContributorsOutput(
      status: QueryStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

/// @nodoc
class GetQueryStatusWorkloadInsightsTopContributorsDataOutput {
  /// The status of a query for top contributors data.
  ///
  /// <ul>
  /// <li>
  /// <code>QUEUED</code>: The query is scheduled to run.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>: The query is in progress but not complete.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>: The query completed sucessfully.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The query failed due to an error.
  /// </li>
  /// <li>
  /// <code>CANCELED</code>: The query was canceled.
  /// </li>
  /// </ul>
  final QueryStatus status;

  GetQueryStatusWorkloadInsightsTopContributorsDataOutput({
    required this.status,
  });

  factory GetQueryStatusWorkloadInsightsTopContributorsDataOutput.fromJson(
      Map<String, dynamic> json) {
    return GetQueryStatusWorkloadInsightsTopContributorsDataOutput(
      status: QueryStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

/// @nodoc
class StartQueryWorkloadInsightsTopContributorsOutput {
  /// The identifier for the query. A query ID is an internally-generated
  /// identifier for a specific query returned from an API call to start a query.
  final String queryId;

  StartQueryWorkloadInsightsTopContributorsOutput({
    required this.queryId,
  });

  factory StartQueryWorkloadInsightsTopContributorsOutput.fromJson(
      Map<String, dynamic> json) {
    return StartQueryWorkloadInsightsTopContributorsOutput(
      queryId: (json['queryId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final queryId = this.queryId;
    return {
      'queryId': queryId,
    };
  }
}

/// @nodoc
class StartQueryWorkloadInsightsTopContributorsDataOutput {
  /// The identifier for the query. A query ID is an internally-generated
  /// identifier for a specific query returned from an API call to start a query.
  final String queryId;

  StartQueryWorkloadInsightsTopContributorsDataOutput({
    required this.queryId,
  });

  factory StartQueryWorkloadInsightsTopContributorsDataOutput.fromJson(
      Map<String, dynamic> json) {
    return StartQueryWorkloadInsightsTopContributorsDataOutput(
      queryId: (json['queryId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final queryId = this.queryId;
    return {
      'queryId': queryId,
    };
  }
}

/// @nodoc
class StopQueryWorkloadInsightsTopContributorsOutput {
  StopQueryWorkloadInsightsTopContributorsOutput();

  factory StopQueryWorkloadInsightsTopContributorsOutput.fromJson(
      Map<String, dynamic> _) {
    return StopQueryWorkloadInsightsTopContributorsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class StopQueryWorkloadInsightsTopContributorsDataOutput {
  StopQueryWorkloadInsightsTopContributorsDataOutput();

  factory StopQueryWorkloadInsightsTopContributorsDataOutput.fromJson(
      Map<String, dynamic> _) {
    return StopQueryWorkloadInsightsTopContributorsDataOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class WorkloadInsightsMetric {
  static const timeouts = WorkloadInsightsMetric._('TIMEOUTS');
  static const retransmissions = WorkloadInsightsMetric._('RETRANSMISSIONS');
  static const dataTransferred = WorkloadInsightsMetric._('DATA_TRANSFERRED');

  final String value;

  const WorkloadInsightsMetric._(this.value);

  static const values = [timeouts, retransmissions, dataTransferred];

  static WorkloadInsightsMetric fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkloadInsightsMetric._(value));

  @override
  bool operator ==(other) =>
      other is WorkloadInsightsMetric && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DestinationCategory {
  static const intraAz = DestinationCategory._('INTRA_AZ');
  static const interAz = DestinationCategory._('INTER_AZ');
  static const interVpc = DestinationCategory._('INTER_VPC');
  static const unclassified = DestinationCategory._('UNCLASSIFIED');
  static const amazonS3 = DestinationCategory._('AMAZON_S3');
  static const amazonDynamodb = DestinationCategory._('AMAZON_DYNAMODB');
  static const interRegion = DestinationCategory._('INTER_REGION');

  final String value;

  const DestinationCategory._(this.value);

  static const values = [
    intraAz,
    interAz,
    interVpc,
    unclassified,
    amazonS3,
    amazonDynamodb,
    interRegion
  ];

  static DestinationCategory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DestinationCategory._(value));

  @override
  bool operator ==(other) =>
      other is DestinationCategory && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class QueryStatus {
  static const queued = QueryStatus._('QUEUED');
  static const running = QueryStatus._('RUNNING');
  static const succeeded = QueryStatus._('SUCCEEDED');
  static const failed = QueryStatus._('FAILED');
  static const canceled = QueryStatus._('CANCELED');

  final String value;

  const QueryStatus._(this.value);

  static const values = [queued, running, succeeded, failed, canceled];

  static QueryStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => QueryStatus._(value));

  @override
  bool operator ==(other) => other is QueryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MetricUnit {
  static const seconds = MetricUnit._('Seconds');
  static const microseconds = MetricUnit._('Microseconds');
  static const milliseconds = MetricUnit._('Milliseconds');
  static const bytes = MetricUnit._('Bytes');
  static const kilobytes = MetricUnit._('Kilobytes');
  static const megabytes = MetricUnit._('Megabytes');
  static const gigabytes = MetricUnit._('Gigabytes');
  static const terabytes = MetricUnit._('Terabytes');
  static const bits = MetricUnit._('Bits');
  static const kilobits = MetricUnit._('Kilobits');
  static const megabits = MetricUnit._('Megabits');
  static const gigabits = MetricUnit._('Gigabits');
  static const terabits = MetricUnit._('Terabits');
  static const percent = MetricUnit._('Percent');
  static const count = MetricUnit._('Count');
  static const bytesSecond = MetricUnit._('Bytes/Second');
  static const kilobytesSecond = MetricUnit._('Kilobytes/Second');
  static const megabytesSecond = MetricUnit._('Megabytes/Second');
  static const gigabytesSecond = MetricUnit._('Gigabytes/Second');
  static const terabytesSecond = MetricUnit._('Terabytes/Second');
  static const bitsSecond = MetricUnit._('Bits/Second');
  static const kilobitsSecond = MetricUnit._('Kilobits/Second');
  static const megabitsSecond = MetricUnit._('Megabits/Second');
  static const gigabitsSecond = MetricUnit._('Gigabits/Second');
  static const terabitsSecond = MetricUnit._('Terabits/Second');
  static const countSecond = MetricUnit._('Count/Second');
  static const none = MetricUnit._('None');

  final String value;

  const MetricUnit._(this.value);

  static const values = [
    seconds,
    microseconds,
    milliseconds,
    bytes,
    kilobytes,
    megabytes,
    gigabytes,
    terabytes,
    bits,
    kilobits,
    megabits,
    gigabits,
    terabits,
    percent,
    count,
    bytesSecond,
    kilobytesSecond,
    megabytesSecond,
    gigabytesSecond,
    terabytesSecond,
    bitsSecond,
    kilobitsSecond,
    megabitsSecond,
    gigabitsSecond,
    terabitsSecond,
    countSecond,
    none
  ];

  static MetricUnit fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MetricUnit._(value));

  @override
  bool operator ==(other) => other is MetricUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A data point for a top contributor network flow in a scope. Network Flow
/// Monitor returns information about the network flows with the top values for
/// each metric type, which are called top contributors.
///
/// @nodoc
class WorkloadInsightsTopContributorsDataPoint {
  /// The label identifying the data point.
  final String label;

  /// An array of the timestamps for the data point.
  final List<DateTime> timestamps;

  /// The values for the data point.
  final List<double> values;

  WorkloadInsightsTopContributorsDataPoint({
    required this.label,
    required this.timestamps,
    required this.values,
  });

  factory WorkloadInsightsTopContributorsDataPoint.fromJson(
      Map<String, dynamic> json) {
    return WorkloadInsightsTopContributorsDataPoint(
      label: (json['label'] as String?) ?? '',
      timestamps: ((json['timestamps'] as List?) ?? const [])
          .nonNulls
          .map(nonNullableTimeStampFromJson)
          .toList(),
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final label = this.label;
    final timestamps = this.timestamps;
    final values = this.values;
    return {
      'label': label,
      'timestamps': timestamps.map(unixTimestampToJson).toList(),
      'values': values,
    };
  }
}

/// A row for a top contributor for a scope.
///
/// @nodoc
class WorkloadInsightsTopContributorsRow {
  /// The account ID for a specific row of data.
  final String? accountId;

  /// The identifier for the Availability Zone where the local resource is
  /// located.
  final String? localAz;

  /// The Amazon Web Services Region where the local resource is located.
  final String? localRegion;

  /// The Amazon Resource Name (ARN) of a local subnet.
  final String? localSubnetArn;

  /// The subnet identifier for the local resource.
  final String? localSubnetId;

  /// The Amazon Resource Name (ARN) of a local VPC.
  final String? localVpcArn;

  /// The identifier for the VPC for the local resource.
  final String? localVpcId;

  /// The identifier of a remote resource. For a VPC or subnet, this identifier is
  /// the VPC Amazon Resource Name (ARN) or subnet ARN. For an Availability Zone,
  /// this identifier is the AZ name, for example, us-west-2b. For an Amazon Web
  /// Services Region , this identifier is the Region name, for example,
  /// us-west-2.
  final String? remoteIdentifier;

  /// The value for a metric.
  final int? value;

  WorkloadInsightsTopContributorsRow({
    this.accountId,
    this.localAz,
    this.localRegion,
    this.localSubnetArn,
    this.localSubnetId,
    this.localVpcArn,
    this.localVpcId,
    this.remoteIdentifier,
    this.value,
  });

  factory WorkloadInsightsTopContributorsRow.fromJson(
      Map<String, dynamic> json) {
    return WorkloadInsightsTopContributorsRow(
      accountId: json['accountId'] as String?,
      localAz: json['localAz'] as String?,
      localRegion: json['localRegion'] as String?,
      localSubnetArn: json['localSubnetArn'] as String?,
      localSubnetId: json['localSubnetId'] as String?,
      localVpcArn: json['localVpcArn'] as String?,
      localVpcId: json['localVpcId'] as String?,
      remoteIdentifier: json['remoteIdentifier'] as String?,
      value: json['value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final localAz = this.localAz;
    final localRegion = this.localRegion;
    final localSubnetArn = this.localSubnetArn;
    final localSubnetId = this.localSubnetId;
    final localVpcArn = this.localVpcArn;
    final localVpcId = this.localVpcId;
    final remoteIdentifier = this.remoteIdentifier;
    final value = this.value;
    return {
      if (accountId != null) 'accountId': accountId,
      if (localAz != null) 'localAz': localAz,
      if (localRegion != null) 'localRegion': localRegion,
      if (localSubnetArn != null) 'localSubnetArn': localSubnetArn,
      if (localSubnetId != null) 'localSubnetId': localSubnetId,
      if (localVpcArn != null) 'localVpcArn': localVpcArn,
      if (localVpcId != null) 'localVpcId': localVpcId,
      if (remoteIdentifier != null) 'remoteIdentifier': remoteIdentifier,
      if (value != null) 'value': value,
    };
  }
}

/// A summary of information about a scope, including the ARN, target ID, and
/// Amazon Web Services Region.
///
/// @nodoc
class ScopeSummary {
  /// The Amazon Resource Name (ARN) of the scope.
  final String scopeArn;

  /// The identifier for the scope that includes the resources that you want to
  /// get data results for. A scope ID is an internally-generated identifier that
  /// includes all the resources for the accounts in a scope.
  final String scopeId;

  /// The status for a scope. The status can be one of the following:
  /// <code>SUCCEEDED</code>, <code>IN_PROGRESS</code>, <code>FAILED</code>,
  /// <code>DEACTIVATING</code>, or <code>DEACTIVATED</code>.
  ///
  /// A status of <code>DEACTIVATING</code> means that you've requested a scope to
  /// be deactivated and Network Flow Monitor is in the process of deactivating
  /// the scope. A status of <code>DEACTIVATED</code> means that the deactivating
  /// process is complete.
  final ScopeStatus status;

  ScopeSummary({
    required this.scopeArn,
    required this.scopeId,
    required this.status,
  });

  factory ScopeSummary.fromJson(Map<String, dynamic> json) {
    return ScopeSummary(
      scopeArn: (json['scopeArn'] as String?) ?? '',
      scopeId: (json['scopeId'] as String?) ?? '',
      status: ScopeStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final scopeArn = this.scopeArn;
    final scopeId = this.scopeId;
    final status = this.status;
    return {
      'scopeArn': scopeArn,
      'scopeId': scopeId,
      'status': status.value,
    };
  }
}

/// @nodoc
class ScopeStatus {
  static const succeeded = ScopeStatus._('SUCCEEDED');
  static const inProgress = ScopeStatus._('IN_PROGRESS');
  static const failed = ScopeStatus._('FAILED');
  static const deactivating = ScopeStatus._('DEACTIVATING');
  static const deactivated = ScopeStatus._('DEACTIVATED');

  final String value;

  const ScopeStatus._(this.value);

  static const values = [
    succeeded,
    inProgress,
    failed,
    deactivating,
    deactivated
  ];

  static ScopeStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ScopeStatus._(value));

  @override
  bool operator ==(other) => other is ScopeStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A target resource in a scope. The resource is identified by a Region and an
/// account, defined by a target identifier. A target identifier is made up of a
/// target ID (currently always an account ID) and a target type (currently
/// always <code>ACCOUNT</code>).
///
/// @nodoc
class TargetResource {
  /// The Amazon Web Services Region for the scope.
  final String region;

  /// A target identifier is a pair of identifying information for a scope. A
  /// target identifier is made up of a targetID (currently always an account ID)
  /// and a targetType (currently always an account).
  final TargetIdentifier targetIdentifier;

  TargetResource({
    required this.region,
    required this.targetIdentifier,
  });

  factory TargetResource.fromJson(Map<String, dynamic> json) {
    return TargetResource(
      region: (json['region'] as String?) ?? '',
      targetIdentifier: TargetIdentifier.fromJson(
          (json['targetIdentifier'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final region = this.region;
    final targetIdentifier = this.targetIdentifier;
    return {
      'region': region,
      'targetIdentifier': targetIdentifier,
    };
  }
}

/// A target identifier is a pair of identifying information for a scope that is
/// included in a target. A target identifier is made up of a target ID and a
/// target type. Currently the target ID is always an account ID and the target
/// type is always ACCOUNT.
///
/// @nodoc
class TargetIdentifier {
  /// The identifier for a target, which is currently always an account ID .
  final TargetId targetId;

  /// The type of a target. A target type is currently always
  /// <code>ACCOUNT</code>.
  final TargetType targetType;

  TargetIdentifier({
    required this.targetId,
    required this.targetType,
  });

  factory TargetIdentifier.fromJson(Map<String, dynamic> json) {
    return TargetIdentifier(
      targetId: TargetId.fromJson((json['targetId'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      targetType: TargetType.fromString((json['targetType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final targetId = this.targetId;
    final targetType = this.targetType;
    return {
      'targetId': targetId,
      'targetType': targetType.value,
    };
  }
}

/// A target ID is an internally-generated identifier for a target. A target
/// allows you to identify all the resources in a Network Flow Monitor scope.
/// Currently, a target is always an Amazon Web Services account.
///
/// @nodoc
class TargetId {
  /// The identifier for the account for a target.
  final String? accountId;

  TargetId({
    this.accountId,
  });

  factory TargetId.fromJson(Map<String, dynamic> json) {
    return TargetId(
      accountId: json['accountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      if (accountId != null) 'accountId': accountId,
    };
  }
}

/// @nodoc
class TargetType {
  static const account = TargetType._('ACCOUNT');

  final String value;

  const TargetType._(this.value);

  static const values = [account];

  static TargetType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TargetType._(value));

  @override
  bool operator ==(other) => other is TargetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MonitorMetric {
  static const roundTripTime = MonitorMetric._('ROUND_TRIP_TIME');
  static const timeouts = MonitorMetric._('TIMEOUTS');
  static const retransmissions = MonitorMetric._('RETRANSMISSIONS');
  static const dataTransferred = MonitorMetric._('DATA_TRANSFERRED');

  final String value;

  const MonitorMetric._(this.value);

  static const values = [
    roundTripTime,
    timeouts,
    retransmissions,
    dataTransferred
  ];

  static MonitorMetric fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MonitorMetric._(value));

  @override
  bool operator ==(other) => other is MonitorMetric && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A set of information for a top contributor network flow in a monitor. In a
/// monitor, Network Flow Monitor returns information about the network flows
/// for top contributors for each metric. Top contributors are network flows
/// with the top values for each metric type.
///
/// @nodoc
class MonitorTopContributorsRow {
  /// The destination category for a top contributors row. Destination categories
  /// can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>INTRA_AZ</code>: Top contributor network flows within a single
  /// Availability Zone
  /// </li>
  /// <li>
  /// <code>INTER_AZ</code>: Top contributor network flows between Availability
  /// Zones
  /// </li>
  /// <li>
  /// <code>INTER_REGION</code>: Top contributor network flows between Regions (to
  /// the edge of another Region)
  /// </li>
  /// <li>
  /// <code>INTER_VPC</code>: Top contributor network flows between VPCs
  /// </li>
  /// <li>
  /// <code>AWS_SERVICES</code>: Top contributor network flows to or from Amazon
  /// Web Services services
  /// </li>
  /// <li>
  /// <code>UNCLASSIFIED</code>: Top contributor network flows that do not have a
  /// bucket classification
  /// </li>
  /// </ul>
  final DestinationCategory? destinationCategory;

  /// The destination network address translation (DNAT) IP address for a top
  /// contributor network flow.
  final String? dnatIp;

  /// Meta data about Kubernetes resources.
  final KubernetesMetadata? kubernetesMetadata;

  /// The Availability Zone for the local resource for a top contributor network
  /// flow.
  final String? localAz;

  /// The Amazon Resource Name (ARN) of a local resource.
  final String? localInstanceArn;

  /// The instance identifier for the local resource for a top contributor network
  /// flow.
  final String? localInstanceId;

  /// The IP address of the local resource for a top contributor network flow.
  final String? localIp;

  /// The Amazon Web Services Region for the local resource for a top contributor
  /// network flow.
  final String? localRegion;

  /// The Amazon Resource Name (ARN) of a local subnet.
  final String? localSubnetArn;

  /// The subnet ID for the local resource for a top contributor network flow.
  final String? localSubnetId;

  /// The Amazon Resource Name (ARN) of a local VPC.
  final String? localVpcArn;

  /// The VPC ID for a top contributor network flow for the local resource.
  final String? localVpcId;

  /// The Availability Zone for the remote resource for a top contributor network
  /// flow.
  final String? remoteAz;

  /// The Amazon Resource Name (ARN) of a remote resource.
  final String? remoteInstanceArn;

  /// The instance identifier for the remote resource for a top contributor
  /// network flow.
  final String? remoteInstanceId;

  /// The IP address of the remote resource for a top contributor network flow.
  final String? remoteIp;

  /// The Amazon Web Services Region for the remote resource for a top contributor
  /// network flow.
  final String? remoteRegion;

  /// The Amazon Resource Name (ARN) of a remote subnet.
  final String? remoteSubnetArn;

  /// The subnet ID for the remote resource for a top contributor network flow.
  final String? remoteSubnetId;

  /// The Amazon Resource Name (ARN) of a remote VPC.
  final String? remoteVpcArn;

  /// The VPC ID for a top contributor network flow for the remote resource.
  final String? remoteVpcId;

  /// The secure network address translation (SNAT) IP address for a top
  /// contributor network flow.
  final String? snatIp;

  /// The target port.
  final int? targetPort;

  /// The constructs traversed by a network flow.
  final List<TraversedComponent>? traversedConstructs;

  /// The value of the metric for a top contributor network flow.
  final int? value;

  MonitorTopContributorsRow({
    this.destinationCategory,
    this.dnatIp,
    this.kubernetesMetadata,
    this.localAz,
    this.localInstanceArn,
    this.localInstanceId,
    this.localIp,
    this.localRegion,
    this.localSubnetArn,
    this.localSubnetId,
    this.localVpcArn,
    this.localVpcId,
    this.remoteAz,
    this.remoteInstanceArn,
    this.remoteInstanceId,
    this.remoteIp,
    this.remoteRegion,
    this.remoteSubnetArn,
    this.remoteSubnetId,
    this.remoteVpcArn,
    this.remoteVpcId,
    this.snatIp,
    this.targetPort,
    this.traversedConstructs,
    this.value,
  });

  factory MonitorTopContributorsRow.fromJson(Map<String, dynamic> json) {
    return MonitorTopContributorsRow(
      destinationCategory: (json['destinationCategory'] as String?)
          ?.let(DestinationCategory.fromString),
      dnatIp: json['dnatIp'] as String?,
      kubernetesMetadata: json['kubernetesMetadata'] != null
          ? KubernetesMetadata.fromJson(
              json['kubernetesMetadata'] as Map<String, dynamic>)
          : null,
      localAz: json['localAz'] as String?,
      localInstanceArn: json['localInstanceArn'] as String?,
      localInstanceId: json['localInstanceId'] as String?,
      localIp: json['localIp'] as String?,
      localRegion: json['localRegion'] as String?,
      localSubnetArn: json['localSubnetArn'] as String?,
      localSubnetId: json['localSubnetId'] as String?,
      localVpcArn: json['localVpcArn'] as String?,
      localVpcId: json['localVpcId'] as String?,
      remoteAz: json['remoteAz'] as String?,
      remoteInstanceArn: json['remoteInstanceArn'] as String?,
      remoteInstanceId: json['remoteInstanceId'] as String?,
      remoteIp: json['remoteIp'] as String?,
      remoteRegion: json['remoteRegion'] as String?,
      remoteSubnetArn: json['remoteSubnetArn'] as String?,
      remoteSubnetId: json['remoteSubnetId'] as String?,
      remoteVpcArn: json['remoteVpcArn'] as String?,
      remoteVpcId: json['remoteVpcId'] as String?,
      snatIp: json['snatIp'] as String?,
      targetPort: json['targetPort'] as int?,
      traversedConstructs: (json['traversedConstructs'] as List?)
          ?.nonNulls
          .map((e) => TraversedComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      value: json['value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationCategory = this.destinationCategory;
    final dnatIp = this.dnatIp;
    final kubernetesMetadata = this.kubernetesMetadata;
    final localAz = this.localAz;
    final localInstanceArn = this.localInstanceArn;
    final localInstanceId = this.localInstanceId;
    final localIp = this.localIp;
    final localRegion = this.localRegion;
    final localSubnetArn = this.localSubnetArn;
    final localSubnetId = this.localSubnetId;
    final localVpcArn = this.localVpcArn;
    final localVpcId = this.localVpcId;
    final remoteAz = this.remoteAz;
    final remoteInstanceArn = this.remoteInstanceArn;
    final remoteInstanceId = this.remoteInstanceId;
    final remoteIp = this.remoteIp;
    final remoteRegion = this.remoteRegion;
    final remoteSubnetArn = this.remoteSubnetArn;
    final remoteSubnetId = this.remoteSubnetId;
    final remoteVpcArn = this.remoteVpcArn;
    final remoteVpcId = this.remoteVpcId;
    final snatIp = this.snatIp;
    final targetPort = this.targetPort;
    final traversedConstructs = this.traversedConstructs;
    final value = this.value;
    return {
      if (destinationCategory != null)
        'destinationCategory': destinationCategory.value,
      if (dnatIp != null) 'dnatIp': dnatIp,
      if (kubernetesMetadata != null) 'kubernetesMetadata': kubernetesMetadata,
      if (localAz != null) 'localAz': localAz,
      if (localInstanceArn != null) 'localInstanceArn': localInstanceArn,
      if (localInstanceId != null) 'localInstanceId': localInstanceId,
      if (localIp != null) 'localIp': localIp,
      if (localRegion != null) 'localRegion': localRegion,
      if (localSubnetArn != null) 'localSubnetArn': localSubnetArn,
      if (localSubnetId != null) 'localSubnetId': localSubnetId,
      if (localVpcArn != null) 'localVpcArn': localVpcArn,
      if (localVpcId != null) 'localVpcId': localVpcId,
      if (remoteAz != null) 'remoteAz': remoteAz,
      if (remoteInstanceArn != null) 'remoteInstanceArn': remoteInstanceArn,
      if (remoteInstanceId != null) 'remoteInstanceId': remoteInstanceId,
      if (remoteIp != null) 'remoteIp': remoteIp,
      if (remoteRegion != null) 'remoteRegion': remoteRegion,
      if (remoteSubnetArn != null) 'remoteSubnetArn': remoteSubnetArn,
      if (remoteSubnetId != null) 'remoteSubnetId': remoteSubnetId,
      if (remoteVpcArn != null) 'remoteVpcArn': remoteVpcArn,
      if (remoteVpcId != null) 'remoteVpcId': remoteVpcId,
      if (snatIp != null) 'snatIp': snatIp,
      if (targetPort != null) 'targetPort': targetPort,
      if (traversedConstructs != null)
        'traversedConstructs': traversedConstructs,
      if (value != null) 'value': value,
    };
  }
}

/// Meta data about Kubernetes resources.
///
/// @nodoc
class KubernetesMetadata {
  /// The name of the pod for a local resource.
  final String? localPodName;

  /// The namespace of the pod for a local resource.
  final String? localPodNamespace;

  /// The service name for a local resource.
  final String? localServiceName;

  /// The name of the pod for a remote resource.
  final String? remotePodName;

  /// The namespace of the pod for a remote resource.
  final String? remotePodNamespace;

  /// The service name for a remote resource.
  final String? remoteServiceName;

  KubernetesMetadata({
    this.localPodName,
    this.localPodNamespace,
    this.localServiceName,
    this.remotePodName,
    this.remotePodNamespace,
    this.remoteServiceName,
  });

  factory KubernetesMetadata.fromJson(Map<String, dynamic> json) {
    return KubernetesMetadata(
      localPodName: json['localPodName'] as String?,
      localPodNamespace: json['localPodNamespace'] as String?,
      localServiceName: json['localServiceName'] as String?,
      remotePodName: json['remotePodName'] as String?,
      remotePodNamespace: json['remotePodNamespace'] as String?,
      remoteServiceName: json['remoteServiceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final localPodName = this.localPodName;
    final localPodNamespace = this.localPodNamespace;
    final localServiceName = this.localServiceName;
    final remotePodName = this.remotePodName;
    final remotePodNamespace = this.remotePodNamespace;
    final remoteServiceName = this.remoteServiceName;
    return {
      if (localPodName != null) 'localPodName': localPodName,
      if (localPodNamespace != null) 'localPodNamespace': localPodNamespace,
      if (localServiceName != null) 'localServiceName': localServiceName,
      if (remotePodName != null) 'remotePodName': remotePodName,
      if (remotePodNamespace != null) 'remotePodNamespace': remotePodNamespace,
      if (remoteServiceName != null) 'remoteServiceName': remoteServiceName,
    };
  }
}

/// A section of the network that a network flow has traveled through.
///
/// @nodoc
class TraversedComponent {
  /// The Amazon Resource Name (ARN) of a traversed component.
  final String? componentArn;

  /// The identifier for the traversed component.
  final String? componentId;

  /// The type of component that was traversed.
  final String? componentType;

  /// The service name for the traversed component.
  final String? serviceName;

  TraversedComponent({
    this.componentArn,
    this.componentId,
    this.componentType,
    this.serviceName,
  });

  factory TraversedComponent.fromJson(Map<String, dynamic> json) {
    return TraversedComponent(
      componentArn: json['componentArn'] as String?,
      componentId: json['componentId'] as String?,
      componentType: json['componentType'] as String?,
      serviceName: json['serviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentArn = this.componentArn;
    final componentId = this.componentId;
    final componentType = this.componentType;
    final serviceName = this.serviceName;
    return {
      if (componentArn != null) 'componentArn': componentArn,
      if (componentId != null) 'componentId': componentId,
      if (componentType != null) 'componentType': componentType,
      if (serviceName != null) 'serviceName': serviceName,
    };
  }
}

/// A summary of information about a monitor, including the ARN, the name, and
/// the status.
///
/// @nodoc
class MonitorSummary {
  /// The Amazon Resource Name (ARN) of the monitor.
  final String monitorArn;

  /// The name of the monitor.
  final String monitorName;

  /// The status of a monitor. The status can be one of the following
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>: The monitor is in the process of being created.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The monitor is active.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code>: The monitor is inactive.
  /// </li>
  /// <li>
  /// <code>ERROR</code>: Monitor creation failed due to an error.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: The monitor is in the process of being deleted.
  /// </li>
  /// </ul>
  final MonitorStatus monitorStatus;

  MonitorSummary({
    required this.monitorArn,
    required this.monitorName,
    required this.monitorStatus,
  });

  factory MonitorSummary.fromJson(Map<String, dynamic> json) {
    return MonitorSummary(
      monitorArn: (json['monitorArn'] as String?) ?? '',
      monitorName: (json['monitorName'] as String?) ?? '',
      monitorStatus:
          MonitorStatus.fromString((json['monitorStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final monitorArn = this.monitorArn;
    final monitorName = this.monitorName;
    final monitorStatus = this.monitorStatus;
    return {
      'monitorArn': monitorArn,
      'monitorName': monitorName,
      'monitorStatus': monitorStatus.value,
    };
  }
}

/// @nodoc
class MonitorStatus {
  static const pending = MonitorStatus._('PENDING');
  static const active = MonitorStatus._('ACTIVE');
  static const inactive = MonitorStatus._('INACTIVE');
  static const error = MonitorStatus._('ERROR');
  static const deleting = MonitorStatus._('DELETING');

  final String value;

  const MonitorStatus._(this.value);

  static const values = [pending, active, inactive, error, deleting];

  static MonitorStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MonitorStatus._(value));

  @override
  bool operator ==(other) => other is MonitorStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A remote resource is the other endpoint in a network flow. That is, one
/// endpoint is the local resource and the other is the remote resource. The
/// values you can specify are the following:
///
/// <ul>
/// <li>
/// For a VPC or subnet, this identifier is the VPC Amazon Resource Name (ARN)
/// or subnet ARN.
/// </li>
/// <li>
/// For a service, this identifier is one of the following strings:
/// <code>S3</code> or <code>DynamoDB</code>.
/// </li>
/// <li>
/// For an Availability Zone, this identifier is the AZ name, for example,
/// us-west-2b.
/// </li>
/// <li>
/// For a Region, this identifier is the Region name, for example, us-west-2.
/// </li>
/// </ul>
/// When a remote resource is an Amazon Web Services Region, Network Flow
/// Monitor provides network performance measurements up to the edge of the
/// Region that you specify.
///
/// @nodoc
class MonitorRemoteResource {
  /// The identifier of the remote resource. For a VPC or subnet, this identifier
  /// is the VPC Amazon Resource Name (ARN) or subnet ARN. For an Availability
  /// Zone, this identifier is the AZ name, for example, us-west-2b. For an Amazon
  /// Web Services Region , this identifier is the Region name, for example,
  /// us-west-2.
  final String identifier;

  /// The type of the remote resource. Valid values are <code>AWS::EC2::VPC</code>
  /// <code>AWS::AvailabilityZone</code>, <code>AWS::EC2::Subnet</code>,
  /// <code>AWS::AWSService</code>, or <code>AWS::Region</code>.
  final MonitorRemoteResourceType type;

  MonitorRemoteResource({
    required this.identifier,
    required this.type,
  });

  factory MonitorRemoteResource.fromJson(Map<String, dynamic> json) {
    return MonitorRemoteResource(
      identifier: (json['identifier'] as String?) ?? '',
      type:
          MonitorRemoteResourceType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final type = this.type;
    return {
      'identifier': identifier,
      'type': type.value,
    };
  }
}

/// @nodoc
class MonitorRemoteResourceType {
  static const awsEc2Vpc = MonitorRemoteResourceType._('AWS::EC2::VPC');
  static const awsAvailabilityZone =
      MonitorRemoteResourceType._('AWS::AvailabilityZone');
  static const awsEc2Subnet = MonitorRemoteResourceType._('AWS::EC2::Subnet');
  static const awsAWSService = MonitorRemoteResourceType._('AWS::AWSService');
  static const awsRegion = MonitorRemoteResourceType._('AWS::Region');

  final String value;

  const MonitorRemoteResourceType._(this.value);

  static const values = [
    awsEc2Vpc,
    awsAvailabilityZone,
    awsEc2Subnet,
    awsAWSService,
    awsRegion
  ];

  static MonitorRemoteResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MonitorRemoteResourceType._(value));

  @override
  bool operator ==(other) =>
      other is MonitorRemoteResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A local resource is the host where the agent is installed. Local resources
/// can be a a subnet, a VPC, an Availability Zone, an EKS cluster or an Amazon
/// Web Services Region.
///
/// @nodoc
class MonitorLocalResource {
  /// The identifier of the local resource. The values you can specify are the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a VPC, subnet or EKS cluster, this identifier is the VPC Amazon Resource
  /// Name (ARN), subnet ARN or cluster ARN.
  /// </li>
  /// <li>
  /// For an Availability Zone, this identifier is the AZ name, for example,
  /// us-west-2b.
  /// </li>
  /// <li>
  /// For a Region, this identifier is the Region name, for example, us-west-2.
  /// </li>
  /// </ul>
  final String identifier;

  /// The type of the local resource. Valid values are <code>AWS::EC2::VPC</code>
  /// <code>AWS::AvailabilityZone</code>, <code>AWS::EC2::Subnet</code>,
  /// <code>AWS::EKS::Cluster</code>, or <code>AWS::Region</code>.
  final MonitorLocalResourceType type;

  MonitorLocalResource({
    required this.identifier,
    required this.type,
  });

  factory MonitorLocalResource.fromJson(Map<String, dynamic> json) {
    return MonitorLocalResource(
      identifier: (json['identifier'] as String?) ?? '',
      type:
          MonitorLocalResourceType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final type = this.type;
    return {
      'identifier': identifier,
      'type': type.value,
    };
  }
}

/// @nodoc
class MonitorLocalResourceType {
  static const awsEc2Vpc = MonitorLocalResourceType._('AWS::EC2::VPC');
  static const awsAvailabilityZone =
      MonitorLocalResourceType._('AWS::AvailabilityZone');
  static const awsEc2Subnet = MonitorLocalResourceType._('AWS::EC2::Subnet');
  static const awsRegion = MonitorLocalResourceType._('AWS::Region');
  static const awsEksCluster = MonitorLocalResourceType._('AWS::EKS::Cluster');

  final String value;

  const MonitorLocalResourceType._(this.value);

  static const values = [
    awsEc2Vpc,
    awsAvailabilityZone,
    awsEc2Subnet,
    awsRegion,
    awsEksCluster
  ];

  static MonitorLocalResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MonitorLocalResourceType._(value));

  @override
  bool operator ==(other) =>
      other is MonitorLocalResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
