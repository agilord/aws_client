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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// When you create a VPC using Amazon VPC, you automatically get DNS resolution
/// within the VPC from Route 53 Resolver. By default, Resolver answers DNS
/// queries for VPC domain names such as domain names for EC2 instances or ELB
/// load balancers. Resolver performs recursive lookups against public name
/// servers for all other domain names.
///
/// You can also configure DNS resolution between your VPC and your network over
/// a Direct Connect or VPN connection:
///
/// <b>Forward DNS queries from resolvers on your network to Route 53
/// Resolver</b>
///
/// DNS resolvers on your network can forward DNS queries to Resolver in a
/// specified VPC. This allows your DNS resolvers to easily resolve domain names
/// for AWS resources such as EC2 instances or records in a Route 53 private
/// hosted zone. For more information, see <a
/// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver.html#resolver-overview-forward-network-to-vpc">How
/// DNS Resolvers on Your Network Forward DNS Queries to Route 53 Resolver</a>
/// in the <i>Amazon Route 53 Developer Guide</i>.
///
/// <b>Conditionally forward queries from a VPC to resolvers on your network</b>
///
/// You can configure Resolver to forward queries that it receives from EC2
/// instances in your VPCs to DNS resolvers on your network. To forward selected
/// queries, you create Resolver rules that specify the domain names for the DNS
/// queries that you want to forward (such as example.com), and the IP addresses
/// of the DNS resolvers on your network that you want to forward the queries
/// to. If a query matches multiple rules (example.com, acme.example.com),
/// Resolver chooses the rule with the most specific match (acme.example.com)
/// and forwards the query to the IP addresses that you specified in that rule.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver.html#resolver-overview-forward-vpc-to-network">How
/// Route 53 Resolver Forwards DNS Queries from Your VPCs to Your Network</a> in
/// the <i>Amazon Route 53 Developer Guide</i>.
///
/// Like Amazon VPC, Resolver is regional. In each region where you have VPCs,
/// you can choose whether to forward queries from your VPCs to your network
/// (outbound queries), from your network to your VPCs (inbound queries), or
/// both.
class Route53Resolver {
  final _s.JsonProtocol _protocol;
  Route53Resolver({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'route53resolver',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Adds IP addresses to an inbound or an outbound Resolver endpoint. If you
  /// want to add more than one IP address, submit one
  /// <code>AssociateResolverEndpointIpAddress</code> request for each IP
  /// address.
  ///
  /// To remove an IP address from an endpoint, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverEndpointIpAddress.html">DisassociateResolverEndpointIpAddress</a>.
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
  /// Either the IPv4 address that you want to add to a Resolver endpoint or a
  /// subnet ID. If you specify a subnet ID, Resolver chooses an IP address for
  /// you from the available IPs in the specified subnet.
  ///
  /// Parameter [resolverEndpointId] :
  /// The ID of the Resolver endpoint that you want to associate IP addresses
  /// with.
  Future<AssociateResolverEndpointIpAddressResponse>
      associateResolverEndpointIpAddress({
    required IpAddressUpdate ipAddress,
    required String resolverEndpointId,
  }) async {
    ArgumentError.checkNotNull(ipAddress, 'ipAddress');
    ArgumentError.checkNotNull(resolverEndpointId, 'resolverEndpointId');
    _s.validateStringLength(
      'resolverEndpointId',
      resolverEndpointId,
      1,
      64,
      isRequired: true,
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

  /// Associates an Amazon VPC with a specified query logging configuration.
  /// Route 53 Resolver logs DNS queries that originate in all of the Amazon
  /// VPCs that are associated with a specified query logging configuration. To
  /// associate more than one VPC with a configuration, submit one
  /// <code>AssociateResolverQueryLogConfig</code> request for each VPC.
  /// <note>
  /// The VPCs that you associate with a query logging configuration must be in
  /// the same Region as the configuration.
  /// </note>
  /// To remove a VPC from a query logging configuration, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverQueryLogConfig.html">DisassociateResolverQueryLogConfig</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resolverQueryLogConfigId] :
  /// The ID of the query logging configuration that you want to associate a VPC
  /// with.
  ///
  /// Parameter [resourceId] :
  /// The ID of an Amazon VPC that you want this query logging configuration to
  /// log queries for.
  /// <note>
  /// The VPCs and the query logging configuration must be in the same Region.
  /// </note>
  Future<AssociateResolverQueryLogConfigResponse>
      associateResolverQueryLogConfig({
    required String resolverQueryLogConfigId,
    required String resourceId,
  }) async {
    ArgumentError.checkNotNull(
        resolverQueryLogConfigId, 'resolverQueryLogConfigId');
    _s.validateStringLength(
      'resolverQueryLogConfigId',
      resolverQueryLogConfigId,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.AssociateResolverQueryLogConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResolverQueryLogConfigId': resolverQueryLogConfigId,
        'ResourceId': resourceId,
      },
    );

    return AssociateResolverQueryLogConfigResponse.fromJson(jsonResponse.body);
  }

  /// Associates a Resolver rule with a VPC. When you associate a rule with a
  /// VPC, Resolver forwards all DNS queries for the domain name that is
  /// specified in the rule and that originate in the VPC. The queries are
  /// forwarded to the IP addresses for the DNS resolvers that are specified in
  /// the rule. For more information about rules, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverRule.html">CreateResolverRule</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceUnavailableException].
  /// May throw [ResourceExistsException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverRuleId] :
  /// The ID of the Resolver rule that you want to associate with the VPC. To
  /// list the existing Resolver rules, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRules.html">ListResolverRules</a>.
  ///
  /// Parameter [vPCId] :
  /// The ID of the VPC that you want to associate the Resolver rule with.
  ///
  /// Parameter [name] :
  /// A name for the association that you're creating between a Resolver rule
  /// and a VPC.
  Future<AssociateResolverRuleResponse> associateResolverRule({
    required String resolverRuleId,
    required String vPCId,
    String? name,
  }) async {
    ArgumentError.checkNotNull(resolverRuleId, 'resolverRuleId');
    _s.validateStringLength(
      'resolverRuleId',
      resolverRuleId,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(vPCId, 'vPCId');
    _s.validateStringLength(
      'vPCId',
      vPCId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      64,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^[0-9]+$)([a-zA-Z0-9\-_' ']+)''',
    );
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
        if (name != null) 'Name': name,
      },
    );

    return AssociateResolverRuleResponse.fromJson(jsonResponse.body);
  }

  /// Creates a Resolver endpoint. There are two types of Resolver endpoints,
  /// inbound and outbound:
  ///
  /// <ul>
  /// <li>
  /// An <i>inbound Resolver endpoint</i> forwards DNS queries to the DNS
  /// service for a VPC from your network.
  /// </li>
  /// <li>
  /// An <i>outbound Resolver endpoint</i> forwards DNS queries from the DNS
  /// service for a VPC to your network.
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
  /// a VPC from your network
  /// </li>
  /// <li>
  /// <code>OUTBOUND</code>: Resolver forwards DNS queries from the DNS service
  /// for a VPC to your network
  /// </li>
  /// </ul>
  ///
  /// Parameter [ipAddresses] :
  /// The subnets and IP addresses in your VPC that DNS queries originate from
  /// (for outbound endpoints) or that you forward DNS queries to (for inbound
  /// endpoints). The subnet ID uniquely identifies a VPC.
  ///
  /// Parameter [securityGroupIds] :
  /// The ID of one or more security groups that you want to use to control
  /// access to this VPC. The security group that you specify must include one
  /// or more inbound rules (for inbound Resolver endpoints) or outbound rules
  /// (for outbound Resolver endpoints). Inbound and outbound rules must allow
  /// TCP and UDP access. For inbound access, open port 53. For outbound access,
  /// open the port that you're using for DNS queries on your network.
  ///
  /// Parameter [name] :
  /// A friendly name that lets you easily find a configuration in the Resolver
  /// dashboard in the Route 53 console.
  ///
  /// Parameter [tags] :
  /// A list of the tag keys and values that you want to associate with the
  /// endpoint.
  Future<CreateResolverEndpointResponse> createResolverEndpoint({
    required String creatorRequestId,
    required ResolverEndpointDirection direction,
    required List<IpAddressRequest> ipAddresses,
    required List<String> securityGroupIds,
    String? name,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(creatorRequestId, 'creatorRequestId');
    _s.validateStringLength(
      'creatorRequestId',
      creatorRequestId,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(direction, 'direction');
    ArgumentError.checkNotNull(ipAddresses, 'ipAddresses');
    ArgumentError.checkNotNull(securityGroupIds, 'securityGroupIds');
    _s.validateStringLength(
      'name',
      name,
      0,
      64,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^[0-9]+$)([a-zA-Z0-9\-_' ']+)''',
    );
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
        'Direction': direction.toValue(),
        'IpAddresses': ipAddresses,
        'SecurityGroupIds': securityGroupIds,
        if (name != null) 'Name': name,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateResolverEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Creates a Resolver query logging configuration, which defines where you
  /// want Resolver to save DNS query logs that originate in your VPCs. Resolver
  /// can log queries only for VPCs that are in the same Region as the query
  /// logging configuration.
  ///
  /// To specify which VPCs you want to log queries for, you use
  /// <code>AssociateResolverQueryLogConfig</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverQueryLogConfig.html">AssociateResolverQueryLogConfig</a>.
  ///
  /// You can optionally use AWS Resource Access Manager (AWS RAM) to share a
  /// query logging configuration with other AWS accounts. The other accounts
  /// can then associate VPCs with the configuration. The query logs that
  /// Resolver creates for a configuration include all DNS queries that
  /// originate in all VPCs that are associated with the configuration.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [destinationArn] :
  /// The ARN of the resource that you want Resolver to send query logs. You can
  /// send query logs to an S3 bucket, a CloudWatch Logs log group, or a Kinesis
  /// Data Firehose delivery stream. Examples of valid values include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <b>S3 bucket</b>:
  ///
  /// <code>arn:aws:s3:::examplebucket</code>
  ///
  /// You can optionally append a file prefix to the end of the ARN.
  ///
  /// <code>arn:aws:s3:::examplebucket/development/</code>
  /// </li>
  /// <li>
  /// <b>CloudWatch Logs log group</b>:
  ///
  /// <code>arn:aws:logs:us-west-1:123456789012:log-group:/mystack-testgroup-12ABC1AB12A1:*</code>
  /// </li>
  /// <li>
  /// <b>Kinesis Data Firehose delivery stream</b>:
  ///
  /// <code>arn:aws:kinesis:us-east-2:0123456789:stream/my_stream_name</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// The name that you want to give the query logging configuration
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// requests to be retried without the risk of executing the operation twice.
  /// <code>CreatorRequestId</code> can be any unique string, for example, a
  /// date/time stamp.
  ///
  /// Parameter [tags] :
  /// A list of the tag keys and values that you want to associate with the
  /// query logging configuration.
  Future<CreateResolverQueryLogConfigResponse> createResolverQueryLogConfig({
    required String destinationArn,
    required String name,
    String? creatorRequestId,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(destinationArn, 'destinationArn');
    _s.validateStringLength(
      'destinationArn',
      destinationArn,
      1,
      600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^[0-9]+$)([a-zA-Z0-9\-_' ']+)''',
      isRequired: true,
    );
    _s.validateStringLength(
      'creatorRequestId',
      creatorRequestId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.CreateResolverQueryLogConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DestinationArn': destinationArn,
        'Name': name,
        'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateResolverQueryLogConfigResponse.fromJson(jsonResponse.body);
  }

  /// For DNS queries that originate in your VPCs, specifies which Resolver
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
  /// Resolver rules (example.com and www.example.com), outbound DNS queries are
  /// routed using the Resolver rule that contains the most specific domain name
  /// (www.example.com).
  ///
  /// Parameter [ruleType] :
  /// When you want to forward DNS queries for specified domain name to
  /// resolvers on your network, specify <code>FORWARD</code>.
  ///
  /// When you have a forwarding rule to forward DNS queries for a domain to
  /// your network and you want Resolver to process queries for a subdomain of
  /// that domain, specify <code>SYSTEM</code>.
  ///
  /// For example, to forward DNS queries for example.com to resolvers on your
  /// network, you create a rule and specify <code>FORWARD</code> for
  /// <code>RuleType</code>. To then have Resolver process queries for
  /// apex.example.com, you create a rule and specify <code>SYSTEM</code> for
  /// <code>RuleType</code>.
  ///
  /// Currently, only Resolver can create rules that have a value of
  /// <code>RECURSIVE</code> for <code>RuleType</code>.
  ///
  /// Parameter [name] :
  /// A friendly name that lets you easily find a rule in the Resolver dashboard
  /// in the Route 53 console.
  ///
  /// Parameter [resolverEndpointId] :
  /// The ID of the outbound Resolver endpoint that you want to use to route DNS
  /// queries to the IP addresses that you specify in <code>TargetIps</code>.
  ///
  /// Parameter [tags] :
  /// A list of the tag keys and values that you want to associate with the
  /// endpoint.
  ///
  /// Parameter [targetIps] :
  /// The IPs that you want Resolver to forward DNS queries to. You can specify
  /// only IPv4 addresses. Separate IP addresses with a comma.
  ///
  /// <code>TargetIps</code> is available only when the value of <code>Rule
  /// type</code> is <code>FORWARD</code>.
  Future<CreateResolverRuleResponse> createResolverRule({
    required String creatorRequestId,
    required String domainName,
    required RuleTypeOption ruleType,
    String? name,
    String? resolverEndpointId,
    List<Tag>? tags,
    List<TargetAddress>? targetIps,
  }) async {
    ArgumentError.checkNotNull(creatorRequestId, 'creatorRequestId');
    _s.validateStringLength(
      'creatorRequestId',
      creatorRequestId,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(ruleType, 'ruleType');
    _s.validateStringLength(
      'name',
      name,
      0,
      64,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^[0-9]+$)([a-zA-Z0-9\-_' ']+)''',
    );
    _s.validateStringLength(
      'resolverEndpointId',
      resolverEndpointId,
      1,
      64,
    );
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
        'RuleType': ruleType.toValue(),
        if (name != null) 'Name': name,
        if (resolverEndpointId != null)
          'ResolverEndpointId': resolverEndpointId,
        if (tags != null) 'Tags': tags,
        if (targetIps != null) 'TargetIps': targetIps,
      },
    );

    return CreateResolverRuleResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a Resolver endpoint. The effect of deleting a Resolver endpoint
  /// depends on whether it's an inbound or an outbound Resolver endpoint:
  ///
  /// <ul>
  /// <li>
  /// <b>Inbound</b>: DNS queries from your network are no longer routed to the
  /// DNS service for the specified VPC.
  /// </li>
  /// <li>
  /// <b>Outbound</b>: DNS queries from a VPC are no longer routed to your
  /// network.
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
  /// The ID of the Resolver endpoint that you want to delete.
  Future<DeleteResolverEndpointResponse> deleteResolverEndpoint({
    required String resolverEndpointId,
  }) async {
    ArgumentError.checkNotNull(resolverEndpointId, 'resolverEndpointId');
    _s.validateStringLength(
      'resolverEndpointId',
      resolverEndpointId,
      1,
      64,
      isRequired: true,
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

  /// Deletes a query logging configuration. When you delete a configuration,
  /// Resolver stops logging DNS queries for all of the Amazon VPCs that are
  /// associated with the configuration. This also applies if the query logging
  /// configuration is shared with other AWS accounts, and the other accounts
  /// have associated VPCs with the shared configuration.
  ///
  /// Before you can delete a query logging configuration, you must first
  /// disassociate all VPCs from the configuration. See <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverQueryLogConfig.html">DisassociateResolverQueryLogConfig</a>.
  ///
  /// If you used Resource Access Manager (RAM) to share a query logging
  /// configuration with other accounts, you must stop sharing the configuration
  /// before you can delete a configuration. The accounts that you shared the
  /// configuration with can first disassociate VPCs that they associated with
  /// the configuration, but that's not necessary. If you stop sharing the
  /// configuration, those VPCs are automatically disassociated from the
  /// configuration.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resolverQueryLogConfigId] :
  /// The ID of the query logging configuration that you want to delete.
  Future<DeleteResolverQueryLogConfigResponse> deleteResolverQueryLogConfig({
    required String resolverQueryLogConfigId,
  }) async {
    ArgumentError.checkNotNull(
        resolverQueryLogConfigId, 'resolverQueryLogConfigId');
    _s.validateStringLength(
      'resolverQueryLogConfigId',
      resolverQueryLogConfigId,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.DeleteResolverQueryLogConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResolverQueryLogConfigId': resolverQueryLogConfigId,
      },
    );

    return DeleteResolverQueryLogConfigResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a Resolver rule. Before you can delete a Resolver rule, you must
  /// disassociate it from all the VPCs that you associated the Resolver rule
  /// with. For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverRule.html">DisassociateResolverRule</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverRuleId] :
  /// The ID of the Resolver rule that you want to delete.
  Future<DeleteResolverRuleResponse> deleteResolverRule({
    required String resolverRuleId,
  }) async {
    ArgumentError.checkNotNull(resolverRuleId, 'resolverRuleId');
    _s.validateStringLength(
      'resolverRuleId',
      resolverRuleId,
      1,
      64,
      isRequired: true,
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

  /// Removes IP addresses from an inbound or an outbound Resolver endpoint. If
  /// you want to remove more than one IP address, submit one
  /// <code>DisassociateResolverEndpointIpAddress</code> request for each IP
  /// address.
  ///
  /// To add an IP address to an endpoint, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverEndpointIpAddress.html">AssociateResolverEndpointIpAddress</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [ipAddress] :
  /// The IPv4 address that you want to remove from a Resolver endpoint.
  ///
  /// Parameter [resolverEndpointId] :
  /// The ID of the Resolver endpoint that you want to disassociate an IP
  /// address from.
  Future<DisassociateResolverEndpointIpAddressResponse>
      disassociateResolverEndpointIpAddress({
    required IpAddressUpdate ipAddress,
    required String resolverEndpointId,
  }) async {
    ArgumentError.checkNotNull(ipAddress, 'ipAddress');
    ArgumentError.checkNotNull(resolverEndpointId, 'resolverEndpointId');
    _s.validateStringLength(
      'resolverEndpointId',
      resolverEndpointId,
      1,
      64,
      isRequired: true,
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

  /// Disassociates a VPC from a query logging configuration.
  /// <note>
  /// Before you can delete a query logging configuration, you must first
  /// disassociate all VPCs from the configuration. If you used Resource Access
  /// Manager (RAM) to share a query logging configuration with other accounts,
  /// VPCs can be disassociated from the configuration in the following ways:
  ///
  /// <ul>
  /// <li>
  /// The accounts that you shared the configuration with can disassociate VPCs
  /// from the configuration.
  /// </li>
  /// <li>
  /// You can stop sharing the configuration.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resolverQueryLogConfigId] :
  /// The ID of the query logging configuration that you want to disassociate a
  /// specified VPC from.
  ///
  /// Parameter [resourceId] :
  /// The ID of the Amazon VPC that you want to disassociate from a specified
  /// query logging configuration.
  Future<DisassociateResolverQueryLogConfigResponse>
      disassociateResolverQueryLogConfig({
    required String resolverQueryLogConfigId,
    required String resourceId,
  }) async {
    ArgumentError.checkNotNull(
        resolverQueryLogConfigId, 'resolverQueryLogConfigId');
    _s.validateStringLength(
      'resolverQueryLogConfigId',
      resolverQueryLogConfigId,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.DisassociateResolverQueryLogConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResolverQueryLogConfigId': resolverQueryLogConfigId,
        'ResourceId': resourceId,
      },
    );

    return DisassociateResolverQueryLogConfigResponse.fromJson(
        jsonResponse.body);
  }

  /// Removes the association between a specified Resolver rule and a specified
  /// VPC.
  /// <important>
  /// If you disassociate a Resolver rule from a VPC, Resolver stops forwarding
  /// DNS queries for the domain name that you specified in the Resolver rule.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverRuleId] :
  /// The ID of the Resolver rule that you want to disassociate from the
  /// specified VPC.
  ///
  /// Parameter [vPCId] :
  /// The ID of the VPC that you want to disassociate the Resolver rule from.
  Future<DisassociateResolverRuleResponse> disassociateResolverRule({
    required String resolverRuleId,
    required String vPCId,
  }) async {
    ArgumentError.checkNotNull(resolverRuleId, 'resolverRuleId');
    _s.validateStringLength(
      'resolverRuleId',
      resolverRuleId,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(vPCId, 'vPCId');
    _s.validateStringLength(
      'vPCId',
      vPCId,
      1,
      64,
      isRequired: true,
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

  /// Gets DNSSEC validation information for a specified resource.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the virtual private cloud (VPC) for the DNSSEC validation
  /// status.
  Future<GetResolverDnssecConfigResponse> getResolverDnssecConfig({
    required String resourceId,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.GetResolverDnssecConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
      },
    );

    return GetResolverDnssecConfigResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a specified Resolver endpoint, such as whether it's
  /// an inbound or an outbound Resolver endpoint, and the current status of the
  /// endpoint.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverEndpointId] :
  /// The ID of the Resolver endpoint that you want to get information about.
  Future<GetResolverEndpointResponse> getResolverEndpoint({
    required String resolverEndpointId,
  }) async {
    ArgumentError.checkNotNull(resolverEndpointId, 'resolverEndpointId');
    _s.validateStringLength(
      'resolverEndpointId',
      resolverEndpointId,
      1,
      64,
      isRequired: true,
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

  /// Gets information about a specified Resolver query logging configuration,
  /// such as the number of VPCs that the configuration is logging queries for
  /// and the location that logs are sent to.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resolverQueryLogConfigId] :
  /// The ID of the Resolver query logging configuration that you want to get
  /// information about.
  Future<GetResolverQueryLogConfigResponse> getResolverQueryLogConfig({
    required String resolverQueryLogConfigId,
  }) async {
    ArgumentError.checkNotNull(
        resolverQueryLogConfigId, 'resolverQueryLogConfigId');
    _s.validateStringLength(
      'resolverQueryLogConfigId',
      resolverQueryLogConfigId,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.GetResolverQueryLogConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResolverQueryLogConfigId': resolverQueryLogConfigId,
      },
    );

    return GetResolverQueryLogConfigResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a specified association between a Resolver query
  /// logging configuration and an Amazon VPC. When you associate a VPC with a
  /// query logging configuration, Resolver logs DNS queries that originate in
  /// that VPC.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resolverQueryLogConfigAssociationId] :
  /// The ID of the Resolver query logging configuration association that you
  /// want to get information about.
  Future<GetResolverQueryLogConfigAssociationResponse>
      getResolverQueryLogConfigAssociation({
    required String resolverQueryLogConfigAssociationId,
  }) async {
    ArgumentError.checkNotNull(resolverQueryLogConfigAssociationId,
        'resolverQueryLogConfigAssociationId');
    _s.validateStringLength(
      'resolverQueryLogConfigAssociationId',
      resolverQueryLogConfigAssociationId,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.GetResolverQueryLogConfigAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResolverQueryLogConfigAssociationId':
            resolverQueryLogConfigAssociationId,
      },
    );

    return GetResolverQueryLogConfigAssociationResponse.fromJson(
        jsonResponse.body);
  }

  /// Gets information about a query logging policy. A query logging policy
  /// specifies the Resolver query logging operations and resources that you
  /// want to allow another AWS account to be able to use.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [UnknownResourceException].
  /// May throw [InternalServiceErrorException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [arn] :
  /// The ARN of the query logging configuration that you want to get the query
  /// logging policy for.
  Future<GetResolverQueryLogConfigPolicyResponse>
      getResolverQueryLogConfigPolicy({
    required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.GetResolverQueryLogConfigPolicy'
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

    return GetResolverQueryLogConfigPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a specified Resolver rule, such as the domain name
  /// that the rule forwards DNS queries for and the ID of the outbound Resolver
  /// endpoint that the rule is associated with.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverRuleId] :
  /// The ID of the Resolver rule that you want to get information about.
  Future<GetResolverRuleResponse> getResolverRule({
    required String resolverRuleId,
  }) async {
    ArgumentError.checkNotNull(resolverRuleId, 'resolverRuleId');
    _s.validateStringLength(
      'resolverRuleId',
      resolverRuleId,
      1,
      64,
      isRequired: true,
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

  /// Gets information about an association between a specified Resolver rule
  /// and a VPC. You associate a Resolver rule and a VPC using <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverRule.html">AssociateResolverRule</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverRuleAssociationId] :
  /// The ID of the Resolver rule association that you want to get information
  /// about.
  Future<GetResolverRuleAssociationResponse> getResolverRuleAssociation({
    required String resolverRuleAssociationId,
  }) async {
    ArgumentError.checkNotNull(
        resolverRuleAssociationId, 'resolverRuleAssociationId');
    _s.validateStringLength(
      'resolverRuleAssociationId',
      resolverRuleAssociationId,
      1,
      64,
      isRequired: true,
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

  /// Gets information about the Resolver rule policy for a specified rule. A
  /// Resolver rule policy includes the rule that you want to share with another
  /// account, the account that you want to share the rule with, and the
  /// Resolver operations that you want to allow the account to use.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [UnknownResourceException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [arn] :
  /// The ID of the Resolver rule that you want to get the Resolver rule policy
  /// for.
  Future<GetResolverRulePolicyResponse> getResolverRulePolicy({
    required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      255,
      isRequired: true,
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

  /// Lists the configurations for DNSSEC validation that are associated with
  /// the current AWS account.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [filters] :
  /// An optional specification to return a subset of objects.
  ///
  /// Parameter [maxResults] :
  /// <i>Optional</i>: An integer that specifies the maximum number of DNSSEC
  /// configuration results that you want Amazon Route 53 to return. If you
  /// don't specify a value for <code>MaxResults</code>, Route 53 returns up to
  /// 100 configuration per page.
  ///
  /// Parameter [nextToken] :
  /// (Optional) If the current AWS account has more than
  /// <code>MaxResults</code> DNSSEC configurations, use <code>NextToken</code>
  /// to get the second and subsequent pages of results.
  ///
  /// For the first <code>ListResolverDnssecConfigs</code> request, omit this
  /// value.
  ///
  /// For the second and subsequent requests, get the value of
  /// <code>NextToken</code> from the previous response and specify that value
  /// for <code>NextToken</code> in the request.
  Future<ListResolverDnssecConfigsResponse> listResolverDnssecConfigs({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.ListResolverDnssecConfigs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListResolverDnssecConfigsResponse.fromJson(jsonResponse.body);
  }

  /// Gets the IP addresses for a specified Resolver endpoint.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverEndpointId] :
  /// The ID of the Resolver endpoint that you want to get IP addresses for.
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
  /// If the specified Resolver endpoint has more than <code>MaxResults</code>
  /// IP addresses, you can submit another
  /// <code>ListResolverEndpointIpAddresses</code> request to get the next group
  /// of IP addresses. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  Future<ListResolverEndpointIpAddressesResponse>
      listResolverEndpointIpAddresses({
    required String resolverEndpointId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resolverEndpointId, 'resolverEndpointId');
    _s.validateStringLength(
      'resolverEndpointId',
      resolverEndpointId,
      1,
      64,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListResolverEndpointIpAddressesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the Resolver endpoints that were created using the current AWS
  /// account.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// An optional specification to return a subset of Resolver endpoints, such
  /// as all inbound Resolver endpoints.
  /// <note>
  /// If you submit a second or subsequent <code>ListResolverEndpoints</code>
  /// request and specify the <code>NextToken</code> parameter, you must use the
  /// same values for <code>Filters</code>, if any, as in the previous request.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Resolver endpoints that you want to return in the
  /// response to a <code>ListResolverEndpoints</code> request. If you don't
  /// specify a value for <code>MaxResults</code>, Resolver returns up to 100
  /// Resolver endpoints.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListResolverEndpoints</code> request, omit this value.
  ///
  /// If you have more than <code>MaxResults</code> Resolver endpoints, you can
  /// submit another <code>ListResolverEndpoints</code> request to get the next
  /// group of Resolver endpoints. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  Future<ListResolverEndpointsResponse> listResolverEndpoints({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
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
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListResolverEndpointsResponse.fromJson(jsonResponse.body);
  }

  /// Lists information about associations between Amazon VPCs and query logging
  /// configurations.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [filters] :
  /// An optional specification to return a subset of query logging
  /// associations.
  /// <note>
  /// If you submit a second or subsequent
  /// <code>ListResolverQueryLogConfigAssociations</code> request and specify
  /// the <code>NextToken</code> parameter, you must use the same values for
  /// <code>Filters</code>, if any, as in the previous request.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of query logging associations that you want to return
  /// in the response to a <code>ListResolverQueryLogConfigAssociations</code>
  /// request. If you don't specify a value for <code>MaxResults</code>,
  /// Resolver returns up to 100 query logging associations.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListResolverQueryLogConfigAssociations</code> request,
  /// omit this value.
  ///
  /// If there are more than <code>MaxResults</code> query logging associations
  /// that match the values that you specify for <code>Filters</code>, you can
  /// submit another <code>ListResolverQueryLogConfigAssociations</code> request
  /// to get the next group of associations. In the next request, specify the
  /// value of <code>NextToken</code> from the previous response.
  ///
  /// Parameter [sortBy] :
  /// The element that you want Resolver to sort query logging associations by.
  /// <note>
  /// If you submit a second or subsequent
  /// <code>ListResolverQueryLogConfigAssociations</code> request and specify
  /// the <code>NextToken</code> parameter, you must use the same value for
  /// <code>SortBy</code>, if any, as in the previous request.
  /// </note>
  /// Valid values include the following elements:
  ///
  /// <ul>
  /// <li>
  /// <code>CreationTime</code>: The ID of the query logging association.
  /// </li>
  /// <li>
  /// <code>Error</code>: If the value of <code>Status</code> is
  /// <code>FAILED</code>, the value of <code>Error</code> indicates the cause:
  ///
  /// <ul>
  /// <li>
  /// <code>DESTINATION_NOT_FOUND</code>: The specified destination (for
  /// example, an Amazon S3 bucket) was deleted.
  /// </li>
  /// <li>
  /// <code>ACCESS_DENIED</code>: Permissions don't allow sending logs to the
  /// destination.
  /// </li>
  /// </ul>
  /// If <code>Status</code> is a value other than <code>FAILED</code>,
  /// <code>ERROR</code> is null.
  /// </li>
  /// <li>
  /// <code>Id</code>: The ID of the query logging association
  /// </li>
  /// <li>
  /// <code>ResolverQueryLogConfigId</code>: The ID of the query logging
  /// configuration
  /// </li>
  /// <li>
  /// <code>ResourceId</code>: The ID of the VPC that is associated with the
  /// query logging configuration
  /// </li>
  /// <li>
  /// <code>Status</code>: The current status of the configuration. Valid values
  /// include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code>: Resolver is creating an association between an
  /// Amazon VPC and a query logging configuration.
  /// </li>
  /// <li>
  /// <code>CREATED</code>: The association between an Amazon VPC and a query
  /// logging configuration was successfully created. Resolver is logging
  /// queries that originate in the specified VPC.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: Resolver is deleting this query logging
  /// association.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: Resolver either couldn't create or couldn't delete
  /// the query logging association. Here are two common causes:
  ///
  /// <ul>
  /// <li>
  /// The specified destination (for example, an Amazon S3 bucket) was deleted.
  /// </li>
  /// <li>
  /// Permissions don't allow sending logs to the destination.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [sortOrder] :
  /// If you specified a value for <code>SortBy</code>, the order that you want
  /// query logging associations to be listed in, <code>ASCENDING</code> or
  /// <code>DESCENDING</code>.
  /// <note>
  /// If you submit a second or subsequent
  /// <code>ListResolverQueryLogConfigAssociations</code> request and specify
  /// the <code>NextToken</code> parameter, you must use the same value for
  /// <code>SortOrder</code>, if any, as in the previous request.
  /// </note>
  Future<ListResolverQueryLogConfigAssociationsResponse>
      listResolverQueryLogConfigAssociations({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    String? sortBy,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'sortBy',
      sortBy,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.ListResolverQueryLogConfigAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortBy != null) 'SortBy': sortBy,
        if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
      },
    );

    return ListResolverQueryLogConfigAssociationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists information about the specified query logging configurations. Each
  /// configuration defines where you want Resolver to save DNS query logs and
  /// specifies the VPCs that you want to log queries for.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [filters] :
  /// An optional specification to return a subset of query logging
  /// configurations.
  /// <note>
  /// If you submit a second or subsequent
  /// <code>ListResolverQueryLogConfigs</code> request and specify the
  /// <code>NextToken</code> parameter, you must use the same values for
  /// <code>Filters</code>, if any, as in the previous request.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of query logging configurations that you want to return
  /// in the response to a <code>ListResolverQueryLogConfigs</code> request. If
  /// you don't specify a value for <code>MaxResults</code>, Resolver returns up
  /// to 100 query logging configurations.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListResolverQueryLogConfigs</code> request, omit this
  /// value.
  ///
  /// If there are more than <code>MaxResults</code> query logging
  /// configurations that match the values that you specify for
  /// <code>Filters</code>, you can submit another
  /// <code>ListResolverQueryLogConfigs</code> request to get the next group of
  /// configurations. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  ///
  /// Parameter [sortBy] :
  /// The element that you want Resolver to sort query logging configurations
  /// by.
  /// <note>
  /// If you submit a second or subsequent
  /// <code>ListResolverQueryLogConfigs</code> request and specify the
  /// <code>NextToken</code> parameter, you must use the same value for
  /// <code>SortBy</code>, if any, as in the previous request.
  /// </note>
  /// Valid values include the following elements:
  ///
  /// <ul>
  /// <li>
  /// <code>Arn</code>: The ARN of the query logging configuration
  /// </li>
  /// <li>
  /// <code>AssociationCount</code>: The number of VPCs that are associated with
  /// the specified configuration
  /// </li>
  /// <li>
  /// <code>CreationTime</code>: The date and time that Resolver returned when
  /// the configuration was created
  /// </li>
  /// <li>
  /// <code>CreatorRequestId</code>: The value that was specified for
  /// <code>CreatorRequestId</code> when the configuration was created
  /// </li>
  /// <li>
  /// <code>DestinationArn</code>: The location that logs are sent to
  /// </li>
  /// <li>
  /// <code>Id</code>: The ID of the configuration
  /// </li>
  /// <li>
  /// <code>Name</code>: The name of the configuration
  /// </li>
  /// <li>
  /// <code>OwnerId</code>: The AWS account number of the account that created
  /// the configuration
  /// </li>
  /// <li>
  /// <code>ShareStatus</code>: Whether the configuration is shared with other
  /// AWS accounts or shared with the current account by another AWS account.
  /// Sharing is configured through AWS Resource Access Manager (AWS RAM).
  /// </li>
  /// <li>
  /// <code>Status</code>: The current status of the configuration. Valid values
  /// include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code>: Resolver is creating the query logging
  /// configuration.
  /// </li>
  /// <li>
  /// <code>CREATED</code>: The query logging configuration was successfully
  /// created. Resolver is logging queries that originate in the specified VPC.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: Resolver is deleting this query logging
  /// configuration.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: Resolver either couldn't create or couldn't delete
  /// the query logging configuration. Here are two common causes:
  ///
  /// <ul>
  /// <li>
  /// The specified destination (for example, an Amazon S3 bucket) was deleted.
  /// </li>
  /// <li>
  /// Permissions don't allow sending logs to the destination.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [sortOrder] :
  /// If you specified a value for <code>SortBy</code>, the order that you want
  /// query logging configurations to be listed in, <code>ASCENDING</code> or
  /// <code>DESCENDING</code>.
  /// <note>
  /// If you submit a second or subsequent
  /// <code>ListResolverQueryLogConfigs</code> request and specify the
  /// <code>NextToken</code> parameter, you must use the same value for
  /// <code>SortOrder</code>, if any, as in the previous request.
  /// </note>
  Future<ListResolverQueryLogConfigsResponse> listResolverQueryLogConfigs({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    String? sortBy,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'sortBy',
      sortBy,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.ListResolverQueryLogConfigs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortBy != null) 'SortBy': sortBy,
        if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
      },
    );

    return ListResolverQueryLogConfigsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the associations that were created between Resolver rules and VPCs
  /// using the current AWS account.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// An optional specification to return a subset of Resolver rules, such as
  /// Resolver rules that are associated with the same VPC ID.
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
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
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
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListResolverRuleAssociationsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the Resolver rules that were created using the current AWS account.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// An optional specification to return a subset of Resolver rules, such as
  /// all Resolver rules that are associated with the same Resolver endpoint.
  /// <note>
  /// If you submit a second or subsequent <code>ListResolverRules</code>
  /// request and specify the <code>NextToken</code> parameter, you must use the
  /// same values for <code>Filters</code>, if any, as in the previous request.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Resolver rules that you want to return in the
  /// response to a <code>ListResolverRules</code> request. If you don't specify
  /// a value for <code>MaxResults</code>, Resolver returns up to 100 Resolver
  /// rules.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListResolverRules</code> request, omit this value.
  ///
  /// If you have more than <code>MaxResults</code> Resolver rules, you can
  /// submit another <code>ListResolverRules</code> request to get the next
  /// group of Resolver rules. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  Future<ListResolverRulesResponse> listResolverRules({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
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
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
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
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      255,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Specifies an AWS account that you want to share a query logging
  /// configuration with, the query logging configuration that you want to
  /// share, and the operations that you want the account to be able to perform
  /// on the configuration.
  ///
  /// May throw [InvalidPolicyDocument].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [UnknownResourceException].
  /// May throw [InternalServiceErrorException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the account that you want to share rules
  /// with.
  ///
  /// Parameter [resolverQueryLogConfigPolicy] :
  /// An AWS Identity and Access Management policy statement that lists the
  /// query logging configurations that you want to share with another AWS
  /// account and the operations that you want the account to be able to
  /// perform. You can specify the following operations in the
  /// <code>Actions</code> section of the statement:
  ///
  /// <ul>
  /// <li>
  /// <code>route53resolver:AssociateResolverQueryLogConfig</code>
  /// </li>
  /// <li>
  /// <code>route53resolver:DisassociateResolverQueryLogConfig</code>
  /// </li>
  /// <li>
  /// <code>route53resolver:ListResolverQueryLogConfigAssociations</code>
  /// </li>
  /// <li>
  /// <code>route53resolver:ListResolverQueryLogConfigs</code>
  /// </li>
  /// </ul>
  /// In the <code>Resource</code> section of the statement, you specify the
  /// ARNs for the query logging configurations that you want to share with the
  /// account that you specified in <code>Arn</code>.
  Future<PutResolverQueryLogConfigPolicyResponse>
      putResolverQueryLogConfigPolicy({
    required String arn,
    required String resolverQueryLogConfigPolicy,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        resolverQueryLogConfigPolicy, 'resolverQueryLogConfigPolicy');
    _s.validateStringLength(
      'resolverQueryLogConfigPolicy',
      resolverQueryLogConfigPolicy,
      0,
      5000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.PutResolverQueryLogConfigPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Arn': arn,
        'ResolverQueryLogConfigPolicy': resolverQueryLogConfigPolicy,
      },
    );

    return PutResolverQueryLogConfigPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Specifies an AWS rule that you want to share with another account, the
  /// account that you want to share the rule with, and the operations that you
  /// want the account to be able to perform on the rule.
  ///
  /// May throw [InvalidPolicyDocument].
  /// May throw [InvalidParameterException].
  /// May throw [UnknownResourceException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the rule that you want to share with
  /// another account.
  ///
  /// Parameter [resolverRulePolicy] :
  /// An AWS Identity and Access Management policy statement that lists the
  /// rules that you want to share with another AWS account and the operations
  /// that you want the account to be able to perform. You can specify the
  /// following operations in the <code>Action</code> section of the statement:
  ///
  /// <ul>
  /// <li>
  /// <code>route53resolver:GetResolverRule</code>
  /// </li>
  /// <li>
  /// <code>route53resolver:AssociateResolverRule</code>
  /// </li>
  /// <li>
  /// <code>route53resolver:DisassociateResolverRule</code>
  /// </li>
  /// <li>
  /// <code>route53resolver:ListResolverRules</code>
  /// </li>
  /// <li>
  /// <code>route53resolver:ListResolverRuleAssociations</code>
  /// </li>
  /// </ul>
  /// In the <code>Resource</code> section of the statement, specify the ARN for
  /// the rule that you want to share with another account. Specify the same ARN
  /// that you specified in <code>Arn</code>.
  Future<PutResolverRulePolicyResponse> putResolverRulePolicy({
    required String arn,
    required String resolverRulePolicy,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resolverRulePolicy, 'resolverRulePolicy');
    _s.validateStringLength(
      'resolverRulePolicy',
      resolverRulePolicy,
      0,
      5000,
      isRequired: true,
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
  /// May throw [InvalidRequestException].
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
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html">GetResolverEndpoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverRule.html">GetResolverRule</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverRuleAssociation.html">GetResolverRuleAssociation</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverEndpoints.html">ListResolverEndpoints</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRuleAssociations.html">ListResolverRuleAssociations</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRules.html">ListResolverRules</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// The tags that you want to add to the specified resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.TagResource'
    };
    await _protocol.send(
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
  }

  /// Removes one or more tags from a specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
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
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html">GetResolverEndpoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverRule.html">GetResolverRule</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverRuleAssociation.html">GetResolverRuleAssociation</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverEndpoints.html">ListResolverEndpoints</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRuleAssociations.html">ListResolverRuleAssociations</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRules.html">ListResolverRules</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [tagKeys] :
  /// The tags that you want to remove to the specified resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.UntagResource'
    };
    await _protocol.send(
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
  }

  /// Updates an existing DNSSEC validation configuration. If there is no
  /// existing DNSSEC validation configuration, one is created.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the virtual private cloud (VPC) that you're updating the DNSSEC
  /// validation status for.
  ///
  /// Parameter [validation] :
  /// The new value that you are specifying for DNSSEC validation for the VPC.
  /// The value can be <code>ENABLE</code> or <code>DISABLE</code>. Be aware
  /// that it can take time for a validation status change to be completed.
  Future<UpdateResolverDnssecConfigResponse> updateResolverDnssecConfig({
    required String resourceId,
    required Validation validation,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(validation, 'validation');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.UpdateResolverDnssecConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'Validation': validation.toValue(),
      },
    );

    return UpdateResolverDnssecConfigResponse.fromJson(jsonResponse.body);
  }

  /// Updates the name of an inbound or an outbound Resolver endpoint.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverEndpointId] :
  /// The ID of the Resolver endpoint that you want to update.
  ///
  /// Parameter [name] :
  /// The name of the Resolver endpoint that you want to update.
  Future<UpdateResolverEndpointResponse> updateResolverEndpoint({
    required String resolverEndpointId,
    String? name,
  }) async {
    ArgumentError.checkNotNull(resolverEndpointId, 'resolverEndpointId');
    _s.validateStringLength(
      'resolverEndpointId',
      resolverEndpointId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      64,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^[0-9]+$)([a-zA-Z0-9\-_' ']+)''',
    );
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
        if (name != null) 'Name': name,
      },
    );

    return UpdateResolverEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Updates settings for a specified Resolver rule.
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
  /// The new settings for the Resolver rule.
  ///
  /// Parameter [resolverRuleId] :
  /// The ID of the Resolver rule that you want to update.
  Future<UpdateResolverRuleResponse> updateResolverRule({
    required ResolverRuleConfig config,
    required String resolverRuleId,
  }) async {
    ArgumentError.checkNotNull(config, 'config');
    ArgumentError.checkNotNull(resolverRuleId, 'resolverRuleId');
    _s.validateStringLength(
      'resolverRuleId',
      resolverRuleId,
      1,
      64,
      isRequired: true,
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

class AssociateResolverEndpointIpAddressResponse {
  /// The response to an <code>AssociateResolverEndpointIpAddress</code> request.
  final ResolverEndpoint? resolverEndpoint;

  AssociateResolverEndpointIpAddressResponse({
    this.resolverEndpoint,
  });
  factory AssociateResolverEndpointIpAddressResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateResolverEndpointIpAddressResponse(
      resolverEndpoint: json['ResolverEndpoint'] != null
          ? ResolverEndpoint.fromJson(
              json['ResolverEndpoint'] as Map<String, dynamic>)
          : null,
    );
  }
}

class AssociateResolverQueryLogConfigResponse {
  /// A complex type that contains settings for a specified association between an
  /// Amazon VPC and a query logging configuration.
  final ResolverQueryLogConfigAssociation? resolverQueryLogConfigAssociation;

  AssociateResolverQueryLogConfigResponse({
    this.resolverQueryLogConfigAssociation,
  });
  factory AssociateResolverQueryLogConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateResolverQueryLogConfigResponse(
      resolverQueryLogConfigAssociation:
          json['ResolverQueryLogConfigAssociation'] != null
              ? ResolverQueryLogConfigAssociation.fromJson(
                  json['ResolverQueryLogConfigAssociation']
                      as Map<String, dynamic>)
              : null,
    );
  }
}

class AssociateResolverRuleResponse {
  /// Information about the <code>AssociateResolverRule</code> request, including
  /// the status of the request.
  final ResolverRuleAssociation? resolverRuleAssociation;

  AssociateResolverRuleResponse({
    this.resolverRuleAssociation,
  });
  factory AssociateResolverRuleResponse.fromJson(Map<String, dynamic> json) {
    return AssociateResolverRuleResponse(
      resolverRuleAssociation: json['ResolverRuleAssociation'] != null
          ? ResolverRuleAssociation.fromJson(
              json['ResolverRuleAssociation'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateResolverEndpointResponse {
  /// Information about the <code>CreateResolverEndpoint</code> request, including
  /// the status of the request.
  final ResolverEndpoint? resolverEndpoint;

  CreateResolverEndpointResponse({
    this.resolverEndpoint,
  });
  factory CreateResolverEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreateResolverEndpointResponse(
      resolverEndpoint: json['ResolverEndpoint'] != null
          ? ResolverEndpoint.fromJson(
              json['ResolverEndpoint'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateResolverQueryLogConfigResponse {
  /// Information about the <code>CreateResolverQueryLogConfig</code> request,
  /// including the status of the request.
  final ResolverQueryLogConfig? resolverQueryLogConfig;

  CreateResolverQueryLogConfigResponse({
    this.resolverQueryLogConfig,
  });
  factory CreateResolverQueryLogConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateResolverQueryLogConfigResponse(
      resolverQueryLogConfig: json['ResolverQueryLogConfig'] != null
          ? ResolverQueryLogConfig.fromJson(
              json['ResolverQueryLogConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateResolverRuleResponse {
  /// Information about the <code>CreateResolverRule</code> request, including the
  /// status of the request.
  final ResolverRule? resolverRule;

  CreateResolverRuleResponse({
    this.resolverRule,
  });
  factory CreateResolverRuleResponse.fromJson(Map<String, dynamic> json) {
    return CreateResolverRuleResponse(
      resolverRule: json['ResolverRule'] != null
          ? ResolverRule.fromJson(json['ResolverRule'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DeleteResolverEndpointResponse {
  /// Information about the <code>DeleteResolverEndpoint</code> request, including
  /// the status of the request.
  final ResolverEndpoint? resolverEndpoint;

  DeleteResolverEndpointResponse({
    this.resolverEndpoint,
  });
  factory DeleteResolverEndpointResponse.fromJson(Map<String, dynamic> json) {
    return DeleteResolverEndpointResponse(
      resolverEndpoint: json['ResolverEndpoint'] != null
          ? ResolverEndpoint.fromJson(
              json['ResolverEndpoint'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DeleteResolverQueryLogConfigResponse {
  /// Information about the query logging configuration that you deleted,
  /// including the status of the request.
  final ResolverQueryLogConfig? resolverQueryLogConfig;

  DeleteResolverQueryLogConfigResponse({
    this.resolverQueryLogConfig,
  });
  factory DeleteResolverQueryLogConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteResolverQueryLogConfigResponse(
      resolverQueryLogConfig: json['ResolverQueryLogConfig'] != null
          ? ResolverQueryLogConfig.fromJson(
              json['ResolverQueryLogConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DeleteResolverRuleResponse {
  /// Information about the <code>DeleteResolverRule</code> request, including the
  /// status of the request.
  final ResolverRule? resolverRule;

  DeleteResolverRuleResponse({
    this.resolverRule,
  });
  factory DeleteResolverRuleResponse.fromJson(Map<String, dynamic> json) {
    return DeleteResolverRuleResponse(
      resolverRule: json['ResolverRule'] != null
          ? ResolverRule.fromJson(json['ResolverRule'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DisassociateResolverEndpointIpAddressResponse {
  /// The response to an <code>DisassociateResolverEndpointIpAddress</code>
  /// request.
  final ResolverEndpoint? resolverEndpoint;

  DisassociateResolverEndpointIpAddressResponse({
    this.resolverEndpoint,
  });
  factory DisassociateResolverEndpointIpAddressResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateResolverEndpointIpAddressResponse(
      resolverEndpoint: json['ResolverEndpoint'] != null
          ? ResolverEndpoint.fromJson(
              json['ResolverEndpoint'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DisassociateResolverQueryLogConfigResponse {
  /// A complex type that contains settings for the association that you deleted
  /// between an Amazon VPC and a query logging configuration.
  final ResolverQueryLogConfigAssociation? resolverQueryLogConfigAssociation;

  DisassociateResolverQueryLogConfigResponse({
    this.resolverQueryLogConfigAssociation,
  });
  factory DisassociateResolverQueryLogConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateResolverQueryLogConfigResponse(
      resolverQueryLogConfigAssociation:
          json['ResolverQueryLogConfigAssociation'] != null
              ? ResolverQueryLogConfigAssociation.fromJson(
                  json['ResolverQueryLogConfigAssociation']
                      as Map<String, dynamic>)
              : null,
    );
  }
}

class DisassociateResolverRuleResponse {
  /// Information about the <code>DisassociateResolverRule</code> request,
  /// including the status of the request.
  final ResolverRuleAssociation? resolverRuleAssociation;

  DisassociateResolverRuleResponse({
    this.resolverRuleAssociation,
  });
  factory DisassociateResolverRuleResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateResolverRuleResponse(
      resolverRuleAssociation: json['ResolverRuleAssociation'] != null
          ? ResolverRuleAssociation.fromJson(
              json['ResolverRuleAssociation'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// For Resolver list operations (<a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverEndpoints.html">ListResolverEndpoints</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRules.html">ListResolverRules</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRuleAssociations.html">ListResolverRuleAssociations</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverQueryLogConfigs.html">ListResolverQueryLogConfigs</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverQueryLogConfigAssociations.html">ListResolverQueryLogConfigAssociations</a>),
/// and <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverDnssecConfigs.html">ListResolverDnssecConfigs</a>),
/// an optional specification to return a subset of objects.
///
/// To filter objects, such as Resolver endpoints or Resolver rules, you specify
/// <code>Name</code> and <code>Values</code>. For example, to list only inbound
/// Resolver endpoints, specify <code>Direction</code> for <code>Name</code> and
/// specify <code>INBOUND</code> for <code>Values</code>.
class Filter {
  /// The name of the parameter that you want to use to filter objects.
  ///
  /// The valid values for <code>Name</code> depend on the action that you're
  /// including the filter in, <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverEndpoints.html">ListResolverEndpoints</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRules.html">ListResolverRules</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRuleAssociations.html">ListResolverRuleAssociations</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverQueryLogConfigs.html">ListResolverQueryLogConfigs</a>,
  /// or <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverQueryLogConfigAssociations.html">ListResolverQueryLogConfigAssociations</a>.
  /// <note>
  /// In early versions of Resolver, values for <code>Name</code> were listed as
  /// uppercase, with underscore (_) delimiters. For example,
  /// <code>CreatorRequestId</code> was originally listed as
  /// <code>CREATOR_REQUEST_ID</code>. Uppercase values for <code>Name</code> are
  /// still supported.
  /// </note>
  /// <b>ListResolverEndpoints</b>
  ///
  /// Valid values for <code>Name</code> include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CreatorRequestId</code>: The value that you specified when you created
  /// the Resolver endpoint.
  /// </li>
  /// <li>
  /// <code>Direction</code>: Whether you want to return inbound or outbound
  /// Resolver endpoints. If you specify <code>DIRECTION</code> for
  /// <code>Name</code>, specify <code>INBOUND</code> or <code>OUTBOUND</code> for
  /// <code>Values</code>.
  /// </li>
  /// <li>
  /// <code>HostVpcId</code>: The ID of the VPC that inbound DNS queries pass
  /// through on the way from your network to your VPCs in a region, or the VPC
  /// that outbound queries pass through on the way from your VPCs to your
  /// network. In a <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverEndpoint.html">CreateResolverEndpoint</a>
  /// request, <code>SubnetId</code> indirectly identifies the VPC. In a <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html">GetResolverEndpoint</a>
  /// request, the VPC ID for a Resolver endpoint is returned in the
  /// <code>HostVPCId</code> element.
  /// </li>
  /// <li>
  /// <code>IpAddressCount</code>: The number of IP addresses that you have
  /// associated with the Resolver endpoint.
  /// </li>
  /// <li>
  /// <code>Name</code>: The name of the Resolver endpoint.
  /// </li>
  /// <li>
  /// <code>SecurityGroupIds</code>: The IDs of the VPC security groups that you
  /// specified when you created the Resolver endpoint.
  /// </li>
  /// <li>
  /// <code>Status</code>: The status of the Resolver endpoint. If you specify
  /// <code>Status</code> for <code>Name</code>, specify one of the following
  /// status codes for <code>Values</code>: <code>CREATING</code>,
  /// <code>OPERATIONAL</code>, <code>UPDATING</code>,
  /// <code>AUTO_RECOVERING</code>, <code>ACTION_NEEDED</code>, or
  /// <code>DELETING</code>. For more information, see <code>Status</code> in <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ResolverEndpoint.html">ResolverEndpoint</a>.
  /// </li>
  /// </ul>
  /// <b>ListResolverRules</b>
  ///
  /// Valid values for <code>Name</code> include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CreatorRequestId</code>: The value that you specified when you created
  /// the Resolver rule.
  /// </li>
  /// <li>
  /// <code>DomainName</code>: The domain name for which Resolver is forwarding
  /// DNS queries to your network. In the value that you specify for
  /// <code>Values</code>, include a trailing dot (.) after the domain name. For
  /// example, if the domain name is example.com, specify the following value.
  /// Note the "." after <code>com</code>:
  ///
  /// <code>example.com.</code>
  /// </li>
  /// <li>
  /// <code>Name</code>: The name of the Resolver rule.
  /// </li>
  /// <li>
  /// <code>ResolverEndpointId</code>: The ID of the Resolver endpoint that the
  /// Resolver rule is associated with.
  /// <note>
  /// You can filter on the Resolver endpoint only for rules that have a value of
  /// <code>FORWARD</code> for <code>RuleType</code>.
  /// </note> </li>
  /// <li>
  /// <code>Status</code>: The status of the Resolver rule. If you specify
  /// <code>Status</code> for <code>Name</code>, specify one of the following
  /// status codes for <code>Values</code>: <code>COMPLETE</code>,
  /// <code>DELETING</code>, <code>UPDATING</code>, or <code>FAILED</code>.
  /// </li>
  /// <li>
  /// <code>Type</code>: The type of the Resolver rule. If you specify
  /// <code>TYPE</code> for <code>Name</code>, specify <code>FORWARD</code> or
  /// <code>SYSTEM</code> for <code>Values</code>.
  /// </li>
  /// </ul>
  /// <b>ListResolverRuleAssociations</b>
  ///
  /// Valid values for <code>Name</code> include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>Name</code>: The name of the Resolver rule association.
  /// </li>
  /// <li>
  /// <code>ResolverRuleId</code>: The ID of the Resolver rule that is associated
  /// with one or more VPCs.
  /// </li>
  /// <li>
  /// <code>Status</code>: The status of the Resolver rule association. If you
  /// specify <code>Status</code> for <code>Name</code>, specify one of the
  /// following status codes for <code>Values</code>: <code>CREATING</code>,
  /// <code>COMPLETE</code>, <code>DELETING</code>, or <code>FAILED</code>.
  /// </li>
  /// <li>
  /// <code>VPCId</code>: The ID of the VPC that the Resolver rule is associated
  /// with.
  /// </li>
  /// </ul>
  /// <b>ListResolverQueryLogConfigs</b>
  ///
  /// Valid values for <code>Name</code> include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>Arn</code>: The ARN for the query logging configuration.
  /// </li>
  /// <li>
  /// <code>AssociationCount</code>: The number of VPCs that are associated with
  /// the query logging configuration.
  /// </li>
  /// <li>
  /// <code>CreationTime</code>: The date and time that the query logging
  /// configuration was created, in Unix time format and Coordinated Universal
  /// Time (UTC).
  /// </li>
  /// <li>
  /// <code>CreatorRequestId</code>: A unique string that identifies the request
  /// that created the query logging configuration.
  /// </li>
  /// <li>
  /// <code>Destination</code>: The AWS service that you want to forward query
  /// logs to. Valid values include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>S3</code>
  /// </li>
  /// <li>
  /// <code>CloudWatchLogs</code>
  /// </li>
  /// <li>
  /// <code>KinesisFirehose</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>DestinationArn</code>: The ARN of the location that Resolver is
  /// sending query logs to. This value can be the ARN for an S3 bucket, a
  /// CloudWatch Logs log group, or a Kinesis Data Firehose delivery stream.
  /// </li>
  /// <li>
  /// <code>Id</code>: The ID of the query logging configuration
  /// </li>
  /// <li>
  /// <code>Name</code>: The name of the query logging configuration
  /// </li>
  /// <li>
  /// <code>OwnerId</code>: The AWS account ID for the account that created the
  /// query logging configuration.
  /// </li>
  /// <li>
  /// <code>ShareStatus</code>: An indication of whether the query logging
  /// configuration is shared with other AWS accounts, or was shared with the
  /// current account by another AWS account. Valid values include:
  /// <code>NOT_SHARED</code>, <code>SHARED_WITH_ME</code>, or
  /// <code>SHARED_BY_ME</code>.
  /// </li>
  /// <li>
  /// <code>Status</code>: The status of the query logging configuration. If you
  /// specify <code>Status</code> for <code>Name</code>, specify the applicable
  /// status code for <code>Values</code>: <code>CREATING</code>,
  /// <code>CREATED</code>, <code>DELETING</code>, or <code>FAILED</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ResolverQueryLogConfig.html#Route53Resolver-Type-route53resolver_ResolverQueryLogConfig-Status">Status</a>.
  /// </li>
  /// </ul>
  /// <b>ListResolverQueryLogConfigAssociations</b>
  ///
  /// Valid values for <code>Name</code> include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CreationTime</code>: The date and time that the VPC was associated
  /// with the query logging configuration, in Unix time format and Coordinated
  /// Universal Time (UTC).
  /// </li>
  /// <li>
  /// <code>Error</code>: If the value of <code>Status</code> is
  /// <code>FAILED</code>, specify the cause: <code>DESTINATION_NOT_FOUND</code>
  /// or <code>ACCESS_DENIED</code>.
  /// </li>
  /// <li>
  /// <code>Id</code>: The ID of the query logging association.
  /// </li>
  /// <li>
  /// <code>ResolverQueryLogConfigId</code>: The ID of the query logging
  /// configuration that a VPC is associated with.
  /// </li>
  /// <li>
  /// <code>ResourceId</code>: The ID of the Amazon VPC that is associated with
  /// the query logging configuration.
  /// </li>
  /// <li>
  /// <code>Status</code>: The status of the query logging association. If you
  /// specify <code>Status</code> for <code>Name</code>, specify the applicable
  /// status code for <code>Values</code>: <code>CREATING</code>,
  /// <code>CREATED</code>, <code>DELETING</code>, or <code>FAILED</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ResolverQueryLogConfigAssociation.html#Route53Resolver-Type-route53resolver_ResolverQueryLogConfigAssociation-Status">Status</a>.
  /// </li>
  /// </ul>
  final String? name;

  /// When you're using a <code>List</code> operation and you want the operation
  /// to return a subset of objects, such as Resolver endpoints or Resolver rules,
  /// the value of the parameter that you want to use to filter objects. For
  /// example, to list only inbound Resolver endpoints, specify
  /// <code>Direction</code> for <code>Name</code> and specify
  /// <code>INBOUND</code> for <code>Values</code>.
  final List<String>? values;

  Filter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'Name': name,
      if (values != null) 'Values': values,
    };
  }
}

class GetResolverDnssecConfigResponse {
  /// The information about a configuration for DNSSEC validation.
  final ResolverDnssecConfig? resolverDNSSECConfig;

  GetResolverDnssecConfigResponse({
    this.resolverDNSSECConfig,
  });
  factory GetResolverDnssecConfigResponse.fromJson(Map<String, dynamic> json) {
    return GetResolverDnssecConfigResponse(
      resolverDNSSECConfig: json['ResolverDNSSECConfig'] != null
          ? ResolverDnssecConfig.fromJson(
              json['ResolverDNSSECConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetResolverEndpointResponse {
  /// Information about the Resolver endpoint that you specified in a
  /// <code>GetResolverEndpoint</code> request.
  final ResolverEndpoint? resolverEndpoint;

  GetResolverEndpointResponse({
    this.resolverEndpoint,
  });
  factory GetResolverEndpointResponse.fromJson(Map<String, dynamic> json) {
    return GetResolverEndpointResponse(
      resolverEndpoint: json['ResolverEndpoint'] != null
          ? ResolverEndpoint.fromJson(
              json['ResolverEndpoint'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetResolverQueryLogConfigAssociationResponse {
  /// Information about the Resolver query logging configuration association that
  /// you specified in a <code>GetQueryLogConfigAssociation</code> request.
  final ResolverQueryLogConfigAssociation? resolverQueryLogConfigAssociation;

  GetResolverQueryLogConfigAssociationResponse({
    this.resolverQueryLogConfigAssociation,
  });
  factory GetResolverQueryLogConfigAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetResolverQueryLogConfigAssociationResponse(
      resolverQueryLogConfigAssociation:
          json['ResolverQueryLogConfigAssociation'] != null
              ? ResolverQueryLogConfigAssociation.fromJson(
                  json['ResolverQueryLogConfigAssociation']
                      as Map<String, dynamic>)
              : null,
    );
  }
}

class GetResolverQueryLogConfigPolicyResponse {
  /// Information about the query logging policy for the query logging
  /// configuration that you specified in a
  /// <code>GetResolverQueryLogConfigPolicy</code> request.
  final String? resolverQueryLogConfigPolicy;

  GetResolverQueryLogConfigPolicyResponse({
    this.resolverQueryLogConfigPolicy,
  });
  factory GetResolverQueryLogConfigPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return GetResolverQueryLogConfigPolicyResponse(
      resolverQueryLogConfigPolicy:
          json['ResolverQueryLogConfigPolicy'] as String?,
    );
  }
}

class GetResolverQueryLogConfigResponse {
  /// Information about the Resolver query logging configuration that you
  /// specified in a <code>GetQueryLogConfig</code> request.
  final ResolverQueryLogConfig? resolverQueryLogConfig;

  GetResolverQueryLogConfigResponse({
    this.resolverQueryLogConfig,
  });
  factory GetResolverQueryLogConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return GetResolverQueryLogConfigResponse(
      resolverQueryLogConfig: json['ResolverQueryLogConfig'] != null
          ? ResolverQueryLogConfig.fromJson(
              json['ResolverQueryLogConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetResolverRuleAssociationResponse {
  /// Information about the Resolver rule association that you specified in a
  /// <code>GetResolverRuleAssociation</code> request.
  final ResolverRuleAssociation? resolverRuleAssociation;

  GetResolverRuleAssociationResponse({
    this.resolverRuleAssociation,
  });
  factory GetResolverRuleAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetResolverRuleAssociationResponse(
      resolverRuleAssociation: json['ResolverRuleAssociation'] != null
          ? ResolverRuleAssociation.fromJson(
              json['ResolverRuleAssociation'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetResolverRulePolicyResponse {
  /// The Resolver rule policy for the rule that you specified in a
  /// <code>GetResolverRulePolicy</code> request.
  final String? resolverRulePolicy;

  GetResolverRulePolicyResponse({
    this.resolverRulePolicy,
  });
  factory GetResolverRulePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResolverRulePolicyResponse(
      resolverRulePolicy: json['ResolverRulePolicy'] as String?,
    );
  }
}

class GetResolverRuleResponse {
  /// Information about the Resolver rule that you specified in a
  /// <code>GetResolverRule</code> request.
  final ResolverRule? resolverRule;

  GetResolverRuleResponse({
    this.resolverRule,
  });
  factory GetResolverRuleResponse.fromJson(Map<String, dynamic> json) {
    return GetResolverRuleResponse(
      resolverRule: json['ResolverRule'] != null
          ? ResolverRule.fromJson(json['ResolverRule'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// In a <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverEndpoint.html">CreateResolverEndpoint</a>
/// request, the IP address that DNS queries originate from (for outbound
/// endpoints) or that you forward DNS queries to (for inbound endpoints).
/// <code>IpAddressRequest</code> also includes the ID of the subnet that
/// contains the IP address.
class IpAddressRequest {
  /// The ID of the subnet that contains the IP address.
  final String subnetId;

  /// The IP address that you want to use for DNS queries.
  final String? ip;

  IpAddressRequest({
    required this.subnetId,
    this.ip,
  });
  Map<String, dynamic> toJson() {
    final subnetId = this.subnetId;
    final ip = this.ip;
    return {
      'SubnetId': subnetId,
      if (ip != null) 'Ip': ip,
    };
  }
}

/// In the response to a <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html">GetResolverEndpoint</a>
/// request, information about the IP addresses that the Resolver endpoint uses
/// for DNS queries.
class IpAddressResponse {
  /// The date and time that the IP address was created, in Unix time format and
  /// Coordinated Universal Time (UTC).
  final String? creationTime;

  /// One IP address that the Resolver endpoint uses for DNS queries.
  final String? ip;

  /// The ID of one IP address.
  final String? ipId;

  /// The date and time that the IP address was last modified, in Unix time format
  /// and Coordinated Universal Time (UTC).
  final String? modificationTime;

  /// A status code that gives the current status of the request.
  final IpAddressStatus? status;

  /// A message that provides additional information about the status of the
  /// request.
  final String? statusMessage;

  /// The ID of one subnet.
  final String? subnetId;

  IpAddressResponse({
    this.creationTime,
    this.ip,
    this.ipId,
    this.modificationTime,
    this.status,
    this.statusMessage,
    this.subnetId,
  });
  factory IpAddressResponse.fromJson(Map<String, dynamic> json) {
    return IpAddressResponse(
      creationTime: json['CreationTime'] as String?,
      ip: json['Ip'] as String?,
      ipId: json['IpId'] as String?,
      modificationTime: json['ModificationTime'] as String?,
      status: (json['Status'] as String?)?.toIpAddressStatus(),
      statusMessage: json['StatusMessage'] as String?,
      subnetId: json['SubnetId'] as String?,
    );
  }
}

enum IpAddressStatus {
  creating,
  failedCreation,
  attaching,
  attached,
  remapDetaching,
  remapAttaching,
  detaching,
  failedResourceGone,
  deleting,
  deleteFailedFasExpired,
}

extension on IpAddressStatus {
  String toValue() {
    switch (this) {
      case IpAddressStatus.creating:
        return 'CREATING';
      case IpAddressStatus.failedCreation:
        return 'FAILED_CREATION';
      case IpAddressStatus.attaching:
        return 'ATTACHING';
      case IpAddressStatus.attached:
        return 'ATTACHED';
      case IpAddressStatus.remapDetaching:
        return 'REMAP_DETACHING';
      case IpAddressStatus.remapAttaching:
        return 'REMAP_ATTACHING';
      case IpAddressStatus.detaching:
        return 'DETACHING';
      case IpAddressStatus.failedResourceGone:
        return 'FAILED_RESOURCE_GONE';
      case IpAddressStatus.deleting:
        return 'DELETING';
      case IpAddressStatus.deleteFailedFasExpired:
        return 'DELETE_FAILED_FAS_EXPIRED';
    }
  }
}

extension on String {
  IpAddressStatus toIpAddressStatus() {
    switch (this) {
      case 'CREATING':
        return IpAddressStatus.creating;
      case 'FAILED_CREATION':
        return IpAddressStatus.failedCreation;
      case 'ATTACHING':
        return IpAddressStatus.attaching;
      case 'ATTACHED':
        return IpAddressStatus.attached;
      case 'REMAP_DETACHING':
        return IpAddressStatus.remapDetaching;
      case 'REMAP_ATTACHING':
        return IpAddressStatus.remapAttaching;
      case 'DETACHING':
        return IpAddressStatus.detaching;
      case 'FAILED_RESOURCE_GONE':
        return IpAddressStatus.failedResourceGone;
      case 'DELETING':
        return IpAddressStatus.deleting;
      case 'DELETE_FAILED_FAS_EXPIRED':
        return IpAddressStatus.deleteFailedFasExpired;
    }
    throw Exception('$this is not known in enum IpAddressStatus');
  }
}

/// In an <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_UpdateResolverEndpoint.html">UpdateResolverEndpoint</a>
/// request, information about an IP address to update.
class IpAddressUpdate {
  /// The new IP address.
  final String? ip;

  /// <i>Only when removing an IP address from a Resolver endpoint</i>: The ID of
  /// the IP address that you want to remove. To get this ID, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html">GetResolverEndpoint</a>.
  final String? ipId;

  /// The ID of the subnet that includes the IP address that you want to update.
  /// To get this ID, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html">GetResolverEndpoint</a>.
  final String? subnetId;

  IpAddressUpdate({
    this.ip,
    this.ipId,
    this.subnetId,
  });
  Map<String, dynamic> toJson() {
    final ip = this.ip;
    final ipId = this.ipId;
    final subnetId = this.subnetId;
    return {
      if (ip != null) 'Ip': ip,
      if (ipId != null) 'IpId': ipId,
      if (subnetId != null) 'SubnetId': subnetId,
    };
  }
}

class ListResolverDnssecConfigsResponse {
  /// If a response includes the last of the DNSSEC configurations that are
  /// associated with the current AWS account, <code>NextToken</code> doesn't
  /// appear in the response.
  ///
  /// If a response doesn't include the last of the configurations, you can get
  /// more configurations by submitting another <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_ListResolverDnssecConfigs.html">ListResolverDnssecConfigs</a>
  /// request. Get the value of <code>NextToken</code> that Amazon Route 53
  /// returned in the previous response and include it in <code>NextToken</code>
  /// in the next request.
  final String? nextToken;

  /// An array that contains one <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_ResolverDnssecConfig.html">ResolverDnssecConfig</a>
  /// element for each configuration for DNSSEC validation that is associated with
  /// the current AWS account.
  final List<ResolverDnssecConfig>? resolverDnssecConfigs;

  ListResolverDnssecConfigsResponse({
    this.nextToken,
    this.resolverDnssecConfigs,
  });
  factory ListResolverDnssecConfigsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListResolverDnssecConfigsResponse(
      nextToken: json['NextToken'] as String?,
      resolverDnssecConfigs: (json['ResolverDnssecConfigs'] as List?)
          ?.whereNotNull()
          .map((e) => ResolverDnssecConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListResolverEndpointIpAddressesResponse {
  /// Information about the IP addresses in your VPC that DNS queries originate
  /// from (for outbound endpoints) or that you forward DNS queries to (for
  /// inbound endpoints).
  final List<IpAddressResponse>? ipAddresses;

  /// The value that you specified for <code>MaxResults</code> in the request.
  final int? maxResults;

  /// If the specified endpoint has more than <code>MaxResults</code> IP
  /// addresses, you can submit another
  /// <code>ListResolverEndpointIpAddresses</code> request to get the next group
  /// of IP addresses. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  final String? nextToken;

  ListResolverEndpointIpAddressesResponse({
    this.ipAddresses,
    this.maxResults,
    this.nextToken,
  });
  factory ListResolverEndpointIpAddressesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListResolverEndpointIpAddressesResponse(
      ipAddresses: (json['IpAddresses'] as List?)
          ?.whereNotNull()
          .map((e) => IpAddressResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxResults: json['MaxResults'] as int?,
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListResolverEndpointsResponse {
  /// The value that you specified for <code>MaxResults</code> in the request.
  final int? maxResults;

  /// If more than <code>MaxResults</code> IP addresses match the specified
  /// criteria, you can submit another <code>ListResolverEndpoint</code> request
  /// to get the next group of results. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  final String? nextToken;

  /// The Resolver endpoints that were created by using the current AWS account,
  /// and that match the specified filters, if any.
  final List<ResolverEndpoint>? resolverEndpoints;

  ListResolverEndpointsResponse({
    this.maxResults,
    this.nextToken,
    this.resolverEndpoints,
  });
  factory ListResolverEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return ListResolverEndpointsResponse(
      maxResults: json['MaxResults'] as int?,
      nextToken: json['NextToken'] as String?,
      resolverEndpoints: (json['ResolverEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => ResolverEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListResolverQueryLogConfigAssociationsResponse {
  /// If there are more than <code>MaxResults</code> query logging associations,
  /// you can submit another <code>ListResolverQueryLogConfigAssociations</code>
  /// request to get the next group of associations. In the next request, specify
  /// the value of <code>NextToken</code> from the previous response.
  final String? nextToken;

  /// A list that contains one <code>ResolverQueryLogConfigAssociations</code>
  /// element for each query logging association that matches the values that you
  /// specified for <code>Filter</code>.
  final List<ResolverQueryLogConfigAssociation>?
      resolverQueryLogConfigAssociations;

  /// The total number of query logging associations that were created by the
  /// current account in the specified Region. This count can differ from the
  /// number of associations that are returned in a
  /// <code>ListResolverQueryLogConfigAssociations</code> response, depending on
  /// the values that you specify in the request.
  final int? totalCount;

  /// The total number of query logging associations that were created by the
  /// current account in the specified Region and that match the filters that were
  /// specified in the <code>ListResolverQueryLogConfigAssociations</code>
  /// request. For the total number of associations that were created by the
  /// current account in the specified Region, see <code>TotalCount</code>.
  final int? totalFilteredCount;

  ListResolverQueryLogConfigAssociationsResponse({
    this.nextToken,
    this.resolverQueryLogConfigAssociations,
    this.totalCount,
    this.totalFilteredCount,
  });
  factory ListResolverQueryLogConfigAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListResolverQueryLogConfigAssociationsResponse(
      nextToken: json['NextToken'] as String?,
      resolverQueryLogConfigAssociations:
          (json['ResolverQueryLogConfigAssociations'] as List?)
              ?.whereNotNull()
              .map((e) => ResolverQueryLogConfigAssociation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      totalCount: json['TotalCount'] as int?,
      totalFilteredCount: json['TotalFilteredCount'] as int?,
    );
  }
}

class ListResolverQueryLogConfigsResponse {
  /// If there are more than <code>MaxResults</code> query logging configurations,
  /// you can submit another <code>ListResolverQueryLogConfigs</code> request to
  /// get the next group of configurations. In the next request, specify the value
  /// of <code>NextToken</code> from the previous response.
  final String? nextToken;

  /// A list that contains one <code>ResolverQueryLogConfig</code> element for
  /// each query logging configuration that matches the values that you specified
  /// for <code>Filter</code>.
  final List<ResolverQueryLogConfig>? resolverQueryLogConfigs;

  /// The total number of query logging configurations that were created by the
  /// current account in the specified Region. This count can differ from the
  /// number of query logging configurations that are returned in a
  /// <code>ListResolverQueryLogConfigs</code> response, depending on the values
  /// that you specify in the request.
  final int? totalCount;

  /// The total number of query logging configurations that were created by the
  /// current account in the specified Region and that match the filters that were
  /// specified in the <code>ListResolverQueryLogConfigs</code> request. For the
  /// total number of query logging configurations that were created by the
  /// current account in the specified Region, see <code>TotalCount</code>.
  final int? totalFilteredCount;

  ListResolverQueryLogConfigsResponse({
    this.nextToken,
    this.resolverQueryLogConfigs,
    this.totalCount,
    this.totalFilteredCount,
  });
  factory ListResolverQueryLogConfigsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListResolverQueryLogConfigsResponse(
      nextToken: json['NextToken'] as String?,
      resolverQueryLogConfigs: (json['ResolverQueryLogConfigs'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ResolverQueryLogConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['TotalCount'] as int?,
      totalFilteredCount: json['TotalFilteredCount'] as int?,
    );
  }
}

class ListResolverRuleAssociationsResponse {
  /// The value that you specified for <code>MaxResults</code> in the request.
  final int? maxResults;

  /// If more than <code>MaxResults</code> rule associations match the specified
  /// criteria, you can submit another <code>ListResolverRuleAssociation</code>
  /// request to get the next group of results. In the next request, specify the
  /// value of <code>NextToken</code> from the previous response.
  final String? nextToken;

  /// The associations that were created between Resolver rules and VPCs using the
  /// current AWS account, and that match the specified filters, if any.
  final List<ResolverRuleAssociation>? resolverRuleAssociations;

  ListResolverRuleAssociationsResponse({
    this.maxResults,
    this.nextToken,
    this.resolverRuleAssociations,
  });
  factory ListResolverRuleAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListResolverRuleAssociationsResponse(
      maxResults: json['MaxResults'] as int?,
      nextToken: json['NextToken'] as String?,
      resolverRuleAssociations: (json['ResolverRuleAssociations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResolverRuleAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListResolverRulesResponse {
  /// The value that you specified for <code>MaxResults</code> in the request.
  final int? maxResults;

  /// If more than <code>MaxResults</code> Resolver rules match the specified
  /// criteria, you can submit another <code>ListResolverRules</code> request to
  /// get the next group of results. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  final String? nextToken;

  /// The Resolver rules that were created using the current AWS account and that
  /// match the specified filters, if any.
  final List<ResolverRule>? resolverRules;

  ListResolverRulesResponse({
    this.maxResults,
    this.nextToken,
    this.resolverRules,
  });
  factory ListResolverRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListResolverRulesResponse(
      maxResults: json['MaxResults'] as int?,
      nextToken: json['NextToken'] as String?,
      resolverRules: (json['ResolverRules'] as List?)
          ?.whereNotNull()
          .map((e) => ResolverRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListTagsForResourceResponse {
  /// If more than <code>MaxResults</code> tags match the specified criteria, you
  /// can submit another <code>ListTagsForResource</code> request to get the next
  /// group of results. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  final String? nextToken;

  /// The tags that are associated with the resource that you specified in the
  /// <code>ListTagsForResource</code> request.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The response to a <code>PutResolverQueryLogConfigPolicy</code> request.
class PutResolverQueryLogConfigPolicyResponse {
  /// Whether the <code>PutResolverQueryLogConfigPolicy</code> request was
  /// successful.
  final bool? returnValue;

  PutResolverQueryLogConfigPolicyResponse({
    this.returnValue,
  });
  factory PutResolverQueryLogConfigPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return PutResolverQueryLogConfigPolicyResponse(
      returnValue: json['ReturnValue'] as bool?,
    );
  }
}

/// The response to a <code>PutResolverRulePolicy</code> request.
class PutResolverRulePolicyResponse {
  /// Whether the <code>PutResolverRulePolicy</code> request was successful.
  final bool? returnValue;

  PutResolverRulePolicyResponse({
    this.returnValue,
  });
  factory PutResolverRulePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutResolverRulePolicyResponse(
      returnValue: json['ReturnValue'] as bool?,
    );
  }
}

enum ResolverDNSSECValidationStatus {
  enabling,
  enabled,
  disabling,
  disabled,
}

extension on ResolverDNSSECValidationStatus {
  String toValue() {
    switch (this) {
      case ResolverDNSSECValidationStatus.enabling:
        return 'ENABLING';
      case ResolverDNSSECValidationStatus.enabled:
        return 'ENABLED';
      case ResolverDNSSECValidationStatus.disabling:
        return 'DISABLING';
      case ResolverDNSSECValidationStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  ResolverDNSSECValidationStatus toResolverDNSSECValidationStatus() {
    switch (this) {
      case 'ENABLING':
        return ResolverDNSSECValidationStatus.enabling;
      case 'ENABLED':
        return ResolverDNSSECValidationStatus.enabled;
      case 'DISABLING':
        return ResolverDNSSECValidationStatus.disabling;
      case 'DISABLED':
        return ResolverDNSSECValidationStatus.disabled;
    }
    throw Exception(
        '$this is not known in enum ResolverDNSSECValidationStatus');
  }
}

/// A complex type that contains information about a configuration for DNSSEC
/// validation.
class ResolverDnssecConfig {
  /// The ID for a configuration for DNSSEC validation.
  final String? id;

  /// The owner account ID of the virtual private cloud (VPC) for a configuration
  /// for DNSSEC validation.
  final String? ownerId;

  /// The ID of the virtual private cloud (VPC) that you're configuring the DNSSEC
  /// validation status for.
  final String? resourceId;

  /// The validation status for a DNSSEC configuration. The status can be one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <b>ENABLING:</b> DNSSEC validation is being enabled but is not complete.
  /// </li>
  /// <li>
  /// <b>ENABLED:</b> DNSSEC validation is enabled.
  /// </li>
  /// <li>
  /// <b>DISABLING:</b> DNSSEC validation is being disabled but is not complete.
  /// </li>
  /// <li>
  /// <b>DISABLED</b> DNSSEC validation is disabled.
  /// </li>
  /// </ul>
  final ResolverDNSSECValidationStatus? validationStatus;

  ResolverDnssecConfig({
    this.id,
    this.ownerId,
    this.resourceId,
    this.validationStatus,
  });
  factory ResolverDnssecConfig.fromJson(Map<String, dynamic> json) {
    return ResolverDnssecConfig(
      id: json['Id'] as String?,
      ownerId: json['OwnerId'] as String?,
      resourceId: json['ResourceId'] as String?,
      validationStatus: (json['ValidationStatus'] as String?)
          ?.toResolverDNSSECValidationStatus(),
    );
  }
}

/// In the response to a <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverEndpoint.html">CreateResolverEndpoint</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DeleteResolverEndpoint.html">DeleteResolverEndpoint</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html">GetResolverEndpoint</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverEndpoints.html">ListResolverEndpoints</a>,
/// or <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_UpdateResolverEndpoint.html">UpdateResolverEndpoint</a>
/// request, a complex type that contains settings for an existing inbound or
/// outbound Resolver endpoint.
class ResolverEndpoint {
  /// The ARN (Amazon Resource Name) for the Resolver endpoint.
  final String? arn;

  /// The date and time that the endpoint was created, in Unix time format and
  /// Coordinated Universal Time (UTC).
  final String? creationTime;

  /// A unique string that identifies the request that created the Resolver
  /// endpoint. The <code>CreatorRequestId</code> allows failed requests to be
  /// retried without the risk of executing the operation twice.
  final String? creatorRequestId;

  /// Indicates whether the Resolver endpoint allows inbound or outbound DNS
  /// queries:
  ///
  /// <ul>
  /// <li>
  /// <code>INBOUND</code>: allows DNS queries to your VPC from your network
  /// </li>
  /// <li>
  /// <code>OUTBOUND</code>: allows DNS queries from your VPC to your network
  /// </li>
  /// </ul>
  final ResolverEndpointDirection? direction;

  /// The ID of the VPC that you want to create the Resolver endpoint in.
  final String? hostVPCId;

  /// The ID of the Resolver endpoint.
  final String? id;

  /// The number of IP addresses that the Resolver endpoint can use for DNS
  /// queries.
  final int? ipAddressCount;

  /// The date and time that the endpoint was last modified, in Unix time format
  /// and Coordinated Universal Time (UTC).
  final String? modificationTime;

  /// The name that you assigned to the Resolver endpoint when you submitted a <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverEndpoint.html">CreateResolverEndpoint</a>
  /// request.
  final String? name;

  /// The ID of one or more security groups that control access to this VPC. The
  /// security group must include one or more inbound rules (for inbound
  /// endpoints) or outbound rules (for outbound endpoints). Inbound and outbound
  /// rules must allow TCP and UDP access. For inbound access, open port 53. For
  /// outbound access, open the port that you're using for DNS queries on your
  /// network.
  final List<String>? securityGroupIds;

  /// A code that specifies the current status of the Resolver endpoint. Valid
  /// values include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code>: Resolver is creating and configuring one or more
  /// Amazon VPC network interfaces for this endpoint.
  /// </li>
  /// <li>
  /// <code>OPERATIONAL</code>: The Amazon VPC network interfaces for this
  /// endpoint are correctly configured and able to pass inbound or outbound DNS
  /// queries between your network and Resolver.
  /// </li>
  /// <li>
  /// <code>UPDATING</code>: Resolver is associating or disassociating one or more
  /// network interfaces with this endpoint.
  /// </li>
  /// <li>
  /// <code>AUTO_RECOVERING</code>: Resolver is trying to recover one or more of
  /// the network interfaces that are associated with this endpoint. During the
  /// recovery process, the endpoint functions with limited capacity because of
  /// the limit on the number of DNS queries per IP address (per network
  /// interface). For the current limit, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html#limits-api-entities-resolver">Limits
  /// on Route 53 Resolver</a>.
  /// </li>
  /// <li>
  /// <code>ACTION_NEEDED</code>: This endpoint is unhealthy, and Resolver can't
  /// automatically recover it. To resolve the problem, we recommend that you
  /// check each IP address that you associated with the endpoint. For each IP
  /// address that isn't available, add another IP address and then delete the IP
  /// address that isn't available. (An endpoint must always include at least two
  /// IP addresses.) A status of <code>ACTION_NEEDED</code> can have a variety of
  /// causes. Here are two common causes:
  ///
  /// <ul>
  /// <li>
  /// One or more of the network interfaces that are associated with the endpoint
  /// were deleted using Amazon VPC.
  /// </li>
  /// <li>
  /// The network interface couldn't be created for some reason that's outside the
  /// control of Resolver.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>DELETING</code>: Resolver is deleting this endpoint and the associated
  /// network interfaces.
  /// </li>
  /// </ul>
  final ResolverEndpointStatus? status;

  /// A detailed description of the status of the Resolver endpoint.
  final String? statusMessage;

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
  factory ResolverEndpoint.fromJson(Map<String, dynamic> json) {
    return ResolverEndpoint(
      arn: json['Arn'] as String?,
      creationTime: json['CreationTime'] as String?,
      creatorRequestId: json['CreatorRequestId'] as String?,
      direction: (json['Direction'] as String?)?.toResolverEndpointDirection(),
      hostVPCId: json['HostVPCId'] as String?,
      id: json['Id'] as String?,
      ipAddressCount: json['IpAddressCount'] as int?,
      modificationTime: json['ModificationTime'] as String?,
      name: json['Name'] as String?,
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['Status'] as String?)?.toResolverEndpointStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }
}

enum ResolverEndpointDirection {
  inbound,
  outbound,
}

extension on ResolverEndpointDirection {
  String toValue() {
    switch (this) {
      case ResolverEndpointDirection.inbound:
        return 'INBOUND';
      case ResolverEndpointDirection.outbound:
        return 'OUTBOUND';
    }
  }
}

extension on String {
  ResolverEndpointDirection toResolverEndpointDirection() {
    switch (this) {
      case 'INBOUND':
        return ResolverEndpointDirection.inbound;
      case 'OUTBOUND':
        return ResolverEndpointDirection.outbound;
    }
    throw Exception('$this is not known in enum ResolverEndpointDirection');
  }
}

enum ResolverEndpointStatus {
  creating,
  operational,
  updating,
  autoRecovering,
  actionNeeded,
  deleting,
}

extension on ResolverEndpointStatus {
  String toValue() {
    switch (this) {
      case ResolverEndpointStatus.creating:
        return 'CREATING';
      case ResolverEndpointStatus.operational:
        return 'OPERATIONAL';
      case ResolverEndpointStatus.updating:
        return 'UPDATING';
      case ResolverEndpointStatus.autoRecovering:
        return 'AUTO_RECOVERING';
      case ResolverEndpointStatus.actionNeeded:
        return 'ACTION_NEEDED';
      case ResolverEndpointStatus.deleting:
        return 'DELETING';
    }
  }
}

extension on String {
  ResolverEndpointStatus toResolverEndpointStatus() {
    switch (this) {
      case 'CREATING':
        return ResolverEndpointStatus.creating;
      case 'OPERATIONAL':
        return ResolverEndpointStatus.operational;
      case 'UPDATING':
        return ResolverEndpointStatus.updating;
      case 'AUTO_RECOVERING':
        return ResolverEndpointStatus.autoRecovering;
      case 'ACTION_NEEDED':
        return ResolverEndpointStatus.actionNeeded;
      case 'DELETING':
        return ResolverEndpointStatus.deleting;
    }
    throw Exception('$this is not known in enum ResolverEndpointStatus');
  }
}

/// In the response to a <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverQueryLogConfig.html">CreateResolverQueryLogConfig</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DeleteResolverQueryLogConfig.html">DeleteResolverQueryLogConfig</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverQueryLogConfig.html">GetResolverQueryLogConfig</a>,
/// or <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverQueryLogConfigs.html">ListResolverQueryLogConfigs</a>
/// request, a complex type that contains settings for one query logging
/// configuration.
class ResolverQueryLogConfig {
  /// The ARN for the query logging configuration.
  final String? arn;

  /// The number of VPCs that are associated with the query logging configuration.
  final int? associationCount;

  /// The date and time that the query logging configuration was created, in Unix
  /// time format and Coordinated Universal Time (UTC).
  final String? creationTime;

  /// A unique string that identifies the request that created the query logging
  /// configuration. The <code>CreatorRequestId</code> allows failed requests to
  /// be retried without the risk of executing the operation twice.
  final String? creatorRequestId;

  /// The ARN of the resource that you want Resolver to send query logs: an Amazon
  /// S3 bucket, a CloudWatch Logs log group, or a Kinesis Data Firehose delivery
  /// stream.
  final String? destinationArn;

  /// The ID for the query logging configuration.
  final String? id;

  /// The name of the query logging configuration.
  final String? name;

  /// The AWS account ID for the account that created the query logging
  /// configuration.
  final String? ownerId;

  /// An indication of whether the query logging configuration is shared with
  /// other AWS accounts, or was shared with the current account by another AWS
  /// account. Sharing is configured through AWS Resource Access Manager (AWS
  /// RAM).
  final ShareStatus? shareStatus;

  /// The status of the specified query logging configuration. Valid values
  /// include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code>: Resolver is creating the query logging configuration.
  /// </li>
  /// <li>
  /// <code>CREATED</code>: The query logging configuration was successfully
  /// created. Resolver is logging queries that originate in the specified VPC.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: Resolver is deleting this query logging
  /// configuration.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: Resolver can't deliver logs to the location that is
  /// specified in the query logging configuration. Here are two common causes:
  ///
  /// <ul>
  /// <li>
  /// The specified destination (for example, an Amazon S3 bucket) was deleted.
  /// </li>
  /// <li>
  /// Permissions don't allow sending logs to the destination.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final ResolverQueryLogConfigStatus? status;

  ResolverQueryLogConfig({
    this.arn,
    this.associationCount,
    this.creationTime,
    this.creatorRequestId,
    this.destinationArn,
    this.id,
    this.name,
    this.ownerId,
    this.shareStatus,
    this.status,
  });
  factory ResolverQueryLogConfig.fromJson(Map<String, dynamic> json) {
    return ResolverQueryLogConfig(
      arn: json['Arn'] as String?,
      associationCount: json['AssociationCount'] as int?,
      creationTime: json['CreationTime'] as String?,
      creatorRequestId: json['CreatorRequestId'] as String?,
      destinationArn: json['DestinationArn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      ownerId: json['OwnerId'] as String?,
      shareStatus: (json['ShareStatus'] as String?)?.toShareStatus(),
      status: (json['Status'] as String?)?.toResolverQueryLogConfigStatus(),
    );
  }
}

/// In the response to an <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverQueryLogConfig.html">AssociateResolverQueryLogConfig</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverQueryLogConfig.html">DisassociateResolverQueryLogConfig</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverQueryLogConfigAssociation.html">GetResolverQueryLogConfigAssociation</a>,
/// or <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverQueryLogConfigAssociations.html">ListResolverQueryLogConfigAssociations</a>,
/// request, a complex type that contains settings for a specified association
/// between an Amazon VPC and a query logging configuration.
class ResolverQueryLogConfigAssociation {
  /// The date and time that the VPC was associated with the query logging
  /// configuration, in Unix time format and Coordinated Universal Time (UTC).
  final String? creationTime;

  /// If the value of <code>Status</code> is <code>FAILED</code>, the value of
  /// <code>Error</code> indicates the cause:
  ///
  /// <ul>
  /// <li>
  /// <code>DESTINATION_NOT_FOUND</code>: The specified destination (for example,
  /// an Amazon S3 bucket) was deleted.
  /// </li>
  /// <li>
  /// <code>ACCESS_DENIED</code>: Permissions don't allow sending logs to the
  /// destination.
  /// </li>
  /// </ul>
  /// If the value of <code>Status</code> is a value other than
  /// <code>FAILED</code>, <code>Error</code> is null.
  final ResolverQueryLogConfigAssociationError? error;

  /// Contains additional information about the error. If the value or
  /// <code>Error</code> is null, the value of <code>ErrorMessage</code> also is
  /// null.
  final String? errorMessage;

  /// The ID of the query logging association.
  final String? id;

  /// The ID of the query logging configuration that a VPC is associated with.
  final String? resolverQueryLogConfigId;

  /// The ID of the Amazon VPC that is associated with the query logging
  /// configuration.
  final String? resourceId;

  /// The status of the specified query logging association. Valid values include
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code>: Resolver is creating an association between an Amazon
  /// VPC and a query logging configuration.
  /// </li>
  /// <li>
  /// <code>CREATED</code>: The association between an Amazon VPC and a query
  /// logging configuration was successfully created. Resolver is logging queries
  /// that originate in the specified VPC.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: Resolver is deleting this query logging association.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: Resolver either couldn't create or couldn't delete the
  /// query logging association.
  /// </li>
  /// </ul>
  final ResolverQueryLogConfigAssociationStatus? status;

  ResolverQueryLogConfigAssociation({
    this.creationTime,
    this.error,
    this.errorMessage,
    this.id,
    this.resolverQueryLogConfigId,
    this.resourceId,
    this.status,
  });
  factory ResolverQueryLogConfigAssociation.fromJson(
      Map<String, dynamic> json) {
    return ResolverQueryLogConfigAssociation(
      creationTime: json['CreationTime'] as String?,
      error: (json['Error'] as String?)
          ?.toResolverQueryLogConfigAssociationError(),
      errorMessage: json['ErrorMessage'] as String?,
      id: json['Id'] as String?,
      resolverQueryLogConfigId: json['ResolverQueryLogConfigId'] as String?,
      resourceId: json['ResourceId'] as String?,
      status: (json['Status'] as String?)
          ?.toResolverQueryLogConfigAssociationStatus(),
    );
  }
}

enum ResolverQueryLogConfigAssociationError {
  none,
  destinationNotFound,
  accessDenied,
  internalServiceError,
}

extension on ResolverQueryLogConfigAssociationError {
  String toValue() {
    switch (this) {
      case ResolverQueryLogConfigAssociationError.none:
        return 'NONE';
      case ResolverQueryLogConfigAssociationError.destinationNotFound:
        return 'DESTINATION_NOT_FOUND';
      case ResolverQueryLogConfigAssociationError.accessDenied:
        return 'ACCESS_DENIED';
      case ResolverQueryLogConfigAssociationError.internalServiceError:
        return 'INTERNAL_SERVICE_ERROR';
    }
  }
}

extension on String {
  ResolverQueryLogConfigAssociationError
      toResolverQueryLogConfigAssociationError() {
    switch (this) {
      case 'NONE':
        return ResolverQueryLogConfigAssociationError.none;
      case 'DESTINATION_NOT_FOUND':
        return ResolverQueryLogConfigAssociationError.destinationNotFound;
      case 'ACCESS_DENIED':
        return ResolverQueryLogConfigAssociationError.accessDenied;
      case 'INTERNAL_SERVICE_ERROR':
        return ResolverQueryLogConfigAssociationError.internalServiceError;
    }
    throw Exception(
        '$this is not known in enum ResolverQueryLogConfigAssociationError');
  }
}

enum ResolverQueryLogConfigAssociationStatus {
  creating,
  active,
  actionNeeded,
  deleting,
  failed,
}

extension on ResolverQueryLogConfigAssociationStatus {
  String toValue() {
    switch (this) {
      case ResolverQueryLogConfigAssociationStatus.creating:
        return 'CREATING';
      case ResolverQueryLogConfigAssociationStatus.active:
        return 'ACTIVE';
      case ResolverQueryLogConfigAssociationStatus.actionNeeded:
        return 'ACTION_NEEDED';
      case ResolverQueryLogConfigAssociationStatus.deleting:
        return 'DELETING';
      case ResolverQueryLogConfigAssociationStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  ResolverQueryLogConfigAssociationStatus
      toResolverQueryLogConfigAssociationStatus() {
    switch (this) {
      case 'CREATING':
        return ResolverQueryLogConfigAssociationStatus.creating;
      case 'ACTIVE':
        return ResolverQueryLogConfigAssociationStatus.active;
      case 'ACTION_NEEDED':
        return ResolverQueryLogConfigAssociationStatus.actionNeeded;
      case 'DELETING':
        return ResolverQueryLogConfigAssociationStatus.deleting;
      case 'FAILED':
        return ResolverQueryLogConfigAssociationStatus.failed;
    }
    throw Exception(
        '$this is not known in enum ResolverQueryLogConfigAssociationStatus');
  }
}

enum ResolverQueryLogConfigStatus {
  creating,
  created,
  deleting,
  failed,
}

extension on ResolverQueryLogConfigStatus {
  String toValue() {
    switch (this) {
      case ResolverQueryLogConfigStatus.creating:
        return 'CREATING';
      case ResolverQueryLogConfigStatus.created:
        return 'CREATED';
      case ResolverQueryLogConfigStatus.deleting:
        return 'DELETING';
      case ResolverQueryLogConfigStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  ResolverQueryLogConfigStatus toResolverQueryLogConfigStatus() {
    switch (this) {
      case 'CREATING':
        return ResolverQueryLogConfigStatus.creating;
      case 'CREATED':
        return ResolverQueryLogConfigStatus.created;
      case 'DELETING':
        return ResolverQueryLogConfigStatus.deleting;
      case 'FAILED':
        return ResolverQueryLogConfigStatus.failed;
    }
    throw Exception('$this is not known in enum ResolverQueryLogConfigStatus');
  }
}

/// For queries that originate in your VPC, detailed information about a
/// Resolver rule, which specifies how to route DNS queries out of the VPC. The
/// <code>ResolverRule</code> parameter appears in the response to a <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverRule.html">CreateResolverRule</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DeleteResolverRule.html">DeleteResolverRule</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverRule.html">GetResolverRule</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRules.html">ListResolverRules</a>,
/// or <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_UpdateResolverRule.html">UpdateResolverRule</a>
/// request.
class ResolverRule {
  /// The ARN (Amazon Resource Name) for the Resolver rule specified by
  /// <code>Id</code>.
  final String? arn;

  /// The date and time that the Resolver rule was created, in Unix time format
  /// and Coordinated Universal Time (UTC).
  final String? creationTime;

  /// A unique string that you specified when you created the Resolver rule.
  /// <code>CreatorRequestId</code> identifies the request and allows failed
  /// requests to be retried without the risk of executing the operation twice.
  final String? creatorRequestId;

  /// DNS queries for this domain name are forwarded to the IP addresses that are
  /// specified in <code>TargetIps</code>. If a query matches multiple Resolver
  /// rules (example.com and www.example.com), the query is routed using the
  /// Resolver rule that contains the most specific domain name (www.example.com).
  final String? domainName;

  /// The ID that Resolver assigned to the Resolver rule when you created it.
  final String? id;

  /// The date and time that the Resolver rule was last updated, in Unix time
  /// format and Coordinated Universal Time (UTC).
  final String? modificationTime;

  /// The name for the Resolver rule, which you specified when you created the
  /// Resolver rule.
  final String? name;

  /// When a rule is shared with another AWS account, the account ID of the
  /// account that the rule is shared with.
  final String? ownerId;

  /// The ID of the endpoint that the rule is associated with.
  final String? resolverEndpointId;

  /// When you want to forward DNS queries for specified domain name to resolvers
  /// on your network, specify <code>FORWARD</code>.
  ///
  /// When you have a forwarding rule to forward DNS queries for a domain to your
  /// network and you want Resolver to process queries for a subdomain of that
  /// domain, specify <code>SYSTEM</code>.
  ///
  /// For example, to forward DNS queries for example.com to resolvers on your
  /// network, you create a rule and specify <code>FORWARD</code> for
  /// <code>RuleType</code>. To then have Resolver process queries for
  /// apex.example.com, you create a rule and specify <code>SYSTEM</code> for
  /// <code>RuleType</code>.
  ///
  /// Currently, only Resolver can create rules that have a value of
  /// <code>RECURSIVE</code> for <code>RuleType</code>.
  final RuleTypeOption? ruleType;

  /// Whether the rules is shared and, if so, whether the current account is
  /// sharing the rule with another account, or another account is sharing the
  /// rule with the current account.
  final ShareStatus? shareStatus;

  /// A code that specifies the current status of the Resolver rule.
  final ResolverRuleStatus? status;

  /// A detailed description of the status of a Resolver rule.
  final String? statusMessage;

  /// An array that contains the IP addresses and ports that an outbound endpoint
  /// forwards DNS queries to. Typically, these are the IP addresses of DNS
  /// resolvers on your network. Specify IPv4 addresses. IPv6 is not supported.
  final List<TargetAddress>? targetIps;

  ResolverRule({
    this.arn,
    this.creationTime,
    this.creatorRequestId,
    this.domainName,
    this.id,
    this.modificationTime,
    this.name,
    this.ownerId,
    this.resolverEndpointId,
    this.ruleType,
    this.shareStatus,
    this.status,
    this.statusMessage,
    this.targetIps,
  });
  factory ResolverRule.fromJson(Map<String, dynamic> json) {
    return ResolverRule(
      arn: json['Arn'] as String?,
      creationTime: json['CreationTime'] as String?,
      creatorRequestId: json['CreatorRequestId'] as String?,
      domainName: json['DomainName'] as String?,
      id: json['Id'] as String?,
      modificationTime: json['ModificationTime'] as String?,
      name: json['Name'] as String?,
      ownerId: json['OwnerId'] as String?,
      resolverEndpointId: json['ResolverEndpointId'] as String?,
      ruleType: (json['RuleType'] as String?)?.toRuleTypeOption(),
      shareStatus: (json['ShareStatus'] as String?)?.toShareStatus(),
      status: (json['Status'] as String?)?.toResolverRuleStatus(),
      statusMessage: json['StatusMessage'] as String?,
      targetIps: (json['TargetIps'] as List?)
          ?.whereNotNull()
          .map((e) => TargetAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// In the response to an <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverRule.html">AssociateResolverRule</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverRule.html">DisassociateResolverRule</a>,
/// or <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRuleAssociations.html">ListResolverRuleAssociations</a>
/// request, provides information about an association between a Resolver rule
/// and a VPC. The association determines which DNS queries that originate in
/// the VPC are forwarded to your network.
class ResolverRuleAssociation {
  /// The ID of the association between a Resolver rule and a VPC. Resolver
  /// assigns this value when you submit an <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverRule.html">AssociateResolverRule</a>
  /// request.
  final String? id;

  /// The name of an association between a Resolver rule and a VPC.
  final String? name;

  /// The ID of the Resolver rule that you associated with the VPC that is
  /// specified by <code>VPCId</code>.
  final String? resolverRuleId;

  /// A code that specifies the current status of the association between a
  /// Resolver rule and a VPC.
  final ResolverRuleAssociationStatus? status;

  /// A detailed description of the status of the association between a Resolver
  /// rule and a VPC.
  final String? statusMessage;

  /// The ID of the VPC that you associated the Resolver rule with.
  final String? vPCId;

  ResolverRuleAssociation({
    this.id,
    this.name,
    this.resolverRuleId,
    this.status,
    this.statusMessage,
    this.vPCId,
  });
  factory ResolverRuleAssociation.fromJson(Map<String, dynamic> json) {
    return ResolverRuleAssociation(
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      resolverRuleId: json['ResolverRuleId'] as String?,
      status: (json['Status'] as String?)?.toResolverRuleAssociationStatus(),
      statusMessage: json['StatusMessage'] as String?,
      vPCId: json['VPCId'] as String?,
    );
  }
}

enum ResolverRuleAssociationStatus {
  creating,
  complete,
  deleting,
  failed,
  overridden,
}

extension on ResolverRuleAssociationStatus {
  String toValue() {
    switch (this) {
      case ResolverRuleAssociationStatus.creating:
        return 'CREATING';
      case ResolverRuleAssociationStatus.complete:
        return 'COMPLETE';
      case ResolverRuleAssociationStatus.deleting:
        return 'DELETING';
      case ResolverRuleAssociationStatus.failed:
        return 'FAILED';
      case ResolverRuleAssociationStatus.overridden:
        return 'OVERRIDDEN';
    }
  }
}

extension on String {
  ResolverRuleAssociationStatus toResolverRuleAssociationStatus() {
    switch (this) {
      case 'CREATING':
        return ResolverRuleAssociationStatus.creating;
      case 'COMPLETE':
        return ResolverRuleAssociationStatus.complete;
      case 'DELETING':
        return ResolverRuleAssociationStatus.deleting;
      case 'FAILED':
        return ResolverRuleAssociationStatus.failed;
      case 'OVERRIDDEN':
        return ResolverRuleAssociationStatus.overridden;
    }
    throw Exception('$this is not known in enum ResolverRuleAssociationStatus');
  }
}

/// In an <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_UpdateResolverRule.html">UpdateResolverRule</a>
/// request, information about the changes that you want to make.
class ResolverRuleConfig {
  /// The new name for the Resolver rule. The name that you specify appears in the
  /// Resolver dashboard in the Route 53 console.
  final String? name;

  /// The ID of the new outbound Resolver endpoint that you want to use to route
  /// DNS queries to the IP addresses that you specify in <code>TargetIps</code>.
  final String? resolverEndpointId;

  /// For DNS queries that originate in your VPC, the new IP addresses that you
  /// want to route outbound DNS queries to.
  final List<TargetAddress>? targetIps;

  ResolverRuleConfig({
    this.name,
    this.resolverEndpointId,
    this.targetIps,
  });
  Map<String, dynamic> toJson() {
    final name = this.name;
    final resolverEndpointId = this.resolverEndpointId;
    final targetIps = this.targetIps;
    return {
      if (name != null) 'Name': name,
      if (resolverEndpointId != null) 'ResolverEndpointId': resolverEndpointId,
      if (targetIps != null) 'TargetIps': targetIps,
    };
  }
}

enum ResolverRuleStatus {
  complete,
  deleting,
  updating,
  failed,
}

extension on ResolverRuleStatus {
  String toValue() {
    switch (this) {
      case ResolverRuleStatus.complete:
        return 'COMPLETE';
      case ResolverRuleStatus.deleting:
        return 'DELETING';
      case ResolverRuleStatus.updating:
        return 'UPDATING';
      case ResolverRuleStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  ResolverRuleStatus toResolverRuleStatus() {
    switch (this) {
      case 'COMPLETE':
        return ResolverRuleStatus.complete;
      case 'DELETING':
        return ResolverRuleStatus.deleting;
      case 'UPDATING':
        return ResolverRuleStatus.updating;
      case 'FAILED':
        return ResolverRuleStatus.failed;
    }
    throw Exception('$this is not known in enum ResolverRuleStatus');
  }
}

enum RuleTypeOption {
  forward,
  system,
  recursive,
}

extension on RuleTypeOption {
  String toValue() {
    switch (this) {
      case RuleTypeOption.forward:
        return 'FORWARD';
      case RuleTypeOption.system:
        return 'SYSTEM';
      case RuleTypeOption.recursive:
        return 'RECURSIVE';
    }
  }
}

extension on String {
  RuleTypeOption toRuleTypeOption() {
    switch (this) {
      case 'FORWARD':
        return RuleTypeOption.forward;
      case 'SYSTEM':
        return RuleTypeOption.system;
      case 'RECURSIVE':
        return RuleTypeOption.recursive;
    }
    throw Exception('$this is not known in enum RuleTypeOption');
  }
}

enum ShareStatus {
  notShared,
  sharedWithMe,
  sharedByMe,
}

extension on ShareStatus {
  String toValue() {
    switch (this) {
      case ShareStatus.notShared:
        return 'NOT_SHARED';
      case ShareStatus.sharedWithMe:
        return 'SHARED_WITH_ME';
      case ShareStatus.sharedByMe:
        return 'SHARED_BY_ME';
    }
  }
}

extension on String {
  ShareStatus toShareStatus() {
    switch (this) {
      case 'NOT_SHARED':
        return ShareStatus.notShared;
      case 'SHARED_WITH_ME':
        return ShareStatus.sharedWithMe;
      case 'SHARED_BY_ME':
        return ShareStatus.sharedByMe;
    }
    throw Exception('$this is not known in enum ShareStatus');
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
  }
}

extension on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASCENDING':
        return SortOrder.ascending;
      case 'DESCENDING':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

/// One tag that you want to add to the specified resource. A tag consists of a
/// <code>Key</code> (a name for the tag) and a <code>Value</code>.
class Tag {
  /// The name for the tag. For example, if you want to associate Resolver
  /// resources with the account IDs of your customers for billing purposes, the
  /// value of <code>Key</code> might be <code>account-id</code>.
  final String key;

  /// The value for the tag. For example, if <code>Key</code> is
  /// <code>account-id</code>, then <code>Value</code> might be the ID of the
  /// customer account that you're creating the resource for.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }
}

/// In a <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverRule.html">CreateResolverRule</a>
/// request, an array of the IPs that you want to forward DNS queries to.
class TargetAddress {
  /// One IP address that you want to forward DNS queries to. You can specify only
  /// IPv4 addresses.
  final String ip;

  /// The port at <code>Ip</code> that you want to forward DNS queries to.
  final int? port;

  TargetAddress({
    required this.ip,
    this.port,
  });
  factory TargetAddress.fromJson(Map<String, dynamic> json) {
    return TargetAddress(
      ip: json['Ip'] as String,
      port: json['Port'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final ip = this.ip;
    final port = this.port;
    return {
      'Ip': ip,
      if (port != null) 'Port': port,
    };
  }
}

class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

class UpdateResolverDnssecConfigResponse {
  /// A complex type that contains settings for the specified DNSSEC
  /// configuration.
  final ResolverDnssecConfig? resolverDNSSECConfig;

  UpdateResolverDnssecConfigResponse({
    this.resolverDNSSECConfig,
  });
  factory UpdateResolverDnssecConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateResolverDnssecConfigResponse(
      resolverDNSSECConfig: json['ResolverDNSSECConfig'] != null
          ? ResolverDnssecConfig.fromJson(
              json['ResolverDNSSECConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

class UpdateResolverEndpointResponse {
  /// The response to an <code>UpdateResolverEndpoint</code> request.
  final ResolverEndpoint? resolverEndpoint;

  UpdateResolverEndpointResponse({
    this.resolverEndpoint,
  });
  factory UpdateResolverEndpointResponse.fromJson(Map<String, dynamic> json) {
    return UpdateResolverEndpointResponse(
      resolverEndpoint: json['ResolverEndpoint'] != null
          ? ResolverEndpoint.fromJson(
              json['ResolverEndpoint'] as Map<String, dynamic>)
          : null,
    );
  }
}

class UpdateResolverRuleResponse {
  /// The response to an <code>UpdateResolverRule</code> request.
  final ResolverRule? resolverRule;

  UpdateResolverRuleResponse({
    this.resolverRule,
  });
  factory UpdateResolverRuleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateResolverRuleResponse(
      resolverRule: json['ResolverRule'] != null
          ? ResolverRule.fromJson(json['ResolverRule'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum Validation {
  enable,
  disable,
}

extension on Validation {
  String toValue() {
    switch (this) {
      case Validation.enable:
        return 'ENABLE';
      case Validation.disable:
        return 'DISABLE';
    }
  }
}

extension on String {
  Validation toValidation() {
    switch (this) {
      case 'ENABLE':
        return Validation.enable;
      case 'DISABLE':
        return Validation.disable;
    }
    throw Exception('$this is not known in enum Validation');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidPolicyDocument extends _s.GenericAwsException {
  InvalidPolicyDocument({String? type, String? message})
      : super(type: type, code: 'InvalidPolicyDocument', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class InvalidTagException extends _s.GenericAwsException {
  InvalidTagException({String? type, String? message})
      : super(type: type, code: 'InvalidTagException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceExistsException extends _s.GenericAwsException {
  ResourceExistsException({String? type, String? message})
      : super(type: type, code: 'ResourceExistsException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceUnavailableException extends _s.GenericAwsException {
  ResourceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ResourceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnknownResourceException extends _s.GenericAwsException {
  UnknownResourceException({String? type, String? message})
      : super(type: type, code: 'UnknownResourceException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
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
