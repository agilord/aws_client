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

part '2018-04-01.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'route53resolver',
          ),
          region: region,
          credentials: credentials,
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
    @_s.required String resolverQueryLogConfigId,
    @_s.required String resourceId,
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
        'Direction': direction?.toValue() ?? '',
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
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// requests to be retried without the risk of executing the operation twice.
  /// <code>CreatorRequestId</code> can be any unique string, for example, a
  /// date/time stamp.
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
  /// Parameter [tags] :
  /// A list of the tag keys and values that you want to associate with the
  /// query logging configuration.
  Future<CreateResolverQueryLogConfigResponse> createResolverQueryLogConfig({
    @_s.required String creatorRequestId,
    @_s.required String destinationArn,
    @_s.required String name,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(creatorRequestId, 'creatorRequestId');
    _s.validateStringLength(
      'creatorRequestId',
      creatorRequestId,
      1,
      255,
      isRequired: true,
    );
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
        'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
        'DestinationArn': destinationArn,
        'Name': name,
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
        'RuleType': ruleType?.toValue() ?? '',
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
    @_s.required String resolverEndpointId,
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
    @_s.required String resolverQueryLogConfigId,
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
    @_s.required String resolverRuleId,
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
    @_s.required String resolverQueryLogConfigId,
    @_s.required String resourceId,
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
    @_s.required String resolverRuleId,
    @_s.required String vPCId,
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
    @_s.required String resourceId,
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
    @_s.required String resolverEndpointId,
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
    @_s.required String resolverQueryLogConfigId,
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
    @_s.required String resolverQueryLogConfigAssociationId,
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
    @_s.required String arn,
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
    @_s.required String resolverRuleId,
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
    @_s.required String resolverRuleAssociationId,
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
    @_s.required String arn,
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
    List<Filter> filters,
    int maxResults,
    String nextToken,
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
    List<Filter> filters,
    int maxResults,
    String nextToken,
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
    List<Filter> filters,
    int maxResults,
    String nextToken,
    String sortBy,
    SortOrder sortOrder,
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
    List<Filter> filters,
    int maxResults,
    String nextToken,
    String sortBy,
    SortOrder sortOrder,
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
    List<Filter> filters,
    int maxResults,
    String nextToken,
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
    List<Filter> filters,
    int maxResults,
    String nextToken,
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
    @_s.required String arn,
    @_s.required String resolverQueryLogConfigPolicy,
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
    @_s.required String arn,
    @_s.required String resolverRulePolicy,
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
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
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
    @_s.required String resourceId,
    @_s.required Validation validation,
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
        'Validation': validation?.toValue() ?? '',
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
    @_s.required String resolverEndpointId,
    String name,
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
class AssociateResolverQueryLogConfigResponse {
  /// A complex type that contains settings for a specified association between an
  /// Amazon VPC and a query logging configuration.
  @_s.JsonKey(name: 'ResolverQueryLogConfigAssociation')
  final ResolverQueryLogConfigAssociation resolverQueryLogConfigAssociation;

  AssociateResolverQueryLogConfigResponse({
    this.resolverQueryLogConfigAssociation,
  });
  factory AssociateResolverQueryLogConfigResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateResolverQueryLogConfigResponseFromJson(json);
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
class CreateResolverQueryLogConfigResponse {
  /// Information about the <code>CreateResolverQueryLogConfig</code> request,
  /// including the status of the request.
  @_s.JsonKey(name: 'ResolverQueryLogConfig')
  final ResolverQueryLogConfig resolverQueryLogConfig;

  CreateResolverQueryLogConfigResponse({
    this.resolverQueryLogConfig,
  });
  factory CreateResolverQueryLogConfigResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateResolverQueryLogConfigResponseFromJson(json);
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
class DeleteResolverQueryLogConfigResponse {
  /// Information about the query logging configuration that you deleted,
  /// including the status of the request.
  @_s.JsonKey(name: 'ResolverQueryLogConfig')
  final ResolverQueryLogConfig resolverQueryLogConfig;

  DeleteResolverQueryLogConfigResponse({
    this.resolverQueryLogConfig,
  });
  factory DeleteResolverQueryLogConfigResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteResolverQueryLogConfigResponseFromJson(json);
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
class DisassociateResolverQueryLogConfigResponse {
  /// A complex type that contains settings for the association that you deleted
  /// between an Amazon VPC and a query logging configuration.
  @_s.JsonKey(name: 'ResolverQueryLogConfigAssociation')
  final ResolverQueryLogConfigAssociation resolverQueryLogConfigAssociation;

  DisassociateResolverQueryLogConfigResponse({
    this.resolverQueryLogConfigAssociation,
  });
  factory DisassociateResolverQueryLogConfigResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateResolverQueryLogConfigResponseFromJson(json);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'Name')
  final String name;

  /// When you're using a <code>List</code> operation and you want the operation
  /// to return a subset of objects, such as Resolver endpoints or Resolver rules,
  /// the value of the parameter that you want to use to filter objects. For
  /// example, to list only inbound Resolver endpoints, specify
  /// <code>Direction</code> for <code>Name</code> and specify
  /// <code>INBOUND</code> for <code>Values</code>.
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
class GetResolverDnssecConfigResponse {
  /// The information about a configuration for DNSSEC validation.
  @_s.JsonKey(name: 'ResolverDNSSECConfig')
  final ResolverDnssecConfig resolverDNSSECConfig;

  GetResolverDnssecConfigResponse({
    this.resolverDNSSECConfig,
  });
  factory GetResolverDnssecConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResolverDnssecConfigResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResolverEndpointResponse {
  /// Information about the Resolver endpoint that you specified in a
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
class GetResolverQueryLogConfigAssociationResponse {
  /// Information about the Resolver query logging configuration association that
  /// you specified in a <code>GetQueryLogConfigAssociation</code> request.
  @_s.JsonKey(name: 'ResolverQueryLogConfigAssociation')
  final ResolverQueryLogConfigAssociation resolverQueryLogConfigAssociation;

  GetResolverQueryLogConfigAssociationResponse({
    this.resolverQueryLogConfigAssociation,
  });
  factory GetResolverQueryLogConfigAssociationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetResolverQueryLogConfigAssociationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResolverQueryLogConfigPolicyResponse {
  /// Information about the query logging policy for the query logging
  /// configuration that you specified in a
  /// <code>GetResolverQueryLogConfigPolicy</code> request.
  @_s.JsonKey(name: 'ResolverQueryLogConfigPolicy')
  final String resolverQueryLogConfigPolicy;

  GetResolverQueryLogConfigPolicyResponse({
    this.resolverQueryLogConfigPolicy,
  });
  factory GetResolverQueryLogConfigPolicyResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetResolverQueryLogConfigPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResolverQueryLogConfigResponse {
  /// Information about the Resolver query logging configuration that you
  /// specified in a <code>GetQueryLogConfig</code> request.
  @_s.JsonKey(name: 'ResolverQueryLogConfig')
  final ResolverQueryLogConfig resolverQueryLogConfig;

  GetResolverQueryLogConfigResponse({
    this.resolverQueryLogConfig,
  });
  factory GetResolverQueryLogConfigResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetResolverQueryLogConfigResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResolverRuleAssociationResponse {
  /// Information about the Resolver rule association that you specified in a
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
  /// The Resolver rule policy for the rule that you specified in a
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
  /// Information about the Resolver rule that you specified in a
  /// <code>GetResolverRule</code> request.
  @_s.JsonKey(name: 'ResolverRule')
  final ResolverRule resolverRule;

  GetResolverRuleResponse({
    this.resolverRule,
  });
  factory GetResolverRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResolverRuleResponseFromJson(json);
}

/// In a <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverEndpoint.html">CreateResolverEndpoint</a>
/// request, the IP address that DNS queries originate from (for outbound
/// endpoints) or that you forward DNS queries to (for inbound endpoints).
/// <code>IpAddressRequest</code> also includes the ID of the subnet that
/// contains the IP address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class IpAddressRequest {
  /// The ID of the subnet that contains the IP address.
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

/// In the response to a <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html">GetResolverEndpoint</a>
/// request, information about the IP addresses that the Resolver endpoint uses
/// for DNS queries.
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

  /// One IP address that the Resolver endpoint uses for DNS queries.
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

/// In an <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_UpdateResolverEndpoint.html">UpdateResolverEndpoint</a>
/// request, information about an IP address to update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class IpAddressUpdate {
  /// The new IP address.
  @_s.JsonKey(name: 'Ip')
  final String ip;

  /// <i>Only when removing an IP address from a Resolver endpoint</i>: The ID of
  /// the IP address that you want to remove. To get this ID, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html">GetResolverEndpoint</a>.
  @_s.JsonKey(name: 'IpId')
  final String ipId;

  /// The ID of the subnet that includes the IP address that you want to update.
  /// To get this ID, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html">GetResolverEndpoint</a>.
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
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array that contains one <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_ResolverDnssecConfig.html">ResolverDnssecConfig</a>
  /// element for each configuration for DNSSEC validation that is associated with
  /// the current AWS account.
  @_s.JsonKey(name: 'ResolverDnssecConfigs')
  final List<ResolverDnssecConfig> resolverDnssecConfigs;

  ListResolverDnssecConfigsResponse({
    this.nextToken,
    this.resolverDnssecConfigs,
  });
  factory ListResolverDnssecConfigsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListResolverDnssecConfigsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResolverEndpointIpAddressesResponse {
  /// Information about the IP addresses in your VPC that DNS queries originate
  /// from (for outbound endpoints) or that you forward DNS queries to (for
  /// inbound endpoints).
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

  /// The Resolver endpoints that were created by using the current AWS account,
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
class ListResolverQueryLogConfigAssociationsResponse {
  /// If there are more than <code>MaxResults</code> query logging associations,
  /// you can submit another <code>ListResolverQueryLogConfigAssociations</code>
  /// request to get the next group of associations. In the next request, specify
  /// the value of <code>NextToken</code> from the previous response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list that contains one <code>ResolverQueryLogConfigAssociations</code>
  /// element for each query logging association that matches the values that you
  /// specified for <code>Filter</code>.
  @_s.JsonKey(name: 'ResolverQueryLogConfigAssociations')
  final List<ResolverQueryLogConfigAssociation>
      resolverQueryLogConfigAssociations;

  /// The total number of query logging associations that were created by the
  /// current account in the specified Region. This count can differ from the
  /// number of associations that are returned in a
  /// <code>ListResolverQueryLogConfigAssociations</code> response, depending on
  /// the values that you specify in the request.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  /// The total number of query logging associations that were created by the
  /// current account in the specified Region and that match the filters that were
  /// specified in the <code>ListResolverQueryLogConfigAssociations</code>
  /// request. For the total number of associations that were created by the
  /// current account in the specified Region, see <code>TotalCount</code>.
  @_s.JsonKey(name: 'TotalFilteredCount')
  final int totalFilteredCount;

  ListResolverQueryLogConfigAssociationsResponse({
    this.nextToken,
    this.resolverQueryLogConfigAssociations,
    this.totalCount,
    this.totalFilteredCount,
  });
  factory ListResolverQueryLogConfigAssociationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListResolverQueryLogConfigAssociationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResolverQueryLogConfigsResponse {
  /// If there are more than <code>MaxResults</code> query logging configurations,
  /// you can submit another <code>ListResolverQueryLogConfigs</code> request to
  /// get the next group of configurations. In the next request, specify the value
  /// of <code>NextToken</code> from the previous response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list that contains one <code>ResolverQueryLogConfig</code> element for
  /// each query logging configuration that matches the values that you specified
  /// for <code>Filter</code>.
  @_s.JsonKey(name: 'ResolverQueryLogConfigs')
  final List<ResolverQueryLogConfig> resolverQueryLogConfigs;

  /// The total number of query logging configurations that were created by the
  /// current account in the specified Region. This count can differ from the
  /// number of query logging configurations that are returned in a
  /// <code>ListResolverQueryLogConfigs</code> response, depending on the values
  /// that you specify in the request.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  /// The total number of query logging configurations that were created by the
  /// current account in the specified Region and that match the filters that were
  /// specified in the <code>ListResolverQueryLogConfigs</code> request. For the
  /// total number of query logging configurations that were created by the
  /// current account in the specified Region, see <code>TotalCount</code>.
  @_s.JsonKey(name: 'TotalFilteredCount')
  final int totalFilteredCount;

  ListResolverQueryLogConfigsResponse({
    this.nextToken,
    this.resolverQueryLogConfigs,
    this.totalCount,
    this.totalFilteredCount,
  });
  factory ListResolverQueryLogConfigsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListResolverQueryLogConfigsResponseFromJson(json);
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

  /// The associations that were created between Resolver rules and VPCs using the
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

  /// If more than <code>MaxResults</code> Resolver rules match the specified
  /// criteria, you can submit another <code>ListResolverRules</code> request to
  /// get the next group of results. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The Resolver rules that were created using the current AWS account and that
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

/// The response to a <code>PutResolverQueryLogConfigPolicy</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutResolverQueryLogConfigPolicyResponse {
  /// Whether the <code>PutResolverQueryLogConfigPolicy</code> request was
  /// successful.
  @_s.JsonKey(name: 'ReturnValue')
  final bool returnValue;

  PutResolverQueryLogConfigPolicyResponse({
    this.returnValue,
  });
  factory PutResolverQueryLogConfigPolicyResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutResolverQueryLogConfigPolicyResponseFromJson(json);
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

enum ResolverDNSSECValidationStatus {
  @_s.JsonValue('ENABLING')
  enabling,
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLING')
  disabling,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// A complex type that contains information about a configuration for DNSSEC
/// validation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolverDnssecConfig {
  /// The ID for a configuration for DNSSEC validation.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The owner account ID of the virtual private cloud (VPC) for a configuration
  /// for DNSSEC validation.
  @_s.JsonKey(name: 'OwnerId')
  final String ownerId;

  /// The ID of the virtual private cloud (VPC) that you're configuring the DNSSEC
  /// validation status for.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

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
  @_s.JsonKey(name: 'ValidationStatus')
  final ResolverDNSSECValidationStatus validationStatus;

  ResolverDnssecConfig({
    this.id,
    this.ownerId,
    this.resourceId,
    this.validationStatus,
  });
  factory ResolverDnssecConfig.fromJson(Map<String, dynamic> json) =>
      _$ResolverDnssecConfigFromJson(json);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolverEndpoint {
  /// The ARN (Amazon Resource Name) for the Resolver endpoint.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time that the endpoint was created, in Unix time format and
  /// Coordinated Universal Time (UTC).
  @_s.JsonKey(name: 'CreationTime')
  final String creationTime;

  /// A unique string that identifies the request that created the Resolver
  /// endpoint. The <code>CreatorRequestId</code> allows failed requests to be
  /// retried without the risk of executing the operation twice.
  @_s.JsonKey(name: 'CreatorRequestId')
  final String creatorRequestId;

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
  @_s.JsonKey(name: 'Direction')
  final ResolverEndpointDirection direction;

  /// The ID of the VPC that you want to create the Resolver endpoint in.
  @_s.JsonKey(name: 'HostVPCId')
  final String hostVPCId;

  /// The ID of the Resolver endpoint.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The number of IP addresses that the Resolver endpoint can use for DNS
  /// queries.
  @_s.JsonKey(name: 'IpAddressCount')
  final int ipAddressCount;

  /// The date and time that the endpoint was last modified, in Unix time format
  /// and Coordinated Universal Time (UTC).
  @_s.JsonKey(name: 'ModificationTime')
  final String modificationTime;

  /// The name that you assigned to the Resolver endpoint when you submitted a <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverEndpoint.html">CreateResolverEndpoint</a>
  /// request.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of one or more security groups that control access to this VPC. The
  /// security group must include one or more inbound rules (for inbound
  /// endpoints) or outbound rules (for outbound endpoints). Inbound and outbound
  /// rules must allow TCP and UDP access. For inbound access, open port 53. For
  /// outbound access, open the port that you're using for DNS queries on your
  /// network.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

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
  @_s.JsonKey(name: 'Status')
  final ResolverEndpointStatus status;

  /// A detailed description of the status of the Resolver endpoint.
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

extension on ResolverEndpointDirection {
  String toValue() {
    switch (this) {
      case ResolverEndpointDirection.inbound:
        return 'INBOUND';
      case ResolverEndpointDirection.outbound:
        return 'OUTBOUND';
    }
    throw Exception('Unknown enum value: $this');
  }
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolverQueryLogConfig {
  /// The ARN for the query logging configuration.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The number of VPCs that are associated with the query logging configuration.
  @_s.JsonKey(name: 'AssociationCount')
  final int associationCount;

  /// The date and time that the query logging configuration was created, in Unix
  /// time format and Coordinated Universal Time (UTC).
  @_s.JsonKey(name: 'CreationTime')
  final String creationTime;

  /// A unique string that identifies the request that created the query logging
  /// configuration. The <code>CreatorRequestId</code> allows failed requests to
  /// be retried without the risk of executing the operation twice.
  @_s.JsonKey(name: 'CreatorRequestId')
  final String creatorRequestId;

  /// The ARN of the resource that you want Resolver to send query logs: an Amazon
  /// S3 bucket, a CloudWatch Logs log group, or a Kinesis Data Firehose delivery
  /// stream.
  @_s.JsonKey(name: 'DestinationArn')
  final String destinationArn;

  /// The ID for the query logging configuration.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the query logging configuration.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The AWS account ID for the account that created the query logging
  /// configuration.
  @_s.JsonKey(name: 'OwnerId')
  final String ownerId;

  /// An indication of whether the query logging configuration is shared with
  /// other AWS accounts, or was shared with the current account by another AWS
  /// account. Sharing is configured through AWS Resource Access Manager (AWS
  /// RAM).
  @_s.JsonKey(name: 'ShareStatus')
  final ShareStatus shareStatus;

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
  @_s.JsonKey(name: 'Status')
  final ResolverQueryLogConfigStatus status;

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
  factory ResolverQueryLogConfig.fromJson(Map<String, dynamic> json) =>
      _$ResolverQueryLogConfigFromJson(json);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolverQueryLogConfigAssociation {
  /// The date and time that the VPC was associated with the query logging
  /// configuration, in Unix time format and Coordinated Universal Time (UTC).
  @_s.JsonKey(name: 'CreationTime')
  final String creationTime;

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
  @_s.JsonKey(name: 'Error')
  final ResolverQueryLogConfigAssociationError error;

  /// Contains additional information about the error. If the value or
  /// <code>Error</code> is null, the value of <code>ErrorMessage</code> also is
  /// null.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The ID of the query logging association.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ID of the query logging configuration that a VPC is associated with.
  @_s.JsonKey(name: 'ResolverQueryLogConfigId')
  final String resolverQueryLogConfigId;

  /// The ID of the Amazon VPC that is associated with the query logging
  /// configuration.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

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
  @_s.JsonKey(name: 'Status')
  final ResolverQueryLogConfigAssociationStatus status;

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
          Map<String, dynamic> json) =>
      _$ResolverQueryLogConfigAssociationFromJson(json);
}

enum ResolverQueryLogConfigAssociationError {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('DESTINATION_NOT_FOUND')
  destinationNotFound,
  @_s.JsonValue('ACCESS_DENIED')
  accessDenied,
  @_s.JsonValue('INTERNAL_SERVICE_ERROR')
  internalServiceError,
}

enum ResolverQueryLogConfigAssociationStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('ACTION_NEEDED')
  actionNeeded,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('FAILED')
  failed,
}

enum ResolverQueryLogConfigStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('CREATED')
  created,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('FAILED')
  failed,
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolverRule {
  /// The ARN (Amazon Resource Name) for the Resolver rule specified by
  /// <code>Id</code>.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time that the Resolver rule was created, in Unix time format
  /// and Coordinated Universal Time (UTC).
  @_s.JsonKey(name: 'CreationTime')
  final String creationTime;

  /// A unique string that you specified when you created the Resolver rule.
  /// <code>CreatorRequestId</code> identifies the request and allows failed
  /// requests to be retried without the risk of executing the operation twice.
  @_s.JsonKey(name: 'CreatorRequestId')
  final String creatorRequestId;

  /// DNS queries for this domain name are forwarded to the IP addresses that are
  /// specified in <code>TargetIps</code>. If a query matches multiple Resolver
  /// rules (example.com and www.example.com), the query is routed using the
  /// Resolver rule that contains the most specific domain name (www.example.com).
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The ID that Resolver assigned to the Resolver rule when you created it.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The date and time that the Resolver rule was last updated, in Unix time
  /// format and Coordinated Universal Time (UTC).
  @_s.JsonKey(name: 'ModificationTime')
  final String modificationTime;

  /// The name for the Resolver rule, which you specified when you created the
  /// Resolver rule.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// When a rule is shared with another AWS account, the account ID of the
  /// account that the rule is shared with.
  @_s.JsonKey(name: 'OwnerId')
  final String ownerId;

  /// The ID of the endpoint that the rule is associated with.
  @_s.JsonKey(name: 'ResolverEndpointId')
  final String resolverEndpointId;

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
  @_s.JsonKey(name: 'RuleType')
  final RuleTypeOption ruleType;

  /// Whether the rules is shared and, if so, whether the current account is
  /// sharing the rule with another account, or another account is sharing the
  /// rule with the current account.
  @_s.JsonKey(name: 'ShareStatus')
  final ShareStatus shareStatus;

  /// A code that specifies the current status of the Resolver rule.
  @_s.JsonKey(name: 'Status')
  final ResolverRuleStatus status;

  /// A detailed description of the status of a Resolver rule.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// An array that contains the IP addresses and ports that an outbound endpoint
  /// forwards DNS queries to. Typically, these are the IP addresses of DNS
  /// resolvers on your network. Specify IPv4 addresses. IPv6 is not supported.
  @_s.JsonKey(name: 'TargetIps')
  final List<TargetAddress> targetIps;

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
  factory ResolverRule.fromJson(Map<String, dynamic> json) =>
      _$ResolverRuleFromJson(json);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolverRuleAssociation {
  /// The ID of the association between a Resolver rule and a VPC. Resolver
  /// assigns this value when you submit an <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverRule.html">AssociateResolverRule</a>
  /// request.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of an association between a Resolver rule and a VPC.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the Resolver rule that you associated with the VPC that is
  /// specified by <code>VPCId</code>.
  @_s.JsonKey(name: 'ResolverRuleId')
  final String resolverRuleId;

  /// A code that specifies the current status of the association between a
  /// Resolver rule and a VPC.
  @_s.JsonKey(name: 'Status')
  final ResolverRuleAssociationStatus status;

  /// A detailed description of the status of the association between a Resolver
  /// rule and a VPC.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// The ID of the VPC that you associated the Resolver rule with.
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

/// In an <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_UpdateResolverRule.html">UpdateResolverRule</a>
/// request, information about the changes that you want to make.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ResolverRuleConfig {
  /// The new name for the Resolver rule. The name that you specify appears in the
  /// Resolver dashboard in the Route 53 console.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the new outbound Resolver endpoint that you want to use to route
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
    throw Exception('Unknown enum value: $this');
  }
}

enum ShareStatus {
  @_s.JsonValue('NOT_SHARED')
  notShared,
  @_s.JsonValue('SHARED_WITH_ME')
  sharedWithMe,
  @_s.JsonValue('SHARED_BY_ME')
  sharedByMe,
}

enum SortOrder {
  @_s.JsonValue('ASCENDING')
  ascending,
  @_s.JsonValue('DESCENDING')
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
    throw Exception('Unknown enum value: $this');
  }
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
    @_s.required this.key,
    @_s.required this.value,
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

/// In a <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverRule.html">CreateResolverRule</a>
/// request, an array of the IPs that you want to forward DNS queries to.
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
class UpdateResolverDnssecConfigResponse {
  /// A complex type that contains settings for the specified DNSSEC
  /// configuration.
  @_s.JsonKey(name: 'ResolverDNSSECConfig')
  final ResolverDnssecConfig resolverDNSSECConfig;

  UpdateResolverDnssecConfigResponse({
    this.resolverDNSSECConfig,
  });
  factory UpdateResolverDnssecConfigResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateResolverDnssecConfigResponseFromJson(json);
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

enum Validation {
  @_s.JsonValue('ENABLE')
  enable,
  @_s.JsonValue('DISABLE')
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
    throw Exception('Unknown enum value: $this');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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
