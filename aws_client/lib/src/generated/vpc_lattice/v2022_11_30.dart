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
            signingName: 'vpc-lattice',
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [rules] :
  /// The rules for the specified listener.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service.
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

  /// Enables access logs to be sent to Amazon CloudWatch, Amazon S3, and Amazon
  /// Kinesis Data Firehose. The service network owner can use the access logs
  /// to audit the services in the network. The service network owner can only
  /// see access logs from clients and services that are associated with their
  /// service network. Access log entries represent traffic originated from VPCs
  /// associated with that network. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/monitoring-access-logs.html">Access
  /// logs</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [destinationArn] :
  /// The Amazon Resource Name (ARN) of the destination. The supported
  /// destination types are CloudWatch Log groups, Kinesis Data Firehose
  /// delivery streams, and Amazon S3 buckets.
  ///
  /// Parameter [resourceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service network or service.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you retry a request that completed
  /// successfully using the same client token and parameters, the retry
  /// succeeds without performing any actions. If the parameters aren't
  /// identical, the retry fails.
  ///
  /// Parameter [tags] :
  /// The tags for the access log subscription.
  Future<CreateAccessLogSubscriptionResponse> createAccessLogSubscription({
    required String destinationArn,
    required String resourceIdentifier,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'destinationArn': destinationArn,
      'resourceIdentifier': resourceIdentifier,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
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

  /// Creates a listener for a service. Before you start using your Amazon VPC
  /// Lattice service, you must add one or more listeners. A listener is a
  /// process that checks for connection requests to your services. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/listeners.html">Listeners</a>
  /// in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
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
  /// The ID or Amazon Resource Name (ARN) of the service.
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
      'protocol': protocol.toValue(),
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

  /// Creates a listener rule. Each listener has a default rule for checking
  /// connection requests, but you can define additional rules. Each rule
  /// consists of a priority, one or more actions, and one or more conditions.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/listeners.html#listener-rules">Listener
  /// rules</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [action] :
  /// The action for the default rule.
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the listener.
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
  /// The ID or Amazon Resource Name (ARN) of the service.
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
      100,
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

  /// Creates a service. A service is any software application that can run on
  /// instances containers, or serverless functions within an account or virtual
  /// private cloud (VPC).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/services.html">Services</a>
  /// in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
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
      if (authType != null) 'authType': authType.toValue(),
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

  /// Creates a service network. A service network is a logical boundary for a
  /// collection of services. You can associate services and VPCs with a service
  /// network.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/service-networks.html">Service
  /// networks</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
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
  /// Parameter [tags] :
  /// The tags for the service network.
  Future<CreateServiceNetworkResponse> createServiceNetwork({
    required String name,
    AuthType? authType,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (authType != null) 'authType': authType.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
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

  /// Associates a service with a service network. For more information, see <a
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service.
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service network. You must use
  /// the ARN if the resources specified in the operation are in different
  /// accounts.
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service network. You must use
  /// the ARN when the resources specified in the operation are in different
  /// accounts.
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
    List<String>? securityGroupIds,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'serviceNetworkIdentifier': serviceNetworkIdentifier,
      'vpcIdentifier': vpcIdentifier,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
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

  /// Creates a target group. A target group is a collection of targets, or
  /// compute resources, that run your application or service. A target group
  /// can only be used by a single service.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/target-groups.html">Target
  /// groups</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
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
      'type': type.toValue(),
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

  /// Deletes the specified access log subscription.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [accessLogSubscriptionIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the access log subscription.
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

  /// Deletes the specified auth policy. If an auth is set to
  /// <code>AWS_IAM</code> and the auth policy is deleted, all requests are
  /// denied. If you are trying to remove the auth policy completely, you must
  /// set the auth type to <code>NONE</code>. If auth is enabled on the
  /// resource, but no auth policy is set, all requests are denied.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the resource.
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

  /// Deletes the specified listener.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service.
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

  /// Deletes the specified resource policy.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [ruleIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the rule.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service.
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

  /// Deletes a service. A service can't be deleted if it's associated with a
  /// service network. If you delete a service, all resources related to the
  /// service, such as the resource policy, auth policy, listeners, listener
  /// rules, and access log subscriptions, are also deleted. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/services.html#delete-service">Delete
  /// a service</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service.
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

  /// Deletes a service network. You can only delete the service network if
  /// there is no service or VPC associated with it. If you delete a service
  /// network, all resources related to the service network, such as the
  /// resource policy, auth policy, and access log subscriptions, are also
  /// deleted. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/service-networks.html#delete-service-network">Delete
  /// a service network</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The Amazon Resource Name (ARN) or ID of the service network.
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

  /// Deletes the association between a specified service and the specific
  /// service network. This operation fails if an association is still in
  /// progress.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceNetworkServiceAssociationIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the association.
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

  /// Disassociates the VPC from the service network. You can't disassociate the
  /// VPC if there is a create or update association in progress.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceNetworkVpcAssociationIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the association.
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

  /// Deletes a target group. You can't delete a target group if it is used in a
  /// listener rule or if the target group creation is in progress.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [targetGroupIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the target group.
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

  /// Deregisters the specified targets from the specified target group.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [targetGroupIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the target group.
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

  /// Retrieves information about the specified access log subscription.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [accessLogSubscriptionIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the access log subscription.
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

  /// Retrieves information about the auth policy for the specified service or
  /// service network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service network or service.
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

  /// Retrieves information about the specified listener for the specified
  /// service.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service.
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

  /// Retrieves information about the resource policy. The resource policy is an
  /// IAM policy created on behalf of the resource owner when they share a
  /// resource.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Retrieves information about listener rules. You can also retrieve
  /// information about the default listener rule. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/listeners.html#listener-rules">Listener
  /// rules</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [ruleIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the listener rule.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service.
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

  /// Retrieves information about the specified service.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service.
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

  /// Retrieves information about the specified service network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service network.
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

  /// Retrieves information about the specified association between a service
  /// network and a service.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceNetworkServiceAssociationIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the association.
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

  /// Retrieves information about the association between a service network and
  /// a VPC.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceNetworkVpcAssociationIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the association.
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

  /// Retrieves information about the specified target group.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [targetGroupIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the target group.
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

  /// Lists all access log subscriptions for the specified service network or
  /// service.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service network or service.
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

  /// Lists the listeners for the specified service.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service.
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

  /// Lists the rules for the listener.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service.
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

  /// Lists the associations between the service network and the service. You
  /// can filter the list either by service or service network. You must provide
  /// either the service network identifier or the service identifier.
  ///
  /// Every association in Amazon VPC Lattice is given a unique Amazon Resource
  /// Name (ARN), such as when a service network is associated with a VPC or
  /// when a service is associated with a service network. If the association is
  /// for a resource that is shared with another account, the association
  /// includes the local account ID as the prefix in the ARN for each account
  /// the resource is shared with.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next page of results.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service.
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service network.
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

  /// Lists the service network and VPC associations. You can filter the list
  /// either by VPC or service network. You must provide either the service
  /// network identifier or the VPC identifier.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next page of results.
  ///
  /// Parameter [serviceNetworkIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service network.
  ///
  /// Parameter [vpcIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the VPC.
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

  /// Lists the service networks owned by the caller account or shared with the
  /// caller account. Also includes the account ID in the ARN to show which
  /// account owns the service network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Lists the services owned by the caller account or shared with the caller
  /// account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Lists the tags for the specified resource.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Lists your target groups. You can narrow your search by using the filters
  /// below in your request.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// The ID or Amazon Resource Name (ARN) of the VPC.
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
      if (targetGroupType != null)
        'targetGroupType': [targetGroupType.toValue()],
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

  /// Lists the targets for the target group. By default, all targets are
  /// included. You can use this API to check the health status of targets. You
  /// can also ﬁlter the results by target.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [targetGroupIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the target group.
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

  /// Creates or updates the auth policy. The policy string in JSON must not
  /// contain newlines or blank lines.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/auth-policies.html">Auth
  /// policies</a> in the <i>Amazon VPC Lattice User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policy] :
  /// The auth policy. The policy string in JSON must not contain newlines or
  /// blank lines.
  ///
  /// Parameter [resourceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service network or service for
  /// which the policy is created.
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policy] :
  /// An IAM policy. The policy string in JSON must not contain newlines or
  /// blank lines.
  ///
  /// Parameter [resourceArn] :
  /// The ID or Amazon Resource Name (ARN) of the service network or service for
  /// which the policy is created.
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

  /// Registers the targets with the target group. If it's a Lambda target, you
  /// can only have one target in a target group.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [targetGroupIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the target group.
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

  /// Adds the specified tags to the specified resource.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Updates the specified access log subscription.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [accessLogSubscriptionIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the access log subscription.
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

  /// Updates the specified listener for the specified service.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [defaultAction] :
  /// The action for the default rule.
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service.
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

  /// Updates a rule for the listener. You can't modify a default listener rule.
  /// To modify a default listener rule, use <code>UpdateListener</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [listenerIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [ruleIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the rule.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service.
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
      100,
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

  /// Updates the specified service.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the service.
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
      if (authType != null) 'authType': authType.toValue(),
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

  /// Updates the specified service network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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
  /// The ID or Amazon Resource Name (ARN) of the service network.
  Future<UpdateServiceNetworkResponse> updateServiceNetwork({
    required AuthType authType,
    required String serviceNetworkIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'authType': authType.toValue(),
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

  /// Updates the service network and VPC association. If you add a security
  /// group to the service network and VPC association, the association must
  /// continue to always have at least one security group. You can add or edit
  /// security groups at any time. However, to remove all security groups, you
  /// must first delete the association and recreate it without security groups.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [securityGroupIds] :
  /// The IDs of the security groups.
  ///
  /// Parameter [serviceNetworkVpcAssociationIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the association.
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

  /// Updates the specified target group.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [healthCheck] :
  /// The health check configuration.
  ///
  /// Parameter [targetGroupIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the target group.
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
}

/// Summary information about an access log subscription.
class AccessLogSubscriptionSummary {
  /// The Amazon Resource Name (ARN) of the access log subscription
  final String arn;

  /// The date and time that the access log subscription was created, specified in
  /// ISO-8601 format.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the destination.
  final String destinationArn;

  /// The ID of the access log subscription.
  final String id;

  /// The date and time that the access log subscription was last updated,
  /// specified in ISO-8601 format.
  final DateTime lastUpdatedAt;

  /// The Amazon Resource Name (ARN) of the service or service network.
  final String resourceArn;

  /// The ID of the service or service network.
  final String resourceId;

  AccessLogSubscriptionSummary({
    required this.arn,
    required this.createdAt,
    required this.destinationArn,
    required this.id,
    required this.lastUpdatedAt,
    required this.resourceArn,
    required this.resourceId,
  });

  factory AccessLogSubscriptionSummary.fromJson(Map<String, dynamic> json) {
    return AccessLogSubscriptionSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      destinationArn: json['destinationArn'] as String,
      id: json['id'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['lastUpdatedAt'] as Object),
      resourceArn: json['resourceArn'] as String,
      resourceId: json['resourceId'] as String,
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
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'destinationArn': destinationArn,
      'id': id,
      'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'resourceArn': resourceArn,
      'resourceId': resourceId,
    };
  }
}

enum AuthPolicyState {
  active,
  inactive,
}

extension AuthPolicyStateValueExtension on AuthPolicyState {
  String toValue() {
    switch (this) {
      case AuthPolicyState.active:
        return 'Active';
      case AuthPolicyState.inactive:
        return 'Inactive';
    }
  }
}

extension AuthPolicyStateFromString on String {
  AuthPolicyState toAuthPolicyState() {
    switch (this) {
      case 'Active':
        return AuthPolicyState.active;
      case 'Inactive':
        return AuthPolicyState.inactive;
    }
    throw Exception('$this is not known in enum AuthPolicyState');
  }
}

enum AuthType {
  none,
  awsIam,
}

extension AuthTypeValueExtension on AuthType {
  String toValue() {
    switch (this) {
      case AuthType.none:
        return 'NONE';
      case AuthType.awsIam:
        return 'AWS_IAM';
    }
  }
}

extension AuthTypeFromString on String {
  AuthType toAuthType() {
    switch (this) {
      case 'NONE':
        return AuthType.none;
      case 'AWS_IAM':
        return AuthType.awsIam;
    }
    throw Exception('$this is not known in enum AuthType');
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
          ?.whereNotNull()
          .map((e) => RuleUpdateSuccess.fromJson(e as Map<String, dynamic>))
          .toList(),
      unsuccessful: (json['unsuccessful'] as List?)
          ?.whereNotNull()
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

  CreateAccessLogSubscriptionResponse({
    required this.arn,
    required this.destinationArn,
    required this.id,
    required this.resourceArn,
    required this.resourceId,
  });

  factory CreateAccessLogSubscriptionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAccessLogSubscriptionResponse(
      arn: json['arn'] as String,
      destinationArn: json['destinationArn'] as String,
      id: json['id'] as String,
      resourceArn: json['resourceArn'] as String,
      resourceId: json['resourceId'] as String,
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
      protocol: (json['protocol'] as String?)?.toListenerProtocol(),
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
      if (protocol != null) 'protocol': protocol.toValue(),
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (serviceId != null) 'serviceId': serviceId,
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

class CreateServiceNetworkResponse {
  /// The Amazon Resource Name (ARN) of the service network.
  final String? arn;

  /// The type of IAM policy.
  final AuthType? authType;

  /// The ID of the service network.
  final String? id;

  /// The name of the service network.
  final String? name;

  CreateServiceNetworkResponse({
    this.arn,
    this.authType,
    this.id,
    this.name,
  });

  factory CreateServiceNetworkResponse.fromJson(Map<String, dynamic> json) {
    return CreateServiceNetworkResponse(
      arn: json['arn'] as String?,
      authType: (json['authType'] as String?)?.toAuthType(),
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
      if (authType != null) 'authType': authType.toValue(),
      if (id != null) 'id': id,
      if (name != null) 'name': name,
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
          ?.toServiceNetworkServiceAssociationStatus(),
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
      if (status != null) 'status': status.toValue(),
    };
  }
}

class CreateServiceNetworkVpcAssociationResponse {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The account that created the association.
  final String? createdBy;

  /// The ID of the association.
  final String? id;

  /// The IDs of the security groups.
  final List<String>? securityGroupIds;

  /// The association status.
  final ServiceNetworkVpcAssociationStatus? status;

  CreateServiceNetworkVpcAssociationResponse({
    this.arn,
    this.createdBy,
    this.id,
    this.securityGroupIds,
    this.status,
  });

  factory CreateServiceNetworkVpcAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateServiceNetworkVpcAssociationResponse(
      arn: json['arn'] as String?,
      createdBy: json['createdBy'] as String?,
      id: json['id'] as String?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status:
          (json['status'] as String?)?.toServiceNetworkVpcAssociationStatus(),
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
      if (status != null) 'status': status.toValue(),
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
      authType: (json['authType'] as String?)?.toAuthType(),
      certificateArn: json['certificateArn'] as String?,
      customDomainName: json['customDomainName'] as String?,
      dnsEntry: json['dnsEntry'] != null
          ? DnsEntry.fromJson(json['dnsEntry'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toServiceStatus(),
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
      if (authType != null) 'authType': authType.toValue(),
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (dnsEntry != null) 'dnsEntry': dnsEntry,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
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
      status: (json['status'] as String?)?.toTargetGroupStatus(),
      type: (json['type'] as String?)?.toTargetGroupType(),
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
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
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

class DeleteAuthPolicyResponse {
  DeleteAuthPolicyResponse();

  factory DeleteAuthPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAuthPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class DeleteResourcePolicyResponse {
  DeleteResourcePolicyResponse();

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class DeleteServiceNetworkResponse {
  DeleteServiceNetworkResponse();

  factory DeleteServiceNetworkResponse.fromJson(Map<String, dynamic> _) {
    return DeleteServiceNetworkResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
          ?.toServiceNetworkServiceAssociationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (status != null) 'status': status.toValue(),
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
      status:
          (json['status'] as String?)?.toServiceNetworkVpcAssociationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (status != null) 'status': status.toValue(),
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
      status: (json['status'] as String?)?.toServiceStatus(),
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
      if (status != null) 'status': status.toValue(),
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
      status: (json['status'] as String?)?.toTargetGroupStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (status != null) 'status': status.toValue(),
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
          ?.whereNotNull()
          .map((e) => Target.fromJson(e as Map<String, dynamic>))
          .toList(),
      unsuccessful: (json['unsuccessful'] as List?)
          ?.whereNotNull()
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

/// Describes an action that returns a custom HTTP response.
class FixedResponseAction {
  /// The HTTP response code.
  final int statusCode;

  FixedResponseAction({
    required this.statusCode,
  });

  factory FixedResponseAction.fromJson(Map<String, dynamic> json) {
    return FixedResponseAction(
      statusCode: json['statusCode'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    return {
      'statusCode': statusCode,
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
      targetGroups: (json['targetGroups'] as List)
          .whereNotNull()
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

class GetAccessLogSubscriptionResponse {
  /// The Amazon Resource Name (ARN) of the access log subscription.
  final String arn;

  /// The date and time that the access log subscription was created, specified in
  /// ISO-8601 format.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the access log destination.
  final String destinationArn;

  /// The ID of the access log subscription.
  final String id;

  /// The date and time that the access log subscription was last updated,
  /// specified in ISO-8601 format.
  final DateTime lastUpdatedAt;

  /// The Amazon Resource Name (ARN) of the service network or service.
  final String resourceArn;

  /// The ID of the service network or service.
  final String resourceId;

  GetAccessLogSubscriptionResponse({
    required this.arn,
    required this.createdAt,
    required this.destinationArn,
    required this.id,
    required this.lastUpdatedAt,
    required this.resourceArn,
    required this.resourceId,
  });

  factory GetAccessLogSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return GetAccessLogSubscriptionResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      destinationArn: json['destinationArn'] as String,
      id: json['id'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['lastUpdatedAt'] as Object),
      resourceArn: json['resourceArn'] as String,
      resourceId: json['resourceId'] as String,
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
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'destinationArn': destinationArn,
      'id': id,
      'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'resourceArn': resourceArn,
      'resourceId': resourceId,
    };
  }
}

class GetAuthPolicyResponse {
  /// The date and time that the auth policy was created, specified in ISO-8601
  /// format.
  final DateTime? createdAt;

  /// The date and time that the auth policy was last updated, specified in
  /// ISO-8601 format.
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
      state: (json['state'] as String?)?.toAuthPolicyState(),
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
      if (state != null) 'state': state.toValue(),
    };
  }
}

class GetListenerResponse {
  /// The Amazon Resource Name (ARN) of the listener.
  final String? arn;

  /// The date and time that the listener was created, specified in ISO-8601
  /// format.
  final DateTime? createdAt;

  /// The actions for the default listener rule.
  final RuleAction? defaultAction;

  /// The ID of the listener.
  final String? id;

  /// The date and time that the listener was last updated, specified in ISO-8601
  /// format.
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
      protocol: (json['protocol'] as String?)?.toListenerProtocol(),
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
      if (protocol != null) 'protocol': protocol.toValue(),
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (serviceId != null) 'serviceId': serviceId,
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

class GetRuleResponse {
  /// The action for the default rule.
  final RuleAction? action;

  /// The Amazon Resource Name (ARN) of the listener.
  final String? arn;

  /// The date and time that the listener rule was created, specified in ISO-8601
  /// format.
  final DateTime? createdAt;

  /// The ID of the listener.
  final String? id;

  /// Indicates whether this is the default rule.
  final bool? isDefault;

  /// The date and time that the listener rule was last updated, specified in
  /// ISO-8601 format.
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

class GetServiceNetworkResponse {
  /// The Amazon Resource Name (ARN) of the service network.
  final String? arn;

  /// The type of IAM policy.
  final AuthType? authType;

  /// The date and time that the service network was created, specified in
  /// ISO-8601 format.
  final DateTime? createdAt;

  /// The ID of the service network.
  final String? id;

  /// The date and time of the last update, specified in ISO-8601 format.
  final DateTime? lastUpdatedAt;

  /// The name of the service network.
  final String? name;

  /// The number of services associated with the service network.
  final int? numberOfAssociatedServices;

  /// The number of VPCs associated with the service network.
  final int? numberOfAssociatedVPCs;

  GetServiceNetworkResponse({
    this.arn,
    this.authType,
    this.createdAt,
    this.id,
    this.lastUpdatedAt,
    this.name,
    this.numberOfAssociatedServices,
    this.numberOfAssociatedVPCs,
  });

  factory GetServiceNetworkResponse.fromJson(Map<String, dynamic> json) {
    return GetServiceNetworkResponse(
      arn: json['arn'] as String?,
      authType: (json['authType'] as String?)?.toAuthType(),
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      numberOfAssociatedServices: json['numberOfAssociatedServices'] as int?,
      numberOfAssociatedVPCs: json['numberOfAssociatedVPCs'] as int?,
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
    return {
      if (arn != null) 'arn': arn,
      if (authType != null) 'authType': authType.toValue(),
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (numberOfAssociatedServices != null)
        'numberOfAssociatedServices': numberOfAssociatedServices,
      if (numberOfAssociatedVPCs != null)
        'numberOfAssociatedVPCs': numberOfAssociatedVPCs,
    };
  }
}

class GetServiceNetworkServiceAssociationResponse {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The date and time that the association was created, specified in ISO-8601
  /// format.
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
          ?.toServiceNetworkServiceAssociationStatus(),
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
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetServiceNetworkVpcAssociationResponse {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The date and time that the association was created, specified in ISO-8601
  /// format.
  final DateTime? createdAt;

  /// The account that created the association.
  final String? createdBy;

  /// The failure code.
  final String? failureCode;

  /// The failure message.
  final String? failureMessage;

  /// The ID of the specified association between the service network and the VPC.
  final String? id;

  /// The date and time that the association was last updated, specified in
  /// ISO-8601 format.
  final DateTime? lastUpdatedAt;

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
    this.failureCode,
    this.failureMessage,
    this.id,
    this.lastUpdatedAt,
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
      failureCode: json['failureCode'] as String?,
      failureMessage: json['failureMessage'] as String?,
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      serviceNetworkArn: json['serviceNetworkArn'] as String?,
      serviceNetworkId: json['serviceNetworkId'] as String?,
      serviceNetworkName: json['serviceNetworkName'] as String?,
      status:
          (json['status'] as String?)?.toServiceNetworkVpcAssociationStatus(),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final failureCode = this.failureCode;
    final failureMessage = this.failureMessage;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
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
      if (failureCode != null) 'failureCode': failureCode,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (serviceNetworkArn != null) 'serviceNetworkArn': serviceNetworkArn,
      if (serviceNetworkId != null) 'serviceNetworkId': serviceNetworkId,
      if (serviceNetworkName != null) 'serviceNetworkName': serviceNetworkName,
      if (status != null) 'status': status.toValue(),
      if (vpcId != null) 'vpcId': vpcId,
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

  /// The date and time that the service was created, specified in ISO-8601
  /// format.
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

  /// The date and time that the service was last updated, specified in ISO-8601
  /// format.
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
      authType: (json['authType'] as String?)?.toAuthType(),
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
      status: (json['status'] as String?)?.toServiceStatus(),
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
      if (authType != null) 'authType': authType.toValue(),
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (dnsEntry != null) 'dnsEntry': dnsEntry,
      if (failureCode != null) 'failureCode': failureCode,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetTargetGroupResponse {
  /// The Amazon Resource Name (ARN) of the target group.
  final String? arn;

  /// The target group configuration.
  final TargetGroupConfig? config;

  /// The date and time that the target group was created, specified in ISO-8601
  /// format.
  final DateTime? createdAt;

  /// The failure code.
  final String? failureCode;

  /// The failure message.
  final String? failureMessage;

  /// The ID of the target group.
  final String? id;

  /// The date and time that the target group was last updated, specified in
  /// ISO-8601 format.
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.toTargetGroupStatus(),
      type: (json['type'] as String?)?.toTargetGroupType(),
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
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
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
      match: HeaderMatchType.fromJson(json['match'] as Map<String, dynamic>),
      name: json['name'] as String,
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
      protocol: (json['protocol'] as String?)?.toTargetGroupProtocol(),
      protocolVersion:
          (json['protocolVersion'] as String?)?.toHealthCheckProtocolVersion(),
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
      if (protocol != null) 'protocol': protocol.toValue(),
      if (protocolVersion != null) 'protocolVersion': protocolVersion.toValue(),
      if (unhealthyThresholdCount != null)
        'unhealthyThresholdCount': unhealthyThresholdCount,
    };
  }
}

enum HealthCheckProtocolVersion {
  http1,
  http2,
}

extension HealthCheckProtocolVersionValueExtension
    on HealthCheckProtocolVersion {
  String toValue() {
    switch (this) {
      case HealthCheckProtocolVersion.http1:
        return 'HTTP1';
      case HealthCheckProtocolVersion.http2:
        return 'HTTP2';
    }
  }
}

extension HealthCheckProtocolVersionFromString on String {
  HealthCheckProtocolVersion toHealthCheckProtocolVersion() {
    switch (this) {
      case 'HTTP1':
        return HealthCheckProtocolVersion.http1;
      case 'HTTP2':
        return HealthCheckProtocolVersion.http2;
    }
    throw Exception('$this is not known in enum HealthCheckProtocolVersion');
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
          ?.whereNotNull()
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

enum IpAddressType {
  ipv4,
  ipv6,
}

extension IpAddressTypeValueExtension on IpAddressType {
  String toValue() {
    switch (this) {
      case IpAddressType.ipv4:
        return 'IPV4';
      case IpAddressType.ipv6:
        return 'IPV6';
    }
  }
}

extension IpAddressTypeFromString on String {
  IpAddressType toIpAddressType() {
    switch (this) {
      case 'IPV4':
        return IpAddressType.ipv4;
      case 'IPV6':
        return IpAddressType.ipv6;
    }
    throw Exception('$this is not known in enum IpAddressType');
  }
}

enum LambdaEventStructureVersion {
  v1,
  v2,
}

extension LambdaEventStructureVersionValueExtension
    on LambdaEventStructureVersion {
  String toValue() {
    switch (this) {
      case LambdaEventStructureVersion.v1:
        return 'V1';
      case LambdaEventStructureVersion.v2:
        return 'V2';
    }
  }
}

extension LambdaEventStructureVersionFromString on String {
  LambdaEventStructureVersion toLambdaEventStructureVersion() {
    switch (this) {
      case 'V1':
        return LambdaEventStructureVersion.v1;
      case 'V2':
        return LambdaEventStructureVersion.v2;
    }
    throw Exception('$this is not known in enum LambdaEventStructureVersion');
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
      items: (json['items'] as List)
          .whereNotNull()
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
      items: (json['items'] as List)
          .whereNotNull()
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
      items: (json['items'] as List)
          .whereNotNull()
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
      items: (json['items'] as List)
          .whereNotNull()
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
      items: (json['items'] as List)
          .whereNotNull()
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
      items: (json['items'] as List)
          .whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
      items: (json['items'] as List)
          .whereNotNull()
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

enum ListenerProtocol {
  http,
  https,
  tlsPassthrough,
}

extension ListenerProtocolValueExtension on ListenerProtocol {
  String toValue() {
    switch (this) {
      case ListenerProtocol.http:
        return 'HTTP';
      case ListenerProtocol.https:
        return 'HTTPS';
      case ListenerProtocol.tlsPassthrough:
        return 'TLS_PASSTHROUGH';
    }
  }
}

extension ListenerProtocolFromString on String {
  ListenerProtocol toListenerProtocol() {
    switch (this) {
      case 'HTTP':
        return ListenerProtocol.http;
      case 'HTTPS':
        return ListenerProtocol.https;
      case 'TLS_PASSTHROUGH':
        return ListenerProtocol.tlsPassthrough;
    }
    throw Exception('$this is not known in enum ListenerProtocol');
  }
}

/// Summary information about a listener.
class ListenerSummary {
  /// The Amazon Resource Name (ARN) of the listener.
  final String? arn;

  /// The date and time that the listener was created, specified in ISO-8601
  /// format.
  final DateTime? createdAt;

  /// The ID of the listener.
  final String? id;

  /// The date and time that the listener was last updated, specified in ISO-8601
  /// format.
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
      protocol: (json['protocol'] as String?)?.toListenerProtocol(),
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
      if (protocol != null) 'protocol': protocol.toValue(),
    };
  }
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
      match: PathMatchType.fromJson(json['match'] as Map<String, dynamic>),
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
      state: (json['state'] as String?)?.toAuthPolicyState(),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final state = this.state;
    return {
      if (policy != null) 'policy': policy,
      if (state != null) 'state': state.toValue(),
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
          ?.whereNotNull()
          .map((e) => Target.fromJson(e as Map<String, dynamic>))
          .toList(),
      unsuccessful: (json['unsuccessful'] as List?)
          ?.whereNotNull()
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

/// Summary information about the listener rule.
class RuleSummary {
  /// The Amazon Resource Name (ARN) of the rule.
  final String? arn;

  /// The date and time that the listener rule was created, specified in ISO-8601
  /// format.
  final DateTime? createdAt;

  /// The ID of the rule.
  final String? id;

  /// Indicates whether this is the default listener rule.
  final bool? isDefault;

  /// The date and time that the listener rule was last updated, specified in
  /// ISO-8601 format.
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

/// Describes a rule update.
class RuleUpdate {
  /// The ID or Amazon Resource Name (ARN) of the rule.
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

/// Describes a rule update that failed.
class RuleUpdateFailure {
  /// The failure code.
  final String? failureCode;

  /// The failure message.
  final String? failureMessage;

  /// The ID or Amazon Resource Name (ARN) of the rule.
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

enum ServiceNetworkServiceAssociationStatus {
  createInProgress,
  active,
  deleteInProgress,
  createFailed,
  deleteFailed,
}

extension ServiceNetworkServiceAssociationStatusValueExtension
    on ServiceNetworkServiceAssociationStatus {
  String toValue() {
    switch (this) {
      case ServiceNetworkServiceAssociationStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case ServiceNetworkServiceAssociationStatus.active:
        return 'ACTIVE';
      case ServiceNetworkServiceAssociationStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case ServiceNetworkServiceAssociationStatus.createFailed:
        return 'CREATE_FAILED';
      case ServiceNetworkServiceAssociationStatus.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension ServiceNetworkServiceAssociationStatusFromString on String {
  ServiceNetworkServiceAssociationStatus
      toServiceNetworkServiceAssociationStatus() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return ServiceNetworkServiceAssociationStatus.createInProgress;
      case 'ACTIVE':
        return ServiceNetworkServiceAssociationStatus.active;
      case 'DELETE_IN_PROGRESS':
        return ServiceNetworkServiceAssociationStatus.deleteInProgress;
      case 'CREATE_FAILED':
        return ServiceNetworkServiceAssociationStatus.createFailed;
      case 'DELETE_FAILED':
        return ServiceNetworkServiceAssociationStatus.deleteFailed;
    }
    throw Exception(
        '$this is not known in enum ServiceNetworkServiceAssociationStatus');
  }
}

/// Summary information about the association between a service network and a
/// service.
class ServiceNetworkServiceAssociationSummary {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The date and time that the association was created, specified in ISO-8601
  /// format.
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

  /// The status. If the deletion fails, try to delete again.
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
          ?.toServiceNetworkServiceAssociationStatus(),
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
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Summary information about a service network.
class ServiceNetworkSummary {
  /// The Amazon Resource Name (ARN) of the service network.
  final String? arn;

  /// The date and time that the service network was created, specified in
  /// ISO-8601 format.
  final DateTime? createdAt;

  /// The ID of the service network.
  final String? id;

  /// The date and time that the service network was last updated, specified in
  /// ISO-8601 format.
  final DateTime? lastUpdatedAt;

  /// The name of the service network.
  final String? name;

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
    final numberOfAssociatedServices = this.numberOfAssociatedServices;
    final numberOfAssociatedVPCs = this.numberOfAssociatedVPCs;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (numberOfAssociatedServices != null)
        'numberOfAssociatedServices': numberOfAssociatedServices,
      if (numberOfAssociatedVPCs != null)
        'numberOfAssociatedVPCs': numberOfAssociatedVPCs,
    };
  }
}

enum ServiceNetworkVpcAssociationStatus {
  createInProgress,
  active,
  updateInProgress,
  deleteInProgress,
  createFailed,
  deleteFailed,
  updateFailed,
}

extension ServiceNetworkVpcAssociationStatusValueExtension
    on ServiceNetworkVpcAssociationStatus {
  String toValue() {
    switch (this) {
      case ServiceNetworkVpcAssociationStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case ServiceNetworkVpcAssociationStatus.active:
        return 'ACTIVE';
      case ServiceNetworkVpcAssociationStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case ServiceNetworkVpcAssociationStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case ServiceNetworkVpcAssociationStatus.createFailed:
        return 'CREATE_FAILED';
      case ServiceNetworkVpcAssociationStatus.deleteFailed:
        return 'DELETE_FAILED';
      case ServiceNetworkVpcAssociationStatus.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension ServiceNetworkVpcAssociationStatusFromString on String {
  ServiceNetworkVpcAssociationStatus toServiceNetworkVpcAssociationStatus() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return ServiceNetworkVpcAssociationStatus.createInProgress;
      case 'ACTIVE':
        return ServiceNetworkVpcAssociationStatus.active;
      case 'UPDATE_IN_PROGRESS':
        return ServiceNetworkVpcAssociationStatus.updateInProgress;
      case 'DELETE_IN_PROGRESS':
        return ServiceNetworkVpcAssociationStatus.deleteInProgress;
      case 'CREATE_FAILED':
        return ServiceNetworkVpcAssociationStatus.createFailed;
      case 'DELETE_FAILED':
        return ServiceNetworkVpcAssociationStatus.deleteFailed;
      case 'UPDATE_FAILED':
        return ServiceNetworkVpcAssociationStatus.updateFailed;
    }
    throw Exception(
        '$this is not known in enum ServiceNetworkVpcAssociationStatus');
  }
}

/// Summary information about an association between a service network and a
/// VPC.
class ServiceNetworkVpcAssociationSummary {
  /// The Amazon Resource Name (ARN) of the association.
  final String? arn;

  /// The date and time that the association was created, specified in ISO-8601
  /// format.
  final DateTime? createdAt;

  /// The account that created the association.
  final String? createdBy;

  /// The ID of the association.
  final String? id;

  /// The date and time that the association was last updated, specified in
  /// ISO-8601 format.
  final DateTime? lastUpdatedAt;

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
    this.id,
    this.lastUpdatedAt,
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
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      serviceNetworkArn: json['serviceNetworkArn'] as String?,
      serviceNetworkId: json['serviceNetworkId'] as String?,
      serviceNetworkName: json['serviceNetworkName'] as String?,
      status:
          (json['status'] as String?)?.toServiceNetworkVpcAssociationStatus(),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final serviceNetworkArn = this.serviceNetworkArn;
    final serviceNetworkId = this.serviceNetworkId;
    final serviceNetworkName = this.serviceNetworkName;
    final status = this.status;
    final vpcId = this.vpcId;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (id != null) 'id': id,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (serviceNetworkArn != null) 'serviceNetworkArn': serviceNetworkArn,
      if (serviceNetworkId != null) 'serviceNetworkId': serviceNetworkId,
      if (serviceNetworkName != null) 'serviceNetworkName': serviceNetworkName,
      if (status != null) 'status': status.toValue(),
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

enum ServiceStatus {
  active,
  createInProgress,
  deleteInProgress,
  createFailed,
  deleteFailed,
}

extension ServiceStatusValueExtension on ServiceStatus {
  String toValue() {
    switch (this) {
      case ServiceStatus.active:
        return 'ACTIVE';
      case ServiceStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case ServiceStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case ServiceStatus.createFailed:
        return 'CREATE_FAILED';
      case ServiceStatus.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension ServiceStatusFromString on String {
  ServiceStatus toServiceStatus() {
    switch (this) {
      case 'ACTIVE':
        return ServiceStatus.active;
      case 'CREATE_IN_PROGRESS':
        return ServiceStatus.createInProgress;
      case 'DELETE_IN_PROGRESS':
        return ServiceStatus.deleteInProgress;
      case 'CREATE_FAILED':
        return ServiceStatus.createFailed;
      case 'DELETE_FAILED':
        return ServiceStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum ServiceStatus');
  }
}

/// Summary information about a service.
class ServiceSummary {
  /// The Amazon Resource Name (ARN) of the service.
  final String? arn;

  /// The date and time that the service was created, specified in ISO-8601
  /// format.
  final DateTime? createdAt;

  /// The custom domain name of the service.
  final String? customDomainName;

  /// The DNS information.
  final DnsEntry? dnsEntry;

  /// The ID of the service.
  final String? id;

  /// The date and time that the service was last updated. The format is ISO-8601.
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
      status: (json['status'] as String?)?.toServiceStatus(),
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
      if (status != null) 'status': status.toValue(),
    };
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
      id: json['id'] as String,
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
      ipAddressType: (json['ipAddressType'] as String?)?.toIpAddressType(),
      lambdaEventStructureVersion:
          (json['lambdaEventStructureVersion'] as String?)
              ?.toLambdaEventStructureVersion(),
      port: json['port'] as int?,
      protocol: (json['protocol'] as String?)?.toTargetGroupProtocol(),
      protocolVersion:
          (json['protocolVersion'] as String?)?.toTargetGroupProtocolVersion(),
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
      if (ipAddressType != null) 'ipAddressType': ipAddressType.toValue(),
      if (lambdaEventStructureVersion != null)
        'lambdaEventStructureVersion': lambdaEventStructureVersion.toValue(),
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.toValue(),
      if (protocolVersion != null) 'protocolVersion': protocolVersion.toValue(),
      if (vpcIdentifier != null) 'vpcIdentifier': vpcIdentifier,
    };
  }
}

enum TargetGroupProtocol {
  http,
  https,
  tcp,
}

extension TargetGroupProtocolValueExtension on TargetGroupProtocol {
  String toValue() {
    switch (this) {
      case TargetGroupProtocol.http:
        return 'HTTP';
      case TargetGroupProtocol.https:
        return 'HTTPS';
      case TargetGroupProtocol.tcp:
        return 'TCP';
    }
  }
}

extension TargetGroupProtocolFromString on String {
  TargetGroupProtocol toTargetGroupProtocol() {
    switch (this) {
      case 'HTTP':
        return TargetGroupProtocol.http;
      case 'HTTPS':
        return TargetGroupProtocol.https;
      case 'TCP':
        return TargetGroupProtocol.tcp;
    }
    throw Exception('$this is not known in enum TargetGroupProtocol');
  }
}

enum TargetGroupProtocolVersion {
  http1,
  http2,
  grpc,
}

extension TargetGroupProtocolVersionValueExtension
    on TargetGroupProtocolVersion {
  String toValue() {
    switch (this) {
      case TargetGroupProtocolVersion.http1:
        return 'HTTP1';
      case TargetGroupProtocolVersion.http2:
        return 'HTTP2';
      case TargetGroupProtocolVersion.grpc:
        return 'GRPC';
    }
  }
}

extension TargetGroupProtocolVersionFromString on String {
  TargetGroupProtocolVersion toTargetGroupProtocolVersion() {
    switch (this) {
      case 'HTTP1':
        return TargetGroupProtocolVersion.http1;
      case 'HTTP2':
        return TargetGroupProtocolVersion.http2;
      case 'GRPC':
        return TargetGroupProtocolVersion.grpc;
    }
    throw Exception('$this is not known in enum TargetGroupProtocolVersion');
  }
}

enum TargetGroupStatus {
  createInProgress,
  active,
  deleteInProgress,
  createFailed,
  deleteFailed,
}

extension TargetGroupStatusValueExtension on TargetGroupStatus {
  String toValue() {
    switch (this) {
      case TargetGroupStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case TargetGroupStatus.active:
        return 'ACTIVE';
      case TargetGroupStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case TargetGroupStatus.createFailed:
        return 'CREATE_FAILED';
      case TargetGroupStatus.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension TargetGroupStatusFromString on String {
  TargetGroupStatus toTargetGroupStatus() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return TargetGroupStatus.createInProgress;
      case 'ACTIVE':
        return TargetGroupStatus.active;
      case 'DELETE_IN_PROGRESS':
        return TargetGroupStatus.deleteInProgress;
      case 'CREATE_FAILED':
        return TargetGroupStatus.createFailed;
      case 'DELETE_FAILED':
        return TargetGroupStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum TargetGroupStatus');
  }
}

/// Summary information about a target group.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/vpc-lattice/latest/ug/target-groups.html">Target
/// groups</a> in the <i>Amazon VPC Lattice User Guide</i>.
class TargetGroupSummary {
  /// The ARN (Amazon Resource Name) of the target group.
  final String? arn;

  /// The date and time that the target group was created, specified in ISO-8601
  /// format.
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

  /// The date and time that the target group was last updated, specified in
  /// ISO-8601 format.
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
      ipAddressType: (json['ipAddressType'] as String?)?.toIpAddressType(),
      lambdaEventStructureVersion:
          (json['lambdaEventStructureVersion'] as String?)
              ?.toLambdaEventStructureVersion(),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      port: json['port'] as int?,
      protocol: (json['protocol'] as String?)?.toTargetGroupProtocol(),
      serviceArns: (json['serviceArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.toTargetGroupStatus(),
      type: (json['type'] as String?)?.toTargetGroupType(),
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
      if (ipAddressType != null) 'ipAddressType': ipAddressType.toValue(),
      if (lambdaEventStructureVersion != null)
        'lambdaEventStructureVersion': lambdaEventStructureVersion.toValue(),
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.toValue(),
      if (serviceArns != null) 'serviceArns': serviceArns,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
      if (vpcIdentifier != null) 'vpcIdentifier': vpcIdentifier,
    };
  }
}

enum TargetGroupType {
  ip,
  lambda,
  instance,
  alb,
}

extension TargetGroupTypeValueExtension on TargetGroupType {
  String toValue() {
    switch (this) {
      case TargetGroupType.ip:
        return 'IP';
      case TargetGroupType.lambda:
        return 'LAMBDA';
      case TargetGroupType.instance:
        return 'INSTANCE';
      case TargetGroupType.alb:
        return 'ALB';
    }
  }
}

extension TargetGroupTypeFromString on String {
  TargetGroupType toTargetGroupType() {
    switch (this) {
      case 'IP':
        return TargetGroupType.ip;
      case 'LAMBDA':
        return TargetGroupType.lambda;
      case 'INSTANCE':
        return TargetGroupType.instance;
      case 'ALB':
        return TargetGroupType.alb;
    }
    throw Exception('$this is not known in enum TargetGroupType');
  }
}

enum TargetStatus {
  draining,
  unavailable,
  healthy,
  unhealthy,
  initial,
  unused,
}

extension TargetStatusValueExtension on TargetStatus {
  String toValue() {
    switch (this) {
      case TargetStatus.draining:
        return 'DRAINING';
      case TargetStatus.unavailable:
        return 'UNAVAILABLE';
      case TargetStatus.healthy:
        return 'HEALTHY';
      case TargetStatus.unhealthy:
        return 'UNHEALTHY';
      case TargetStatus.initial:
        return 'INITIAL';
      case TargetStatus.unused:
        return 'UNUSED';
    }
  }
}

extension TargetStatusFromString on String {
  TargetStatus toTargetStatus() {
    switch (this) {
      case 'DRAINING':
        return TargetStatus.draining;
      case 'UNAVAILABLE':
        return TargetStatus.unavailable;
      case 'HEALTHY':
        return TargetStatus.healthy;
      case 'UNHEALTHY':
        return TargetStatus.unhealthy;
      case 'INITIAL':
        return TargetStatus.initial;
      case 'UNUSED':
        return TargetStatus.unused;
    }
    throw Exception('$this is not known in enum TargetStatus');
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
  /// default draining time is 5 minutes.
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
      status: (json['status'] as String?)?.toTargetStatus(),
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
      if (status != null) 'status': status.toValue(),
    };
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
      arn: json['arn'] as String,
      destinationArn: json['destinationArn'] as String,
      id: json['id'] as String,
      resourceArn: json['resourceArn'] as String,
      resourceId: json['resourceId'] as String,
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
      protocol: (json['protocol'] as String?)?.toListenerProtocol(),
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
      if (protocol != null) 'protocol': protocol.toValue(),
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (serviceId != null) 'serviceId': serviceId,
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
      authType: (json['authType'] as String?)?.toAuthType(),
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
      if (authType != null) 'authType': authType.toValue(),
      if (id != null) 'id': id,
      if (name != null) 'name': name,
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status:
          (json['status'] as String?)?.toServiceNetworkVpcAssociationStatus(),
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
      if (status != null) 'status': status.toValue(),
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
      authType: (json['authType'] as String?)?.toAuthType(),
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
      if (authType != null) 'authType': authType.toValue(),
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
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
      status: (json['status'] as String?)?.toTargetGroupStatus(),
      type: (json['type'] as String?)?.toTargetGroupType(),
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
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Describes the weight of a target group.
class WeightedTargetGroup {
  /// The ID or Amazon Resource Name (ARN) of the target group.
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
      targetGroupIdentifier: json['targetGroupIdentifier'] as String,
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
