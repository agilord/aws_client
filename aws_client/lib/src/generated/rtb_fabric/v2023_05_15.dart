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

import 'v2023_05_15.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon Web Services RTB Fabric provides secure, low-latency infrastructure
/// for connecting real-time bidding (RTB) applications. Rather than hosting
/// applications directly, RTB Fabric acts as the connecting fabric that enables
/// your applications to communicate efficiently over private networks instead
/// of the public internet. You maintain complete control over your
/// applications, data, and bidding decisions, while RTB Fabric provides the
/// underlying infrastructure for secure, reliable connectivity.
///
/// You can use these APIs to complete RTB Fabric tasks, such as setting up
/// audit log ingestions or viewing user access. For more information about RTB
/// Fabric, including the required permissions to use the service, see the <a
/// href="https://docs.aws.amazon.com/rtb-fabric/latest/userguide/">Amazon Web
/// Services RTB Fabric User Guide</a>.
class RtbFabric {
  final _s.RestJsonProtocol _protocol;
  factory RtbFabric({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'rtbfabric',
    );
    return RtbFabric._(
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
  RtbFabric._({
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

  /// Lists requester gateways.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken error</i>.
  Future<ListRequesterGatewaysResponse> listRequesterGateways({
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
      requestUri: '/requester-gateways',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRequesterGatewaysResponse.fromJson(response);
  }

  /// Lists reponder gateways.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken error</i>.
  Future<ListResponderGatewaysResponse> listResponderGateways({
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
      requestUri: '/responder-gateways',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListResponderGatewaysResponse.fromJson(response);
  }

  /// Lists tags for a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which you want to
  /// retrieve tags.
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

  /// Assigns one or more tags (key-value pairs) to the specified resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to tag.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign to the resource.
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

  /// Removes a tag or tags from a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to untag.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the key-value pairs for the tag or tags you want to remove
  /// from the specified resource.
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

  /// Creates a new link between gateways.
  ///
  /// Establishes a connection that allows gateways to communicate and exchange
  /// bid requests and responses.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [logSettings] :
  /// Settings for the application logs.
  ///
  /// Parameter [peerGatewayId] :
  /// The unique identifier of the peer gateway.
  ///
  /// Parameter [attributes] :
  /// Attributes of the link.
  ///
  /// Parameter [httpResponderAllowed] :
  /// Boolean to specify if an HTTP responder is allowed.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign to the resource.
  ///
  /// Parameter [timeoutInMillis] :
  /// The timeout value in milliseconds.
  Future<CreateLinkResponse> createLink({
    required String gatewayId,
    required LinkLogSettings logSettings,
    required String peerGatewayId,
    LinkAttributes? attributes,
    bool? httpResponderAllowed,
    Map<String, String>? tags,
    int? timeoutInMillis,
  }) async {
    _s.validateNumRange(
      'timeoutInMillis',
      timeoutInMillis,
      100,
      5000,
    );
    final $payload = <String, dynamic>{
      'logSettings': logSettings,
      'peerGatewayId': peerGatewayId,
      if (attributes != null) 'attributes': attributes,
      if (httpResponderAllowed != null)
        'httpResponderAllowed': httpResponderAllowed,
      if (tags != null) 'tags': tags,
      if (timeoutInMillis != null) 'timeoutInMillis': timeoutInMillis,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/gateway/${Uri.encodeComponent(gatewayId)}/create-link',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLinkResponse.fromJson(response);
  }

  /// Retrieves information about a link between gateways.
  ///
  /// Returns detailed information about the link configuration, status, and
  /// associated gateways.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [linkId] :
  /// The unique identifier of the link.
  Future<GetLinkResponse> getLink({
    required String gatewayId,
    required String linkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/gateway/${Uri.encodeComponent(gatewayId)}/link/${Uri.encodeComponent(linkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetLinkResponse.fromJson(response);
  }

  /// Deletes a link between gateways.
  ///
  /// Permanently removes the connection between gateways. This action cannot be
  /// undone.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [linkId] :
  /// The unique identifier of the link.
  Future<DeleteLinkResponse> deleteLink({
    required String gatewayId,
    required String linkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/gateway/${Uri.encodeComponent(gatewayId)}/link/${Uri.encodeComponent(linkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteLinkResponse.fromJson(response);
  }

  /// Lists links associated with gateways.
  ///
  /// Returns a list of all links for the specified gateways, including their
  /// status and configuration details.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken error</i>.
  Future<ListLinksResponse> listLinks({
    required String gatewayId,
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
      requestUri: '/gateway/${Uri.encodeComponent(gatewayId)}/links/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLinksResponse.fromJson(response);
  }

  /// Accepts a link request between gateways.
  ///
  /// When a requester gateway requests to link with a responder gateway, the
  /// responder can use this operation to accept the link request and establish
  /// the connection.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [linkId] :
  /// The unique identifier of the link.
  ///
  /// Parameter [logSettings] :
  /// Settings for the application logs.
  ///
  /// Parameter [attributes] :
  /// Attributes of the link.
  ///
  /// Parameter [timeoutInMillis] :
  /// The timeout value in milliseconds.
  Future<AcceptLinkResponse> acceptLink({
    required String gatewayId,
    required String linkId,
    required LinkLogSettings logSettings,
    LinkAttributes? attributes,
    int? timeoutInMillis,
  }) async {
    _s.validateNumRange(
      'timeoutInMillis',
      timeoutInMillis,
      100,
      5000,
    );
    final $payload = <String, dynamic>{
      'logSettings': logSettings,
      if (attributes != null) 'attributes': attributes,
      if (timeoutInMillis != null) 'timeoutInMillis': timeoutInMillis,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/gateway/${Uri.encodeComponent(gatewayId)}/link/${Uri.encodeComponent(linkId)}/accept',
      exceptionFnMap: _exceptionFns,
    );
    return AcceptLinkResponse.fromJson(response);
  }

  /// Rejects a link request between gateways.
  ///
  /// When a requester gateway requests to link with a responder gateway, the
  /// responder can use this operation to decline the link request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [linkId] :
  /// The unique identifier of the link.
  Future<RejectLinkResponse> rejectLink({
    required String gatewayId,
    required String linkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/gateway/${Uri.encodeComponent(gatewayId)}/link/${Uri.encodeComponent(linkId)}/reject',
      exceptionFnMap: _exceptionFns,
    );
    return RejectLinkResponse.fromJson(response);
  }

  /// Updates the configuration of a link between gateways.
  ///
  /// Allows you to modify settings and parameters for an existing link.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [linkId] :
  /// The unique identifier of the link.
  ///
  /// Parameter [logSettings] :
  /// Settings for the application logs.
  ///
  /// Parameter [timeoutInMillis] :
  /// The timeout value in milliseconds.
  Future<UpdateLinkResponse> updateLink({
    required String gatewayId,
    required String linkId,
    LinkLogSettings? logSettings,
    int? timeoutInMillis,
  }) async {
    _s.validateNumRange(
      'timeoutInMillis',
      timeoutInMillis,
      100,
      5000,
    );
    final $payload = <String, dynamic>{
      if (logSettings != null) 'logSettings': logSettings,
      if (timeoutInMillis != null) 'timeoutInMillis': timeoutInMillis,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/gateway/${Uri.encodeComponent(gatewayId)}/link/${Uri.encodeComponent(linkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLinkResponse.fromJson(response);
  }

  /// Updates a link module flow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [linkId] :
  /// The unique identifier of the link.
  ///
  /// Parameter [modules] :
  /// The configuration of a module.
  ///
  /// Parameter [clientToken] :
  /// The unique client token.
  Future<UpdateLinkModuleFlowResponse> updateLinkModuleFlow({
    required String gatewayId,
    required String linkId,
    required List<ModuleConfiguration> modules,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'modules': modules,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/gateway/${Uri.encodeComponent(gatewayId)}/link/${Uri.encodeComponent(linkId)}/module-flow',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLinkModuleFlowResponse.fromJson(response);
  }

  /// Creates a routing rule for a link.
  ///
  /// Routing rules use priority-based evaluation where lower priority numbers
  /// are evaluated first. Each rule specifies conditions that must all match
  /// for the rule to apply.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [conditions] :
  /// The conditions for the routing rule. All specified fields must match for
  /// the rule to apply. At least one condition field must be set.
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [linkId] :
  /// The unique identifier of the link.
  ///
  /// Parameter [priority] :
  /// The priority of the routing rule. Lower numbers are evaluated first. Valid
  /// values are 1 to 1000. Priority must be unique among non-deleted rules
  /// within a link.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign to the resource.
  Future<CreateLinkRoutingRuleResponse> createLinkRoutingRule({
    required RuleCondition conditions,
    required String gatewayId,
    required String linkId,
    required int priority,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      1,
      1000,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'conditions': conditions,
      'priority': priority,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/responder-gateway/${Uri.encodeComponent(gatewayId)}/link/${Uri.encodeComponent(linkId)}/routing-rule',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLinkRoutingRuleResponse.fromJson(response);
  }

  /// Retrieves the details of a routing rule for a link.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [linkId] :
  /// The unique identifier of the link.
  ///
  /// Parameter [ruleId] :
  /// The unique identifier of the routing rule.
  Future<GetLinkRoutingRuleResponse> getLinkRoutingRule({
    required String gatewayId,
    required String linkId,
    required String ruleId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/responder-gateway/${Uri.encodeComponent(gatewayId)}/link/${Uri.encodeComponent(linkId)}/routing-rule/${Uri.encodeComponent(ruleId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetLinkRoutingRuleResponse.fromJson(response);
  }

  /// Updates a routing rule for a link.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [conditions] :
  /// The updated conditions for the routing rule. All specified fields must
  /// match for the rule to apply. At least one condition field must be set.
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [linkId] :
  /// The unique identifier of the link.
  ///
  /// Parameter [priority] :
  /// The updated priority of the routing rule. Lower numbers are evaluated
  /// first. Valid values are 1 to 1000. Priority must be unique among
  /// non-deleted rules within a link.
  ///
  /// Parameter [ruleId] :
  /// The unique identifier of the routing rule.
  Future<UpdateLinkRoutingRuleResponse> updateLinkRoutingRule({
    required RuleCondition conditions,
    required String gatewayId,
    required String linkId,
    required int priority,
    required String ruleId,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      1,
      1000,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'conditions': conditions,
      'priority': priority,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/responder-gateway/${Uri.encodeComponent(gatewayId)}/link/${Uri.encodeComponent(linkId)}/routing-rule/${Uri.encodeComponent(ruleId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLinkRoutingRuleResponse.fromJson(response);
  }

  /// Deletes a routing rule from a link.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [linkId] :
  /// The unique identifier of the link.
  ///
  /// Parameter [ruleId] :
  /// The unique identifier of the routing rule.
  Future<DeleteLinkRoutingRuleResponse> deleteLinkRoutingRule({
    required String gatewayId,
    required String linkId,
    required String ruleId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/responder-gateway/${Uri.encodeComponent(gatewayId)}/link/${Uri.encodeComponent(linkId)}/routing-rule/${Uri.encodeComponent(ruleId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteLinkRoutingRuleResponse.fromJson(response);
  }

  /// Lists the routing rules for a link.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [linkId] :
  /// The unique identifier of the link.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken error</i>.
  Future<ListLinkRoutingRulesResponse> listLinkRoutingRules({
    required String gatewayId,
    required String linkId,
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
          '/responder-gateway/${Uri.encodeComponent(gatewayId)}/link/${Uri.encodeComponent(linkId)}/routing-rules',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLinkRoutingRulesResponse.fromJson(response);
  }

  /// Creates a requester gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [securityGroupIds] :
  /// The unique identifiers of the security groups.
  ///
  /// Parameter [subnetIds] :
  /// The unique identifiers of the subnets.
  ///
  /// Parameter [vpcId] :
  /// The unique identifier of the Virtual Private Cloud (VPC).
  ///
  /// Parameter [clientToken] :
  /// The unique client token.
  ///
  /// Parameter [description] :
  /// An optional description for the requester gateway.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign to the resource.
  Future<CreateRequesterGatewayResponse> createRequesterGateway({
    required List<String> securityGroupIds,
    required List<String> subnetIds,
    required String vpcId,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'securityGroupIds': securityGroupIds,
      'subnetIds': subnetIds,
      'vpcId': vpcId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/requester-gateway',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRequesterGatewayResponse.fromJson(response);
  }

  /// Retrieves information about a requester gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  Future<GetRequesterGatewayResponse> getRequesterGateway({
    required String gatewayId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/requester-gateway/${Uri.encodeComponent(gatewayId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRequesterGatewayResponse.fromJson(response);
  }

  /// Deletes a requester gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  Future<DeleteRequesterGatewayResponse> deleteRequesterGateway({
    required String gatewayId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/requester-gateway/${Uri.encodeComponent(gatewayId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRequesterGatewayResponse.fromJson(response);
  }

  /// Updates a requester gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [clientToken] :
  /// The unique client token.
  ///
  /// Parameter [description] :
  /// An optional description for the requester gateway.
  Future<UpdateRequesterGatewayResponse> updateRequesterGateway({
    required String gatewayId,
    String? clientToken,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/requester-gateway/${Uri.encodeComponent(gatewayId)}/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRequesterGatewayResponse.fromJson(response);
  }

  /// Creates an outbound external link.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [logSettings] :
  /// Settings for the application logs.
  ///
  /// Parameter [publicEndpoint] :
  /// The public endpoint of the link.
  ///
  /// Parameter [attributes] :
  /// Attributes of the link.
  ///
  /// Parameter [clientToken] :
  /// The unique client token.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign to the resource.
  Future<CreateOutboundExternalLinkResponse> createOutboundExternalLink({
    required String gatewayId,
    required LinkLogSettings logSettings,
    required String publicEndpoint,
    LinkAttributes? attributes,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'logSettings': logSettings,
      'publicEndpoint': publicEndpoint,
      if (attributes != null) 'attributes': attributes,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/requester-gateway/${Uri.encodeComponent(gatewayId)}/outbound-external-link',
      exceptionFnMap: _exceptionFns,
    );
    return CreateOutboundExternalLinkResponse.fromJson(response);
  }

  /// Deletes an outbound external link.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [linkId] :
  /// The unique identifier of the link.
  Future<DeleteOutboundExternalLinkResponse> deleteOutboundExternalLink({
    required String gatewayId,
    required String linkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/requester-gateway/${Uri.encodeComponent(gatewayId)}/outbound-external-link/${Uri.encodeComponent(linkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteOutboundExternalLinkResponse.fromJson(response);
  }

  /// Retrieves information about an outbound external link.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [linkId] :
  /// The unique identifier of the link.
  Future<GetOutboundExternalLinkResponse> getOutboundExternalLink({
    required String gatewayId,
    required String linkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/requester-gateway/${Uri.encodeComponent(gatewayId)}/outbound-external-link/${Uri.encodeComponent(linkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetOutboundExternalLinkResponse.fromJson(response);
  }

  /// Creates a responder gateway.
  /// <important>
  /// A domain name or managed endpoint is required.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [port] :
  /// The networking port to use.
  ///
  /// Parameter [protocol] :
  /// The networking protocol to use.
  ///
  /// Parameter [securityGroupIds] :
  /// The unique identifiers of the security groups.
  ///
  /// Parameter [subnetIds] :
  /// The unique identifiers of the subnets.
  ///
  /// Parameter [vpcId] :
  /// The unique identifier of the Virtual Private Cloud (VPC).
  ///
  /// Parameter [clientToken] :
  /// The unique client token.
  ///
  /// Parameter [description] :
  /// An optional description for the responder gateway.
  ///
  /// Parameter [domainName] :
  /// The domain name for the responder gateway.
  ///
  /// Parameter [gatewayType] :
  /// The type of gateway. Valid values are <code>EXTERNAL</code> or
  /// <code>INTERNAL</code>.
  ///
  /// Parameter [managedEndpointConfiguration] :
  /// The configuration for the managed endpoint.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign to the resource.
  ///
  /// Parameter [trustStoreConfiguration] :
  /// The configuration of the trust store.
  Future<CreateResponderGatewayResponse> createResponderGateway({
    required int port,
    required Protocol protocol,
    required List<String> securityGroupIds,
    required List<String> subnetIds,
    required String vpcId,
    String? clientToken,
    String? description,
    String? domainName,
    GatewayType? gatewayType,
    ListenerConfig? listenerConfig,
    ManagedEndpointConfiguration? managedEndpointConfiguration,
    Map<String, String>? tags,
    TrustStoreConfiguration? trustStoreConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'port': port,
      'protocol': protocol.value,
      'securityGroupIds': securityGroupIds,
      'subnetIds': subnetIds,
      'vpcId': vpcId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (domainName != null) 'domainName': domainName,
      if (gatewayType != null) 'gatewayType': gatewayType.value,
      if (listenerConfig != null) 'listenerConfig': listenerConfig,
      if (managedEndpointConfiguration != null)
        'managedEndpointConfiguration': managedEndpointConfiguration,
      if (tags != null) 'tags': tags,
      if (trustStoreConfiguration != null)
        'trustStoreConfiguration': trustStoreConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/responder-gateway',
      exceptionFnMap: _exceptionFns,
    );
    return CreateResponderGatewayResponse.fromJson(response);
  }

  /// Retrieves information about a responder gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  Future<GetResponderGatewayResponse> getResponderGateway({
    required String gatewayId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/responder-gateway/${Uri.encodeComponent(gatewayId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetResponderGatewayResponse.fromJson(response);
  }

  /// Deletes a responder gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  Future<DeleteResponderGatewayResponse> deleteResponderGateway({
    required String gatewayId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/responder-gateway/${Uri.encodeComponent(gatewayId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteResponderGatewayResponse.fromJson(response);
  }

  /// Associates an ACM certificate with a responder gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [acmCertificateArn] :
  /// The Amazon Resource Name (ARN) of the ACM certificate to associate.
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  Future<AssociateCertificateResponse> associateCertificate({
    required String acmCertificateArn,
    required String gatewayId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'acmCertificateArn': acmCertificateArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/responder-gateway/${Uri.encodeComponent(gatewayId)}/certificate',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateCertificateResponse.fromJson(response);
  }

  /// Removes a certificate association from a responder gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [acmCertificateArn] :
  /// The Amazon Resource Name (ARN) of the ACM certificate to disassociate.
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  Future<DisassociateCertificateResponse> disassociateCertificate({
    required String acmCertificateArn,
    required String gatewayId,
  }) async {
    final $query = <String, List<String>>{
      'acmCertificateArn': [acmCertificateArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/responder-gateway/${Uri.encodeComponent(gatewayId)}/certificate',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateCertificateResponse.fromJson(response);
  }

  /// Retrieves the details of a certificate association with a responder
  /// gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [acmCertificateArn] :
  /// The Amazon Resource Name (ARN) of the ACM certificate.
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  Future<GetCertificateAssociationResponse> getCertificateAssociation({
    required String acmCertificateArn,
    required String gatewayId,
  }) async {
    final $query = <String, List<String>>{
      'acmCertificateArn': [acmCertificateArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/responder-gateway/${Uri.encodeComponent(gatewayId)}/certificate',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetCertificateAssociationResponse.fromJson(response);
  }

  /// Lists the certificate associations for a responder gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken error</i>.
  Future<ListCertificateAssociationsResponse> listCertificateAssociations({
    required String gatewayId,
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
          '/responder-gateway/${Uri.encodeComponent(gatewayId)}/certificates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCertificateAssociationsResponse.fromJson(response);
  }

  /// Updates a responder gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [port] :
  /// The networking port to use.
  ///
  /// Parameter [protocol] :
  /// The networking protocol to use.
  ///
  /// Parameter [clientToken] :
  /// The unique client token.
  ///
  /// Parameter [description] :
  /// An optional description for the responder gateway.
  ///
  /// Parameter [domainName] :
  /// The domain name for the responder gateway.
  ///
  /// Parameter [listenerConfig] :
  /// The listener configuration for the responder gateway.
  ///
  /// Parameter [managedEndpointConfiguration] :
  /// The configuration for the managed endpoint.
  ///
  /// Parameter [trustStoreConfiguration] :
  /// The configuration of the trust store.
  Future<UpdateResponderGatewayResponse> updateResponderGateway({
    required String gatewayId,
    required int port,
    required Protocol protocol,
    String? clientToken,
    String? description,
    String? domainName,
    ListenerConfig? listenerConfig,
    ManagedEndpointConfiguration? managedEndpointConfiguration,
    TrustStoreConfiguration? trustStoreConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'port': port,
      'protocol': protocol.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (domainName != null) 'domainName': domainName,
      if (listenerConfig != null) 'listenerConfig': listenerConfig,
      if (managedEndpointConfiguration != null)
        'managedEndpointConfiguration': managedEndpointConfiguration,
      if (trustStoreConfiguration != null)
        'trustStoreConfiguration': trustStoreConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/responder-gateway/${Uri.encodeComponent(gatewayId)}/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateResponderGatewayResponse.fromJson(response);
  }

  /// Creates an inbound external link.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [logSettings] :
  /// Settings for the application logs.
  ///
  /// Parameter [attributes] :
  /// Attributes of the link.
  ///
  /// Parameter [clientToken] :
  /// The unique client token.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign to the resource.
  Future<CreateInboundExternalLinkResponse> createInboundExternalLink({
    required String gatewayId,
    required LinkLogSettings logSettings,
    LinkAttributes? attributes,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'logSettings': logSettings,
      if (attributes != null) 'attributes': attributes,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/responder-gateway/${Uri.encodeComponent(gatewayId)}/inbound-external-link',
      exceptionFnMap: _exceptionFns,
    );
    return CreateInboundExternalLinkResponse.fromJson(response);
  }

  /// Deletes an inbound external link.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [linkId] :
  /// The unique identifier of the link.
  Future<DeleteInboundExternalLinkResponse> deleteInboundExternalLink({
    required String gatewayId,
    required String linkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/responder-gateway/${Uri.encodeComponent(gatewayId)}/inbound-external-link/${Uri.encodeComponent(linkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteInboundExternalLinkResponse.fromJson(response);
  }

  /// Retrieves information about an inbound external link.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [gatewayId] :
  /// The unique identifier of the gateway.
  ///
  /// Parameter [linkId] :
  /// The unique identifier of the link.
  Future<GetInboundExternalLinkResponse> getInboundExternalLink({
    required String gatewayId,
    required String linkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/responder-gateway/${Uri.encodeComponent(gatewayId)}/inbound-external-link/${Uri.encodeComponent(linkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetInboundExternalLinkResponse.fromJson(response);
  }
}

/// @nodoc
class ListRequesterGatewaysResponse {
  /// The unique identifier of the gateways.
  final List<String>? gatewayIds;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400 InvalidToken
  /// error</i>.
  final String? nextToken;

  ListRequesterGatewaysResponse({
    this.gatewayIds,
    this.nextToken,
  });

  factory ListRequesterGatewaysResponse.fromJson(Map<String, dynamic> json) {
    return ListRequesterGatewaysResponse(
      gatewayIds: (json['gatewayIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayIds = this.gatewayIds;
    final nextToken = this.nextToken;
    return {
      if (gatewayIds != null) 'gatewayIds': gatewayIds,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListResponderGatewaysResponse {
  /// The unique identifier of the gateways.
  final List<String>? gatewayIds;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400 InvalidToken
  /// error</i>.
  final String? nextToken;

  ListResponderGatewaysResponse({
    this.gatewayIds,
    this.nextToken,
  });

  factory ListResponderGatewaysResponse.fromJson(Map<String, dynamic> json) {
    return ListResponderGatewaysResponse(
      gatewayIds: (json['gatewayIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayIds = this.gatewayIds;
    final nextToken = this.nextToken;
    return {
      if (gatewayIds != null) 'gatewayIds': gatewayIds,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// A map of the key-value pairs for the tag or tags assigned to the specified
  /// resource.
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

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateLinkResponse {
  /// The timestamp of when the link was created.
  final DateTime createdAt;

  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The unique identifier of the link.
  final String linkId;

  /// The unique identifier of the peer gateway.
  final String peerGatewayId;

  /// The status of the request.
  final LinkStatus status;

  /// The timestamp of when the link was updated.
  final DateTime updatedAt;

  /// Attributes of the link.
  final LinkAttributes? attributes;

  /// The connectivity type of the link.
  final ConnectivityType? connectivityType;

  /// The customer-provided unique identifier of the link.
  final String? customerProvidedId;

  /// The direction of the link.
  final LinkDirection? direction;

  /// The configuration of flow modules.
  final List<ModuleConfiguration>? flowModules;
  final LinkLogSettings? logSettings;

  /// The configuration of pending flow modules.
  final List<ModuleConfiguration>? pendingFlowModules;

  CreateLinkResponse({
    required this.createdAt,
    required this.gatewayId,
    required this.linkId,
    required this.peerGatewayId,
    required this.status,
    required this.updatedAt,
    this.attributes,
    this.connectivityType,
    this.customerProvidedId,
    this.direction,
    this.flowModules,
    this.logSettings,
    this.pendingFlowModules,
  });

  factory CreateLinkResponse.fromJson(Map<String, dynamic> json) {
    return CreateLinkResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      gatewayId: (json['gatewayId'] as String?) ?? '',
      linkId: (json['linkId'] as String?) ?? '',
      peerGatewayId: (json['peerGatewayId'] as String?) ?? '',
      status: LinkStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      attributes: json['attributes'] != null
          ? LinkAttributes.fromJson(json['attributes'] as Map<String, dynamic>)
          : null,
      connectivityType: (json['connectivityType'] as String?)
          ?.let(ConnectivityType.fromString),
      customerProvidedId: json['customerProvidedId'] as String?,
      direction: (json['direction'] as String?)?.let(LinkDirection.fromString),
      flowModules: (json['flowModules'] as List?)
          ?.nonNulls
          .map((e) => ModuleConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      logSettings: json['logSettings'] != null
          ? LinkLogSettings.fromJson(
              json['logSettings'] as Map<String, dynamic>)
          : null,
      pendingFlowModules: (json['pendingFlowModules'] as List?)
          ?.nonNulls
          .map((e) => ModuleConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final gatewayId = this.gatewayId;
    final linkId = this.linkId;
    final peerGatewayId = this.peerGatewayId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final attributes = this.attributes;
    final connectivityType = this.connectivityType;
    final customerProvidedId = this.customerProvidedId;
    final direction = this.direction;
    final flowModules = this.flowModules;
    final logSettings = this.logSettings;
    final pendingFlowModules = this.pendingFlowModules;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'gatewayId': gatewayId,
      'linkId': linkId,
      'peerGatewayId': peerGatewayId,
      'status': status.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (attributes != null) 'attributes': attributes,
      if (connectivityType != null) 'connectivityType': connectivityType.value,
      if (customerProvidedId != null) 'customerProvidedId': customerProvidedId,
      if (direction != null) 'direction': direction.value,
      if (flowModules != null) 'flowModules': flowModules,
      if (logSettings != null) 'logSettings': logSettings,
      if (pendingFlowModules != null) 'pendingFlowModules': pendingFlowModules,
    };
  }
}

/// @nodoc
class GetLinkResponse {
  /// The timestamp of when the link was created.
  final DateTime createdAt;

  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The unique identifier of the link.
  final String linkId;

  /// The unique identifier of the peer gateway.
  final String peerGatewayId;

  /// The status of the link.
  final LinkStatus status;

  /// The timestamp of when the link was updated.
  final DateTime updatedAt;

  /// Attributes of the link.
  final LinkAttributes? attributes;

  /// The connectivity type of the link.
  final ConnectivityType? connectivityType;

  /// The direction of the link.
  final LinkDirection? direction;

  /// The configuration of flow modules.
  final List<ModuleConfiguration>? flowModules;

  /// Boolean to specify if an HTTP responder is allowed.
  final bool? httpResponderAllowed;

  /// Settings for the application logs.
  final LinkLogSettings? logSettings;

  /// The configuration of pending flow modules.
  final List<ModuleConfiguration>? pendingFlowModules;

  /// A map of the key-value pairs for the tag or tags assigned to the specified
  /// resource.
  final Map<String, String>? tags;

  /// The timeout value in milliseconds.
  final int? timeoutInMillis;

  GetLinkResponse({
    required this.createdAt,
    required this.gatewayId,
    required this.linkId,
    required this.peerGatewayId,
    required this.status,
    required this.updatedAt,
    this.attributes,
    this.connectivityType,
    this.direction,
    this.flowModules,
    this.httpResponderAllowed,
    this.logSettings,
    this.pendingFlowModules,
    this.tags,
    this.timeoutInMillis,
  });

  factory GetLinkResponse.fromJson(Map<String, dynamic> json) {
    return GetLinkResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      gatewayId: (json['gatewayId'] as String?) ?? '',
      linkId: (json['linkId'] as String?) ?? '',
      peerGatewayId: (json['peerGatewayId'] as String?) ?? '',
      status: LinkStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      attributes: json['attributes'] != null
          ? LinkAttributes.fromJson(json['attributes'] as Map<String, dynamic>)
          : null,
      connectivityType: (json['connectivityType'] as String?)
          ?.let(ConnectivityType.fromString),
      direction: (json['direction'] as String?)?.let(LinkDirection.fromString),
      flowModules: (json['flowModules'] as List?)
          ?.nonNulls
          .map((e) => ModuleConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      httpResponderAllowed: json['httpResponderAllowed'] as bool?,
      logSettings: json['logSettings'] != null
          ? LinkLogSettings.fromJson(
              json['logSettings'] as Map<String, dynamic>)
          : null,
      pendingFlowModules: (json['pendingFlowModules'] as List?)
          ?.nonNulls
          .map((e) => ModuleConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      timeoutInMillis: json['timeoutInMillis'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final gatewayId = this.gatewayId;
    final linkId = this.linkId;
    final peerGatewayId = this.peerGatewayId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final attributes = this.attributes;
    final connectivityType = this.connectivityType;
    final direction = this.direction;
    final flowModules = this.flowModules;
    final httpResponderAllowed = this.httpResponderAllowed;
    final logSettings = this.logSettings;
    final pendingFlowModules = this.pendingFlowModules;
    final tags = this.tags;
    final timeoutInMillis = this.timeoutInMillis;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'gatewayId': gatewayId,
      'linkId': linkId,
      'peerGatewayId': peerGatewayId,
      'status': status.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (attributes != null) 'attributes': attributes,
      if (connectivityType != null) 'connectivityType': connectivityType.value,
      if (direction != null) 'direction': direction.value,
      if (flowModules != null) 'flowModules': flowModules,
      if (httpResponderAllowed != null)
        'httpResponderAllowed': httpResponderAllowed,
      if (logSettings != null) 'logSettings': logSettings,
      if (pendingFlowModules != null) 'pendingFlowModules': pendingFlowModules,
      if (tags != null) 'tags': tags,
      if (timeoutInMillis != null) 'timeoutInMillis': timeoutInMillis,
    };
  }
}

/// @nodoc
class DeleteLinkResponse {
  /// The unique identifier of the link.
  final String linkId;

  /// The status of the link.
  final LinkStatus status;

  DeleteLinkResponse({
    required this.linkId,
    required this.status,
  });

  factory DeleteLinkResponse.fromJson(Map<String, dynamic> json) {
    return DeleteLinkResponse(
      linkId: (json['linkId'] as String?) ?? '',
      status: LinkStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final linkId = this.linkId;
    final status = this.status;
    return {
      'linkId': linkId,
      'status': status.value,
    };
  }
}

/// @nodoc
class ListLinksResponse {
  /// Information about created links.
  final List<ListLinksResponseStructure>? links;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400 InvalidToken
  /// error</i>.
  final String? nextToken;

  ListLinksResponse({
    this.links,
    this.nextToken,
  });

  factory ListLinksResponse.fromJson(Map<String, dynamic> json) {
    return ListLinksResponse(
      links: (json['links'] as List?)
          ?.nonNulls
          .map((e) =>
              ListLinksResponseStructure.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final links = this.links;
    final nextToken = this.nextToken;
    return {
      if (links != null) 'links': links,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class AcceptLinkResponse {
  /// The timestamp of when the link was created.
  final DateTime createdAt;

  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The unique identifier of the link.
  final String linkId;

  /// The unique identifier of the peer gateway.
  final String peerGatewayId;

  /// The status of the link.
  final LinkStatus status;

  /// The timestamp of when the link was updated.
  final DateTime updatedAt;

  /// Attributes of the link.
  final LinkAttributes? attributes;

  /// The connectivity type of the link.
  final ConnectivityType? connectivityType;

  /// The direction of the link.
  final LinkDirection? direction;

  /// The configuration of flow modules.
  final List<ModuleConfiguration>? flowModules;
  final LinkLogSettings? logSettings;

  /// The configuration of pending flow modules.
  final List<ModuleConfiguration>? pendingFlowModules;

  AcceptLinkResponse({
    required this.createdAt,
    required this.gatewayId,
    required this.linkId,
    required this.peerGatewayId,
    required this.status,
    required this.updatedAt,
    this.attributes,
    this.connectivityType,
    this.direction,
    this.flowModules,
    this.logSettings,
    this.pendingFlowModules,
  });

  factory AcceptLinkResponse.fromJson(Map<String, dynamic> json) {
    return AcceptLinkResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      gatewayId: (json['gatewayId'] as String?) ?? '',
      linkId: (json['linkId'] as String?) ?? '',
      peerGatewayId: (json['peerGatewayId'] as String?) ?? '',
      status: LinkStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      attributes: json['attributes'] != null
          ? LinkAttributes.fromJson(json['attributes'] as Map<String, dynamic>)
          : null,
      connectivityType: (json['connectivityType'] as String?)
          ?.let(ConnectivityType.fromString),
      direction: (json['direction'] as String?)?.let(LinkDirection.fromString),
      flowModules: (json['flowModules'] as List?)
          ?.nonNulls
          .map((e) => ModuleConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      logSettings: json['logSettings'] != null
          ? LinkLogSettings.fromJson(
              json['logSettings'] as Map<String, dynamic>)
          : null,
      pendingFlowModules: (json['pendingFlowModules'] as List?)
          ?.nonNulls
          .map((e) => ModuleConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final gatewayId = this.gatewayId;
    final linkId = this.linkId;
    final peerGatewayId = this.peerGatewayId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final attributes = this.attributes;
    final connectivityType = this.connectivityType;
    final direction = this.direction;
    final flowModules = this.flowModules;
    final logSettings = this.logSettings;
    final pendingFlowModules = this.pendingFlowModules;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'gatewayId': gatewayId,
      'linkId': linkId,
      'peerGatewayId': peerGatewayId,
      'status': status.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (attributes != null) 'attributes': attributes,
      if (connectivityType != null) 'connectivityType': connectivityType.value,
      if (direction != null) 'direction': direction.value,
      if (flowModules != null) 'flowModules': flowModules,
      if (logSettings != null) 'logSettings': logSettings,
      if (pendingFlowModules != null) 'pendingFlowModules': pendingFlowModules,
    };
  }
}

/// @nodoc
class RejectLinkResponse {
  /// The timestamp of when the link was created.
  final DateTime createdAt;

  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The unique identifier of the link.
  final String linkId;

  /// The unique identifier of the peer gateway.
  final String peerGatewayId;

  /// The status of the link.
  final LinkStatus status;

  /// The timestamp of when the link was updated.
  final DateTime updatedAt;

  /// Attributes of the link.
  final LinkAttributes? attributes;

  /// The connectivity type of the link.
  final ConnectivityType? connectivityType;

  /// The direction of the link.
  final LinkDirection? direction;

  /// The configuration of flow modules.
  final List<ModuleConfiguration>? flowModules;
  final LinkLogSettings? logSettings;

  /// The configuration of pending flow modules.
  final List<ModuleConfiguration>? pendingFlowModules;

  RejectLinkResponse({
    required this.createdAt,
    required this.gatewayId,
    required this.linkId,
    required this.peerGatewayId,
    required this.status,
    required this.updatedAt,
    this.attributes,
    this.connectivityType,
    this.direction,
    this.flowModules,
    this.logSettings,
    this.pendingFlowModules,
  });

  factory RejectLinkResponse.fromJson(Map<String, dynamic> json) {
    return RejectLinkResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      gatewayId: (json['gatewayId'] as String?) ?? '',
      linkId: (json['linkId'] as String?) ?? '',
      peerGatewayId: (json['peerGatewayId'] as String?) ?? '',
      status: LinkStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      attributes: json['attributes'] != null
          ? LinkAttributes.fromJson(json['attributes'] as Map<String, dynamic>)
          : null,
      connectivityType: (json['connectivityType'] as String?)
          ?.let(ConnectivityType.fromString),
      direction: (json['direction'] as String?)?.let(LinkDirection.fromString),
      flowModules: (json['flowModules'] as List?)
          ?.nonNulls
          .map((e) => ModuleConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      logSettings: json['logSettings'] != null
          ? LinkLogSettings.fromJson(
              json['logSettings'] as Map<String, dynamic>)
          : null,
      pendingFlowModules: (json['pendingFlowModules'] as List?)
          ?.nonNulls
          .map((e) => ModuleConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final gatewayId = this.gatewayId;
    final linkId = this.linkId;
    final peerGatewayId = this.peerGatewayId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final attributes = this.attributes;
    final connectivityType = this.connectivityType;
    final direction = this.direction;
    final flowModules = this.flowModules;
    final logSettings = this.logSettings;
    final pendingFlowModules = this.pendingFlowModules;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'gatewayId': gatewayId,
      'linkId': linkId,
      'peerGatewayId': peerGatewayId,
      'status': status.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (attributes != null) 'attributes': attributes,
      if (connectivityType != null) 'connectivityType': connectivityType.value,
      if (direction != null) 'direction': direction.value,
      if (flowModules != null) 'flowModules': flowModules,
      if (logSettings != null) 'logSettings': logSettings,
      if (pendingFlowModules != null) 'pendingFlowModules': pendingFlowModules,
    };
  }
}

/// @nodoc
class UpdateLinkResponse {
  /// The unique identifier of the link.
  final String linkId;

  /// The status of the request.
  final LinkStatus status;

  UpdateLinkResponse({
    required this.linkId,
    required this.status,
  });

  factory UpdateLinkResponse.fromJson(Map<String, dynamic> json) {
    return UpdateLinkResponse(
      linkId: (json['linkId'] as String?) ?? '',
      status: LinkStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final linkId = this.linkId;
    final status = this.status;
    return {
      'linkId': linkId,
      'status': status.value,
    };
  }
}

/// @nodoc
class UpdateLinkModuleFlowResponse {
  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The unique identifier of the link.
  final String linkId;

  /// The status of the request.
  final LinkStatus status;

  UpdateLinkModuleFlowResponse({
    required this.gatewayId,
    required this.linkId,
    required this.status,
  });

  factory UpdateLinkModuleFlowResponse.fromJson(Map<String, dynamic> json) {
    return UpdateLinkModuleFlowResponse(
      gatewayId: (json['gatewayId'] as String?) ?? '',
      linkId: (json['linkId'] as String?) ?? '',
      status: LinkStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayId = this.gatewayId;
    final linkId = this.linkId;
    final status = this.status;
    return {
      'gatewayId': gatewayId,
      'linkId': linkId,
      'status': status.value,
    };
  }
}

/// @nodoc
class CreateLinkRoutingRuleResponse {
  /// The timestamp of when the routing rule was created.
  final DateTime createdAt;

  /// The unique identifier of the routing rule.
  final String ruleId;

  /// The status of the routing rule.
  final RuleStatus status;

  CreateLinkRoutingRuleResponse({
    required this.createdAt,
    required this.ruleId,
    required this.status,
  });

  factory CreateLinkRoutingRuleResponse.fromJson(Map<String, dynamic> json) {
    return CreateLinkRoutingRuleResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      ruleId: (json['ruleId'] as String?) ?? '',
      status: RuleStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final ruleId = this.ruleId;
    final status = this.status;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'ruleId': ruleId,
      'status': status.value,
    };
  }
}

/// @nodoc
class GetLinkRoutingRuleResponse {
  /// The conditions for the routing rule.
  final RuleCondition conditions;

  /// The timestamp of when the routing rule was created.
  final DateTime createdAt;

  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The unique identifier of the link.
  final String linkId;

  /// The priority of the routing rule.
  final int priority;

  /// The unique identifier of the routing rule.
  final String ruleId;

  /// The status of the routing rule.
  final RuleStatus status;

  /// The timestamp of when the routing rule was last updated.
  final DateTime updatedAt;

  /// A map of the key-value pairs for the tag or tags assigned to the specified
  /// resource.
  final Map<String, String>? tags;

  GetLinkRoutingRuleResponse({
    required this.conditions,
    required this.createdAt,
    required this.gatewayId,
    required this.linkId,
    required this.priority,
    required this.ruleId,
    required this.status,
    required this.updatedAt,
    this.tags,
  });

  factory GetLinkRoutingRuleResponse.fromJson(Map<String, dynamic> json) {
    return GetLinkRoutingRuleResponse(
      conditions: RuleCondition.fromJson(
          (json['conditions'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      gatewayId: (json['gatewayId'] as String?) ?? '',
      linkId: (json['linkId'] as String?) ?? '',
      priority: (json['priority'] as int?) ?? 0,
      ruleId: (json['ruleId'] as String?) ?? '',
      status: RuleStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final conditions = this.conditions;
    final createdAt = this.createdAt;
    final gatewayId = this.gatewayId;
    final linkId = this.linkId;
    final priority = this.priority;
    final ruleId = this.ruleId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final tags = this.tags;
    return {
      'conditions': conditions,
      'createdAt': unixTimestampToJson(createdAt),
      'gatewayId': gatewayId,
      'linkId': linkId,
      'priority': priority,
      'ruleId': ruleId,
      'status': status.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class UpdateLinkRoutingRuleResponse {
  /// The unique identifier of the routing rule.
  final String ruleId;

  /// The status of the routing rule.
  final RuleStatus status;

  /// The timestamp of when the routing rule was last updated.
  final DateTime updatedAt;

  UpdateLinkRoutingRuleResponse({
    required this.ruleId,
    required this.status,
    required this.updatedAt,
  });

  factory UpdateLinkRoutingRuleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateLinkRoutingRuleResponse(
      ruleId: (json['ruleId'] as String?) ?? '',
      status: RuleStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final ruleId = this.ruleId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'ruleId': ruleId,
      'status': status.value,
      'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class DeleteLinkRoutingRuleResponse {
  /// The unique identifier of the routing rule.
  final String ruleId;

  /// The status of the routing rule.
  final RuleStatus status;

  DeleteLinkRoutingRuleResponse({
    required this.ruleId,
    required this.status,
  });

  factory DeleteLinkRoutingRuleResponse.fromJson(Map<String, dynamic> json) {
    return DeleteLinkRoutingRuleResponse(
      ruleId: (json['ruleId'] as String?) ?? '',
      status: RuleStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final ruleId = this.ruleId;
    final status = this.status;
    return {
      'ruleId': ruleId,
      'status': status.value,
    };
  }
}

/// @nodoc
class ListLinkRoutingRulesResponse {
  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400 InvalidToken
  /// error</i>.
  final String? nextToken;

  /// The list of routing rules for the link.
  final List<LinkRoutingRuleSummary>? rules;

  ListLinkRoutingRulesResponse({
    this.nextToken,
    this.rules,
  });

  factory ListLinkRoutingRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListLinkRoutingRulesResponse(
      nextToken: json['nextToken'] as String?,
      rules: (json['rules'] as List?)
          ?.nonNulls
          .map(
              (e) => LinkRoutingRuleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final rules = this.rules;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (rules != null) 'rules': rules,
    };
  }
}

/// @nodoc
class CreateRequesterGatewayResponse {
  /// The domain name of the requester gateway.
  final String domainName;

  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The status of the request.
  final RequesterGatewayStatus status;

  CreateRequesterGatewayResponse({
    required this.domainName,
    required this.gatewayId,
    required this.status,
  });

  factory CreateRequesterGatewayResponse.fromJson(Map<String, dynamic> json) {
    return CreateRequesterGatewayResponse(
      domainName: (json['domainName'] as String?) ?? '',
      gatewayId: (json['gatewayId'] as String?) ?? '',
      status:
          RequesterGatewayStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final gatewayId = this.gatewayId;
    final status = this.status;
    return {
      'domainName': domainName,
      'gatewayId': gatewayId,
      'status': status.value,
    };
  }
}

/// @nodoc
class GetRequesterGatewayResponse {
  /// The domain name of the requester gateway.
  final String domainName;

  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The unique identifiers of the security groups.
  final List<String> securityGroupIds;

  /// The status of the request.
  final RequesterGatewayStatus status;

  /// The unique identifiers of the subnets.
  final List<String> subnetIds;

  /// The unique identifier of the Virtual Private Cloud (VPC).
  final String vpcId;

  /// The count of active links for the requester gateway.
  final int? activeLinksCount;

  /// The timestamp of when the requester gateway was created.
  final DateTime? createdAt;

  /// The description of the requester gateway.
  final String? description;

  /// A map of the key-value pairs for the tag or tags assigned to the specified
  /// resource.
  final Map<String, String>? tags;

  /// The total count of links for the requester gateway.
  final int? totalLinksCount;

  /// The timestamp of when the requester gateway was updated.
  final DateTime? updatedAt;

  GetRequesterGatewayResponse({
    required this.domainName,
    required this.gatewayId,
    required this.securityGroupIds,
    required this.status,
    required this.subnetIds,
    required this.vpcId,
    this.activeLinksCount,
    this.createdAt,
    this.description,
    this.tags,
    this.totalLinksCount,
    this.updatedAt,
  });

  factory GetRequesterGatewayResponse.fromJson(Map<String, dynamic> json) {
    return GetRequesterGatewayResponse(
      domainName: (json['domainName'] as String?) ?? '',
      gatewayId: (json['gatewayId'] as String?) ?? '',
      securityGroupIds: ((json['securityGroupIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      status:
          RequesterGatewayStatus.fromString((json['status'] as String?) ?? ''),
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: (json['vpcId'] as String?) ?? '',
      activeLinksCount: json['activeLinksCount'] as int?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      totalLinksCount: json['totalLinksCount'] as int?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final gatewayId = this.gatewayId;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    final activeLinksCount = this.activeLinksCount;
    final createdAt = this.createdAt;
    final description = this.description;
    final tags = this.tags;
    final totalLinksCount = this.totalLinksCount;
    final updatedAt = this.updatedAt;
    return {
      'domainName': domainName,
      'gatewayId': gatewayId,
      'securityGroupIds': securityGroupIds,
      'status': status.value,
      'subnetIds': subnetIds,
      'vpcId': vpcId,
      if (activeLinksCount != null) 'activeLinksCount': activeLinksCount,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
      if (totalLinksCount != null) 'totalLinksCount': totalLinksCount,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class DeleteRequesterGatewayResponse {
  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The status of the request.
  final RequesterGatewayStatus status;

  DeleteRequesterGatewayResponse({
    required this.gatewayId,
    required this.status,
  });

  factory DeleteRequesterGatewayResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRequesterGatewayResponse(
      gatewayId: (json['gatewayId'] as String?) ?? '',
      status:
          RequesterGatewayStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayId = this.gatewayId;
    final status = this.status;
    return {
      'gatewayId': gatewayId,
      'status': status.value,
    };
  }
}

/// @nodoc
class UpdateRequesterGatewayResponse {
  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The status of the request.
  final RequesterGatewayStatus status;

  UpdateRequesterGatewayResponse({
    required this.gatewayId,
    required this.status,
  });

  factory UpdateRequesterGatewayResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRequesterGatewayResponse(
      gatewayId: (json['gatewayId'] as String?) ?? '',
      status:
          RequesterGatewayStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayId = this.gatewayId;
    final status = this.status;
    return {
      'gatewayId': gatewayId,
      'status': status.value,
    };
  }
}

/// @nodoc
class CreateOutboundExternalLinkResponse {
  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The unique identifier of the link.
  final String linkId;

  /// The status of the request.
  final LinkStatus status;

  CreateOutboundExternalLinkResponse({
    required this.gatewayId,
    required this.linkId,
    required this.status,
  });

  factory CreateOutboundExternalLinkResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateOutboundExternalLinkResponse(
      gatewayId: (json['gatewayId'] as String?) ?? '',
      linkId: (json['linkId'] as String?) ?? '',
      status: LinkStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayId = this.gatewayId;
    final linkId = this.linkId;
    final status = this.status;
    return {
      'gatewayId': gatewayId,
      'linkId': linkId,
      'status': status.value,
    };
  }
}

/// @nodoc
class DeleteOutboundExternalLinkResponse {
  /// The unique identifier of the link.
  final String linkId;

  /// The status of the request.
  final LinkStatus status;

  DeleteOutboundExternalLinkResponse({
    required this.linkId,
    required this.status,
  });

  factory DeleteOutboundExternalLinkResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteOutboundExternalLinkResponse(
      linkId: (json['linkId'] as String?) ?? '',
      status: LinkStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final linkId = this.linkId;
    final status = this.status;
    return {
      'linkId': linkId,
      'status': status.value,
    };
  }
}

/// @nodoc
class GetOutboundExternalLinkResponse {
  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The unique identifier of the link.
  final String linkId;

  /// The public endpoint for the link.
  final String publicEndpoint;

  /// The status of the request.
  final LinkStatus status;
  final LinkAttributes? attributes;

  /// The connectivity type of the link.
  final ConnectivityType? connectivityType;

  /// The timestamp of when the outbound external link was created.
  final DateTime? createdAt;

  /// The configuration of flow modules.
  final List<ModuleConfiguration>? flowModules;

  /// Settings for the application logs.
  final LinkLogSettings? logSettings;

  /// The configuration of pending flow modules.
  final List<ModuleConfiguration>? pendingFlowModules;

  /// A map of the key-value pairs for the tag or tags assigned to the specified
  /// resource.
  final Map<String, String>? tags;

  /// The timestamp of when the outbound external link was updated.
  final DateTime? updatedAt;

  GetOutboundExternalLinkResponse({
    required this.gatewayId,
    required this.linkId,
    required this.publicEndpoint,
    required this.status,
    this.attributes,
    this.connectivityType,
    this.createdAt,
    this.flowModules,
    this.logSettings,
    this.pendingFlowModules,
    this.tags,
    this.updatedAt,
  });

  factory GetOutboundExternalLinkResponse.fromJson(Map<String, dynamic> json) {
    return GetOutboundExternalLinkResponse(
      gatewayId: (json['gatewayId'] as String?) ?? '',
      linkId: (json['linkId'] as String?) ?? '',
      publicEndpoint: (json['publicEndpoint'] as String?) ?? '',
      status: LinkStatus.fromString((json['status'] as String?) ?? ''),
      attributes: json['attributes'] != null
          ? LinkAttributes.fromJson(json['attributes'] as Map<String, dynamic>)
          : null,
      connectivityType: (json['connectivityType'] as String?)
          ?.let(ConnectivityType.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      flowModules: (json['flowModules'] as List?)
          ?.nonNulls
          .map((e) => ModuleConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      logSettings: json['logSettings'] != null
          ? LinkLogSettings.fromJson(
              json['logSettings'] as Map<String, dynamic>)
          : null,
      pendingFlowModules: (json['pendingFlowModules'] as List?)
          ?.nonNulls
          .map((e) => ModuleConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayId = this.gatewayId;
    final linkId = this.linkId;
    final publicEndpoint = this.publicEndpoint;
    final status = this.status;
    final attributes = this.attributes;
    final connectivityType = this.connectivityType;
    final createdAt = this.createdAt;
    final flowModules = this.flowModules;
    final logSettings = this.logSettings;
    final pendingFlowModules = this.pendingFlowModules;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      'gatewayId': gatewayId,
      'linkId': linkId,
      'publicEndpoint': publicEndpoint,
      'status': status.value,
      if (attributes != null) 'attributes': attributes,
      if (connectivityType != null) 'connectivityType': connectivityType.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (flowModules != null) 'flowModules': flowModules,
      if (logSettings != null) 'logSettings': logSettings,
      if (pendingFlowModules != null) 'pendingFlowModules': pendingFlowModules,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class CreateResponderGatewayResponse {
  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The status of the request.
  final ResponderGatewayStatus status;

  /// The external inbound endpoint for the responder gateway.
  final String? externalInboundEndpoint;

  /// The listener configuration for the responder gateway.
  final ListenerConfig? listenerConfig;

  CreateResponderGatewayResponse({
    required this.gatewayId,
    required this.status,
    this.externalInboundEndpoint,
    this.listenerConfig,
  });

  factory CreateResponderGatewayResponse.fromJson(Map<String, dynamic> json) {
    return CreateResponderGatewayResponse(
      gatewayId: (json['gatewayId'] as String?) ?? '',
      status:
          ResponderGatewayStatus.fromString((json['status'] as String?) ?? ''),
      externalInboundEndpoint: json['externalInboundEndpoint'] as String?,
      listenerConfig: json['listenerConfig'] != null
          ? ListenerConfig.fromJson(
              json['listenerConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayId = this.gatewayId;
    final status = this.status;
    final externalInboundEndpoint = this.externalInboundEndpoint;
    final listenerConfig = this.listenerConfig;
    return {
      'gatewayId': gatewayId,
      'status': status.value,
      if (externalInboundEndpoint != null)
        'externalInboundEndpoint': externalInboundEndpoint,
      if (listenerConfig != null) 'listenerConfig': listenerConfig,
    };
  }
}

/// @nodoc
class GetResponderGatewayResponse {
  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The networking port.
  final int port;

  /// The networking protocol.
  final Protocol protocol;

  /// The unique identifiers of the security groups.
  final List<String> securityGroupIds;

  /// The status of the request.
  final ResponderGatewayStatus status;

  /// The unique identifiers of the subnets.
  final List<String> subnetIds;

  /// The unique identifier of the Virtual Private Cloud (VPC).
  final String vpcId;

  /// The count of active links for the responder gateway.
  final int? activeLinksCount;

  /// The timestamp of when the responder gateway was created.
  final DateTime? createdAt;

  /// The description of the responder gateway.
  final String? description;

  /// The domain name of the responder gateway.
  final String? domainName;

  /// The external inbound endpoint for the responder gateway.
  final String? externalInboundEndpoint;

  /// The type of gateway. Valid values are <code>EXTERNAL</code> or
  /// <code>INTERNAL</code>.
  final GatewayType? gatewayType;

  /// Deprecated. Use 'linksRequestedCount' instead.
  final int? inboundLinksCount;

  /// The count of requested links waiting for the responder gateway to accept or
  /// reject.
  final int? linksRequestedCount;

  /// The listener configuration for the responder gateway.
  final ListenerConfig? listenerConfig;

  /// The configuration of the managed endpoint.
  final ManagedEndpointConfiguration? managedEndpointConfiguration;

  /// A map of the key-value pairs for the tag or tags assigned to the specified
  /// resource.
  final Map<String, String>? tags;

  /// The total count of links for the responder gateway.
  final int? totalLinksCount;

  /// The configuration of the trust store.
  final TrustStoreConfiguration? trustStoreConfiguration;

  /// The timestamp of when the responder gateway was updated.
  final DateTime? updatedAt;

  GetResponderGatewayResponse({
    required this.gatewayId,
    required this.port,
    required this.protocol,
    required this.securityGroupIds,
    required this.status,
    required this.subnetIds,
    required this.vpcId,
    this.activeLinksCount,
    this.createdAt,
    this.description,
    this.domainName,
    this.externalInboundEndpoint,
    this.gatewayType,
    this.inboundLinksCount,
    this.linksRequestedCount,
    this.listenerConfig,
    this.managedEndpointConfiguration,
    this.tags,
    this.totalLinksCount,
    this.trustStoreConfiguration,
    this.updatedAt,
  });

  factory GetResponderGatewayResponse.fromJson(Map<String, dynamic> json) {
    return GetResponderGatewayResponse(
      gatewayId: (json['gatewayId'] as String?) ?? '',
      port: (json['port'] as int?) ?? 0,
      protocol: Protocol.fromString((json['protocol'] as String?) ?? ''),
      securityGroupIds: ((json['securityGroupIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      status:
          ResponderGatewayStatus.fromString((json['status'] as String?) ?? ''),
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: (json['vpcId'] as String?) ?? '',
      activeLinksCount: json['activeLinksCount'] as int?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      domainName: json['domainName'] as String?,
      externalInboundEndpoint: json['externalInboundEndpoint'] as String?,
      gatewayType:
          (json['gatewayType'] as String?)?.let(GatewayType.fromString),
      inboundLinksCount: json['inboundLinksCount'] as int?,
      linksRequestedCount: json['linksRequestedCount'] as int?,
      listenerConfig: json['listenerConfig'] != null
          ? ListenerConfig.fromJson(
              json['listenerConfig'] as Map<String, dynamic>)
          : null,
      managedEndpointConfiguration: json['managedEndpointConfiguration'] != null
          ? ManagedEndpointConfiguration.fromJson(
              json['managedEndpointConfiguration'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      totalLinksCount: json['totalLinksCount'] as int?,
      trustStoreConfiguration: json['trustStoreConfiguration'] != null
          ? TrustStoreConfiguration.fromJson(
              json['trustStoreConfiguration'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayId = this.gatewayId;
    final port = this.port;
    final protocol = this.protocol;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    final activeLinksCount = this.activeLinksCount;
    final createdAt = this.createdAt;
    final description = this.description;
    final domainName = this.domainName;
    final externalInboundEndpoint = this.externalInboundEndpoint;
    final gatewayType = this.gatewayType;
    final inboundLinksCount = this.inboundLinksCount;
    final linksRequestedCount = this.linksRequestedCount;
    final listenerConfig = this.listenerConfig;
    final managedEndpointConfiguration = this.managedEndpointConfiguration;
    final tags = this.tags;
    final totalLinksCount = this.totalLinksCount;
    final trustStoreConfiguration = this.trustStoreConfiguration;
    final updatedAt = this.updatedAt;
    return {
      'gatewayId': gatewayId,
      'port': port,
      'protocol': protocol.value,
      'securityGroupIds': securityGroupIds,
      'status': status.value,
      'subnetIds': subnetIds,
      'vpcId': vpcId,
      if (activeLinksCount != null) 'activeLinksCount': activeLinksCount,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (domainName != null) 'domainName': domainName,
      if (externalInboundEndpoint != null)
        'externalInboundEndpoint': externalInboundEndpoint,
      if (gatewayType != null) 'gatewayType': gatewayType.value,
      if (inboundLinksCount != null) 'inboundLinksCount': inboundLinksCount,
      if (linksRequestedCount != null)
        'linksRequestedCount': linksRequestedCount,
      if (listenerConfig != null) 'listenerConfig': listenerConfig,
      if (managedEndpointConfiguration != null)
        'managedEndpointConfiguration': managedEndpointConfiguration,
      if (tags != null) 'tags': tags,
      if (totalLinksCount != null) 'totalLinksCount': totalLinksCount,
      if (trustStoreConfiguration != null)
        'trustStoreConfiguration': trustStoreConfiguration,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class DeleteResponderGatewayResponse {
  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The status of the request.
  final ResponderGatewayStatus status;

  DeleteResponderGatewayResponse({
    required this.gatewayId,
    required this.status,
  });

  factory DeleteResponderGatewayResponse.fromJson(Map<String, dynamic> json) {
    return DeleteResponderGatewayResponse(
      gatewayId: (json['gatewayId'] as String?) ?? '',
      status:
          ResponderGatewayStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayId = this.gatewayId;
    final status = this.status;
    return {
      'gatewayId': gatewayId,
      'status': status.value,
    };
  }
}

/// @nodoc
class AssociateCertificateResponse {
  /// The Amazon Resource Name (ARN) of the ACM certificate.
  final String acmCertificateArn;

  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The status of the certificate association.
  final CertificateAssociationStatus status;

  AssociateCertificateResponse({
    required this.acmCertificateArn,
    required this.gatewayId,
    required this.status,
  });

  factory AssociateCertificateResponse.fromJson(Map<String, dynamic> json) {
    return AssociateCertificateResponse(
      acmCertificateArn: (json['acmCertificateArn'] as String?) ?? '',
      gatewayId: (json['gatewayId'] as String?) ?? '',
      status: CertificateAssociationStatus.fromString(
          (json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final acmCertificateArn = this.acmCertificateArn;
    final gatewayId = this.gatewayId;
    final status = this.status;
    return {
      'acmCertificateArn': acmCertificateArn,
      'gatewayId': gatewayId,
      'status': status.value,
    };
  }
}

/// @nodoc
class DisassociateCertificateResponse {
  /// The Amazon Resource Name (ARN) of the ACM certificate.
  final String acmCertificateArn;

  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The status of the certificate association.
  final CertificateAssociationStatus status;

  DisassociateCertificateResponse({
    required this.acmCertificateArn,
    required this.gatewayId,
    required this.status,
  });

  factory DisassociateCertificateResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateCertificateResponse(
      acmCertificateArn: (json['acmCertificateArn'] as String?) ?? '',
      gatewayId: (json['gatewayId'] as String?) ?? '',
      status: CertificateAssociationStatus.fromString(
          (json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final acmCertificateArn = this.acmCertificateArn;
    final gatewayId = this.gatewayId;
    final status = this.status;
    return {
      'acmCertificateArn': acmCertificateArn,
      'gatewayId': gatewayId,
      'status': status.value,
    };
  }
}

/// @nodoc
class GetCertificateAssociationResponse {
  /// The Amazon Resource Name (ARN) of the ACM certificate.
  final String acmCertificateArn;

  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The status of the certificate association.
  final CertificateAssociationStatus status;

  /// The timestamp of when the certificate was associated.
  final DateTime? associatedAt;

  /// The timestamp of when the certificate association was last updated.
  final DateTime? updatedAt;

  GetCertificateAssociationResponse({
    required this.acmCertificateArn,
    required this.gatewayId,
    required this.status,
    this.associatedAt,
    this.updatedAt,
  });

  factory GetCertificateAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCertificateAssociationResponse(
      acmCertificateArn: (json['acmCertificateArn'] as String?) ?? '',
      gatewayId: (json['gatewayId'] as String?) ?? '',
      status: CertificateAssociationStatus.fromString(
          (json['status'] as String?) ?? ''),
      associatedAt: timeStampFromJson(json['associatedAt']),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final acmCertificateArn = this.acmCertificateArn;
    final gatewayId = this.gatewayId;
    final status = this.status;
    final associatedAt = this.associatedAt;
    final updatedAt = this.updatedAt;
    return {
      'acmCertificateArn': acmCertificateArn,
      'gatewayId': gatewayId,
      'status': status.value,
      if (associatedAt != null)
        'associatedAt': unixTimestampToJson(associatedAt),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class ListCertificateAssociationsResponse {
  /// The list of certificate associations for the gateway.
  final List<CertificateAssociationSummary> certificateAssociations;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400 InvalidToken
  /// error</i>.
  final String? nextToken;

  ListCertificateAssociationsResponse({
    required this.certificateAssociations,
    this.nextToken,
  });

  factory ListCertificateAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCertificateAssociationsResponse(
      certificateAssociations: ((json['certificateAssociations'] as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              CertificateAssociationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAssociations = this.certificateAssociations;
    final nextToken = this.nextToken;
    return {
      'certificateAssociations': certificateAssociations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class UpdateResponderGatewayResponse {
  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The status of the request.
  final ResponderGatewayStatus status;

  UpdateResponderGatewayResponse({
    required this.gatewayId,
    required this.status,
  });

  factory UpdateResponderGatewayResponse.fromJson(Map<String, dynamic> json) {
    return UpdateResponderGatewayResponse(
      gatewayId: (json['gatewayId'] as String?) ?? '',
      status:
          ResponderGatewayStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayId = this.gatewayId;
    final status = this.status;
    return {
      'gatewayId': gatewayId,
      'status': status.value,
    };
  }
}

/// @nodoc
class CreateInboundExternalLinkResponse {
  /// The domain name.
  final String domainName;

  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The unique identifier of the link.
  final String linkId;

  /// The status of the request.
  final LinkStatus status;

  CreateInboundExternalLinkResponse({
    required this.domainName,
    required this.gatewayId,
    required this.linkId,
    required this.status,
  });

  factory CreateInboundExternalLinkResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateInboundExternalLinkResponse(
      domainName: (json['domainName'] as String?) ?? '',
      gatewayId: (json['gatewayId'] as String?) ?? '',
      linkId: (json['linkId'] as String?) ?? '',
      status: LinkStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final gatewayId = this.gatewayId;
    final linkId = this.linkId;
    final status = this.status;
    return {
      'domainName': domainName,
      'gatewayId': gatewayId,
      'linkId': linkId,
      'status': status.value,
    };
  }
}

/// @nodoc
class DeleteInboundExternalLinkResponse {
  /// The unique identifier of the link.
  final String linkId;

  /// The status of the request.
  final LinkStatus status;

  DeleteInboundExternalLinkResponse({
    required this.linkId,
    required this.status,
  });

  factory DeleteInboundExternalLinkResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteInboundExternalLinkResponse(
      linkId: (json['linkId'] as String?) ?? '',
      status: LinkStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final linkId = this.linkId;
    final status = this.status;
    return {
      'linkId': linkId,
      'status': status.value,
    };
  }
}

/// @nodoc
class GetInboundExternalLinkResponse {
  /// The domain name.
  final String domainName;

  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The unique identifier of the link.
  final String linkId;

  /// The status of the request.
  final LinkStatus status;

  /// Attributes of the link.
  final LinkAttributes? attributes;

  /// The connectivity type of the link.
  final ConnectivityType? connectivityType;

  /// The timestamp of when the inbound external link was created.
  final DateTime? createdAt;

  /// The configuration of flow modules.
  final List<ModuleConfiguration>? flowModules;

  /// Settings for the application logs.
  final LinkLogSettings? logSettings;

  /// The configuration of pending flow modules.
  final List<ModuleConfiguration>? pendingFlowModules;

  /// A map of the key-value pairs for the tag or tags assigned to the specified
  /// resource.
  final Map<String, String>? tags;

  /// The timestamp of when the inbound external link was updated.
  final DateTime? updatedAt;

  GetInboundExternalLinkResponse({
    required this.domainName,
    required this.gatewayId,
    required this.linkId,
    required this.status,
    this.attributes,
    this.connectivityType,
    this.createdAt,
    this.flowModules,
    this.logSettings,
    this.pendingFlowModules,
    this.tags,
    this.updatedAt,
  });

  factory GetInboundExternalLinkResponse.fromJson(Map<String, dynamic> json) {
    return GetInboundExternalLinkResponse(
      domainName: (json['domainName'] as String?) ?? '',
      gatewayId: (json['gatewayId'] as String?) ?? '',
      linkId: (json['linkId'] as String?) ?? '',
      status: LinkStatus.fromString((json['status'] as String?) ?? ''),
      attributes: json['attributes'] != null
          ? LinkAttributes.fromJson(json['attributes'] as Map<String, dynamic>)
          : null,
      connectivityType: (json['connectivityType'] as String?)
          ?.let(ConnectivityType.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      flowModules: (json['flowModules'] as List?)
          ?.nonNulls
          .map((e) => ModuleConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      logSettings: json['logSettings'] != null
          ? LinkLogSettings.fromJson(
              json['logSettings'] as Map<String, dynamic>)
          : null,
      pendingFlowModules: (json['pendingFlowModules'] as List?)
          ?.nonNulls
          .map((e) => ModuleConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final gatewayId = this.gatewayId;
    final linkId = this.linkId;
    final status = this.status;
    final attributes = this.attributes;
    final connectivityType = this.connectivityType;
    final createdAt = this.createdAt;
    final flowModules = this.flowModules;
    final logSettings = this.logSettings;
    final pendingFlowModules = this.pendingFlowModules;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      'domainName': domainName,
      'gatewayId': gatewayId,
      'linkId': linkId,
      'status': status.value,
      if (attributes != null) 'attributes': attributes,
      if (connectivityType != null) 'connectivityType': connectivityType.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (flowModules != null) 'flowModules': flowModules,
      if (logSettings != null) 'logSettings': logSettings,
      if (pendingFlowModules != null) 'pendingFlowModules': pendingFlowModules,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class LinkStatus {
  static const pendingCreation = LinkStatus._('PENDING_CREATION');
  static const pendingRequest = LinkStatus._('PENDING_REQUEST');
  static const requested = LinkStatus._('REQUESTED');
  static const accepted = LinkStatus._('ACCEPTED');
  static const active = LinkStatus._('ACTIVE');
  static const rejected = LinkStatus._('REJECTED');
  static const failed = LinkStatus._('FAILED');
  static const pendingDeletion = LinkStatus._('PENDING_DELETION');
  static const deleted = LinkStatus._('DELETED');
  static const pendingUpdate = LinkStatus._('PENDING_UPDATE');
  static const pendingIsolation = LinkStatus._('PENDING_ISOLATION');
  static const isolated = LinkStatus._('ISOLATED');
  static const pendingRestoration = LinkStatus._('PENDING_RESTORATION');

  final String value;

  const LinkStatus._(this.value);

  static const values = [
    pendingCreation,
    pendingRequest,
    requested,
    accepted,
    active,
    rejected,
    failed,
    pendingDeletion,
    deleted,
    pendingUpdate,
    pendingIsolation,
    isolated,
    pendingRestoration
  ];

  static LinkStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LinkStatus._(value));

  @override
  bool operator ==(other) => other is LinkStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the attributes of a link.
///
/// @nodoc
class LinkAttributes {
  /// The customer-provided unique identifier of the link.
  final String? customerProvidedId;

  /// Describes the masking for HTTP error codes.
  final List<ResponderErrorMaskingForHttpCode>? responderErrorMasking;

  LinkAttributes({
    this.customerProvidedId,
    this.responderErrorMasking,
  });

  factory LinkAttributes.fromJson(Map<String, dynamic> json) {
    return LinkAttributes(
      customerProvidedId: json['customerProvidedId'] as String?,
      responderErrorMasking: (json['responderErrorMasking'] as List?)
          ?.nonNulls
          .map((e) => ResponderErrorMaskingForHttpCode.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customerProvidedId = this.customerProvidedId;
    final responderErrorMasking = this.responderErrorMasking;
    return {
      if (customerProvidedId != null) 'customerProvidedId': customerProvidedId,
      if (responderErrorMasking != null)
        'responderErrorMasking': responderErrorMasking,
    };
  }
}

/// Describes the settings for a link log.
///
/// @nodoc
class LinkLogSettings {
  /// Describes the configuration of a link application log.
  final LinkApplicationLogConfiguration applicationLogs;

  LinkLogSettings({
    required this.applicationLogs,
  });

  factory LinkLogSettings.fromJson(Map<String, dynamic> json) {
    return LinkLogSettings(
      applicationLogs: LinkApplicationLogConfiguration.fromJson(
          (json['applicationLogs'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationLogs = this.applicationLogs;
    return {
      'applicationLogs': applicationLogs,
    };
  }
}

/// The connectivity type for a link or gateway.
///
/// @nodoc
class ConnectivityType {
  static const $default = ConnectivityType._('DEFAULT');
  static const publicIngress = ConnectivityType._('PUBLIC_INGRESS');
  static const publicEgress = ConnectivityType._('PUBLIC_EGRESS');
  static const externalInbound = ConnectivityType._('EXTERNAL_INBOUND');

  final String value;

  const ConnectivityType._(this.value);

  static const values = [
    $default,
    publicIngress,
    publicEgress,
    externalInbound
  ];

  static ConnectivityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectivityType._(value));

  @override
  bool operator ==(other) => other is ConnectivityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the configuration of a link application log.
///
/// @nodoc
class LinkApplicationLogConfiguration {
  /// Describes a link application log sample.
  final LinkApplicationLogSampling sampling;

  LinkApplicationLogConfiguration({
    required this.sampling,
  });

  factory LinkApplicationLogConfiguration.fromJson(Map<String, dynamic> json) {
    return LinkApplicationLogConfiguration(
      sampling: LinkApplicationLogSampling.fromJson(
          (json['sampling'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final sampling = this.sampling;
    return {
      'sampling': sampling,
    };
  }
}

/// Describes a link application log sample.
///
/// @nodoc
class LinkApplicationLogSampling {
  /// An error log entry.
  final double errorLog;

  /// A filter log entry.
  final double filterLog;

  LinkApplicationLogSampling({
    required this.errorLog,
    required this.filterLog,
  });

  factory LinkApplicationLogSampling.fromJson(Map<String, dynamic> json) {
    return LinkApplicationLogSampling(
      errorLog: (json['errorLog'] as double?) ?? 0,
      filterLog: (json['filterLog'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final errorLog = this.errorLog;
    final filterLog = this.filterLog;
    return {
      'errorLog': errorLog,
      'filterLog': filterLog,
    };
  }
}

/// Describes the masking for HTTP error codes.
///
/// @nodoc
class ResponderErrorMaskingForHttpCode {
  /// The action for the error..
  final ResponderErrorMaskingAction action;

  /// The HTTP error code.
  final String httpCode;

  /// The error log type.
  final List<ResponderErrorMaskingLoggingType> loggingTypes;

  /// The percentage of response logging.
  final double? responseLoggingPercentage;

  ResponderErrorMaskingForHttpCode({
    required this.action,
    required this.httpCode,
    required this.loggingTypes,
    this.responseLoggingPercentage,
  });

  factory ResponderErrorMaskingForHttpCode.fromJson(Map<String, dynamic> json) {
    return ResponderErrorMaskingForHttpCode(
      action: ResponderErrorMaskingAction.fromString(
          (json['action'] as String?) ?? ''),
      httpCode: (json['httpCode'] as String?) ?? '',
      loggingTypes: ((json['loggingTypes'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => ResponderErrorMaskingLoggingType.fromString((e as String)))
          .toList(),
      responseLoggingPercentage: json['responseLoggingPercentage'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final httpCode = this.httpCode;
    final loggingTypes = this.loggingTypes;
    final responseLoggingPercentage = this.responseLoggingPercentage;
    return {
      'action': action.value,
      'httpCode': httpCode,
      'loggingTypes': loggingTypes.map((e) => e.value).toList(),
      if (responseLoggingPercentage != null)
        'responseLoggingPercentage': responseLoggingPercentage,
    };
  }
}

/// @nodoc
class ResponderErrorMaskingAction {
  static const noBid = ResponderErrorMaskingAction._('NO_BID');
  static const passthrough = ResponderErrorMaskingAction._('PASSTHROUGH');

  final String value;

  const ResponderErrorMaskingAction._(this.value);

  static const values = [noBid, passthrough];

  static ResponderErrorMaskingAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResponderErrorMaskingAction._(value));

  @override
  bool operator ==(other) =>
      other is ResponderErrorMaskingAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ResponderErrorMaskingLoggingType {
  static const none = ResponderErrorMaskingLoggingType._('NONE');
  static const metric = ResponderErrorMaskingLoggingType._('METRIC');
  static const response = ResponderErrorMaskingLoggingType._('RESPONSE');

  final String value;

  const ResponderErrorMaskingLoggingType._(this.value);

  static const values = [none, metric, response];

  static ResponderErrorMaskingLoggingType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResponderErrorMaskingLoggingType._(value));

  @override
  bool operator ==(other) =>
      other is ResponderErrorMaskingLoggingType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the configuration of a module.
///
/// @nodoc
class ModuleConfiguration {
  /// The name of the module.
  final String name;

  /// The dependencies of the module.
  final List<String>? dependsOn;

  /// Describes the parameters of a module.
  final ModuleParameters? moduleParameters;

  /// The version of the module.
  final String? version;

  ModuleConfiguration({
    required this.name,
    this.dependsOn,
    this.moduleParameters,
    this.version,
  });

  factory ModuleConfiguration.fromJson(Map<String, dynamic> json) {
    return ModuleConfiguration(
      name: (json['name'] as String?) ?? '',
      dependsOn: (json['dependsOn'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      moduleParameters: json['moduleParameters'] != null
          ? ModuleParameters.fromJson(
              json['moduleParameters'] as Map<String, dynamic>)
          : null,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final dependsOn = this.dependsOn;
    final moduleParameters = this.moduleParameters;
    final version = this.version;
    return {
      'name': name,
      if (dependsOn != null) 'dependsOn': dependsOn,
      if (moduleParameters != null) 'moduleParameters': moduleParameters,
      if (version != null) 'version': version,
    };
  }
}

/// Describes the parameters of a module.
///
/// @nodoc
class ModuleParameters {
  /// Describes the parameters of a no bid module.
  final NoBidModuleParameters? noBid;

  /// Describes the parameters of an open RTB attribute module.
  final OpenRtbAttributeModuleParameters? openRtbAttribute;

  /// Describes the parameters of a rate limit.
  final RateLimiterModuleParameters? rateLimiter;

  ModuleParameters({
    this.noBid,
    this.openRtbAttribute,
    this.rateLimiter,
  });

  factory ModuleParameters.fromJson(Map<String, dynamic> json) {
    return ModuleParameters(
      noBid: json['noBid'] != null
          ? NoBidModuleParameters.fromJson(
              json['noBid'] as Map<String, dynamic>)
          : null,
      openRtbAttribute: json['openRtbAttribute'] != null
          ? OpenRtbAttributeModuleParameters.fromJson(
              json['openRtbAttribute'] as Map<String, dynamic>)
          : null,
      rateLimiter: json['rateLimiter'] != null
          ? RateLimiterModuleParameters.fromJson(
              json['rateLimiter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final noBid = this.noBid;
    final openRtbAttribute = this.openRtbAttribute;
    final rateLimiter = this.rateLimiter;
    return {
      if (noBid != null) 'noBid': noBid,
      if (openRtbAttribute != null) 'openRtbAttribute': openRtbAttribute,
      if (rateLimiter != null) 'rateLimiter': rateLimiter,
    };
  }
}

/// Describes the parameters of a no bid module.
///
/// @nodoc
class NoBidModuleParameters {
  /// The pass through percentage.
  final double? passThroughPercentage;

  /// The reason description.
  final String? reason;

  /// The reason code.
  final int? reasonCode;

  NoBidModuleParameters({
    this.passThroughPercentage,
    this.reason,
    this.reasonCode,
  });

  factory NoBidModuleParameters.fromJson(Map<String, dynamic> json) {
    return NoBidModuleParameters(
      passThroughPercentage: json['passThroughPercentage'] as double?,
      reason: json['reason'] as String?,
      reasonCode: json['reasonCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final passThroughPercentage = this.passThroughPercentage;
    final reason = this.reason;
    final reasonCode = this.reasonCode;
    return {
      if (passThroughPercentage != null)
        'passThroughPercentage': passThroughPercentage,
      if (reason != null) 'reason': reason,
      if (reasonCode != null) 'reasonCode': reasonCode,
    };
  }
}

/// Describes the parameters of an open RTB attribute module.
///
/// @nodoc
class OpenRtbAttributeModuleParameters {
  /// Describes a bid action.
  final Action action;

  /// Describes the configuration of a filter.
  final List<Filter> filterConfiguration;

  /// The filter type.
  final FilterType filterType;

  /// The hold back percentage.
  final double holdbackPercentage;

  OpenRtbAttributeModuleParameters({
    required this.action,
    required this.filterConfiguration,
    required this.filterType,
    required this.holdbackPercentage,
  });

  factory OpenRtbAttributeModuleParameters.fromJson(Map<String, dynamic> json) {
    return OpenRtbAttributeModuleParameters(
      action: Action.fromJson((json['action'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      filterConfiguration: ((json['filterConfiguration'] as List?) ?? const [])
          .nonNulls
          .map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
      filterType: FilterType.fromString((json['filterType'] as String?) ?? ''),
      holdbackPercentage: (json['holdbackPercentage'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final filterConfiguration = this.filterConfiguration;
    final filterType = this.filterType;
    final holdbackPercentage = this.holdbackPercentage;
    return {
      'action': action,
      'filterConfiguration': filterConfiguration,
      'filterType': filterType.value,
      'holdbackPercentage': holdbackPercentage,
    };
  }
}

/// Describes the parameters of a rate limit.
///
/// @nodoc
class RateLimiterModuleParameters {
  /// The transactions per second rate limit.
  final double? tps;

  RateLimiterModuleParameters({
    this.tps,
  });

  factory RateLimiterModuleParameters.fromJson(Map<String, dynamic> json) {
    return RateLimiterModuleParameters(
      tps: json['tps'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final tps = this.tps;
    return {
      if (tps != null) 'tps': tps,
    };
  }
}

/// @nodoc
class FilterType {
  static const include = FilterType._('INCLUDE');
  static const exclude = FilterType._('EXCLUDE');

  final String value;

  const FilterType._(this.value);

  static const values = [include, exclude];

  static FilterType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FilterType._(value));

  @override
  bool operator ==(other) => other is FilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes a bid action.
///
/// @nodoc
class Action {
  /// Describes the header tag for a bid action.
  final HeaderTagAction? headerTag;

  /// Describes a no bid action.
  final NoBidAction? noBid;

  Action({
    this.headerTag,
    this.noBid,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      headerTag: json['headerTag'] != null
          ? HeaderTagAction.fromJson(json['headerTag'] as Map<String, dynamic>)
          : null,
      noBid: json['noBid'] != null
          ? NoBidAction.fromJson(json['noBid'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final headerTag = this.headerTag;
    final noBid = this.noBid;
    return {
      if (headerTag != null) 'headerTag': headerTag,
      if (noBid != null) 'noBid': noBid,
    };
  }
}

/// Describes a no bid action.
///
/// @nodoc
class NoBidAction {
  /// The reason code for the no bid action.
  final int? noBidReasonCode;

  NoBidAction({
    this.noBidReasonCode,
  });

  factory NoBidAction.fromJson(Map<String, dynamic> json) {
    return NoBidAction(
      noBidReasonCode: json['noBidReasonCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final noBidReasonCode = this.noBidReasonCode;
    return {
      if (noBidReasonCode != null) 'noBidReasonCode': noBidReasonCode,
    };
  }
}

/// Describes the header tag for a bid action.
///
/// @nodoc
class HeaderTagAction {
  /// The name of the bid action.
  final String name;

  /// The value of the bid action.
  final String value;

  HeaderTagAction({
    required this.name,
    required this.value,
  });

  factory HeaderTagAction.fromJson(Map<String, dynamic> json) {
    return HeaderTagAction(
      name: (json['name'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

/// Describes the configuration of a filter.
///
/// @nodoc
class Filter {
  /// Describes the criteria for a filter.
  final List<FilterCriterion> criteria;

  Filter({
    required this.criteria,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      criteria: ((json['criteria'] as List?) ?? const [])
          .nonNulls
          .map((e) => FilterCriterion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final criteria = this.criteria;
    return {
      'criteria': criteria,
    };
  }
}

/// Describes the criteria for a filter.
///
/// @nodoc
class FilterCriterion {
  /// The path to filter.
  final String path;

  /// The value to filter.
  final List<String> values;

  FilterCriterion({
    required this.path,
    required this.values,
  });

  factory FilterCriterion.fromJson(Map<String, dynamic> json) {
    return FilterCriterion(
      path: (json['path'] as String?) ?? '',
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    final values = this.values;
    return {
      'path': path,
      'values': values,
    };
  }
}

/// @nodoc
class ResponderGatewayStatus {
  static const pendingCreation = ResponderGatewayStatus._('PENDING_CREATION');
  static const active = ResponderGatewayStatus._('ACTIVE');
  static const pendingDeletion = ResponderGatewayStatus._('PENDING_DELETION');
  static const deleted = ResponderGatewayStatus._('DELETED');
  static const error = ResponderGatewayStatus._('ERROR');
  static const pendingUpdate = ResponderGatewayStatus._('PENDING_UPDATE');
  static const isolated = ResponderGatewayStatus._('ISOLATED');
  static const pendingIsolation = ResponderGatewayStatus._('PENDING_ISOLATION');
  static const pendingRestoration =
      ResponderGatewayStatus._('PENDING_RESTORATION');

  final String value;

  const ResponderGatewayStatus._(this.value);

  static const values = [
    pendingCreation,
    active,
    pendingDeletion,
    deleted,
    error,
    pendingUpdate,
    isolated,
    pendingIsolation,
    pendingRestoration
  ];

  static ResponderGatewayStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResponderGatewayStatus._(value));

  @override
  bool operator ==(other) =>
      other is ResponderGatewayStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Protocol {
  static const http = Protocol._('HTTP');
  static const https = Protocol._('HTTPS');

  final String value;

  const Protocol._(this.value);

  static const values = [http, https];

  static Protocol fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Protocol._(value));

  @override
  bool operator ==(other) => other is Protocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Listener configuration for the protocols (HTTP, HTTPS, or both) accepted by
/// the gateway.
///
/// @nodoc
class ListenerConfig {
  /// The protocol for connections from clients to the gateway
  final List<Protocol> protocols;

  ListenerConfig({
    required this.protocols,
  });

  factory ListenerConfig.fromJson(Map<String, dynamic> json) {
    return ListenerConfig(
      protocols: ((json['protocols'] as List?) ?? const [])
          .nonNulls
          .map((e) => Protocol.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final protocols = this.protocols;
    return {
      'protocols': protocols.map((e) => e.value).toList(),
    };
  }
}

/// Describes the configuration of a trust store.
///
/// @nodoc
class TrustStoreConfiguration {
  /// The certificate authority certificate.
  final List<String> certificateAuthorityCertificates;

  TrustStoreConfiguration({
    required this.certificateAuthorityCertificates,
  });

  factory TrustStoreConfiguration.fromJson(Map<String, dynamic> json) {
    return TrustStoreConfiguration(
      certificateAuthorityCertificates:
          ((json['certificateAuthorityCertificates'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAuthorityCertificates =
        this.certificateAuthorityCertificates;
    return {
      'certificateAuthorityCertificates': certificateAuthorityCertificates,
    };
  }
}

/// Describes the configuration of a managed endpoint.
///
/// @nodoc
class ManagedEndpointConfiguration {
  /// Describes the configuration of an auto scaling group.
  final AutoScalingGroupsConfiguration? autoScalingGroups;

  /// Describes the configuration of an Amazon Elastic Kubernetes Service
  /// endpoint.
  final EksEndpointsConfiguration? eksEndpoints;

  ManagedEndpointConfiguration({
    this.autoScalingGroups,
    this.eksEndpoints,
  });

  factory ManagedEndpointConfiguration.fromJson(Map<String, dynamic> json) {
    return ManagedEndpointConfiguration(
      autoScalingGroups: json['autoScalingGroups'] != null
          ? AutoScalingGroupsConfiguration.fromJson(
              json['autoScalingGroups'] as Map<String, dynamic>)
          : null,
      eksEndpoints: json['eksEndpoints'] != null
          ? EksEndpointsConfiguration.fromJson(
              json['eksEndpoints'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingGroups = this.autoScalingGroups;
    final eksEndpoints = this.eksEndpoints;
    return {
      if (autoScalingGroups != null) 'autoScalingGroups': autoScalingGroups,
      if (eksEndpoints != null) 'eksEndpoints': eksEndpoints,
    };
  }
}

/// Describes the configuration of an auto scaling group.
///
/// @nodoc
class AutoScalingGroupsConfiguration {
  /// The names of the auto scaling group.
  final List<String> autoScalingGroupNames;

  /// The role ARN of the auto scaling group.
  final String roleArn;

  /// The health check configuration for the Auto Scaling group managed endpoint.
  final HealthCheckConfig? healthCheckConfig;

  AutoScalingGroupsConfiguration({
    required this.autoScalingGroupNames,
    required this.roleArn,
    this.healthCheckConfig,
  });

  factory AutoScalingGroupsConfiguration.fromJson(Map<String, dynamic> json) {
    return AutoScalingGroupsConfiguration(
      autoScalingGroupNames:
          ((json['autoScalingGroupNames'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
      roleArn: (json['roleArn'] as String?) ?? '',
      healthCheckConfig: json['healthCheckConfig'] != null
          ? HealthCheckConfig.fromJson(
              json['healthCheckConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingGroupNames = this.autoScalingGroupNames;
    final roleArn = this.roleArn;
    final healthCheckConfig = this.healthCheckConfig;
    return {
      'autoScalingGroupNames': autoScalingGroupNames,
      'roleArn': roleArn,
      if (healthCheckConfig != null) 'healthCheckConfig': healthCheckConfig,
    };
  }
}

/// Describes the configuration of an Amazon Elastic Kubernetes Service
/// endpoint.
///
/// @nodoc
class EksEndpointsConfiguration {
  /// The CA certificate chain of the cluster API server.
  final String clusterApiServerCaCertificateChain;

  /// The URI of the cluster API server endpoint.
  final String clusterApiServerEndpointUri;

  /// The name of the cluster.
  final String clusterName;

  /// The name of the endpoint resource.
  final String endpointsResourceName;

  /// The namespace of the endpoint resource.
  final String endpointsResourceNamespace;

  /// The role ARN for the cluster.
  final String roleArn;

  EksEndpointsConfiguration({
    required this.clusterApiServerCaCertificateChain,
    required this.clusterApiServerEndpointUri,
    required this.clusterName,
    required this.endpointsResourceName,
    required this.endpointsResourceNamespace,
    required this.roleArn,
  });

  factory EksEndpointsConfiguration.fromJson(Map<String, dynamic> json) {
    return EksEndpointsConfiguration(
      clusterApiServerCaCertificateChain:
          (json['clusterApiServerCaCertificateChain'] as String?) ?? '',
      clusterApiServerEndpointUri:
          (json['clusterApiServerEndpointUri'] as String?) ?? '',
      clusterName: (json['clusterName'] as String?) ?? '',
      endpointsResourceName: (json['endpointsResourceName'] as String?) ?? '',
      endpointsResourceNamespace:
          (json['endpointsResourceNamespace'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final clusterApiServerCaCertificateChain =
        this.clusterApiServerCaCertificateChain;
    final clusterApiServerEndpointUri = this.clusterApiServerEndpointUri;
    final clusterName = this.clusterName;
    final endpointsResourceName = this.endpointsResourceName;
    final endpointsResourceNamespace = this.endpointsResourceNamespace;
    final roleArn = this.roleArn;
    return {
      'clusterApiServerCaCertificateChain': clusterApiServerCaCertificateChain,
      'clusterApiServerEndpointUri': clusterApiServerEndpointUri,
      'clusterName': clusterName,
      'endpointsResourceName': endpointsResourceName,
      'endpointsResourceNamespace': endpointsResourceNamespace,
      'roleArn': roleArn,
    };
  }
}

/// The health check configuration for a managed endpoint. Defines how the
/// service probes instances in the Auto Scaling group to determine their health
/// status.
///
/// @nodoc
class HealthCheckConfig {
  /// The destination path for the health check request. Must start with
  /// <code>/</code>.
  final String path;

  /// The port to use for health check probes. Valid range is 80 to 65535.
  final int port;

  /// The number of consecutive successful health checks required before an
  /// instance is considered healthy. Valid range is 2 to 10.
  final int? healthyThresholdCount;

  /// The interval between health check probes, in seconds. Valid range is 5 to
  /// 60.
  final int? intervalSeconds;

  /// The protocol to use for health check probes.
  final Protocol? protocol;

  /// The expected HTTP status code or status code pattern from healthy instances.
  /// Supports a single code (for example, <code>200</code>), a range (for
  /// example, <code>200-299</code>), or a comma-separated list (for example,
  /// <code>200,204</code>).
  final String? statusCodeMatcher;

  /// The timeout for each health check probe, in milliseconds. Valid range is 100
  /// to 5000.
  final int? timeoutMs;

  /// The number of consecutive failed health checks required before an instance
  /// is considered unhealthy. Valid range is 2 to 10.
  final int? unhealthyThresholdCount;

  HealthCheckConfig({
    required this.path,
    required this.port,
    this.healthyThresholdCount,
    this.intervalSeconds,
    this.protocol,
    this.statusCodeMatcher,
    this.timeoutMs,
    this.unhealthyThresholdCount,
  });

  factory HealthCheckConfig.fromJson(Map<String, dynamic> json) {
    return HealthCheckConfig(
      path: (json['path'] as String?) ?? '',
      port: (json['port'] as int?) ?? 0,
      healthyThresholdCount: json['healthyThresholdCount'] as int?,
      intervalSeconds: json['intervalSeconds'] as int?,
      protocol: (json['protocol'] as String?)?.let(Protocol.fromString),
      statusCodeMatcher: json['statusCodeMatcher'] as String?,
      timeoutMs: json['timeoutMs'] as int?,
      unhealthyThresholdCount: json['unhealthyThresholdCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    final port = this.port;
    final healthyThresholdCount = this.healthyThresholdCount;
    final intervalSeconds = this.intervalSeconds;
    final protocol = this.protocol;
    final statusCodeMatcher = this.statusCodeMatcher;
    final timeoutMs = this.timeoutMs;
    final unhealthyThresholdCount = this.unhealthyThresholdCount;
    return {
      'path': path,
      'port': port,
      if (healthyThresholdCount != null)
        'healthyThresholdCount': healthyThresholdCount,
      if (intervalSeconds != null) 'intervalSeconds': intervalSeconds,
      if (protocol != null) 'protocol': protocol.value,
      if (statusCodeMatcher != null) 'statusCodeMatcher': statusCodeMatcher,
      if (timeoutMs != null) 'timeoutMs': timeoutMs,
      if (unhealthyThresholdCount != null)
        'unhealthyThresholdCount': unhealthyThresholdCount,
    };
  }
}

/// Describes a summary of a certificate association.
///
/// @nodoc
class CertificateAssociationSummary {
  /// The Amazon Resource Name (ARN) of the ACM certificate.
  final String acmCertificateArn;

  /// The status of the certificate association.
  final CertificateAssociationStatus status;

  /// The timestamp of when the certificate was associated.
  final DateTime? associatedAt;

  /// The timestamp of when the certificate association was last updated.
  final DateTime? updatedAt;

  CertificateAssociationSummary({
    required this.acmCertificateArn,
    required this.status,
    this.associatedAt,
    this.updatedAt,
  });

  factory CertificateAssociationSummary.fromJson(Map<String, dynamic> json) {
    return CertificateAssociationSummary(
      acmCertificateArn: (json['acmCertificateArn'] as String?) ?? '',
      status: CertificateAssociationStatus.fromString(
          (json['status'] as String?) ?? ''),
      associatedAt: timeStampFromJson(json['associatedAt']),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final acmCertificateArn = this.acmCertificateArn;
    final status = this.status;
    final associatedAt = this.associatedAt;
    final updatedAt = this.updatedAt;
    return {
      'acmCertificateArn': acmCertificateArn,
      'status': status.value,
      if (associatedAt != null)
        'associatedAt': unixTimestampToJson(associatedAt),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// The status of a certificate association with a gateway.
///
/// @nodoc
class CertificateAssociationStatus {
  static const pendingAssociation =
      CertificateAssociationStatus._('PENDING_ASSOCIATION');
  static const associated = CertificateAssociationStatus._('ASSOCIATED');
  static const pendingDisassociation =
      CertificateAssociationStatus._('PENDING_DISASSOCIATION');
  static const disassociated = CertificateAssociationStatus._('DISASSOCIATED');
  static const failed = CertificateAssociationStatus._('FAILED');

  final String value;

  const CertificateAssociationStatus._(this.value);

  static const values = [
    pendingAssociation,
    associated,
    pendingDisassociation,
    disassociated,
    failed
  ];

  static CertificateAssociationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CertificateAssociationStatus._(value));

  @override
  bool operator ==(other) =>
      other is CertificateAssociationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The type of gateway.
///
/// @nodoc
class GatewayType {
  static const external = GatewayType._('EXTERNAL');
  static const internal = GatewayType._('INTERNAL');

  final String value;

  const GatewayType._(this.value);

  static const values = [external, internal];

  static GatewayType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => GatewayType._(value));

  @override
  bool operator ==(other) => other is GatewayType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RequesterGatewayStatus {
  static const pendingCreation = RequesterGatewayStatus._('PENDING_CREATION');
  static const active = RequesterGatewayStatus._('ACTIVE');
  static const pendingDeletion = RequesterGatewayStatus._('PENDING_DELETION');
  static const deleted = RequesterGatewayStatus._('DELETED');
  static const error = RequesterGatewayStatus._('ERROR');
  static const pendingUpdate = RequesterGatewayStatus._('PENDING_UPDATE');
  static const isolated = RequesterGatewayStatus._('ISOLATED');
  static const pendingIsolation = RequesterGatewayStatus._('PENDING_ISOLATION');
  static const pendingRestoration =
      RequesterGatewayStatus._('PENDING_RESTORATION');

  final String value;

  const RequesterGatewayStatus._(this.value);

  static const values = [
    pendingCreation,
    active,
    pendingDeletion,
    deleted,
    error,
    pendingUpdate,
    isolated,
    pendingIsolation,
    pendingRestoration
  ];

  static RequesterGatewayStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RequesterGatewayStatus._(value));

  @override
  bool operator ==(other) =>
      other is RequesterGatewayStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of a link routing rule.
///
/// @nodoc
class LinkRoutingRuleSummary {
  /// The conditions for the routing rule.
  final RuleCondition conditions;

  /// The timestamp of when the routing rule was created.
  final DateTime createdAt;

  /// The priority of the routing rule.
  final int priority;

  /// The unique identifier of the routing rule.
  final String ruleId;

  /// The status of the routing rule.
  final RuleStatus status;

  /// The timestamp of when the routing rule was last updated.
  final DateTime updatedAt;

  LinkRoutingRuleSummary({
    required this.conditions,
    required this.createdAt,
    required this.priority,
    required this.ruleId,
    required this.status,
    required this.updatedAt,
  });

  factory LinkRoutingRuleSummary.fromJson(Map<String, dynamic> json) {
    return LinkRoutingRuleSummary(
      conditions: RuleCondition.fromJson(
          (json['conditions'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      priority: (json['priority'] as int?) ?? 0,
      ruleId: (json['ruleId'] as String?) ?? '',
      status: RuleStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final conditions = this.conditions;
    final createdAt = this.createdAt;
    final priority = this.priority;
    final ruleId = this.ruleId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'conditions': conditions,
      'createdAt': unixTimestampToJson(createdAt),
      'priority': priority,
      'ruleId': ruleId,
      'status': status.value,
      'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// The conditions for a routing rule. All specified fields must match for the
/// rule to apply (AND logic). At least one condition field must be set.
///
/// @nodoc
class RuleCondition {
  /// The exact host header value to match.
  final String? hostHeader;

  /// A wildcard pattern for host header matching (for example,
  /// <code>*.example.com</code>).
  final String? hostHeaderWildcard;

  /// The exact path to match. Must start with <code>/</code>.
  final String? pathExact;

  /// The path prefix to match. The request path must start with this value. Must
  /// start with <code>/</code>.
  final String? pathPrefix;

  /// A query string key-value pair that must be present and match exactly.
  final QueryStringKeyValuePair? queryStringEquals;

  /// A query string key that must be present in the request (any value is
  /// accepted).
  final String? queryStringExists;

  RuleCondition({
    this.hostHeader,
    this.hostHeaderWildcard,
    this.pathExact,
    this.pathPrefix,
    this.queryStringEquals,
    this.queryStringExists,
  });

  factory RuleCondition.fromJson(Map<String, dynamic> json) {
    return RuleCondition(
      hostHeader: json['hostHeader'] as String?,
      hostHeaderWildcard: json['hostHeaderWildcard'] as String?,
      pathExact: json['pathExact'] as String?,
      pathPrefix: json['pathPrefix'] as String?,
      queryStringEquals: json['queryStringEquals'] != null
          ? QueryStringKeyValuePair.fromJson(
              json['queryStringEquals'] as Map<String, dynamic>)
          : null,
      queryStringExists: json['queryStringExists'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hostHeader = this.hostHeader;
    final hostHeaderWildcard = this.hostHeaderWildcard;
    final pathExact = this.pathExact;
    final pathPrefix = this.pathPrefix;
    final queryStringEquals = this.queryStringEquals;
    final queryStringExists = this.queryStringExists;
    return {
      if (hostHeader != null) 'hostHeader': hostHeader,
      if (hostHeaderWildcard != null) 'hostHeaderWildcard': hostHeaderWildcard,
      if (pathExact != null) 'pathExact': pathExact,
      if (pathPrefix != null) 'pathPrefix': pathPrefix,
      if (queryStringEquals != null) 'queryStringEquals': queryStringEquals,
      if (queryStringExists != null) 'queryStringExists': queryStringExists,
    };
  }
}

/// Status of a routing rule
///
/// @nodoc
class RuleStatus {
  static const creationInProgress = RuleStatus._('CREATION_IN_PROGRESS');
  static const active = RuleStatus._('ACTIVE');
  static const updateInProgress = RuleStatus._('UPDATE_IN_PROGRESS');
  static const deletionInProgress = RuleStatus._('DELETION_IN_PROGRESS');
  static const deleted = RuleStatus._('DELETED');
  static const failed = RuleStatus._('FAILED');

  final String value;

  const RuleStatus._(this.value);

  static const values = [
    creationInProgress,
    active,
    updateInProgress,
    deletionInProgress,
    deleted,
    failed
  ];

  static RuleStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RuleStatus._(value));

  @override
  bool operator ==(other) => other is RuleStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A key-value pair for query string matching in a routing rule condition.
///
/// @nodoc
class QueryStringKeyValuePair {
  /// The key of the query string parameter to match. Must contain only RFC 3986
  /// unreserved characters.
  final String key;

  /// The value of the query string parameter to match. Must contain only RFC 3986
  /// unreserved characters.
  final String value;

  QueryStringKeyValuePair({
    required this.key,
    required this.value,
  });

  factory QueryStringKeyValuePair.fromJson(Map<String, dynamic> json) {
    return QueryStringKeyValuePair(
      key: (json['key'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// @nodoc
class LinkDirection {
  static const response = LinkDirection._('RESPONSE');
  static const request = LinkDirection._('REQUEST');

  final String value;

  const LinkDirection._(this.value);

  static const values = [response, request];

  static LinkDirection fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LinkDirection._(value));

  @override
  bool operator ==(other) => other is LinkDirection && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes a link.
///
/// @nodoc
class ListLinksResponseStructure {
  /// The timestamp of when the link was created.
  final DateTime createdAt;

  /// The unique identifier of the gateway.
  final String gatewayId;

  /// The unique identifier of the link.
  final String linkId;

  /// The unique identifier of the peer gateway.
  final String peerGatewayId;

  /// The status of the link.
  final LinkStatus status;

  /// The timestamp of when the link was updated.
  final DateTime updatedAt;

  /// Describes attributes of a link.
  final LinkAttributes? attributes;

  /// The connectivity type of the link.
  final ConnectivityType? connectivityType;

  /// The direction of the link.
  final LinkDirection? direction;

  /// Describes the configuration of flow modules.
  final List<ModuleConfiguration>? flowModules;
  final LinkLogSettings? logSettings;

  /// Describes the configuration of pending flow modules.
  final List<ModuleConfiguration>? pendingFlowModules;

  /// The public endpoint of the outbound link.
  final String? publicEndpoint;

  /// A map of the key-value pairs of the tag or tags to assign to the resource.
  final Map<String, String>? tags;

  ListLinksResponseStructure({
    required this.createdAt,
    required this.gatewayId,
    required this.linkId,
    required this.peerGatewayId,
    required this.status,
    required this.updatedAt,
    this.attributes,
    this.connectivityType,
    this.direction,
    this.flowModules,
    this.logSettings,
    this.pendingFlowModules,
    this.publicEndpoint,
    this.tags,
  });

  factory ListLinksResponseStructure.fromJson(Map<String, dynamic> json) {
    return ListLinksResponseStructure(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      gatewayId: (json['gatewayId'] as String?) ?? '',
      linkId: (json['linkId'] as String?) ?? '',
      peerGatewayId: (json['peerGatewayId'] as String?) ?? '',
      status: LinkStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      attributes: json['attributes'] != null
          ? LinkAttributes.fromJson(json['attributes'] as Map<String, dynamic>)
          : null,
      connectivityType: (json['connectivityType'] as String?)
          ?.let(ConnectivityType.fromString),
      direction: (json['direction'] as String?)?.let(LinkDirection.fromString),
      flowModules: (json['flowModules'] as List?)
          ?.nonNulls
          .map((e) => ModuleConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      logSettings: json['logSettings'] != null
          ? LinkLogSettings.fromJson(
              json['logSettings'] as Map<String, dynamic>)
          : null,
      pendingFlowModules: (json['pendingFlowModules'] as List?)
          ?.nonNulls
          .map((e) => ModuleConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      publicEndpoint: json['publicEndpoint'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final gatewayId = this.gatewayId;
    final linkId = this.linkId;
    final peerGatewayId = this.peerGatewayId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final attributes = this.attributes;
    final connectivityType = this.connectivityType;
    final direction = this.direction;
    final flowModules = this.flowModules;
    final logSettings = this.logSettings;
    final pendingFlowModules = this.pendingFlowModules;
    final publicEndpoint = this.publicEndpoint;
    final tags = this.tags;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'gatewayId': gatewayId,
      'linkId': linkId,
      'peerGatewayId': peerGatewayId,
      'status': status.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (attributes != null) 'attributes': attributes,
      if (connectivityType != null) 'connectivityType': connectivityType.value,
      if (direction != null) 'direction': direction.value,
      if (flowModules != null) 'flowModules': flowModules,
      if (logSettings != null) 'logSettings': logSettings,
      if (pendingFlowModules != null) 'pendingFlowModules': pendingFlowModules,
      if (publicEndpoint != null) 'publicEndpoint': publicEndpoint,
      if (tags != null) 'tags': tags,
    };
  }
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
