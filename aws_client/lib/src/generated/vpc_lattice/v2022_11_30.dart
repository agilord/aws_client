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

/// Amazon VPC Lattice is a fully managed application networking service that
/// you use to connect, secure, and monitor all of your services across multiple
/// accounts and virtual private clouds (VPCs). Amazon VPC Lattice interconnects
/// your microservices and legacy services within a logical boundary, so that
/// you can discover and manage them more efficiently. For more information, see
/// the <a href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/">Amazon VPC
/// Lattice User Guide</a>
class VpcLattice {
  final _s.RestJsonProtocol _protocol;
  VpcLattice({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'vpc-lattice',
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

  /// Updates the listener rules in a batch. You can use this operation to
  /// change the priority of listener rules. This can be useful when bulk
  /// updating or swapping rule priority.
  ///
  /// <b>Required permissions:</b> <code>vpc-lattice:UpdateRule</code>
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/security_iam_service-with-iam.html">How
  /// Amazon VPC Lattice works with IAM</a> in the <i>Amazon VPC Lattice User
  /// Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or ARN of the listener.
  ///
  /// Parameter [rules] :
  /// The rules for the specified listener.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  Future<BatchUpdateRuleResponse> batchUpdateRule({
    required String listenerIdentifier,
    required List<RuleUpdate> rules,
    required String serviceIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'rules': rules,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/services/${Uri.encodeComponent(serviceIdentifier)}/listeners/${Uri.encodeComponent(listenerIdentifier)}/rules',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateRuleResponse.fromJson(response);
  }

  /// Deletes the specified auth policy. If an auth is set to
  /// <code>AWS_IAM</code> and the auth policy is deleted, all requests are
  /// denied. If you are trying to remove the auth policy completely, you must
  /// set the auth type to <code>NONE</code>. If auth is enabled on the
  /// resource, but no auth policy is set, all requests are denied.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceIdentifier] :
  /// The ID or ARN of the resource.
  Future<void> deleteAuthPolicy({
    required String resourceIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/authpolicy/${Uri.encodeComponent(resourceIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified resource policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<void> deleteResourcePolicy({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/resourcepolicy/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves information about the auth policy for the specified service or
  /// service network.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceIdentifier] :
  /// The ID or ARN of the service network or service.
  Future<GetAuthPolicyResponse> getAuthPolicy({
    required String resourceIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/authpolicy/${Uri.encodeComponent(resourceIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAuthPolicyResponse.fromJson(response);
  }

  /// Retrieves information about the specified resource policy. The resource
  /// policy is an IAM policy created on behalf of the resource owner when they
  /// share a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the service network or service.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resourcepolicy/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePolicyResponse.fromJson(response);
  }

  /// Lists the associations between a service network and a VPC endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The ID of the service network associated with the VPC endpoint.
  ///
  /// Parameter [maxResults] :
  /// The maximum page size.
  ///
  /// Parameter [nextToken] :
  /// If there are additional results, a pagination token for the next page of
  /// results.
  Future<ListServiceNetworkVpcEndpointAssociationsResponse>
      listServiceNetworkVpcEndpointAssociations({
    required String serviceNetworkIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'serviceNetworkIdentifier': [serviceNetworkIdentifier],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/servicenetworkvpcendpointassociations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServiceNetworkVpcEndpointAssociationsResponse.fromJson(response);
  }

  /// Lists the tags for the specified resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
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

  /// Creates or updates the auth policy. The policy string in JSON must not
  /// contain newlines or blank lines.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/auth-policies.html">Auth
  /// policies</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policy] :
  /// The auth policy. The policy string in JSON must not contain newlines or
  /// blank lines.
  ///
  /// Parameter [resourceIdentifier] :
  /// The ID or ARN of the service network or service for which the policy is
  /// created.
  Future<PutAuthPolicyResponse> putAuthPolicy({
    required String policy,
    required String resourceIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/authpolicy/${Uri.encodeComponent(resourceIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutAuthPolicyResponse.fromJson(response);
  }

  /// Attaches a resource-based permission policy to a service or service
  /// network. The policy must contain the same actions and condition statements
  /// as the Amazon Web Services Resource Access Manager permission for sharing
  /// services and service networks.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policy] :
  /// An IAM policy. The policy string in JSON must not contain newlines or
  /// blank lines.
  ///
  /// Parameter [resourceArn] :
  /// The ID or ARN of the service network or service for which the policy is
  /// created.
  Future<void> putResourcePolicy({
    required String policy,
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/resourcepolicy/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds the specified tags to the specified resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags for the resource.
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

  /// Removes the specified tags from the specified resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys of the tags to remove.
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

  /// Enables access logs to be sent to Amazon CloudWatch, Amazon S3, and Amazon
  /// Kinesis Data Firehose. The service network owner can use the access logs
  /// to audit the services in the network. The service network owner can only
  /// see access logs from clients and services that are associated with their
  /// service network. Access log entries represent traffic originated from VPCs
  /// associated with that network. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/monitoring-access-logs.html">Access
  /// logs</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationArn] :
  /// The Amazon Resource Name (ARN) of the destination. The supported
  /// destination types are CloudWatch Log groups, Kinesis Data Firehose
  /// delivery streams, and Amazon S3 buckets.
  ///
  /// Parameter [resourceIdentifier] :
  /// The ID or ARN of the service network or service.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you retry a request that completed
  /// successfully using the same client token and parameters, the retry
  /// succeeds without performing any actions. If the parameters aren't
  /// identical, the retry fails.
  ///
  /// Parameter [serviceNetworkLogType] :
  /// The type of log that monitors your Amazon VPC Lattice service networks.
  ///
  /// Parameter [tags] :
  /// The tags for the access log subscription.
  Future<CreateAccessLogSubscriptionResponse> createAccessLogSubscription({
    required String destinationArn,
    required String resourceIdentifier,
    String? clientToken,
    ServiceNetworkLogType? serviceNetworkLogType,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'destinationArn': destinationArn,
      'resourceIdentifier': resourceIdentifier,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (serviceNetworkLogType != null)
        'serviceNetworkLogType': serviceNetworkLogType.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accesslogsubscriptions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccessLogSubscriptionResponse.fromJson(response);
  }

  /// Retrieves information about the specified access log subscription.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessLogSubscriptionIdentifier] :
  /// The ID or ARN of the access log subscription.
  Future<GetAccessLogSubscriptionResponse> getAccessLogSubscription({
    required String accessLogSubscriptionIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accesslogsubscriptions/${Uri.encodeComponent(accessLogSubscriptionIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessLogSubscriptionResponse.fromJson(response);
  }

  /// Updates the specified access log subscription.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessLogSubscriptionIdentifier] :
  /// The ID or ARN of the access log subscription.
  ///
  /// Parameter [destinationArn] :
  /// The Amazon Resource Name (ARN) of the access log destination.
  Future<UpdateAccessLogSubscriptionResponse> updateAccessLogSubscription({
    required String accessLogSubscriptionIdentifier,
    required String destinationArn,
  }) async {
    final $payload = <String, dynamic>{
      'destinationArn': destinationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/accesslogsubscriptions/${Uri.encodeComponent(accessLogSubscriptionIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAccessLogSubscriptionResponse.fromJson(response);
  }

  /// Deletes the specified access log subscription.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessLogSubscriptionIdentifier] :
  /// The ID or ARN of the access log subscription.
  Future<void> deleteAccessLogSubscription({
    required String accessLogSubscriptionIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accesslogsubscriptions/${Uri.encodeComponent(accessLogSubscriptionIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the access log subscriptions for the specified service network or
  /// service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceIdentifier] :
  /// The ID or ARN of the service network or service.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next page of results.
  Future<ListAccessLogSubscriptionsResponse> listAccessLogSubscriptions({
    required String resourceIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'resourceIdentifier': [resourceIdentifier],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accesslogsubscriptions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessLogSubscriptionsResponse.fromJson(response);
  }

  /// Starts the domain verification process for a custom domain name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainName] :
  /// The domain name to verify ownership for.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you retry a request that completed
  /// successfully using the same client token and parameters, the retry
  /// succeeds without performing any actions. If the parameters aren't
  /// identical, the retry fails.
  ///
  /// Parameter [tags] :
  /// The tags for the domain verification.
  Future<StartDomainVerificationResponse> startDomainVerification({
    required String domainName,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'domainName': domainName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domainverifications',
      exceptionFnMap: _exceptionFns,
    );
    return StartDomainVerificationResponse.fromJson(response);
  }

  /// Retrieves information about a domain verification.ß
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainVerificationIdentifier] :
  /// The ID or ARN of the domain verification to retrieve.
  Future<GetDomainVerificationResponse> getDomainVerification({
    required String domainVerificationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domainverifications/${Uri.encodeComponent(domainVerificationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainVerificationResponse.fromJson(response);
  }

  /// Deletes the specified domain verification.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainVerificationIdentifier] :
  /// The ID of the domain verification to delete.
  Future<void> deleteDomainVerification({
    required String domainVerificationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domainverifications/${Uri.encodeComponent(domainVerificationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the domain verifications.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next page of results.
  Future<ListDomainVerificationsResponse> listDomainVerifications({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/domainverifications',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainVerificationsResponse.fromJson(response);
  }

  /// Creates a listener for a service. Before you start using your Amazon VPC
  /// Lattice service, you must add one or more listeners. A listener is a
  /// process that checks for connection requests to your services. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/listeners.html">Listeners</a>
  /// in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [defaultAction] :
  /// The action for the default rule. Each listener has a default rule. The
  /// default rule is used if no other rules match.
  ///
  /// Parameter [name] :
  /// The name of the listener. A listener name must be unique within a service.
  /// The valid characters are a-z, 0-9, and hyphens (-). You can't use a hyphen
  /// as the first or last character, or immediately after another hyphen.
  ///
  /// Parameter [protocol] :
  /// The listener protocol.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you retry a request that completed
  /// successfully using the same client token and parameters, the retry
  /// succeeds without performing any actions. If the parameters aren't
  /// identical, the retry fails.
  ///
  /// Parameter [port] :
  /// The listener port. You can specify a value from 1 to 65535. For HTTP, the
  /// default is 80. For HTTPS, the default is 443.
  ///
  /// Parameter [tags] :
  /// The tags for the listener.
  Future<CreateListenerResponse> createListener({
    required RuleAction defaultAction,
    required String name,
    required ListenerProtocol protocol,
    required String serviceIdentifier,
    String? clientToken,
    int? port,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'port',
      port,
      1,
      65535,
    );
    final $payload = <String, dynamic>{
      'defaultAction': defaultAction,
      'name': name,
      'protocol': protocol.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (port != null) 'port': port,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/services/${Uri.encodeComponent(serviceIdentifier)}/listeners',
      exceptionFnMap: _exceptionFns,
    );
    return CreateListenerResponse.fromJson(response);
  }

  /// Retrieves information about the specified listener for the specified
  /// service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or ARN of the listener.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  Future<GetListenerResponse> getListener({
    required String listenerIdentifier,
    required String serviceIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/services/${Uri.encodeComponent(serviceIdentifier)}/listeners/${Uri.encodeComponent(listenerIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetListenerResponse.fromJson(response);
  }

  /// Updates the specified listener for the specified service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [defaultAction] :
  /// The action for the default rule.
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or ARN of the listener.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  Future<UpdateListenerResponse> updateListener({
    required RuleAction defaultAction,
    required String listenerIdentifier,
    required String serviceIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'defaultAction': defaultAction,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/services/${Uri.encodeComponent(serviceIdentifier)}/listeners/${Uri.encodeComponent(listenerIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateListenerResponse.fromJson(response);
  }

  /// Deletes the specified listener.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or ARN of the listener.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  Future<void> deleteListener({
    required String listenerIdentifier,
    required String serviceIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/services/${Uri.encodeComponent(serviceIdentifier)}/listeners/${Uri.encodeComponent(listenerIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the listeners for the specified service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next page of results.
  Future<ListListenersResponse> listListeners({
    required String serviceIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/services/${Uri.encodeComponent(serviceIdentifier)}/listeners',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListListenersResponse.fromJson(response);
  }

  /// Creates a resource configuration. A resource configuration defines a
  /// specific resource. You can associate a resource configuration with a
  /// service network or a VPC endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the resource configuration. The name must be unique within the
  /// account. The valid characters are a-z, 0-9, and hyphens (-). You can't use
  /// a hyphen as the first or last character, or immediately after another
  /// hyphen.
  ///
  /// Parameter [type] :
  /// The type of resource configuration. A resource configuration can be one of
  /// the following types:
  ///
  /// <ul>
  /// <li>
  /// <b>SINGLE</b> - A single resource.
  /// </li>
  /// <li>
  /// <b>GROUP</b> - A group of resources. You must create a group resource
  /// configuration before you create a child resource configuration.
  /// </li>
  /// <li>
  /// <b>CHILD</b> - A single resource that is part of a group resource
  /// configuration.
  /// </li>
  /// <li>
  /// <b>ARN</b> - An Amazon Web Services resource.
  /// </li>
  /// </ul>
  ///
  /// Parameter [allowAssociationToShareableServiceNetwork] :
  /// (SINGLE, GROUP, ARN) Specifies whether the resource configuration can be
  /// associated with a sharable service network. The default is false.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you retry a request that completed
  /// successfully using the same client token and parameters, the retry
  /// succeeds without performing any actions. If the parameters aren't
  /// identical, the retry fails.
  ///
  /// Parameter [customDomainName] :
  /// A custom domain name for your resource configuration. Additionally,
  /// provide a DomainVerificationID to prove your ownership of a domain.
  ///
  /// Parameter [domainVerificationIdentifier] :
  /// The domain verification ID of your verified custom domain name. If you
  /// don't provide an ID, you must configure the DNS settings yourself.
  ///
  /// Parameter [groupDomain] :
  /// (GROUP) The group domain for a group resource configuration. Any domains
  /// that you create for the child resource are subdomains of the group domain.
  /// Child resources inherit the verification status of the domain.
  ///
  /// Parameter [portRanges] :
  /// (SINGLE, GROUP, CHILD) The TCP port ranges that a consumer can use to
  /// access a resource configuration (for example: 1-65535). You can separate
  /// port ranges using commas (for example: 1,2,22-30).
  ///
  /// Parameter [protocol] :
  /// (SINGLE, GROUP) The protocol accepted by the resource configuration.
  ///
  /// Parameter [resourceConfigurationDefinition] :
  /// Identifies the resource configuration in one of the following ways:
  ///
  /// <ul>
  /// <li>
  /// <b>Amazon Resource Name (ARN)</b> - Supported resource-types that are
  /// provisioned by Amazon Web Services services, such as RDS databases, can be
  /// identified by their ARN.
  /// </li>
  /// <li>
  /// <b>Domain name</b> - Any domain name that is publicly resolvable.
  /// </li>
  /// <li>
  /// <b>IP address</b> - For IPv4 and IPv6, only IP addresses in the VPC are
  /// supported.
  /// </li>
  /// </ul>
  ///
  /// Parameter [resourceConfigurationGroupIdentifier] :
  /// (CHILD) The ID or ARN of the parent resource configuration of type
  /// <code>GROUP</code>. This is used to associate a child resource
  /// configuration with a group resource configuration.
  ///
  /// Parameter [resourceGatewayIdentifier] :
  /// (SINGLE, GROUP, ARN) The ID or ARN of the resource gateway used to connect
  /// to the resource configuration. For a child resource configuration, this
  /// value is inherited from the parent resource configuration.
  ///
  /// Parameter [tags] :
  /// The tags for the resource configuration.
  Future<CreateResourceConfigurationResponse> createResourceConfiguration({
    required String name,
    required ResourceConfigurationType type,
    bool? allowAssociationToShareableServiceNetwork,
    String? clientToken,
    String? customDomainName,
    String? domainVerificationIdentifier,
    String? groupDomain,
    List<String>? portRanges,
    ProtocolType? protocol,
    ResourceConfigurationDefinition? resourceConfigurationDefinition,
    String? resourceConfigurationGroupIdentifier,
    String? resourceGatewayIdentifier,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'type': type.value,
      if (allowAssociationToShareableServiceNetwork != null)
        'allowAssociationToShareableServiceNetwork':
            allowAssociationToShareableServiceNetwork,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (domainVerificationIdentifier != null)
        'domainVerificationIdentifier': domainVerificationIdentifier,
      if (groupDomain != null) 'groupDomain': groupDomain,
      if (portRanges != null) 'portRanges': portRanges,
      if (protocol != null) 'protocol': protocol.value,
      if (resourceConfigurationDefinition != null)
        'resourceConfigurationDefinition': resourceConfigurationDefinition,
      if (resourceConfigurationGroupIdentifier != null)
        'resourceConfigurationGroupIdentifier':
            resourceConfigurationGroupIdentifier,
      if (resourceGatewayIdentifier != null)
        'resourceGatewayIdentifier': resourceGatewayIdentifier,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/resourceconfigurations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateResourceConfigurationResponse.fromJson(response);
  }

  /// Retrieves information about the specified resource configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceConfigurationIdentifier] :
  /// The ID of the resource configuration.
  Future<GetResourceConfigurationResponse> getResourceConfiguration({
    required String resourceConfigurationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/resourceconfigurations/${Uri.encodeComponent(resourceConfigurationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceConfigurationResponse.fromJson(response);
  }

  /// Updates the specified resource configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceConfigurationIdentifier] :
  /// The ID of the resource configuration.
  ///
  /// Parameter [allowAssociationToShareableServiceNetwork] :
  /// Indicates whether to add the resource configuration to service networks
  /// that are shared with other accounts.
  ///
  /// Parameter [portRanges] :
  /// The TCP port ranges that a consumer can use to access a resource
  /// configuration. You can separate port ranges with a comma. Example: 1-65535
  /// or 1,2,22-30
  ///
  /// Parameter [resourceConfigurationDefinition] :
  /// Identifies the resource configuration in one of the following ways:
  ///
  /// <ul>
  /// <li>
  /// <b>Amazon Resource Name (ARN)</b> - Supported resource-types that are
  /// provisioned by Amazon Web Services services, such as RDS databases, can be
  /// identified by their ARN.
  /// </li>
  /// <li>
  /// <b>Domain name</b> - Any domain name that is publicly resolvable.
  /// </li>
  /// <li>
  /// <b>IP address</b> - For IPv4 and IPv6, only IP addresses in the VPC are
  /// supported.
  /// </li>
  /// </ul>
  Future<UpdateResourceConfigurationResponse> updateResourceConfiguration({
    required String resourceConfigurationIdentifier,
    bool? allowAssociationToShareableServiceNetwork,
    List<String>? portRanges,
    ResourceConfigurationDefinition? resourceConfigurationDefinition,
  }) async {
    final $payload = <String, dynamic>{
      if (allowAssociationToShareableServiceNetwork != null)
        'allowAssociationToShareableServiceNetwork':
            allowAssociationToShareableServiceNetwork,
      if (portRanges != null) 'portRanges': portRanges,
      if (resourceConfigurationDefinition != null)
        'resourceConfigurationDefinition': resourceConfigurationDefinition,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/resourceconfigurations/${Uri.encodeComponent(resourceConfigurationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateResourceConfigurationResponse.fromJson(response);
  }

  /// Deletes the specified resource configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceConfigurationIdentifier] :
  /// The ID or ARN of the resource configuration.
  Future<void> deleteResourceConfiguration({
    required String resourceConfigurationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/resourceconfigurations/${Uri.encodeComponent(resourceConfigurationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the resource configurations owned by or shared with this account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainVerificationIdentifier] :
  /// The domain verification ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum page size.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next page of results.
  ///
  /// Parameter [resourceConfigurationGroupIdentifier] :
  /// The ID of the resource configuration of type <code>Group</code>.
  ///
  /// Parameter [resourceGatewayIdentifier] :
  /// The ID of the resource gateway for the resource configuration.
  Future<ListResourceConfigurationsResponse> listResourceConfigurations({
    String? domainVerificationIdentifier,
    int? maxResults,
    String? nextToken,
    String? resourceConfigurationGroupIdentifier,
    String? resourceGatewayIdentifier,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (domainVerificationIdentifier != null)
        'domainVerificationIdentifier': [domainVerificationIdentifier],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resourceConfigurationGroupIdentifier != null)
        'resourceConfigurationGroupIdentifier': [
          resourceConfigurationGroupIdentifier
        ],
      if (resourceGatewayIdentifier != null)
        'resourceGatewayIdentifier': [resourceGatewayIdentifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resourceconfigurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListResourceConfigurationsResponse.fromJson(response);
  }

  /// Disassociates the resource configuration from the resource VPC endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceEndpointAssociationIdentifier] :
  /// The ID or ARN of the association.
  Future<DeleteResourceEndpointAssociationResponse>
      deleteResourceEndpointAssociation({
    required String resourceEndpointAssociationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/resourceendpointassociations/${Uri.encodeComponent(resourceEndpointAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteResourceEndpointAssociationResponse.fromJson(response);
  }

  /// Lists the associations for the specified VPC endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceConfigurationIdentifier] :
  /// The ID for the resource configuration associated with the VPC endpoint.
  ///
  /// Parameter [maxResults] :
  /// The maximum page size.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next page of results.
  ///
  /// Parameter [resourceEndpointAssociationIdentifier] :
  /// The ID of the association.
  ///
  /// Parameter [vpcEndpointId] :
  /// The ID of the VPC endpoint in the association.
  ///
  /// Parameter [vpcEndpointOwner] :
  /// The owner of the VPC endpoint in the association.
  Future<ListResourceEndpointAssociationsResponse>
      listResourceEndpointAssociations({
    required String resourceConfigurationIdentifier,
    int? maxResults,
    String? nextToken,
    String? resourceEndpointAssociationIdentifier,
    String? vpcEndpointId,
    String? vpcEndpointOwner,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'resourceConfigurationIdentifier': [resourceConfigurationIdentifier],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resourceEndpointAssociationIdentifier != null)
        'resourceEndpointAssociationIdentifier': [
          resourceEndpointAssociationIdentifier
        ],
      if (vpcEndpointId != null) 'vpcEndpointId': [vpcEndpointId],
      if (vpcEndpointOwner != null) 'vpcEndpointOwner': [vpcEndpointOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resourceendpointassociations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListResourceEndpointAssociationsResponse.fromJson(response);
  }

  /// A resource gateway is a point of ingress into the VPC where a resource
  /// resides. It spans multiple Availability Zones. For your resource to be
  /// accessible from all Availability Zones, you should create your resource
  /// gateways to span as many Availability Zones as possible. A VPC can have
  /// multiple resource gateways.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the resource gateway.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you retry a request that completed
  /// successfully using the same client token and parameters, the retry
  /// succeeds without performing any actions. If the parameters aren't
  /// identical, the retry fails.
  ///
  /// Parameter [ipAddressType] :
  /// A resource gateway can have IPv4, IPv6 or dualstack addresses. The IP
  /// address type of a resource gateway must be compatible with the subnets of
  /// the resource gateway and the IP address type of the resource, as described
  /// here:
  ///
  /// <ul>
  /// <li>
  /// <b>IPv4</b>Assign IPv4 addresses to your resource gateway network
  /// interfaces. This option is supported only if all selected subnets have
  /// IPv4 address ranges, and the resource also has an IPv4 address.
  /// </li>
  /// <li>
  /// <b>IPv6</b>Assign IPv6 addresses to your resource gateway network
  /// interfaces. This option is supported only if all selected subnets are IPv6
  /// only subnets, and the resource also has an IPv6 address.
  /// </li>
  /// <li>
  /// <b>Dualstack</b>Assign both IPv4 and IPv6 addresses to your resource
  /// gateway network interfaces. This option is supported only if all selected
  /// subnets have both IPv4 and IPv6 address ranges, and the resource either
  /// has an IPv4 or IPv6 address.
  /// </li>
  /// </ul>
  /// The IP address type of the resource gateway is independent of the IP
  /// address type of the client or the VPC endpoint through which the resource
  /// is accessed.
  ///
  /// Parameter [ipv4AddressesPerEni] :
  /// The number of IPv4 addresses in each ENI for the resource gateway.
  ///
  /// Parameter [resourceConfigDnsResolution] :
  /// Indicates how DNS is resolved for resource configurations associated to
  /// this resource gateway. ResourceConfigDnsResolution is set at creation time
  /// and cannot be changed.
  ///
  /// <ul>
  /// <li>
  /// <code>IN_VPC</code> - DNS resolution occurs privately within the resource
  /// gateway's VPC. DNS queries for resources behind this resource gateway
  /// resolve using the DNS resolvers defined in the VPC's DHCP option sets. Use
  /// this when your resource domain names are hosted in private Route 53 hosted
  /// zones or on-premises DNS servers reachable from the VPC.
  /// </li>
  /// <li>
  /// <code>PUBLIC</code> - DNS resolution occurs against public DNS resolvers.
  /// DNS queries for resources behind this resource gateway resolve using
  /// standard public DNS. Use this when your resource domain names are publicly
  /// resolvable.
  /// </li>
  /// </ul>
  ///
  /// Parameter [securityGroupIds] :
  /// The IDs of the security groups to apply to the resource gateway. The
  /// security groups must be in the same VPC.
  ///
  /// Parameter [subnetIds] :
  /// The IDs of the VPC subnets in which to create the resource gateway.
  ///
  /// Parameter [tags] :
  /// The tags for the resource gateway.
  ///
  /// Parameter [vpcIdentifier] :
  /// The ID of the VPC for the resource gateway.
  Future<CreateResourceGatewayResponse> createResourceGateway({
    required String name,
    String? clientToken,
    ResourceGatewayIpAddressType? ipAddressType,
    int? ipv4AddressesPerEni,
    ResourceConfigDnsResolution? resourceConfigDnsResolution,
    List<String>? securityGroupIds,
    List<String>? subnetIds,
    Map<String, String>? tags,
    String? vpcIdentifier,
  }) async {
    _s.validateNumRange(
      'ipv4AddressesPerEni',
      ipv4AddressesPerEni,
      1,
      62,
    );
    final $payload = <String, dynamic>{
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (ipv4AddressesPerEni != null)
        'ipv4AddressesPerEni': ipv4AddressesPerEni,
      if (resourceConfigDnsResolution != null)
        'resourceConfigDnsResolution': resourceConfigDnsResolution.value,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (tags != null) 'tags': tags,
      if (vpcIdentifier != null) 'vpcIdentifier': vpcIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/resourcegateways',
      exceptionFnMap: _exceptionFns,
    );
    return CreateResourceGatewayResponse.fromJson(response);
  }

  /// Retrieves information about the specified resource gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceGatewayIdentifier] :
  /// The ID of the resource gateway.
  Future<GetResourceGatewayResponse> getResourceGateway({
    required String resourceGatewayIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/resourcegateways/${Uri.encodeComponent(resourceGatewayIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceGatewayResponse.fromJson(response);
  }

  /// Updates the specified resource gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceGatewayIdentifier] :
  /// The ID or ARN of the resource gateway.
  ///
  /// Parameter [securityGroupIds] :
  /// The IDs of the security groups associated with the resource gateway.
  Future<UpdateResourceGatewayResponse> updateResourceGateway({
    required String resourceGatewayIdentifier,
    List<String>? securityGroupIds,
  }) async {
    final $payload = <String, dynamic>{
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/resourcegateways/${Uri.encodeComponent(resourceGatewayIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateResourceGatewayResponse.fromJson(response);
  }

  /// Deletes the specified resource gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceGatewayIdentifier] :
  /// The ID or ARN of the resource gateway.
  Future<DeleteResourceGatewayResponse> deleteResourceGateway({
    required String resourceGatewayIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/resourcegateways/${Uri.encodeComponent(resourceGatewayIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteResourceGatewayResponse.fromJson(response);
  }

  /// Lists the resource gateways that you own or that were shared with you.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum page size.
  ///
  /// Parameter [nextToken] :
  /// If there are additional results, a pagination token for the next page of
  /// results.
  Future<ListResourceGatewaysResponse> listResourceGateways({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resourcegateways',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListResourceGatewaysResponse.fromJson(response);
  }

  /// Creates a listener rule. Each listener has a default rule for checking
  /// connection requests, but you can define additional rules. Each rule
  /// consists of a priority, one or more actions, and one or more conditions.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/listeners.html#listener-rules">Listener
  /// rules</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// The action for the default rule.
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or ARN of the listener.
  ///
  /// Parameter [match] :
  /// The rule match.
  ///
  /// Parameter [name] :
  /// The name of the rule. The name must be unique within the listener. The
  /// valid characters are a-z, 0-9, and hyphens (-). You can't use a hyphen as
  /// the first or last character, or immediately after another hyphen.
  ///
  /// Parameter [priority] :
  /// The priority assigned to the rule. Each rule for a specific listener must
  /// have a unique priority. The lower the priority number the higher the
  /// priority.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you retry a request that completed
  /// successfully using the same client token and parameters, the retry
  /// succeeds without performing any actions. If the parameters aren't
  /// identical, the retry fails.
  ///
  /// Parameter [tags] :
  /// The tags for the rule.
  Future<CreateRuleResponse> createRule({
    required RuleAction action,
    required String listenerIdentifier,
    required RuleMatch match,
    required String name,
    required int priority,
    required String serviceIdentifier,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      1,
      2000,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'action': action,
      'match': match,
      'name': name,
      'priority': priority,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/services/${Uri.encodeComponent(serviceIdentifier)}/listeners/${Uri.encodeComponent(listenerIdentifier)}/rules',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRuleResponse.fromJson(response);
  }

  /// Retrieves information about the specified listener rules. You can also
  /// retrieve information about the default listener rule. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/listeners.html#listener-rules">Listener
  /// rules</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or ARN of the listener.
  ///
  /// Parameter [ruleIdentifier] :
  /// The ID or ARN of the listener rule.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  Future<GetRuleResponse> getRule({
    required String listenerIdentifier,
    required String ruleIdentifier,
    required String serviceIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/services/${Uri.encodeComponent(serviceIdentifier)}/listeners/${Uri.encodeComponent(listenerIdentifier)}/rules/${Uri.encodeComponent(ruleIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRuleResponse.fromJson(response);
  }

  /// Updates a specified rule for the listener. You can't modify a default
  /// listener rule. To modify a default listener rule, use
  /// <code>UpdateListener</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or ARN of the listener.
  ///
  /// Parameter [ruleIdentifier] :
  /// The ID or ARN of the rule.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  ///
  /// Parameter [action] :
  /// Information about the action for the specified listener rule.
  ///
  /// Parameter [match] :
  /// The rule match.
  ///
  /// Parameter [priority] :
  /// The rule priority. A listener can't have multiple rules with the same
  /// priority.
  Future<UpdateRuleResponse> updateRule({
    required String listenerIdentifier,
    required String ruleIdentifier,
    required String serviceIdentifier,
    RuleAction? action,
    RuleMatch? match,
    int? priority,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      1,
      2000,
    );
    final $payload = <String, dynamic>{
      if (action != null) 'action': action,
      if (match != null) 'match': match,
      if (priority != null) 'priority': priority,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/services/${Uri.encodeComponent(serviceIdentifier)}/listeners/${Uri.encodeComponent(listenerIdentifier)}/rules/${Uri.encodeComponent(ruleIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRuleResponse.fromJson(response);
  }

  /// Deletes a listener rule. Each listener has a default rule for checking
  /// connection requests, but you can define additional rules. Each rule
  /// consists of a priority, one or more actions, and one or more conditions.
  /// You can delete additional listener rules, but you cannot delete the
  /// default rule.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/listeners.html#listener-rules">Listener
  /// rules</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or ARN of the listener.
  ///
  /// Parameter [ruleIdentifier] :
  /// The ID or ARN of the rule.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  Future<void> deleteRule({
    required String listenerIdentifier,
    required String ruleIdentifier,
    required String serviceIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/services/${Uri.encodeComponent(serviceIdentifier)}/listeners/${Uri.encodeComponent(listenerIdentifier)}/rules/${Uri.encodeComponent(ruleIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the rules for the specified listener.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or ARN of the listener.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next page of results.
  Future<ListRulesResponse> listRules({
    required String listenerIdentifier,
    required String serviceIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/services/${Uri.encodeComponent(serviceIdentifier)}/listeners/${Uri.encodeComponent(listenerIdentifier)}/rules',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRulesResponse.fromJson(response);
  }

  /// Creates a service. A service is any software application that can run on
  /// instances containers, or serverless functions within an account or virtual
  /// private cloud (VPC).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/services.html">Services</a>
  /// in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the service. The name must be unique within the account. The
  /// valid characters are a-z, 0-9, and hyphens (-). You can't use a hyphen as
  /// the first or last character, or immediately after another hyphen.
  ///
  /// Parameter [authType] :
  /// The type of IAM policy.
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code>: The resource does not use an IAM policy. This is the
  /// default.
  /// </li>
  /// <li>
  /// <code>AWS_IAM</code>: The resource uses an IAM policy. When this type is
  /// used, auth is enabled and an auth policy is required.
  /// </li>
  /// </ul>
  ///
  /// Parameter [certificateArn] :
  /// The Amazon Resource Name (ARN) of the certificate.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you retry a request that completed
  /// successfully using the same client token and parameters, the retry
  /// succeeds without performing any actions. If the parameters aren't
  /// identical, the retry fails.
  ///
  /// Parameter [customDomainName] :
  /// The custom domain name of the service.
  ///
  /// Parameter [tags] :
  /// The tags for the service.
  Future<CreateServiceResponse> createService({
    required String name,
    AuthType? authType,
    String? certificateArn,
    String? clientToken,
    String? customDomainName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (authType != null) 'authType': authType.value,
      if (certificateArn != null) 'certificateArn': certificateArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/services',
      exceptionFnMap: _exceptionFns,
    );
    return CreateServiceResponse.fromJson(response);
  }

  /// Retrieves information about the specified service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  Future<GetServiceResponse> getService({
    required String serviceIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/services/${Uri.encodeComponent(serviceIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceResponse.fromJson(response);
  }

  /// Updates the specified service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  ///
  /// Parameter [authType] :
  /// The type of IAM policy.
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code>: The resource does not use an IAM policy. This is the
  /// default.
  /// </li>
  /// <li>
  /// <code>AWS_IAM</code>: The resource uses an IAM policy. When this type is
  /// used, auth is enabled and an auth policy is required.
  /// </li>
  /// </ul>
  ///
  /// Parameter [certificateArn] :
  /// The Amazon Resource Name (ARN) of the certificate.
  Future<UpdateServiceResponse> updateService({
    required String serviceIdentifier,
    AuthType? authType,
    String? certificateArn,
  }) async {
    final $payload = <String, dynamic>{
      if (authType != null) 'authType': authType.value,
      if (certificateArn != null) 'certificateArn': certificateArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/services/${Uri.encodeComponent(serviceIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateServiceResponse.fromJson(response);
  }

  /// Deletes a service. A service can't be deleted if it's associated with a
  /// service network. If you delete a service, all resources related to the
  /// service, such as the resource policy, auth policy, listeners, listener
  /// rules, and access log subscriptions, are also deleted. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/services.html#delete-service">Delete
  /// a service</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  Future<DeleteServiceResponse> deleteService({
    required String serviceIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/services/${Uri.encodeComponent(serviceIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteServiceResponse.fromJson(response);
  }

  /// Lists the services owned by the caller account or shared with the caller
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next page of results.
  Future<ListServicesResponse> listServices({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/services',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServicesResponse.fromJson(response);
  }

  /// Creates a service network. A service network is a logical boundary for a
  /// collection of services. You can associate services and VPCs with a service
  /// network.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/service-networks.html">Service
  /// networks</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the service network. The name must be unique to the account.
  /// The valid characters are a-z, 0-9, and hyphens (-). You can't use a hyphen
  /// as the first or last character, or immediately after another hyphen.
  ///
  /// Parameter [authType] :
  /// The type of IAM policy.
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code>: The resource does not use an IAM policy. This is the
  /// default.
  /// </li>
  /// <li>
  /// <code>AWS_IAM</code>: The resource uses an IAM policy. When this type is
  /// used, auth is enabled and an auth policy is required.
  /// </li>
  /// </ul>
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you retry a request that completed
  /// successfully using the same client token and parameters, the retry
  /// succeeds without performing any actions. If the parameters aren't
  /// identical, the retry fails.
  ///
  /// Parameter [sharingConfig] :
  /// Specify if the service network should be enabled for sharing.
  ///
  /// Parameter [tags] :
  /// The tags for the service network.
  Future<CreateServiceNetworkResponse> createServiceNetwork({
    required String name,
    AuthType? authType,
    String? clientToken,
    SharingConfig? sharingConfig,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (authType != null) 'authType': authType.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (sharingConfig != null) 'sharingConfig': sharingConfig,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/servicenetworks',
      exceptionFnMap: _exceptionFns,
    );
    return CreateServiceNetworkResponse.fromJson(response);
  }

  /// Retrieves information about the specified service network.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The ID or ARN of the service network.
  Future<GetServiceNetworkResponse> getServiceNetwork({
    required String serviceNetworkIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/servicenetworks/${Uri.encodeComponent(serviceNetworkIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceNetworkResponse.fromJson(response);
  }

  /// Updates the specified service network.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [authType] :
  /// The type of IAM policy.
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code>: The resource does not use an IAM policy. This is the
  /// default.
  /// </li>
  /// <li>
  /// <code>AWS_IAM</code>: The resource uses an IAM policy. When this type is
  /// used, auth is enabled and an auth policy is required.
  /// </li>
  /// </ul>
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The ID or ARN of the service network.
  Future<UpdateServiceNetworkResponse> updateServiceNetwork({
    required AuthType authType,
    required String serviceNetworkIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'authType': authType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/servicenetworks/${Uri.encodeComponent(serviceNetworkIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateServiceNetworkResponse.fromJson(response);
  }

  /// Deletes a service network. You can only delete the service network if
  /// there is no service or VPC associated with it. If you delete a service
  /// network, all resources related to the service network, such as the
  /// resource policy, auth policy, and access log subscriptions, are also
  /// deleted. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/service-networks.html#delete-service-network">Delete
  /// a service network</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The ID or ARN of the service network.
  Future<void> deleteServiceNetwork({
    required String serviceNetworkIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/servicenetworks/${Uri.encodeComponent(serviceNetworkIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the service networks owned by or shared with this account. The
  /// account ID in the ARN shows which account owns the service network.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next page of results.
  Future<ListServiceNetworksResponse> listServiceNetworks({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/servicenetworks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServiceNetworksResponse.fromJson(response);
  }

  /// Associates the specified service network with the specified resource
  /// configuration. This allows the resource configuration to receive
  /// connections through the service network, including through a service
  /// network VPC endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceConfigurationIdentifier] :
  /// The ID of the resource configuration to associate with the service
  /// network.
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The ID of the service network to associate with the resource
  /// configuration.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you retry a request that completed
  /// successfully using the same client token and parameters, the retry
  /// succeeds without performing any actions. If the parameters aren't
  /// identical, the retry fails.
  ///
  /// Parameter [privateDnsEnabled] :
  /// Indicates if private DNS is enabled for the service network resource
  /// association.
  ///
  /// Parameter [tags] :
  /// A key-value pair to associate with a resource.
  Future<CreateServiceNetworkResourceAssociationResponse>
      createServiceNetworkResourceAssociation({
    required String resourceConfigurationIdentifier,
    required String serviceNetworkIdentifier,
    String? clientToken,
    bool? privateDnsEnabled,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'resourceConfigurationIdentifier': resourceConfigurationIdentifier,
      'serviceNetworkIdentifier': serviceNetworkIdentifier,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (privateDnsEnabled != null) 'privateDnsEnabled': privateDnsEnabled,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/servicenetworkresourceassociations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateServiceNetworkResourceAssociationResponse.fromJson(response);
  }

  /// Retrieves information about the specified association between a service
  /// network and a resource configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceNetworkResourceAssociationIdentifier] :
  /// The ID of the association.
  Future<GetServiceNetworkResourceAssociationResponse>
      getServiceNetworkResourceAssociation({
    required String serviceNetworkResourceAssociationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/servicenetworkresourceassociations/${Uri.encodeComponent(serviceNetworkResourceAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceNetworkResourceAssociationResponse.fromJson(response);
  }

  /// Deletes the association between a service network and a resource
  /// configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceNetworkResourceAssociationIdentifier] :
  /// The ID of the association.
  Future<DeleteServiceNetworkResourceAssociationResponse>
      deleteServiceNetworkResourceAssociation({
    required String serviceNetworkResourceAssociationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/servicenetworkresourceassociations/${Uri.encodeComponent(serviceNetworkResourceAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteServiceNetworkResourceAssociationResponse.fromJson(response);
  }

  /// Lists the associations between a service network and a resource
  /// configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [includeChildren] :
  /// Include service network resource associations of the child resource
  /// configuration with the grouped resource configuration.
  ///
  /// The type is boolean and the default value is false.
  ///
  /// Parameter [maxResults] :
  /// The maximum page size.
  ///
  /// Parameter [nextToken] :
  /// If there are additional results, a pagination token for the next page of
  /// results.
  ///
  /// Parameter [resourceConfigurationIdentifier] :
  /// The ID of the resource configuration.
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The ID of the service network.
  Future<ListServiceNetworkResourceAssociationsResponse>
      listServiceNetworkResourceAssociations({
    bool? includeChildren,
    int? maxResults,
    String? nextToken,
    String? resourceConfigurationIdentifier,
    String? serviceNetworkIdentifier,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (includeChildren != null)
        'includeChildren': [includeChildren.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resourceConfigurationIdentifier != null)
        'resourceConfigurationIdentifier': [resourceConfigurationIdentifier],
      if (serviceNetworkIdentifier != null)
        'serviceNetworkIdentifier': [serviceNetworkIdentifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/servicenetworkresourceassociations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServiceNetworkResourceAssociationsResponse.fromJson(response);
  }

  /// Associates the specified service with the specified service network. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/service-network-associations.html#service-network-service-associations">Manage
  /// service associations</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// You can't use this operation if the service and service network are
  /// already associated or if there is a disassociation or deletion in
  /// progress. If the association fails, you can retry the operation by
  /// deleting the association and recreating it.
  ///
  /// You cannot associate a service and service network that are shared with a
  /// caller. The caller must own either the service or the service network.
  ///
  /// As a result of this operation, the association is created in the service
  /// network account and the association owner account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The ID or ARN of the service network. You must use an ARN if the resources
  /// are in different accounts.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you retry a request that completed
  /// successfully using the same client token and parameters, the retry
  /// succeeds without performing any actions. If the parameters aren't
  /// identical, the retry fails.
  ///
  /// Parameter [tags] :
  /// The tags for the association.
  Future<CreateServiceNetworkServiceAssociationResponse>
      createServiceNetworkServiceAssociation({
    required String serviceIdentifier,
    required String serviceNetworkIdentifier,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'serviceIdentifier': serviceIdentifier,
      'serviceNetworkIdentifier': serviceNetworkIdentifier,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/servicenetworkserviceassociations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateServiceNetworkServiceAssociationResponse.fromJson(response);
  }

  /// Retrieves information about the specified association between a service
  /// network and a service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceNetworkServiceAssociationIdentifier] :
  /// The ID or ARN of the association.
  Future<GetServiceNetworkServiceAssociationResponse>
      getServiceNetworkServiceAssociation({
    required String serviceNetworkServiceAssociationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/servicenetworkserviceassociations/${Uri.encodeComponent(serviceNetworkServiceAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceNetworkServiceAssociationResponse.fromJson(response);
  }

  /// Deletes the association between a service and a service network. This
  /// operation fails if an association is still in progress.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceNetworkServiceAssociationIdentifier] :
  /// The ID or ARN of the association.
  Future<DeleteServiceNetworkServiceAssociationResponse>
      deleteServiceNetworkServiceAssociation({
    required String serviceNetworkServiceAssociationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/servicenetworkserviceassociations/${Uri.encodeComponent(serviceNetworkServiceAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteServiceNetworkServiceAssociationResponse.fromJson(response);
  }

  /// Lists the associations between a service network and a service. You can
  /// filter the list either by service or service network. You must provide
  /// either the service network identifier or the service identifier.
  ///
  /// Every association in Amazon VPC Lattice has a unique Amazon Resource Name
  /// (ARN), such as when a service network is associated with a VPC or when a
  /// service is associated with a service network. If the association is for a
  /// resource is shared with another account, the association includes the
  /// local account ID as the prefix in the ARN.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next page of results.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or ARN of the service.
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The ID or ARN of the service network.
  Future<ListServiceNetworkServiceAssociationsResponse>
      listServiceNetworkServiceAssociations({
    int? maxResults,
    String? nextToken,
    String? serviceIdentifier,
    String? serviceNetworkIdentifier,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (serviceIdentifier != null) 'serviceIdentifier': [serviceIdentifier],
      if (serviceNetworkIdentifier != null)
        'serviceNetworkIdentifier': [serviceNetworkIdentifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/servicenetworkserviceassociations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServiceNetworkServiceAssociationsResponse.fromJson(response);
  }

  /// Associates a VPC with a service network. When you associate a VPC with the
  /// service network, it enables all the resources within that VPC to be
  /// clients and communicate with other services in the service network. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/service-network-associations.html#service-network-vpc-associations">Manage
  /// VPC associations</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// You can't use this operation if there is a disassociation in progress. If
  /// the association fails, retry by deleting the association and recreating
  /// it.
  ///
  /// As a result of this operation, the association gets created in the service
  /// network account and the VPC owner account.
  ///
  /// If you add a security group to the service network and VPC association,
  /// the association must continue to always have at least one security group.
  /// You can add or edit security groups at any time. However, to remove all
  /// security groups, you must first delete the association and recreate it
  /// without security groups.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The ID or ARN of the service network. You must use an ARN if the resources
  /// are in different accounts.
  ///
  /// Parameter [vpcIdentifier] :
  /// The ID of the VPC.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you retry a request that completed
  /// successfully using the same client token and parameters, the retry
  /// succeeds without performing any actions. If the parameters aren't
  /// identical, the retry fails.
  ///
  /// Parameter [dnsOptions] :
  /// DNS options for the service network VPC association.
  ///
  /// Parameter [privateDnsEnabled] :
  /// Indicates if private DNS is enabled for the VPC association.
  ///
  /// Parameter [securityGroupIds] :
  /// The IDs of the security groups. Security groups aren't added by default.
  /// You can add a security group to apply network level controls to control
  /// which resources in a VPC are allowed to access the service network and its
  /// services. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html">Control
  /// traffic to resources using security groups</a> in the <i>Amazon VPC User
  /// Guide</i>.
  ///
  /// Parameter [tags] :
  /// The tags for the association.
  Future<CreateServiceNetworkVpcAssociationResponse>
      createServiceNetworkVpcAssociation({
    required String serviceNetworkIdentifier,
    required String vpcIdentifier,
    String? clientToken,
    DnsOptions? dnsOptions,
    bool? privateDnsEnabled,
    List<String>? securityGroupIds,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'serviceNetworkIdentifier': serviceNetworkIdentifier,
      'vpcIdentifier': vpcIdentifier,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (dnsOptions != null) 'dnsOptions': dnsOptions,
      if (privateDnsEnabled != null) 'privateDnsEnabled': privateDnsEnabled,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/servicenetworkvpcassociations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateServiceNetworkVpcAssociationResponse.fromJson(response);
  }

  /// Retrieves information about the specified association between a service
  /// network and a VPC.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceNetworkVpcAssociationIdentifier] :
  /// The ID or ARN of the association.
  Future<GetServiceNetworkVpcAssociationResponse>
      getServiceNetworkVpcAssociation({
    required String serviceNetworkVpcAssociationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/servicenetworkvpcassociations/${Uri.encodeComponent(serviceNetworkVpcAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceNetworkVpcAssociationResponse.fromJson(response);
  }

  /// Updates the service network and VPC association. If you add a security
  /// group to the service network and VPC association, the association must
  /// continue to have at least one security group. You can add or edit security
  /// groups at any time. However, to remove all security groups, you must first
  /// delete the association and then recreate it without security groups.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [securityGroupIds] :
  /// The IDs of the security groups.
  ///
  /// Parameter [serviceNetworkVpcAssociationIdentifier] :
  /// The ID or ARN of the association.
  Future<UpdateServiceNetworkVpcAssociationResponse>
      updateServiceNetworkVpcAssociation({
    required List<String> securityGroupIds,
    required String serviceNetworkVpcAssociationIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'securityGroupIds': securityGroupIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/servicenetworkvpcassociations/${Uri.encodeComponent(serviceNetworkVpcAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateServiceNetworkVpcAssociationResponse.fromJson(response);
  }

  /// Disassociates the VPC from the service network. You can't disassociate the
  /// VPC if there is a create or update association in progress.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceNetworkVpcAssociationIdentifier] :
  /// The ID or ARN of the association.
  Future<DeleteServiceNetworkVpcAssociationResponse>
      deleteServiceNetworkVpcAssociation({
    required String serviceNetworkVpcAssociationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/servicenetworkvpcassociations/${Uri.encodeComponent(serviceNetworkVpcAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteServiceNetworkVpcAssociationResponse.fromJson(response);
  }

  /// Lists the associations between a service network and a VPC. You can filter
  /// the list either by VPC or service network. You must provide either the ID
  /// of the service network identifier or the ID of the VPC.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next page of results.
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The ID or ARN of the service network.
  ///
  /// Parameter [vpcIdentifier] :
  /// The ID or ARN of the VPC.
  Future<ListServiceNetworkVpcAssociationsResponse>
      listServiceNetworkVpcAssociations({
    int? maxResults,
    String? nextToken,
    String? serviceNetworkIdentifier,
    String? vpcIdentifier,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (serviceNetworkIdentifier != null)
        'serviceNetworkIdentifier': [serviceNetworkIdentifier],
      if (vpcIdentifier != null) 'vpcIdentifier': [vpcIdentifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/servicenetworkvpcassociations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServiceNetworkVpcAssociationsResponse.fromJson(response);
  }

  /// Creates a target group. A target group is a collection of targets, or
  /// compute resources, that run your application or service. A target group
  /// can only be used by a single service.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/target-groups.html">Target
  /// groups</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the target group. The name must be unique within the account.
  /// The valid characters are a-z, 0-9, and hyphens (-). You can't use a hyphen
  /// as the first or last character, or immediately after another hyphen.
  ///
  /// Parameter [type] :
  /// The type of target group.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you retry a request that completed
  /// successfully using the same client token and parameters, the retry
  /// succeeds without performing any actions. If the parameters aren't
  /// identical, the retry fails.
  ///
  /// Parameter [config] :
  /// The target group configuration.
  ///
  /// Parameter [tags] :
  /// The tags for the target group.
  Future<CreateTargetGroupResponse> createTargetGroup({
    required String name,
    required TargetGroupType type,
    String? clientToken,
    TargetGroupConfig? config,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'type': type.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (config != null) 'config': config,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/targetgroups',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTargetGroupResponse.fromJson(response);
  }

  /// Retrieves information about the specified target group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [targetGroupIdentifier] :
  /// The ID or ARN of the target group.
  Future<GetTargetGroupResponse> getTargetGroup({
    required String targetGroupIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/targetgroups/${Uri.encodeComponent(targetGroupIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTargetGroupResponse.fromJson(response);
  }

  /// Updates the specified target group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [healthCheck] :
  /// The health check configuration.
  ///
  /// Parameter [targetGroupIdentifier] :
  /// The ID or ARN of the target group.
  Future<UpdateTargetGroupResponse> updateTargetGroup({
    required HealthCheckConfig healthCheck,
    required String targetGroupIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'healthCheck': healthCheck,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/targetgroups/${Uri.encodeComponent(targetGroupIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTargetGroupResponse.fromJson(response);
  }

  /// Deletes a target group. You can't delete a target group if it is used in a
  /// listener rule or if the target group creation is in progress.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [targetGroupIdentifier] :
  /// The ID or ARN of the target group.
  Future<DeleteTargetGroupResponse> deleteTargetGroup({
    required String targetGroupIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/targetgroups/${Uri.encodeComponent(targetGroupIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteTargetGroupResponse.fromJson(response);
  }

  /// Lists your target groups. You can narrow your search by using the filters
  /// below in your request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next page of results.
  ///
  /// Parameter [targetGroupType] :
  /// The target group type.
  ///
  /// Parameter [vpcIdentifier] :
  /// The ID or ARN of the VPC.
  Future<ListTargetGroupsResponse> listTargetGroups({
    int? maxResults,
    String? nextToken,
    TargetGroupType? targetGroupType,
    String? vpcIdentifier,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (targetGroupType != null) 'targetGroupType': [targetGroupType.value],
      if (vpcIdentifier != null) 'vpcIdentifier': [vpcIdentifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/targetgroups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTargetGroupsResponse.fromJson(response);
  }

  /// Deregisters the specified targets from the specified target group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [targetGroupIdentifier] :
  /// The ID or ARN of the target group.
  ///
  /// Parameter [targets] :
  /// The targets to deregister.
  Future<DeregisterTargetsResponse> deregisterTargets({
    required String targetGroupIdentifier,
    required List<Target> targets,
  }) async {
    final $payload = <String, dynamic>{
      'targets': targets,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/targetgroups/${Uri.encodeComponent(targetGroupIdentifier)}/deregistertargets',
      exceptionFnMap: _exceptionFns,
    );
    return DeregisterTargetsResponse.fromJson(response);
  }

  /// Lists the targets for the target group. By default, all targets are
  /// included. You can use this API to check the health status of targets. You
  /// can also ﬁlter the results by target.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [targetGroupIdentifier] :
  /// The ID or ARN of the target group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next page of results.
  ///
  /// Parameter [targets] :
  /// The targets.
  Future<ListTargetsResponse> listTargets({
    required String targetGroupIdentifier,
    int? maxResults,
    String? nextToken,
    List<Target>? targets,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      if (targets != null) 'targets': targets,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/targetgroups/${Uri.encodeComponent(targetGroupIdentifier)}/listtargets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTargetsResponse.fromJson(response);
  }

  /// Registers the targets with the target group. If it's a Lambda target, you
  /// can only have one target in a target group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [targetGroupIdentifier] :
  /// The ID or ARN of the target group.
  ///
  /// Parameter [targets] :
  /// The targets.
  Future<RegisterTargetsResponse> registerTargets({
    required String targetGroupIdentifier,
    required List<Target> targets,
  }) async {
    final $payload = <String, dynamic>{
      'targets': targets,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/targetgroups/${Uri.encodeComponent(targetGroupIdentifier)}/registertargets',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterTargetsResponse.fromJson(response);
  }
}

class BatchUpdateRuleResponse {
  /// The rules that were successfully updated.
  final List<RuleUpdateSuccess>? successful;

  /// The rules that the operation couldn't update.
  final List<RuleUpdateFailure>? unsuccessful;

  BatchUpdateRuleResponse({
    this.successful,
    this.unsuccessful,
  });

  factory BatchUpdateRuleResponse.fromJson(Map<String, dynamic> json) {
    return BatchUpdateRuleResponse(
      successful: (json['successful'] as List?)
          ?.nonNulls
          .map((e) => RuleUpdateSuccess.fromJson(e as Map<String, dynamic>))
          .toList(),
      unsuccessful: (json['unsuccessful'] as List?)
          ?.nonNulls
          .map((e) => RuleUpdateFailure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final successful = this.successful;
    final unsuccessful = this.unsuccessful;
    return {
      if (successful != null) 'successful': successful,
      if (unsuccessful != null) 'unsuccessful': unsuccessful,
    };
  }
}

class DeleteAuthPolicyResponse {
  DeleteAuthPolicyResponse();

  factory DeleteAuthPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAuthPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteResourcePolicyResponse {
  DeleteResourcePolicyResponse();

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetAuthPolicyResponse {
  /// The date and time that the auth policy was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The date and time that the auth policy was last updated, in ISO-8601 format.
  final DateTime? lastUpdatedAt;

  /// The auth policy.
  final String? policy;

  /// The state of the auth policy. The auth policy is only active when the auth
  /// type is set to <code>AWS_IAM</code>. If you provide a policy, then
  /// authentication and authorization decisions are made based on this policy and
  /// the client's IAM policy. If the auth type is <code>NONE</code>, then any
  /// auth policy that you provide remains inactive. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/service-networks.html#create-service-network">Create
  /// a service network</a> in the <i>Amazon VPC Lattice User Guide</i>.
  final AuthPolicyState? state;

  GetAuthPolicyResponse({
    this.createdAt,
    this.lastUpdatedAt,
    this.policy,
    this.state,
  });

  factory GetAuthPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetAuthPolicyResponse(
      createdAt: timeStampFromJson(json['createdAt']),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      policy: json['policy'] as String?,
      state: (json['state'] as String?)?.let(AuthPolicyState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final policy = this.policy;
    final state = this.state;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (policy != null) 'policy': policy,
      if (state != null) 'state': state.value,
    };
  }
}

class GetResourcePolicyResponse {
  /// An IAM policy.
  final String? policy;

  GetResourcePolicyResponse({
    this.policy,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      policy: json['policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'policy': policy,
    };
  }
}

class ListServiceNetworkVpcEndpointAssociationsResponse {
  /// Information about the association between the VPC endpoint and service
  /// network.
  final List<ServiceNetworkEndpointAssociation> items;

  /// If there are additional results, a pagination token for the next page of
  /// results.
  final String? nextToken;

  ListServiceNetworkVpcEndpointAssociationsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListServiceNetworkVpcEndpointAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListServiceNetworkVpcEndpointAssociationsResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => ServiceNetworkEndpointAssociation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// Information about the tags.
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

class PutAuthPolicyResponse {
  /// The auth policy. The policy string in JSON must not contain newlines or
  /// blank lines.
  final String? policy;

  /// The state of the auth policy. The auth policy is only active when the auth
  /// type is set to <code>AWS_IAM</code>. If you provide a policy, then
  /// authentication and authorization decisions are made based on this policy and
  /// the client's IAM policy. If the Auth type is <code>NONE</code>, then, any
  /// auth policy that you provide remains inactive. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/service-networks.html#create-service-network">Create
  /// a service network</a> in the <i>Amazon VPC Lattice User Guide</i>.
  final AuthPolicyState? state;

  PutAuthPolicyResponse({
    this.policy,
    this.state,
  });

  factory PutAuthPolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutAuthPolicyResponse(
      policy: json['policy'] as String?,
      state: (json['state'] as String?)?.let(AuthPolicyState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final state = this.state;
    return {
      if (policy != null) 'policy': policy,
      if (state != null) 'state': state.value,
    };
  }
}

class PutResourcePolicyResponse {
  PutResourcePolicyResponse();

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return PutResourcePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class CreateAccessLogSubscriptionResponse {
  /// The Amazon Resource Name (ARN) of the access log subscription.
  final String arn;

  /// The Amazon Resource Name (ARN) of the log destination.
  final String destinationArn;

  /// The ID of the access log subscription.
  final String id;

  /// The Amazon Resource Name (ARN) of the service network or service.
  final String resourceArn;

  /// The ID of the service network or service.
  final String resourceId;

  /// The type of log that monitors your Amazon VPC Lattice service networks.
  final ServiceNetworkLogType? serviceNetworkLogType;

  CreateAccessLogSubscriptionResponse({
    required this.arn,
    required this.destinationArn,
    required this.id,
    required this.resourceArn,
    required this.resourceId,
    this.serviceNetworkLogType,
  });

  factory CreateAccessLogSubscriptionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAccessLogSubscriptionResponse(
      arn: (json['arn'] as String?) ?? '',
      destinationArn: (json['destinationArn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      resourceArn: (json['resourceArn'] as String?) ?? '',
      resourceId: (json['resourceId'] as String?) ?? '',
      serviceNetworkLogType: (json['serviceNetworkLogType'] as String?)
          ?.let(ServiceNetworkLogType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final destinationArn = this.destinationArn;
    final id = this.id;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final serviceNetworkLogType = this.serviceNetworkLogType;
    return {
      'arn': arn,
      'destinationArn': destinationArn,
      'id': id,
      'resourceArn': resourceArn,
      'resourceId': resourceId,
      if (serviceNetworkLogType != null)
        'serviceNetworkLogType': serviceNetworkLogType.value,
    };
  }
}

class GetAccessLogSubscriptionResponse {
  /// The Amazon Resource Name (ARN) of the access log subscription.
  final String arn;

  /// The date and time that the access log subscription was created, in ISO-8601
  /// format.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the access log destination.
  final String destinationArn;

  /// The ID of the access log subscription.
  final String id;

  /// The date and time that the access log subscription was last updated, in
  /// ISO-8601 format.
  final DateTime lastUpdatedAt;

  /// The Amazon Resource Name (ARN) of the service network or service.
  final String resourceArn;

  /// The ID of the service network or service.
  final String resourceId;

  /// The log type for the service network.
  final ServiceNetworkLogType? serviceNetworkLogType;

  GetAccessLogSubscriptionResponse({
    required this.arn,
    required this.createdAt,
    required this.destinationArn,
    required this.id,
    required this.lastUpdatedAt,
    required this.resourceArn,
    required this.resourceId,
    this.serviceNetworkLogType,
  });

  factory GetAccessLogSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return GetAccessLogSubscriptionResponse(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      destinationArn: (json['destinationArn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['lastUpdatedAt'] ?? 0),
      resourceArn: (json['resourceArn'] as String?) ?? '',
      resourceId: (json['resourceId'] as String?) ?? '',
      serviceNetworkLogType: (json['serviceNetworkLogType'] as String?)
          ?.let(ServiceNetworkLogType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final destinationArn = this.destinationArn;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final serviceNetworkLogType = this.serviceNetworkLogType;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'destinationArn': destinationArn,
      'id': id,
      'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'resourceArn': resourceArn,
      'resourceId': resourceId,
      if (serviceNetworkLogType != null)
        'serviceNetworkLogType': serviceNetworkLogType.value,
    };
  }
}

class UpdateAccessLogSubscriptionResponse {
  /// The Amazon Resource Name (ARN) of the access log subscription.
  final String arn;

  /// The Amazon Resource Name (ARN) of the access log destination.
  final String destinationArn;

  /// The ID of the access log subscription.
  final String id;

  /// The Amazon Resource Name (ARN) of the access log subscription.
  final String resourceArn;

  /// The ID of the resource.
  final String resourceId;

  UpdateAccessLogSubscriptionResponse({
    required this.arn,
    required this.destinationArn,
    required this.id,
    required this.resourceArn,
    required this.resourceId,
  });

  factory UpdateAccessLogSubscriptionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateAccessLogSubscriptionResponse(
      arn: (json['arn'] as String?) ?? '',
      destinationArn: (json['destinationArn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      resourceArn: (json['resourceArn'] as String?) ?? '',
      resourceId: (json['resourceId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final destinationArn = this.destinationArn;
    final id = this.id;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    return {
      'arn': arn,
      'destinationArn': destinationArn,
      'id': id,
      'resourceArn': resourceArn,
      'resourceId': resourceId,
    };
  }
}

class DeleteAccessLogSubscriptionResponse {
  DeleteAccessLogSubscriptionResponse();

  factory DeleteAccessLogSubscriptionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAccessLogSubscriptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListAccessLogSubscriptionsResponse {
  /// Information about the access log subscriptions.
  final List<AccessLogSubscriptionSummary> items;

  /// A pagination token for the next page of results.
  final String? nextToken;

  ListAccessLogSubscriptionsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListAccessLogSubscriptionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAccessLogSubscriptionsResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              AccessLogSubscriptionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class StartDomainVerificationResponse {
  /// The Amazon Resource Name (ARN) of the domain verification.
  final String arn;

  /// The domain name being verified.
  final String domainName;

  /// The ID of the domain verification.
  final String id;

  /// The current status of the domain verification process.
  final VerificationStatus status;

  /// The TXT record configuration used for domain verification.
  final TxtMethodConfig? txtMethodConfig;

  StartDomainVerificationResponse({
    required this.arn,
    required this.domainName,
    required this.id,
    required this.status,
    this.txtMethodConfig,
  });

  factory StartDomainVerificationResponse.fromJson(Map<String, dynamic> json) {
    return StartDomainVerificationResponse(
      arn: (json['arn'] as String?) ?? '',
      domainName: (json['domainName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      status: VerificationStatus.fromString((json['status'] as String?) ?? ''),
      txtMethodConfig: json['txtMethodConfig'] != null
          ? TxtMethodConfig.fromJson(
              json['txtMethodConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final domainName = this.domainName;
    final id = this.id;
    final status = this.status;
    final txtMethodConfig = this.txtMethodConfig;
    return {
      'arn': arn,
      'domainName': domainName,
      'id': id,
      'status': status.value,
      if (txtMethodConfig != null) 'txtMethodConfig': txtMethodConfig,
    };
  }
}

class GetDomainVerificationResponse {
  /// The Amazon Resource Name (ARN) of the domain verification.
  final String arn;

  /// The date and time that the domain verification was created, in ISO-8601
  /// format.
  final DateTime createdAt;

  /// The domain name being verified.
  final String domainName;

  /// The ID of the domain verification.
  final String id;

  /// The current status of the domain verification process.
  final VerificationStatus status;

  /// The date and time that the domain was last successfully verified, in
  /// ISO-8601 format.
  final DateTime? lastVerifiedTime;

  /// The tags associated with the domain verification.
  final Map<String, String>? tags;

  /// The TXT record configuration used for domain verification.
  final TxtMethodConfig? txtMethodConfig;

  GetDomainVerificationResponse({
    required this.arn,
    required this.createdAt,
    required this.domainName,
    required this.id,
    required this.status,
    this.lastVerifiedTime,
    this.tags,
    this.txtMethodConfig,
  });

  factory GetDomainVerificationResponse.fromJson(Map<String, dynamic> json) {
    return GetDomainVerificationResponse(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      domainName: (json['domainName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      status: VerificationStatus.fromString((json['status'] as String?) ?? ''),
      lastVerifiedTime: timeStampFromJson(json['lastVerifiedTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      txtMethodConfig: json['txtMethodConfig'] != null
          ? TxtMethodConfig.fromJson(
              json['txtMethodConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final id = this.id;
    final status = this.status;
    final lastVerifiedTime = this.lastVerifiedTime;
    final tags = this.tags;
    final txtMethodConfig = this.txtMethodConfig;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'domainName': domainName,
      'id': id,
      'status': status.value,
      if (lastVerifiedTime != null)
        'lastVerifiedTime': iso8601ToJson(lastVerifiedTime),
      if (tags != null) 'tags': tags,
      if (txtMethodConfig != null) 'txtMethodConfig': txtMethodConfig,
    };
  }
}

class DeleteDomainVerificationResponse {
  DeleteDomainVerificationResponse();

  factory DeleteDomainVerificationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDomainVerificationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListDomainVerificationsResponse {
  /// Information about the domain verifications.
  final List<DomainVerificationSummary> items;

  /// A pagination token for the next page of results.
  final String? nextToken;

  ListDomainVerificationsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListDomainVerificationsResponse.fromJson(Map<String, dynamic> json) {
    return ListDomainVerificationsResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              DomainVerificationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateListenerResponse {
  /// The Amazon Resource Name (ARN) of the listener.
  final String? arn;

  /// The action for the default rule.
  final RuleAction? defaultAction;

  /// The ID of the listener.
  final String? id;

  /// The name of the listener.
  final String? name;

  /// The port number of the listener.
  final int? port;

  /// The protocol of the listener.
  final ListenerProtocol? protocol;

  /// The Amazon Resource Name (ARN) of the service.
  final String? serviceArn;

  /// The ID of the service.
  final String? serviceId;

  CreateListenerResponse({
    this.arn,
    this.defaultAction,
    this.id,
    this.name,
    this.port,
    this.protocol,
    this.serviceArn,
    this.serviceId,
  });

  factory CreateListenerResponse.fromJson(Map<String, dynamic> json) {
    return CreateListenerResponse(
      arn: json['arn'] as String?,
      defaultAction: json['defaultAction'] != null
          ? RuleAction.fromJson(json['defaultAction'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      name: json['name'] as String?,
      port: json['port'] as int?,
      protocol: (json['protocol'] as String?)?.let(ListenerProtocol.fromString),
      serviceArn: json['serviceArn'] as String?,
      serviceId: json['serviceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final defaultAction = this.defaultAction;
    final id = this.id;
    final name = this.name;
    final port = this.port;
    final protocol = this.protocol;
    final serviceArn = this.serviceArn;
    final serviceId = this.serviceId;
    return {
      if (arn != null) 'arn': arn,
      if (defaultAction != null) 'defaultAction': defaultAction,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.value,
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (serviceId != null) 'serviceId': serviceId,
    };
  }
}

class GetListenerResponse {
  /// The Amazon Resource Name (ARN) of the listener.
  final String? arn;

  /// The date and time that the listener was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The actions for the default listener rule.
  final RuleAction? defaultAction;

  /// The ID of the listener.
  final String? id;

  /// The date and time that the listener was last updated, in ISO-8601 format.
  final DateTime? lastUpdatedAt;

  /// The name of the listener.
  final String? name;

  /// The listener port.
  final int? port;

  /// The listener protocol.
  final ListenerProtocol? protocol;

  /// The Amazon Resource Name (ARN) of the service.
  final String? serviceArn;

  /// The ID of the service.
  final String? serviceId;

  GetListenerResponse({
    this.arn,
    this.createdAt,
    this.defaultAction,
    this.id,
    this.lastUpdatedAt,
    this.name,
    this.port,
    this.protocol,
    this.serviceArn,
    this.serviceId,
  });

  factory GetListenerResponse.fromJson(Map<String, dynamic> json) {
    return GetListenerResponse(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      defaultAction: json['defaultAction'] != null
          ? RuleAction.fromJson(json['defaultAction'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      port: json['port'] as int?,
      protocol: (json['protocol'] as String?)?.let(ListenerProtocol.fromString),
      serviceArn: json['serviceArn'] as String?,
      serviceId: json['serviceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final defaultAction = this.defaultAction;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final port = this.port;
    final protocol = this.protocol;
    final serviceArn = this.serviceArn;
    final serviceId = this.serviceId;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (defaultAction != null) 'defaultAction': defaultAction,
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.value,
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (serviceId != null) 'serviceId': serviceId,
    };
  }
}

class UpdateListenerResponse {
  /// The Amazon Resource Name (ARN) of the listener.
  final String? arn;

  /// The action for the default rule.
  final RuleAction? defaultAction;

  /// The ID of the listener.
  final String? id;

  /// The name of the listener.
  final String? name;

  /// The listener port.
  final int? port;

  /// The protocol of the listener.
  final ListenerProtocol? protocol;

  /// The Amazon Resource Name (ARN) of the service.
  final String? serviceArn;

  /// The ID of the service.
  final String? serviceId;

  UpdateListenerResponse({
    this.arn,
    this.defaultAction,
    this.id,
    this.name,
    this.port,
    this.protocol,
    this.serviceArn,
    this.serviceId,
  });

  factory UpdateListenerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateListenerResponse(
      arn: json['arn'] as String?,
      defaultAction: json['defaultAction'] != null
          ? RuleAction.fromJson(json['defaultAction'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      name: json['name'] as String?,
      port: json['port'] as int?,
      protocol: (json['protocol'] as String?)?.let(ListenerProtocol.fromString),
      serviceArn: json['serviceArn'] as String?,
      serviceId: json['serviceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final defaultAction = this.defaultAction;
    final id = this.id;
    final name = this.name;
    final port = this.port;
    final protocol = this.protocol;
    final serviceArn = this.serviceArn;
    final serviceId = this.serviceId;
    return {
      if (arn != null) 'arn': arn,
      if (defaultAction != null) 'defaultAction': defaultAction,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.value,
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (serviceId != null) 'serviceId': serviceId,
    };
  }
}

class DeleteListenerResponse {
  DeleteListenerResponse();

  factory DeleteListenerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteListenerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListListenersResponse {
  /// Information about the listeners.
  final List<ListenerSummary> items;

  /// If there are additional results, a pagination token for the next page of
  /// results.
  final String? nextToken;

  ListListenersResponse({
    required this.items,
    this.nextToken,
  });

  factory ListListenersResponse.fromJson(Map<String, dynamic> json) {
    return ListListenersResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListenerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateResourceConfigurationResponse {
  /// Specifies whether the resource configuration can be associated with a
  /// sharable service network.
  final bool? allowAssociationToShareableServiceNetwork;

  /// The Amazon Resource Name (ARN) of the resource configuration.
  final String? arn;

  /// The date and time that the resource configuration was created, in ISO-8601
  /// format.
  final DateTime? createdAt;

  /// The custom domain name for your resource configuration.
  final String? customDomainName;

  /// The verification ID ARN
  final String? domainVerificationArn;

  /// The domain name verification ID.
  final String? domainVerificationId;

  /// The reason that the request failed.
  final String? failureReason;

  /// (GROUP) The group domain for a group resource configuration. Any domains
  /// that you create for the child resource are subdomains of the group domain.
  /// Child resources inherit the verification status of the domain.
  final String? groupDomain;

  /// The ID of the resource configuration.
  final String? id;

  /// The name of the resource configuration.
  final String? name;

  /// The port range.
  final List<String>? portRanges;

  /// The protocol.
  final ProtocolType? protocol;

  /// Identifies the resource configuration in one of the following ways:
  ///
  /// <ul>
  /// <li>
  /// <b>Amazon Resource Name (ARN)</b> - Supported resource-types that are
  /// provisioned by Amazon Web Services services, such as RDS databases, can be
  /// identified by their ARN.
  /// </li>
  /// <li>
  /// <b>Domain name</b> - Any domain name that is publicly resolvable.
  /// </li>
  /// <li>
  /// <b>IP address</b> - For IPv4 and IPv6, only IP addresses in the VPC are
  /// supported.
  /// </li>
  /// </ul>
  final ResourceConfigurationDefinition? resourceConfigurationDefinition;

  /// The ID of the parent resource configuration of type <code>GROUP</code>.
  final String? resourceConfigurationGroupId;

  /// The ID of the resource gateway associated with the resource configuration.
  final String? resourceGatewayId;

  /// The current status of the resource configuration.
  final ResourceConfigurationStatus? status;

  /// The type of resource configuration. A resource configuration can be one of
  /// the following types:
  ///
  /// <ul>
  /// <li>
  /// <b>SINGLE</b> - A single resource.
  /// </li>
  /// <li>
  /// <b>GROUP</b> - A group of resources. You must create a group resource
  /// configuration before you create a child resource configuration.
  /// </li>
  /// <li>
  /// <b>CHILD</b> - A single resource that is part of a group resource
  /// configuration.
  /// </li>
  /// <li>
  /// <b>ARN</b> - An Amazon Web Services resource.
  /// </li>
  /// </ul>
  final ResourceConfigurationType? type;

  CreateResourceConfigurationResponse({
    this.allowAssociationToShareableServiceNetwork,
    this.arn,
    this.createdAt,
    this.customDomainName,
    this.domainVerificationArn,
    this.domainVerificationId,
    this.failureReason,
    this.groupDomain,
    this.id,
    this.name,
    this.portRanges,
    this.protocol,
    this.resourceConfigurationDefinition,
    this.resourceConfigurationGroupId,
    this.resourceGatewayId,
    this.status,
    this.type,
  });

  factory CreateResourceConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateResourceConfigurationResponse(
      allowAssociationToShareableServiceNetwork:
          json['allowAssociationToShareableServiceNetwork'] as bool?,
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      customDomainName: json['customDomainName'] as String?,
      domainVerificationArn: json['domainVerificationArn'] as String?,
      domainVerificationId: json['domainVerificationId'] as String?,
      failureReason: json['failureReason'] as String?,
      groupDomain: json['groupDomain'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      portRanges: (json['portRanges'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      protocol: (json['protocol'] as String?)?.let(ProtocolType.fromString),
      resourceConfigurationDefinition:
          json['resourceConfigurationDefinition'] != null
              ? ResourceConfigurationDefinition.fromJson(
                  json['resourceConfigurationDefinition']
                      as Map<String, dynamic>)
              : null,
      resourceConfigurationGroupId:
          json['resourceConfigurationGroupId'] as String?,
      resourceGatewayId: json['resourceGatewayId'] as String?,
      status: (json['status'] as String?)
          ?.let(ResourceConfigurationStatus.fromString),
      type:
          (json['type'] as String?)?.let(ResourceConfigurationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final allowAssociationToShareableServiceNetwork =
        this.allowAssociationToShareableServiceNetwork;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final customDomainName = this.customDomainName;
    final domainVerificationArn = this.domainVerificationArn;
    final domainVerificationId = this.domainVerificationId;
    final failureReason = this.failureReason;
    final groupDomain = this.groupDomain;
    final id = this.id;
    final name = this.name;
    final portRanges = this.portRanges;
    final protocol = this.protocol;
    final resourceConfigurationDefinition =
        this.resourceConfigurationDefinition;
    final resourceConfigurationGroupId = this.resourceConfigurationGroupId;
    final resourceGatewayId = this.resourceGatewayId;
    final status = this.status;
    final type = this.type;
    return {
      if (allowAssociationToShareableServiceNetwork != null)
        'allowAssociationToShareableServiceNetwork':
            allowAssociationToShareableServiceNetwork,
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (domainVerificationArn != null)
        'domainVerificationArn': domainVerificationArn,
      if (domainVerificationId != null)
        'domainVerificationId': domainVerificationId,
      if (failureReason != null) 'failureReason': failureReason,
      if (groupDomain != null) 'groupDomain': groupDomain,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (portRanges != null) 'portRanges': portRanges,
      if (protocol != null) 'protocol': protocol.value,
      if (resourceConfigurationDefinition != null)
        'resourceConfigurationDefinition': resourceConfigurationDefinition,
      if (resourceConfigurationGroupId != null)
        'resourceConfigurationGroupId': resourceConfigurationGroupId,
      if (resourceGatewayId != null) 'resourceGatewayId': resourceGatewayId,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
    };
  }
}

class GetResourceConfigurationResponse {
  /// Specifies whether the resource configuration is associated with a sharable
  /// service network.
  final bool? allowAssociationToShareableServiceNetwork;

  /// Indicates whether the resource configuration was created and is managed by
  /// Amazon.
  final bool? amazonManaged;

  /// The Amazon Resource Name (ARN) of the resource configuration.
  final String? arn;

  /// The date and time that the resource configuration was created, in ISO-8601
  /// format.
  final DateTime? createdAt;

  /// The custom domain name of the resource configuration.
  final String? customDomainName;

  /// The ARN of the domain verification.
  final String? domainVerificationArn;

  /// The domain verification ID.
  final String? domainVerificationId;

  /// The domain verification status.
  final VerificationStatus? domainVerificationStatus;

  /// The reason the create-resource-configuration request failed.
  final String? failureReason;

  /// (GROUP) The group domain for a group resource configuration. Any domains
  /// that you create for the child resource are subdomains of the group domain.
  /// Child resources inherit the verification status of the domain.
  final String? groupDomain;

  /// The ID of the resource configuration.
  final String? id;

  /// The most recent date and time that the resource configuration was updated,
  /// in ISO-8601 format.
  final DateTime? lastUpdatedAt;

  /// The name of the resource configuration.
  final String? name;

  /// The TCP port ranges that a consumer can use to access a resource
  /// configuration. You can separate port ranges with a comma. Example: 1-65535
  /// or 1,2,22-30
  final List<String>? portRanges;

  /// The TCP protocol accepted by the specified resource configuration.
  final ProtocolType? protocol;

  /// The resource configuration.
  final ResourceConfigurationDefinition? resourceConfigurationDefinition;

  /// The ID of the group resource configuration.
  final String? resourceConfigurationGroupId;

  /// The ID of the resource gateway used to connect to the resource configuration
  /// in a given VPC. You can specify the resource gateway identifier only for
  /// resource configurations with type SINGLE, GROUP, or ARN.
  final String? resourceGatewayId;

  /// The status of the resource configuration.
  final ResourceConfigurationStatus? status;

  /// The type of resource configuration.
  ///
  /// <ul>
  /// <li>
  /// <code>SINGLE</code> - A single resource.
  /// </li>
  /// <li>
  /// <code>GROUP</code> - A group of resources.
  /// </li>
  /// <li>
  /// <code>CHILD</code> - A single resource that is part of a group resource
  /// configuration.
  /// </li>
  /// <li>
  /// <code>ARN</code> - An Amazon Web Services resource.
  /// </li>
  /// </ul>
  final ResourceConfigurationType? type;

  GetResourceConfigurationResponse({
    this.allowAssociationToShareableServiceNetwork,
    this.amazonManaged,
    this.arn,
    this.createdAt,
    this.customDomainName,
    this.domainVerificationArn,
    this.domainVerificationId,
    this.domainVerificationStatus,
    this.failureReason,
    this.groupDomain,
    this.id,
    this.lastUpdatedAt,
    this.name,
    this.portRanges,
    this.protocol,
    this.resourceConfigurationDefinition,
    this.resourceConfigurationGroupId,
    this.resourceGatewayId,
    this.status,
    this.type,
  });

  factory GetResourceConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceConfigurationResponse(
      allowAssociationToShareableServiceNetwork:
          json['allowAssociationToShareableServiceNetwork'] as bool?,
      amazonManaged: json['amazonManaged'] as bool?,
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      customDomainName: json['customDomainName'] as String?,
      domainVerificationArn: json['domainVerificationArn'] as String?,
      domainVerificationId: json['domainVerificationId'] as String?,
      domainVerificationStatus: (json['domainVerificationStatus'] as String?)
          ?.let(VerificationStatus.fromString),
      failureReason: json['failureReason'] as String?,
      groupDomain: json['groupDomain'] as String?,
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      portRanges: (json['portRanges'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      protocol: (json['protocol'] as String?)?.let(ProtocolType.fromString),
      resourceConfigurationDefinition:
          json['resourceConfigurationDefinition'] != null
              ? ResourceConfigurationDefinition.fromJson(
                  json['resourceConfigurationDefinition']
                      as Map<String, dynamic>)
              : null,
      resourceConfigurationGroupId:
          json['resourceConfigurationGroupId'] as String?,
      resourceGatewayId: json['resourceGatewayId'] as String?,
      status: (json['status'] as String?)
          ?.let(ResourceConfigurationStatus.fromString),
      type:
          (json['type'] as String?)?.let(ResourceConfigurationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final allowAssociationToShareableServiceNetwork =
        this.allowAssociationToShareableServiceNetwork;
    final amazonManaged = this.amazonManaged;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final customDomainName = this.customDomainName;
    final domainVerificationArn = this.domainVerificationArn;
    final domainVerificationId = this.domainVerificationId;
    final domainVerificationStatus = this.domainVerificationStatus;
    final failureReason = this.failureReason;
    final groupDomain = this.groupDomain;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final portRanges = this.portRanges;
    final protocol = this.protocol;
    final resourceConfigurationDefinition =
        this.resourceConfigurationDefinition;
    final resourceConfigurationGroupId = this.resourceConfigurationGroupId;
    final resourceGatewayId = this.resourceGatewayId;
    final status = this.status;
    final type = this.type;
    return {
      if (allowAssociationToShareableServiceNetwork != null)
        'allowAssociationToShareableServiceNetwork':
            allowAssociationToShareableServiceNetwork,
      if (amazonManaged != null) 'amazonManaged': amazonManaged,
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (domainVerificationArn != null)
        'domainVerificationArn': domainVerificationArn,
      if (domainVerificationId != null)
        'domainVerificationId': domainVerificationId,
      if (domainVerificationStatus != null)
        'domainVerificationStatus': domainVerificationStatus.value,
      if (failureReason != null) 'failureReason': failureReason,
      if (groupDomain != null) 'groupDomain': groupDomain,
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (portRanges != null) 'portRanges': portRanges,
      if (protocol != null) 'protocol': protocol.value,
      if (resourceConfigurationDefinition != null)
        'resourceConfigurationDefinition': resourceConfigurationDefinition,
      if (resourceConfigurationGroupId != null)
        'resourceConfigurationGroupId': resourceConfigurationGroupId,
      if (resourceGatewayId != null) 'resourceGatewayId': resourceGatewayId,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
    };
  }
}

class UpdateResourceConfigurationResponse {
  /// Indicates whether to add the resource configuration to service networks that
  /// are shared with other accounts.
  final bool? allowAssociationToShareableServiceNetwork;

  /// The Amazon Resource Name (ARN) of the resource configuration.
  final String? arn;

  /// The ID of the resource configuration.
  final String? id;

  /// The name of the resource configuration.
  final String? name;

  /// The TCP port ranges that a consumer can use to access a resource
  /// configuration. You can separate port ranges with a comma. Example: 1-65535
  /// or 1,2,22-30
  final List<String>? portRanges;

  /// The TCP protocol accepted by the specified resource configuration.
  final ProtocolType? protocol;

  /// The resource configuration.
  final ResourceConfigurationDefinition? resourceConfigurationDefinition;

  /// The ID of the group resource configuration.
  final String? resourceConfigurationGroupId;

  /// The ID of the resource gateway associated with the resource configuration.
  final String? resourceGatewayId;

  /// The status of the resource configuration.
  final ResourceConfigurationStatus? status;

  /// The type of resource configuration.
  ///
  /// <ul>
  /// <li>
  /// <code>SINGLE</code> - A single resource.
  /// </li>
  /// <li>
  /// <code>GROUP</code> - A group of resources.
  /// </li>
  /// <li>
  /// <code>CHILD</code> - A single resource that is part of a group resource
  /// configuration.
  /// </li>
  /// <li>
  /// <code>ARN</code> - An Amazon Web Services resource.
  /// </li>
  /// </ul>
  final ResourceConfigurationType? type;

  UpdateResourceConfigurationResponse({
    this.allowAssociationToShareableServiceNetwork,
    this.arn,
    this.id,
    this.name,
    this.portRanges,
    this.protocol,
    this.resourceConfigurationDefinition,
    this.resourceConfigurationGroupId,
    this.resourceGatewayId,
    this.status,
    this.type,
  });

  factory UpdateResourceConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateResourceConfigurationResponse(
      allowAssociationToShareableServiceNetwork:
          json['allowAssociationToShareableServiceNetwork'] as bool?,
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      portRanges: (json['portRanges'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      protocol: (json['protocol'] as String?)?.let(ProtocolType.fromString),
      resourceConfigurationDefinition:
          json['resourceConfigurationDefinition'] != null
              ? ResourceConfigurationDefinition.fromJson(
                  json['resourceConfigurationDefinition']
                      as Map<String, dynamic>)
              : null,
      resourceConfigurationGroupId:
          json['resourceConfigurationGroupId'] as String?,
      resourceGatewayId: json['resourceGatewayId'] as String?,
      status: (json['status'] as String?)
          ?.let(ResourceConfigurationStatus.fromString),
      type:
          (json['type'] as String?)?.let(ResourceConfigurationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final allowAssociationToShareableServiceNetwork =
        this.allowAssociationToShareableServiceNetwork;
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final portRanges = this.portRanges;
    final protocol = this.protocol;
    final resourceConfigurationDefinition =
        this.resourceConfigurationDefinition;
    final resourceConfigurationGroupId = this.resourceConfigurationGroupId;
    final resourceGatewayId = this.resourceGatewayId;
    final status = this.status;
    final type = this.type;
    return {
      if (allowAssociationToShareableServiceNetwork != null)
        'allowAssociationToShareableServiceNetwork':
            allowAssociationToShareableServiceNetwork,
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (portRanges != null) 'portRanges': portRanges,
      if (protocol != null) 'protocol': protocol.value,
      if (resourceConfigurationDefinition != null)
        'resourceConfigurationDefinition': resourceConfigurationDefinition,
      if (resourceConfigurationGroupId != null)
        'resourceConfigurationGroupId': resourceConfigurationGroupId,
      if (resourceGatewayId != null) 'resourceGatewayId': resourceGatewayId,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
    };
  }
}

class DeleteResourceConfigurationResponse {
  DeleteResourceConfigurationResponse();

  factory DeleteResourceConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResourceConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListResourceConfigurationsResponse {
  /// Information about the resource configurations.
  final List<ResourceConfigurationSummary>? items;

  /// If there are additional results, a pagination token for the next page of
  /// results.
  final String? nextToken;

  ListResourceConfigurationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListResourceConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListResourceConfigurationsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              ResourceConfigurationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DeleteResourceEndpointAssociationResponse {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The ID of the association.
  final String? id;

  /// The Amazon Resource Name (ARN) of the resource configuration associated with
  /// the VPC endpoint of type resource.
  final String? resourceConfigurationArn;

  /// The ID of the resource configuration.
  final String? resourceConfigurationId;

  /// The ID of the resource VPC endpoint that is associated with the resource
  /// configuration.
  final String? vpcEndpointId;

  DeleteResourceEndpointAssociationResponse({
    this.arn,
    this.id,
    this.resourceConfigurationArn,
    this.resourceConfigurationId,
    this.vpcEndpointId,
  });

  factory DeleteResourceEndpointAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteResourceEndpointAssociationResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      resourceConfigurationArn: json['resourceConfigurationArn'] as String?,
      resourceConfigurationId: json['resourceConfigurationId'] as String?,
      vpcEndpointId: json['vpcEndpointId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final resourceConfigurationArn = this.resourceConfigurationArn;
    final resourceConfigurationId = this.resourceConfigurationId;
    final vpcEndpointId = this.vpcEndpointId;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (resourceConfigurationArn != null)
        'resourceConfigurationArn': resourceConfigurationArn,
      if (resourceConfigurationId != null)
        'resourceConfigurationId': resourceConfigurationId,
      if (vpcEndpointId != null) 'vpcEndpointId': vpcEndpointId,
    };
  }
}

class ListResourceEndpointAssociationsResponse {
  /// Information about the VPC endpoint associations.
  final List<ResourceEndpointAssociationSummary> items;

  /// If there are additional results, a pagination token for the next page of
  /// results.
  final String? nextToken;

  ListResourceEndpointAssociationsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListResourceEndpointAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListResourceEndpointAssociationsResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => ResourceEndpointAssociationSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateResourceGatewayResponse {
  /// The Amazon Resource Name (ARN) of the resource gateway.
  final String? arn;

  /// The ID of the resource gateway.
  final String? id;

  /// The type of IP address for the resource gateway.
  final ResourceGatewayIpAddressType? ipAddressType;

  /// The number of IPv4 addresses in each ENI for the resource gateway.
  final int? ipv4AddressesPerEni;

  /// The name of the resource gateway.
  final String? name;

  /// The DNS resolution type for resource configurations that are associated with
  /// this resource gateway.
  final ResourceConfigDnsResolution? resourceConfigDnsResolution;

  /// The IDs of the security groups for the resource gateway.
  final List<String>? securityGroupIds;

  /// The status of the resource gateway.
  final ResourceGatewayStatus? status;

  /// The IDs of the resource gateway subnets.
  final List<String>? subnetIds;

  /// The ID of the VPC.
  final String? vpcIdentifier;

  CreateResourceGatewayResponse({
    this.arn,
    this.id,
    this.ipAddressType,
    this.ipv4AddressesPerEni,
    this.name,
    this.resourceConfigDnsResolution,
    this.securityGroupIds,
    this.status,
    this.subnetIds,
    this.vpcIdentifier,
  });

  factory CreateResourceGatewayResponse.fromJson(Map<String, dynamic> json) {
    return CreateResourceGatewayResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      ipAddressType: (json['ipAddressType'] as String?)
          ?.let(ResourceGatewayIpAddressType.fromString),
      ipv4AddressesPerEni: json['ipv4AddressesPerEni'] as int?,
      name: json['name'] as String?,
      resourceConfigDnsResolution:
          (json['resourceConfigDnsResolution'] as String?)
              ?.let(ResourceConfigDnsResolution.fromString),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status:
          (json['status'] as String?)?.let(ResourceGatewayStatus.fromString),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcIdentifier: json['vpcIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final ipAddressType = this.ipAddressType;
    final ipv4AddressesPerEni = this.ipv4AddressesPerEni;
    final name = this.name;
    final resourceConfigDnsResolution = this.resourceConfigDnsResolution;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    final subnetIds = this.subnetIds;
    final vpcIdentifier = this.vpcIdentifier;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (ipv4AddressesPerEni != null)
        'ipv4AddressesPerEni': ipv4AddressesPerEni,
      if (name != null) 'name': name,
      if (resourceConfigDnsResolution != null)
        'resourceConfigDnsResolution': resourceConfigDnsResolution.value,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (status != null) 'status': status.value,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcIdentifier != null) 'vpcIdentifier': vpcIdentifier,
    };
  }
}

class GetResourceGatewayResponse {
  /// The Amazon Resource Name (ARN) of the resource gateway.
  final String? arn;

  /// The date and time that the resource gateway was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The ID of the resource gateway.
  final String? id;

  /// The type of IP address for the resource gateway.
  final ResourceGatewayIpAddressType? ipAddressType;

  /// The number of IPv4 addresses in each ENI for the resource gateway.
  final int? ipv4AddressesPerEni;

  /// The date and time that the resource gateway was last updated, in ISO-8601
  /// format.
  final DateTime? lastUpdatedAt;

  /// The AWS service that manages the resource gateway.
  final String? managedBy;

  /// The name of the resource gateway.
  final String? name;

  /// The DNS resolution type for resource configurations that are associated with
  /// this resource gateway.
  final ResourceConfigDnsResolution? resourceConfigDnsResolution;

  /// The security group IDs associated with the resource gateway.
  final List<String>? securityGroupIds;

  /// Indicates whether the resource gateway is managed by an AWS service.
  final bool? serviceManaged;

  /// The status for the resource gateway.
  final ResourceGatewayStatus? status;

  /// The IDs of the VPC subnets for resource gateway.
  final List<String>? subnetIds;

  /// The ID of the VPC for the resource gateway.
  final String? vpcId;

  GetResourceGatewayResponse({
    this.arn,
    this.createdAt,
    this.id,
    this.ipAddressType,
    this.ipv4AddressesPerEni,
    this.lastUpdatedAt,
    this.managedBy,
    this.name,
    this.resourceConfigDnsResolution,
    this.securityGroupIds,
    this.serviceManaged,
    this.status,
    this.subnetIds,
    this.vpcId,
  });

  factory GetResourceGatewayResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceGatewayResponse(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      ipAddressType: (json['ipAddressType'] as String?)
          ?.let(ResourceGatewayIpAddressType.fromString),
      ipv4AddressesPerEni: json['ipv4AddressesPerEni'] as int?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      managedBy: json['managedBy'] as String?,
      name: json['name'] as String?,
      resourceConfigDnsResolution:
          (json['resourceConfigDnsResolution'] as String?)
              ?.let(ResourceConfigDnsResolution.fromString),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      serviceManaged: json['serviceManaged'] as bool?,
      status:
          (json['status'] as String?)?.let(ResourceGatewayStatus.fromString),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final ipAddressType = this.ipAddressType;
    final ipv4AddressesPerEni = this.ipv4AddressesPerEni;
    final lastUpdatedAt = this.lastUpdatedAt;
    final managedBy = this.managedBy;
    final name = this.name;
    final resourceConfigDnsResolution = this.resourceConfigDnsResolution;
    final securityGroupIds = this.securityGroupIds;
    final serviceManaged = this.serviceManaged;
    final status = this.status;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (id != null) 'id': id,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (ipv4AddressesPerEni != null)
        'ipv4AddressesPerEni': ipv4AddressesPerEni,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (managedBy != null) 'managedBy': managedBy,
      if (name != null) 'name': name,
      if (resourceConfigDnsResolution != null)
        'resourceConfigDnsResolution': resourceConfigDnsResolution.value,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (serviceManaged != null) 'serviceManaged': serviceManaged,
      if (status != null) 'status': status.value,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

class UpdateResourceGatewayResponse {
  /// The Amazon Resource Name (ARN) of the resource gateway.
  final String? arn;

  /// The ID of the resource gateway.
  final String? id;

  /// The type of IP address used by the resource gateway.
  final IpAddressType? ipAddressType;

  /// The name of the resource gateway.
  final String? name;

  /// The IDs of the security groups associated with the resource gateway.
  final List<String>? securityGroupIds;

  /// The status of the resource gateway.
  final ResourceGatewayStatus? status;

  /// The IDs of the VPC subnets for the resource gateway.
  final List<String>? subnetIds;

  /// The ID of the VPC for the resource gateway.
  final String? vpcId;

  UpdateResourceGatewayResponse({
    this.arn,
    this.id,
    this.ipAddressType,
    this.name,
    this.securityGroupIds,
    this.status,
    this.subnetIds,
    this.vpcId,
  });

  factory UpdateResourceGatewayResponse.fromJson(Map<String, dynamic> json) {
    return UpdateResourceGatewayResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      ipAddressType:
          (json['ipAddressType'] as String?)?.let(IpAddressType.fromString),
      name: json['name'] as String?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status:
          (json['status'] as String?)?.let(ResourceGatewayStatus.fromString),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final ipAddressType = this.ipAddressType;
    final name = this.name;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (name != null) 'name': name,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (status != null) 'status': status.value,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

class DeleteResourceGatewayResponse {
  /// The Amazon Resource Name (ARN) of the resource gateway.
  final String? arn;

  /// The ID of the resource gateway.
  final String? id;

  /// The name of the resource gateway.
  final String? name;

  /// The status of the resource gateway.
  final ResourceGatewayStatus? status;

  DeleteResourceGatewayResponse({
    this.arn,
    this.id,
    this.name,
    this.status,
  });

  factory DeleteResourceGatewayResponse.fromJson(Map<String, dynamic> json) {
    return DeleteResourceGatewayResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      status:
          (json['status'] as String?)?.let(ResourceGatewayStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

class ListResourceGatewaysResponse {
  /// Information about the resource gateways.
  final List<ResourceGatewaySummary>? items;

  /// If there are additional results, a pagination token for the next page of
  /// results.
  final String? nextToken;

  ListResourceGatewaysResponse({
    this.items,
    this.nextToken,
  });

  factory ListResourceGatewaysResponse.fromJson(Map<String, dynamic> json) {
    return ListResourceGatewaysResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map(
              (e) => ResourceGatewaySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateRuleResponse {
  /// The rule action.
  final RuleAction? action;

  /// The Amazon Resource Name (ARN) of the rule.
  final String? arn;

  /// The ID of the rule.
  final String? id;

  /// The rule match. The <code>RuleMatch</code> must be an
  /// <code>HttpMatch</code>. This means that the rule should be an exact match on
  /// HTTP constraints which are made up of the HTTP method, path, and header.
  final RuleMatch? match;

  /// The name of the rule.
  final String? name;

  /// The priority assigned to the rule. The lower the priority number the higher
  /// the priority.
  final int? priority;

  CreateRuleResponse({
    this.action,
    this.arn,
    this.id,
    this.match,
    this.name,
    this.priority,
  });

  factory CreateRuleResponse.fromJson(Map<String, dynamic> json) {
    return CreateRuleResponse(
      action: json['action'] != null
          ? RuleAction.fromJson(json['action'] as Map<String, dynamic>)
          : null,
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      match: json['match'] != null
          ? RuleMatch.fromJson(json['match'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      priority: json['priority'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final arn = this.arn;
    final id = this.id;
    final match = this.match;
    final name = this.name;
    final priority = this.priority;
    return {
      if (action != null) 'action': action,
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (match != null) 'match': match,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
    };
  }
}

class GetRuleResponse {
  /// The action for the default rule.
  final RuleAction? action;

  /// The Amazon Resource Name (ARN) of the listener.
  final String? arn;

  /// The date and time that the listener rule was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The ID of the listener.
  final String? id;

  /// Indicates whether this is the default rule.
  final bool? isDefault;

  /// The date and time that the listener rule was last updated, in ISO-8601
  /// format.
  final DateTime? lastUpdatedAt;

  /// The rule match.
  final RuleMatch? match;

  /// The name of the listener.
  final String? name;

  /// The priority level for the specified rule.
  final int? priority;

  GetRuleResponse({
    this.action,
    this.arn,
    this.createdAt,
    this.id,
    this.isDefault,
    this.lastUpdatedAt,
    this.match,
    this.name,
    this.priority,
  });

  factory GetRuleResponse.fromJson(Map<String, dynamic> json) {
    return GetRuleResponse(
      action: json['action'] != null
          ? RuleAction.fromJson(json['action'] as Map<String, dynamic>)
          : null,
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      isDefault: json['isDefault'] as bool?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      match: json['match'] != null
          ? RuleMatch.fromJson(json['match'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      priority: json['priority'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final isDefault = this.isDefault;
    final lastUpdatedAt = this.lastUpdatedAt;
    final match = this.match;
    final name = this.name;
    final priority = this.priority;
    return {
      if (action != null) 'action': action,
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (id != null) 'id': id,
      if (isDefault != null) 'isDefault': isDefault,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (match != null) 'match': match,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
    };
  }
}

class UpdateRuleResponse {
  /// Information about the action for the specified listener rule.
  final RuleAction? action;

  /// The Amazon Resource Name (ARN) of the listener.
  final String? arn;

  /// The ID of the listener.
  final String? id;

  /// Indicates whether this is the default rule.
  final bool? isDefault;

  /// The rule match.
  final RuleMatch? match;

  /// The name of the listener.
  final String? name;

  /// The rule priority.
  final int? priority;

  UpdateRuleResponse({
    this.action,
    this.arn,
    this.id,
    this.isDefault,
    this.match,
    this.name,
    this.priority,
  });

  factory UpdateRuleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRuleResponse(
      action: json['action'] != null
          ? RuleAction.fromJson(json['action'] as Map<String, dynamic>)
          : null,
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      isDefault: json['isDefault'] as bool?,
      match: json['match'] != null
          ? RuleMatch.fromJson(json['match'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      priority: json['priority'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final arn = this.arn;
    final id = this.id;
    final isDefault = this.isDefault;
    final match = this.match;
    final name = this.name;
    final priority = this.priority;
    return {
      if (action != null) 'action': action,
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (isDefault != null) 'isDefault': isDefault,
      if (match != null) 'match': match,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
    };
  }
}

class DeleteRuleResponse {
  DeleteRuleResponse();

  factory DeleteRuleResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRuleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListRulesResponse {
  /// Information about the rules.
  final List<RuleSummary> items;

  /// If there are additional results, a pagination token for the next page of
  /// results.
  final String? nextToken;

  ListRulesResponse({
    required this.items,
    this.nextToken,
  });

  factory ListRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListRulesResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => RuleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateServiceResponse {
  /// The Amazon Resource Name (ARN) of the service.
  final String? arn;

  /// The type of IAM policy.
  final AuthType? authType;

  /// The Amazon Resource Name (ARN) of the certificate.
  final String? certificateArn;

  /// The custom domain name of the service.
  final String? customDomainName;

  /// The public DNS name of the service.
  final DnsEntry? dnsEntry;

  /// The ID of the service.
  final String? id;

  /// The name of the service.
  final String? name;

  /// The status. If the status is <code>CREATE_FAILED</code>, you must delete and
  /// recreate the service.
  final ServiceStatus? status;

  CreateServiceResponse({
    this.arn,
    this.authType,
    this.certificateArn,
    this.customDomainName,
    this.dnsEntry,
    this.id,
    this.name,
    this.status,
  });

  factory CreateServiceResponse.fromJson(Map<String, dynamic> json) {
    return CreateServiceResponse(
      arn: json['arn'] as String?,
      authType: (json['authType'] as String?)?.let(AuthType.fromString),
      certificateArn: json['certificateArn'] as String?,
      customDomainName: json['customDomainName'] as String?,
      dnsEntry: json['dnsEntry'] != null
          ? DnsEntry.fromJson(json['dnsEntry'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(ServiceStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authType = this.authType;
    final certificateArn = this.certificateArn;
    final customDomainName = this.customDomainName;
    final dnsEntry = this.dnsEntry;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (authType != null) 'authType': authType.value,
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (dnsEntry != null) 'dnsEntry': dnsEntry,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

class GetServiceResponse {
  /// The Amazon Resource Name (ARN) of the service.
  final String? arn;

  /// The type of IAM policy.
  final AuthType? authType;

  /// The Amazon Resource Name (ARN) of the certificate.
  final String? certificateArn;

  /// The date and time that the service was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The custom domain name of the service.
  final String? customDomainName;

  /// The DNS name of the service.
  final DnsEntry? dnsEntry;

  /// The failure code.
  final String? failureCode;

  /// The failure message.
  final String? failureMessage;

  /// The ID of the service.
  final String? id;

  /// The date and time that the service was last updated, in ISO-8601 format.
  final DateTime? lastUpdatedAt;

  /// The name of the service.
  final String? name;

  /// The status of the service.
  final ServiceStatus? status;

  GetServiceResponse({
    this.arn,
    this.authType,
    this.certificateArn,
    this.createdAt,
    this.customDomainName,
    this.dnsEntry,
    this.failureCode,
    this.failureMessage,
    this.id,
    this.lastUpdatedAt,
    this.name,
    this.status,
  });

  factory GetServiceResponse.fromJson(Map<String, dynamic> json) {
    return GetServiceResponse(
      arn: json['arn'] as String?,
      authType: (json['authType'] as String?)?.let(AuthType.fromString),
      certificateArn: json['certificateArn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      customDomainName: json['customDomainName'] as String?,
      dnsEntry: json['dnsEntry'] != null
          ? DnsEntry.fromJson(json['dnsEntry'] as Map<String, dynamic>)
          : null,
      failureCode: json['failureCode'] as String?,
      failureMessage: json['failureMessage'] as String?,
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(ServiceStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authType = this.authType;
    final certificateArn = this.certificateArn;
    final createdAt = this.createdAt;
    final customDomainName = this.customDomainName;
    final dnsEntry = this.dnsEntry;
    final failureCode = this.failureCode;
    final failureMessage = this.failureMessage;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (authType != null) 'authType': authType.value,
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (dnsEntry != null) 'dnsEntry': dnsEntry,
      if (failureCode != null) 'failureCode': failureCode,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

class UpdateServiceResponse {
  /// The Amazon Resource Name (ARN) of the service.
  final String? arn;

  /// The type of IAM policy.
  final AuthType? authType;

  /// The Amazon Resource Name (ARN) of the certificate.
  final String? certificateArn;

  /// The custom domain name of the service.
  final String? customDomainName;

  /// The ID of the service.
  final String? id;

  /// The name of the service.
  final String? name;

  UpdateServiceResponse({
    this.arn,
    this.authType,
    this.certificateArn,
    this.customDomainName,
    this.id,
    this.name,
  });

  factory UpdateServiceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateServiceResponse(
      arn: json['arn'] as String?,
      authType: (json['authType'] as String?)?.let(AuthType.fromString),
      certificateArn: json['certificateArn'] as String?,
      customDomainName: json['customDomainName'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authType = this.authType;
    final certificateArn = this.certificateArn;
    final customDomainName = this.customDomainName;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (authType != null) 'authType': authType.value,
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

class DeleteServiceResponse {
  /// The Amazon Resource Name (ARN) of the service.
  final String? arn;

  /// The ID of the service.
  final String? id;

  /// The name of the service.
  final String? name;

  /// The status. You can retry the operation if the status is
  /// <code>DELETE_FAILED</code>. However, if you retry it while the status is
  /// <code>DELETE_IN_PROGRESS</code>, the status doesn't change.
  final ServiceStatus? status;

  DeleteServiceResponse({
    this.arn,
    this.id,
    this.name,
    this.status,
  });

  factory DeleteServiceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteServiceResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(ServiceStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

class ListServicesResponse {
  /// Information about the services.
  final List<ServiceSummary>? items;

  /// If there are additional results, a pagination token for the next page of
  /// results.
  final String? nextToken;

  ListServicesResponse({
    this.items,
    this.nextToken,
  });

  factory ListServicesResponse.fromJson(Map<String, dynamic> json) {
    return ListServicesResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ServiceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateServiceNetworkResponse {
  /// The Amazon Resource Name (ARN) of the service network.
  final String? arn;

  /// The type of IAM policy.
  final AuthType? authType;

  /// The ID of the service network.
  final String? id;

  /// The name of the service network.
  final String? name;

  /// Specifies if the service network is enabled for sharing.
  final SharingConfig? sharingConfig;

  CreateServiceNetworkResponse({
    this.arn,
    this.authType,
    this.id,
    this.name,
    this.sharingConfig,
  });

  factory CreateServiceNetworkResponse.fromJson(Map<String, dynamic> json) {
    return CreateServiceNetworkResponse(
      arn: json['arn'] as String?,
      authType: (json['authType'] as String?)?.let(AuthType.fromString),
      id: json['id'] as String?,
      name: json['name'] as String?,
      sharingConfig: json['sharingConfig'] != null
          ? SharingConfig.fromJson(
              json['sharingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authType = this.authType;
    final id = this.id;
    final name = this.name;
    final sharingConfig = this.sharingConfig;
    return {
      if (arn != null) 'arn': arn,
      if (authType != null) 'authType': authType.value,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sharingConfig != null) 'sharingConfig': sharingConfig,
    };
  }
}

class GetServiceNetworkResponse {
  /// The Amazon Resource Name (ARN) of the service network.
  final String? arn;

  /// The type of IAM policy.
  final AuthType? authType;

  /// The date and time that the service network was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The ID of the service network.
  final String? id;

  /// The date and time of the last update, in ISO-8601 format.
  final DateTime? lastUpdatedAt;

  /// The name of the service network.
  final String? name;

  /// The number of services associated with the service network.
  final int? numberOfAssociatedServices;

  /// The number of VPCs associated with the service network.
  final int? numberOfAssociatedVPCs;

  /// Specifies if the service network is enabled for sharing.
  final SharingConfig? sharingConfig;

  GetServiceNetworkResponse({
    this.arn,
    this.authType,
    this.createdAt,
    this.id,
    this.lastUpdatedAt,
    this.name,
    this.numberOfAssociatedServices,
    this.numberOfAssociatedVPCs,
    this.sharingConfig,
  });

  factory GetServiceNetworkResponse.fromJson(Map<String, dynamic> json) {
    return GetServiceNetworkResponse(
      arn: json['arn'] as String?,
      authType: (json['authType'] as String?)?.let(AuthType.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      numberOfAssociatedServices: json['numberOfAssociatedServices'] as int?,
      numberOfAssociatedVPCs: json['numberOfAssociatedVPCs'] as int?,
      sharingConfig: json['sharingConfig'] != null
          ? SharingConfig.fromJson(
              json['sharingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authType = this.authType;
    final createdAt = this.createdAt;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final numberOfAssociatedServices = this.numberOfAssociatedServices;
    final numberOfAssociatedVPCs = this.numberOfAssociatedVPCs;
    final sharingConfig = this.sharingConfig;
    return {
      if (arn != null) 'arn': arn,
      if (authType != null) 'authType': authType.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (numberOfAssociatedServices != null)
        'numberOfAssociatedServices': numberOfAssociatedServices,
      if (numberOfAssociatedVPCs != null)
        'numberOfAssociatedVPCs': numberOfAssociatedVPCs,
      if (sharingConfig != null) 'sharingConfig': sharingConfig,
    };
  }
}

class UpdateServiceNetworkResponse {
  /// The Amazon Resource Name (ARN) of the service network.
  final String? arn;

  /// The type of IAM policy.
  final AuthType? authType;

  /// The ID of the service network.
  final String? id;

  /// The name of the service network.
  final String? name;

  UpdateServiceNetworkResponse({
    this.arn,
    this.authType,
    this.id,
    this.name,
  });

  factory UpdateServiceNetworkResponse.fromJson(Map<String, dynamic> json) {
    return UpdateServiceNetworkResponse(
      arn: json['arn'] as String?,
      authType: (json['authType'] as String?)?.let(AuthType.fromString),
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authType = this.authType;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (authType != null) 'authType': authType.value,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

class DeleteServiceNetworkResponse {
  DeleteServiceNetworkResponse();

  factory DeleteServiceNetworkResponse.fromJson(Map<String, dynamic> _) {
    return DeleteServiceNetworkResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListServiceNetworksResponse {
  /// Information about the service networks.
  final List<ServiceNetworkSummary> items;

  /// If there are additional results, a pagination token for the next page of
  /// results.
  final String? nextToken;

  ListServiceNetworksResponse({
    required this.items,
    this.nextToken,
  });

  factory ListServiceNetworksResponse.fromJson(Map<String, dynamic> json) {
    return ListServiceNetworksResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => ServiceNetworkSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateServiceNetworkResourceAssociationResponse {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The ID of the account that created the association.
  final String? createdBy;

  /// The ID of the association.
  final String? id;

  /// Indicates if private DNS is is enabled for the service network resource
  /// association.
  final bool? privateDnsEnabled;

  /// The status of the association.
  final ServiceNetworkResourceAssociationStatus? status;

  CreateServiceNetworkResourceAssociationResponse({
    this.arn,
    this.createdBy,
    this.id,
    this.privateDnsEnabled,
    this.status,
  });

  factory CreateServiceNetworkResourceAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateServiceNetworkResourceAssociationResponse(
      arn: json['arn'] as String?,
      createdBy: json['createdBy'] as String?,
      id: json['id'] as String?,
      privateDnsEnabled: json['privateDnsEnabled'] as bool?,
      status: (json['status'] as String?)
          ?.let(ServiceNetworkResourceAssociationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdBy = this.createdBy;
    final id = this.id;
    final privateDnsEnabled = this.privateDnsEnabled;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (createdBy != null) 'createdBy': createdBy,
      if (id != null) 'id': id,
      if (privateDnsEnabled != null) 'privateDnsEnabled': privateDnsEnabled,
      if (status != null) 'status': status.value,
    };
  }
}

class GetServiceNetworkResourceAssociationResponse {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The date and time that the association was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The account that created the association.
  final String? createdBy;

  /// The DNS entry for the service.
  final DnsEntry? dnsEntry;

  /// The domain verification status in the service network resource association.
  final VerificationStatus? domainVerificationStatus;

  /// The failure code.
  final String? failureCode;

  /// The reason the association request failed.
  final String? failureReason;

  /// The ID of the association.
  final String? id;

  /// Indicates whether the association is managed by Amazon.
  final bool? isManagedAssociation;

  /// The most recent date and time that the association was updated, in ISO-8601
  /// format.
  final DateTime? lastUpdatedAt;

  /// Indicates if private DNS is enabled in the service network resource
  /// association.
  final bool? privateDnsEnabled;

  /// The private DNS entry for the service.
  final DnsEntry? privateDnsEntry;

  /// The Amazon Resource Name (ARN) of the association.
  final String? resourceConfigurationArn;

  /// The ID of the resource configuration that is associated with the service
  /// network.
  final String? resourceConfigurationId;

  /// The name of the resource configuration that is associated with the service
  /// network.
  final String? resourceConfigurationName;

  /// The Amazon Resource Name (ARN) of the service network that is associated
  /// with the resource configuration.
  final String? serviceNetworkArn;

  /// The ID of the service network that is associated with the resource
  /// configuration.
  final String? serviceNetworkId;

  /// The name of the service network that is associated with the resource
  /// configuration.
  final String? serviceNetworkName;

  /// The status of the association.
  final ServiceNetworkResourceAssociationStatus? status;

  GetServiceNetworkResourceAssociationResponse({
    this.arn,
    this.createdAt,
    this.createdBy,
    this.dnsEntry,
    this.domainVerificationStatus,
    this.failureCode,
    this.failureReason,
    this.id,
    this.isManagedAssociation,
    this.lastUpdatedAt,
    this.privateDnsEnabled,
    this.privateDnsEntry,
    this.resourceConfigurationArn,
    this.resourceConfigurationId,
    this.resourceConfigurationName,
    this.serviceNetworkArn,
    this.serviceNetworkId,
    this.serviceNetworkName,
    this.status,
  });

  factory GetServiceNetworkResourceAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetServiceNetworkResourceAssociationResponse(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      dnsEntry: json['dnsEntry'] != null
          ? DnsEntry.fromJson(json['dnsEntry'] as Map<String, dynamic>)
          : null,
      domainVerificationStatus: (json['domainVerificationStatus'] as String?)
          ?.let(VerificationStatus.fromString),
      failureCode: json['failureCode'] as String?,
      failureReason: json['failureReason'] as String?,
      id: json['id'] as String?,
      isManagedAssociation: json['isManagedAssociation'] as bool?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      privateDnsEnabled: json['privateDnsEnabled'] as bool?,
      privateDnsEntry: json['privateDnsEntry'] != null
          ? DnsEntry.fromJson(json['privateDnsEntry'] as Map<String, dynamic>)
          : null,
      resourceConfigurationArn: json['resourceConfigurationArn'] as String?,
      resourceConfigurationId: json['resourceConfigurationId'] as String?,
      resourceConfigurationName: json['resourceConfigurationName'] as String?,
      serviceNetworkArn: json['serviceNetworkArn'] as String?,
      serviceNetworkId: json['serviceNetworkId'] as String?,
      serviceNetworkName: json['serviceNetworkName'] as String?,
      status: (json['status'] as String?)
          ?.let(ServiceNetworkResourceAssociationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final dnsEntry = this.dnsEntry;
    final domainVerificationStatus = this.domainVerificationStatus;
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final id = this.id;
    final isManagedAssociation = this.isManagedAssociation;
    final lastUpdatedAt = this.lastUpdatedAt;
    final privateDnsEnabled = this.privateDnsEnabled;
    final privateDnsEntry = this.privateDnsEntry;
    final resourceConfigurationArn = this.resourceConfigurationArn;
    final resourceConfigurationId = this.resourceConfigurationId;
    final resourceConfigurationName = this.resourceConfigurationName;
    final serviceNetworkArn = this.serviceNetworkArn;
    final serviceNetworkId = this.serviceNetworkId;
    final serviceNetworkName = this.serviceNetworkName;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (dnsEntry != null) 'dnsEntry': dnsEntry,
      if (domainVerificationStatus != null)
        'domainVerificationStatus': domainVerificationStatus.value,
      if (failureCode != null) 'failureCode': failureCode,
      if (failureReason != null) 'failureReason': failureReason,
      if (id != null) 'id': id,
      if (isManagedAssociation != null)
        'isManagedAssociation': isManagedAssociation,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (privateDnsEnabled != null) 'privateDnsEnabled': privateDnsEnabled,
      if (privateDnsEntry != null) 'privateDnsEntry': privateDnsEntry,
      if (resourceConfigurationArn != null)
        'resourceConfigurationArn': resourceConfigurationArn,
      if (resourceConfigurationId != null)
        'resourceConfigurationId': resourceConfigurationId,
      if (resourceConfigurationName != null)
        'resourceConfigurationName': resourceConfigurationName,
      if (serviceNetworkArn != null) 'serviceNetworkArn': serviceNetworkArn,
      if (serviceNetworkId != null) 'serviceNetworkId': serviceNetworkId,
      if (serviceNetworkName != null) 'serviceNetworkName': serviceNetworkName,
      if (status != null) 'status': status.value,
    };
  }
}

class DeleteServiceNetworkResourceAssociationResponse {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The ID of the association.
  final String? id;

  /// The status of the association.
  final ServiceNetworkResourceAssociationStatus? status;

  DeleteServiceNetworkResourceAssociationResponse({
    this.arn,
    this.id,
    this.status,
  });

  factory DeleteServiceNetworkResourceAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteServiceNetworkResourceAssociationResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)
          ?.let(ServiceNetworkResourceAssociationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (status != null) 'status': status.value,
    };
  }
}

class ListServiceNetworkResourceAssociationsResponse {
  /// Information about the associations.
  final List<ServiceNetworkResourceAssociationSummary> items;

  /// If there are additional results, a pagination token for the next page of
  /// results.
  final String? nextToken;

  ListServiceNetworkResourceAssociationsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListServiceNetworkResourceAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListServiceNetworkResourceAssociationsResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => ServiceNetworkResourceAssociationSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateServiceNetworkServiceAssociationResponse {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The account that created the association.
  final String? createdBy;

  /// The custom domain name of the service.
  final String? customDomainName;

  /// The DNS name of the service.
  final DnsEntry? dnsEntry;

  /// The ID of the association.
  final String? id;

  /// The association status.
  final ServiceNetworkServiceAssociationStatus? status;

  CreateServiceNetworkServiceAssociationResponse({
    this.arn,
    this.createdBy,
    this.customDomainName,
    this.dnsEntry,
    this.id,
    this.status,
  });

  factory CreateServiceNetworkServiceAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateServiceNetworkServiceAssociationResponse(
      arn: json['arn'] as String?,
      createdBy: json['createdBy'] as String?,
      customDomainName: json['customDomainName'] as String?,
      dnsEntry: json['dnsEntry'] != null
          ? DnsEntry.fromJson(json['dnsEntry'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      status: (json['status'] as String?)
          ?.let(ServiceNetworkServiceAssociationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdBy = this.createdBy;
    final customDomainName = this.customDomainName;
    final dnsEntry = this.dnsEntry;
    final id = this.id;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (createdBy != null) 'createdBy': createdBy,
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (dnsEntry != null) 'dnsEntry': dnsEntry,
      if (id != null) 'id': id,
      if (status != null) 'status': status.value,
    };
  }
}

class GetServiceNetworkServiceAssociationResponse {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The date and time that the association was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The account that created the association.
  final String? createdBy;

  /// The custom domain name of the service.
  final String? customDomainName;

  /// The DNS name of the service.
  final DnsEntry? dnsEntry;

  /// The failure code.
  final String? failureCode;

  /// The failure message.
  final String? failureMessage;

  /// The ID of the service network and service association.
  final String? id;

  /// The Amazon Resource Name (ARN) of the service.
  final String? serviceArn;

  /// The ID of the service.
  final String? serviceId;

  /// The name of the service.
  final String? serviceName;

  /// The Amazon Resource Name (ARN) of the service network.
  final String? serviceNetworkArn;

  /// The ID of the service network.
  final String? serviceNetworkId;

  /// The name of the service network.
  final String? serviceNetworkName;

  /// The status of the association.
  final ServiceNetworkServiceAssociationStatus? status;

  GetServiceNetworkServiceAssociationResponse({
    this.arn,
    this.createdAt,
    this.createdBy,
    this.customDomainName,
    this.dnsEntry,
    this.failureCode,
    this.failureMessage,
    this.id,
    this.serviceArn,
    this.serviceId,
    this.serviceName,
    this.serviceNetworkArn,
    this.serviceNetworkId,
    this.serviceNetworkName,
    this.status,
  });

  factory GetServiceNetworkServiceAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetServiceNetworkServiceAssociationResponse(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      customDomainName: json['customDomainName'] as String?,
      dnsEntry: json['dnsEntry'] != null
          ? DnsEntry.fromJson(json['dnsEntry'] as Map<String, dynamic>)
          : null,
      failureCode: json['failureCode'] as String?,
      failureMessage: json['failureMessage'] as String?,
      id: json['id'] as String?,
      serviceArn: json['serviceArn'] as String?,
      serviceId: json['serviceId'] as String?,
      serviceName: json['serviceName'] as String?,
      serviceNetworkArn: json['serviceNetworkArn'] as String?,
      serviceNetworkId: json['serviceNetworkId'] as String?,
      serviceNetworkName: json['serviceNetworkName'] as String?,
      status: (json['status'] as String?)
          ?.let(ServiceNetworkServiceAssociationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final customDomainName = this.customDomainName;
    final dnsEntry = this.dnsEntry;
    final failureCode = this.failureCode;
    final failureMessage = this.failureMessage;
    final id = this.id;
    final serviceArn = this.serviceArn;
    final serviceId = this.serviceId;
    final serviceName = this.serviceName;
    final serviceNetworkArn = this.serviceNetworkArn;
    final serviceNetworkId = this.serviceNetworkId;
    final serviceNetworkName = this.serviceNetworkName;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (dnsEntry != null) 'dnsEntry': dnsEntry,
      if (failureCode != null) 'failureCode': failureCode,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (id != null) 'id': id,
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (serviceId != null) 'serviceId': serviceId,
      if (serviceName != null) 'serviceName': serviceName,
      if (serviceNetworkArn != null) 'serviceNetworkArn': serviceNetworkArn,
      if (serviceNetworkId != null) 'serviceNetworkId': serviceNetworkId,
      if (serviceNetworkName != null) 'serviceNetworkName': serviceNetworkName,
      if (status != null) 'status': status.value,
    };
  }
}

class DeleteServiceNetworkServiceAssociationResponse {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The ID of the association.
  final String? id;

  /// The status. You can retry the operation if the status is
  /// <code>DELETE_FAILED</code>. However, if you retry it when the status is
  /// <code>DELETE_IN_PROGRESS</code>, there is no change in the status.
  final ServiceNetworkServiceAssociationStatus? status;

  DeleteServiceNetworkServiceAssociationResponse({
    this.arn,
    this.id,
    this.status,
  });

  factory DeleteServiceNetworkServiceAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteServiceNetworkServiceAssociationResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)
          ?.let(ServiceNetworkServiceAssociationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (status != null) 'status': status.value,
    };
  }
}

class ListServiceNetworkServiceAssociationsResponse {
  /// Information about the associations.
  final List<ServiceNetworkServiceAssociationSummary> items;

  /// If there are additional results, a pagination token for the next page of
  /// results.
  final String? nextToken;

  ListServiceNetworkServiceAssociationsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListServiceNetworkServiceAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListServiceNetworkServiceAssociationsResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => ServiceNetworkServiceAssociationSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateServiceNetworkVpcAssociationResponse {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The account that created the association.
  final String? createdBy;
  final DnsOptions? dnsOptions;

  /// The ID of the association.
  final String? id;

  /// Indicates if private DNS is enabled for the VPC association.
  final bool? privateDnsEnabled;

  /// The IDs of the security groups.
  final List<String>? securityGroupIds;

  /// The association status.
  final ServiceNetworkVpcAssociationStatus? status;

  CreateServiceNetworkVpcAssociationResponse({
    this.arn,
    this.createdBy,
    this.dnsOptions,
    this.id,
    this.privateDnsEnabled,
    this.securityGroupIds,
    this.status,
  });

  factory CreateServiceNetworkVpcAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateServiceNetworkVpcAssociationResponse(
      arn: json['arn'] as String?,
      createdBy: json['createdBy'] as String?,
      dnsOptions: json['dnsOptions'] != null
          ? DnsOptions.fromJson(json['dnsOptions'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      privateDnsEnabled: json['privateDnsEnabled'] as bool?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)
          ?.let(ServiceNetworkVpcAssociationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdBy = this.createdBy;
    final dnsOptions = this.dnsOptions;
    final id = this.id;
    final privateDnsEnabled = this.privateDnsEnabled;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (createdBy != null) 'createdBy': createdBy,
      if (dnsOptions != null) 'dnsOptions': dnsOptions,
      if (id != null) 'id': id,
      if (privateDnsEnabled != null) 'privateDnsEnabled': privateDnsEnabled,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (status != null) 'status': status.value,
    };
  }
}

class GetServiceNetworkVpcAssociationResponse {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The date and time that the association was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The account that created the association.
  final String? createdBy;

  /// DNS options for the service network VPC association.
  final DnsOptions? dnsOptions;

  /// The failure code.
  final String? failureCode;

  /// The failure message.
  final String? failureMessage;

  /// The ID of the association.
  final String? id;

  /// The date and time that the association was last updated, in ISO-8601 format.
  final DateTime? lastUpdatedAt;

  /// Indicates if private DNS is enabled in the VPC association.
  final bool? privateDnsEnabled;

  /// The IDs of the security groups.
  final List<String>? securityGroupIds;

  /// The Amazon Resource Name (ARN) of the service network.
  final String? serviceNetworkArn;

  /// The ID of the service network.
  final String? serviceNetworkId;

  /// The name of the service network.
  final String? serviceNetworkName;

  /// The status of the association.
  final ServiceNetworkVpcAssociationStatus? status;

  /// The ID of the VPC.
  final String? vpcId;

  GetServiceNetworkVpcAssociationResponse({
    this.arn,
    this.createdAt,
    this.createdBy,
    this.dnsOptions,
    this.failureCode,
    this.failureMessage,
    this.id,
    this.lastUpdatedAt,
    this.privateDnsEnabled,
    this.securityGroupIds,
    this.serviceNetworkArn,
    this.serviceNetworkId,
    this.serviceNetworkName,
    this.status,
    this.vpcId,
  });

  factory GetServiceNetworkVpcAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetServiceNetworkVpcAssociationResponse(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      dnsOptions: json['dnsOptions'] != null
          ? DnsOptions.fromJson(json['dnsOptions'] as Map<String, dynamic>)
          : null,
      failureCode: json['failureCode'] as String?,
      failureMessage: json['failureMessage'] as String?,
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      privateDnsEnabled: json['privateDnsEnabled'] as bool?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      serviceNetworkArn: json['serviceNetworkArn'] as String?,
      serviceNetworkId: json['serviceNetworkId'] as String?,
      serviceNetworkName: json['serviceNetworkName'] as String?,
      status: (json['status'] as String?)
          ?.let(ServiceNetworkVpcAssociationStatus.fromString),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final dnsOptions = this.dnsOptions;
    final failureCode = this.failureCode;
    final failureMessage = this.failureMessage;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final privateDnsEnabled = this.privateDnsEnabled;
    final securityGroupIds = this.securityGroupIds;
    final serviceNetworkArn = this.serviceNetworkArn;
    final serviceNetworkId = this.serviceNetworkId;
    final serviceNetworkName = this.serviceNetworkName;
    final status = this.status;
    final vpcId = this.vpcId;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (dnsOptions != null) 'dnsOptions': dnsOptions,
      if (failureCode != null) 'failureCode': failureCode,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (privateDnsEnabled != null) 'privateDnsEnabled': privateDnsEnabled,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (serviceNetworkArn != null) 'serviceNetworkArn': serviceNetworkArn,
      if (serviceNetworkId != null) 'serviceNetworkId': serviceNetworkId,
      if (serviceNetworkName != null) 'serviceNetworkName': serviceNetworkName,
      if (status != null) 'status': status.value,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

class UpdateServiceNetworkVpcAssociationResponse {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The account that created the association.
  final String? createdBy;

  /// The ID of the association.
  final String? id;

  /// The IDs of the security groups.
  final List<String>? securityGroupIds;

  /// The status. You can retry the operation if the status is
  /// <code>DELETE_FAILED</code>. However, if you retry it while the status is
  /// <code>DELETE_IN_PROGRESS</code>, there is no change in the status.
  final ServiceNetworkVpcAssociationStatus? status;

  UpdateServiceNetworkVpcAssociationResponse({
    this.arn,
    this.createdBy,
    this.id,
    this.securityGroupIds,
    this.status,
  });

  factory UpdateServiceNetworkVpcAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateServiceNetworkVpcAssociationResponse(
      arn: json['arn'] as String?,
      createdBy: json['createdBy'] as String?,
      id: json['id'] as String?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)
          ?.let(ServiceNetworkVpcAssociationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdBy = this.createdBy;
    final id = this.id;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (createdBy != null) 'createdBy': createdBy,
      if (id != null) 'id': id,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (status != null) 'status': status.value,
    };
  }
}

class DeleteServiceNetworkVpcAssociationResponse {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The ID of the association.
  final String? id;

  /// The status. You can retry the operation if the status is
  /// <code>DELETE_FAILED</code>. However, if you retry it while the status is
  /// <code>DELETE_IN_PROGRESS</code>, there is no change in the status.
  final ServiceNetworkVpcAssociationStatus? status;

  DeleteServiceNetworkVpcAssociationResponse({
    this.arn,
    this.id,
    this.status,
  });

  factory DeleteServiceNetworkVpcAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteServiceNetworkVpcAssociationResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)
          ?.let(ServiceNetworkVpcAssociationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (status != null) 'status': status.value,
    };
  }
}

class ListServiceNetworkVpcAssociationsResponse {
  /// Information about the associations.
  final List<ServiceNetworkVpcAssociationSummary> items;

  /// If there are additional results, a pagination token for the next page of
  /// results.
  final String? nextToken;

  ListServiceNetworkVpcAssociationsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListServiceNetworkVpcAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListServiceNetworkVpcAssociationsResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => ServiceNetworkVpcAssociationSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateTargetGroupResponse {
  /// The Amazon Resource Name (ARN) of the target group.
  final String? arn;

  /// The target group configuration.
  final TargetGroupConfig? config;

  /// The ID of the target group.
  final String? id;

  /// The name of the target group.
  final String? name;

  /// The status. You can retry the operation if the status is
  /// <code>CREATE_FAILED</code>. However, if you retry it while the status is
  /// <code>CREATE_IN_PROGRESS</code>, there is no change in the status.
  final TargetGroupStatus? status;

  /// The type of target group.
  final TargetGroupType? type;

  CreateTargetGroupResponse({
    this.arn,
    this.config,
    this.id,
    this.name,
    this.status,
    this.type,
  });

  factory CreateTargetGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateTargetGroupResponse(
      arn: json['arn'] as String?,
      config: json['config'] != null
          ? TargetGroupConfig.fromJson(json['config'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(TargetGroupStatus.fromString),
      type: (json['type'] as String?)?.let(TargetGroupType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final config = this.config;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (config != null) 'config': config,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
    };
  }
}

class GetTargetGroupResponse {
  /// The Amazon Resource Name (ARN) of the target group.
  final String? arn;

  /// The target group configuration.
  final TargetGroupConfig? config;

  /// The date and time that the target group was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The failure code.
  final String? failureCode;

  /// The failure message.
  final String? failureMessage;

  /// The ID of the target group.
  final String? id;

  /// The date and time that the target group was last updated, in ISO-8601
  /// format.
  final DateTime? lastUpdatedAt;

  /// The name of the target group.
  final String? name;

  /// The Amazon Resource Names (ARNs) of the service.
  final List<String>? serviceArns;

  /// The status.
  final TargetGroupStatus? status;

  /// The target group type.
  final TargetGroupType? type;

  GetTargetGroupResponse({
    this.arn,
    this.config,
    this.createdAt,
    this.failureCode,
    this.failureMessage,
    this.id,
    this.lastUpdatedAt,
    this.name,
    this.serviceArns,
    this.status,
    this.type,
  });

  factory GetTargetGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetTargetGroupResponse(
      arn: json['arn'] as String?,
      config: json['config'] != null
          ? TargetGroupConfig.fromJson(json['config'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      failureCode: json['failureCode'] as String?,
      failureMessage: json['failureMessage'] as String?,
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      serviceArns: (json['serviceArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.let(TargetGroupStatus.fromString),
      type: (json['type'] as String?)?.let(TargetGroupType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final config = this.config;
    final createdAt = this.createdAt;
    final failureCode = this.failureCode;
    final failureMessage = this.failureMessage;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final serviceArns = this.serviceArns;
    final status = this.status;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (config != null) 'config': config,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (failureCode != null) 'failureCode': failureCode,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (serviceArns != null) 'serviceArns': serviceArns,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
    };
  }
}

class UpdateTargetGroupResponse {
  /// The Amazon Resource Name (ARN) of the target group.
  final String? arn;

  /// The target group configuration.
  final TargetGroupConfig? config;

  /// The ID of the target group.
  final String? id;

  /// The name of the target group.
  final String? name;

  /// The status.
  final TargetGroupStatus? status;

  /// The target group type.
  final TargetGroupType? type;

  UpdateTargetGroupResponse({
    this.arn,
    this.config,
    this.id,
    this.name,
    this.status,
    this.type,
  });

  factory UpdateTargetGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTargetGroupResponse(
      arn: json['arn'] as String?,
      config: json['config'] != null
          ? TargetGroupConfig.fromJson(json['config'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(TargetGroupStatus.fromString),
      type: (json['type'] as String?)?.let(TargetGroupType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final config = this.config;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (config != null) 'config': config,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
    };
  }
}

class DeleteTargetGroupResponse {
  /// The Amazon Resource Name (ARN) of the target group.
  final String? arn;

  /// The ID of the target group.
  final String? id;

  /// The status. You can retry the operation if the status is
  /// <code>DELETE_FAILED</code>. However, if you retry it while the status is
  /// <code>DELETE_IN_PROGRESS</code>, the status doesn't change.
  final TargetGroupStatus? status;

  DeleteTargetGroupResponse({
    this.arn,
    this.id,
    this.status,
  });

  factory DeleteTargetGroupResponse.fromJson(Map<String, dynamic> json) {
    return DeleteTargetGroupResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.let(TargetGroupStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (status != null) 'status': status.value,
    };
  }
}

class ListTargetGroupsResponse {
  /// Information about the target groups.
  final List<TargetGroupSummary>? items;

  /// If there are additional results, a pagination token for the next page of
  /// results.
  final String? nextToken;

  ListTargetGroupsResponse({
    this.items,
    this.nextToken,
  });

  factory ListTargetGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListTargetGroupsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => TargetGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DeregisterTargetsResponse {
  /// The targets that were successfully deregistered.
  final List<Target>? successful;

  /// The targets that the operation couldn't deregister.
  final List<TargetFailure>? unsuccessful;

  DeregisterTargetsResponse({
    this.successful,
    this.unsuccessful,
  });

  factory DeregisterTargetsResponse.fromJson(Map<String, dynamic> json) {
    return DeregisterTargetsResponse(
      successful: (json['successful'] as List?)
          ?.nonNulls
          .map((e) => Target.fromJson(e as Map<String, dynamic>))
          .toList(),
      unsuccessful: (json['unsuccessful'] as List?)
          ?.nonNulls
          .map((e) => TargetFailure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final successful = this.successful;
    final unsuccessful = this.unsuccessful;
    return {
      if (successful != null) 'successful': successful,
      if (unsuccessful != null) 'unsuccessful': unsuccessful,
    };
  }
}

class ListTargetsResponse {
  /// Information about the targets.
  final List<TargetSummary> items;

  /// If there are additional results, a pagination token for the next page of
  /// results.
  final String? nextToken;

  ListTargetsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListTargetsResponse.fromJson(Map<String, dynamic> json) {
    return ListTargetsResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => TargetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class RegisterTargetsResponse {
  /// The targets that were successfully registered.
  final List<Target>? successful;

  /// The targets that were not registered.
  final List<TargetFailure>? unsuccessful;

  RegisterTargetsResponse({
    this.successful,
    this.unsuccessful,
  });

  factory RegisterTargetsResponse.fromJson(Map<String, dynamic> json) {
    return RegisterTargetsResponse(
      successful: (json['successful'] as List?)
          ?.nonNulls
          .map((e) => Target.fromJson(e as Map<String, dynamic>))
          .toList(),
      unsuccessful: (json['unsuccessful'] as List?)
          ?.nonNulls
          .map((e) => TargetFailure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final successful = this.successful;
    final unsuccessful = this.unsuccessful;
    return {
      if (successful != null) 'successful': successful,
      if (unsuccessful != null) 'unsuccessful': unsuccessful,
    };
  }
}

/// Describes a target failure.
class TargetFailure {
  /// The failure code.
  final String? failureCode;

  /// The failure message.
  final String? failureMessage;

  /// The ID of the target. If the target group type is <code>INSTANCE</code>,
  /// this is an instance ID. If the target group type is <code>IP</code>, this is
  /// an IP address. If the target group type is <code>LAMBDA</code>, this is the
  /// ARN of a Lambda function. If the target group type is <code>ALB</code>, this
  /// is the ARN of an Application Load Balancer.
  final String? id;

  /// The port on which the target is listening. This parameter doesn't apply if
  /// the target is a Lambda function.
  final int? port;

  TargetFailure({
    this.failureCode,
    this.failureMessage,
    this.id,
    this.port,
  });

  factory TargetFailure.fromJson(Map<String, dynamic> json) {
    return TargetFailure(
      failureCode: json['failureCode'] as String?,
      failureMessage: json['failureMessage'] as String?,
      id: json['id'] as String?,
      port: json['port'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureCode = this.failureCode;
    final failureMessage = this.failureMessage;
    final id = this.id;
    final port = this.port;
    return {
      if (failureCode != null) 'failureCode': failureCode,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (id != null) 'id': id,
      if (port != null) 'port': port,
    };
  }
}

/// Describes a target.
class Target {
  /// The ID of the target. If the target group type is <code>INSTANCE</code>,
  /// this is an instance ID. If the target group type is <code>IP</code>, this is
  /// an IP address. If the target group type is <code>LAMBDA</code>, this is the
  /// ARN of a Lambda function. If the target group type is <code>ALB</code>, this
  /// is the ARN of an Application Load Balancer.
  final String id;

  /// The port on which the target is listening. For HTTP, the default is 80. For
  /// HTTPS, the default is 443.
  final int? port;

  Target({
    required this.id,
    this.port,
  });

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      id: (json['id'] as String?) ?? '',
      port: json['port'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final port = this.port;
    return {
      'id': id,
      if (port != null) 'port': port,
    };
  }
}

/// Summary information about a target.
class TargetSummary {
  /// The ID of the target. If the target group type is <code>INSTANCE</code>,
  /// this is an instance ID. If the target group type is <code>IP</code>, this is
  /// an IP address. If the target group type is <code>LAMBDA</code>, this is the
  /// ARN of a Lambda function. If the target type is <code>ALB</code>, this is
  /// the ARN of an Application Load Balancer.
  final String? id;

  /// The port on which the target is listening.
  final int? port;

  /// The code for why the target status is what it is.
  final String? reasonCode;

  /// The status of the target.
  ///
  /// <ul>
  /// <li>
  /// <code>DRAINING</code>: The target is being deregistered. No new connections
  /// are sent to this target while current connections are being drained. The
  /// default draining time is 1 minute.
  /// </li>
  /// <li>
  /// <code>UNAVAILABLE</code>: Health checks are unavailable for the target
  /// group.
  /// </li>
  /// <li>
  /// <code>HEALTHY</code>: The target is healthy.
  /// </li>
  /// <li>
  /// <code>UNHEALTHY</code>: The target is unhealthy.
  /// </li>
  /// <li>
  /// <code>INITIAL</code>: Initial health checks on the target are being
  /// performed.
  /// </li>
  /// <li>
  /// <code>UNUSED</code>: Target group is not used in a service.
  /// </li>
  /// </ul>
  final TargetStatus? status;

  TargetSummary({
    this.id,
    this.port,
    this.reasonCode,
    this.status,
  });

  factory TargetSummary.fromJson(Map<String, dynamic> json) {
    return TargetSummary(
      id: json['id'] as String?,
      port: json['port'] as int?,
      reasonCode: json['reasonCode'] as String?,
      status: (json['status'] as String?)?.let(TargetStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final port = this.port;
    final reasonCode = this.reasonCode;
    final status = this.status;
    return {
      if (id != null) 'id': id,
      if (port != null) 'port': port,
      if (reasonCode != null) 'reasonCode': reasonCode,
      if (status != null) 'status': status.value,
    };
  }
}

class TargetStatus {
  static const draining = TargetStatus._('DRAINING');
  static const unavailable = TargetStatus._('UNAVAILABLE');
  static const healthy = TargetStatus._('HEALTHY');
  static const unhealthy = TargetStatus._('UNHEALTHY');
  static const initial = TargetStatus._('INITIAL');
  static const unused = TargetStatus._('UNUSED');

  final String value;

  const TargetStatus._(this.value);

  static const values = [
    draining,
    unavailable,
    healthy,
    unhealthy,
    initial,
    unused
  ];

  static TargetStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TargetStatus._(value));

  @override
  bool operator ==(other) => other is TargetStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a target group.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/target-groups.html">Target
/// groups</a> in the <i>Amazon VPC Lattice User Guide</i>.
class TargetGroupSummary {
  /// The ARN (Amazon Resource Name) of the target group.
  final String? arn;

  /// The date and time that the target group was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The ID of the target group.
  final String? id;

  /// The type of IP address used for the target group. The possible values are
  /// <code>IPV4</code> and <code>IPV6</code>. This is an optional parameter. If
  /// not specified, the default is <code>IPV4</code>.
  final IpAddressType? ipAddressType;

  /// The version of the event structure that your Lambda function receives.
  /// Supported only if the target group type is <code>LAMBDA</code>.
  final LambdaEventStructureVersion? lambdaEventStructureVersion;

  /// The date and time that the target group was last updated, in ISO-8601
  /// format.
  final DateTime? lastUpdatedAt;

  /// The name of the target group.
  final String? name;

  /// The port of the target group.
  final int? port;

  /// The protocol of the target group.
  final TargetGroupProtocol? protocol;

  /// The Amazon Resource Names (ARNs) of the service.
  final List<String>? serviceArns;

  /// The status.
  final TargetGroupStatus? status;

  /// The target group type.
  final TargetGroupType? type;

  /// The ID of the VPC of the target group.
  final String? vpcIdentifier;

  TargetGroupSummary({
    this.arn,
    this.createdAt,
    this.id,
    this.ipAddressType,
    this.lambdaEventStructureVersion,
    this.lastUpdatedAt,
    this.name,
    this.port,
    this.protocol,
    this.serviceArns,
    this.status,
    this.type,
    this.vpcIdentifier,
  });

  factory TargetGroupSummary.fromJson(Map<String, dynamic> json) {
    return TargetGroupSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      ipAddressType:
          (json['ipAddressType'] as String?)?.let(IpAddressType.fromString),
      lambdaEventStructureVersion:
          (json['lambdaEventStructureVersion'] as String?)
              ?.let(LambdaEventStructureVersion.fromString),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      port: json['port'] as int?,
      protocol:
          (json['protocol'] as String?)?.let(TargetGroupProtocol.fromString),
      serviceArns: (json['serviceArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.let(TargetGroupStatus.fromString),
      type: (json['type'] as String?)?.let(TargetGroupType.fromString),
      vpcIdentifier: json['vpcIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final ipAddressType = this.ipAddressType;
    final lambdaEventStructureVersion = this.lambdaEventStructureVersion;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final port = this.port;
    final protocol = this.protocol;
    final serviceArns = this.serviceArns;
    final status = this.status;
    final type = this.type;
    final vpcIdentifier = this.vpcIdentifier;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (id != null) 'id': id,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (lambdaEventStructureVersion != null)
        'lambdaEventStructureVersion': lambdaEventStructureVersion.value,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.value,
      if (serviceArns != null) 'serviceArns': serviceArns,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
      if (vpcIdentifier != null) 'vpcIdentifier': vpcIdentifier,
    };
  }
}

class TargetGroupType {
  static const ip = TargetGroupType._('IP');
  static const lambda = TargetGroupType._('LAMBDA');
  static const instance = TargetGroupType._('INSTANCE');
  static const alb = TargetGroupType._('ALB');

  final String value;

  const TargetGroupType._(this.value);

  static const values = [ip, lambda, instance, alb];

  static TargetGroupType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TargetGroupType._(value));

  @override
  bool operator ==(other) => other is TargetGroupType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class TargetGroupProtocol {
  static const http = TargetGroupProtocol._('HTTP');
  static const https = TargetGroupProtocol._('HTTPS');
  static const tcp = TargetGroupProtocol._('TCP');

  final String value;

  const TargetGroupProtocol._(this.value);

  static const values = [http, https, tcp];

  static TargetGroupProtocol fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TargetGroupProtocol._(value));

  @override
  bool operator ==(other) =>
      other is TargetGroupProtocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class IpAddressType {
  static const ipv4 = IpAddressType._('IPV4');
  static const ipv6 = IpAddressType._('IPV6');

  final String value;

  const IpAddressType._(this.value);

  static const values = [ipv4, ipv6];

  static IpAddressType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IpAddressType._(value));

  @override
  bool operator ==(other) => other is IpAddressType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class TargetGroupStatus {
  static const createInProgress = TargetGroupStatus._('CREATE_IN_PROGRESS');
  static const active = TargetGroupStatus._('ACTIVE');
  static const deleteInProgress = TargetGroupStatus._('DELETE_IN_PROGRESS');
  static const createFailed = TargetGroupStatus._('CREATE_FAILED');
  static const deleteFailed = TargetGroupStatus._('DELETE_FAILED');

  final String value;

  const TargetGroupStatus._(this.value);

  static const values = [
    createInProgress,
    active,
    deleteInProgress,
    createFailed,
    deleteFailed
  ];

  static TargetGroupStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TargetGroupStatus._(value));

  @override
  bool operator ==(other) => other is TargetGroupStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class LambdaEventStructureVersion {
  static const v1 = LambdaEventStructureVersion._('V1');
  static const v2 = LambdaEventStructureVersion._('V2');

  final String value;

  const LambdaEventStructureVersion._(this.value);

  static const values = [v1, v2];

  static LambdaEventStructureVersion fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LambdaEventStructureVersion._(value));

  @override
  bool operator ==(other) =>
      other is LambdaEventStructureVersion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the configuration of a target group.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/target-groups.html">Target
/// groups</a> in the <i>Amazon VPC Lattice User Guide</i>.
class TargetGroupConfig {
  /// The health check configuration. Not supported if the target group type is
  /// <code>LAMBDA</code> or <code>ALB</code>.
  final HealthCheckConfig? healthCheck;

  /// The type of IP address used for the target group. Supported only if the
  /// target group type is <code>IP</code>. The default is <code>IPV4</code>.
  final IpAddressType? ipAddressType;

  /// The version of the event structure that your Lambda function receives.
  /// Supported only if the target group type is <code>LAMBDA</code>. The default
  /// is <code>V1</code>.
  final LambdaEventStructureVersion? lambdaEventStructureVersion;

  /// The port on which the targets are listening. For HTTP, the default is 80.
  /// For HTTPS, the default is 443. Not supported if the target group type is
  /// <code>LAMBDA</code>.
  final int? port;

  /// The protocol to use for routing traffic to the targets. The default is the
  /// protocol of the target group. Not supported if the target group type is
  /// <code>LAMBDA</code>.
  final TargetGroupProtocol? protocol;

  /// The protocol version. The default is <code>HTTP1</code>. Not supported if
  /// the target group type is <code>LAMBDA</code>.
  final TargetGroupProtocolVersion? protocolVersion;

  /// The ID of the VPC. Not supported if the target group type is
  /// <code>LAMBDA</code>.
  final String? vpcIdentifier;

  TargetGroupConfig({
    this.healthCheck,
    this.ipAddressType,
    this.lambdaEventStructureVersion,
    this.port,
    this.protocol,
    this.protocolVersion,
    this.vpcIdentifier,
  });

  factory TargetGroupConfig.fromJson(Map<String, dynamic> json) {
    return TargetGroupConfig(
      healthCheck: json['healthCheck'] != null
          ? HealthCheckConfig.fromJson(
              json['healthCheck'] as Map<String, dynamic>)
          : null,
      ipAddressType:
          (json['ipAddressType'] as String?)?.let(IpAddressType.fromString),
      lambdaEventStructureVersion:
          (json['lambdaEventStructureVersion'] as String?)
              ?.let(LambdaEventStructureVersion.fromString),
      port: json['port'] as int?,
      protocol:
          (json['protocol'] as String?)?.let(TargetGroupProtocol.fromString),
      protocolVersion: (json['protocolVersion'] as String?)
          ?.let(TargetGroupProtocolVersion.fromString),
      vpcIdentifier: json['vpcIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthCheck = this.healthCheck;
    final ipAddressType = this.ipAddressType;
    final lambdaEventStructureVersion = this.lambdaEventStructureVersion;
    final port = this.port;
    final protocol = this.protocol;
    final protocolVersion = this.protocolVersion;
    final vpcIdentifier = this.vpcIdentifier;
    return {
      if (healthCheck != null) 'healthCheck': healthCheck,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (lambdaEventStructureVersion != null)
        'lambdaEventStructureVersion': lambdaEventStructureVersion.value,
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.value,
      if (protocolVersion != null) 'protocolVersion': protocolVersion.value,
      if (vpcIdentifier != null) 'vpcIdentifier': vpcIdentifier,
    };
  }
}

class TargetGroupProtocolVersion {
  static const http1 = TargetGroupProtocolVersion._('HTTP1');
  static const http2 = TargetGroupProtocolVersion._('HTTP2');
  static const grpc = TargetGroupProtocolVersion._('GRPC');

  final String value;

  const TargetGroupProtocolVersion._(this.value);

  static const values = [http1, http2, grpc];

  static TargetGroupProtocolVersion fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TargetGroupProtocolVersion._(value));

  @override
  bool operator ==(other) =>
      other is TargetGroupProtocolVersion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the health check configuration of a target group. Health check
/// configurations aren't used for target groups of type <code>LAMBDA</code> or
/// <code>ALB</code>.
class HealthCheckConfig {
  /// Indicates whether health checking is enabled.
  final bool? enabled;

  /// The approximate amount of time, in seconds, between health checks of an
  /// individual target. The range is 5–300 seconds. The default is 30 seconds.
  final int? healthCheckIntervalSeconds;

  /// The amount of time, in seconds, to wait before reporting a target as
  /// unhealthy. The range is 1–120 seconds. The default is 5 seconds.
  final int? healthCheckTimeoutSeconds;

  /// The number of consecutive successful health checks required before
  /// considering an unhealthy target healthy. The range is 2–10. The default is
  /// 5.
  final int? healthyThresholdCount;

  /// The codes to use when checking for a successful response from a target.
  final Matcher? matcher;

  /// The destination for health checks on the targets. If the protocol version is
  /// <code>HTTP/1.1</code> or <code>HTTP/2</code>, specify a valid URI (for
  /// example, <code>/path?query</code>). The default path is <code>/</code>.
  /// Health checks are not supported if the protocol version is
  /// <code>gRPC</code>, however, you can choose <code>HTTP/1.1</code> or
  /// <code>HTTP/2</code> and specify a valid URI.
  final String? path;

  /// The port used when performing health checks on targets. The default setting
  /// is the port that a target receives traffic on.
  final int? port;

  /// The protocol used when performing health checks on targets. The possible
  /// protocols are <code>HTTP</code> and <code>HTTPS</code>. The default is
  /// <code>HTTP</code>.
  final TargetGroupProtocol? protocol;

  /// The protocol version used when performing health checks on targets. The
  /// possible protocol versions are <code>HTTP1</code> and <code>HTTP2</code>.
  final HealthCheckProtocolVersion? protocolVersion;

  /// The number of consecutive failed health checks required before considering a
  /// target unhealthy. The range is 2–10. The default is 2.
  final int? unhealthyThresholdCount;

  HealthCheckConfig({
    this.enabled,
    this.healthCheckIntervalSeconds,
    this.healthCheckTimeoutSeconds,
    this.healthyThresholdCount,
    this.matcher,
    this.path,
    this.port,
    this.protocol,
    this.protocolVersion,
    this.unhealthyThresholdCount,
  });

  factory HealthCheckConfig.fromJson(Map<String, dynamic> json) {
    return HealthCheckConfig(
      enabled: json['enabled'] as bool?,
      healthCheckIntervalSeconds: json['healthCheckIntervalSeconds'] as int?,
      healthCheckTimeoutSeconds: json['healthCheckTimeoutSeconds'] as int?,
      healthyThresholdCount: json['healthyThresholdCount'] as int?,
      matcher: json['matcher'] != null
          ? Matcher.fromJson(json['matcher'] as Map<String, dynamic>)
          : null,
      path: json['path'] as String?,
      port: json['port'] as int?,
      protocol:
          (json['protocol'] as String?)?.let(TargetGroupProtocol.fromString),
      protocolVersion: (json['protocolVersion'] as String?)
          ?.let(HealthCheckProtocolVersion.fromString),
      unhealthyThresholdCount: json['unhealthyThresholdCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final healthCheckIntervalSeconds = this.healthCheckIntervalSeconds;
    final healthCheckTimeoutSeconds = this.healthCheckTimeoutSeconds;
    final healthyThresholdCount = this.healthyThresholdCount;
    final matcher = this.matcher;
    final path = this.path;
    final port = this.port;
    final protocol = this.protocol;
    final protocolVersion = this.protocolVersion;
    final unhealthyThresholdCount = this.unhealthyThresholdCount;
    return {
      if (enabled != null) 'enabled': enabled,
      if (healthCheckIntervalSeconds != null)
        'healthCheckIntervalSeconds': healthCheckIntervalSeconds,
      if (healthCheckTimeoutSeconds != null)
        'healthCheckTimeoutSeconds': healthCheckTimeoutSeconds,
      if (healthyThresholdCount != null)
        'healthyThresholdCount': healthyThresholdCount,
      if (matcher != null) 'matcher': matcher,
      if (path != null) 'path': path,
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.value,
      if (protocolVersion != null) 'protocolVersion': protocolVersion.value,
      if (unhealthyThresholdCount != null)
        'unhealthyThresholdCount': unhealthyThresholdCount,
    };
  }
}

class HealthCheckProtocolVersion {
  static const http1 = HealthCheckProtocolVersion._('HTTP1');
  static const http2 = HealthCheckProtocolVersion._('HTTP2');

  final String value;

  const HealthCheckProtocolVersion._(this.value);

  static const values = [http1, http2];

  static HealthCheckProtocolVersion fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HealthCheckProtocolVersion._(value));

  @override
  bool operator ==(other) =>
      other is HealthCheckProtocolVersion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the codes to use when checking for a successful response from a
/// target for health checks.
class Matcher {
  /// The HTTP code to use when checking for a successful response from a target.
  final String? httpCode;

  Matcher({
    this.httpCode,
  });

  factory Matcher.fromJson(Map<String, dynamic> json) {
    return Matcher(
      httpCode: json['httpCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final httpCode = this.httpCode;
    return {
      if (httpCode != null) 'httpCode': httpCode,
    };
  }
}

/// Summary information about an association between a service network and a
/// VPC.
class ServiceNetworkVpcAssociationSummary {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The date and time that the association was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The account that created the association.
  final String? createdBy;

  /// The DNS options for the service network VPC association.
  final DnsOptions? dnsOptions;

  /// The ID of the association.
  final String? id;

  /// The date and time that the association was last updated, in ISO-8601 format.
  final DateTime? lastUpdatedAt;

  /// Indicates if private DNS is enabled for the service network VPC association.
  final bool? privateDnsEnabled;

  /// The Amazon Resource Name (ARN) of the service network.
  final String? serviceNetworkArn;

  /// The ID of the service network.
  final String? serviceNetworkId;

  /// The name of the service network.
  final String? serviceNetworkName;

  /// The status.
  final ServiceNetworkVpcAssociationStatus? status;

  /// The ID of the VPC.
  final String? vpcId;

  ServiceNetworkVpcAssociationSummary({
    this.arn,
    this.createdAt,
    this.createdBy,
    this.dnsOptions,
    this.id,
    this.lastUpdatedAt,
    this.privateDnsEnabled,
    this.serviceNetworkArn,
    this.serviceNetworkId,
    this.serviceNetworkName,
    this.status,
    this.vpcId,
  });

  factory ServiceNetworkVpcAssociationSummary.fromJson(
      Map<String, dynamic> json) {
    return ServiceNetworkVpcAssociationSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      dnsOptions: json['dnsOptions'] != null
          ? DnsOptions.fromJson(json['dnsOptions'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      privateDnsEnabled: json['privateDnsEnabled'] as bool?,
      serviceNetworkArn: json['serviceNetworkArn'] as String?,
      serviceNetworkId: json['serviceNetworkId'] as String?,
      serviceNetworkName: json['serviceNetworkName'] as String?,
      status: (json['status'] as String?)
          ?.let(ServiceNetworkVpcAssociationStatus.fromString),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final dnsOptions = this.dnsOptions;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final privateDnsEnabled = this.privateDnsEnabled;
    final serviceNetworkArn = this.serviceNetworkArn;
    final serviceNetworkId = this.serviceNetworkId;
    final serviceNetworkName = this.serviceNetworkName;
    final status = this.status;
    final vpcId = this.vpcId;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (dnsOptions != null) 'dnsOptions': dnsOptions,
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (privateDnsEnabled != null) 'privateDnsEnabled': privateDnsEnabled,
      if (serviceNetworkArn != null) 'serviceNetworkArn': serviceNetworkArn,
      if (serviceNetworkId != null) 'serviceNetworkId': serviceNetworkId,
      if (serviceNetworkName != null) 'serviceNetworkName': serviceNetworkName,
      if (status != null) 'status': status.value,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

class ServiceNetworkVpcAssociationStatus {
  static const createInProgress =
      ServiceNetworkVpcAssociationStatus._('CREATE_IN_PROGRESS');
  static const active = ServiceNetworkVpcAssociationStatus._('ACTIVE');
  static const updateInProgress =
      ServiceNetworkVpcAssociationStatus._('UPDATE_IN_PROGRESS');
  static const deleteInProgress =
      ServiceNetworkVpcAssociationStatus._('DELETE_IN_PROGRESS');
  static const createFailed =
      ServiceNetworkVpcAssociationStatus._('CREATE_FAILED');
  static const deleteFailed =
      ServiceNetworkVpcAssociationStatus._('DELETE_FAILED');
  static const updateFailed =
      ServiceNetworkVpcAssociationStatus._('UPDATE_FAILED');

  final String value;

  const ServiceNetworkVpcAssociationStatus._(this.value);

  static const values = [
    createInProgress,
    active,
    updateInProgress,
    deleteInProgress,
    createFailed,
    deleteFailed,
    updateFailed
  ];

  static ServiceNetworkVpcAssociationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServiceNetworkVpcAssociationStatus._(value));

  @override
  bool operator ==(other) =>
      other is ServiceNetworkVpcAssociationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The DNS configuration options.
class DnsOptions {
  /// The preference for which private domains have a private hosted zone created
  /// for and associated with the specified VPC. Only supported when private DNS
  /// is enabled and when the VPC endpoint type is ServiceNetwork or Resource.
  ///
  /// <ul>
  /// <li>
  /// <code>ALL_DOMAINS</code> - VPC Lattice provisions private hosted zones for
  /// all custom domain names.
  /// </li>
  /// <li>
  /// <code>VERIFIED_DOMAINS_ONLY</code> - VPC Lattice provisions a private hosted
  /// zone only if custom domain name has been verified by the provider.
  /// </li>
  /// <li>
  /// <code>VERIFIED_DOMAINS_AND_SPECIFIED_DOMAINS</code> - VPC Lattice provisions
  /// private hosted zones for all verified custom domain names and other domain
  /// names that the resource consumer specifies. The resource consumer specifies
  /// the domain names in the privateDnsSpecifiedDomains parameter.
  /// </li>
  /// <li>
  /// <code>SPECIFIED_DOMAINS_ONLY</code> - VPC Lattice provisions a private
  /// hosted zone for domain names specified by the resource consumer. The
  /// resource consumer specifies the domain names in the
  /// privateDnsSpecifiedDomains parameter.
  /// </li>
  /// </ul>
  final PrivateDnsPreference? privateDnsPreference;

  /// Indicates which of the private domains to create private hosted zones for
  /// and associate with the specified VPC. Only supported when private DNS is
  /// enabled and the private DNS preference is
  /// <code>VERIFIED_DOMAINS_AND_SPECIFIED_DOMAINS</code> or
  /// <code>SPECIFIED_DOMAINS_ONLY</code>.
  final List<String>? privateDnsSpecifiedDomains;

  DnsOptions({
    this.privateDnsPreference,
    this.privateDnsSpecifiedDomains,
  });

  factory DnsOptions.fromJson(Map<String, dynamic> json) {
    return DnsOptions(
      privateDnsPreference: (json['privateDnsPreference'] as String?)
          ?.let(PrivateDnsPreference.fromString),
      privateDnsSpecifiedDomains: (json['privateDnsSpecifiedDomains'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final privateDnsPreference = this.privateDnsPreference;
    final privateDnsSpecifiedDomains = this.privateDnsSpecifiedDomains;
    return {
      if (privateDnsPreference != null)
        'privateDnsPreference': privateDnsPreference.value,
      if (privateDnsSpecifiedDomains != null)
        'privateDnsSpecifiedDomains': privateDnsSpecifiedDomains,
    };
  }
}

class PrivateDnsPreference {
  static const verifiedDomainsOnly =
      PrivateDnsPreference._('VERIFIED_DOMAINS_ONLY');
  static const allDomains = PrivateDnsPreference._('ALL_DOMAINS');
  static const verifiedDomainsAndSpecifiedDomains =
      PrivateDnsPreference._('VERIFIED_DOMAINS_AND_SPECIFIED_DOMAINS');
  static const specifiedDomainsOnly =
      PrivateDnsPreference._('SPECIFIED_DOMAINS_ONLY');

  final String value;

  const PrivateDnsPreference._(this.value);

  static const values = [
    verifiedDomainsOnly,
    allDomains,
    verifiedDomainsAndSpecifiedDomains,
    specifiedDomainsOnly
  ];

  static PrivateDnsPreference fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PrivateDnsPreference._(value));

  @override
  bool operator ==(other) =>
      other is PrivateDnsPreference && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about an association between a service network and a
/// service.
class ServiceNetworkServiceAssociationSummary {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The date and time that the association was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The account that created the association.
  final String? createdBy;

  /// The custom domain name of the service.
  final String? customDomainName;

  /// The DNS information.
  final DnsEntry? dnsEntry;

  /// The ID of the association.
  final String? id;

  /// The Amazon Resource Name (ARN) of the service.
  final String? serviceArn;

  /// The ID of the service.
  final String? serviceId;

  /// The name of the service.
  final String? serviceName;

  /// The Amazon Resource Name (ARN) of the service network.
  final String? serviceNetworkArn;

  /// The ID of the service network.
  final String? serviceNetworkId;

  /// The name of the service network.
  final String? serviceNetworkName;

  /// The status of the service network’s association with the service. If the
  /// deletion fails, try to delete again.
  final ServiceNetworkServiceAssociationStatus? status;

  ServiceNetworkServiceAssociationSummary({
    this.arn,
    this.createdAt,
    this.createdBy,
    this.customDomainName,
    this.dnsEntry,
    this.id,
    this.serviceArn,
    this.serviceId,
    this.serviceName,
    this.serviceNetworkArn,
    this.serviceNetworkId,
    this.serviceNetworkName,
    this.status,
  });

  factory ServiceNetworkServiceAssociationSummary.fromJson(
      Map<String, dynamic> json) {
    return ServiceNetworkServiceAssociationSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      customDomainName: json['customDomainName'] as String?,
      dnsEntry: json['dnsEntry'] != null
          ? DnsEntry.fromJson(json['dnsEntry'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      serviceArn: json['serviceArn'] as String?,
      serviceId: json['serviceId'] as String?,
      serviceName: json['serviceName'] as String?,
      serviceNetworkArn: json['serviceNetworkArn'] as String?,
      serviceNetworkId: json['serviceNetworkId'] as String?,
      serviceNetworkName: json['serviceNetworkName'] as String?,
      status: (json['status'] as String?)
          ?.let(ServiceNetworkServiceAssociationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final customDomainName = this.customDomainName;
    final dnsEntry = this.dnsEntry;
    final id = this.id;
    final serviceArn = this.serviceArn;
    final serviceId = this.serviceId;
    final serviceName = this.serviceName;
    final serviceNetworkArn = this.serviceNetworkArn;
    final serviceNetworkId = this.serviceNetworkId;
    final serviceNetworkName = this.serviceNetworkName;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (dnsEntry != null) 'dnsEntry': dnsEntry,
      if (id != null) 'id': id,
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (serviceId != null) 'serviceId': serviceId,
      if (serviceName != null) 'serviceName': serviceName,
      if (serviceNetworkArn != null) 'serviceNetworkArn': serviceNetworkArn,
      if (serviceNetworkId != null) 'serviceNetworkId': serviceNetworkId,
      if (serviceNetworkName != null) 'serviceNetworkName': serviceNetworkName,
      if (status != null) 'status': status.value,
    };
  }
}

class ServiceNetworkServiceAssociationStatus {
  static const createInProgress =
      ServiceNetworkServiceAssociationStatus._('CREATE_IN_PROGRESS');
  static const active = ServiceNetworkServiceAssociationStatus._('ACTIVE');
  static const deleteInProgress =
      ServiceNetworkServiceAssociationStatus._('DELETE_IN_PROGRESS');
  static const createFailed =
      ServiceNetworkServiceAssociationStatus._('CREATE_FAILED');
  static const deleteFailed =
      ServiceNetworkServiceAssociationStatus._('DELETE_FAILED');

  final String value;

  const ServiceNetworkServiceAssociationStatus._(this.value);

  static const values = [
    createInProgress,
    active,
    deleteInProgress,
    createFailed,
    deleteFailed
  ];

  static ServiceNetworkServiceAssociationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServiceNetworkServiceAssociationStatus._(value));

  @override
  bool operator ==(other) =>
      other is ServiceNetworkServiceAssociationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the DNS information of a service.
class DnsEntry {
  /// The domain name of the service.
  final String? domainName;

  /// The ID of the hosted zone.
  final String? hostedZoneId;

  DnsEntry({
    this.domainName,
    this.hostedZoneId,
  });

  factory DnsEntry.fromJson(Map<String, dynamic> json) {
    return DnsEntry(
      domainName: json['domainName'] as String?,
      hostedZoneId: json['hostedZoneId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final hostedZoneId = this.hostedZoneId;
    return {
      if (domainName != null) 'domainName': domainName,
      if (hostedZoneId != null) 'hostedZoneId': hostedZoneId,
    };
  }
}

/// Summary information about an association between a service network and a
/// resource configuration.
class ServiceNetworkResourceAssociationSummary {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The date and time that the association was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The account that created the association.
  final String? createdBy;

  /// The DNS entry for the service.
  final DnsEntry? dnsEntry;

  /// The failure code.
  final String? failureCode;

  /// The ID of the association between the service network and resource
  /// configuration.
  final String? id;

  /// Specifies whether the association is managed by Amazon.
  final bool? isManagedAssociation;

  /// Indicates if private DNS is enabled for the service network resource
  /// association.
  final bool? privateDnsEnabled;

  /// The private DNS entry for the service.
  final DnsEntry? privateDnsEntry;

  /// The Amazon Resource Name (ARN) of the association.
  final String? resourceConfigurationArn;

  /// The ID of the resource configuration associated with the service network.
  final String? resourceConfigurationId;

  /// The name of the resource configuration associated with the service network.
  final String? resourceConfigurationName;

  /// The Amazon Resource Name (ARN) of the service network associated with the
  /// resource configuration.
  final String? serviceNetworkArn;

  /// The ID of the service network associated with the resource configuration.
  final String? serviceNetworkId;

  /// The name of the service network associated with the resource configuration.
  final String? serviceNetworkName;

  /// The status of the service network’s association with the resource
  /// configuration. If the deletion fails, try to delete again.
  final ServiceNetworkResourceAssociationStatus? status;

  ServiceNetworkResourceAssociationSummary({
    this.arn,
    this.createdAt,
    this.createdBy,
    this.dnsEntry,
    this.failureCode,
    this.id,
    this.isManagedAssociation,
    this.privateDnsEnabled,
    this.privateDnsEntry,
    this.resourceConfigurationArn,
    this.resourceConfigurationId,
    this.resourceConfigurationName,
    this.serviceNetworkArn,
    this.serviceNetworkId,
    this.serviceNetworkName,
    this.status,
  });

  factory ServiceNetworkResourceAssociationSummary.fromJson(
      Map<String, dynamic> json) {
    return ServiceNetworkResourceAssociationSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      dnsEntry: json['dnsEntry'] != null
          ? DnsEntry.fromJson(json['dnsEntry'] as Map<String, dynamic>)
          : null,
      failureCode: json['failureCode'] as String?,
      id: json['id'] as String?,
      isManagedAssociation: json['isManagedAssociation'] as bool?,
      privateDnsEnabled: json['privateDnsEnabled'] as bool?,
      privateDnsEntry: json['privateDnsEntry'] != null
          ? DnsEntry.fromJson(json['privateDnsEntry'] as Map<String, dynamic>)
          : null,
      resourceConfigurationArn: json['resourceConfigurationArn'] as String?,
      resourceConfigurationId: json['resourceConfigurationId'] as String?,
      resourceConfigurationName: json['resourceConfigurationName'] as String?,
      serviceNetworkArn: json['serviceNetworkArn'] as String?,
      serviceNetworkId: json['serviceNetworkId'] as String?,
      serviceNetworkName: json['serviceNetworkName'] as String?,
      status: (json['status'] as String?)
          ?.let(ServiceNetworkResourceAssociationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final dnsEntry = this.dnsEntry;
    final failureCode = this.failureCode;
    final id = this.id;
    final isManagedAssociation = this.isManagedAssociation;
    final privateDnsEnabled = this.privateDnsEnabled;
    final privateDnsEntry = this.privateDnsEntry;
    final resourceConfigurationArn = this.resourceConfigurationArn;
    final resourceConfigurationId = this.resourceConfigurationId;
    final resourceConfigurationName = this.resourceConfigurationName;
    final serviceNetworkArn = this.serviceNetworkArn;
    final serviceNetworkId = this.serviceNetworkId;
    final serviceNetworkName = this.serviceNetworkName;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (dnsEntry != null) 'dnsEntry': dnsEntry,
      if (failureCode != null) 'failureCode': failureCode,
      if (id != null) 'id': id,
      if (isManagedAssociation != null)
        'isManagedAssociation': isManagedAssociation,
      if (privateDnsEnabled != null) 'privateDnsEnabled': privateDnsEnabled,
      if (privateDnsEntry != null) 'privateDnsEntry': privateDnsEntry,
      if (resourceConfigurationArn != null)
        'resourceConfigurationArn': resourceConfigurationArn,
      if (resourceConfigurationId != null)
        'resourceConfigurationId': resourceConfigurationId,
      if (resourceConfigurationName != null)
        'resourceConfigurationName': resourceConfigurationName,
      if (serviceNetworkArn != null) 'serviceNetworkArn': serviceNetworkArn,
      if (serviceNetworkId != null) 'serviceNetworkId': serviceNetworkId,
      if (serviceNetworkName != null) 'serviceNetworkName': serviceNetworkName,
      if (status != null) 'status': status.value,
    };
  }
}

class ServiceNetworkResourceAssociationStatus {
  static const createInProgress =
      ServiceNetworkResourceAssociationStatus._('CREATE_IN_PROGRESS');
  static const active = ServiceNetworkResourceAssociationStatus._('ACTIVE');
  static const partial = ServiceNetworkResourceAssociationStatus._('PARTIAL');
  static const deleteInProgress =
      ServiceNetworkResourceAssociationStatus._('DELETE_IN_PROGRESS');
  static const createFailed =
      ServiceNetworkResourceAssociationStatus._('CREATE_FAILED');
  static const deleteFailed =
      ServiceNetworkResourceAssociationStatus._('DELETE_FAILED');

  final String value;

  const ServiceNetworkResourceAssociationStatus._(this.value);

  static const values = [
    createInProgress,
    active,
    partial,
    deleteInProgress,
    createFailed,
    deleteFailed
  ];

  static ServiceNetworkResourceAssociationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServiceNetworkResourceAssociationStatus._(value));

  @override
  bool operator ==(other) =>
      other is ServiceNetworkResourceAssociationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class VerificationStatus {
  static const verified = VerificationStatus._('VERIFIED');
  static const pending = VerificationStatus._('PENDING');
  static const verificationTimedOut =
      VerificationStatus._('VERIFICATION_TIMED_OUT');

  final String value;

  const VerificationStatus._(this.value);

  static const values = [verified, pending, verificationTimedOut];

  static VerificationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VerificationStatus._(value));

  @override
  bool operator ==(other) =>
      other is VerificationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a service network.
class ServiceNetworkSummary {
  /// The Amazon Resource Name (ARN) of the service network.
  final String? arn;

  /// The date and time that the service network was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The ID of the service network.
  final String? id;

  /// The date and time that the service network was last updated, in ISO-8601
  /// format.
  final DateTime? lastUpdatedAt;

  /// The name of the service network.
  final String? name;

  /// The number of resource configurations associated with a service network.
  final int? numberOfAssociatedResourceConfigurations;

  /// The number of services associated with the service network.
  final int? numberOfAssociatedServices;

  /// The number of VPCs associated with the service network.
  final int? numberOfAssociatedVPCs;

  ServiceNetworkSummary({
    this.arn,
    this.createdAt,
    this.id,
    this.lastUpdatedAt,
    this.name,
    this.numberOfAssociatedResourceConfigurations,
    this.numberOfAssociatedServices,
    this.numberOfAssociatedVPCs,
  });

  factory ServiceNetworkSummary.fromJson(Map<String, dynamic> json) {
    return ServiceNetworkSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      numberOfAssociatedResourceConfigurations:
          json['numberOfAssociatedResourceConfigurations'] as int?,
      numberOfAssociatedServices: json['numberOfAssociatedServices'] as int?,
      numberOfAssociatedVPCs: json['numberOfAssociatedVPCs'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final numberOfAssociatedResourceConfigurations =
        this.numberOfAssociatedResourceConfigurations;
    final numberOfAssociatedServices = this.numberOfAssociatedServices;
    final numberOfAssociatedVPCs = this.numberOfAssociatedVPCs;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (numberOfAssociatedResourceConfigurations != null)
        'numberOfAssociatedResourceConfigurations':
            numberOfAssociatedResourceConfigurations,
      if (numberOfAssociatedServices != null)
        'numberOfAssociatedServices': numberOfAssociatedServices,
      if (numberOfAssociatedVPCs != null)
        'numberOfAssociatedVPCs': numberOfAssociatedVPCs,
    };
  }
}

class AuthType {
  static const none = AuthType._('NONE');
  static const awsIam = AuthType._('AWS_IAM');

  final String value;

  const AuthType._(this.value);

  static const values = [none, awsIam];

  static AuthType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AuthType._(value));

  @override
  bool operator ==(other) => other is AuthType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies if the service network should be enabled for sharing.
class SharingConfig {
  /// Specifies if the service network is enabled for sharing.
  final bool? enabled;

  SharingConfig({
    this.enabled,
  });

  factory SharingConfig.fromJson(Map<String, dynamic> json) {
    return SharingConfig(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// Summary information about a service.
class ServiceSummary {
  /// The Amazon Resource Name (ARN) of the service.
  final String? arn;

  /// The date and time that the service was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The custom domain name of the service.
  final String? customDomainName;

  /// The DNS information.
  final DnsEntry? dnsEntry;

  /// The ID of the service.
  final String? id;

  /// The date and time that the service was last updated, in ISO-8601 format.
  final DateTime? lastUpdatedAt;

  /// The name of the service.
  final String? name;

  /// The status.
  final ServiceStatus? status;

  ServiceSummary({
    this.arn,
    this.createdAt,
    this.customDomainName,
    this.dnsEntry,
    this.id,
    this.lastUpdatedAt,
    this.name,
    this.status,
  });

  factory ServiceSummary.fromJson(Map<String, dynamic> json) {
    return ServiceSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      customDomainName: json['customDomainName'] as String?,
      dnsEntry: json['dnsEntry'] != null
          ? DnsEntry.fromJson(json['dnsEntry'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(ServiceStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final customDomainName = this.customDomainName;
    final dnsEntry = this.dnsEntry;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (dnsEntry != null) 'dnsEntry': dnsEntry,
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

class ServiceStatus {
  static const active = ServiceStatus._('ACTIVE');
  static const createInProgress = ServiceStatus._('CREATE_IN_PROGRESS');
  static const deleteInProgress = ServiceStatus._('DELETE_IN_PROGRESS');
  static const createFailed = ServiceStatus._('CREATE_FAILED');
  static const deleteFailed = ServiceStatus._('DELETE_FAILED');

  final String value;

  const ServiceStatus._(this.value);

  static const values = [
    active,
    createInProgress,
    deleteInProgress,
    createFailed,
    deleteFailed
  ];

  static ServiceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServiceStatus._(value));

  @override
  bool operator ==(other) => other is ServiceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a listener rule.
class RuleSummary {
  /// The Amazon Resource Name (ARN) of the rule.
  final String? arn;

  /// The date and time that the listener rule was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The ID of the rule.
  final String? id;

  /// Indicates whether this is the default listener rule.
  final bool? isDefault;

  /// The date and time that the listener rule was last updated, in ISO-8601
  /// format.
  final DateTime? lastUpdatedAt;

  /// The name of the rule.
  final String? name;

  /// The priority of the rule.
  final int? priority;

  RuleSummary({
    this.arn,
    this.createdAt,
    this.id,
    this.isDefault,
    this.lastUpdatedAt,
    this.name,
    this.priority,
  });

  factory RuleSummary.fromJson(Map<String, dynamic> json) {
    return RuleSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      isDefault: json['isDefault'] as bool?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      priority: json['priority'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final isDefault = this.isDefault;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final priority = this.priority;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (id != null) 'id': id,
      if (isDefault != null) 'isDefault': isDefault,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
    };
  }
}

/// Describes a rule match.
class RuleMatch {
  /// The HTTP criteria that a rule must match.
  final HttpMatch? httpMatch;

  RuleMatch({
    this.httpMatch,
  });

  factory RuleMatch.fromJson(Map<String, dynamic> json) {
    return RuleMatch(
      httpMatch: json['httpMatch'] != null
          ? HttpMatch.fromJson(json['httpMatch'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final httpMatch = this.httpMatch;
    return {
      if (httpMatch != null) 'httpMatch': httpMatch,
    };
  }
}

/// Describes the action for a rule.
class RuleAction {
  /// The fixed response action. The rule returns a custom HTTP response.
  final FixedResponseAction? fixedResponse;

  /// The forward action. Traffic that matches the rule is forwarded to the
  /// specified target groups.
  final ForwardAction? forward;

  RuleAction({
    this.fixedResponse,
    this.forward,
  });

  factory RuleAction.fromJson(Map<String, dynamic> json) {
    return RuleAction(
      fixedResponse: json['fixedResponse'] != null
          ? FixedResponseAction.fromJson(
              json['fixedResponse'] as Map<String, dynamic>)
          : null,
      forward: json['forward'] != null
          ? ForwardAction.fromJson(json['forward'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fixedResponse = this.fixedResponse;
    final forward = this.forward;
    return {
      if (fixedResponse != null) 'fixedResponse': fixedResponse,
      if (forward != null) 'forward': forward,
    };
  }
}

/// Describes a forward action. You can use forward actions to route requests to
/// one or more target groups.
class ForwardAction {
  /// The target groups. Traffic matching the rule is forwarded to the specified
  /// target groups. With forward actions, you can assign a weight that controls
  /// the prioritization and selection of each target group. This means that
  /// requests are distributed to individual target groups based on their weights.
  /// For example, if two target groups have the same weight, each target group
  /// receives half of the traffic.
  ///
  /// The default value is 1. This means that if only one target group is
  /// provided, there is no need to set the weight; 100% of the traffic goes to
  /// that target group.
  final List<WeightedTargetGroup> targetGroups;

  ForwardAction({
    required this.targetGroups,
  });

  factory ForwardAction.fromJson(Map<String, dynamic> json) {
    return ForwardAction(
      targetGroups: ((json['targetGroups'] as List?) ?? const [])
          .nonNulls
          .map((e) => WeightedTargetGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetGroups = this.targetGroups;
    return {
      'targetGroups': targetGroups,
    };
  }
}

/// Describes an action that returns a custom HTTP response.
class FixedResponseAction {
  /// The HTTP response code. Only <code>404</code> and <code>500</code> status
  /// codes are supported.
  final int statusCode;

  FixedResponseAction({
    required this.statusCode,
  });

  factory FixedResponseAction.fromJson(Map<String, dynamic> json) {
    return FixedResponseAction(
      statusCode: (json['statusCode'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    return {
      'statusCode': statusCode,
    };
  }
}

/// Describes the weight of a target group.
class WeightedTargetGroup {
  /// The ID or ARN of the target group.
  final String targetGroupIdentifier;

  /// Only required if you specify multiple target groups for a forward action.
  /// The weight determines how requests are distributed to the target group. For
  /// example, if you specify two target groups, each with a weight of 10, each
  /// target group receives half the requests. If you specify two target groups,
  /// one with a weight of 10 and the other with a weight of 20, the target group
  /// with a weight of 20 receives twice as many requests as the other target
  /// group. If there's only one target group specified, then the default value is
  /// 100.
  final int? weight;

  WeightedTargetGroup({
    required this.targetGroupIdentifier,
    this.weight,
  });

  factory WeightedTargetGroup.fromJson(Map<String, dynamic> json) {
    return WeightedTargetGroup(
      targetGroupIdentifier: (json['targetGroupIdentifier'] as String?) ?? '',
      weight: json['weight'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetGroupIdentifier = this.targetGroupIdentifier;
    final weight = this.weight;
    return {
      'targetGroupIdentifier': targetGroupIdentifier,
      if (weight != null) 'weight': weight,
    };
  }
}

/// Describes criteria that can be applied to incoming requests.
class HttpMatch {
  /// The header matches. Matches incoming requests with rule based on request
  /// header value before applying rule action.
  final List<HeaderMatch>? headerMatches;

  /// The HTTP method type.
  final String? method;

  /// The path match.
  final PathMatch? pathMatch;

  HttpMatch({
    this.headerMatches,
    this.method,
    this.pathMatch,
  });

  factory HttpMatch.fromJson(Map<String, dynamic> json) {
    return HttpMatch(
      headerMatches: (json['headerMatches'] as List?)
          ?.nonNulls
          .map((e) => HeaderMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
      method: json['method'] as String?,
      pathMatch: json['pathMatch'] != null
          ? PathMatch.fromJson(json['pathMatch'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final headerMatches = this.headerMatches;
    final method = this.method;
    final pathMatch = this.pathMatch;
    return {
      if (headerMatches != null) 'headerMatches': headerMatches,
      if (method != null) 'method': method,
      if (pathMatch != null) 'pathMatch': pathMatch,
    };
  }
}

/// Describes the conditions that can be applied when matching a path for
/// incoming requests.
class PathMatch {
  /// The type of path match.
  final PathMatchType match;

  /// Indicates whether the match is case sensitive.
  final bool? caseSensitive;

  PathMatch({
    required this.match,
    this.caseSensitive,
  });

  factory PathMatch.fromJson(Map<String, dynamic> json) {
    return PathMatch(
      match: PathMatchType.fromJson((json['match'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      caseSensitive: json['caseSensitive'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final match = this.match;
    final caseSensitive = this.caseSensitive;
    return {
      'match': match,
      if (caseSensitive != null) 'caseSensitive': caseSensitive,
    };
  }
}

/// Describes the constraints for a header match. Matches incoming requests with
/// rule based on request header value before applying rule action.
class HeaderMatch {
  /// The header match type.
  final HeaderMatchType match;

  /// The name of the header.
  final String name;

  /// Indicates whether the match is case sensitive.
  final bool? caseSensitive;

  HeaderMatch({
    required this.match,
    required this.name,
    this.caseSensitive,
  });

  factory HeaderMatch.fromJson(Map<String, dynamic> json) {
    return HeaderMatch(
      match: HeaderMatchType.fromJson(
          (json['match'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['name'] as String?) ?? '',
      caseSensitive: json['caseSensitive'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final match = this.match;
    final name = this.name;
    final caseSensitive = this.caseSensitive;
    return {
      'match': match,
      'name': name,
      if (caseSensitive != null) 'caseSensitive': caseSensitive,
    };
  }
}

/// Describes a header match type.
class HeaderMatchType {
  /// A contains type match.
  final String? contains;

  /// An exact type match.
  final String? exact;

  /// A prefix type match. Matches the value with the prefix.
  final String? prefix;

  HeaderMatchType({
    this.contains,
    this.exact,
    this.prefix,
  });

  factory HeaderMatchType.fromJson(Map<String, dynamic> json) {
    return HeaderMatchType(
      contains: json['contains'] as String?,
      exact: json['exact'] as String?,
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contains = this.contains;
    final exact = this.exact;
    final prefix = this.prefix;
    return {
      if (contains != null) 'contains': contains,
      if (exact != null) 'exact': exact,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// Describes a path match type. Each rule can include only one of the following
/// types of paths.
class PathMatchType {
  /// An exact match of the path.
  final String? exact;

  /// A prefix match of the path.
  final String? prefix;

  PathMatchType({
    this.exact,
    this.prefix,
  });

  factory PathMatchType.fromJson(Map<String, dynamic> json) {
    return PathMatchType(
      exact: json['exact'] as String?,
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exact = this.exact;
    final prefix = this.prefix;
    return {
      if (exact != null) 'exact': exact,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// Summary information about a resource gateway.
class ResourceGatewaySummary {
  /// The Amazon Resource Name (ARN) of the resource gateway.
  final String? arn;

  /// The date and time that the VPC endpoint association was created, in ISO-8601
  /// format.
  final DateTime? createdAt;

  /// The ID of the resource gateway.
  final String? id;

  /// The type of IP address used by the resource gateway.
  final ResourceGatewayIpAddressType? ipAddressType;

  /// The number of IPv4 addresses in each ENI for the resource gateway.
  final int? ipv4AddressesPerEni;

  /// The most recent date and time that the resource gateway was updated, in
  /// ISO-8601 format.
  final DateTime? lastUpdatedAt;

  /// The name of the resource gateway.
  final String? name;

  /// The DNS resolution type for resource configurations that are associated with
  /// this resource gateway.
  final ResourceConfigDnsResolution? resourceConfigDnsResolution;

  /// The IDs of the security groups applied to the resource gateway.
  final List<String>? securityGroupIds;

  /// The name of the resource gateway.
  final ResourceGatewayStatus? status;

  /// The IDs of the VPC subnets for the resource gateway.
  final List<String>? subnetIds;

  /// The ID of the VPC for the resource gateway.
  final String? vpcIdentifier;

  ResourceGatewaySummary({
    this.arn,
    this.createdAt,
    this.id,
    this.ipAddressType,
    this.ipv4AddressesPerEni,
    this.lastUpdatedAt,
    this.name,
    this.resourceConfigDnsResolution,
    this.securityGroupIds,
    this.status,
    this.subnetIds,
    this.vpcIdentifier,
  });

  factory ResourceGatewaySummary.fromJson(Map<String, dynamic> json) {
    return ResourceGatewaySummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      ipAddressType: (json['ipAddressType'] as String?)
          ?.let(ResourceGatewayIpAddressType.fromString),
      ipv4AddressesPerEni: json['ipv4AddressesPerEni'] as int?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      resourceConfigDnsResolution:
          (json['resourceConfigDnsResolution'] as String?)
              ?.let(ResourceConfigDnsResolution.fromString),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status:
          (json['status'] as String?)?.let(ResourceGatewayStatus.fromString),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcIdentifier: json['vpcIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final ipAddressType = this.ipAddressType;
    final ipv4AddressesPerEni = this.ipv4AddressesPerEni;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final resourceConfigDnsResolution = this.resourceConfigDnsResolution;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    final subnetIds = this.subnetIds;
    final vpcIdentifier = this.vpcIdentifier;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (id != null) 'id': id,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (ipv4AddressesPerEni != null)
        'ipv4AddressesPerEni': ipv4AddressesPerEni,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (resourceConfigDnsResolution != null)
        'resourceConfigDnsResolution': resourceConfigDnsResolution.value,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (status != null) 'status': status.value,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcIdentifier != null) 'vpcIdentifier': vpcIdentifier,
    };
  }
}

class ResourceGatewayStatus {
  static const active = ResourceGatewayStatus._('ACTIVE');
  static const createInProgress = ResourceGatewayStatus._('CREATE_IN_PROGRESS');
  static const updateInProgress = ResourceGatewayStatus._('UPDATE_IN_PROGRESS');
  static const deleteInProgress = ResourceGatewayStatus._('DELETE_IN_PROGRESS');
  static const createFailed = ResourceGatewayStatus._('CREATE_FAILED');
  static const updateFailed = ResourceGatewayStatus._('UPDATE_FAILED');
  static const deleteFailed = ResourceGatewayStatus._('DELETE_FAILED');

  final String value;

  const ResourceGatewayStatus._(this.value);

  static const values = [
    active,
    createInProgress,
    updateInProgress,
    deleteInProgress,
    createFailed,
    updateFailed,
    deleteFailed
  ];

  static ResourceGatewayStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceGatewayStatus._(value));

  @override
  bool operator ==(other) =>
      other is ResourceGatewayStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ResourceGatewayIpAddressType {
  static const ipv4 = ResourceGatewayIpAddressType._('IPV4');
  static const ipv6 = ResourceGatewayIpAddressType._('IPV6');
  static const dualstack = ResourceGatewayIpAddressType._('DUALSTACK');

  final String value;

  const ResourceGatewayIpAddressType._(this.value);

  static const values = [ipv4, ipv6, dualstack];

  static ResourceGatewayIpAddressType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceGatewayIpAddressType._(value));

  @override
  bool operator ==(other) =>
      other is ResourceGatewayIpAddressType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ResourceConfigDnsResolution {
  static const inVpc = ResourceConfigDnsResolution._('IN_VPC');
  static const public = ResourceConfigDnsResolution._('PUBLIC');

  final String value;

  const ResourceConfigDnsResolution._(this.value);

  static const values = [inVpc, public];

  static ResourceConfigDnsResolution fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceConfigDnsResolution._(value));

  @override
  bool operator ==(other) =>
      other is ResourceConfigDnsResolution && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a VPC endpoint association.
class ResourceEndpointAssociationSummary {
  /// The Amazon Resource Name (ARN) of the VPC endpoint association.
  final String? arn;

  /// The date and time that the VPC endpoint association was created, in ISO-8601
  /// format.
  final DateTime? createdAt;

  /// The account that created the association.
  final String? createdBy;

  /// The ID of the VPC endpoint association.
  final String? id;

  /// The Amazon Resource Name (ARN) of the resource configuration.
  final String? resourceConfigurationArn;

  /// The ID of the resource configuration.
  final String? resourceConfigurationId;

  /// The name of the resource configuration.
  final String? resourceConfigurationName;

  /// The ID of the VPC endpoint.
  final String? vpcEndpointId;

  /// The owner of the VPC endpoint.
  final String? vpcEndpointOwner;

  ResourceEndpointAssociationSummary({
    this.arn,
    this.createdAt,
    this.createdBy,
    this.id,
    this.resourceConfigurationArn,
    this.resourceConfigurationId,
    this.resourceConfigurationName,
    this.vpcEndpointId,
    this.vpcEndpointOwner,
  });

  factory ResourceEndpointAssociationSummary.fromJson(
      Map<String, dynamic> json) {
    return ResourceEndpointAssociationSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      id: json['id'] as String?,
      resourceConfigurationArn: json['resourceConfigurationArn'] as String?,
      resourceConfigurationId: json['resourceConfigurationId'] as String?,
      resourceConfigurationName: json['resourceConfigurationName'] as String?,
      vpcEndpointId: json['vpcEndpointId'] as String?,
      vpcEndpointOwner: json['vpcEndpointOwner'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final id = this.id;
    final resourceConfigurationArn = this.resourceConfigurationArn;
    final resourceConfigurationId = this.resourceConfigurationId;
    final resourceConfigurationName = this.resourceConfigurationName;
    final vpcEndpointId = this.vpcEndpointId;
    final vpcEndpointOwner = this.vpcEndpointOwner;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (id != null) 'id': id,
      if (resourceConfigurationArn != null)
        'resourceConfigurationArn': resourceConfigurationArn,
      if (resourceConfigurationId != null)
        'resourceConfigurationId': resourceConfigurationId,
      if (resourceConfigurationName != null)
        'resourceConfigurationName': resourceConfigurationName,
      if (vpcEndpointId != null) 'vpcEndpointId': vpcEndpointId,
      if (vpcEndpointOwner != null) 'vpcEndpointOwner': vpcEndpointOwner,
    };
  }
}

/// Summary information about a resource configuration.
class ResourceConfigurationSummary {
  /// Indicates whether the resource configuration was created and is managed by
  /// Amazon.
  final bool? amazonManaged;

  /// The Amazon Resource Name (ARN) of the resource configuration.
  final String? arn;

  /// The date and time that the resource configuration was created, in ISO-8601
  /// format.
  final DateTime? createdAt;

  /// The custom domain name.
  final String? customDomainName;

  /// The domain verification ID.
  final String? domainVerificationId;

  /// (GROUP) The group domain for a group resource configuration. Any domains
  /// that you create for the child resource are subdomains of the group domain.
  /// Child resources inherit the verification status of the domain.
  final String? groupDomain;

  /// The ID of the resource configuration.
  final String? id;

  /// The most recent date and time that the resource configuration was updated,
  /// in ISO-8601 format.
  final DateTime? lastUpdatedAt;

  /// The name of the resource configuration.
  final String? name;

  /// The ID of the group resource configuration.
  final String? resourceConfigurationGroupId;

  /// The ID of the resource gateway.
  final String? resourceGatewayId;

  /// The status of the resource configuration.
  final ResourceConfigurationStatus? status;

  /// The type of resource configuration.
  ///
  /// <ul>
  /// <li>
  /// <code>SINGLE</code> - A single resource.
  /// </li>
  /// <li>
  /// <code>GROUP</code> - A group of resources. You must create a group resource
  /// configuration before you create a child resource configuration.
  /// </li>
  /// <li>
  /// <code>CHILD</code> - A single resource that is part of a group resource
  /// configuration.
  /// </li>
  /// <li>
  /// <code>ARN</code> - An Amazon Web Services resource.
  /// </li>
  /// </ul>
  final ResourceConfigurationType? type;

  ResourceConfigurationSummary({
    this.amazonManaged,
    this.arn,
    this.createdAt,
    this.customDomainName,
    this.domainVerificationId,
    this.groupDomain,
    this.id,
    this.lastUpdatedAt,
    this.name,
    this.resourceConfigurationGroupId,
    this.resourceGatewayId,
    this.status,
    this.type,
  });

  factory ResourceConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return ResourceConfigurationSummary(
      amazonManaged: json['amazonManaged'] as bool?,
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      customDomainName: json['customDomainName'] as String?,
      domainVerificationId: json['domainVerificationId'] as String?,
      groupDomain: json['groupDomain'] as String?,
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      resourceConfigurationGroupId:
          json['resourceConfigurationGroupId'] as String?,
      resourceGatewayId: json['resourceGatewayId'] as String?,
      status: (json['status'] as String?)
          ?.let(ResourceConfigurationStatus.fromString),
      type:
          (json['type'] as String?)?.let(ResourceConfigurationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final amazonManaged = this.amazonManaged;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final customDomainName = this.customDomainName;
    final domainVerificationId = this.domainVerificationId;
    final groupDomain = this.groupDomain;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final resourceConfigurationGroupId = this.resourceConfigurationGroupId;
    final resourceGatewayId = this.resourceGatewayId;
    final status = this.status;
    final type = this.type;
    return {
      if (amazonManaged != null) 'amazonManaged': amazonManaged,
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (domainVerificationId != null)
        'domainVerificationId': domainVerificationId,
      if (groupDomain != null) 'groupDomain': groupDomain,
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (resourceConfigurationGroupId != null)
        'resourceConfigurationGroupId': resourceConfigurationGroupId,
      if (resourceGatewayId != null) 'resourceGatewayId': resourceGatewayId,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
    };
  }
}

class ResourceConfigurationType {
  static const group = ResourceConfigurationType._('GROUP');
  static const child = ResourceConfigurationType._('CHILD');
  static const single = ResourceConfigurationType._('SINGLE');
  static const arn = ResourceConfigurationType._('ARN');

  final String value;

  const ResourceConfigurationType._(this.value);

  static const values = [group, child, single, arn];

  static ResourceConfigurationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceConfigurationType._(value));

  @override
  bool operator ==(other) =>
      other is ResourceConfigurationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ResourceConfigurationStatus {
  static const active = ResourceConfigurationStatus._('ACTIVE');
  static const createInProgress =
      ResourceConfigurationStatus._('CREATE_IN_PROGRESS');
  static const updateInProgress =
      ResourceConfigurationStatus._('UPDATE_IN_PROGRESS');
  static const deleteInProgress =
      ResourceConfigurationStatus._('DELETE_IN_PROGRESS');
  static const createFailed = ResourceConfigurationStatus._('CREATE_FAILED');
  static const updateFailed = ResourceConfigurationStatus._('UPDATE_FAILED');
  static const deleteFailed = ResourceConfigurationStatus._('DELETE_FAILED');

  final String value;

  const ResourceConfigurationStatus._(this.value);

  static const values = [
    active,
    createInProgress,
    updateInProgress,
    deleteInProgress,
    createFailed,
    updateFailed,
    deleteFailed
  ];

  static ResourceConfigurationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceConfigurationStatus._(value));

  @override
  bool operator ==(other) =>
      other is ResourceConfigurationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ProtocolType {
  static const tcp = ProtocolType._('TCP');

  final String value;

  const ProtocolType._(this.value);

  static const values = [tcp];

  static ProtocolType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ProtocolType._(value));

  @override
  bool operator ==(other) => other is ProtocolType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes a resource configuration.
class ResourceConfigurationDefinition {
  /// The Amazon Resource Name (ARN) of the resource.
  final ArnResource? arnResource;

  /// The DNS name of the resource.
  final DnsResource? dnsResource;

  /// The IP resource.
  final IpResource? ipResource;

  ResourceConfigurationDefinition({
    this.arnResource,
    this.dnsResource,
    this.ipResource,
  });

  factory ResourceConfigurationDefinition.fromJson(Map<String, dynamic> json) {
    return ResourceConfigurationDefinition(
      arnResource: json['arnResource'] != null
          ? ArnResource.fromJson(json['arnResource'] as Map<String, dynamic>)
          : null,
      dnsResource: json['dnsResource'] != null
          ? DnsResource.fromJson(json['dnsResource'] as Map<String, dynamic>)
          : null,
      ipResource: json['ipResource'] != null
          ? IpResource.fromJson(json['ipResource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arnResource = this.arnResource;
    final dnsResource = this.dnsResource;
    final ipResource = this.ipResource;
    return {
      if (arnResource != null) 'arnResource': arnResource,
      if (dnsResource != null) 'dnsResource': dnsResource,
      if (ipResource != null) 'ipResource': ipResource,
    };
  }
}

/// The DNS name of the resource.
class DnsResource {
  /// The domain name of the resource.
  final String? domainName;

  /// The type of IP address. Dualstack is currently not supported.
  final ResourceConfigurationIpAddressType? ipAddressType;

  DnsResource({
    this.domainName,
    this.ipAddressType,
  });

  factory DnsResource.fromJson(Map<String, dynamic> json) {
    return DnsResource(
      domainName: json['domainName'] as String?,
      ipAddressType: (json['ipAddressType'] as String?)
          ?.let(ResourceConfigurationIpAddressType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final ipAddressType = this.ipAddressType;
    return {
      if (domainName != null) 'domainName': domainName,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
    };
  }
}

/// Describes an IP resource.
class IpResource {
  /// The IP address of the IP resource.
  final String? ipAddress;

  IpResource({
    this.ipAddress,
  });

  factory IpResource.fromJson(Map<String, dynamic> json) {
    return IpResource(
      ipAddress: json['ipAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipAddress = this.ipAddress;
    return {
      if (ipAddress != null) 'ipAddress': ipAddress,
    };
  }
}

/// The Amazon Resource Name (ARN) of the resource.
class ArnResource {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  ArnResource({
    this.arn,
  });

  factory ArnResource.fromJson(Map<String, dynamic> json) {
    return ArnResource(
      arn: json['arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'arn': arn,
    };
  }
}

class ResourceConfigurationIpAddressType {
  static const ipv4 = ResourceConfigurationIpAddressType._('IPV4');
  static const ipv6 = ResourceConfigurationIpAddressType._('IPV6');
  static const dualstack = ResourceConfigurationIpAddressType._('DUALSTACK');

  final String value;

  const ResourceConfigurationIpAddressType._(this.value);

  static const values = [ipv4, ipv6, dualstack];

  static ResourceConfigurationIpAddressType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceConfigurationIpAddressType._(value));

  @override
  bool operator ==(other) =>
      other is ResourceConfigurationIpAddressType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a listener.
class ListenerSummary {
  /// The Amazon Resource Name (ARN) of the listener.
  final String? arn;

  /// The date and time that the listener was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The ID of the listener.
  final String? id;

  /// The date and time that the listener was last updated, in ISO-8601 format.
  final DateTime? lastUpdatedAt;

  /// The name of the listener.
  final String? name;

  /// The listener port.
  final int? port;

  /// The listener protocol.
  final ListenerProtocol? protocol;

  ListenerSummary({
    this.arn,
    this.createdAt,
    this.id,
    this.lastUpdatedAt,
    this.name,
    this.port,
    this.protocol,
  });

  factory ListenerSummary.fromJson(Map<String, dynamic> json) {
    return ListenerSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      port: json['port'] as int?,
      protocol: (json['protocol'] as String?)?.let(ListenerProtocol.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final port = this.port;
    final protocol = this.protocol;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.value,
    };
  }
}

class ListenerProtocol {
  static const http = ListenerProtocol._('HTTP');
  static const https = ListenerProtocol._('HTTPS');
  static const tlsPassthrough = ListenerProtocol._('TLS_PASSTHROUGH');

  final String value;

  const ListenerProtocol._(this.value);

  static const values = [http, https, tlsPassthrough];

  static ListenerProtocol fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ListenerProtocol._(value));

  @override
  bool operator ==(other) => other is ListenerProtocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a domain verification.
class DomainVerificationSummary {
  /// The Amazon Resource Name (ARN) of the domain verification.
  final String arn;

  /// The date and time that the domain verification was created, in ISO-8601
  /// format.
  final DateTime createdAt;

  /// The domain name being verified.
  final String domainName;

  /// The ID of the domain verification.
  final String id;

  /// The current status of the domain verification process.
  final VerificationStatus status;

  /// The date and time that the domain was last successfully verified, in
  /// ISO-8601 format.
  final DateTime? lastVerifiedTime;

  /// The tags associated with the domain verification.
  final Map<String, String>? tags;

  /// The TXT record configuration used for domain verification.
  final TxtMethodConfig? txtMethodConfig;

  DomainVerificationSummary({
    required this.arn,
    required this.createdAt,
    required this.domainName,
    required this.id,
    required this.status,
    this.lastVerifiedTime,
    this.tags,
    this.txtMethodConfig,
  });

  factory DomainVerificationSummary.fromJson(Map<String, dynamic> json) {
    return DomainVerificationSummary(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      domainName: (json['domainName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      status: VerificationStatus.fromString((json['status'] as String?) ?? ''),
      lastVerifiedTime: timeStampFromJson(json['lastVerifiedTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      txtMethodConfig: json['txtMethodConfig'] != null
          ? TxtMethodConfig.fromJson(
              json['txtMethodConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final id = this.id;
    final status = this.status;
    final lastVerifiedTime = this.lastVerifiedTime;
    final tags = this.tags;
    final txtMethodConfig = this.txtMethodConfig;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'domainName': domainName,
      'id': id,
      'status': status.value,
      if (lastVerifiedTime != null)
        'lastVerifiedTime': iso8601ToJson(lastVerifiedTime),
      if (tags != null) 'tags': tags,
      if (txtMethodConfig != null) 'txtMethodConfig': txtMethodConfig,
    };
  }
}

/// Configuration for TXT record-based domain verification method.
class TxtMethodConfig {
  /// The name of the TXT record that must be created for domain verification.
  final String name;

  /// The value that must be added to the TXT record for domain verification.
  final String value;

  TxtMethodConfig({
    required this.name,
    required this.value,
  });

  factory TxtMethodConfig.fromJson(Map<String, dynamic> json) {
    return TxtMethodConfig(
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

/// Summary information about an access log subscription.
class AccessLogSubscriptionSummary {
  /// The Amazon Resource Name (ARN) of the access log subscription
  final String arn;

  /// The date and time that the access log subscription was created, in ISO-8601
  /// format.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the destination.
  final String destinationArn;

  /// The ID of the access log subscription.
  final String id;

  /// The date and time that the access log subscription was last updated, in
  /// ISO-8601 format.
  final DateTime lastUpdatedAt;

  /// The Amazon Resource Name (ARN) of the service or service network.
  final String resourceArn;

  /// The ID of the service or service network.
  final String resourceId;

  /// Log type of the service network.
  final ServiceNetworkLogType? serviceNetworkLogType;

  AccessLogSubscriptionSummary({
    required this.arn,
    required this.createdAt,
    required this.destinationArn,
    required this.id,
    required this.lastUpdatedAt,
    required this.resourceArn,
    required this.resourceId,
    this.serviceNetworkLogType,
  });

  factory AccessLogSubscriptionSummary.fromJson(Map<String, dynamic> json) {
    return AccessLogSubscriptionSummary(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      destinationArn: (json['destinationArn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['lastUpdatedAt'] ?? 0),
      resourceArn: (json['resourceArn'] as String?) ?? '',
      resourceId: (json['resourceId'] as String?) ?? '',
      serviceNetworkLogType: (json['serviceNetworkLogType'] as String?)
          ?.let(ServiceNetworkLogType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final destinationArn = this.destinationArn;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final serviceNetworkLogType = this.serviceNetworkLogType;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'destinationArn': destinationArn,
      'id': id,
      'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'resourceArn': resourceArn,
      'resourceId': resourceId,
      if (serviceNetworkLogType != null)
        'serviceNetworkLogType': serviceNetworkLogType.value,
    };
  }
}

class ServiceNetworkLogType {
  static const service = ServiceNetworkLogType._('SERVICE');
  static const resource = ServiceNetworkLogType._('RESOURCE');

  final String value;

  const ServiceNetworkLogType._(this.value);

  static const values = [service, resource];

  static ServiceNetworkLogType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServiceNetworkLogType._(value));

  @override
  bool operator ==(other) =>
      other is ServiceNetworkLogType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AuthPolicyState {
  static const active = AuthPolicyState._('Active');
  static const inactive = AuthPolicyState._('Inactive');

  final String value;

  const AuthPolicyState._(this.value);

  static const values = [active, inactive];

  static AuthPolicyState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AuthPolicyState._(value));

  @override
  bool operator ==(other) => other is AuthPolicyState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the association between a service network and a VPC endpoint.
class ServiceNetworkEndpointAssociation {
  /// The date and time that the association was created, in ISO-8601 format.
  final DateTime? createdAt;

  /// The ID of the association.
  final String? id;

  /// The Amazon Resource Name (ARN) of the service network.
  final String? serviceNetworkArn;

  /// The state of the association.
  final String? state;

  /// The ID of the VPC endpoint associated with the service network.
  final String? vpcEndpointId;

  /// The owner of the VPC endpoint associated with the service network.
  final String? vpcEndpointOwnerId;

  /// The ID of the VPC for the association.
  final String? vpcId;

  ServiceNetworkEndpointAssociation({
    this.createdAt,
    this.id,
    this.serviceNetworkArn,
    this.state,
    this.vpcEndpointId,
    this.vpcEndpointOwnerId,
    this.vpcId,
  });

  factory ServiceNetworkEndpointAssociation.fromJson(
      Map<String, dynamic> json) {
    return ServiceNetworkEndpointAssociation(
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      serviceNetworkArn: json['serviceNetworkArn'] as String?,
      state: json['state'] as String?,
      vpcEndpointId: json['vpcEndpointId'] as String?,
      vpcEndpointOwnerId: json['vpcEndpointOwnerId'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final id = this.id;
    final serviceNetworkArn = this.serviceNetworkArn;
    final state = this.state;
    final vpcEndpointId = this.vpcEndpointId;
    final vpcEndpointOwnerId = this.vpcEndpointOwnerId;
    final vpcId = this.vpcId;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (id != null) 'id': id,
      if (serviceNetworkArn != null) 'serviceNetworkArn': serviceNetworkArn,
      if (state != null) 'state': state,
      if (vpcEndpointId != null) 'vpcEndpointId': vpcEndpointId,
      if (vpcEndpointOwnerId != null) 'vpcEndpointOwnerId': vpcEndpointOwnerId,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// Describes a rule update that failed.
class RuleUpdateFailure {
  /// The failure code.
  final String? failureCode;

  /// The failure message.
  final String? failureMessage;

  /// The ID or ARN of the rule.
  final String? ruleIdentifier;

  RuleUpdateFailure({
    this.failureCode,
    this.failureMessage,
    this.ruleIdentifier,
  });

  factory RuleUpdateFailure.fromJson(Map<String, dynamic> json) {
    return RuleUpdateFailure(
      failureCode: json['failureCode'] as String?,
      failureMessage: json['failureMessage'] as String?,
      ruleIdentifier: json['ruleIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureCode = this.failureCode;
    final failureMessage = this.failureMessage;
    final ruleIdentifier = this.ruleIdentifier;
    return {
      if (failureCode != null) 'failureCode': failureCode,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (ruleIdentifier != null) 'ruleIdentifier': ruleIdentifier,
    };
  }
}

/// Describes a successful rule update.
class RuleUpdateSuccess {
  /// The action for the rule.
  final RuleAction? action;

  /// The Amazon Resource Name (ARN) of the listener.
  final String? arn;

  /// The ID of the listener.
  final String? id;

  /// Indicates whether this is the default rule.
  final bool? isDefault;

  /// The rule match.
  final RuleMatch? match;

  /// The name of the listener.
  final String? name;

  /// The rule priority.
  final int? priority;

  RuleUpdateSuccess({
    this.action,
    this.arn,
    this.id,
    this.isDefault,
    this.match,
    this.name,
    this.priority,
  });

  factory RuleUpdateSuccess.fromJson(Map<String, dynamic> json) {
    return RuleUpdateSuccess(
      action: json['action'] != null
          ? RuleAction.fromJson(json['action'] as Map<String, dynamic>)
          : null,
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      isDefault: json['isDefault'] as bool?,
      match: json['match'] != null
          ? RuleMatch.fromJson(json['match'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      priority: json['priority'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final arn = this.arn;
    final id = this.id;
    final isDefault = this.isDefault;
    final match = this.match;
    final name = this.name;
    final priority = this.priority;
    return {
      if (action != null) 'action': action,
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (isDefault != null) 'isDefault': isDefault,
      if (match != null) 'match': match,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
    };
  }
}

/// Describes a rule update.
class RuleUpdate {
  /// The ID or ARN of the rule.
  final String ruleIdentifier;

  /// The rule action.
  final RuleAction? action;

  /// The rule match.
  final RuleMatch? match;

  /// The rule priority. A listener can't have multiple rules with the same
  /// priority.
  final int? priority;

  RuleUpdate({
    required this.ruleIdentifier,
    this.action,
    this.match,
    this.priority,
  });

  Map<String, dynamic> toJson() {
    final ruleIdentifier = this.ruleIdentifier;
    final action = this.action;
    final match = this.match;
    final priority = this.priority;
    return {
      'ruleIdentifier': ruleIdentifier,
      if (action != null) 'action': action,
      if (match != null) 'match': match,
      if (priority != null) 'priority': priority,
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
