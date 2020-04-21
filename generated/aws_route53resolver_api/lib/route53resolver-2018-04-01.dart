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
        rfc822fromJson,
        rfc822toJson,
        iso8601fromJson,
        iso8601toJson,
        unixFromJson,
        unixToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'route53resolver-2018-04-01.g.dart';

/// Here's how you set up to query an Amazon Route 53 private hosted zone from
/// your network:
/// <ol>
/// <li>
/// Connect your network to a VPC using AWS Direct Connect or a VPN.
/// </li>
/// <li>
/// Run the following AWS CLI command to create a Resolver endpoint:
///
/// <code>create-resolver-endpoint --name [endpoint_name] --direction INBOUND
/// --creator-request-id [unique_string] --security-group-ids
/// [security_group_with_inbound_rules] --ip-addresses SubnetId=[subnet_id]
/// SubnetId=[subnet_id_in_different_AZ]</code>
///
/// Note the resolver endpoint ID that appears in the response. You'll use it in
/// step 3.
/// </li>
/// <li>
/// Get the IP addresses for the Resolver endpoints:
///
/// <code>get-resolver-endpoint --resolver-endpoint-id
/// [resolver_endpoint_id]</code>
/// </li>
/// <li>
/// In your network configuration, define the IP addresses that you got in step
/// 3 as DNS servers.
///
/// You can now query instance names in your VPCs and the names of records in
/// your private hosted zone.
/// </li> </ol>
/// You can also perform the following operations using the AWS CLI:
///
/// <ul>
/// <li>
/// <code>list-resolver-endpoints</code>: List all endpoints. The syntax
/// includes options for pagination and filtering.
/// </li>
/// <li>
/// <code>update-resolver-endpoints</code>: Add IP addresses to an endpoint or
/// remove IP addresses from an endpoint.
/// </li>
/// </ul>
/// To delete an endpoint, use the following AWS CLI command:
///
/// <code>delete-resolver-endpoint --resolver-endpoint-id
/// [resolver_endpoint_id]</code>
class Route53Resolver {
  final _s.JsonProtocol _protocol;
  Route53Resolver({
    @_s.required String region,
    @_s.required _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'route53resolver',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds IP addresses to an inbound or an outbound resolver endpoint. If you
  /// want to adding more than one IP address, submit one
  /// <code>AssociateResolverEndpointIpAddress</code> request for each IP
  /// address.
  ///
  /// To remove an IP address from an endpoint, see
  /// <a>DisassociateResolverEndpointIpAddress</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [InternalServiceErrorException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [ipAddress] :
  /// Either the IPv4 address that you want to add to a resolver endpoint or a
  /// subnet ID. If you specify a subnet ID, Resolver chooses an IP address for
  /// you from the available IPs in the specified subnet.
  ///
  /// Parameter [resolverEndpointId] :
  /// The ID of the resolver endpoint that you want to associate IP addresses
  /// with.
  Future<AssociateResolverEndpointIpAddressResponse>
      associateResolverEndpointIpAddress({
    @_s.required IpAddressUpdate ipAddress,
    @_s.required String resolverEndpointId,
  }) async {
    ArgumentError.checkNotNull(ipAddress, 'ipAddress');
    ArgumentError.checkNotNull(resolverEndpointId, 'resolverEndpointId');
    _s.validateStringLength(
      'resolverEndpointId',
      resolverEndpointId,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.AssociateResolverEndpointIpAddress'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IpAddress': ipAddress,
        'ResolverEndpointId': resolverEndpointId,
      },
    );

    return AssociateResolverEndpointIpAddressResponse.fromJson(
        jsonResponse.body);
  }

  /// Associates a resolver rule with a VPC. When you associate a rule with a
  /// VPC, Resolver forwards all DNS queries for the domain name that is
  /// specified in the rule and that originate in the VPC. The queries are
  /// forwarded to the IP addresses for the DNS resolvers that are specified in
  /// the rule. For more information about rules, see <a>CreateResolverRule</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceUnavailableException].
  /// May throw [ResourceExistsException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverRuleId] :
  /// The ID of the resolver rule that you want to associate with the VPC. To
  /// list the existing resolver rules, use <a>ListResolverRules</a>.
  ///
  /// Parameter [vPCId] :
  /// The ID of the VPC that you want to associate the resolver rule with.
  ///
  /// Parameter [name] :
  /// A name for the association that you're creating between a resolver rule
  /// and a VPC.
  Future<AssociateResolverRuleResponse> associateResolverRule({
    @_s.required String resolverRuleId,
    @_s.required String vPCId,
    String name,
  }) async {
    ArgumentError.checkNotNull(resolverRuleId, 'resolverRuleId');
    _s.validateStringLength(
      'resolverRuleId',
      resolverRuleId,
      1,
      64,
    );
    ArgumentError.checkNotNull(vPCId, 'vPCId');
    _s.validateStringLength(
      'vPCId',
      vPCId,
      1,
      64,
    );
    if (name != null) {
      _s.validateStringLength(
        'name',
        name,
        0,
        64,
      );
    }
    if (name != null) {
      _s.validateStringPattern(
        'name',
        name,
        r'''(?!^[0-9]+$)([a-zA-Z0-9-_' ']+)''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.AssociateResolverRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResolverRuleId': resolverRuleId,
        'VPCId': vPCId,
        'Name': name,
      },
    );

    return AssociateResolverRuleResponse.fromJson(jsonResponse.body);
  }

  /// Creates a resolver endpoint. There are two types of resolver endpoints,
  /// inbound and outbound:
  ///
  /// <ul>
  /// <li>
  /// An <i>inbound resolver endpoint</i> forwards DNS queries to the DNS
  /// service for a VPC from your network or another VPC.
  /// </li>
  /// <li>
  /// An <i>outbound resolver endpoint</i> forwards DNS queries from the DNS
  /// service for a VPC to your network or another VPC.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// requests to be retried without the risk of executing the operation twice.
  /// <code>CreatorRequestId</code> can be any unique string, for example, a
  /// date/time stamp.
  ///
  /// Parameter [direction] :
  /// Specify the applicable value:
  ///
  /// <ul>
  /// <li>
  /// <code>INBOUND</code>: Resolver forwards DNS queries to the DNS service for
  /// a VPC from your network or another VPC
  /// </li>
  /// <li>
  /// <code>OUTBOUND</code>: Resolver forwards DNS queries from the DNS service
  /// for a VPC to your network or another VPC
  /// </li>
  /// </ul>
  ///
  /// Parameter [ipAddresses] :
  /// The subnets and IP addresses in your VPC that you want DNS queries to pass
  /// through on the way from your VPCs to your network (for outbound endpoints)
  /// or on the way from your network to your VPCs (for inbound resolver
  /// endpoints).
  ///
  /// Parameter [securityGroupIds] :
  /// The ID of one or more security groups that you want to use to control
  /// access to this VPC. The security group that you specify must include one
  /// or more inbound rules (for inbound resolver endpoints) or outbound rules
  /// (for outbound resolver endpoints).
  ///
  /// Parameter [name] :
  /// A friendly name that lets you easily find a configuration in the Resolver
  /// dashboard in the Route 53 console.
  ///
  /// Parameter [tags] :
  /// A list of the tag keys and values that you want to associate with the
  /// endpoint.
  Future<CreateResolverEndpointResponse> createResolverEndpoint({
    @_s.required String creatorRequestId,
    @_s.required ResolverEndpointDirection direction,
    @_s.required List<IpAddressRequest> ipAddresses,
    @_s.required List<String> securityGroupIds,
    String name,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(creatorRequestId, 'creatorRequestId');
    _s.validateStringLength(
      'creatorRequestId',
      creatorRequestId,
      1,
      255,
    );
    ArgumentError.checkNotNull(direction, 'direction');
    ArgumentError.checkNotNull(ipAddresses, 'ipAddresses');
    ArgumentError.checkNotNull(securityGroupIds, 'securityGroupIds');
    if (name != null) {
      _s.validateStringLength(
        'name',
        name,
        0,
        64,
      );
    }
    if (name != null) {
      _s.validateStringPattern(
        'name',
        name,
        r'''(?!^[0-9]+$)([a-zA-Z0-9-_' ']+)''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.CreateResolverEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreatorRequestId': creatorRequestId,
        'Direction': direction,
        'IpAddresses': ipAddresses,
        'SecurityGroupIds': securityGroupIds,
        'Name': name,
        'Tags': tags,
      },
    );

    return CreateResolverEndpointResponse.fromJson(jsonResponse.body);
  }

  /// For DNS queries that originate in your VPCs, specifies which resolver
  /// endpoint the queries pass through, one domain name that you want to
  /// forward to your network, and the IP addresses of the DNS resolvers in your
  /// network.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceUnavailableException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// requests to be retried without the risk of executing the operation twice.
  /// <code>CreatorRequestId</code> can be any unique string, for example, a
  /// date/time stamp.
  ///
  /// Parameter [domainName] :
  /// DNS queries for this domain name are forwarded to the IP addresses that
  /// you specify in <code>TargetIps</code>. If a query matches multiple
  /// resolver rules (example.com and www.example.com), outbound DNS queries are
  /// routed using the resolver rule that contains the most specific domain name
  /// (www.example.com).
  ///
  /// Parameter [ruleType] :
  /// Specify <code>FORWARD</code>. Other resolver rule types aren't supported.
  ///
  /// Parameter [name] :
  /// A friendly name that lets you easily find a rule in the Resolver dashboard
  /// in the Route 53 console.
  ///
  /// Parameter [resolverEndpointId] :
  /// The ID of the outbound resolver endpoint that you want to use to route DNS
  /// queries to the IP addresses that you specify in <code>TargetIps</code>.
  ///
  /// Parameter [tags] :
  /// A list of the tag keys and values that you want to associate with the
  /// endpoint.
  ///
  /// Parameter [targetIps] :
  /// The IPs that you want Resolver to forward DNS queries to. You can specify
  /// only IPv4 addresses. Separate IP addresses with a comma.
  Future<CreateResolverRuleResponse> createResolverRule({
    @_s.required String creatorRequestId,
    @_s.required String domainName,
    @_s.required RuleTypeOption ruleType,
    String name,
    String resolverEndpointId,
    List<Tag> tags,
    List<TargetAddress> targetIps,
  }) async {
    ArgumentError.checkNotNull(creatorRequestId, 'creatorRequestId');
    _s.validateStringLength(
      'creatorRequestId',
      creatorRequestId,
      1,
      255,
    );
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      256,
    );
    ArgumentError.checkNotNull(ruleType, 'ruleType');
    if (name != null) {
      _s.validateStringLength(
        'name',
        name,
        0,
        64,
      );
    }
    if (name != null) {
      _s.validateStringPattern(
        'name',
        name,
        r'''(?!^[0-9]+$)([a-zA-Z0-9-_' ']+)''',
      );
    }
    if (resolverEndpointId != null) {
      _s.validateStringLength(
        'resolverEndpointId',
        resolverEndpointId,
        1,
        64,
      );
    }
    if (targetIps != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.CreateResolverRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreatorRequestId': creatorRequestId,
        'DomainName': domainName,
        'RuleType': ruleType,
        'Name': name,
        'ResolverEndpointId': resolverEndpointId,
        'Tags': tags,
        'TargetIps': targetIps,
      },
    );

