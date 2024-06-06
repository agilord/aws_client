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

/// Recovery Control Configuration API Reference for Amazon Route 53 Application
/// Recovery Controller
class Route53RecoveryControlConfig {
  final _s.RestJsonProtocol _protocol;
  Route53RecoveryControlConfig({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'route53-recovery-control-config',
            signingName: 'route53-recovery-control-config',
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

  /// Create a new cluster. A cluster is a set of redundant Regional endpoints
  /// against which you can run API calls to update or get the state of one or
  /// more routing controls. Each cluster has a name, status, Amazon Resource
  /// Name (ARN), and an array of the five cluster endpoints (one for each
  /// supported Amazon Web Services Region) that you can use with API calls to
  /// the cluster data plane.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive string of up to 64 ASCII characters. To make an
  /// idempotent API request with an action, specify a client token in the
  /// request.
  ///
  /// Parameter [tags] :
  /// The tags associated with the cluster.
  Future<CreateClusterResponse> createCluster({
    required String clusterName,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ClusterName': clusterName,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cluster',
      exceptionFnMap: _exceptionFns,
    );
    return CreateClusterResponse.fromJson(response);
  }

  /// Creates a new control panel. A control panel represents a group of routing
  /// controls that can be changed together in a single transaction. You can use
  /// a control panel to centrally view the operational status of applications
  /// across your organization, and trigger multi-app failovers in a single
  /// transaction, for example, to fail over an Availability Zone or Amazon Web
  /// Services Region.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster for the control panel.
  ///
  /// Parameter [controlPanelName] :
  /// The name of the control panel.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive string of up to 64 ASCII characters. To make an
  /// idempotent API request with an action, specify a client token in the
  /// request.
  ///
  /// Parameter [tags] :
  /// The tags associated with the control panel.
  Future<CreateControlPanelResponse> createControlPanel({
    required String clusterArn,
    required String controlPanelName,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ClusterArn': clusterArn,
      'ControlPanelName': controlPanelName,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/controlpanel',
      exceptionFnMap: _exceptionFns,
    );
    return CreateControlPanelResponse.fromJson(response);
  }

  /// Creates a new routing control.
  ///
  /// A routing control has one of two states: ON and OFF. You can map the
  /// routing control state to the state of an Amazon Route 53 health check,
  /// which can be used to control traffic routing.
  ///
  /// To get or update the routing control state, see the Recovery Cluster (data
  /// plane) API actions for Amazon Route 53 Application Recovery Controller.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster that includes the routing
  /// control.
  ///
  /// Parameter [routingControlName] :
  /// The name of the routing control.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive string of up to 64 ASCII characters. To make an
  /// idempotent API request with an action, specify a client token in the
  /// request.
  ///
  /// Parameter [controlPanelArn] :
  /// The Amazon Resource Name (ARN) of the control panel that includes the
  /// routing control.
  Future<CreateRoutingControlResponse> createRoutingControl({
    required String clusterArn,
    required String routingControlName,
    String? clientToken,
    String? controlPanelArn,
  }) async {
    final $payload = <String, dynamic>{
      'ClusterArn': clusterArn,
      'RoutingControlName': routingControlName,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (controlPanelArn != null) 'ControlPanelArn': controlPanelArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/routingcontrol',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRoutingControlResponse.fromJson(response);
  }

  /// Creates a safety rule in a control panel. Safety rules let you add
  /// safeguards around changing routing control states, and for enabling and
  /// disabling routing controls, to help prevent unexpected outcomes.
  ///
  /// There are two types of safety rules: assertion rules and gating rules.
  ///
  /// Assertion rule: An assertion rule enforces that, when you change a routing
  /// control state, that a certain criteria is met. For example, the criteria
  /// might be that at least one routing control state is On after the
  /// transaction so that traffic continues to flow to at least one cell for the
  /// application. This ensures that you avoid a fail-open scenario.
  ///
  /// Gating rule: A gating rule lets you configure a gating routing control as
  /// an overall "on/off" switch for a group of routing controls. Or, you can
  /// configure more complex gating scenarios, for example by configuring
  /// multiple gating routing controls.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.safety-rules.html">Safety
  /// rules</a> in the Amazon Route 53 Application Recovery Controller Developer
  /// Guide.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assertionRule] :
  /// The assertion rule requested.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive string of up to 64 ASCII characters. To make an
  /// idempotent API request with an action, specify a client token in the
  /// request.
  ///
  /// Parameter [gatingRule] :
  /// The gating rule requested.
  ///
  /// Parameter [tags] :
  /// The tags associated with the safety rule.
  Future<CreateSafetyRuleResponse> createSafetyRule({
    NewAssertionRule? assertionRule,
    String? clientToken,
    NewGatingRule? gatingRule,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (assertionRule != null) 'AssertionRule': assertionRule,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (gatingRule != null) 'GatingRule': gatingRule,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/safetyrule',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSafetyRuleResponse.fromJson(response);
  }

  /// Delete a cluster.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster that you're deleting.
  Future<void> deleteCluster({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/cluster/${Uri.encodeComponent(clusterArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a control panel.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [controlPanelArn] :
  /// The Amazon Resource Name (ARN) of the control panel.
  Future<void> deleteControlPanel({
    required String controlPanelArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/controlpanel/${Uri.encodeComponent(controlPanelArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a routing control.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [routingControlArn] :
  /// The Amazon Resource Name (ARN) of the routing control that you're
  /// deleting.
  Future<void> deleteRoutingControl({
    required String routingControlArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/routingcontrol/${Uri.encodeComponent(routingControlArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a safety rule.
  /// /&gt;
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [safetyRuleArn] :
  /// The ARN of the safety rule.
  Future<void> deleteSafetyRule({
    required String safetyRuleArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/safetyrule/${Uri.encodeComponent(safetyRuleArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Display the details about a cluster. The response includes the cluster
  /// name, endpoints, status, and Amazon Resource Name (ARN).
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster.
  Future<DescribeClusterResponse> describeCluster({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cluster/${Uri.encodeComponent(clusterArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeClusterResponse.fromJson(response);
  }

  /// Displays details about a control panel.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [controlPanelArn] :
  /// The Amazon Resource Name (ARN) of the control panel.
  Future<DescribeControlPanelResponse> describeControlPanel({
    required String controlPanelArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/controlpanel/${Uri.encodeComponent(controlPanelArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeControlPanelResponse.fromJson(response);
  }

  /// Displays details about a routing control. A routing control has one of two
  /// states: ON and OFF. You can map the routing control state to the state of
  /// an Amazon Route 53 health check, which can be used to control routing.
  ///
  /// To get or update the routing control state, see the Recovery Cluster (data
  /// plane) API actions for Amazon Route 53 Application Recovery Controller.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [routingControlArn] :
  /// The Amazon Resource Name (ARN) of the routing control.
  Future<DescribeRoutingControlResponse> describeRoutingControl({
    required String routingControlArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/routingcontrol/${Uri.encodeComponent(routingControlArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRoutingControlResponse.fromJson(response);
  }

  /// Returns information about a safety rule.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [safetyRuleArn] :
  /// The ARN of the safety rule.
  Future<DescribeSafetyRuleResponse> describeSafetyRule({
    required String safetyRuleArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/safetyrule/${Uri.encodeComponent(safetyRuleArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSafetyRuleResponse.fromJson(response);
  }

  /// Get information about the resource policy for a cluster.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resourcePolicy/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePolicyResponse.fromJson(response);
  }

  /// Returns an array of all Amazon Route 53 health checks associated with a
  /// specific routing control.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [routingControlArn] :
  /// The Amazon Resource Name (ARN) of the routing control.
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  Future<ListAssociatedRoute53HealthChecksResponse>
      listAssociatedRoute53HealthChecks({
    required String routingControlArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/routingcontrol/${Uri.encodeComponent(routingControlArn)}/associatedRoute53HealthChecks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssociatedRoute53HealthChecksResponse.fromJson(response);
  }

  /// Returns an array of all the clusters in an account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  Future<ListClustersResponse> listClusters({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cluster',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClustersResponse.fromJson(response);
  }

  /// Returns an array of control panels in an account or in a cluster.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of a cluster.
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  Future<ListControlPanelsResponse> listControlPanels({
    String? clusterArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (clusterArn != null) 'ClusterArn': [clusterArn],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/controlpanels',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListControlPanelsResponse.fromJson(response);
  }

  /// Returns an array of routing controls for a control panel. A routing
  /// control is an Amazon Route 53 Application Recovery Controller construct
  /// that has one of two states: ON and OFF. You can map the routing control
  /// state to the state of an Amazon Route 53 health check, which can be used
  /// to control routing.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [controlPanelArn] :
  /// The Amazon Resource Name (ARN) of the control panel.
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  Future<ListRoutingControlsResponse> listRoutingControls({
    required String controlPanelArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/controlpanel/${Uri.encodeComponent(controlPanelArn)}/routingcontrols',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRoutingControlsResponse.fromJson(response);
  }

  /// List the safety rules (the assertion rules and gating rules) that you've
  /// defined for the routing controls in a control panel.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [controlPanelArn] :
  /// The Amazon Resource Name (ARN) of the control panel.
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results you want to see.
  Future<ListSafetyRulesResponse> listSafetyRules({
    required String controlPanelArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/controlpanel/${Uri.encodeComponent(controlPanelArn)}/safetyrules',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSafetyRulesResponse.fromJson(response);
  }

  /// Lists the tags for a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource that's tagged.
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

  /// Adds a tag to a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource that's tagged.
  ///
  /// Parameter [tags] :
  /// The tags associated with the resource.
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

  /// Removes a tag from a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource that's tagged.
  ///
  /// Parameter [tagKeys] :
  /// Keys for the tags to be removed.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'TagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a control panel. The only update you can make to a control panel
  /// is to change the name of the control panel.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [controlPanelArn] :
  /// The Amazon Resource Name (ARN) of the control panel.
  ///
  /// Parameter [controlPanelName] :
  /// The name of the control panel.
  Future<UpdateControlPanelResponse> updateControlPanel({
    required String controlPanelArn,
    required String controlPanelName,
  }) async {
    final $payload = <String, dynamic>{
      'ControlPanelArn': controlPanelArn,
      'ControlPanelName': controlPanelName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/controlpanel',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateControlPanelResponse.fromJson(response);
  }

  /// Updates a routing control. You can only update the name of the routing
  /// control. To get or update the routing control state, see the Recovery
  /// Cluster (data plane) API actions for Amazon Route 53 Application Recovery
  /// Controller.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [routingControlArn] :
  /// The Amazon Resource Name (ARN) of the routing control.
  ///
  /// Parameter [routingControlName] :
  /// The name of the routing control.
  Future<UpdateRoutingControlResponse> updateRoutingControl({
    required String routingControlArn,
    required String routingControlName,
  }) async {
    final $payload = <String, dynamic>{
      'RoutingControlArn': routingControlArn,
      'RoutingControlName': routingControlName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/routingcontrol',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRoutingControlResponse.fromJson(response);
  }

  /// Update a safety rule (an assertion rule or gating rule). You can only
  /// update the name and the waiting period for a safety rule. To make other
  /// updates, delete the safety rule and create a new one.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assertionRuleUpdate] :
  /// The assertion rule to update.
  ///
  /// Parameter [gatingRuleUpdate] :
  /// The gating rule to update.
  Future<UpdateSafetyRuleResponse> updateSafetyRule({
    AssertionRuleUpdate? assertionRuleUpdate,
    GatingRuleUpdate? gatingRuleUpdate,
  }) async {
    final $payload = <String, dynamic>{
      if (assertionRuleUpdate != null)
        'AssertionRuleUpdate': assertionRuleUpdate,
      if (gatingRuleUpdate != null) 'GatingRuleUpdate': gatingRuleUpdate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/safetyrule',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSafetyRuleResponse.fromJson(response);
  }
}

/// An assertion rule enforces that, when you change a routing control state,
/// that the criteria that you set in the rule configuration is met. Otherwise,
/// the change to the routing control is not accepted. For example, the criteria
/// might be that at least one routing control state is On after the transaction
/// so that traffic continues to flow to at least one cell for the application.
/// This ensures that you avoid a fail-open scenario.
class AssertionRule {
  /// The routing controls that are part of transactions that are evaluated to
  /// determine if a request to change a routing control state is allowed. For
  /// example, you might include three routing controls, one for each of three
  /// Amazon Web Services Regions.
  final List<String> assertedControls;

  /// The Amazon Resource Name (ARN) of the control panel.
  final String controlPanelArn;

  /// Name of the assertion rule. You can use any non-white space character in the
  /// name.
  final String name;

  /// The criteria that you set for specific assertion routing controls
  /// (AssertedControls) that designate how many routing control states must be ON
  /// as the result of a transaction. For example, if you have three assertion
  /// routing controls, you might specify ATLEAST 2 for your rule configuration.
  /// This means that at least two assertion routing control states must be ON, so
  /// that at least two Amazon Web Services Regions have traffic flowing to them.
  final RuleConfig ruleConfig;

  /// The Amazon Resource Name (ARN) of the assertion rule.
  final String safetyRuleArn;

  /// The deployment status of an assertion rule. Status can be one of the
  /// following: PENDING, DEPLOYED, PENDING_DELETION.
  final Status status;

  /// An evaluation period, in milliseconds (ms), during which any request against
  /// the target routing controls will fail. This helps prevent "flapping" of
  /// state. The wait period is 5000 ms by default, but you can choose a custom
  /// value.
  final int waitPeriodMs;

  /// The Amazon Web Services account ID of the assertion rule owner.
  final String? owner;

  AssertionRule({
    required this.assertedControls,
    required this.controlPanelArn,
    required this.name,
    required this.ruleConfig,
    required this.safetyRuleArn,
    required this.status,
    required this.waitPeriodMs,
    this.owner,
  });

  factory AssertionRule.fromJson(Map<String, dynamic> json) {
    return AssertionRule(
      assertedControls: (json['AssertedControls'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      controlPanelArn: json['ControlPanelArn'] as String,
      name: json['Name'] as String,
      ruleConfig:
          RuleConfig.fromJson(json['RuleConfig'] as Map<String, dynamic>),
      safetyRuleArn: json['SafetyRuleArn'] as String,
      status: (json['Status'] as String).toStatus(),
      waitPeriodMs: json['WaitPeriodMs'] as int,
      owner: json['Owner'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assertedControls = this.assertedControls;
    final controlPanelArn = this.controlPanelArn;
    final name = this.name;
    final ruleConfig = this.ruleConfig;
    final safetyRuleArn = this.safetyRuleArn;
    final status = this.status;
    final waitPeriodMs = this.waitPeriodMs;
    final owner = this.owner;
    return {
      'AssertedControls': assertedControls,
      'ControlPanelArn': controlPanelArn,
      'Name': name,
      'RuleConfig': ruleConfig,
      'SafetyRuleArn': safetyRuleArn,
      'Status': status.toValue(),
      'WaitPeriodMs': waitPeriodMs,
      if (owner != null) 'Owner': owner,
    };
  }
}

/// An update to an assertion rule. You can update the name or the evaluation
/// period (wait period). If you don't specify one of the items to update, the
/// item is unchanged.
class AssertionRuleUpdate {
  /// The name of the assertion rule. You can use any non-white space character in
  /// the name.
  final String name;

  /// The Amazon Resource Name (ARN) of the assertion rule.
  final String safetyRuleArn;

  /// An evaluation period, in milliseconds (ms), during which any request against
  /// the target routing controls will fail. This helps prevent "flapping" of
  /// state. The wait period is 5000 ms by default, but you can choose a custom
  /// value.
  final int waitPeriodMs;

  AssertionRuleUpdate({
    required this.name,
    required this.safetyRuleArn,
    required this.waitPeriodMs,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final safetyRuleArn = this.safetyRuleArn;
    final waitPeriodMs = this.waitPeriodMs;
    return {
      'Name': name,
      'SafetyRuleArn': safetyRuleArn,
      'WaitPeriodMs': waitPeriodMs,
    };
  }
}

/// A set of five redundant Regional endpoints against which you can execute API
/// calls to update or get the state of routing controls. You can host multiple
/// control panels and routing controls on one cluster.
class Cluster {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// Endpoints for a cluster. Specify one of these endpoints when you want to set
  /// or retrieve a routing control state in the cluster.
  ///
  /// To get or update the routing control state, see the Amazon Route 53
  /// Application Recovery Controller Routing Control Actions.
  final List<ClusterEndpoint>? clusterEndpoints;

  /// The name of the cluster.
  final String? name;

  /// The Amazon Web Services account ID of the cluster owner.
  final String? owner;

  /// Deployment status of a resource. Status can be one of the following:
  /// PENDING, DEPLOYED, PENDING_DELETION.
  final Status? status;

  Cluster({
    this.clusterArn,
    this.clusterEndpoints,
    this.name,
    this.owner,
    this.status,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      clusterArn: json['ClusterArn'] as String?,
      clusterEndpoints: (json['ClusterEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => ClusterEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      owner: json['Owner'] as String?,
      status: (json['Status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterEndpoints = this.clusterEndpoints;
    final name = this.name;
    final owner = this.owner;
    final status = this.status;
    return {
      if (clusterArn != null) 'ClusterArn': clusterArn,
      if (clusterEndpoints != null) 'ClusterEndpoints': clusterEndpoints,
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// A cluster endpoint. Specify an endpoint when you want to set or retrieve a
/// routing control state in the cluster.
class ClusterEndpoint {
  /// A cluster endpoint. Specify an endpoint and Amazon Web Services Region when
  /// you want to set or retrieve a routing control state in the cluster.
  ///
  /// To get or update the routing control state, see the Amazon Route 53
  /// Application Recovery Controller Routing Control Actions.
  final String? endpoint;

  /// The Amazon Web Services Region for a cluster endpoint.
  final String? region;

  ClusterEndpoint({
    this.endpoint,
    this.region,
  });

  factory ClusterEndpoint.fromJson(Map<String, dynamic> json) {
    return ClusterEndpoint(
      endpoint: json['Endpoint'] as String?,
      region: json['Region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final region = this.region;
    return {
      if (endpoint != null) 'Endpoint': endpoint,
      if (region != null) 'Region': region,
    };
  }
}

/// A control panel represents a group of routing controls that can be changed
/// together in a single transaction.
class ControlPanel {
  /// The Amazon Resource Name (ARN) of the cluster that includes the control
  /// panel.
  final String? clusterArn;

  /// The Amazon Resource Name (ARN) of the control panel.
  final String? controlPanelArn;

  /// A flag that Amazon Route 53 Application Recovery Controller sets to true to
  /// designate the default control panel for a cluster. When you create a
  /// cluster, Amazon Route 53 Application Recovery Controller creates a control
  /// panel, and sets this flag for that control panel. If you create a control
  /// panel yourself, this flag is set to false.
  final bool? defaultControlPanel;

  /// The name of the control panel. You can use any non-white space character in
  /// the name.
  final String? name;

  /// The Amazon Web Services account ID of the control panel owner.
  final String? owner;

  /// The number of routing controls in the control panel.
  final int? routingControlCount;

  /// The deployment status of control panel. Status can be one of the following:
  /// PENDING, DEPLOYED, PENDING_DELETION.
  final Status? status;

  ControlPanel({
    this.clusterArn,
    this.controlPanelArn,
    this.defaultControlPanel,
    this.name,
    this.owner,
    this.routingControlCount,
    this.status,
  });

  factory ControlPanel.fromJson(Map<String, dynamic> json) {
    return ControlPanel(
      clusterArn: json['ClusterArn'] as String?,
      controlPanelArn: json['ControlPanelArn'] as String?,
      defaultControlPanel: json['DefaultControlPanel'] as bool?,
      name: json['Name'] as String?,
      owner: json['Owner'] as String?,
      routingControlCount: json['RoutingControlCount'] as int?,
      status: (json['Status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final controlPanelArn = this.controlPanelArn;
    final defaultControlPanel = this.defaultControlPanel;
    final name = this.name;
    final owner = this.owner;
    final routingControlCount = this.routingControlCount;
    final status = this.status;
    return {
      if (clusterArn != null) 'ClusterArn': clusterArn,
      if (controlPanelArn != null) 'ControlPanelArn': controlPanelArn,
      if (defaultControlPanel != null)
        'DefaultControlPanel': defaultControlPanel,
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (routingControlCount != null)
        'RoutingControlCount': routingControlCount,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class CreateClusterResponse {
  /// The cluster that was created.
  final Cluster? cluster;

  CreateClusterResponse({
    this.cluster,
  });

  factory CreateClusterResponse.fromJson(Map<String, dynamic> json) {
    return CreateClusterResponse(
      cluster: json['Cluster'] != null
          ? Cluster.fromJson(json['Cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

class CreateControlPanelResponse {
  /// Information about a control panel.
  final ControlPanel? controlPanel;

  CreateControlPanelResponse({
    this.controlPanel,
  });

  factory CreateControlPanelResponse.fromJson(Map<String, dynamic> json) {
    return CreateControlPanelResponse(
      controlPanel: json['ControlPanel'] != null
          ? ControlPanel.fromJson(json['ControlPanel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final controlPanel = this.controlPanel;
    return {
      if (controlPanel != null) 'ControlPanel': controlPanel,
    };
  }
}

class CreateRoutingControlResponse {
  /// The routing control that is created.
  final RoutingControl? routingControl;

  CreateRoutingControlResponse({
    this.routingControl,
  });

  factory CreateRoutingControlResponse.fromJson(Map<String, dynamic> json) {
    return CreateRoutingControlResponse(
      routingControl: json['RoutingControl'] != null
          ? RoutingControl.fromJson(
              json['RoutingControl'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final routingControl = this.routingControl;
    return {
      if (routingControl != null) 'RoutingControl': routingControl,
    };
  }
}

class CreateSafetyRuleResponse {
  /// The assertion rule created.
  final AssertionRule? assertionRule;

  /// The gating rule created.
  final GatingRule? gatingRule;

  CreateSafetyRuleResponse({
    this.assertionRule,
    this.gatingRule,
  });

  factory CreateSafetyRuleResponse.fromJson(Map<String, dynamic> json) {
    return CreateSafetyRuleResponse(
      assertionRule: json['AssertionRule'] != null
          ? AssertionRule.fromJson(
              json['AssertionRule'] as Map<String, dynamic>)
          : null,
      gatingRule: json['GatingRule'] != null
          ? GatingRule.fromJson(json['GatingRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assertionRule = this.assertionRule;
    final gatingRule = this.gatingRule;
    return {
      if (assertionRule != null) 'AssertionRule': assertionRule,
      if (gatingRule != null) 'GatingRule': gatingRule,
    };
  }
}

class DeleteClusterResponse {
  DeleteClusterResponse();

  factory DeleteClusterResponse.fromJson(Map<String, dynamic> _) {
    return DeleteClusterResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteControlPanelResponse {
  DeleteControlPanelResponse();

  factory DeleteControlPanelResponse.fromJson(Map<String, dynamic> _) {
    return DeleteControlPanelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRoutingControlResponse {
  DeleteRoutingControlResponse();

  factory DeleteRoutingControlResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRoutingControlResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSafetyRuleResponse {
  DeleteSafetyRuleResponse();

  factory DeleteSafetyRuleResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSafetyRuleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeClusterResponse {
  /// The cluster for the DescribeCluster request.
  final Cluster? cluster;

  DescribeClusterResponse({
    this.cluster,
  });

  factory DescribeClusterResponse.fromJson(Map<String, dynamic> json) {
    return DescribeClusterResponse(
      cluster: json['Cluster'] != null
          ? Cluster.fromJson(json['Cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

class DescribeControlPanelResponse {
  /// Information about the control panel.
  final ControlPanel? controlPanel;

  DescribeControlPanelResponse({
    this.controlPanel,
  });

  factory DescribeControlPanelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeControlPanelResponse(
      controlPanel: json['ControlPanel'] != null
          ? ControlPanel.fromJson(json['ControlPanel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final controlPanel = this.controlPanel;
    return {
      if (controlPanel != null) 'ControlPanel': controlPanel,
    };
  }
}

class DescribeRoutingControlResponse {
  /// Information about the routing control.
  final RoutingControl? routingControl;

  DescribeRoutingControlResponse({
    this.routingControl,
  });

  factory DescribeRoutingControlResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRoutingControlResponse(
      routingControl: json['RoutingControl'] != null
          ? RoutingControl.fromJson(
              json['RoutingControl'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final routingControl = this.routingControl;
    return {
      if (routingControl != null) 'RoutingControl': routingControl,
    };
  }
}

class DescribeSafetyRuleResponse {
  /// The assertion rule in the response.
  final AssertionRule? assertionRule;

  /// The gating rule in the response.
  final GatingRule? gatingRule;

  DescribeSafetyRuleResponse({
    this.assertionRule,
    this.gatingRule,
  });

  factory DescribeSafetyRuleResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSafetyRuleResponse(
      assertionRule: json['AssertionRule'] != null
          ? AssertionRule.fromJson(
              json['AssertionRule'] as Map<String, dynamic>)
          : null,
      gatingRule: json['GatingRule'] != null
          ? GatingRule.fromJson(json['GatingRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assertionRule = this.assertionRule;
    final gatingRule = this.gatingRule;
    return {
      if (assertionRule != null) 'AssertionRule': assertionRule,
      if (gatingRule != null) 'GatingRule': gatingRule,
    };
  }
}

/// A gating rule verifies that a gating routing control or set of gating
/// routing controls, evaluates as true, based on a rule configuration that you
/// specify, which allows a set of routing control state changes to complete.
///
/// For example, if you specify one gating routing control and you set the Type
/// in the rule configuration to OR, that indicates that you must set the gating
/// routing control to On for the rule to evaluate as true; that is, for the
/// gating control "switch" to be "On". When you do that, then you can update
/// the routing control states for the target routing controls that you specify
/// in the gating rule.
class GatingRule {
  /// The Amazon Resource Name (ARN) of the control panel.
  final String controlPanelArn;

  /// An array of gating routing control Amazon Resource Names (ARNs). For a
  /// simple "on/off" switch, specify the ARN for one routing control. The gating
  /// routing controls are evaluated by the rule configuration that you specify to
  /// determine if the target routing control states can be changed.
  final List<String> gatingControls;

  /// The name for the gating rule. You can use any non-white space character in
  /// the name.
  final String name;

  /// The criteria that you set for gating routing controls that designate how
  /// many of the routing control states must be ON to allow you to update target
  /// routing control states.
  final RuleConfig ruleConfig;

  /// The Amazon Resource Name (ARN) of the gating rule.
  final String safetyRuleArn;

  /// The deployment status of a gating rule. Status can be one of the following:
  /// PENDING, DEPLOYED, PENDING_DELETION.
  final Status status;

  /// An array of target routing control Amazon Resource Names (ARNs) for which
  /// the states can only be updated if the rule configuration that you specify
  /// evaluates to true for the gating routing control. As a simple example, if
  /// you have a single gating control, it acts as an overall "on/off" switch for
  /// a set of target routing controls. You can use this to manually override
  /// automated failover, for example.
  final List<String> targetControls;

  /// An evaluation period, in milliseconds (ms), during which any request against
  /// the target routing controls will fail. This helps prevent "flapping" of
  /// state. The wait period is 5000 ms by default, but you can choose a custom
  /// value.
  final int waitPeriodMs;

  /// The Amazon Web Services account ID of the gating rule owner.
  final String? owner;

  GatingRule({
    required this.controlPanelArn,
    required this.gatingControls,
    required this.name,
    required this.ruleConfig,
    required this.safetyRuleArn,
    required this.status,
    required this.targetControls,
    required this.waitPeriodMs,
    this.owner,
  });

  factory GatingRule.fromJson(Map<String, dynamic> json) {
    return GatingRule(
      controlPanelArn: json['ControlPanelArn'] as String,
      gatingControls: (json['GatingControls'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['Name'] as String,
      ruleConfig:
          RuleConfig.fromJson(json['RuleConfig'] as Map<String, dynamic>),
      safetyRuleArn: json['SafetyRuleArn'] as String,
      status: (json['Status'] as String).toStatus(),
      targetControls: (json['TargetControls'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      waitPeriodMs: json['WaitPeriodMs'] as int,
      owner: json['Owner'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlPanelArn = this.controlPanelArn;
    final gatingControls = this.gatingControls;
    final name = this.name;
    final ruleConfig = this.ruleConfig;
    final safetyRuleArn = this.safetyRuleArn;
    final status = this.status;
    final targetControls = this.targetControls;
    final waitPeriodMs = this.waitPeriodMs;
    final owner = this.owner;
    return {
      'ControlPanelArn': controlPanelArn,
      'GatingControls': gatingControls,
      'Name': name,
      'RuleConfig': ruleConfig,
      'SafetyRuleArn': safetyRuleArn,
      'Status': status.toValue(),
      'TargetControls': targetControls,
      'WaitPeriodMs': waitPeriodMs,
      if (owner != null) 'Owner': owner,
    };
  }
}

/// Update to a gating rule. You can update the name or the evaluation period
/// (wait period). If you don't specify one of the items to update, the item is
/// unchanged.
class GatingRuleUpdate {
  /// The name for the gating rule. You can use any non-white space character in
  /// the name.
  final String name;

  /// The Amazon Resource Name (ARN) of the gating rule.
  final String safetyRuleArn;

  /// An evaluation period, in milliseconds (ms), during which any request against
  /// the target routing controls will fail. This helps prevent "flapping" of
  /// state. The wait period is 5000 ms by default, but you can choose a custom
  /// value.
  final int waitPeriodMs;

  GatingRuleUpdate({
    required this.name,
    required this.safetyRuleArn,
    required this.waitPeriodMs,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final safetyRuleArn = this.safetyRuleArn;
    final waitPeriodMs = this.waitPeriodMs;
    return {
      'Name': name,
      'SafetyRuleArn': safetyRuleArn,
      'WaitPeriodMs': waitPeriodMs,
    };
  }
}

class GetResourcePolicyResponse {
  /// The resource policy.
  final String? policy;

  GetResourcePolicyResponse({
    this.policy,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

class ListAssociatedRoute53HealthChecksResponse {
  /// Identifiers for the health checks.
  final List<String>? healthCheckIds;

  /// Next token for listing health checks.
  final String? nextToken;

  ListAssociatedRoute53HealthChecksResponse({
    this.healthCheckIds,
    this.nextToken,
  });

  factory ListAssociatedRoute53HealthChecksResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAssociatedRoute53HealthChecksResponse(
      healthCheckIds: (json['HealthCheckIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthCheckIds = this.healthCheckIds;
    final nextToken = this.nextToken;
    return {
      if (healthCheckIds != null) 'HealthCheckIds': healthCheckIds,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListClustersResponse {
  /// An array of the clusters in an account.
  final List<Cluster>? clusters;

  /// The token that identifies which batch of results you want to see.
  final String? nextToken;

  ListClustersResponse({
    this.clusters,
    this.nextToken,
  });

  factory ListClustersResponse.fromJson(Map<String, dynamic> json) {
    return ListClustersResponse(
      clusters: (json['Clusters'] as List?)
          ?.whereNotNull()
          .map((e) => Cluster.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusters = this.clusters;
    final nextToken = this.nextToken;
    return {
      if (clusters != null) 'Clusters': clusters,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListControlPanelsResponse {
  /// The result of a successful ListControlPanel request.
  final List<ControlPanel>? controlPanels;

  /// The token that identifies which batch of results you want to see.
  final String? nextToken;

  ListControlPanelsResponse({
    this.controlPanels,
    this.nextToken,
  });

  factory ListControlPanelsResponse.fromJson(Map<String, dynamic> json) {
    return ListControlPanelsResponse(
      controlPanels: (json['ControlPanels'] as List?)
          ?.whereNotNull()
          .map((e) => ControlPanel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlPanels = this.controlPanels;
    final nextToken = this.nextToken;
    return {
      if (controlPanels != null) 'ControlPanels': controlPanels,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRoutingControlsResponse {
  /// The token that identifies which batch of results you want to see.
  final String? nextToken;

  /// An array of routing controls.
  final List<RoutingControl>? routingControls;

  ListRoutingControlsResponse({
    this.nextToken,
    this.routingControls,
  });

  factory ListRoutingControlsResponse.fromJson(Map<String, dynamic> json) {
    return ListRoutingControlsResponse(
      nextToken: json['NextToken'] as String?,
      routingControls: (json['RoutingControls'] as List?)
          ?.whereNotNull()
          .map((e) => RoutingControl.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final routingControls = this.routingControls;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (routingControls != null) 'RoutingControls': routingControls,
    };
  }
}

class ListSafetyRulesResponse {
  /// The token that identifies which batch of results you want to see.
  final String? nextToken;

  /// The list of safety rules in a control panel.
  final List<Rule>? safetyRules;

  ListSafetyRulesResponse({
    this.nextToken,
    this.safetyRules,
  });

  factory ListSafetyRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListSafetyRulesResponse(
      nextToken: json['NextToken'] as String?,
      safetyRules: (json['SafetyRules'] as List?)
          ?.whereNotNull()
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final safetyRules = this.safetyRules;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (safetyRules != null) 'SafetyRules': safetyRules,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags associated with the resource.
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

/// A new assertion rule for a control panel.
class NewAssertionRule {
  /// The routing controls that are part of transactions that are evaluated to
  /// determine if a request to change a routing control state is allowed. For
  /// example, you might include three routing controls, one for each of three
  /// Amazon Web Services Regions.
  final List<String> assertedControls;

  /// The Amazon Resource Name (ARN) for the control panel.
  final String controlPanelArn;

  /// The name of the assertion rule. You can use any non-white space character in
  /// the name.
  final String name;

  /// The criteria that you set for specific assertion controls (routing controls)
  /// that designate how many control states must be ON as the result of a
  /// transaction. For example, if you have three assertion controls, you might
  /// specify ATLEAST 2 for your rule configuration. This means that at least two
  /// assertion controls must be ON, so that at least two Amazon Web Services
  /// Regions have traffic flowing to them.
  final RuleConfig ruleConfig;

  /// An evaluation period, in milliseconds (ms), during which any request against
  /// the target routing controls will fail. This helps prevent "flapping" of
  /// state. The wait period is 5000 ms by default, but you can choose a custom
  /// value.
  final int waitPeriodMs;

  NewAssertionRule({
    required this.assertedControls,
    required this.controlPanelArn,
    required this.name,
    required this.ruleConfig,
    required this.waitPeriodMs,
  });

  Map<String, dynamic> toJson() {
    final assertedControls = this.assertedControls;
    final controlPanelArn = this.controlPanelArn;
    final name = this.name;
    final ruleConfig = this.ruleConfig;
    final waitPeriodMs = this.waitPeriodMs;
    return {
      'AssertedControls': assertedControls,
      'ControlPanelArn': controlPanelArn,
      'Name': name,
      'RuleConfig': ruleConfig,
      'WaitPeriodMs': waitPeriodMs,
    };
  }
}

/// A new gating rule for a control panel.
class NewGatingRule {
  /// The Amazon Resource Name (ARN) of the control panel.
  final String controlPanelArn;

  /// The gating controls for the new gating rule. That is, routing controls that
  /// are evaluated by the rule configuration that you specify.
  final List<String> gatingControls;

  /// The name for the new gating rule.
  final String name;

  /// The criteria that you set for specific gating controls (routing controls)
  /// that designate how many control states must be ON to allow you to change
  /// (set or unset) the target control states.
  final RuleConfig ruleConfig;

  /// Routing controls that can only be set or unset if the specified RuleConfig
  /// evaluates to true for the specified GatingControls. For example, say you
  /// have three gating controls, one for each of three Amazon Web Services
  /// Regions. Now you specify ATLEAST 2 as your RuleConfig. With these settings,
  /// you can only change (set or unset) the routing controls that you have
  /// specified as TargetControls if that rule evaluates to true.
  ///
  /// In other words, your ability to change the routing controls that you have
  /// specified as TargetControls is gated by the rule that you set for the
  /// routing controls in GatingControls.
  final List<String> targetControls;

  /// An evaluation period, in milliseconds (ms), during which any request against
  /// the target routing controls will fail. This helps prevent "flapping" of
  /// state. The wait period is 5000 ms by default, but you can choose a custom
  /// value.
  final int waitPeriodMs;

  NewGatingRule({
    required this.controlPanelArn,
    required this.gatingControls,
    required this.name,
    required this.ruleConfig,
    required this.targetControls,
    required this.waitPeriodMs,
  });

  Map<String, dynamic> toJson() {
    final controlPanelArn = this.controlPanelArn;
    final gatingControls = this.gatingControls;
    final name = this.name;
    final ruleConfig = this.ruleConfig;
    final targetControls = this.targetControls;
    final waitPeriodMs = this.waitPeriodMs;
    return {
      'ControlPanelArn': controlPanelArn,
      'GatingControls': gatingControls,
      'Name': name,
      'RuleConfig': ruleConfig,
      'TargetControls': targetControls,
      'WaitPeriodMs': waitPeriodMs,
    };
  }
}

/// A routing control has one of two states: ON and OFF. You can map the routing
/// control state to the state of an Amazon Route 53 health check, which can be
/// used to control traffic routing.
class RoutingControl {
  /// The Amazon Resource Name (ARN) of the control panel that includes the
  /// routing control.
  final String? controlPanelArn;

  /// The name of the routing control.
  final String? name;

  /// The Amazon Web Services account ID of the routing control owner.
  final String? owner;

  /// The Amazon Resource Name (ARN) of the routing control.
  final String? routingControlArn;

  /// The deployment status of a routing control. Status can be one of the
  /// following: PENDING, DEPLOYED, PENDING_DELETION.
  final Status? status;

  RoutingControl({
    this.controlPanelArn,
    this.name,
    this.owner,
    this.routingControlArn,
    this.status,
  });

  factory RoutingControl.fromJson(Map<String, dynamic> json) {
    return RoutingControl(
      controlPanelArn: json['ControlPanelArn'] as String?,
      name: json['Name'] as String?,
      owner: json['Owner'] as String?,
      routingControlArn: json['RoutingControlArn'] as String?,
      status: (json['Status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final controlPanelArn = this.controlPanelArn;
    final name = this.name;
    final owner = this.owner;
    final routingControlArn = this.routingControlArn;
    final status = this.status;
    return {
      if (controlPanelArn != null) 'ControlPanelArn': controlPanelArn,
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (routingControlArn != null) 'RoutingControlArn': routingControlArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// A safety rule. A safety rule can be an assertion rule or a gating rule.
class Rule {
  /// An assertion rule enforces that, when a routing control state is changed,
  /// the criteria set by the rule configuration is met. Otherwise, the change to
  /// the routing control state is not accepted. For example, the criteria might
  /// be that at least one routing control state is On after the transaction so
  /// that traffic continues to flow to at least one cell for the application.
  /// This ensures that you avoid a fail-open scenario.
  final AssertionRule? assertion;

  /// A gating rule verifies that a gating routing control or set of gating
  /// routing controls, evaluates as true, based on a rule configuration that you
  /// specify, which allows a set of routing control state changes to complete.
  ///
  /// For example, if you specify one gating routing control and you set the Type
  /// in the rule configuration to OR, that indicates that you must set the gating
  /// routing control to On for the rule to evaluate as true; that is, for the
  /// gating control "switch" to be "On". When you do that, then you can update
  /// the routing control states for the target routing controls that you specify
  /// in the gating rule.
  final GatingRule? gating;

  Rule({
    this.assertion,
    this.gating,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      assertion: json['ASSERTION'] != null
          ? AssertionRule.fromJson(json['ASSERTION'] as Map<String, dynamic>)
          : null,
      gating: json['GATING'] != null
          ? GatingRule.fromJson(json['GATING'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assertion = this.assertion;
    final gating = this.gating;
    return {
      if (assertion != null) 'ASSERTION': assertion,
      if (gating != null) 'GATING': gating,
    };
  }
}

/// The rule configuration for an assertion rule. That is, the criteria that you
/// set for specific assertion controls (routing controls) that specify how many
/// control states must be ON after a transaction completes.
class RuleConfig {
  /// Logical negation of the rule. If the rule would usually evaluate true, it's
  /// evaluated as false, and vice versa.
  final bool inverted;

  /// The value of N, when you specify an ATLEAST rule type. That is, Threshold is
  /// the number of controls that must be set when you specify an ATLEAST type.
  final int threshold;

  /// A rule can be one of the following: ATLEAST, AND, or OR.
  final RuleType type;

  RuleConfig({
    required this.inverted,
    required this.threshold,
    required this.type,
  });

  factory RuleConfig.fromJson(Map<String, dynamic> json) {
    return RuleConfig(
      inverted: json['Inverted'] as bool,
      threshold: json['Threshold'] as int,
      type: (json['Type'] as String).toRuleType(),
    );
  }

  Map<String, dynamic> toJson() {
    final inverted = this.inverted;
    final threshold = this.threshold;
    final type = this.type;
    return {
      'Inverted': inverted,
      'Threshold': threshold,
      'Type': type.toValue(),
    };
  }
}

/// An enumerated type that determines how the evaluated rules are processed.
/// RuleType can be one of the following:
///
/// ATLEAST - At least N routing controls must be set. You specify N as the
/// Threshold in the rule configuration.
///
/// AND - All routing controls must be set. This is a shortcut for "At least N,"
/// where N is the total number of controls in the rule.
///
/// OR - Any control must be set. This is a shortcut for "At least N," where N
/// is 1.
enum RuleType {
  atleast,
  and,
  or,
}

extension RuleTypeValueExtension on RuleType {
  String toValue() {
    switch (this) {
      case RuleType.atleast:
        return 'ATLEAST';
      case RuleType.and:
        return 'AND';
      case RuleType.or:
        return 'OR';
    }
  }
}

extension RuleTypeFromString on String {
  RuleType toRuleType() {
    switch (this) {
      case 'ATLEAST':
        return RuleType.atleast;
      case 'AND':
        return RuleType.and;
      case 'OR':
        return RuleType.or;
    }
    throw Exception('$this is not known in enum RuleType');
  }
}

/// The deployment status of a resource. Status can be one of the following:
///
/// PENDING: Amazon Route 53 Application Recovery Controller is creating the
/// resource.
///
/// DEPLOYED: The resource is deployed and ready to use.
///
/// PENDING_DELETION: Amazon Route 53 Application Recovery Controller is
/// deleting the resource.
enum Status {
  pending,
  deployed,
  pendingDeletion,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.pending:
        return 'PENDING';
      case Status.deployed:
        return 'DEPLOYED';
      case Status.pendingDeletion:
        return 'PENDING_DELETION';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'PENDING':
        return Status.pending;
      case 'DEPLOYED':
        return Status.deployed;
      case 'PENDING_DELETION':
        return Status.pendingDeletion;
    }
    throw Exception('$this is not known in enum Status');
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateControlPanelResponse {
  /// The control panel to update.
  final ControlPanel? controlPanel;

  UpdateControlPanelResponse({
    this.controlPanel,
  });

  factory UpdateControlPanelResponse.fromJson(Map<String, dynamic> json) {
    return UpdateControlPanelResponse(
      controlPanel: json['ControlPanel'] != null
          ? ControlPanel.fromJson(json['ControlPanel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final controlPanel = this.controlPanel;
    return {
      if (controlPanel != null) 'ControlPanel': controlPanel,
    };
  }
}

class UpdateRoutingControlResponse {
  /// The routing control that was updated.
  final RoutingControl? routingControl;

  UpdateRoutingControlResponse({
    this.routingControl,
  });

  factory UpdateRoutingControlResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRoutingControlResponse(
      routingControl: json['RoutingControl'] != null
          ? RoutingControl.fromJson(
              json['RoutingControl'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final routingControl = this.routingControl;
    return {
      if (routingControl != null) 'RoutingControl': routingControl,
    };
  }
}

class UpdateSafetyRuleResponse {
  /// The assertion rule updated.
  final AssertionRule? assertionRule;

  /// The gating rule updated.
  final GatingRule? gatingRule;

  UpdateSafetyRuleResponse({
    this.assertionRule,
    this.gatingRule,
  });

  factory UpdateSafetyRuleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSafetyRuleResponse(
      assertionRule: json['AssertionRule'] != null
          ? AssertionRule.fromJson(
              json['AssertionRule'] as Map<String, dynamic>)
          : null,
      gatingRule: json['GatingRule'] != null
          ? GatingRule.fromJson(json['GatingRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assertionRule = this.assertionRule;
    final gatingRule = this.gatingRule;
    return {
      if (assertionRule != null) 'AssertionRule': assertionRule,
      if (gatingRule != null) 'GatingRule': gatingRule,
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