    return CreateResolverRuleResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a resolver endpoint. The effect of deleting a resolver endpoint
  /// depends on whether it's an inbound or an outbound resolver endpoint:
  ///
  /// <ul>
  /// <li>
  /// <b>Inbound</b>: DNS queries from your network or another VPC are no longer
  /// routed to the DNS service for the specified VPC.
  /// </li>
  /// <li>
  /// <b>Outbound</b>: DNS queries from a VPC are no longer routed to your
  /// network or to another VPC.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverEndpointId] :
  /// The ID of the resolver endpoint that you want to delete.
  Future<DeleteResolverEndpointResponse> deleteResolverEndpoint({
    @_s.required String resolverEndpointId,
  }) async {
    ArgumentError.checkNotNull(resolverEndpointId, 'resolverEndpointId');
    _s.validateStringLength(
      'resolverEndpointId',
      resolverEndpointId,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.DeleteResolverEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResolverEndpointId': resolverEndpointId,
      },
    );

    return DeleteResolverEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a resolver rule. Before you can delete a resolver rule, you must
  /// disassociate it from all the VPCs that you associated the resolver rule
  /// with. For more infomation, see <a>DisassociateResolverRule</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverRuleId] :
  /// The ID of the resolver rule that you want to delete.
  Future<DeleteResolverRuleResponse> deleteResolverRule({
    @_s.required String resolverRuleId,
  }) async {
    ArgumentError.checkNotNull(resolverRuleId, 'resolverRuleId');
    _s.validateStringLength(
      'resolverRuleId',
      resolverRuleId,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.DeleteResolverRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResolverRuleId': resolverRuleId,
      },
    );

    return DeleteResolverRuleResponse.fromJson(jsonResponse.body);
  }

  /// Removes IP addresses from an inbound or an outbound resolver endpoint. If
  /// you want to remove more than one IP address, submit one
  /// <code>DisassociateResolverEndpointIpAddress</code> request for each IP
  /// address.
  ///
  /// To add an IP address to an endpoint, see
  /// <a>AssociateResolverEndpointIpAddress</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [ipAddress] :
  /// The IPv4 address that you want to remove from a resolver endpoint.
  ///
  /// Parameter [resolverEndpointId] :
  /// The ID of the resolver endpoint that you want to disassociate an IP
  /// address from.
  Future<DisassociateResolverEndpointIpAddressResponse>
      disassociateResolverEndpointIpAddress({
    @_s.required IpAddressUpdate ipAddress,
    @_s.required String resolverEndpointId,
  }) async {
    ArgumentError.checkNotNull(ipAddress, 'ipAddress');
    ArgumentError.checkNotNull(resolverEndpointId, 'resolverEndpointId');
    _s.validateStringLength(
      'resolverEndpointId',
      resolverEndpointId,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.DisassociateResolverEndpointIpAddress'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IpAddress': ipAddress,
        'ResolverEndpointId': resolverEndpointId,
      },
    );

    return DisassociateResolverEndpointIpAddressResponse.fromJson(
        jsonResponse.body);
  }

  /// Removes the association between a specified resolver rule and a specified
  /// VPC.
  /// <important>
  /// If you disassociate a resolver rule from a VPC, Resolver stops forwarding
  /// DNS queries for the domain name that you specified in the resolver rule.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverRuleId] :
  /// The ID of the resolver rule that you want to disassociate from the
  /// specified VPC.
  ///
  /// Parameter [vPCId] :
  /// The ID of the VPC that you want to disassociate the resolver rule from.
  Future<DisassociateResolverRuleResponse> disassociateResolverRule({
    @_s.required String resolverRuleId,
    @_s.required String vPCId,
  }) async {
    ArgumentError.checkNotNull(resolverRuleId, 'resolverRuleId');
    _s.validateStringLength(
      'resolverRuleId',
      resolverRuleId,
      1,
      64,
    );
    ArgumentError.checkNotNull(vPCId, 'vPCId');
    _s.validateStringLength(
      'vPCId',
      vPCId,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.DisassociateResolverRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResolverRuleId': resolverRuleId,
        'VPCId': vPCId,
      },
    );

    return DisassociateResolverRuleResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a specified resolver endpoint, such as whether it's
  /// an inbound or an outbound resolver endpoint, and the current status of the
  /// endpoint.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverEndpointId] :
  /// The ID of the resolver endpoint that you want to get information about.
  Future<GetResolverEndpointResponse> getResolverEndpoint({
    @_s.required String resolverEndpointId,
  }) async {
    ArgumentError.checkNotNull(resolverEndpointId, 'resolverEndpointId');
    _s.validateStringLength(
      'resolverEndpointId',
      resolverEndpointId,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.GetResolverEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResolverEndpointId': resolverEndpointId,
      },
    );

    return GetResolverEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a specified resolver rule, such as the domain name
  /// that the rule forwards DNS queries for and the ID of the outbound resolver
  /// endpoint that the rule is associated with.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverRuleId] :
  /// The ID of the resolver rule that you want to get information about.
  Future<GetResolverRuleResponse> getResolverRule({
    @_s.required String resolverRuleId,
  }) async {
    ArgumentError.checkNotNull(resolverRuleId, 'resolverRuleId');
    _s.validateStringLength(
      'resolverRuleId',
      resolverRuleId,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.GetResolverRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResolverRuleId': resolverRuleId,
      },
    );

    return GetResolverRuleResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about an association between a specified resolver rule
  /// and a VPC. You associate a resolver rule and a VPC using
  /// <a>AssociateResolverRule</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverRuleAssociationId] :
  /// The ID of the resolver rule association that you want to get information
  /// about.
  Future<GetResolverRuleAssociationResponse> getResolverRuleAssociation({
    @_s.required String resolverRuleAssociationId,
  }) async {
    ArgumentError.checkNotNull(
        resolverRuleAssociationId, 'resolverRuleAssociationId');
    _s.validateStringLength(
      'resolverRuleAssociationId',
      resolverRuleAssociationId,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.GetResolverRuleAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResolverRuleAssociationId': resolverRuleAssociationId,
      },
    );

    return GetResolverRuleAssociationResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a resolver rule policy. A resolver rule policy
  /// specifies the Resolver operations and resources that you want to allow
  /// another AWS account to be able to use.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [UnknownResourceException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [arn] :
  /// The ID of the resolver rule policy that you want to get information about.
  Future<GetResolverRulePolicyResponse> getResolverRulePolicy({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.GetResolverRulePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Arn': arn,
      },
    );

    return GetResolverRulePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Gets the IP addresses for a specified resolver endpoint.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverEndpointId] :
  /// The ID of the resolver endpoint that you want to get IP addresses for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of IP addresses that you want to return in the response
  /// to a <code>ListResolverEndpointIpAddresses</code> request. If you don't
  /// specify a value for <code>MaxResults</code>, Resolver returns up to 100 IP
  /// addresses.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListResolverEndpointIpAddresses</code> request, omit
  /// this value.
  ///
  /// If the specified resolver endpoint has more than <code>MaxResults</code>
  /// IP addresses, you can submit another
  /// <code>ListResolverEndpointIpAddresses</code> request to get the next group
  /// of IP addresses. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  Future<ListResolverEndpointIpAddressesResponse>
      listResolverEndpointIpAddresses({
    @_s.required String resolverEndpointId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resolverEndpointId, 'resolverEndpointId');
    _s.validateStringLength(
      'resolverEndpointId',
      resolverEndpointId,
      1,
      64,
    );
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.ListResolverEndpointIpAddresses'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResolverEndpointId': resolverEndpointId,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListResolverEndpointIpAddressesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the resolver endpoints that were created using the current AWS
  /// account.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// An optional specification to return a subset of resolver endpoints, such
  /// as all inbound resolver endpoints.
  /// <note>
  /// If you submit a second or subsequent <code>ListResolverEndpoints</code>
  /// request and specify the <code>NextToken</code> parameter, you must use the
  /// same values for <code>Filters</code>, if any, as in the previous request.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of resolver endpoints that you want to return in the
  /// response to a <code>ListResolverEndpoints</code> request. If you don't
  /// specify a value for <code>MaxResults</code>, Resolver returns up to 100
  /// resolver endpoints.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListResolverEndpoints</code> request, omit this value.
  ///
  /// If you have more than <code>MaxResults</code> resolver endpoints, you can
  /// submit another <code>ListResolverEndpoints</code> request to get the next
  /// group of resolver endpoints. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  Future<ListResolverEndpointsResponse> listResolverEndpoints({
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.ListResolverEndpoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListResolverEndpointsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the associations that were created between resolver rules and VPCs
  /// using the current AWS account.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// An optional specification to return a subset of resolver rules, such as
  /// resolver rules that are associated with the same VPC ID.
  /// <note>
  /// If you submit a second or subsequent
  /// <code>ListResolverRuleAssociations</code> request and specify the
  /// <code>NextToken</code> parameter, you must use the same values for
  /// <code>Filters</code>, if any, as in the previous request.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of rule associations that you want to return in the
  /// response to a <code>ListResolverRuleAssociations</code> request. If you
  /// don't specify a value for <code>MaxResults</code>, Resolver returns up to
  /// 100 rule associations.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListResolverRuleAssociation</code> request, omit this
  /// value.
  ///
  /// If you have more than <code>MaxResults</code> rule associations, you can
  /// submit another <code>ListResolverRuleAssociation</code> request to get the
  /// next group of rule associations. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  Future<ListResolverRuleAssociationsResponse> listResolverRuleAssociations({
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.ListResolverRuleAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListResolverRuleAssociationsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the resolver rules that were created using the current AWS account.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// An optional specification to return a subset of resolver rules, such as
  /// all resolver rules that are associated with the same resolver endpoint.
  /// <note>
  /// If you submit a second or subsequent <code>ListResolverRules</code>
  /// request and specify the <code>NextToken</code> parameter, you must use the
  /// same values for <code>Filters</code>, if any, as in the previous request.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of resolver rules that you want to return in the
  /// response to a <code>ListResolverRules</code> request. If you don't specify
  /// a value for <code>MaxResults</code>, Resolver returns up to 100 resolver
  /// rules.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListResolverRules</code> request, omit this value.
  ///
  /// If you have more than <code>MaxResults</code> resolver rules, you can
  /// submit another <code>ListResolverRules</code> request to get the next
  /// group of resolver rules. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  Future<ListResolverRulesResponse> listResolverRules({
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.ListResolverRules'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListResolverRulesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags that you associated with the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource that you want to list tags
  /// for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tags that you want to return in the response to a
  /// <code>ListTagsForResource</code> request. If you don't specify a value for
  /// <code>MaxResults</code>, Resolver returns up to 100 tags.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListTagsForResource</code> request, omit this value.
  ///
  /// If you have more than <code>MaxResults</code> tags, you can submit another
  /// <code>ListTagsForResource</code> request to get the next group of tags for
  /// the resource. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      255,
    );
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Specifies the Resolver operations and resources that you want to allow
  /// another AWS account to be able to use.
  ///
  /// May throw [InvalidPolicyDocument].
  /// May throw [InvalidParameterException].
  /// May throw [UnknownResourceException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the account that you want to grant
  /// permissions to.
  ///
  /// Parameter [resolverRulePolicy] :
  /// An AWS Identity and Access Management policy statement that lists the
  /// permissions that you want to grant to another AWS account.
  Future<PutResolverRulePolicyResponse> putResolverRulePolicy({
    @_s.required String arn,
    @_s.required String resolverRulePolicy,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      255,
    );
    ArgumentError.checkNotNull(resolverRulePolicy, 'resolverRulePolicy');
    _s.validateStringLength(
      'resolverRulePolicy',
      resolverRulePolicy,
      0,
      5000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.PutResolverRulePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Arn': arn,
        'ResolverRulePolicy': resolverRulePolicy,
      },
    );

    return PutResolverRulePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Adds one or more tags to a specified resource.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidTagException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource that you want to add tags
  /// to. To get the ARN for a resource, use the applicable <code>Get</code> or
  /// <code>List</code> command:
  ///
  /// <ul>
  /// <li>
  /// <a>GetResolverEndpoint</a>
  /// </li>
  /// <li>
  /// <a>GetResolverRule</a>
  /// </li>
  /// <li>
  /// <a>GetResolverRuleAssociation</a>
  /// </li>
  /// <li>
  /// <a>ListResolverEndpoints</a>
  /// </li>
  /// <li>
  /// <a>ListResolverRuleAssociations</a>
  /// </li>
  /// <li>
  /// <a>ListResolverRules</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// The tags that you want to add to the specified resource.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      255,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Removes one or more tags from a specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource that you want to remove
  /// tags from. To get the ARN for a resource, use the applicable
  /// <code>Get</code> or <code>List</code> command:
  ///
  /// <ul>
  /// <li>
  /// <a>GetResolverEndpoint</a>
  /// </li>
  /// <li>
  /// <a>GetResolverRule</a>
  /// </li>
  /// <li>
  /// <a>GetResolverRuleAssociation</a>
  /// </li>
  /// <li>
  /// <a>ListResolverEndpoints</a>
  /// </li>
  /// <li>
  /// <a>ListResolverRuleAssociations</a>
  /// </li>
  /// <li>
  /// <a>ListResolverRules</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [tagKeys] :
  /// The tags that you want to remove to the specified resource.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      255,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Updates the name of an inbound or an outbound resolver endpoint.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverEndpointId] :
  /// The ID of the resolver endpoint that you want to update.
  ///
  /// Parameter [name] :
  /// The name of the resolver endpoint that you want to update.
  Future<UpdateResolverEndpointResponse> updateResolverEndpoint({
    @_s.required String resolverEndpointId,
    String name,
  }) async {
    ArgumentError.checkNotNull(resolverEndpointId, 'resolverEndpointId');
    _s.validateStringLength(
      'resolverEndpointId',
      resolverEndpointId,
      1,
      64,
    );
    if (name != null) {
      _s.validateStringLength(
        'name',
        name,
        0,
        64,
      );
    }
    if (name != null) {
      _s.validateStringPattern(
        'name',
        name,
        r'''(?!^[0-9]+$)([a-zA-Z0-9-_' ']+)''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.UpdateResolverEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResolverEndpointId': resolverEndpointId,
        'Name': name,
      },
    );

    return UpdateResolverEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Updates settings for a specified resolver rule.
  /// <code>ResolverRuleId</code> is required, and all other parameters are
  /// optional. If you don't specify a parameter, it retains its current value.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [config] :
  /// The new settings for the resolver rule.
  ///
  /// Parameter [resolverRuleId] :
  /// The ID of the resolver rule that you want to update.
  Future<UpdateResolverRuleResponse> updateResolverRule({
    @_s.required ResolverRuleConfig config,
    @_s.required String resolverRuleId,
  }) async {
    ArgumentError.checkNotNull(config, 'config');
    ArgumentError.checkNotNull(resolverRuleId, 'resolverRuleId');
    _s.validateStringLength(
      'resolverRuleId',
      resolverRuleId,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.UpdateResolverRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Config': config,
        'ResolverRuleId': resolverRuleId,
      },
    );

    return UpdateResolverRuleResponse.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateResolverEndpointIpAddressResponse {
  /// The response to an <code>AssociateResolverEndpointIpAddress</code> request.
  @_s.JsonKey(name: 'ResolverEndpoint')
  final ResolverEndpoint resolverEndpoint;

  AssociateResolverEndpointIpAddressResponse({
    this.resolverEndpoint,
  });
  factory AssociateResolverEndpointIpAddressResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateResolverEndpointIpAddressResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateResolverRuleResponse {
  /// Information about the <code>AssociateResolverRule</code> request, including
  /// the status of the request.
  @_s.JsonKey(name: 'ResolverRuleAssociation')
  final ResolverRuleAssociation resolverRuleAssociation;

  AssociateResolverRuleResponse({
    this.resolverRuleAssociation,
  });
  factory AssociateResolverRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateResolverRuleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateResolverEndpointResponse {
  /// Information about the <code>CreateResolverEndpoint</code> request, including
  /// the status of the request.
  @_s.JsonKey(name: 'ResolverEndpoint')
  final ResolverEndpoint resolverEndpoint;

  CreateResolverEndpointResponse({
    this.resolverEndpoint,
  });
  factory CreateResolverEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateResolverEndpointResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateResolverRuleResponse {
  /// Information about the <code>CreateResolverRule</code> request, including the
  /// status of the request.
  @_s.JsonKey(name: 'ResolverRule')
  final ResolverRule resolverRule;

  CreateResolverRuleResponse({
    this.resolverRule,
  });
  factory CreateResolverRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateResolverRuleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteResolverEndpointResponse {
  /// Information about the <code>DeleteResolverEndpoint</code> request, including
  /// the status of the request.
  @_s.JsonKey(name: 'ResolverEndpoint')
  final ResolverEndpoint resolverEndpoint;

  DeleteResolverEndpointResponse({
    this.resolverEndpoint,
  });
  factory DeleteResolverEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteResolverEndpointResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteResolverRuleResponse {
  /// Information about the <code>DeleteResolverRule</code> request, including the
  /// status of the request.
  @_s.JsonKey(name: 'ResolverRule')
  final ResolverRule resolverRule;

  DeleteResolverRuleResponse({
    this.resolverRule,
  });
  factory DeleteResolverRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteResolverRuleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateResolverEndpointIpAddressResponse {
  /// The response to an <code>DisassociateResolverEndpointIpAddress</code>
  /// request.
  @_s.JsonKey(name: 'ResolverEndpoint')
  final ResolverEndpoint resolverEndpoint;

  DisassociateResolverEndpointIpAddressResponse({
    this.resolverEndpoint,
  });
  factory DisassociateResolverEndpointIpAddressResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateResolverEndpointIpAddressResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateResolverRuleResponse {
  /// Information about the <code>DisassociateResolverRule</code> request,
  /// including the status of the request.
  @_s.JsonKey(name: 'ResolverRuleAssociation')
  final ResolverRuleAssociation resolverRuleAssociation;

  DisassociateResolverRuleResponse({
    this.resolverRuleAssociation,
  });
  factory DisassociateResolverRuleResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateResolverRuleResponseFromJson(json);
}

/// For <code>List</code> operations, an optional specification to return a
/// subset of objects, such as resolver endpoints or resolver rules.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// When you're using a <code>List</code> operation and you want the operation
  /// to return a subset of objects, such as resolver endpoints or resolver rules,
  /// the name of the parameter that you want to use to filter objects. For
  /// example, to list only inbound resolver endpoints, specify
  /// <code>Direction</code> for the value of <code>Name</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// When you're using a <code>List</code> operation and you want the operation
  /// to return a subset of objects, such as resolver endpoints or resolver rules,
  /// the value of the parameter that you want to use to filter objects. For
  /// example, to list only inbound resolver endpoints, specify
  /// <code>INBOUND</code> for the value of <code>Values</code>.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  Filter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResolverEndpointResponse {
  /// Information about the resolver endpoint that you specified in a
  /// <code>GetResolverEndpoint</code> request.
  @_s.JsonKey(name: 'ResolverEndpoint')
  final ResolverEndpoint resolverEndpoint;

  GetResolverEndpointResponse({
    this.resolverEndpoint,
  });
  factory GetResolverEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResolverEndpointResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResolverRuleAssociationResponse {
  /// Information about the resolver rule association that you specified in a
  /// <code>GetResolverRuleAssociation</code> request.
  @_s.JsonKey(name: 'ResolverRuleAssociation')
  final ResolverRuleAssociation resolverRuleAssociation;

  GetResolverRuleAssociationResponse({
    this.resolverRuleAssociation,
  });
  factory GetResolverRuleAssociationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetResolverRuleAssociationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResolverRulePolicyResponse {
  /// Information about the resolver rule policy that you specified in a
  /// <code>GetResolverRulePolicy</code> request.
  @_s.JsonKey(name: 'ResolverRulePolicy')
  final String resolverRulePolicy;

  GetResolverRulePolicyResponse({
    this.resolverRulePolicy,
  });
  factory GetResolverRulePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResolverRulePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResolverRuleResponse {
  /// Information about the resolver rule that you specified in a
  /// <code>GetResolverRule</code> request.
  @_s.JsonKey(name: 'ResolverRule')
  final ResolverRule resolverRule;

  GetResolverRuleResponse({
    this.resolverRule,
  });
  factory GetResolverRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResolverRuleResponseFromJson(json);
}

/// In an <a>CreateResolverEndpoint</a> request, a subnet and IP address that
/// you want to use for DNS queries.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class IpAddressRequest {
  /// The subnet that contains the IP address.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  /// The IP address that you want to use for DNS queries.
  @_s.JsonKey(name: 'Ip')
  final String ip;

  IpAddressRequest({
    @_s.required this.subnetId,
    this.ip,
  });
  Map<String, dynamic> toJson() => _$IpAddressRequestToJson(this);
}

/// In the response to a <a>GetResolverEndpoint</a> request, information about
/// the IP addresses that the resolver endpoint uses for DNS queries.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IpAddressResponse {
  /// The date and time that the IP address was created, in Unix time format and
  /// Coordinated Universal Time (UTC).
  @_s.JsonKey(name: 'CreationTime')
  final String creationTime;

  /// One IP address that the resolver endpoint uses for DNS queries.
  @_s.JsonKey(name: 'Ip')
  final String ip;

  /// The ID of one IP address.
  @_s.JsonKey(name: 'IpId')
  final String ipId;

  /// The date and time that the IP address was last modified, in Unix time format
  /// and Coordinated Universal Time (UTC).
  @_s.JsonKey(name: 'ModificationTime')
  final String modificationTime;

  /// A status code that gives the current status of the request.
  @_s.JsonKey(name: 'Status')
  final IpAddressStatus status;

  /// A message that provides additional information about the status of the
  /// request.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// The ID of one subnet.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  IpAddressResponse({
    this.creationTime,
    this.ip,
    this.ipId,
    this.modificationTime,
    this.status,
    this.statusMessage,
    this.subnetId,
  });
  factory IpAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$IpAddressResponseFromJson(json);
}

enum IpAddressStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('FAILED_CREATION')
  failedCreation,
  @_s.JsonValue('ATTACHING')
  attaching,
  @_s.JsonValue('ATTACHED')
  attached,
  @_s.JsonValue('REMAP_DETACHING')
  remapDetaching,
  @_s.JsonValue('REMAP_ATTACHING')
  remapAttaching,
  @_s.JsonValue('DETACHING')
  detaching,
  @_s.JsonValue('FAILED_RESOURCE_GONE')
  failedResourceGone,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETE_FAILED_FAS_EXPIRED')
  deleteFailedFasExpired,
}

/// In an <a>UpdateResolverEndpoint</a> request, information about an IP address
/// to update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class IpAddressUpdate {
  /// The new IP address.
  @_s.JsonKey(name: 'Ip')
  final String ip;

  /// <i>Only when removing an IP address from a resolver endpoint</i>: The ID of
  /// the IP address that you want to remove. To get this ID, use
  /// <a>GetResolverEndpoint</a>.
  @_s.JsonKey(name: 'IpId')
  final String ipId;

  /// The ID of the subnet that includes the IP address that you want to update.
  /// To get this ID, use <a>GetResolverEndpoint</a>.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  IpAddressUpdate({
    this.ip,
    this.ipId,
    this.subnetId,
  });
  Map<String, dynamic> toJson() => _$IpAddressUpdateToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResolverEndpointIpAddressesResponse {
  /// The IP addresses that DNS queries pass through on their way to your network
  /// (outbound endpoint) or on the way to Resolver (inbound endpoint).
  @_s.JsonKey(name: 'IpAddresses')
  final List<IpAddressResponse> ipAddresses;

  /// The value that you specified for <code>MaxResults</code> in the request.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// If the specified endpoint has more than <code>MaxResults</code> IP
  /// addresses, you can submit another
  /// <code>ListResolverEndpointIpAddresses</code> request to get the next group
  /// of IP addresses. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListResolverEndpointIpAddressesResponse({
    this.ipAddresses,
    this.maxResults,
    this.nextToken,
  });
  factory ListResolverEndpointIpAddressesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListResolverEndpointIpAddressesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResolverEndpointsResponse {
  /// The value that you specified for <code>MaxResults</code> in the request.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// If more than <code>MaxResults</code> IP addresses match the specified
  /// criteria, you can submit another <code>ListResolverEndpoint</code> request
  /// to get the next group of results. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The resolver endpoints that were created by using the current AWS account,
  /// and that match the specified filters, if any.
  @_s.JsonKey(name: 'ResolverEndpoints')
  final List<ResolverEndpoint> resolverEndpoints;

  ListResolverEndpointsResponse({
    this.maxResults,
    this.nextToken,
    this.resolverEndpoints,
  });
  factory ListResolverEndpointsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResolverEndpointsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResolverRuleAssociationsResponse {
  /// The value that you specified for <code>MaxResults</code> in the request.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// If more than <code>MaxResults</code> rule associations match the specified
  /// criteria, you can submit another <code>ListResolverRuleAssociation</code>
  /// request to get the next group of results. In the next request, specify the
  /// value of <code>NextToken</code> from the previous response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The associations that were created between resolver rules and VPCs using the
  /// current AWS account, and that match the specified filters, if any.
  @_s.JsonKey(name: 'ResolverRuleAssociations')
  final List<ResolverRuleAssociation> resolverRuleAssociations;

  ListResolverRuleAssociationsResponse({
    this.maxResults,
    this.nextToken,
    this.resolverRuleAssociations,
  });
  factory ListResolverRuleAssociationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListResolverRuleAssociationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResolverRulesResponse {
  /// The value that you specified for <code>MaxResults</code> in the request.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// If more than <code>MaxResults</code> resolver rules match the specified
  /// criteria, you can submit another <code>ListResolverRules</code> request to
  /// get the next group of results. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The resolver rules that were created using the current AWS account and that
  /// match the specified filters, if any.
  @_s.JsonKey(name: 'ResolverRules')
  final List<ResolverRule> resolverRules;

  ListResolverRulesResponse({
    this.maxResults,
    this.nextToken,
    this.resolverRules,
  });
  factory ListResolverRulesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResolverRulesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// If more than <code>MaxResults</code> tags match the specified criteria, you
  /// can submit another <code>ListTagsForResource</code> request to get the next
  /// group of results. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The tags that are associated with the resource that you specified in the
  /// <code>ListTagsForResource</code> request.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// The response to a <code>PutResolverRulePolicy</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutResolverRulePolicyResponse {
  /// Whether the <code>PutResolverRulePolicy</code> request was successful.
  @_s.JsonKey(name: 'ReturnValue')
  final bool returnValue;

  PutResolverRulePolicyResponse({
    this.returnValue,
  });
  factory PutResolverRulePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutResolverRulePolicyResponseFromJson(json);
}

/// In the response to a <a>CreateResolverEndpoint</a>,
/// <a>DeleteResolverEndpoint</a>, <a>GetResolverEndpoint</a>,
/// <a>ListResolverEndpoints</a>, or <a>UpdateResolverEndpoint</a> request, a
/// complex type that contains settings for an existing inbound or outbound
/// resolver endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolverEndpoint {
  /// The ARN (Amazon Resource Name) for the resolver endpoint.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time that the endpoint was created, in Unix time format and
  /// Coordinated Universal Time (UTC).
  @_s.JsonKey(name: 'CreationTime')
  final String creationTime;

  /// A unique string that identifies the request that created the resolver
  /// endpoint. The <code>CreatorRequestId</code> allows failed requests to be
  /// retried without the risk of executing the operation twice.
  @_s.JsonKey(name: 'CreatorRequestId')
  final String creatorRequestId;

  /// Indicates whether the resolver endpoint allows inbound or outbound DNS
  /// queries:
  ///
  /// <ul>
  /// <li>
  /// <code>INBOUND</code>: allows DNS queries to your VPC from your network or
  /// another VPC
  /// </li>
  /// <li>
  /// <code>OUTBOUND</code>: allows DNS queries from your VPC to your network or
  /// another VPC
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Direction')
  final ResolverEndpointDirection direction;

  /// The ID of the VPC that you want to create the resolver endpoint in.
  @_s.JsonKey(name: 'HostVPCId')
  final String hostVPCId;

  /// The ID of the resolver endpoint.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The number of IP addresses that the resolver endpoint can use for DNS
  /// queries.
  @_s.JsonKey(name: 'IpAddressCount')
  final int ipAddressCount;

  /// The date and time that the endpoint was last modified, in Unix time format
  /// and Coordinated Universal Time (UTC).
  @_s.JsonKey(name: 'ModificationTime')
  final String modificationTime;

  /// The name that you assigned to the resolver endpoint when you submitted a
  /// <a>CreateResolverEndpoint</a> request.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of one or more security groups that control access to this VPC. The
  /// security group must include one or more inbound resolver rules.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// A code that specifies the current status of the resolver endpoint.
  @_s.JsonKey(name: 'Status')
  final ResolverEndpointStatus status;

  /// A detailed description of the status of the resolver endpoint.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  ResolverEndpoint({
    this.arn,
    this.creationTime,
    this.creatorRequestId,
    this.direction,
    this.hostVPCId,
    this.id,
    this.ipAddressCount,
    this.modificationTime,
    this.name,
    this.securityGroupIds,
    this.status,
    this.statusMessage,
  });
  factory ResolverEndpoint.fromJson(Map<String, dynamic> json) =>
      _$ResolverEndpointFromJson(json);
}

enum ResolverEndpointDirection {
  @_s.JsonValue('INBOUND')
  inbound,
  @_s.JsonValue('OUTBOUND')
  outbound,
}

enum ResolverEndpointStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('OPERATIONAL')
  operational,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('AUTO_RECOVERING')
  autoRecovering,
  @_s.JsonValue('ACTION_NEEDED')
  actionNeeded,
  @_s.JsonValue('DELETING')
  deleting,
}

/// For queries that originate in your VPC, detailed information about a
/// resolver rule, which specifies how to route DNS queries out of the VPC. The
/// <code>ResolverRule</code> parameter appears in the response to a
/// <a>CreateResolverRule</a>, <a>DeleteResolverRule</a>,
/// <a>GetResolverRule</a>, <a>ListResolverRules</a>, or
/// <a>UpdateResolverRule</a> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolverRule {
  /// The ARN (Amazon Resource Name) for the resolver rule specified by
  /// <code>Id</code>.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// A unique string that you specified when you created the resolver rule.
  /// <code>CreatorRequestId</code>identifies the request and allows failed
  /// requests to be retried without the risk of executing the operation twice.
  @_s.JsonKey(name: 'CreatorRequestId')
  final String creatorRequestId;

  /// DNS queries for this domain name are forwarded to the IP addresses that are
  /// specified in <code>TargetIps</code>. If a query matches multiple resolver
  /// rules (example.com and www.example.com), the query is routed using the
  /// resolver rule that contains the most specific domain name (www.example.com).
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The ID that Resolver assigned to the resolver rule when you created it.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name for the resolver rule, which you specified when you created the
  /// resolver rule.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// When a rule is shared with another AWS account, the account ID of the
  /// account that the rule is shared with.
  @_s.JsonKey(name: 'OwnerId')
  final String ownerId;

  /// The ID of the endpoint that the rule is associated with.
  @_s.JsonKey(name: 'ResolverEndpointId')
  final String resolverEndpointId;

  /// This value is always <code>FORWARD</code>. Other resolver rule types aren't
  /// supported.
  @_s.JsonKey(name: 'RuleType')
  final RuleTypeOption ruleType;

  /// Whether the rules is shared and, if so, whether the current account is
  /// sharing the rule with another account, or another account is sharing the
  /// rule with the current account.
  @_s.JsonKey(name: 'ShareStatus')
  final ShareStatus shareStatus;

  /// A code that specifies the current status of the resolver rule.
  @_s.JsonKey(name: 'Status')
  final ResolverRuleStatus status;

  /// A detailed description of the status of a resolver rule.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// An array that contains the IP addresses and ports that you want to forward
  @_s.JsonKey(name: 'TargetIps')
  final List<TargetAddress> targetIps;

  ResolverRule({
    this.arn,
    this.creatorRequestId,
    this.domainName,
    this.id,
    this.name,
    this.ownerId,
    this.resolverEndpointId,
    this.ruleType,
    this.shareStatus,
    this.status,
    this.statusMessage,
    this.targetIps,
  });
  factory ResolverRule.fromJson(Map<String, dynamic> json) =>
      _$ResolverRuleFromJson(json);
}

/// In the response to an <a>AssociateResolverRule</a>,
/// <a>DisassociateResolverRule</a>, or <a>ListResolverRuleAssociations</a>
/// request, information about an association between a resolver rule and a VPC.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolverRuleAssociation {
  /// The ID of the association between a resolver rule and a VPC. Resolver
  /// assigns this value when you submit an <a>AssociateResolverRule</a> request.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of an association between a resolver rule and a VPC.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the resolver rule that you associated with the VPC that is
  /// specified by <code>VPCId</code>.
  @_s.JsonKey(name: 'ResolverRuleId')
  final String resolverRuleId;

  /// A code that specifies the current status of the association between a
  /// resolver rule and a VPC.
  @_s.JsonKey(name: 'Status')
  final ResolverRuleAssociationStatus status;

  /// A detailed description of the status of the association between a resolver
  /// rule and a VPC.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// The ID of the VPC that you associated the resolver rule with.
  @_s.JsonKey(name: 'VPCId')
  final String vPCId;

  ResolverRuleAssociation({
    this.id,
    this.name,
    this.resolverRuleId,
    this.status,
    this.statusMessage,
    this.vPCId,
  });
  factory ResolverRuleAssociation.fromJson(Map<String, dynamic> json) =>
      _$ResolverRuleAssociationFromJson(json);
}

enum ResolverRuleAssociationStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('COMPLETE')
  complete,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('OVERRIDDEN')
  overridden,
}

/// In an <a>UpdateResolverRule</a> request, information about the changes that
/// you want to make.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ResolverRuleConfig {
  /// The new name for the resolver rule. The name that you specify appears in the
  /// Resolver dashboard in the Route 53 console.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the new outbound resolver endpoint that you want to use to route
  /// DNS queries to the IP addresses that you specify in <code>TargetIps</code>.
  @_s.JsonKey(name: 'ResolverEndpointId')
  final String resolverEndpointId;

  /// For DNS queries that originate in your VPC, the new IP addresses that you
  /// want to route outbound DNS queries to.
  @_s.JsonKey(name: 'TargetIps')
  final List<TargetAddress> targetIps;

  ResolverRuleConfig({
    this.name,
    this.resolverEndpointId,
    this.targetIps,
  });
  Map<String, dynamic> toJson() => _$ResolverRuleConfigToJson(this);
}

enum ResolverRuleStatus {
  @_s.JsonValue('COMPLETE')
  complete,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('FAILED')
  failed,
}

enum RuleTypeOption {
  @_s.JsonValue('FORWARD')
  forward,
  @_s.JsonValue('SYSTEM')
  system,
  @_s.JsonValue('RECURSIVE')
  recursive,
}

enum ShareStatus {
  @_s.JsonValue('NOT_SHARED')
  notShared,
  @_s.JsonValue('SHARED_WITH_ME')
  sharedWithMe,
  @_s.JsonValue('SHARED_BY_ME')
  sharedByMe,
}

/// One tag that you want to add to the specified resource. A tag consists of a
/// <code>Key</code> (a name for the tag) and a <code>Value</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The name for the tag. For example, if you want to associate Resolver
  /// resources with the account IDs of your customers for billing purposes, the
  /// value of <code>Key</code> might be <code>account-id</code>.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value for the tag. For example, if <code>Key</code> is
  /// <code>account-id</code>, then <code>Value</code> might be the ID of the
  /// customer account that you're creating the resource for.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

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

/// In a <a>CreateResolverRule</a> request, an array of the IPs that you want to
/// forward DNS queries to.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TargetAddress {
  /// One IP address that you want to forward DNS queries to. You can specify only
  /// IPv4 addresses.
  @_s.JsonKey(name: 'Ip')
  final String ip;

  /// The port at <code>Ip</code> that you want to forward DNS queries to.
  @_s.JsonKey(name: 'Port')
  final int port;

  TargetAddress({
    @_s.required this.ip,
    this.port,
  });
  factory TargetAddress.fromJson(Map<String, dynamic> json) =>
      _$TargetAddressFromJson(json);

  Map<String, dynamic> toJson() => _$TargetAddressToJson(this);
}

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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateResolverEndpointResponse {
  /// The response to an <code>UpdateResolverEndpoint</code> request.
  @_s.JsonKey(name: 'ResolverEndpoint')
  final ResolverEndpoint resolverEndpoint;

  UpdateResolverEndpointResponse({
    this.resolverEndpoint,
  });
  factory UpdateResolverEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateResolverEndpointResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateResolverRuleResponse {
  /// The response to an <code>UpdateResolverRule</code> request.
  @_s.JsonKey(name: 'ResolverRule')
  final ResolverRule resolverRule;

  UpdateResolverRuleResponse({
    this.resolverRule,
  });
  factory UpdateResolverRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateResolverRuleResponseFromJson(json);
}

class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String type, String message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidPolicyDocument extends _s.GenericAwsException {
  InvalidPolicyDocument({String type, String message})
      : super(type: type, code: 'InvalidPolicyDocument', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class InvalidTagException extends _s.GenericAwsException {
  InvalidTagException({String type, String message})
      : super(type: type, code: 'InvalidTagException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceExistsException extends _s.GenericAwsException {
  ResourceExistsException({String type, String message})
      : super(type: type, code: 'ResourceExistsException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceUnavailableException extends _s.GenericAwsException {
  ResourceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ResourceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnknownResourceException extends _s.GenericAwsException {
  UnknownResourceException({String type, String message})
      : super(type: type, code: 'UnknownResourceException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServiceErrorException': (type, message) =>
      InternalServiceErrorException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidPolicyDocument': (type, message) =>
      InvalidPolicyDocument(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'InvalidTagException': (type, message) =>
      InvalidTagException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceExistsException': (type, message) =>
      ResourceExistsException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceUnavailableException': (type, message) =>
      ResourceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnknownResourceException': (type, message) =>
      UnknownResourceException(type: type, message: message),
};
