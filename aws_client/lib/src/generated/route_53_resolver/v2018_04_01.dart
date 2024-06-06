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

/// When you create a VPC using Amazon VPC, you automatically get DNS resolution
/// within the VPC from Route 53 Resolver. By default, Resolver answers DNS
/// queries for VPC domain names such as domain names for EC2 instances or
/// Elastic Load Balancing load balancers. Resolver performs recursive lookups
/// against public name servers for all other domain names.
///
/// You can also configure DNS resolution between your VPC and your network over
/// a Direct Connect or VPN connection:
///
/// <b>Forward DNS queries from resolvers on your network to Route 53
/// Resolver</b>
///
/// DNS resolvers on your network can forward DNS queries to Resolver in a
/// specified VPC. This allows your DNS resolvers to easily resolve domain names
/// for Amazon Web Services resources such as EC2 instances or records in a
/// Route 53 private hosted zone. For more information, see <a
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
/// Like Amazon VPC, Resolver is Regional. In each Region where you have VPCs,
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

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Associates a <a>FirewallRuleGroup</a> with a VPC, to provide DNS filtering
  /// for the VPC.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallRuleGroupId] :
  /// The unique identifier of the firewall rule group.
  ///
  /// Parameter [name] :
  /// A name that lets you identify the association, to manage and use it.
  ///
  /// Parameter [priority] :
  /// The setting that determines the processing order of the rule group among
  /// the rule groups that you associate with the specified VPC. DNS Firewall
  /// filters VPC traffic starting from the rule group with the lowest numeric
  /// priority setting.
  ///
  /// You must specify a unique priority for each rule group that you associate
  /// with a single VPC. To make it easier to insert rule groups later, leave
  /// space between the numbers, for example, use 101, 200, and so on. You can
  /// change the priority setting for a rule group association after you create
  /// it.
  ///
  /// The allowed values for <code>Priority</code> are between 100 and 9900.
  ///
  /// Parameter [vpcId] :
  /// The unique identifier of the VPC that you want to associate with the rule
  /// group.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// requests to be retried without the risk of running the operation twice.
  /// <code>CreatorRequestId</code> can be any unique string, for example, a
  /// date/time stamp.
  ///
  /// Parameter [mutationProtection] :
  /// If enabled, this setting disallows modification or removal of the
  /// association, to help prevent against accidentally altering DNS firewall
  /// protections. When you create the association, the default setting is
  /// <code>DISABLED</code>.
  ///
  /// Parameter [tags] :
  /// A list of the tag keys and values that you want to associate with the rule
  /// group association.
  Future<AssociateFirewallRuleGroupResponse> associateFirewallRuleGroup({
    required String firewallRuleGroupId,
    required String name,
    required int priority,
    required String vpcId,
    String? creatorRequestId,
    MutationProtectionStatus? mutationProtection,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.AssociateFirewallRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallRuleGroupId': firewallRuleGroupId,
        'Name': name,
        'Priority': priority,
        'VpcId': vpcId,
        'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
        if (mutationProtection != null)
          'MutationProtection': mutationProtection.toValue(),
        if (tags != null) 'Tags': tags,
      },
    );

    return AssociateFirewallRuleGroupResponse.fromJson(jsonResponse.body);
  }

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

  /// Creates an empty firewall domain list for use in DNS Firewall rules. You
  /// can populate the domains for the new list with a file, using
  /// <a>ImportFirewallDomains</a>, or with domain strings, using
  /// <a>UpdateFirewallDomains</a>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// A name that lets you identify the domain list to manage and use it.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows you to retry
  /// failed requests without the risk of running the operation twice.
  /// <code>CreatorRequestId</code> can be any unique string, for example, a
  /// date/time stamp.
  ///
  /// Parameter [tags] :
  /// A list of the tag keys and values that you want to associate with the
  /// domain list.
  Future<CreateFirewallDomainListResponse> createFirewallDomainList({
    required String name,
    String? creatorRequestId,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.CreateFirewallDomainList'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateFirewallDomainListResponse.fromJson(jsonResponse.body);
  }

  /// Creates a single DNS Firewall rule in the specified rule group, using the
  /// specified domain list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [action] :
  /// The action that DNS Firewall should take on a DNS query when it matches
  /// one of the domains in the rule's domain list:
  ///
  /// <ul>
  /// <li>
  /// <code>ALLOW</code> - Permit the request to go through.
  /// </li>
  /// <li>
  /// <code>ALERT</code> - Permit the request and send metrics and logs to Cloud
  /// Watch.
  /// </li>
  /// <li>
  /// <code>BLOCK</code> - Disallow the request. This option requires additional
  /// details in the rule's <code>BlockResponse</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [firewallDomainListId] :
  /// The ID of the domain list that you want to use in the rule.
  ///
  /// Parameter [firewallRuleGroupId] :
  /// The unique identifier of the firewall rule group where you want to create
  /// the rule.
  ///
  /// Parameter [name] :
  /// A name that lets you identify the rule in the rule group.
  ///
  /// Parameter [priority] :
  /// The setting that determines the processing order of the rule in the rule
  /// group. DNS Firewall processes the rules in a rule group by order of
  /// priority, starting from the lowest setting.
  ///
  /// You must specify a unique priority for each rule in a rule group. To make
  /// it easier to insert rules later, leave space between the numbers, for
  /// example, use 100, 200, and so on. You can change the priority setting for
  /// the rules in a rule group at any time.
  ///
  /// Parameter [blockOverrideDnsType] :
  /// The DNS record's type. This determines the format of the record value that
  /// you provided in <code>BlockOverrideDomain</code>. Used for the rule action
  /// <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  ///
  /// This setting is required if the <code>BlockResponse</code> setting is
  /// <code>OVERRIDE</code>.
  ///
  /// Parameter [blockOverrideDomain] :
  /// The custom DNS record to send back in response to the query. Used for the
  /// rule action <code>BLOCK</code> with a <code>BlockResponse</code> setting
  /// of <code>OVERRIDE</code>.
  ///
  /// This setting is required if the <code>BlockResponse</code> setting is
  /// <code>OVERRIDE</code>.
  ///
  /// Parameter [blockOverrideTtl] :
  /// The recommended amount of time, in seconds, for the DNS resolver or web
  /// browser to cache the provided override record. Used for the rule action
  /// <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  ///
  /// This setting is required if the <code>BlockResponse</code> setting is
  /// <code>OVERRIDE</code>.
  ///
  /// Parameter [blockResponse] :
  /// The way that you want DNS Firewall to block the request, used with the
  /// rule action setting <code>BLOCK</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>NODATA</code> - Respond indicating that the query was successful,
  /// but no response is available for it.
  /// </li>
  /// <li>
  /// <code>NXDOMAIN</code> - Respond indicating that the domain name that's in
  /// the query doesn't exist.
  /// </li>
  /// <li>
  /// <code>OVERRIDE</code> - Provide a custom override in the response. This
  /// option requires custom handling details in the rule's
  /// <code>BlockOverride*</code> settings.
  /// </li>
  /// </ul>
  /// This setting is required if the rule action setting is <code>BLOCK</code>.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows you to retry
  /// failed requests without the risk of running the operation twice.
  /// <code>CreatorRequestId</code> can be any unique string, for example, a
  /// date/time stamp.
  ///
  /// Parameter [firewallDomainRedirectionAction] :
  /// How you want the the rule to evaluate DNS redirection in the DNS
  /// redirection chain, such as CNAME or DNAME.
  ///
  /// <code>Inspect_Redirection_Domain </code>(Default) inspects all domains in
  /// the redirection chain. The individual domains in the redirection chain
  /// must be added to the domain list.
  ///
  /// <code>Trust_Redirection_Domain </code> inspects only the first domain in
  /// the redirection chain. You don't need to add the subsequent domains in the
  /// domain in the redirection list to the domain list.
  ///
  /// Parameter [qtype] :
  /// The DNS query type you want the rule to evaluate. Allowed values are;
  ///
  /// <ul>
  /// <li>
  /// A: Returns an IPv4 address.
  /// </li>
  /// <li>
  /// AAAA: Returns an Ipv6 address.
  /// </li>
  /// <li>
  /// CAA: Restricts CAs that can create SSL/TLS certifications for the domain.
  /// </li>
  /// <li>
  /// CNAME: Returns another domain name.
  /// </li>
  /// <li>
  /// DS: Record that identifies the DNSSEC signing key of a delegated zone.
  /// </li>
  /// <li>
  /// MX: Specifies mail servers.
  /// </li>
  /// <li>
  /// NAPTR: Regular-expression-based rewriting of domain names.
  /// </li>
  /// <li>
  /// NS: Authoritative name servers.
  /// </li>
  /// <li>
  /// PTR: Maps an IP address to a domain name.
  /// </li>
  /// <li>
  /// SOA: Start of authority record for the zone.
  /// </li>
  /// <li>
  /// SPF: Lists the servers authorized to send emails from a domain.
  /// </li>
  /// <li>
  /// SRV: Application specific values that identify servers.
  /// </li>
  /// <li>
  /// TXT: Verifies email senders and application-specific values.
  /// </li>
  /// <li>
  /// A query type you define by using the DNS type ID, for example 28 for AAAA.
  /// The values must be defined as TYPENUMBER, where the NUMBER can be 1-65334,
  /// for example, TYPE28. For more information, see <a
  /// href="https://en.wikipedia.org/wiki/List_of_DNS_record_types">List of DNS
  /// record types</a>.
  /// </li>
  /// </ul>
  Future<CreateFirewallRuleResponse> createFirewallRule({
    required Action action,
    required String firewallDomainListId,
    required String firewallRuleGroupId,
    required String name,
    required int priority,
    BlockOverrideDnsType? blockOverrideDnsType,
    String? blockOverrideDomain,
    int? blockOverrideTtl,
    BlockResponse? blockResponse,
    String? creatorRequestId,
    FirewallDomainRedirectionAction? firewallDomainRedirectionAction,
    String? qtype,
  }) async {
    _s.validateNumRange(
      'blockOverrideTtl',
      blockOverrideTtl,
      0,
      604800,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.CreateFirewallRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Action': action.toValue(),
        'FirewallDomainListId': firewallDomainListId,
        'FirewallRuleGroupId': firewallRuleGroupId,
        'Name': name,
        'Priority': priority,
        if (blockOverrideDnsType != null)
          'BlockOverrideDnsType': blockOverrideDnsType.toValue(),
        if (blockOverrideDomain != null)
          'BlockOverrideDomain': blockOverrideDomain,
        if (blockOverrideTtl != null) 'BlockOverrideTtl': blockOverrideTtl,
        if (blockResponse != null) 'BlockResponse': blockResponse.toValue(),
        'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
        if (firewallDomainRedirectionAction != null)
          'FirewallDomainRedirectionAction':
              firewallDomainRedirectionAction.toValue(),
        if (qtype != null) 'Qtype': qtype,
      },
    );

    return CreateFirewallRuleResponse.fromJson(jsonResponse.body);
  }

  /// Creates an empty DNS Firewall rule group for filtering DNS network traffic
  /// in a VPC. You can add rules to the new rule group by calling
  /// <a>CreateFirewallRule</a>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// A name that lets you identify the rule group, to manage and use it.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string defined by you to identify the request. This allows you to
  /// retry failed requests without the risk of running the operation twice.
  /// This can be any unique string, for example, a timestamp.
  ///
  /// Parameter [tags] :
  /// A list of the tag keys and values that you want to associate with the rule
  /// group.
  Future<CreateFirewallRuleGroupResponse> createFirewallRuleGroup({
    required String name,
    String? creatorRequestId,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.CreateFirewallRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateFirewallRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a Route 53 Resolver on an Outpost.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// requests to be retried without the risk of running the operation twice.
  ///
  /// <code>CreatorRequestId</code> can be any unique string, for example, a
  /// date/time stamp.
  ///
  /// Parameter [name] :
  /// A friendly name that lets you easily find a configuration in the Resolver
  /// dashboard in the Route 53 console.
  ///
  /// Parameter [outpostArn] :
  /// The Amazon Resource Name (ARN) of the Outpost. If you specify this, you
  /// must also specify a value for the <code>PreferredInstanceType</code>.
  ///
  /// Parameter [preferredInstanceType] :
  /// The Amazon EC2 instance type. If you specify this, you must also specify a
  /// value for the <code>OutpostArn</code>.
  ///
  /// Parameter [instanceCount] :
  /// Number of Amazon EC2 instances for the Resolver on Outpost. The default
  /// and minimal value is 4.
  ///
  /// Parameter [tags] :
  /// A string that helps identify the Route 53 Resolvers on Outpost.
  Future<CreateOutpostResolverResponse> createOutpostResolver({
    required String creatorRequestId,
    required String name,
    required String outpostArn,
    required String preferredInstanceType,
    int? instanceCount,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.CreateOutpostResolver'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreatorRequestId': creatorRequestId,
        'Name': name,
        'OutpostArn': outpostArn,
        'PreferredInstanceType': preferredInstanceType,
        if (instanceCount != null) 'InstanceCount': instanceCount,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateOutpostResolverResponse.fromJson(jsonResponse.body);
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
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// requests to be retried without the risk of running the operation twice.
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
  /// <note>
  /// Even though the minimum is 1, Route 53 requires that you create at least
  /// two.
  /// </note>
  ///
  /// Parameter [securityGroupIds] :
  /// The ID of one or more security groups that you want to use to control
  /// access to this VPC. The security group that you specify must include one
  /// or more inbound rules (for inbound Resolver endpoints) or outbound rules
  /// (for outbound Resolver endpoints). Inbound and outbound rules must allow
  /// TCP and UDP access. For inbound access, open port 53. For outbound access,
  /// open the port that you're using for DNS queries on your network.
  ///
  /// Some security group rules will cause your connection to be tracked. For
  /// outbound resolver endpoint, it can potentially impact the maximum queries
  /// per second from outbound endpoint to your target name server. For inbound
  /// resolver endpoint, it can bring down the overall maximum queries per
  /// second per IP address to as low as 1500. To avoid connection tracking
  /// caused by security group, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/security-group-connection-tracking.html#untracked-connectionsl">Untracked
  /// connections</a>.
  ///
  /// Parameter [name] :
  /// A friendly name that lets you easily find a configuration in the Resolver
  /// dashboard in the Route 53 console.
  ///
  /// Parameter [outpostArn] :
  /// The Amazon Resource Name (ARN) of the Outpost. If you specify this, you
  /// must also specify a value for the <code>PreferredInstanceType</code>.
  ///
  /// Parameter [preferredInstanceType] :
  /// The instance type. If you specify this, you must also specify a value for
  /// the <code>OutpostArn</code>.
  ///
  /// Parameter [protocols] :
  /// The protocols you want to use for the endpoint. DoH-FIPS is applicable for
  /// inbound endpoints only.
  ///
  /// For an inbound endpoint you can apply the protocols as follows:
  ///
  /// <ul>
  /// <li>
  /// Do53 and DoH in combination.
  /// </li>
  /// <li>
  /// Do53 and DoH-FIPS in combination.
  /// </li>
  /// <li>
  /// Do53 alone.
  /// </li>
  /// <li>
  /// DoH alone.
  /// </li>
  /// <li>
  /// DoH-FIPS alone.
  /// </li>
  /// <li>
  /// None, which is treated as Do53.
  /// </li>
  /// </ul>
  /// For an outbound endpoint you can apply the protocols as follows:
  ///
  /// <ul>
  /// <li>
  /// Do53 and DoH in combination.
  /// </li>
  /// <li>
  /// Do53 alone.
  /// </li>
  /// <li>
  /// DoH alone.
  /// </li>
  /// <li>
  /// None, which is treated as Do53.
  /// </li>
  /// </ul>
  ///
  /// Parameter [resolverEndpointType] :
  /// For the endpoint type you can choose either IPv4, IPv6, or dual-stack. A
  /// dual-stack endpoint means that it will resolve via both IPv4 and IPv6.
  /// This endpoint type is applied to all IP addresses.
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
    String? outpostArn,
    String? preferredInstanceType,
    List<Protocol>? protocols,
    ResolverEndpointType? resolverEndpointType,
    List<Tag>? tags,
  }) async {
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
        if (outpostArn != null) 'OutpostArn': outpostArn,
        if (preferredInstanceType != null)
          'PreferredInstanceType': preferredInstanceType,
        if (protocols != null)
          'Protocols': protocols.map((e) => e.toValue()).toList(),
        if (resolverEndpointType != null)
          'ResolverEndpointType': resolverEndpointType.toValue(),
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
  /// You can optionally use Resource Access Manager (RAM) to share a query
  /// logging configuration with other Amazon Web Services accounts. The other
  /// accounts can then associate VPCs with the configuration. The query logs
  /// that Resolver creates for a configuration include all DNS queries that
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
  /// The name that you want to give the query logging configuration.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// requests to be retried without the risk of running the operation twice.
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
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and that allows failed
  /// requests to be retried without the risk of running the operation twice.
  /// <code>CreatorRequestId</code> can be any unique string, for example, a
  /// date/time stamp.
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
  /// Parameter [domainName] :
  /// DNS queries for this domain name are forwarded to the IP addresses that
  /// you specify in <code>TargetIps</code>. If a query matches multiple
  /// Resolver rules (example.com and www.example.com), outbound DNS queries are
  /// routed using the Resolver rule that contains the most specific domain name
  /// (www.example.com).
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
  /// either Ipv4 or Ipv6 addresses but not both in the same rule. Separate IP
  /// addresses with a space.
  ///
  /// <code>TargetIps</code> is available only when the value of <code>Rule
  /// type</code> is <code>FORWARD</code>.
  Future<CreateResolverRuleResponse> createResolverRule({
    required String creatorRequestId,
    required RuleTypeOption ruleType,
    String? domainName,
    String? name,
    String? resolverEndpointId,
    List<Tag>? tags,
    List<TargetAddress>? targetIps,
  }) async {
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
        'RuleType': ruleType.toValue(),
        if (domainName != null) 'DomainName': domainName,
        if (name != null) 'Name': name,
        if (resolverEndpointId != null)
          'ResolverEndpointId': resolverEndpointId,
        if (tags != null) 'Tags': tags,
        if (targetIps != null) 'TargetIps': targetIps,
      },
    );

    return CreateResolverRuleResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified domain list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallDomainListId] :
  /// The ID of the domain list that you want to delete.
  Future<DeleteFirewallDomainListResponse> deleteFirewallDomainList({
    required String firewallDomainListId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.DeleteFirewallDomainList'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallDomainListId': firewallDomainListId,
      },
    );

    return DeleteFirewallDomainListResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified firewall rule.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallDomainListId] :
  /// The ID of the domain list that's used in the rule.
  ///
  /// Parameter [firewallRuleGroupId] :
  /// The unique identifier of the firewall rule group that you want to delete
  /// the rule from.
  ///
  /// Parameter [qtype] :
  /// The DNS query type that the rule you are deleting evaluates. Allowed
  /// values are;
  ///
  /// <ul>
  /// <li>
  /// A: Returns an IPv4 address.
  /// </li>
  /// <li>
  /// AAAA: Returns an Ipv6 address.
  /// </li>
  /// <li>
  /// CAA: Restricts CAs that can create SSL/TLS certifications for the domain.
  /// </li>
  /// <li>
  /// CNAME: Returns another domain name.
  /// </li>
  /// <li>
  /// DS: Record that identifies the DNSSEC signing key of a delegated zone.
  /// </li>
  /// <li>
  /// MX: Specifies mail servers.
  /// </li>
  /// <li>
  /// NAPTR: Regular-expression-based rewriting of domain names.
  /// </li>
  /// <li>
  /// NS: Authoritative name servers.
  /// </li>
  /// <li>
  /// PTR: Maps an IP address to a domain name.
  /// </li>
  /// <li>
  /// SOA: Start of authority record for the zone.
  /// </li>
  /// <li>
  /// SPF: Lists the servers authorized to send emails from a domain.
  /// </li>
  /// <li>
  /// SRV: Application specific values that identify servers.
  /// </li>
  /// <li>
  /// TXT: Verifies email senders and application-specific values.
  /// </li>
  /// <li>
  /// A query type you define by using the DNS type ID, for example 28 for AAAA.
  /// The values must be defined as TYPENUMBER, where the NUMBER can be 1-65334,
  /// for example, TYPE28. For more information, see <a
  /// href="https://en.wikipedia.org/wiki/List_of_DNS_record_types">List of DNS
  /// record types</a>.
  /// </li>
  /// </ul>
  Future<DeleteFirewallRuleResponse> deleteFirewallRule({
    required String firewallDomainListId,
    required String firewallRuleGroupId,
    String? qtype,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.DeleteFirewallRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallDomainListId': firewallDomainListId,
        'FirewallRuleGroupId': firewallRuleGroupId,
        if (qtype != null) 'Qtype': qtype,
      },
    );

    return DeleteFirewallRuleResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified firewall rule group.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallRuleGroupId] :
  /// The unique identifier of the firewall rule group that you want to delete.
  Future<DeleteFirewallRuleGroupResponse> deleteFirewallRuleGroup({
    required String firewallRuleGroupId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.DeleteFirewallRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallRuleGroupId': firewallRuleGroupId,
      },
    );

    return DeleteFirewallRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a Resolver on the Outpost.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// A unique string that identifies the Resolver on the Outpost.
  Future<DeleteOutpostResolverResponse> deleteOutpostResolver({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.DeleteOutpostResolver'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );

    return DeleteOutpostResolverResponse.fromJson(jsonResponse.body);
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
  /// configuration is shared with other Amazon Web Services accounts, and the
  /// other accounts have associated VPCs with the shared configuration.
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

  /// Disassociates a <a>FirewallRuleGroup</a> from a VPC, to remove DNS
  /// filtering from the VPC.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallRuleGroupAssociationId] :
  /// The identifier of the <a>FirewallRuleGroupAssociation</a>.
  Future<DisassociateFirewallRuleGroupResponse> disassociateFirewallRuleGroup({
    required String firewallRuleGroupAssociationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.DisassociateFirewallRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallRuleGroupAssociationId': firewallRuleGroupAssociationId,
      },
    );

    return DisassociateFirewallRuleGroupResponse.fromJson(jsonResponse.body);
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

  /// Retrieves the configuration of the firewall behavior provided by DNS
  /// Firewall for a single VPC from Amazon Virtual Private Cloud (Amazon VPC).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the VPC from Amazon VPC that the configuration is for.
  Future<GetFirewallConfigResponse> getFirewallConfig({
    required String resourceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.GetFirewallConfig'
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

    return GetFirewallConfigResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the specified firewall domain list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallDomainListId] :
  /// The ID of the domain list.
  Future<GetFirewallDomainListResponse> getFirewallDomainList({
    required String firewallDomainListId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.GetFirewallDomainList'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallDomainListId': firewallDomainListId,
      },
    );

    return GetFirewallDomainListResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the specified firewall rule group.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallRuleGroupId] :
  /// The unique identifier of the firewall rule group.
  Future<GetFirewallRuleGroupResponse> getFirewallRuleGroup({
    required String firewallRuleGroupId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.GetFirewallRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallRuleGroupId': firewallRuleGroupId,
      },
    );

    return GetFirewallRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a firewall rule group association, which enables DNS filtering
  /// for a VPC with one rule group. A VPC can have more than one firewall rule
  /// group association, and a rule group can be associated with more than one
  /// VPC.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallRuleGroupAssociationId] :
  /// The identifier of the <a>FirewallRuleGroupAssociation</a>.
  Future<GetFirewallRuleGroupAssociationResponse>
      getFirewallRuleGroupAssociation({
    required String firewallRuleGroupAssociationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.GetFirewallRuleGroupAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallRuleGroupAssociationId': firewallRuleGroupAssociationId,
      },
    );

    return GetFirewallRuleGroupAssociationResponse.fromJson(jsonResponse.body);
  }

  /// Returns the Identity and Access Management (Amazon Web Services IAM)
  /// policy for sharing the specified rule group. You can use the policy to
  /// share the rule group using Resource Access Manager (RAM).
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [arn] :
  /// The ARN (Amazon Resource Name) for the rule group.
  Future<GetFirewallRuleGroupPolicyResponse> getFirewallRuleGroupPolicy({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.GetFirewallRuleGroupPolicy'
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

    return GetFirewallRuleGroupPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a specified Resolver on the Outpost, such as its
  /// instance count and type, name, and the current status of the Resolver.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the Resolver on the Outpost.
  Future<GetOutpostResolverResponse> getOutpostResolver({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.GetOutpostResolver'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );

    return GetOutpostResolverResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the behavior configuration of Route 53 Resolver behavior for a
  /// single VPC from Amazon Virtual Private Cloud.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceId] :
  /// Resource ID of the Amazon VPC that you want to get information about.
  Future<GetResolverConfigResponse> getResolverConfig({
    required String resourceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.GetResolverConfig'
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

    return GetResolverConfigResponse.fromJson(jsonResponse.body);
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
  /// want to allow another Amazon Web Services account to be able to use.
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
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [arn] :
  /// The ID of the Resolver rule that you want to get the Resolver rule policy
  /// for.
  Future<GetResolverRulePolicyResponse> getResolverRulePolicy({
    required String arn,
  }) async {
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

  /// Imports domain names from a file into a domain list, for use in a DNS
  /// firewall rule group.
  ///
  /// Each domain specification in your domain list must satisfy the following
  /// requirements:
  ///
  /// <ul>
  /// <li>
  /// It can optionally start with <code>*</code> (asterisk).
  /// </li>
  /// <li>
  /// With the exception of the optional starting asterisk, it must only contain
  /// the following characters: <code>A-Z</code>, <code>a-z</code>,
  /// <code>0-9</code>, <code>-</code> (hyphen).
  /// </li>
  /// <li>
  /// It must be from 1-255 characters in length.
  /// </li>
  /// </ul>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainFileUrl] :
  /// The fully qualified URL or URI of the file stored in Amazon Simple Storage
  /// Service (Amazon S3) that contains the list of domains to import.
  ///
  /// The file must be in an S3 bucket that's in the same Region as your DNS
  /// Firewall. The file must be a text file and must contain a single domain
  /// per line.
  ///
  /// Parameter [firewallDomainListId] :
  /// The ID of the domain list that you want to modify with the import
  /// operation.
  ///
  /// Parameter [operation] :
  /// What you want DNS Firewall to do with the domains that are listed in the
  /// file. This must be set to <code>REPLACE</code>, which updates the domain
  /// list to exactly match the list in the file.
  Future<ImportFirewallDomainsResponse> importFirewallDomains({
    required String domainFileUrl,
    required String firewallDomainListId,
    required FirewallDomainImportOperation operation,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.ImportFirewallDomains'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainFileUrl': domainFileUrl,
        'FirewallDomainListId': firewallDomainListId,
        'Operation': operation.toValue(),
      },
    );

    return ImportFirewallDomainsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the firewall configurations that you have defined. DNS Firewall
  /// uses the configurations to manage firewall behavior for your VPCs.
  ///
  /// A single call might return only a partial list of the configurations. For
  /// information, see <code>MaxResults</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Resolver to return for this
  /// request. If more objects are available, in the response, Resolver provides
  /// a <code>NextToken</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// If you don't specify a value for <code>MaxResults</code>, Resolver returns
  /// up to 100 objects.
  ///
  /// Parameter [nextToken] :
  /// For the first call to this list request, omit this value.
  ///
  /// When you request a list of objects, Resolver returns at most the number of
  /// objects specified in <code>MaxResults</code>. If more objects are
  /// available for retrieval, Resolver returns a <code>NextToken</code> value
  /// in the response. To retrieve the next batch of objects, use the token that
  /// was returned for the prior request in your next request.
  Future<ListFirewallConfigsResponse> listFirewallConfigs({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      5,
      10,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.ListFirewallConfigs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListFirewallConfigsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the firewall domain lists that you have defined. For each
  /// firewall domain list, you can retrieve the domains that are defined for a
  /// list by calling <a>ListFirewallDomains</a>.
  ///
  /// A single call to this list operation might return only a partial list of
  /// the domain lists. For information, see <code>MaxResults</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Resolver to return for this
  /// request. If more objects are available, in the response, Resolver provides
  /// a <code>NextToken</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// If you don't specify a value for <code>MaxResults</code>, Resolver returns
  /// up to 100 objects.
  ///
  /// Parameter [nextToken] :
  /// For the first call to this list request, omit this value.
  ///
  /// When you request a list of objects, Resolver returns at most the number of
  /// objects specified in <code>MaxResults</code>. If more objects are
  /// available for retrieval, Resolver returns a <code>NextToken</code> value
  /// in the response. To retrieve the next batch of objects, use the token that
  /// was returned for the prior request in your next request.
  Future<ListFirewallDomainListsResponse> listFirewallDomainLists({
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
      'X-Amz-Target': 'Route53Resolver.ListFirewallDomainLists'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListFirewallDomainListsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the domains that you have defined for the specified firewall
  /// domain list.
  ///
  /// A single call might return only a partial list of the domains. For
  /// information, see <code>MaxResults</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallDomainListId] :
  /// The ID of the domain list whose domains you want to retrieve.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Resolver to return for this
  /// request. If more objects are available, in the response, Resolver provides
  /// a <code>NextToken</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// If you don't specify a value for <code>MaxResults</code>, Resolver returns
  /// up to 100 objects.
  ///
  /// Parameter [nextToken] :
  /// For the first call to this list request, omit this value.
  ///
  /// When you request a list of objects, Resolver returns at most the number of
  /// objects specified in <code>MaxResults</code>. If more objects are
  /// available for retrieval, Resolver returns a <code>NextToken</code> value
  /// in the response. To retrieve the next batch of objects, use the token that
  /// was returned for the prior request in your next request.
  Future<ListFirewallDomainsResponse> listFirewallDomains({
    required String firewallDomainListId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      5000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.ListFirewallDomains'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallDomainListId': firewallDomainListId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListFirewallDomainsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the firewall rule group associations that you have defined. Each
  /// association enables DNS filtering for a VPC with one rule group.
  ///
  /// A single call might return only a partial list of the associations. For
  /// information, see <code>MaxResults</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallRuleGroupId] :
  /// The unique identifier of the firewall rule group that you want to retrieve
  /// the associations for. Leave this blank to retrieve associations for any
  /// rule group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Resolver to return for this
  /// request. If more objects are available, in the response, Resolver provides
  /// a <code>NextToken</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// If you don't specify a value for <code>MaxResults</code>, Resolver returns
  /// up to 100 objects.
  ///
  /// Parameter [nextToken] :
  /// For the first call to this list request, omit this value.
  ///
  /// When you request a list of objects, Resolver returns at most the number of
  /// objects specified in <code>MaxResults</code>. If more objects are
  /// available for retrieval, Resolver returns a <code>NextToken</code> value
  /// in the response. To retrieve the next batch of objects, use the token that
  /// was returned for the prior request in your next request.
  ///
  /// Parameter [priority] :
  /// The setting that determines the processing order of the rule group among
  /// the rule groups that are associated with a single VPC. DNS Firewall
  /// filters VPC traffic starting from the rule group with the lowest numeric
  /// priority setting.
  ///
  /// Parameter [status] :
  /// The association <code>Status</code> setting that you want DNS Firewall to
  /// filter on for the list. If you don't specify this, then DNS Firewall
  /// returns all associations, regardless of status.
  ///
  /// Parameter [vpcId] :
  /// The unique identifier of the VPC that you want to retrieve the
  /// associations for. Leave this blank to retrieve associations for any VPC.
  Future<ListFirewallRuleGroupAssociationsResponse>
      listFirewallRuleGroupAssociations({
    String? firewallRuleGroupId,
    int? maxResults,
    String? nextToken,
    int? priority,
    FirewallRuleGroupAssociationStatus? status,
    String? vpcId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.ListFirewallRuleGroupAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (firewallRuleGroupId != null)
          'FirewallRuleGroupId': firewallRuleGroupId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (priority != null) 'Priority': priority,
        if (status != null) 'Status': status.toValue(),
        if (vpcId != null) 'VpcId': vpcId,
      },
    );

    return ListFirewallRuleGroupAssociationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the minimal high-level information for the rule groups that you
  /// have defined.
  ///
  /// A single call might return only a partial list of the rule groups. For
  /// information, see <code>MaxResults</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Resolver to return for this
  /// request. If more objects are available, in the response, Resolver provides
  /// a <code>NextToken</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// If you don't specify a value for <code>MaxResults</code>, Resolver returns
  /// up to 100 objects.
  ///
  /// Parameter [nextToken] :
  /// For the first call to this list request, omit this value.
  ///
  /// When you request a list of objects, Resolver returns at most the number of
  /// objects specified in <code>MaxResults</code>. If more objects are
  /// available for retrieval, Resolver returns a <code>NextToken</code> value
  /// in the response. To retrieve the next batch of objects, use the token that
  /// was returned for the prior request in your next request.
  Future<ListFirewallRuleGroupsResponse> listFirewallRuleGroups({
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
      'X-Amz-Target': 'Route53Resolver.ListFirewallRuleGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListFirewallRuleGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the firewall rules that you have defined for the specified
  /// firewall rule group. DNS Firewall uses the rules in a rule group to filter
  /// DNS network traffic for a VPC.
  ///
  /// A single call might return only a partial list of the rules. For
  /// information, see <code>MaxResults</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallRuleGroupId] :
  /// The unique identifier of the firewall rule group that you want to retrieve
  /// the rules for.
  ///
  /// Parameter [action] :
  /// Optional additional filter for the rules to retrieve.
  ///
  /// The action that DNS Firewall should take on a DNS query when it matches
  /// one of the domains in the rule's domain list:
  ///
  /// <ul>
  /// <li>
  /// <code>ALLOW</code> - Permit the request to go through.
  /// </li>
  /// <li>
  /// <code>ALERT</code> - Permit the request to go through but send an alert to
  /// the logs.
  /// </li>
  /// <li>
  /// <code>BLOCK</code> - Disallow the request. If this is specified,
  /// additional handling details are provided in the rule's
  /// <code>BlockResponse</code> setting.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Resolver to return for this
  /// request. If more objects are available, in the response, Resolver provides
  /// a <code>NextToken</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// If you don't specify a value for <code>MaxResults</code>, Resolver returns
  /// up to 100 objects.
  ///
  /// Parameter [nextToken] :
  /// For the first call to this list request, omit this value.
  ///
  /// When you request a list of objects, Resolver returns at most the number of
  /// objects specified in <code>MaxResults</code>. If more objects are
  /// available for retrieval, Resolver returns a <code>NextToken</code> value
  /// in the response. To retrieve the next batch of objects, use the token that
  /// was returned for the prior request in your next request.
  ///
  /// Parameter [priority] :
  /// Optional additional filter for the rules to retrieve.
  ///
  /// The setting that determines the processing order of the rules in a rule
  /// group. DNS Firewall processes the rules in a rule group by order of
  /// priority, starting from the lowest setting.
  Future<ListFirewallRulesResponse> listFirewallRules({
    required String firewallRuleGroupId,
    Action? action,
    int? maxResults,
    String? nextToken,
    int? priority,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.ListFirewallRules'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallRuleGroupId': firewallRuleGroupId,
        if (action != null) 'Action': action.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (priority != null) 'Priority': priority,
      },
    );

    return ListFirewallRulesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the Resolvers on Outposts that were created using the current
  /// Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Resolvers on the Outpost that you want to return in
  /// the response to a <code>ListOutpostResolver</code> request. If you don't
  /// specify a value for <code>MaxResults</code>, the request returns up to 100
  /// Resolvers.
  ///
  /// Parameter [nextToken] :
  /// For the first <code>ListOutpostResolver</code> request, omit this value.
  /// <p/>
  ///
  /// Parameter [outpostArn] :
  /// The Amazon Resource Name (ARN) of the Outpost.
  Future<ListOutpostResolversResponse> listOutpostResolvers({
    int? maxResults,
    String? nextToken,
    String? outpostArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.ListOutpostResolvers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (outpostArn != null) 'OutpostArn': outpostArn,
      },
    );

    return ListOutpostResolversResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the Resolver configurations that you have defined. Route 53
  /// Resolver uses the configurations to manage DNS resolution behavior for
  /// your VPCs.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Resolver configurations that you want to return in
  /// the response to a <code>ListResolverConfigs</code> request. If you don't
  /// specify a value for <code>MaxResults</code>, up to 100 Resolver
  /// configurations are returned.
  ///
  /// Parameter [nextToken] :
  /// (Optional) If the current Amazon Web Services account has more than
  /// <code>MaxResults</code> Resolver configurations, use
  /// <code>NextToken</code> to get the second and subsequent pages of results.
  ///
  /// For the first <code>ListResolverConfigs</code> request, omit this value.
  ///
  /// For the second and subsequent requests, get the value of
  /// <code>NextToken</code> from the previous response and specify that value
  /// for <code>NextToken</code> in the request.
  Future<ListResolverConfigsResponse> listResolverConfigs({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      5,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.ListResolverConfigs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListResolverConfigsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the configurations for DNSSEC validation that are associated with
  /// the current Amazon Web Services account.
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
  /// (Optional) If the current Amazon Web Services account has more than
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

  /// Lists all the Resolver endpoints that were created using the current
  /// Amazon Web Services account.
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
  /// <code>OwnerId</code>: The Amazon Web Services account number of the
  /// account that created the configuration
  /// </li>
  /// <li>
  /// <code>ShareStatus</code>: Whether the configuration is shared with other
  /// Amazon Web Services accounts or shared with the current account by another
  /// Amazon Web Services account. Sharing is configured through Resource Access
  /// Manager (RAM).
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
  /// using the current Amazon Web Services account.
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

  /// Lists the Resolver rules that were created using the current Amazon Web
  /// Services account.
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

  /// Attaches an Identity and Access Management (Amazon Web Services IAM)
  /// policy for sharing the rule group. You can use the policy to share the
  /// rule group using Resource Access Manager (RAM).
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [arn] :
  /// The ARN (Amazon Resource Name) for the rule group that you want to share.
  ///
  /// Parameter [firewallRuleGroupPolicy] :
  /// The Identity and Access Management (Amazon Web Services IAM) policy to
  /// attach to the rule group.
  Future<PutFirewallRuleGroupPolicyResponse> putFirewallRuleGroupPolicy({
    required String arn,
    required String firewallRuleGroupPolicy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.PutFirewallRuleGroupPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Arn': arn,
        'FirewallRuleGroupPolicy': firewallRuleGroupPolicy,
      },
    );

    return PutFirewallRuleGroupPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Specifies an Amazon Web Services account that you want to share a query
  /// logging configuration with, the query logging configuration that you want
  /// to share, and the operations that you want the account to be able to
  /// perform on the configuration.
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
  /// An Identity and Access Management policy statement that lists the query
  /// logging configurations that you want to share with another Amazon Web
  /// Services account and the operations that you want the account to be able
  /// to perform. You can specify the following operations in the
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

  /// Specifies an Amazon Web Services rule that you want to share with another
  /// account, the account that you want to share the rule with, and the
  /// operations that you want the account to be able to perform on the rule.
  ///
  /// May throw [InvalidPolicyDocument].
  /// May throw [InvalidParameterException].
  /// May throw [UnknownResourceException].
  /// May throw [InternalServiceErrorException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the rule that you want to share with
  /// another account.
  ///
  /// Parameter [resolverRulePolicy] :
  /// An Identity and Access Management policy statement that lists the rules
  /// that you want to share with another Amazon Web Services account and the
  /// operations that you want the account to be able to perform. You can
  /// specify the following operations in the <code>Action</code> section of the
  /// statement:
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

  /// Updates the configuration of the firewall behavior provided by DNS
  /// Firewall for a single VPC from Amazon Virtual Private Cloud (Amazon VPC).
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallFailOpen] :
  /// Determines how Route 53 Resolver handles queries during failures, for
  /// example when all traffic that is sent to DNS Firewall fails to receive a
  /// reply.
  ///
  /// <ul>
  /// <li>
  /// By default, fail open is disabled, which means the failure mode is closed.
  /// This approach favors security over availability. DNS Firewall blocks
  /// queries that it is unable to evaluate properly.
  /// </li>
  /// <li>
  /// If you enable this option, the failure mode is open. This approach favors
  /// availability over security. DNS Firewall allows queries to proceed if it
  /// is unable to properly evaluate them.
  /// </li>
  /// </ul>
  /// This behavior is only enforced for VPCs that have at least one DNS
  /// Firewall rule group association.
  ///
  /// Parameter [resourceId] :
  /// The ID of the VPC that the configuration is for.
  Future<UpdateFirewallConfigResponse> updateFirewallConfig({
    required FirewallFailOpenStatus firewallFailOpen,
    required String resourceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.UpdateFirewallConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallFailOpen': firewallFailOpen.toValue(),
        'ResourceId': resourceId,
      },
    );

    return UpdateFirewallConfigResponse.fromJson(jsonResponse.body);
  }

  /// Updates the firewall domain list from an array of domain specifications.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domains] :
  /// A list of domains to use in the update operation.
  /// <important>
  /// There is a limit of 1000 domains per request.
  /// </important>
  /// Each domain specification in your domain list must satisfy the following
  /// requirements:
  ///
  /// <ul>
  /// <li>
  /// It can optionally start with <code>*</code> (asterisk).
  /// </li>
  /// <li>
  /// With the exception of the optional starting asterisk, it must only contain
  /// the following characters: <code>A-Z</code>, <code>a-z</code>,
  /// <code>0-9</code>, <code>-</code> (hyphen).
  /// </li>
  /// <li>
  /// It must be from 1-255 characters in length.
  /// </li>
  /// </ul>
  ///
  /// Parameter [firewallDomainListId] :
  /// The ID of the domain list whose domains you want to update.
  ///
  /// Parameter [operation] :
  /// What you want DNS Firewall to do with the domains that you are providing:
  ///
  /// <ul>
  /// <li>
  /// <code>ADD</code> - Add the domains to the ones that are already in the
  /// domain list.
  /// </li>
  /// <li>
  /// <code>REMOVE</code> - Search the domain list for the domains and remove
  /// them from the list.
  /// </li>
  /// <li>
  /// <code>REPLACE</code> - Update the domain list to exactly match the list
  /// that you are providing.
  /// </li>
  /// </ul>
  Future<UpdateFirewallDomainsResponse> updateFirewallDomains({
    required List<String> domains,
    required String firewallDomainListId,
    required FirewallDomainUpdateOperation operation,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.UpdateFirewallDomains'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Domains': domains,
        'FirewallDomainListId': firewallDomainListId,
        'Operation': operation.toValue(),
      },
    );

    return UpdateFirewallDomainsResponse.fromJson(jsonResponse.body);
  }

  /// Updates the specified firewall rule.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallDomainListId] :
  /// The ID of the domain list to use in the rule.
  ///
  /// Parameter [firewallRuleGroupId] :
  /// The unique identifier of the firewall rule group for the rule.
  ///
  /// Parameter [action] :
  /// The action that DNS Firewall should take on a DNS query when it matches
  /// one of the domains in the rule's domain list:
  ///
  /// <ul>
  /// <li>
  /// <code>ALLOW</code> - Permit the request to go through.
  /// </li>
  /// <li>
  /// <code>ALERT</code> - Permit the request to go through but send an alert to
  /// the logs.
  /// </li>
  /// <li>
  /// <code>BLOCK</code> - Disallow the request. This option requires additional
  /// details in the rule's <code>BlockResponse</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [blockOverrideDnsType] :
  /// The DNS record's type. This determines the format of the record value that
  /// you provided in <code>BlockOverrideDomain</code>. Used for the rule action
  /// <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  ///
  /// Parameter [blockOverrideDomain] :
  /// The custom DNS record to send back in response to the query. Used for the
  /// rule action <code>BLOCK</code> with a <code>BlockResponse</code> setting
  /// of <code>OVERRIDE</code>.
  ///
  /// Parameter [blockOverrideTtl] :
  /// The recommended amount of time, in seconds, for the DNS resolver or web
  /// browser to cache the provided override record. Used for the rule action
  /// <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  ///
  /// Parameter [blockResponse] :
  /// The way that you want DNS Firewall to block the request. Used for the rule
  /// action setting <code>BLOCK</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>NODATA</code> - Respond indicating that the query was successful,
  /// but no response is available for it.
  /// </li>
  /// <li>
  /// <code>NXDOMAIN</code> - Respond indicating that the domain name that's in
  /// the query doesn't exist.
  /// </li>
  /// <li>
  /// <code>OVERRIDE</code> - Provide a custom override in the response. This
  /// option requires custom handling details in the rule's
  /// <code>BlockOverride*</code> settings.
  /// </li>
  /// </ul>
  ///
  /// Parameter [firewallDomainRedirectionAction] :
  /// How you want the the rule to evaluate DNS redirection in the DNS
  /// redirection chain, such as CNAME or DNAME.
  ///
  /// <code>Inspect_Redirection_Domain </code>(Default) inspects all domains in
  /// the redirection chain. The individual domains in the redirection chain
  /// must be added to the domain list.
  ///
  /// <code>Trust_Redirection_Domain </code> inspects only the first domain in
  /// the redirection chain. You don't need to add the subsequent domains in the
  /// domain in the redirection list to the domain list.
  ///
  /// Parameter [name] :
  /// The name of the rule.
  ///
  /// Parameter [priority] :
  /// The setting that determines the processing order of the rule in the rule
  /// group. DNS Firewall processes the rules in a rule group by order of
  /// priority, starting from the lowest setting.
  ///
  /// You must specify a unique priority for each rule in a rule group. To make
  /// it easier to insert rules later, leave space between the numbers, for
  /// example, use 100, 200, and so on. You can change the priority setting for
  /// the rules in a rule group at any time.
  ///
  /// Parameter [qtype] :
  /// The DNS query type you want the rule to evaluate. Allowed values are;
  ///
  /// <ul>
  /// <li>
  /// A: Returns an IPv4 address.
  /// </li>
  /// <li>
  /// AAAA: Returns an Ipv6 address.
  /// </li>
  /// <li>
  /// CAA: Restricts CAs that can create SSL/TLS certifications for the domain.
  /// </li>
  /// <li>
  /// CNAME: Returns another domain name.
  /// </li>
  /// <li>
  /// DS: Record that identifies the DNSSEC signing key of a delegated zone.
  /// </li>
  /// <li>
  /// MX: Specifies mail servers.
  /// </li>
  /// <li>
  /// NAPTR: Regular-expression-based rewriting of domain names.
  /// </li>
  /// <li>
  /// NS: Authoritative name servers.
  /// </li>
  /// <li>
  /// PTR: Maps an IP address to a domain name.
  /// </li>
  /// <li>
  /// SOA: Start of authority record for the zone.
  /// </li>
  /// <li>
  /// SPF: Lists the servers authorized to send emails from a domain.
  /// </li>
  /// <li>
  /// SRV: Application specific values that identify servers.
  /// </li>
  /// <li>
  /// TXT: Verifies email senders and application-specific values.
  /// </li>
  /// <li>
  /// A query type you define by using the DNS type ID, for example 28 for AAAA.
  /// The values must be defined as TYPENUMBER, where the NUMBER can be 1-65334,
  /// for example, TYPE28. For more information, see <a
  /// href="https://en.wikipedia.org/wiki/List_of_DNS_record_types">List of DNS
  /// record types</a>.
  /// </li>
  /// </ul>
  Future<UpdateFirewallRuleResponse> updateFirewallRule({
    required String firewallDomainListId,
    required String firewallRuleGroupId,
    Action? action,
    BlockOverrideDnsType? blockOverrideDnsType,
    String? blockOverrideDomain,
    int? blockOverrideTtl,
    BlockResponse? blockResponse,
    FirewallDomainRedirectionAction? firewallDomainRedirectionAction,
    String? name,
    int? priority,
    String? qtype,
  }) async {
    _s.validateNumRange(
      'blockOverrideTtl',
      blockOverrideTtl,
      0,
      604800,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.UpdateFirewallRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallDomainListId': firewallDomainListId,
        'FirewallRuleGroupId': firewallRuleGroupId,
        if (action != null) 'Action': action.toValue(),
        if (blockOverrideDnsType != null)
          'BlockOverrideDnsType': blockOverrideDnsType.toValue(),
        if (blockOverrideDomain != null)
          'BlockOverrideDomain': blockOverrideDomain,
        if (blockOverrideTtl != null) 'BlockOverrideTtl': blockOverrideTtl,
        if (blockResponse != null) 'BlockResponse': blockResponse.toValue(),
        if (firewallDomainRedirectionAction != null)
          'FirewallDomainRedirectionAction':
              firewallDomainRedirectionAction.toValue(),
        if (name != null) 'Name': name,
        if (priority != null) 'Priority': priority,
        if (qtype != null) 'Qtype': qtype,
      },
    );

    return UpdateFirewallRuleResponse.fromJson(jsonResponse.body);
  }

  /// Changes the association of a <a>FirewallRuleGroup</a> with a VPC. The
  /// association enables DNS filtering for the VPC.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallRuleGroupAssociationId] :
  /// The identifier of the <a>FirewallRuleGroupAssociation</a>.
  ///
  /// Parameter [mutationProtection] :
  /// If enabled, this setting disallows modification or removal of the
  /// association, to help prevent against accidentally altering DNS firewall
  /// protections.
  ///
  /// Parameter [name] :
  /// The name of the rule group association.
  ///
  /// Parameter [priority] :
  /// The setting that determines the processing order of the rule group among
  /// the rule groups that you associate with the specified VPC. DNS Firewall
  /// filters VPC traffic starting from the rule group with the lowest numeric
  /// priority setting.
  ///
  /// You must specify a unique priority for each rule group that you associate
  /// with a single VPC. To make it easier to insert rule groups later, leave
  /// space between the numbers, for example, use 100, 200, and so on. You can
  /// change the priority setting for a rule group association after you create
  /// it.
  Future<UpdateFirewallRuleGroupAssociationResponse>
      updateFirewallRuleGroupAssociation({
    required String firewallRuleGroupAssociationId,
    MutationProtectionStatus? mutationProtection,
    String? name,
    int? priority,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.UpdateFirewallRuleGroupAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallRuleGroupAssociationId': firewallRuleGroupAssociationId,
        if (mutationProtection != null)
          'MutationProtection': mutationProtection.toValue(),
        if (name != null) 'Name': name,
        if (priority != null) 'Priority': priority,
      },
    );

    return UpdateFirewallRuleGroupAssociationResponse.fromJson(
        jsonResponse.body);
  }

  /// You can use <code>UpdateOutpostResolver</code> to update the instance
  /// count, type, or name of a Resolver on an Outpost.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// A unique string that identifies Resolver on an Outpost.
  ///
  /// Parameter [instanceCount] :
  /// The Amazon EC2 instance count for a Resolver on the Outpost.
  ///
  /// Parameter [name] :
  /// Name of the Resolver on the Outpost.
  ///
  /// Parameter [preferredInstanceType] :
  /// Amazon EC2 instance type.
  Future<UpdateOutpostResolverResponse> updateOutpostResolver({
    required String id,
    int? instanceCount,
    String? name,
    String? preferredInstanceType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.UpdateOutpostResolver'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (instanceCount != null) 'InstanceCount': instanceCount,
        if (name != null) 'Name': name,
        if (preferredInstanceType != null)
          'PreferredInstanceType': preferredInstanceType,
      },
    );

    return UpdateOutpostResolverResponse.fromJson(jsonResponse.body);
  }

  /// Updates the behavior configuration of Route 53 Resolver behavior for a
  /// single VPC from Amazon Virtual Private Cloud.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [autodefinedReverseFlag] :
  /// Indicates whether or not the Resolver will create autodefined rules for
  /// reverse DNS lookups. This is enabled by default. Disabling this option
  /// will also affect EC2-Classic instances using ClassicLink. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a>
  /// in the <i>Amazon EC2 guide</i>.
  /// <important>
  /// We are retiring EC2-Classic on August 15, 2022. We recommend that you
  /// migrate from EC2-Classic to a VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-migrate.html">Migrate
  /// from EC2-Classic to a VPC</a> in the <i>Amazon EC2 guide</i> and the blog
  /// <a
  /// href="http://aws.amazon.com/blogs/aws/ec2-classic-is-retiring-heres-how-to-prepare/">EC2-Classic
  /// Networking is Retiring – Here’s How to Prepare</a>.
  /// </important> <note>
  /// It can take some time for the status change to be completed.
  /// </note> <p/>
  ///
  /// Parameter [resourceId] :
  /// Resource ID of the Amazon VPC that you want to update the Resolver
  /// configuration for.
  Future<UpdateResolverConfigResponse> updateResolverConfig({
    required AutodefinedReverseFlag autodefinedReverseFlag,
    required String resourceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Resolver.UpdateResolverConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutodefinedReverseFlag': autodefinedReverseFlag.toValue(),
        'ResourceId': resourceId,
      },
    );

    return UpdateResolverConfigResponse.fromJson(jsonResponse.body);
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

  /// Updates the name, or endpoint type for an inbound or an outbound Resolver
  /// endpoint. You can only update between IPV4 and DUALSTACK, IPV6 endpoint
  /// type can't be updated to other type.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resolverEndpointId] :
  /// The ID of the Resolver endpoint that you want to update.
  ///
  /// Parameter [name] :
  /// The name of the Resolver endpoint that you want to update.
  ///
  /// Parameter [protocols] :
  /// The protocols you want to use for the endpoint. DoH-FIPS is applicable for
  /// inbound endpoints only.
  ///
  /// For an inbound endpoint you can apply the protocols as follows:
  ///
  /// <ul>
  /// <li>
  /// Do53 and DoH in combination.
  /// </li>
  /// <li>
  /// Do53 and DoH-FIPS in combination.
  /// </li>
  /// <li>
  /// Do53 alone.
  /// </li>
  /// <li>
  /// DoH alone.
  /// </li>
  /// <li>
  /// DoH-FIPS alone.
  /// </li>
  /// <li>
  /// None, which is treated as Do53.
  /// </li>
  /// </ul>
  /// For an outbound endpoint you can apply the protocols as follows:
  ///
  /// <ul>
  /// <li>
  /// Do53 and DoH in combination.
  /// </li>
  /// <li>
  /// Do53 alone.
  /// </li>
  /// <li>
  /// DoH alone.
  /// </li>
  /// <li>
  /// None, which is treated as Do53.
  /// </li>
  /// </ul> <important>
  /// You can't change the protocol of an inbound endpoint directly from only
  /// Do53 to only DoH, or DoH-FIPS. This is to prevent a sudden disruption to
  /// incoming traffic that relies on Do53. To change the protocol from Do53 to
  /// DoH, or DoH-FIPS, you must first enable both Do53 and DoH, or Do53 and
  /// DoH-FIPS, to make sure that all incoming traffic has transferred to using
  /// the DoH protocol, or DoH-FIPS, and then remove the Do53.
  /// </important>
  ///
  /// Parameter [resolverEndpointType] :
  /// Specifies the endpoint type for what type of IP address the endpoint uses
  /// to forward DNS queries.
  ///
  /// Updating to <code>IPV6</code> type isn't currently supported.
  ///
  /// Parameter [updateIpAddresses] :
  /// Specifies the IPv6 address when you update the Resolver endpoint from IPv4
  /// to dual-stack. If you don't specify an IPv6 address, one will be
  /// automatically chosen from your subnet.
  Future<UpdateResolverEndpointResponse> updateResolverEndpoint({
    required String resolverEndpointId,
    String? name,
    List<Protocol>? protocols,
    ResolverEndpointType? resolverEndpointType,
    List<UpdateIpAddress>? updateIpAddresses,
  }) async {
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
        if (protocols != null)
          'Protocols': protocols.map((e) => e.toValue()).toList(),
        if (resolverEndpointType != null)
          'ResolverEndpointType': resolverEndpointType.toValue(),
        if (updateIpAddresses != null) 'UpdateIpAddresses': updateIpAddresses,
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
  /// May throw [AccessDeniedException].
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

enum Action {
  allow,
  block,
  alert,
}

extension ActionValueExtension on Action {
  String toValue() {
    switch (this) {
      case Action.allow:
        return 'ALLOW';
      case Action.block:
        return 'BLOCK';
      case Action.alert:
        return 'ALERT';
    }
  }
}

extension ActionFromString on String {
  Action toAction() {
    switch (this) {
      case 'ALLOW':
        return Action.allow;
      case 'BLOCK':
        return Action.block;
      case 'ALERT':
        return Action.alert;
    }
    throw Exception('$this is not known in enum Action');
  }
}

class AssociateFirewallRuleGroupResponse {
  /// The association that you just created. The association has an ID that you
  /// can use to identify it in other requests, like update and delete.
  final FirewallRuleGroupAssociation? firewallRuleGroupAssociation;

  AssociateFirewallRuleGroupResponse({
    this.firewallRuleGroupAssociation,
  });

  factory AssociateFirewallRuleGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateFirewallRuleGroupResponse(
      firewallRuleGroupAssociation: json['FirewallRuleGroupAssociation'] != null
          ? FirewallRuleGroupAssociation.fromJson(
              json['FirewallRuleGroupAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallRuleGroupAssociation = this.firewallRuleGroupAssociation;
    return {
      if (firewallRuleGroupAssociation != null)
        'FirewallRuleGroupAssociation': firewallRuleGroupAssociation,
    };
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

  Map<String, dynamic> toJson() {
    final resolverEndpoint = this.resolverEndpoint;
    return {
      if (resolverEndpoint != null) 'ResolverEndpoint': resolverEndpoint,
    };
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

  Map<String, dynamic> toJson() {
    final resolverQueryLogConfigAssociation =
        this.resolverQueryLogConfigAssociation;
    return {
      if (resolverQueryLogConfigAssociation != null)
        'ResolverQueryLogConfigAssociation': resolverQueryLogConfigAssociation,
    };
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

  Map<String, dynamic> toJson() {
    final resolverRuleAssociation = this.resolverRuleAssociation;
    return {
      if (resolverRuleAssociation != null)
        'ResolverRuleAssociation': resolverRuleAssociation,
    };
  }
}

enum AutodefinedReverseFlag {
  enable,
  disable,
  useLocalResourceSetting,
}

extension AutodefinedReverseFlagValueExtension on AutodefinedReverseFlag {
  String toValue() {
    switch (this) {
      case AutodefinedReverseFlag.enable:
        return 'ENABLE';
      case AutodefinedReverseFlag.disable:
        return 'DISABLE';
      case AutodefinedReverseFlag.useLocalResourceSetting:
        return 'USE_LOCAL_RESOURCE_SETTING';
    }
  }
}

extension AutodefinedReverseFlagFromString on String {
  AutodefinedReverseFlag toAutodefinedReverseFlag() {
    switch (this) {
      case 'ENABLE':
        return AutodefinedReverseFlag.enable;
      case 'DISABLE':
        return AutodefinedReverseFlag.disable;
      case 'USE_LOCAL_RESOURCE_SETTING':
        return AutodefinedReverseFlag.useLocalResourceSetting;
    }
    throw Exception('$this is not known in enum AutodefinedReverseFlag');
  }
}

enum BlockOverrideDnsType {
  cname,
}

extension BlockOverrideDnsTypeValueExtension on BlockOverrideDnsType {
  String toValue() {
    switch (this) {
      case BlockOverrideDnsType.cname:
        return 'CNAME';
    }
  }
}

extension BlockOverrideDnsTypeFromString on String {
  BlockOverrideDnsType toBlockOverrideDnsType() {
    switch (this) {
      case 'CNAME':
        return BlockOverrideDnsType.cname;
    }
    throw Exception('$this is not known in enum BlockOverrideDnsType');
  }
}

enum BlockResponse {
  nodata,
  nxdomain,
  override,
}

extension BlockResponseValueExtension on BlockResponse {
  String toValue() {
    switch (this) {
      case BlockResponse.nodata:
        return 'NODATA';
      case BlockResponse.nxdomain:
        return 'NXDOMAIN';
      case BlockResponse.override:
        return 'OVERRIDE';
    }
  }
}

extension BlockResponseFromString on String {
  BlockResponse toBlockResponse() {
    switch (this) {
      case 'NODATA':
        return BlockResponse.nodata;
      case 'NXDOMAIN':
        return BlockResponse.nxdomain;
      case 'OVERRIDE':
        return BlockResponse.override;
    }
    throw Exception('$this is not known in enum BlockResponse');
  }
}

class CreateFirewallDomainListResponse {
  /// The domain list that you just created.
  final FirewallDomainList? firewallDomainList;

  CreateFirewallDomainListResponse({
    this.firewallDomainList,
  });

  factory CreateFirewallDomainListResponse.fromJson(Map<String, dynamic> json) {
    return CreateFirewallDomainListResponse(
      firewallDomainList: json['FirewallDomainList'] != null
          ? FirewallDomainList.fromJson(
              json['FirewallDomainList'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallDomainList = this.firewallDomainList;
    return {
      if (firewallDomainList != null) 'FirewallDomainList': firewallDomainList,
    };
  }
}

class CreateFirewallRuleGroupResponse {
  /// A collection of rules used to filter DNS network traffic.
  final FirewallRuleGroup? firewallRuleGroup;

  CreateFirewallRuleGroupResponse({
    this.firewallRuleGroup,
  });

  factory CreateFirewallRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateFirewallRuleGroupResponse(
      firewallRuleGroup: json['FirewallRuleGroup'] != null
          ? FirewallRuleGroup.fromJson(
              json['FirewallRuleGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallRuleGroup = this.firewallRuleGroup;
    return {
      if (firewallRuleGroup != null) 'FirewallRuleGroup': firewallRuleGroup,
    };
  }
}

class CreateFirewallRuleResponse {
  /// The firewall rule that you just created.
  final FirewallRule? firewallRule;

  CreateFirewallRuleResponse({
    this.firewallRule,
  });

  factory CreateFirewallRuleResponse.fromJson(Map<String, dynamic> json) {
    return CreateFirewallRuleResponse(
      firewallRule: json['FirewallRule'] != null
          ? FirewallRule.fromJson(json['FirewallRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallRule = this.firewallRule;
    return {
      if (firewallRule != null) 'FirewallRule': firewallRule,
    };
  }
}

class CreateOutpostResolverResponse {
  /// Information about the <code>CreateOutpostResolver</code> request, including
  /// the status of the request.
  final OutpostResolver? outpostResolver;

  CreateOutpostResolverResponse({
    this.outpostResolver,
  });

  factory CreateOutpostResolverResponse.fromJson(Map<String, dynamic> json) {
    return CreateOutpostResolverResponse(
      outpostResolver: json['OutpostResolver'] != null
          ? OutpostResolver.fromJson(
              json['OutpostResolver'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final outpostResolver = this.outpostResolver;
    return {
      if (outpostResolver != null) 'OutpostResolver': outpostResolver,
    };
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

  Map<String, dynamic> toJson() {
    final resolverEndpoint = this.resolverEndpoint;
    return {
      if (resolverEndpoint != null) 'ResolverEndpoint': resolverEndpoint,
    };
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

  Map<String, dynamic> toJson() {
    final resolverQueryLogConfig = this.resolverQueryLogConfig;
    return {
      if (resolverQueryLogConfig != null)
        'ResolverQueryLogConfig': resolverQueryLogConfig,
    };
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

  Map<String, dynamic> toJson() {
    final resolverRule = this.resolverRule;
    return {
      if (resolverRule != null) 'ResolverRule': resolverRule,
    };
  }
}

class DeleteFirewallDomainListResponse {
  /// The domain list that you just deleted.
  final FirewallDomainList? firewallDomainList;

  DeleteFirewallDomainListResponse({
    this.firewallDomainList,
  });

  factory DeleteFirewallDomainListResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFirewallDomainListResponse(
      firewallDomainList: json['FirewallDomainList'] != null
          ? FirewallDomainList.fromJson(
              json['FirewallDomainList'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallDomainList = this.firewallDomainList;
    return {
      if (firewallDomainList != null) 'FirewallDomainList': firewallDomainList,
    };
  }
}

class DeleteFirewallRuleGroupResponse {
  /// A collection of rules used to filter DNS network traffic.
  final FirewallRuleGroup? firewallRuleGroup;

  DeleteFirewallRuleGroupResponse({
    this.firewallRuleGroup,
  });

  factory DeleteFirewallRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFirewallRuleGroupResponse(
      firewallRuleGroup: json['FirewallRuleGroup'] != null
          ? FirewallRuleGroup.fromJson(
              json['FirewallRuleGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallRuleGroup = this.firewallRuleGroup;
    return {
      if (firewallRuleGroup != null) 'FirewallRuleGroup': firewallRuleGroup,
    };
  }
}

class DeleteFirewallRuleResponse {
  /// The specification for the firewall rule that you just deleted.
  final FirewallRule? firewallRule;

  DeleteFirewallRuleResponse({
    this.firewallRule,
  });

  factory DeleteFirewallRuleResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFirewallRuleResponse(
      firewallRule: json['FirewallRule'] != null
          ? FirewallRule.fromJson(json['FirewallRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallRule = this.firewallRule;
    return {
      if (firewallRule != null) 'FirewallRule': firewallRule,
    };
  }
}

class DeleteOutpostResolverResponse {
  /// Information about the <code>DeleteOutpostResolver</code> request, including
  /// the status of the request.
  final OutpostResolver? outpostResolver;

  DeleteOutpostResolverResponse({
    this.outpostResolver,
  });

  factory DeleteOutpostResolverResponse.fromJson(Map<String, dynamic> json) {
    return DeleteOutpostResolverResponse(
      outpostResolver: json['OutpostResolver'] != null
          ? OutpostResolver.fromJson(
              json['OutpostResolver'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final outpostResolver = this.outpostResolver;
    return {
      if (outpostResolver != null) 'OutpostResolver': outpostResolver,
    };
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

  Map<String, dynamic> toJson() {
    final resolverEndpoint = this.resolverEndpoint;
    return {
      if (resolverEndpoint != null) 'ResolverEndpoint': resolverEndpoint,
    };
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

  Map<String, dynamic> toJson() {
    final resolverQueryLogConfig = this.resolverQueryLogConfig;
    return {
      if (resolverQueryLogConfig != null)
        'ResolverQueryLogConfig': resolverQueryLogConfig,
    };
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

  Map<String, dynamic> toJson() {
    final resolverRule = this.resolverRule;
    return {
      if (resolverRule != null) 'ResolverRule': resolverRule,
    };
  }
}

class DisassociateFirewallRuleGroupResponse {
  /// The firewall rule group association that you just removed.
  final FirewallRuleGroupAssociation? firewallRuleGroupAssociation;

  DisassociateFirewallRuleGroupResponse({
    this.firewallRuleGroupAssociation,
  });

  factory DisassociateFirewallRuleGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateFirewallRuleGroupResponse(
      firewallRuleGroupAssociation: json['FirewallRuleGroupAssociation'] != null
          ? FirewallRuleGroupAssociation.fromJson(
              json['FirewallRuleGroupAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallRuleGroupAssociation = this.firewallRuleGroupAssociation;
    return {
      if (firewallRuleGroupAssociation != null)
        'FirewallRuleGroupAssociation': firewallRuleGroupAssociation,
    };
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

  Map<String, dynamic> toJson() {
    final resolverEndpoint = this.resolverEndpoint;
    return {
      if (resolverEndpoint != null) 'ResolverEndpoint': resolverEndpoint,
    };
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

  Map<String, dynamic> toJson() {
    final resolverQueryLogConfigAssociation =
        this.resolverQueryLogConfigAssociation;
    return {
      if (resolverQueryLogConfigAssociation != null)
        'ResolverQueryLogConfigAssociation': resolverQueryLogConfigAssociation,
    };
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

  Map<String, dynamic> toJson() {
    final resolverRuleAssociation = this.resolverRuleAssociation;
    return {
      if (resolverRuleAssociation != null)
        'ResolverRuleAssociation': resolverRuleAssociation,
    };
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
  /// <code>HostVPCId</code>: The ID of the VPC that inbound DNS queries pass
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
  /// <code>Destination</code>: The Amazon Web Services service that you want to
  /// forward query logs to. Valid values include the following:
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
  /// <code>OwnerId</code>: The Amazon Web Services account ID for the account
  /// that created the query logging configuration.
  /// </li>
  /// <li>
  /// <code>ShareStatus</code>: An indication of whether the query logging
  /// configuration is shared with other Amazon Web Services accounts, or was
  /// shared with the current account by another Amazon Web Services account.
  /// Valid values include: <code>NOT_SHARED</code>, <code>SHARED_WITH_ME</code>,
  /// or <code>SHARED_BY_ME</code>.
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

/// Configuration of the firewall behavior provided by DNS Firewall for a single
/// VPC from Amazon Virtual Private Cloud (Amazon VPC).
class FirewallConfig {
  /// Determines how DNS Firewall operates during failures, for example when all
  /// traffic that is sent to DNS Firewall fails to receive a reply.
  ///
  /// <ul>
  /// <li>
  /// By default, fail open is disabled, which means the failure mode is closed.
  /// This approach favors security over availability. DNS Firewall returns a
  /// failure error when it is unable to properly evaluate a query.
  /// </li>
  /// <li>
  /// If you enable this option, the failure mode is open. This approach favors
  /// availability over security. DNS Firewall allows queries to proceed if it is
  /// unable to properly evaluate them.
  /// </li>
  /// </ul>
  /// This behavior is only enforced for VPCs that have at least one DNS Firewall
  /// rule group association.
  final FirewallFailOpenStatus? firewallFailOpen;

  /// The ID of the firewall configuration.
  final String? id;

  /// The Amazon Web Services account ID of the owner of the VPC that this
  /// firewall configuration applies to.
  final String? ownerId;

  /// The ID of the VPC that this firewall configuration applies to.
  final String? resourceId;

  FirewallConfig({
    this.firewallFailOpen,
    this.id,
    this.ownerId,
    this.resourceId,
  });

  factory FirewallConfig.fromJson(Map<String, dynamic> json) {
    return FirewallConfig(
      firewallFailOpen:
          (json['FirewallFailOpen'] as String?)?.toFirewallFailOpenStatus(),
      id: json['Id'] as String?,
      ownerId: json['OwnerId'] as String?,
      resourceId: json['ResourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallFailOpen = this.firewallFailOpen;
    final id = this.id;
    final ownerId = this.ownerId;
    final resourceId = this.resourceId;
    return {
      if (firewallFailOpen != null)
        'FirewallFailOpen': firewallFailOpen.toValue(),
      if (id != null) 'Id': id,
      if (ownerId != null) 'OwnerId': ownerId,
      if (resourceId != null) 'ResourceId': resourceId,
    };
  }
}

enum FirewallDomainImportOperation {
  replace,
}

extension FirewallDomainImportOperationValueExtension
    on FirewallDomainImportOperation {
  String toValue() {
    switch (this) {
      case FirewallDomainImportOperation.replace:
        return 'REPLACE';
    }
  }
}

extension FirewallDomainImportOperationFromString on String {
  FirewallDomainImportOperation toFirewallDomainImportOperation() {
    switch (this) {
      case 'REPLACE':
        return FirewallDomainImportOperation.replace;
    }
    throw Exception('$this is not known in enum FirewallDomainImportOperation');
  }
}

/// High-level information about a list of firewall domains for use in a
/// <a>FirewallRule</a>. This is returned by <a>GetFirewallDomainList</a>.
///
/// To retrieve the domains that are defined for this domain list, call
/// <a>ListFirewallDomains</a>.
class FirewallDomainList {
  /// The Amazon Resource Name (ARN) of the firewall domain list.
  final String? arn;

  /// The date and time that the domain list was created, in Unix time format and
  /// Coordinated Universal Time (UTC).
  final String? creationTime;

  /// A unique string defined by you to identify the request. This allows you to
  /// retry failed requests without the risk of running the operation twice. This
  /// can be any unique string, for example, a timestamp.
  final String? creatorRequestId;

  /// The number of domain names that are specified in the domain list.
  final int? domainCount;

  /// The ID of the domain list.
  final String? id;

  /// The owner of the list, used only for lists that are not managed by you. For
  /// example, the managed domain list
  /// <code>AWSManagedDomainsMalwareDomainList</code> has the managed owner name
  /// <code>Route 53 Resolver DNS Firewall</code>.
  final String? managedOwnerName;

  /// The date and time that the domain list was last modified, in Unix time
  /// format and Coordinated Universal Time (UTC).
  final String? modificationTime;

  /// The name of the domain list.
  final String? name;

  /// The status of the domain list.
  final FirewallDomainListStatus? status;

  /// Additional information about the status of the list, if available.
  final String? statusMessage;

  FirewallDomainList({
    this.arn,
    this.creationTime,
    this.creatorRequestId,
    this.domainCount,
    this.id,
    this.managedOwnerName,
    this.modificationTime,
    this.name,
    this.status,
    this.statusMessage,
  });

  factory FirewallDomainList.fromJson(Map<String, dynamic> json) {
    return FirewallDomainList(
      arn: json['Arn'] as String?,
      creationTime: json['CreationTime'] as String?,
      creatorRequestId: json['CreatorRequestId'] as String?,
      domainCount: json['DomainCount'] as int?,
      id: json['Id'] as String?,
      managedOwnerName: json['ManagedOwnerName'] as String?,
      modificationTime: json['ModificationTime'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toFirewallDomainListStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final creatorRequestId = this.creatorRequestId;
    final domainCount = this.domainCount;
    final id = this.id;
    final managedOwnerName = this.managedOwnerName;
    final modificationTime = this.modificationTime;
    final name = this.name;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null) 'CreationTime': creationTime,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (domainCount != null) 'DomainCount': domainCount,
      if (id != null) 'Id': id,
      if (managedOwnerName != null) 'ManagedOwnerName': managedOwnerName,
      if (modificationTime != null) 'ModificationTime': modificationTime,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// Minimal high-level information for a firewall domain list. The action
/// <a>ListFirewallDomainLists</a> returns an array of these objects.
///
/// To retrieve full information for a firewall domain list, call
/// <a>GetFirewallDomainList</a> and <a>ListFirewallDomains</a>.
class FirewallDomainListMetadata {
  /// The Amazon Resource Name (ARN) of the firewall domain list metadata.
  final String? arn;

  /// A unique string defined by you to identify the request. This allows you to
  /// retry failed requests without the risk of running the operation twice. This
  /// can be any unique string, for example, a timestamp.
  final String? creatorRequestId;

  /// The ID of the domain list.
  final String? id;

  /// The owner of the list, used only for lists that are not managed by you. For
  /// example, the managed domain list
  /// <code>AWSManagedDomainsMalwareDomainList</code> has the managed owner name
  /// <code>Route 53 Resolver DNS Firewall</code>.
  final String? managedOwnerName;

  /// The name of the domain list.
  final String? name;

  FirewallDomainListMetadata({
    this.arn,
    this.creatorRequestId,
    this.id,
    this.managedOwnerName,
    this.name,
  });

  factory FirewallDomainListMetadata.fromJson(Map<String, dynamic> json) {
    return FirewallDomainListMetadata(
      arn: json['Arn'] as String?,
      creatorRequestId: json['CreatorRequestId'] as String?,
      id: json['Id'] as String?,
      managedOwnerName: json['ManagedOwnerName'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creatorRequestId = this.creatorRequestId;
    final id = this.id;
    final managedOwnerName = this.managedOwnerName;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (id != null) 'Id': id,
      if (managedOwnerName != null) 'ManagedOwnerName': managedOwnerName,
      if (name != null) 'Name': name,
    };
  }
}

enum FirewallDomainListStatus {
  complete,
  completeImportFailed,
  importing,
  deleting,
  updating,
}

extension FirewallDomainListStatusValueExtension on FirewallDomainListStatus {
  String toValue() {
    switch (this) {
      case FirewallDomainListStatus.complete:
        return 'COMPLETE';
      case FirewallDomainListStatus.completeImportFailed:
        return 'COMPLETE_IMPORT_FAILED';
      case FirewallDomainListStatus.importing:
        return 'IMPORTING';
      case FirewallDomainListStatus.deleting:
        return 'DELETING';
      case FirewallDomainListStatus.updating:
        return 'UPDATING';
    }
  }
}

extension FirewallDomainListStatusFromString on String {
  FirewallDomainListStatus toFirewallDomainListStatus() {
    switch (this) {
      case 'COMPLETE':
        return FirewallDomainListStatus.complete;
      case 'COMPLETE_IMPORT_FAILED':
        return FirewallDomainListStatus.completeImportFailed;
      case 'IMPORTING':
        return FirewallDomainListStatus.importing;
      case 'DELETING':
        return FirewallDomainListStatus.deleting;
      case 'UPDATING':
        return FirewallDomainListStatus.updating;
    }
    throw Exception('$this is not known in enum FirewallDomainListStatus');
  }
}

enum FirewallDomainRedirectionAction {
  inspectRedirectionDomain,
  trustRedirectionDomain,
}

extension FirewallDomainRedirectionActionValueExtension
    on FirewallDomainRedirectionAction {
  String toValue() {
    switch (this) {
      case FirewallDomainRedirectionAction.inspectRedirectionDomain:
        return 'INSPECT_REDIRECTION_DOMAIN';
      case FirewallDomainRedirectionAction.trustRedirectionDomain:
        return 'TRUST_REDIRECTION_DOMAIN';
    }
  }
}

extension FirewallDomainRedirectionActionFromString on String {
  FirewallDomainRedirectionAction toFirewallDomainRedirectionAction() {
    switch (this) {
      case 'INSPECT_REDIRECTION_DOMAIN':
        return FirewallDomainRedirectionAction.inspectRedirectionDomain;
      case 'TRUST_REDIRECTION_DOMAIN':
        return FirewallDomainRedirectionAction.trustRedirectionDomain;
    }
    throw Exception(
        '$this is not known in enum FirewallDomainRedirectionAction');
  }
}

enum FirewallDomainUpdateOperation {
  add,
  remove,
  replace,
}

extension FirewallDomainUpdateOperationValueExtension
    on FirewallDomainUpdateOperation {
  String toValue() {
    switch (this) {
      case FirewallDomainUpdateOperation.add:
        return 'ADD';
      case FirewallDomainUpdateOperation.remove:
        return 'REMOVE';
      case FirewallDomainUpdateOperation.replace:
        return 'REPLACE';
    }
  }
}

extension FirewallDomainUpdateOperationFromString on String {
  FirewallDomainUpdateOperation toFirewallDomainUpdateOperation() {
    switch (this) {
      case 'ADD':
        return FirewallDomainUpdateOperation.add;
      case 'REMOVE':
        return FirewallDomainUpdateOperation.remove;
      case 'REPLACE':
        return FirewallDomainUpdateOperation.replace;
    }
    throw Exception('$this is not known in enum FirewallDomainUpdateOperation');
  }
}

enum FirewallFailOpenStatus {
  enabled,
  disabled,
  useLocalResourceSetting,
}

extension FirewallFailOpenStatusValueExtension on FirewallFailOpenStatus {
  String toValue() {
    switch (this) {
      case FirewallFailOpenStatus.enabled:
        return 'ENABLED';
      case FirewallFailOpenStatus.disabled:
        return 'DISABLED';
      case FirewallFailOpenStatus.useLocalResourceSetting:
        return 'USE_LOCAL_RESOURCE_SETTING';
    }
  }
}

extension FirewallFailOpenStatusFromString on String {
  FirewallFailOpenStatus toFirewallFailOpenStatus() {
    switch (this) {
      case 'ENABLED':
        return FirewallFailOpenStatus.enabled;
      case 'DISABLED':
        return FirewallFailOpenStatus.disabled;
      case 'USE_LOCAL_RESOURCE_SETTING':
        return FirewallFailOpenStatus.useLocalResourceSetting;
    }
    throw Exception('$this is not known in enum FirewallFailOpenStatus');
  }
}

/// A single firewall rule in a rule group.
class FirewallRule {
  /// The action that DNS Firewall should take on a DNS query when it matches one
  /// of the domains in the rule's domain list:
  ///
  /// <ul>
  /// <li>
  /// <code>ALLOW</code> - Permit the request to go through.
  /// </li>
  /// <li>
  /// <code>ALERT</code> - Permit the request to go through but send an alert to
  /// the logs.
  /// </li>
  /// <li>
  /// <code>BLOCK</code> - Disallow the request. If this is specified, additional
  /// handling details are provided in the rule's <code>BlockResponse</code>
  /// setting.
  /// </li>
  /// </ul>
  final Action? action;

  /// The DNS record's type. This determines the format of the record value that
  /// you provided in <code>BlockOverrideDomain</code>. Used for the rule action
  /// <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  final BlockOverrideDnsType? blockOverrideDnsType;

  /// The custom DNS record to send back in response to the query. Used for the
  /// rule action <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  final String? blockOverrideDomain;

  /// The recommended amount of time, in seconds, for the DNS resolver or web
  /// browser to cache the provided override record. Used for the rule action
  /// <code>BLOCK</code> with a <code>BlockResponse</code> setting of
  /// <code>OVERRIDE</code>.
  final int? blockOverrideTtl;

  /// The way that you want DNS Firewall to block the request. Used for the rule
  /// action setting <code>BLOCK</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>NODATA</code> - Respond indicating that the query was successful, but
  /// no response is available for it.
  /// </li>
  /// <li>
  /// <code>NXDOMAIN</code> - Respond indicating that the domain name that's in
  /// the query doesn't exist.
  /// </li>
  /// <li>
  /// <code>OVERRIDE</code> - Provide a custom override in the response. This
  /// option requires custom handling details in the rule's
  /// <code>BlockOverride*</code> settings.
  /// </li>
  /// </ul>
  final BlockResponse? blockResponse;

  /// The date and time that the rule was created, in Unix time format and
  /// Coordinated Universal Time (UTC).
  final String? creationTime;

  /// A unique string defined by you to identify the request. This allows you to
  /// retry failed requests without the risk of executing the operation twice.
  /// This can be any unique string, for example, a timestamp.
  final String? creatorRequestId;

  /// The ID of the domain list that's used in the rule.
  final String? firewallDomainListId;

  /// How you want the the rule to evaluate DNS redirection in the DNS redirection
  /// chain, such as CNAME or DNAME.
  ///
  /// <code>Inspect_Redirection_Domain </code>(Default) inspects all domains in
  /// the redirection chain. The individual domains in the redirection chain must
  /// be added to the domain list.
  ///
  /// <code>Trust_Redirection_Domain </code> inspects only the first domain in the
  /// redirection chain. You don't need to add the subsequent domains in the
  /// domain in the redirection list to the domain list.
  final FirewallDomainRedirectionAction? firewallDomainRedirectionAction;

  /// The unique identifier of the firewall rule group of the rule.
  final String? firewallRuleGroupId;

  /// The date and time that the rule was last modified, in Unix time format and
  /// Coordinated Universal Time (UTC).
  final String? modificationTime;

  /// The name of the rule.
  final String? name;

  /// The priority of the rule in the rule group. This value must be unique within
  /// the rule group. DNS Firewall processes the rules in a rule group by order of
  /// priority, starting from the lowest setting.
  final int? priority;

  /// The DNS query type you want the rule to evaluate. Allowed values are;
  ///
  /// <ul>
  /// <li>
  /// A: Returns an IPv4 address.
  /// </li>
  /// <li>
  /// AAAA: Returns an Ipv6 address.
  /// </li>
  /// <li>
  /// CAA: Restricts CAs that can create SSL/TLS certifications for the domain.
  /// </li>
  /// <li>
  /// CNAME: Returns another domain name.
  /// </li>
  /// <li>
  /// DS: Record that identifies the DNSSEC signing key of a delegated zone.
  /// </li>
  /// <li>
  /// MX: Specifies mail servers.
  /// </li>
  /// <li>
  /// NAPTR: Regular-expression-based rewriting of domain names.
  /// </li>
  /// <li>
  /// NS: Authoritative name servers.
  /// </li>
  /// <li>
  /// PTR: Maps an IP address to a domain name.
  /// </li>
  /// <li>
  /// SOA: Start of authority record for the zone.
  /// </li>
  /// <li>
  /// SPF: Lists the servers authorized to send emails from a domain.
  /// </li>
  /// <li>
  /// SRV: Application specific values that identify servers.
  /// </li>
  /// <li>
  /// TXT: Verifies email senders and application-specific values.
  /// </li>
  /// <li>
  /// A query type you define by using the DNS type ID, for example 28 for AAAA.
  /// The values must be defined as TYPENUMBER, where the NUMBER can be 1-65334,
  /// for example, TYPE28. For more information, see <a
  /// href="https://en.wikipedia.org/wiki/List_of_DNS_record_types">List of DNS
  /// record types</a>.
  /// </li>
  /// </ul>
  final String? qtype;

  FirewallRule({
    this.action,
    this.blockOverrideDnsType,
    this.blockOverrideDomain,
    this.blockOverrideTtl,
    this.blockResponse,
    this.creationTime,
    this.creatorRequestId,
    this.firewallDomainListId,
    this.firewallDomainRedirectionAction,
    this.firewallRuleGroupId,
    this.modificationTime,
    this.name,
    this.priority,
    this.qtype,
  });

  factory FirewallRule.fromJson(Map<String, dynamic> json) {
    return FirewallRule(
      action: (json['Action'] as String?)?.toAction(),
      blockOverrideDnsType:
          (json['BlockOverrideDnsType'] as String?)?.toBlockOverrideDnsType(),
      blockOverrideDomain: json['BlockOverrideDomain'] as String?,
      blockOverrideTtl: json['BlockOverrideTtl'] as int?,
      blockResponse: (json['BlockResponse'] as String?)?.toBlockResponse(),
      creationTime: json['CreationTime'] as String?,
      creatorRequestId: json['CreatorRequestId'] as String?,
      firewallDomainListId: json['FirewallDomainListId'] as String?,
      firewallDomainRedirectionAction:
          (json['FirewallDomainRedirectionAction'] as String?)
              ?.toFirewallDomainRedirectionAction(),
      firewallRuleGroupId: json['FirewallRuleGroupId'] as String?,
      modificationTime: json['ModificationTime'] as String?,
      name: json['Name'] as String?,
      priority: json['Priority'] as int?,
      qtype: json['Qtype'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final blockOverrideDnsType = this.blockOverrideDnsType;
    final blockOverrideDomain = this.blockOverrideDomain;
    final blockOverrideTtl = this.blockOverrideTtl;
    final blockResponse = this.blockResponse;
    final creationTime = this.creationTime;
    final creatorRequestId = this.creatorRequestId;
    final firewallDomainListId = this.firewallDomainListId;
    final firewallDomainRedirectionAction =
        this.firewallDomainRedirectionAction;
    final firewallRuleGroupId = this.firewallRuleGroupId;
    final modificationTime = this.modificationTime;
    final name = this.name;
    final priority = this.priority;
    final qtype = this.qtype;
    return {
      if (action != null) 'Action': action.toValue(),
      if (blockOverrideDnsType != null)
        'BlockOverrideDnsType': blockOverrideDnsType.toValue(),
      if (blockOverrideDomain != null)
        'BlockOverrideDomain': blockOverrideDomain,
      if (blockOverrideTtl != null) 'BlockOverrideTtl': blockOverrideTtl,
      if (blockResponse != null) 'BlockResponse': blockResponse.toValue(),
      if (creationTime != null) 'CreationTime': creationTime,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (firewallDomainListId != null)
        'FirewallDomainListId': firewallDomainListId,
      if (firewallDomainRedirectionAction != null)
        'FirewallDomainRedirectionAction':
            firewallDomainRedirectionAction.toValue(),
      if (firewallRuleGroupId != null)
        'FirewallRuleGroupId': firewallRuleGroupId,
      if (modificationTime != null) 'ModificationTime': modificationTime,
      if (name != null) 'Name': name,
      if (priority != null) 'Priority': priority,
      if (qtype != null) 'Qtype': qtype,
    };
  }
}

/// High-level information for a firewall rule group. A firewall rule group is a
/// collection of rules that DNS Firewall uses to filter DNS network traffic for
/// a VPC. To retrieve the rules for the rule group, call
/// <a>ListFirewallRules</a>.
class FirewallRuleGroup {
  /// The ARN (Amazon Resource Name) of the rule group.
  final String? arn;

  /// The date and time that the rule group was created, in Unix time format and
  /// Coordinated Universal Time (UTC).
  final String? creationTime;

  /// A unique string defined by you to identify the request. This allows you to
  /// retry failed requests without the risk of running the operation twice. This
  /// can be any unique string, for example, a timestamp.
  final String? creatorRequestId;

  /// The ID of the rule group.
  final String? id;

  /// The date and time that the rule group was last modified, in Unix time format
  /// and Coordinated Universal Time (UTC).
  final String? modificationTime;

  /// The name of the rule group.
  final String? name;

  /// The Amazon Web Services account ID for the account that created the rule
  /// group. When a rule group is shared with your account, this is the account
  /// that has shared the rule group with you.
  final String? ownerId;

  /// The number of rules in the rule group.
  final int? ruleCount;

  /// Whether the rule group is shared with other Amazon Web Services accounts, or
  /// was shared with the current account by another Amazon Web Services account.
  /// Sharing is configured through Resource Access Manager (RAM).
  final ShareStatus? shareStatus;

  /// The status of the domain list.
  final FirewallRuleGroupStatus? status;

  /// Additional information about the status of the rule group, if available.
  final String? statusMessage;

  FirewallRuleGroup({
    this.arn,
    this.creationTime,
    this.creatorRequestId,
    this.id,
    this.modificationTime,
    this.name,
    this.ownerId,
    this.ruleCount,
    this.shareStatus,
    this.status,
    this.statusMessage,
  });

  factory FirewallRuleGroup.fromJson(Map<String, dynamic> json) {
    return FirewallRuleGroup(
      arn: json['Arn'] as String?,
      creationTime: json['CreationTime'] as String?,
      creatorRequestId: json['CreatorRequestId'] as String?,
      id: json['Id'] as String?,
      modificationTime: json['ModificationTime'] as String?,
      name: json['Name'] as String?,
      ownerId: json['OwnerId'] as String?,
      ruleCount: json['RuleCount'] as int?,
      shareStatus: (json['ShareStatus'] as String?)?.toShareStatus(),
      status: (json['Status'] as String?)?.toFirewallRuleGroupStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final creatorRequestId = this.creatorRequestId;
    final id = this.id;
    final modificationTime = this.modificationTime;
    final name = this.name;
    final ownerId = this.ownerId;
    final ruleCount = this.ruleCount;
    final shareStatus = this.shareStatus;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null) 'CreationTime': creationTime,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (id != null) 'Id': id,
      if (modificationTime != null) 'ModificationTime': modificationTime,
      if (name != null) 'Name': name,
      if (ownerId != null) 'OwnerId': ownerId,
      if (ruleCount != null) 'RuleCount': ruleCount,
      if (shareStatus != null) 'ShareStatus': shareStatus.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// An association between a firewall rule group and a VPC, which enables DNS
/// filtering for the VPC.
class FirewallRuleGroupAssociation {
  /// The Amazon Resource Name (ARN) of the firewall rule group association.
  final String? arn;

  /// The date and time that the association was created, in Unix time format and
  /// Coordinated Universal Time (UTC).
  final String? creationTime;

  /// A unique string defined by you to identify the request. This allows you to
  /// retry failed requests without the risk of running the operation twice. This
  /// can be any unique string, for example, a timestamp.
  final String? creatorRequestId;

  /// The unique identifier of the firewall rule group.
  final String? firewallRuleGroupId;

  /// The identifier for the association.
  final String? id;

  /// The owner of the association, used only for associations that are not
  /// managed by you. If you use Firewall Manager to manage your DNS Firewalls,
  /// then this reports Firewall Manager as the managed owner.
  final String? managedOwnerName;

  /// The date and time that the association was last modified, in Unix time
  /// format and Coordinated Universal Time (UTC).
  final String? modificationTime;

  /// If enabled, this setting disallows modification or removal of the
  /// association, to help prevent against accidentally altering DNS firewall
  /// protections.
  final MutationProtectionStatus? mutationProtection;

  /// The name of the association.
  final String? name;

  /// The setting that determines the processing order of the rule group among the
  /// rule groups that are associated with a single VPC. DNS Firewall filters VPC
  /// traffic starting from rule group with the lowest numeric priority setting.
  final int? priority;

  /// The current status of the association.
  final FirewallRuleGroupAssociationStatus? status;

  /// Additional information about the status of the response, if available.
  final String? statusMessage;

  /// The unique identifier of the VPC that is associated with the rule group.
  final String? vpcId;

  FirewallRuleGroupAssociation({
    this.arn,
    this.creationTime,
    this.creatorRequestId,
    this.firewallRuleGroupId,
    this.id,
    this.managedOwnerName,
    this.modificationTime,
    this.mutationProtection,
    this.name,
    this.priority,
    this.status,
    this.statusMessage,
    this.vpcId,
  });

  factory FirewallRuleGroupAssociation.fromJson(Map<String, dynamic> json) {
    return FirewallRuleGroupAssociation(
      arn: json['Arn'] as String?,
      creationTime: json['CreationTime'] as String?,
      creatorRequestId: json['CreatorRequestId'] as String?,
      firewallRuleGroupId: json['FirewallRuleGroupId'] as String?,
      id: json['Id'] as String?,
      managedOwnerName: json['ManagedOwnerName'] as String?,
      modificationTime: json['ModificationTime'] as String?,
      mutationProtection:
          (json['MutationProtection'] as String?)?.toMutationProtectionStatus(),
      name: json['Name'] as String?,
      priority: json['Priority'] as int?,
      status:
          (json['Status'] as String?)?.toFirewallRuleGroupAssociationStatus(),
      statusMessage: json['StatusMessage'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final creatorRequestId = this.creatorRequestId;
    final firewallRuleGroupId = this.firewallRuleGroupId;
    final id = this.id;
    final managedOwnerName = this.managedOwnerName;
    final modificationTime = this.modificationTime;
    final mutationProtection = this.mutationProtection;
    final name = this.name;
    final priority = this.priority;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final vpcId = this.vpcId;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null) 'CreationTime': creationTime,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (firewallRuleGroupId != null)
        'FirewallRuleGroupId': firewallRuleGroupId,
      if (id != null) 'Id': id,
      if (managedOwnerName != null) 'ManagedOwnerName': managedOwnerName,
      if (modificationTime != null) 'ModificationTime': modificationTime,
      if (mutationProtection != null)
        'MutationProtection': mutationProtection.toValue(),
      if (name != null) 'Name': name,
      if (priority != null) 'Priority': priority,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

enum FirewallRuleGroupAssociationStatus {
  complete,
  deleting,
  updating,
}

extension FirewallRuleGroupAssociationStatusValueExtension
    on FirewallRuleGroupAssociationStatus {
  String toValue() {
    switch (this) {
      case FirewallRuleGroupAssociationStatus.complete:
        return 'COMPLETE';
      case FirewallRuleGroupAssociationStatus.deleting:
        return 'DELETING';
      case FirewallRuleGroupAssociationStatus.updating:
        return 'UPDATING';
    }
  }
}

extension FirewallRuleGroupAssociationStatusFromString on String {
  FirewallRuleGroupAssociationStatus toFirewallRuleGroupAssociationStatus() {
    switch (this) {
      case 'COMPLETE':
        return FirewallRuleGroupAssociationStatus.complete;
      case 'DELETING':
        return FirewallRuleGroupAssociationStatus.deleting;
      case 'UPDATING':
        return FirewallRuleGroupAssociationStatus.updating;
    }
    throw Exception(
        '$this is not known in enum FirewallRuleGroupAssociationStatus');
  }
}

/// Minimal high-level information for a firewall rule group. The action
/// <a>ListFirewallRuleGroups</a> returns an array of these objects.
///
/// To retrieve full information for a firewall rule group, call
/// <a>GetFirewallRuleGroup</a> and <a>ListFirewallRules</a>.
class FirewallRuleGroupMetadata {
  /// The ARN (Amazon Resource Name) of the rule group.
  final String? arn;

  /// A unique string defined by you to identify the request. This allows you to
  /// retry failed requests without the risk of running the operation twice. This
  /// can be any unique string, for example, a timestamp.
  final String? creatorRequestId;

  /// The ID of the rule group.
  final String? id;

  /// The name of the rule group.
  final String? name;

  /// The Amazon Web Services account ID for the account that created the rule
  /// group. When a rule group is shared with your account, this is the account
  /// that has shared the rule group with you.
  final String? ownerId;

  /// Whether the rule group is shared with other Amazon Web Services accounts, or
  /// was shared with the current account by another Amazon Web Services account.
  /// Sharing is configured through Resource Access Manager (RAM).
  final ShareStatus? shareStatus;

  FirewallRuleGroupMetadata({
    this.arn,
    this.creatorRequestId,
    this.id,
    this.name,
    this.ownerId,
    this.shareStatus,
  });

  factory FirewallRuleGroupMetadata.fromJson(Map<String, dynamic> json) {
    return FirewallRuleGroupMetadata(
      arn: json['Arn'] as String?,
      creatorRequestId: json['CreatorRequestId'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      ownerId: json['OwnerId'] as String?,
      shareStatus: (json['ShareStatus'] as String?)?.toShareStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creatorRequestId = this.creatorRequestId;
    final id = this.id;
    final name = this.name;
    final ownerId = this.ownerId;
    final shareStatus = this.shareStatus;
    return {
      if (arn != null) 'Arn': arn,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (ownerId != null) 'OwnerId': ownerId,
      if (shareStatus != null) 'ShareStatus': shareStatus.toValue(),
    };
  }
}

enum FirewallRuleGroupStatus {
  complete,
  deleting,
  updating,
}

extension FirewallRuleGroupStatusValueExtension on FirewallRuleGroupStatus {
  String toValue() {
    switch (this) {
      case FirewallRuleGroupStatus.complete:
        return 'COMPLETE';
      case FirewallRuleGroupStatus.deleting:
        return 'DELETING';
      case FirewallRuleGroupStatus.updating:
        return 'UPDATING';
    }
  }
}

extension FirewallRuleGroupStatusFromString on String {
  FirewallRuleGroupStatus toFirewallRuleGroupStatus() {
    switch (this) {
      case 'COMPLETE':
        return FirewallRuleGroupStatus.complete;
      case 'DELETING':
        return FirewallRuleGroupStatus.deleting;
      case 'UPDATING':
        return FirewallRuleGroupStatus.updating;
    }
    throw Exception('$this is not known in enum FirewallRuleGroupStatus');
  }
}

class GetFirewallConfigResponse {
  /// Configuration of the firewall behavior provided by DNS Firewall for a single
  /// VPC from AmazonVPC.
  final FirewallConfig? firewallConfig;

  GetFirewallConfigResponse({
    this.firewallConfig,
  });

  factory GetFirewallConfigResponse.fromJson(Map<String, dynamic> json) {
    return GetFirewallConfigResponse(
      firewallConfig: json['FirewallConfig'] != null
          ? FirewallConfig.fromJson(
              json['FirewallConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallConfig = this.firewallConfig;
    return {
      if (firewallConfig != null) 'FirewallConfig': firewallConfig,
    };
  }
}

class GetFirewallDomainListResponse {
  /// The domain list that you requested.
  final FirewallDomainList? firewallDomainList;

  GetFirewallDomainListResponse({
    this.firewallDomainList,
  });

  factory GetFirewallDomainListResponse.fromJson(Map<String, dynamic> json) {
    return GetFirewallDomainListResponse(
      firewallDomainList: json['FirewallDomainList'] != null
          ? FirewallDomainList.fromJson(
              json['FirewallDomainList'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallDomainList = this.firewallDomainList;
    return {
      if (firewallDomainList != null) 'FirewallDomainList': firewallDomainList,
    };
  }
}

class GetFirewallRuleGroupAssociationResponse {
  /// The association that you requested.
  final FirewallRuleGroupAssociation? firewallRuleGroupAssociation;

  GetFirewallRuleGroupAssociationResponse({
    this.firewallRuleGroupAssociation,
  });

  factory GetFirewallRuleGroupAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetFirewallRuleGroupAssociationResponse(
      firewallRuleGroupAssociation: json['FirewallRuleGroupAssociation'] != null
          ? FirewallRuleGroupAssociation.fromJson(
              json['FirewallRuleGroupAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallRuleGroupAssociation = this.firewallRuleGroupAssociation;
    return {
      if (firewallRuleGroupAssociation != null)
        'FirewallRuleGroupAssociation': firewallRuleGroupAssociation,
    };
  }
}

class GetFirewallRuleGroupPolicyResponse {
  /// The Identity and Access Management (Amazon Web Services IAM) policy for
  /// sharing the specified rule group. You can use the policy to share the rule
  /// group using Resource Access Manager (RAM).
  final String? firewallRuleGroupPolicy;

  GetFirewallRuleGroupPolicyResponse({
    this.firewallRuleGroupPolicy,
  });

  factory GetFirewallRuleGroupPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return GetFirewallRuleGroupPolicyResponse(
      firewallRuleGroupPolicy: json['FirewallRuleGroupPolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallRuleGroupPolicy = this.firewallRuleGroupPolicy;
    return {
      if (firewallRuleGroupPolicy != null)
        'FirewallRuleGroupPolicy': firewallRuleGroupPolicy,
    };
  }
}

class GetFirewallRuleGroupResponse {
  /// A collection of rules used to filter DNS network traffic.
  final FirewallRuleGroup? firewallRuleGroup;

  GetFirewallRuleGroupResponse({
    this.firewallRuleGroup,
  });

  factory GetFirewallRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetFirewallRuleGroupResponse(
      firewallRuleGroup: json['FirewallRuleGroup'] != null
          ? FirewallRuleGroup.fromJson(
              json['FirewallRuleGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallRuleGroup = this.firewallRuleGroup;
    return {
      if (firewallRuleGroup != null) 'FirewallRuleGroup': firewallRuleGroup,
    };
  }
}

class GetOutpostResolverResponse {
  /// Information about the <code>GetOutpostResolver</code> request, including the
  /// status of the request.
  final OutpostResolver? outpostResolver;

  GetOutpostResolverResponse({
    this.outpostResolver,
  });

  factory GetOutpostResolverResponse.fromJson(Map<String, dynamic> json) {
    return GetOutpostResolverResponse(
      outpostResolver: json['OutpostResolver'] != null
          ? OutpostResolver.fromJson(
              json['OutpostResolver'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final outpostResolver = this.outpostResolver;
    return {
      if (outpostResolver != null) 'OutpostResolver': outpostResolver,
    };
  }
}

class GetResolverConfigResponse {
  /// Information about the behavior configuration of Route 53 Resolver behavior
  /// for the VPC you specified in the <code>GetResolverConfig</code> request.
  final ResolverConfig? resolverConfig;

  GetResolverConfigResponse({
    this.resolverConfig,
  });

  factory GetResolverConfigResponse.fromJson(Map<String, dynamic> json) {
    return GetResolverConfigResponse(
      resolverConfig: json['ResolverConfig'] != null
          ? ResolverConfig.fromJson(
              json['ResolverConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resolverConfig = this.resolverConfig;
    return {
      if (resolverConfig != null) 'ResolverConfig': resolverConfig,
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

  Map<String, dynamic> toJson() {
    final resolverDNSSECConfig = this.resolverDNSSECConfig;
    return {
      if (resolverDNSSECConfig != null)
        'ResolverDNSSECConfig': resolverDNSSECConfig,
    };
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

  Map<String, dynamic> toJson() {
    final resolverEndpoint = this.resolverEndpoint;
    return {
      if (resolverEndpoint != null) 'ResolverEndpoint': resolverEndpoint,
    };
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

  Map<String, dynamic> toJson() {
    final resolverQueryLogConfigAssociation =
        this.resolverQueryLogConfigAssociation;
    return {
      if (resolverQueryLogConfigAssociation != null)
        'ResolverQueryLogConfigAssociation': resolverQueryLogConfigAssociation,
    };
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

  Map<String, dynamic> toJson() {
    final resolverQueryLogConfigPolicy = this.resolverQueryLogConfigPolicy;
    return {
      if (resolverQueryLogConfigPolicy != null)
        'ResolverQueryLogConfigPolicy': resolverQueryLogConfigPolicy,
    };
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

  Map<String, dynamic> toJson() {
    final resolverQueryLogConfig = this.resolverQueryLogConfig;
    return {
      if (resolverQueryLogConfig != null)
        'ResolverQueryLogConfig': resolverQueryLogConfig,
    };
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

  Map<String, dynamic> toJson() {
    final resolverRuleAssociation = this.resolverRuleAssociation;
    return {
      if (resolverRuleAssociation != null)
        'ResolverRuleAssociation': resolverRuleAssociation,
    };
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

  Map<String, dynamic> toJson() {
    final resolverRulePolicy = this.resolverRulePolicy;
    return {
      if (resolverRulePolicy != null) 'ResolverRulePolicy': resolverRulePolicy,
    };
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

  Map<String, dynamic> toJson() {
    final resolverRule = this.resolverRule;
    return {
      if (resolverRule != null) 'ResolverRule': resolverRule,
    };
  }
}

class ImportFirewallDomainsResponse {
  /// The Id of the firewall domain list that DNS Firewall just updated.
  final String? id;

  /// The name of the domain list.
  final String? name;

  /// Status of the import request.
  final FirewallDomainListStatus? status;

  /// Additional information about the status of the list, if available.
  final String? statusMessage;

  ImportFirewallDomainsResponse({
    this.id,
    this.name,
    this.status,
    this.statusMessage,
  });

  factory ImportFirewallDomainsResponse.fromJson(Map<String, dynamic> json) {
    return ImportFirewallDomainsResponse(
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toFirewallDomainListStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
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

  /// The IPv4 address that you want to use for DNS queries.
  final String? ip;

  /// The IPv6 address that you want to use for DNS queries.
  final String? ipv6;

  IpAddressRequest({
    required this.subnetId,
    this.ip,
    this.ipv6,
  });

  Map<String, dynamic> toJson() {
    final subnetId = this.subnetId;
    final ip = this.ip;
    final ipv6 = this.ipv6;
    return {
      'SubnetId': subnetId,
      if (ip != null) 'Ip': ip,
      if (ipv6 != null) 'Ipv6': ipv6,
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

  /// One IPv4 address that the Resolver endpoint uses for DNS queries.
  final String? ip;

  /// The ID of one IP address.
  final String? ipId;

  /// One IPv6 address that the Resolver endpoint uses for DNS queries.
  final String? ipv6;

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
    this.ipv6,
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
      ipv6: json['Ipv6'] as String?,
      modificationTime: json['ModificationTime'] as String?,
      status: (json['Status'] as String?)?.toIpAddressStatus(),
      statusMessage: json['StatusMessage'] as String?,
      subnetId: json['SubnetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final ip = this.ip;
    final ipId = this.ipId;
    final ipv6 = this.ipv6;
    final modificationTime = this.modificationTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final subnetId = this.subnetId;
    return {
      if (creationTime != null) 'CreationTime': creationTime,
      if (ip != null) 'Ip': ip,
      if (ipId != null) 'IpId': ipId,
      if (ipv6 != null) 'Ipv6': ipv6,
      if (modificationTime != null) 'ModificationTime': modificationTime,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (subnetId != null) 'SubnetId': subnetId,
    };
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
  updating,
  updateFailed,
}

extension IpAddressStatusValueExtension on IpAddressStatus {
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
      case IpAddressStatus.updating:
        return 'UPDATING';
      case IpAddressStatus.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension IpAddressStatusFromString on String {
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
      case 'UPDATING':
        return IpAddressStatus.updating;
      case 'UPDATE_FAILED':
        return IpAddressStatus.updateFailed;
    }
    throw Exception('$this is not known in enum IpAddressStatus');
  }
}

/// In an <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_UpdateResolverEndpoint.html">UpdateResolverEndpoint</a>
/// request, information about an IP address to update.
class IpAddressUpdate {
  /// The new IPv4 address.
  final String? ip;

  /// <i>Only when removing an IP address from a Resolver endpoint</i>: The ID of
  /// the IP address that you want to remove. To get this ID, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html">GetResolverEndpoint</a>.
  final String? ipId;

  /// The new IPv6 address.
  final String? ipv6;

  /// The ID of the subnet that includes the IP address that you want to update.
  /// To get this ID, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html">GetResolverEndpoint</a>.
  final String? subnetId;

  IpAddressUpdate({
    this.ip,
    this.ipId,
    this.ipv6,
    this.subnetId,
  });

  Map<String, dynamic> toJson() {
    final ip = this.ip;
    final ipId = this.ipId;
    final ipv6 = this.ipv6;
    final subnetId = this.subnetId;
    return {
      if (ip != null) 'Ip': ip,
      if (ipId != null) 'IpId': ipId,
      if (ipv6 != null) 'Ipv6': ipv6,
      if (subnetId != null) 'SubnetId': subnetId,
    };
  }
}

class ListFirewallConfigsResponse {
  /// The configurations for the firewall behavior provided by DNS Firewall for
  /// VPCs from Amazon Virtual Private Cloud (Amazon VPC).
  final List<FirewallConfig>? firewallConfigs;

  /// If objects are still available for retrieval, Resolver returns this token in
  /// the response. To retrieve the next batch of objects, provide this token in
  /// your next request.
  final String? nextToken;

  ListFirewallConfigsResponse({
    this.firewallConfigs,
    this.nextToken,
  });

  factory ListFirewallConfigsResponse.fromJson(Map<String, dynamic> json) {
    return ListFirewallConfigsResponse(
      firewallConfigs: (json['FirewallConfigs'] as List?)
          ?.whereNotNull()
          .map((e) => FirewallConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallConfigs = this.firewallConfigs;
    final nextToken = this.nextToken;
    return {
      if (firewallConfigs != null) 'FirewallConfigs': firewallConfigs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFirewallDomainListsResponse {
  /// A list of the domain lists that you have defined.
  ///
  /// This might be a partial list of the domain lists that you've defined. For
  /// information, see <code>MaxResults</code>.
  final List<FirewallDomainListMetadata>? firewallDomainLists;

  /// If objects are still available for retrieval, Resolver returns this token in
  /// the response. To retrieve the next batch of objects, provide this token in
  /// your next request.
  final String? nextToken;

  ListFirewallDomainListsResponse({
    this.firewallDomainLists,
    this.nextToken,
  });

  factory ListFirewallDomainListsResponse.fromJson(Map<String, dynamic> json) {
    return ListFirewallDomainListsResponse(
      firewallDomainLists: (json['FirewallDomainLists'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FirewallDomainListMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallDomainLists = this.firewallDomainLists;
    final nextToken = this.nextToken;
    return {
      if (firewallDomainLists != null)
        'FirewallDomainLists': firewallDomainLists,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFirewallDomainsResponse {
  /// A list of the domains in the firewall domain list.
  ///
  /// This might be a partial list of the domains that you've defined in the
  /// domain list. For information, see <code>MaxResults</code>.
  final List<String>? domains;

  /// If objects are still available for retrieval, Resolver returns this token in
  /// the response. To retrieve the next batch of objects, provide this token in
  /// your next request.
  final String? nextToken;

  ListFirewallDomainsResponse({
    this.domains,
    this.nextToken,
  });

  factory ListFirewallDomainsResponse.fromJson(Map<String, dynamic> json) {
    return ListFirewallDomainsResponse(
      domains: (json['Domains'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domains = this.domains;
    final nextToken = this.nextToken;
    return {
      if (domains != null) 'Domains': domains,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFirewallRuleGroupAssociationsResponse {
  /// A list of your firewall rule group associations.
  ///
  /// This might be a partial list of the associations that you have defined. For
  /// information, see <code>MaxResults</code>.
  final List<FirewallRuleGroupAssociation>? firewallRuleGroupAssociations;

  /// If objects are still available for retrieval, Resolver returns this token in
  /// the response. To retrieve the next batch of objects, provide this token in
  /// your next request.
  final String? nextToken;

  ListFirewallRuleGroupAssociationsResponse({
    this.firewallRuleGroupAssociations,
    this.nextToken,
  });

  factory ListFirewallRuleGroupAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListFirewallRuleGroupAssociationsResponse(
      firewallRuleGroupAssociations: (json['FirewallRuleGroupAssociations']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              FirewallRuleGroupAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallRuleGroupAssociations = this.firewallRuleGroupAssociations;
    final nextToken = this.nextToken;
    return {
      if (firewallRuleGroupAssociations != null)
        'FirewallRuleGroupAssociations': firewallRuleGroupAssociations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFirewallRuleGroupsResponse {
  /// A list of your firewall rule groups.
  ///
  /// This might be a partial list of the rule groups that you have defined. For
  /// information, see <code>MaxResults</code>.
  final List<FirewallRuleGroupMetadata>? firewallRuleGroups;

  /// If objects are still available for retrieval, Resolver returns this token in
  /// the response. To retrieve the next batch of objects, provide this token in
  /// your next request.
  final String? nextToken;

  ListFirewallRuleGroupsResponse({
    this.firewallRuleGroups,
    this.nextToken,
  });

  factory ListFirewallRuleGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListFirewallRuleGroupsResponse(
      firewallRuleGroups: (json['FirewallRuleGroups'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FirewallRuleGroupMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallRuleGroups = this.firewallRuleGroups;
    final nextToken = this.nextToken;
    return {
      if (firewallRuleGroups != null) 'FirewallRuleGroups': firewallRuleGroups,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFirewallRulesResponse {
  /// A list of the rules that you have defined.
  ///
  /// This might be a partial list of the firewall rules that you've defined. For
  /// information, see <code>MaxResults</code>.
  final List<FirewallRule>? firewallRules;

  /// If objects are still available for retrieval, Resolver returns this token in
  /// the response. To retrieve the next batch of objects, provide this token in
  /// your next request.
  final String? nextToken;

  ListFirewallRulesResponse({
    this.firewallRules,
    this.nextToken,
  });

  factory ListFirewallRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListFirewallRulesResponse(
      firewallRules: (json['FirewallRules'] as List?)
          ?.whereNotNull()
          .map((e) => FirewallRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallRules = this.firewallRules;
    final nextToken = this.nextToken;
    return {
      if (firewallRules != null) 'FirewallRules': firewallRules,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListOutpostResolversResponse {
  /// If more than <code>MaxResults</code> Resolvers match the specified criteria,
  /// you can submit another <code>ListOutpostResolver</code> request to get the
  /// next group of results. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  final String? nextToken;

  /// The Resolvers on Outposts that were created by using the current Amazon Web
  /// Services account, and that match the specified filters, if any.
  final List<OutpostResolver>? outpostResolvers;

  ListOutpostResolversResponse({
    this.nextToken,
    this.outpostResolvers,
  });

  factory ListOutpostResolversResponse.fromJson(Map<String, dynamic> json) {
    return ListOutpostResolversResponse(
      nextToken: json['NextToken'] as String?,
      outpostResolvers: (json['OutpostResolvers'] as List?)
          ?.whereNotNull()
          .map((e) => OutpostResolver.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final outpostResolvers = this.outpostResolvers;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (outpostResolvers != null) 'OutpostResolvers': outpostResolvers,
    };
  }
}

class ListResolverConfigsResponse {
  /// If a response includes the last of the Resolver configurations that are
  /// associated with the current Amazon Web Services account,
  /// <code>NextToken</code> doesn't appear in the response.
  ///
  /// If a response doesn't include the last of the configurations, you can get
  /// more configurations by submitting another <code>ListResolverConfigs</code>
  /// request. Get the value of <code>NextToken</code> that Amazon Route 53
  /// returned in the previous response and include it in <code>NextToken</code>
  /// in the next request.
  final String? nextToken;

  /// An array that contains one <code>ResolverConfigs</code> element for each
  /// Resolver configuration that is associated with the current Amazon Web
  /// Services account.
  final List<ResolverConfig>? resolverConfigs;

  ListResolverConfigsResponse({
    this.nextToken,
    this.resolverConfigs,
  });

  factory ListResolverConfigsResponse.fromJson(Map<String, dynamic> json) {
    return ListResolverConfigsResponse(
      nextToken: json['NextToken'] as String?,
      resolverConfigs: (json['ResolverConfigs'] as List?)
          ?.whereNotNull()
          .map((e) => ResolverConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resolverConfigs = this.resolverConfigs;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resolverConfigs != null) 'ResolverConfigs': resolverConfigs,
    };
  }
}

class ListResolverDnssecConfigsResponse {
  /// If a response includes the last of the DNSSEC configurations that are
  /// associated with the current Amazon Web Services account,
  /// <code>NextToken</code> doesn't appear in the response.
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
  /// the current Amazon Web Services account. It doesn't contain disabled DNSSEC
  /// configurations for the resource.
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

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resolverDnssecConfigs = this.resolverDnssecConfigs;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resolverDnssecConfigs != null)
        'ResolverDnssecConfigs': resolverDnssecConfigs,
    };
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

  Map<String, dynamic> toJson() {
    final ipAddresses = this.ipAddresses;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      if (ipAddresses != null) 'IpAddresses': ipAddresses,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
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

  /// The Resolver endpoints that were created by using the current Amazon Web
  /// Services account, and that match the specified filters, if any.
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

  Map<String, dynamic> toJson() {
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    final resolverEndpoints = this.resolverEndpoints;
    return {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (resolverEndpoints != null) 'ResolverEndpoints': resolverEndpoints,
    };
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

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resolverQueryLogConfigAssociations =
        this.resolverQueryLogConfigAssociations;
    final totalCount = this.totalCount;
    final totalFilteredCount = this.totalFilteredCount;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resolverQueryLogConfigAssociations != null)
        'ResolverQueryLogConfigAssociations':
            resolverQueryLogConfigAssociations,
      if (totalCount != null) 'TotalCount': totalCount,
      if (totalFilteredCount != null) 'TotalFilteredCount': totalFilteredCount,
    };
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

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resolverQueryLogConfigs = this.resolverQueryLogConfigs;
    final totalCount = this.totalCount;
    final totalFilteredCount = this.totalFilteredCount;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resolverQueryLogConfigs != null)
        'ResolverQueryLogConfigs': resolverQueryLogConfigs,
      if (totalCount != null) 'TotalCount': totalCount,
      if (totalFilteredCount != null) 'TotalFilteredCount': totalFilteredCount,
    };
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
  /// current Amazon Web Services account, and that match the specified filters,
  /// if any.
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

  Map<String, dynamic> toJson() {
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    final resolverRuleAssociations = this.resolverRuleAssociations;
    return {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (resolverRuleAssociations != null)
        'ResolverRuleAssociations': resolverRuleAssociations,
    };
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

  /// The Resolver rules that were created using the current Amazon Web Services
  /// account and that match the specified filters, if any.
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

  Map<String, dynamic> toJson() {
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    final resolverRules = this.resolverRules;
    return {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (resolverRules != null) 'ResolverRules': resolverRules,
    };
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

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tags != null) 'Tags': tags,
    };
  }
}

enum MutationProtectionStatus {
  enabled,
  disabled,
}

extension MutationProtectionStatusValueExtension on MutationProtectionStatus {
  String toValue() {
    switch (this) {
      case MutationProtectionStatus.enabled:
        return 'ENABLED';
      case MutationProtectionStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension MutationProtectionStatusFromString on String {
  MutationProtectionStatus toMutationProtectionStatus() {
    switch (this) {
      case 'ENABLED':
        return MutationProtectionStatus.enabled;
      case 'DISABLED':
        return MutationProtectionStatus.disabled;
    }
    throw Exception('$this is not known in enum MutationProtectionStatus');
  }
}

/// A complex type that contains settings for an existing Resolver on an
/// Outpost.
class OutpostResolver {
  /// The ARN (Amazon Resource Name) for the Resolver on an Outpost.
  final String? arn;

  /// The date and time that the Outpost Resolver was created, in Unix time format
  /// and Coordinated Universal Time (UTC).
  final String? creationTime;

  /// A unique string that identifies the request that created the Resolver
  /// endpoint. The <code>CreatorRequestId</code> allows failed requests to be
  /// retried without the risk of running the operation twice.
  final String? creatorRequestId;

  /// The ID of the Resolver on Outpost.
  final String? id;

  /// Amazon EC2 instance count for the Resolver on the Outpost.
  final int? instanceCount;

  /// The date and time that the Outpost Resolver was modified, in Unix time
  /// format and Coordinated Universal Time (UTC).
  final String? modificationTime;

  /// Name of the Resolver.
  final String? name;

  /// The ARN (Amazon Resource Name) for the Outpost.
  final String? outpostArn;

  /// The Amazon EC2 instance type.
  final String? preferredInstanceType;

  /// Status of the Resolver.
  final OutpostResolverStatus? status;

  /// A detailed description of the Resolver.
  final String? statusMessage;

  OutpostResolver({
    this.arn,
    this.creationTime,
    this.creatorRequestId,
    this.id,
    this.instanceCount,
    this.modificationTime,
    this.name,
    this.outpostArn,
    this.preferredInstanceType,
    this.status,
    this.statusMessage,
  });

  factory OutpostResolver.fromJson(Map<String, dynamic> json) {
    return OutpostResolver(
      arn: json['Arn'] as String?,
      creationTime: json['CreationTime'] as String?,
      creatorRequestId: json['CreatorRequestId'] as String?,
      id: json['Id'] as String?,
      instanceCount: json['InstanceCount'] as int?,
      modificationTime: json['ModificationTime'] as String?,
      name: json['Name'] as String?,
      outpostArn: json['OutpostArn'] as String?,
      preferredInstanceType: json['PreferredInstanceType'] as String?,
      status: (json['Status'] as String?)?.toOutpostResolverStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final creatorRequestId = this.creatorRequestId;
    final id = this.id;
    final instanceCount = this.instanceCount;
    final modificationTime = this.modificationTime;
    final name = this.name;
    final outpostArn = this.outpostArn;
    final preferredInstanceType = this.preferredInstanceType;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null) 'CreationTime': creationTime,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (id != null) 'Id': id,
      if (instanceCount != null) 'InstanceCount': instanceCount,
      if (modificationTime != null) 'ModificationTime': modificationTime,
      if (name != null) 'Name': name,
      if (outpostArn != null) 'OutpostArn': outpostArn,
      if (preferredInstanceType != null)
        'PreferredInstanceType': preferredInstanceType,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

enum OutpostResolverStatus {
  creating,
  operational,
  updating,
  deleting,
  actionNeeded,
  failedCreation,
  failedDeletion,
}

extension OutpostResolverStatusValueExtension on OutpostResolverStatus {
  String toValue() {
    switch (this) {
      case OutpostResolverStatus.creating:
        return 'CREATING';
      case OutpostResolverStatus.operational:
        return 'OPERATIONAL';
      case OutpostResolverStatus.updating:
        return 'UPDATING';
      case OutpostResolverStatus.deleting:
        return 'DELETING';
      case OutpostResolverStatus.actionNeeded:
        return 'ACTION_NEEDED';
      case OutpostResolverStatus.failedCreation:
        return 'FAILED_CREATION';
      case OutpostResolverStatus.failedDeletion:
        return 'FAILED_DELETION';
    }
  }
}

extension OutpostResolverStatusFromString on String {
  OutpostResolverStatus toOutpostResolverStatus() {
    switch (this) {
      case 'CREATING':
        return OutpostResolverStatus.creating;
      case 'OPERATIONAL':
        return OutpostResolverStatus.operational;
      case 'UPDATING':
        return OutpostResolverStatus.updating;
      case 'DELETING':
        return OutpostResolverStatus.deleting;
      case 'ACTION_NEEDED':
        return OutpostResolverStatus.actionNeeded;
      case 'FAILED_CREATION':
        return OutpostResolverStatus.failedCreation;
      case 'FAILED_DELETION':
        return OutpostResolverStatus.failedDeletion;
    }
    throw Exception('$this is not known in enum OutpostResolverStatus');
  }
}

enum Protocol {
  doH,
  do53,
  doHFips,
}

extension ProtocolValueExtension on Protocol {
  String toValue() {
    switch (this) {
      case Protocol.doH:
        return 'DoH';
      case Protocol.do53:
        return 'Do53';
      case Protocol.doHFips:
        return 'DoH-FIPS';
    }
  }
}

extension ProtocolFromString on String {
  Protocol toProtocol() {
    switch (this) {
      case 'DoH':
        return Protocol.doH;
      case 'Do53':
        return Protocol.do53;
      case 'DoH-FIPS':
        return Protocol.doHFips;
    }
    throw Exception('$this is not known in enum Protocol');
  }
}

class PutFirewallRuleGroupPolicyResponse {
  /// <p/>
  final bool? returnValue;

  PutFirewallRuleGroupPolicyResponse({
    this.returnValue,
  });

  factory PutFirewallRuleGroupPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return PutFirewallRuleGroupPolicyResponse(
      returnValue: json['ReturnValue'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final returnValue = this.returnValue;
    return {
      if (returnValue != null) 'ReturnValue': returnValue,
    };
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

  Map<String, dynamic> toJson() {
    final returnValue = this.returnValue;
    return {
      if (returnValue != null) 'ReturnValue': returnValue,
    };
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

  Map<String, dynamic> toJson() {
    final returnValue = this.returnValue;
    return {
      if (returnValue != null) 'ReturnValue': returnValue,
    };
  }
}

enum ResolverAutodefinedReverseStatus {
  enabling,
  enabled,
  disabling,
  disabled,
  updatingToUseLocalResourceSetting,
  useLocalResourceSetting,
}

extension ResolverAutodefinedReverseStatusValueExtension
    on ResolverAutodefinedReverseStatus {
  String toValue() {
    switch (this) {
      case ResolverAutodefinedReverseStatus.enabling:
        return 'ENABLING';
      case ResolverAutodefinedReverseStatus.enabled:
        return 'ENABLED';
      case ResolverAutodefinedReverseStatus.disabling:
        return 'DISABLING';
      case ResolverAutodefinedReverseStatus.disabled:
        return 'DISABLED';
      case ResolverAutodefinedReverseStatus.updatingToUseLocalResourceSetting:
        return 'UPDATING_TO_USE_LOCAL_RESOURCE_SETTING';
      case ResolverAutodefinedReverseStatus.useLocalResourceSetting:
        return 'USE_LOCAL_RESOURCE_SETTING';
    }
  }
}

extension ResolverAutodefinedReverseStatusFromString on String {
  ResolverAutodefinedReverseStatus toResolverAutodefinedReverseStatus() {
    switch (this) {
      case 'ENABLING':
        return ResolverAutodefinedReverseStatus.enabling;
      case 'ENABLED':
        return ResolverAutodefinedReverseStatus.enabled;
      case 'DISABLING':
        return ResolverAutodefinedReverseStatus.disabling;
      case 'DISABLED':
        return ResolverAutodefinedReverseStatus.disabled;
      case 'UPDATING_TO_USE_LOCAL_RESOURCE_SETTING':
        return ResolverAutodefinedReverseStatus
            .updatingToUseLocalResourceSetting;
      case 'USE_LOCAL_RESOURCE_SETTING':
        return ResolverAutodefinedReverseStatus.useLocalResourceSetting;
    }
    throw Exception(
        '$this is not known in enum ResolverAutodefinedReverseStatus');
  }
}

/// A complex type that contains information about a Resolver configuration for
/// a VPC.
class ResolverConfig {
  /// The status of whether or not the Resolver will create autodefined rules for
  /// reverse DNS lookups. This is enabled by default. The status can be one of
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <b>ENABLING:</b> Autodefined rules for reverse DNS lookups are being enabled
  /// but are not complete.
  /// </li>
  /// <li>
  /// <b>ENABLED:</b> Autodefined rules for reverse DNS lookups are enabled.
  /// </li>
  /// <li>
  /// <b>DISABLING:</b> Autodefined rules for reverse DNS lookups are being
  /// disabled but are not complete.
  /// </li>
  /// <li>
  /// <b>DISABLED:</b> Autodefined rules for reverse DNS lookups are disabled.
  /// </li>
  /// </ul>
  final ResolverAutodefinedReverseStatus? autodefinedReverse;

  /// ID for the Resolver configuration.
  final String? id;

  /// The owner account ID of the Amazon Virtual Private Cloud VPC.
  final String? ownerId;

  /// The ID of the Amazon Virtual Private Cloud VPC that you're configuring
  /// Resolver for.
  final String? resourceId;

  ResolverConfig({
    this.autodefinedReverse,
    this.id,
    this.ownerId,
    this.resourceId,
  });

  factory ResolverConfig.fromJson(Map<String, dynamic> json) {
    return ResolverConfig(
      autodefinedReverse: (json['AutodefinedReverse'] as String?)
          ?.toResolverAutodefinedReverseStatus(),
      id: json['Id'] as String?,
      ownerId: json['OwnerId'] as String?,
      resourceId: json['ResourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autodefinedReverse = this.autodefinedReverse;
    final id = this.id;
    final ownerId = this.ownerId;
    final resourceId = this.resourceId;
    return {
      if (autodefinedReverse != null)
        'AutodefinedReverse': autodefinedReverse.toValue(),
      if (id != null) 'Id': id,
      if (ownerId != null) 'OwnerId': ownerId,
      if (resourceId != null) 'ResourceId': resourceId,
    };
  }
}

enum ResolverDNSSECValidationStatus {
  enabling,
  enabled,
  disabling,
  disabled,
  updatingToUseLocalResourceSetting,
  useLocalResourceSetting,
}

extension ResolverDNSSECValidationStatusValueExtension
    on ResolverDNSSECValidationStatus {
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
      case ResolverDNSSECValidationStatus.updatingToUseLocalResourceSetting:
        return 'UPDATING_TO_USE_LOCAL_RESOURCE_SETTING';
      case ResolverDNSSECValidationStatus.useLocalResourceSetting:
        return 'USE_LOCAL_RESOURCE_SETTING';
    }
  }
}

extension ResolverDNSSECValidationStatusFromString on String {
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
      case 'UPDATING_TO_USE_LOCAL_RESOURCE_SETTING':
        return ResolverDNSSECValidationStatus.updatingToUseLocalResourceSetting;
      case 'USE_LOCAL_RESOURCE_SETTING':
        return ResolverDNSSECValidationStatus.useLocalResourceSetting;
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

  Map<String, dynamic> toJson() {
    final id = this.id;
    final ownerId = this.ownerId;
    final resourceId = this.resourceId;
    final validationStatus = this.validationStatus;
    return {
      if (id != null) 'Id': id,
      if (ownerId != null) 'OwnerId': ownerId,
      if (resourceId != null) 'ResourceId': resourceId,
      if (validationStatus != null)
        'ValidationStatus': validationStatus.toValue(),
    };
  }
}

/// In the response to a <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverEndpoint.html">CreateResolverEndpoint</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DeleteResolverEndpoint.html">DeleteResolverEndpoint</a>,
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html">GetResolverEndpoint</a>,
/// Updates the name, or ResolverEndpointType for an endpoint, or <a
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
  /// retried without the risk of running the operation twice.
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

  /// The ARN (Amazon Resource Name) for the Outpost.
  final String? outpostArn;

  /// The Amazon EC2 instance type.
  final String? preferredInstanceType;

  /// Protocols used for the endpoint. DoH-FIPS is applicable for inbound
  /// endpoints only.
  ///
  /// For an inbound endpoint you can apply the protocols as follows:
  ///
  /// <ul>
  /// <li>
  /// Do53 and DoH in combination.
  /// </li>
  /// <li>
  /// Do53 and DoH-FIPS in combination.
  /// </li>
  /// <li>
  /// Do53 alone.
  /// </li>
  /// <li>
  /// DoH alone.
  /// </li>
  /// <li>
  /// DoH-FIPS alone.
  /// </li>
  /// <li>
  /// None, which is treated as Do53.
  /// </li>
  /// </ul>
  /// For an outbound endpoint you can apply the protocols as follows:
  ///
  /// <ul>
  /// <li>
  /// Do53 and DoH in combination.
  /// </li>
  /// <li>
  /// Do53 alone.
  /// </li>
  /// <li>
  /// DoH alone.
  /// </li>
  /// <li>
  /// None, which is treated as Do53.
  /// </li>
  /// </ul>
  final List<Protocol>? protocols;

  /// The Resolver endpoint IP address type.
  final ResolverEndpointType? resolverEndpointType;

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
    this.outpostArn,
    this.preferredInstanceType,
    this.protocols,
    this.resolverEndpointType,
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
      outpostArn: json['OutpostArn'] as String?,
      preferredInstanceType: json['PreferredInstanceType'] as String?,
      protocols: (json['Protocols'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toProtocol())
          .toList(),
      resolverEndpointType:
          (json['ResolverEndpointType'] as String?)?.toResolverEndpointType(),
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['Status'] as String?)?.toResolverEndpointStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final creatorRequestId = this.creatorRequestId;
    final direction = this.direction;
    final hostVPCId = this.hostVPCId;
    final id = this.id;
    final ipAddressCount = this.ipAddressCount;
    final modificationTime = this.modificationTime;
    final name = this.name;
    final outpostArn = this.outpostArn;
    final preferredInstanceType = this.preferredInstanceType;
    final protocols = this.protocols;
    final resolverEndpointType = this.resolverEndpointType;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null) 'CreationTime': creationTime,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (direction != null) 'Direction': direction.toValue(),
      if (hostVPCId != null) 'HostVPCId': hostVPCId,
      if (id != null) 'Id': id,
      if (ipAddressCount != null) 'IpAddressCount': ipAddressCount,
      if (modificationTime != null) 'ModificationTime': modificationTime,
      if (name != null) 'Name': name,
      if (outpostArn != null) 'OutpostArn': outpostArn,
      if (preferredInstanceType != null)
        'PreferredInstanceType': preferredInstanceType,
      if (protocols != null)
        'Protocols': protocols.map((e) => e.toValue()).toList(),
      if (resolverEndpointType != null)
        'ResolverEndpointType': resolverEndpointType.toValue(),
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

enum ResolverEndpointDirection {
  inbound,
  outbound,
}

extension ResolverEndpointDirectionValueExtension on ResolverEndpointDirection {
  String toValue() {
    switch (this) {
      case ResolverEndpointDirection.inbound:
        return 'INBOUND';
      case ResolverEndpointDirection.outbound:
        return 'OUTBOUND';
    }
  }
}

extension ResolverEndpointDirectionFromString on String {
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

extension ResolverEndpointStatusValueExtension on ResolverEndpointStatus {
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

extension ResolverEndpointStatusFromString on String {
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

enum ResolverEndpointType {
  ipv6,
  ipv4,
  dualstack,
}

extension ResolverEndpointTypeValueExtension on ResolverEndpointType {
  String toValue() {
    switch (this) {
      case ResolverEndpointType.ipv6:
        return 'IPV6';
      case ResolverEndpointType.ipv4:
        return 'IPV4';
      case ResolverEndpointType.dualstack:
        return 'DUALSTACK';
    }
  }
}

extension ResolverEndpointTypeFromString on String {
  ResolverEndpointType toResolverEndpointType() {
    switch (this) {
      case 'IPV6':
        return ResolverEndpointType.ipv6;
      case 'IPV4':
        return ResolverEndpointType.ipv4;
      case 'DUALSTACK':
        return ResolverEndpointType.dualstack;
    }
    throw Exception('$this is not known in enum ResolverEndpointType');
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
  /// be retried without the risk of running the operation twice.
  final String? creatorRequestId;

  /// The ARN of the resource that you want Resolver to send query logs: an Amazon
  /// S3 bucket, a CloudWatch Logs log group, or a Kinesis Data Firehose delivery
  /// stream.
  final String? destinationArn;

  /// The ID for the query logging configuration.
  final String? id;

  /// The name of the query logging configuration.
  final String? name;

  /// The Amazon Web Services account ID for the account that created the query
  /// logging configuration.
  final String? ownerId;

  /// An indication of whether the query logging configuration is shared with
  /// other Amazon Web Services accounts, or was shared with the current account
  /// by another Amazon Web Services account. Sharing is configured through
  /// Resource Access Manager (RAM).
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

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associationCount = this.associationCount;
    final creationTime = this.creationTime;
    final creatorRequestId = this.creatorRequestId;
    final destinationArn = this.destinationArn;
    final id = this.id;
    final name = this.name;
    final ownerId = this.ownerId;
    final shareStatus = this.shareStatus;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (associationCount != null) 'AssociationCount': associationCount,
      if (creationTime != null) 'CreationTime': creationTime,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (destinationArn != null) 'DestinationArn': destinationArn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (ownerId != null) 'OwnerId': ownerId,
      if (shareStatus != null) 'ShareStatus': shareStatus.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
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

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final error = this.error;
    final errorMessage = this.errorMessage;
    final id = this.id;
    final resolverQueryLogConfigId = this.resolverQueryLogConfigId;
    final resourceId = this.resourceId;
    final status = this.status;
    return {
      if (creationTime != null) 'CreationTime': creationTime,
      if (error != null) 'Error': error.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (id != null) 'Id': id,
      if (resolverQueryLogConfigId != null)
        'ResolverQueryLogConfigId': resolverQueryLogConfigId,
      if (resourceId != null) 'ResourceId': resourceId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum ResolverQueryLogConfigAssociationError {
  none,
  destinationNotFound,
  accessDenied,
  internalServiceError,
}

extension ResolverQueryLogConfigAssociationErrorValueExtension
    on ResolverQueryLogConfigAssociationError {
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

extension ResolverQueryLogConfigAssociationErrorFromString on String {
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

extension ResolverQueryLogConfigAssociationStatusValueExtension
    on ResolverQueryLogConfigAssociationStatus {
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

extension ResolverQueryLogConfigAssociationStatusFromString on String {
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

extension ResolverQueryLogConfigStatusValueExtension
    on ResolverQueryLogConfigStatus {
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

extension ResolverQueryLogConfigStatusFromString on String {
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
  /// requests to be retried without the risk of running the operation twice.
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

  /// When a rule is shared with another Amazon Web Services account, the account
  /// ID of the account that the rule is shared with.
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

  /// Whether the rule is shared and, if so, whether the current account is
  /// sharing the rule with another account, or another account is sharing the
  /// rule with the current account.
  final ShareStatus? shareStatus;

  /// A code that specifies the current status of the Resolver rule.
  final ResolverRuleStatus? status;

  /// A detailed description of the status of a Resolver rule.
  final String? statusMessage;

  /// An array that contains the IP addresses and ports that an outbound endpoint
  /// forwards DNS queries to. Typically, these are the IP addresses of DNS
  /// resolvers on your network.
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

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final creatorRequestId = this.creatorRequestId;
    final domainName = this.domainName;
    final id = this.id;
    final modificationTime = this.modificationTime;
    final name = this.name;
    final ownerId = this.ownerId;
    final resolverEndpointId = this.resolverEndpointId;
    final ruleType = this.ruleType;
    final shareStatus = this.shareStatus;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final targetIps = this.targetIps;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null) 'CreationTime': creationTime,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (domainName != null) 'DomainName': domainName,
      if (id != null) 'Id': id,
      if (modificationTime != null) 'ModificationTime': modificationTime,
      if (name != null) 'Name': name,
      if (ownerId != null) 'OwnerId': ownerId,
      if (resolverEndpointId != null) 'ResolverEndpointId': resolverEndpointId,
      if (ruleType != null) 'RuleType': ruleType.toValue(),
      if (shareStatus != null) 'ShareStatus': shareStatus.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (targetIps != null) 'TargetIps': targetIps,
    };
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

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final resolverRuleId = this.resolverRuleId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final vPCId = this.vPCId;
    return {
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (resolverRuleId != null) 'ResolverRuleId': resolverRuleId,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (vPCId != null) 'VPCId': vPCId,
    };
  }
}

enum ResolverRuleAssociationStatus {
  creating,
  complete,
  deleting,
  failed,
  overridden,
}

extension ResolverRuleAssociationStatusValueExtension
    on ResolverRuleAssociationStatus {
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

extension ResolverRuleAssociationStatusFromString on String {
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

extension ResolverRuleStatusValueExtension on ResolverRuleStatus {
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

extension ResolverRuleStatusFromString on String {
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

extension RuleTypeOptionValueExtension on RuleTypeOption {
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

extension RuleTypeOptionFromString on String {
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

extension ShareStatusValueExtension on ShareStatus {
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

extension ShareStatusFromString on String {
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

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
  }
}

extension SortOrderFromString on String {
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

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// In a <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverRule.html">CreateResolverRule</a>
/// request, an array of the IPs that you want to forward DNS queries to.
class TargetAddress {
  /// One IPv4 address that you want to forward DNS queries to.
  final String? ip;

  /// One IPv6 address that you want to forward DNS queries to.
  final String? ipv6;

  /// The port at <code>Ip</code> that you want to forward DNS queries to.
  final int? port;

  /// The protocols for the Resolver endpoints. DoH-FIPS is applicable for inbound
  /// endpoints only.
  ///
  /// For an inbound endpoint you can apply the protocols as follows:
  ///
  /// <ul>
  /// <li>
  /// Do53 and DoH in combination.
  /// </li>
  /// <li>
  /// Do53 and DoH-FIPS in combination.
  /// </li>
  /// <li>
  /// Do53 alone.
  /// </li>
  /// <li>
  /// DoH alone.
  /// </li>
  /// <li>
  /// DoH-FIPS alone.
  /// </li>
  /// <li>
  /// None, which is treated as Do53.
  /// </li>
  /// </ul>
  /// For an outbound endpoint you can apply the protocols as follows:
  ///
  /// <ul>
  /// <li>
  /// Do53 and DoH in combination.
  /// </li>
  /// <li>
  /// Do53 alone.
  /// </li>
  /// <li>
  /// DoH alone.
  /// </li>
  /// <li>
  /// None, which is treated as Do53.
  /// </li>
  /// </ul>
  final Protocol? protocol;

  TargetAddress({
    this.ip,
    this.ipv6,
    this.port,
    this.protocol,
  });

  factory TargetAddress.fromJson(Map<String, dynamic> json) {
    return TargetAddress(
      ip: json['Ip'] as String?,
      ipv6: json['Ipv6'] as String?,
      port: json['Port'] as int?,
      protocol: (json['Protocol'] as String?)?.toProtocol(),
    );
  }

  Map<String, dynamic> toJson() {
    final ip = this.ip;
    final ipv6 = this.ipv6;
    final port = this.port;
    final protocol = this.protocol;
    return {
      if (ip != null) 'Ip': ip,
      if (ipv6 != null) 'Ipv6': ipv6,
      if (port != null) 'Port': port,
      if (protocol != null) 'Protocol': protocol.toValue(),
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

class UpdateFirewallConfigResponse {
  /// Configuration of the firewall behavior provided by DNS Firewall for a single
  /// VPC.
  final FirewallConfig? firewallConfig;

  UpdateFirewallConfigResponse({
    this.firewallConfig,
  });

  factory UpdateFirewallConfigResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFirewallConfigResponse(
      firewallConfig: json['FirewallConfig'] != null
          ? FirewallConfig.fromJson(
              json['FirewallConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallConfig = this.firewallConfig;
    return {
      if (firewallConfig != null) 'FirewallConfig': firewallConfig,
    };
  }
}

class UpdateFirewallDomainsResponse {
  /// The ID of the firewall domain list that DNS Firewall just updated.
  final String? id;

  /// The name of the domain list.
  final String? name;

  /// Status of the <code>UpdateFirewallDomains</code> request.
  final FirewallDomainListStatus? status;

  /// Additional information about the status of the list, if available.
  final String? statusMessage;

  UpdateFirewallDomainsResponse({
    this.id,
    this.name,
    this.status,
    this.statusMessage,
  });

  factory UpdateFirewallDomainsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFirewallDomainsResponse(
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toFirewallDomainListStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

class UpdateFirewallRuleGroupAssociationResponse {
  /// The association that you just updated.
  final FirewallRuleGroupAssociation? firewallRuleGroupAssociation;

  UpdateFirewallRuleGroupAssociationResponse({
    this.firewallRuleGroupAssociation,
  });

  factory UpdateFirewallRuleGroupAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateFirewallRuleGroupAssociationResponse(
      firewallRuleGroupAssociation: json['FirewallRuleGroupAssociation'] != null
          ? FirewallRuleGroupAssociation.fromJson(
              json['FirewallRuleGroupAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallRuleGroupAssociation = this.firewallRuleGroupAssociation;
    return {
      if (firewallRuleGroupAssociation != null)
        'FirewallRuleGroupAssociation': firewallRuleGroupAssociation,
    };
  }
}

class UpdateFirewallRuleResponse {
  /// The firewall rule that you just updated.
  final FirewallRule? firewallRule;

  UpdateFirewallRuleResponse({
    this.firewallRule,
  });

  factory UpdateFirewallRuleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFirewallRuleResponse(
      firewallRule: json['FirewallRule'] != null
          ? FirewallRule.fromJson(json['FirewallRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallRule = this.firewallRule;
    return {
      if (firewallRule != null) 'FirewallRule': firewallRule,
    };
  }
}

/// Provides information about the IP address type in response to <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_UpdateResolverEndpoint.html">UpdateResolverEndpoint</a>.
class UpdateIpAddress {
  /// The ID of the IP address, specified by the <code>ResolverEndpointId</code>.
  final String ipId;

  /// The IPv6 address that you want to use for DNS queries.
  final String ipv6;

  UpdateIpAddress({
    required this.ipId,
    required this.ipv6,
  });

  Map<String, dynamic> toJson() {
    final ipId = this.ipId;
    final ipv6 = this.ipv6;
    return {
      'IpId': ipId,
      'Ipv6': ipv6,
    };
  }
}

class UpdateOutpostResolverResponse {
  /// The response to an <code>UpdateOutpostResolver</code> request.
  final OutpostResolver? outpostResolver;

  UpdateOutpostResolverResponse({
    this.outpostResolver,
  });

  factory UpdateOutpostResolverResponse.fromJson(Map<String, dynamic> json) {
    return UpdateOutpostResolverResponse(
      outpostResolver: json['OutpostResolver'] != null
          ? OutpostResolver.fromJson(
              json['OutpostResolver'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final outpostResolver = this.outpostResolver;
    return {
      if (outpostResolver != null) 'OutpostResolver': outpostResolver,
    };
  }
}

class UpdateResolverConfigResponse {
  /// An array that contains settings for the specified Resolver configuration.
  final ResolverConfig? resolverConfig;

  UpdateResolverConfigResponse({
    this.resolverConfig,
  });

  factory UpdateResolverConfigResponse.fromJson(Map<String, dynamic> json) {
    return UpdateResolverConfigResponse(
      resolverConfig: json['ResolverConfig'] != null
          ? ResolverConfig.fromJson(
              json['ResolverConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resolverConfig = this.resolverConfig;
    return {
      if (resolverConfig != null) 'ResolverConfig': resolverConfig,
    };
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

  Map<String, dynamic> toJson() {
    final resolverDNSSECConfig = this.resolverDNSSECConfig;
    return {
      if (resolverDNSSECConfig != null)
        'ResolverDNSSECConfig': resolverDNSSECConfig,
    };
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

  Map<String, dynamic> toJson() {
    final resolverEndpoint = this.resolverEndpoint;
    return {
      if (resolverEndpoint != null) 'ResolverEndpoint': resolverEndpoint,
    };
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

  Map<String, dynamic> toJson() {
    final resolverRule = this.resolverRule;
    return {
      if (resolverRule != null) 'ResolverRule': resolverRule,
    };
  }
}

enum Validation {
  enable,
  disable,
  useLocalResourceSetting,
}

extension ValidationValueExtension on Validation {
  String toValue() {
    switch (this) {
      case Validation.enable:
        return 'ENABLE';
      case Validation.disable:
        return 'DISABLE';
      case Validation.useLocalResourceSetting:
        return 'USE_LOCAL_RESOURCE_SETTING';
    }
  }
}

extension ValidationFromString on String {
  Validation toValidation() {
    switch (this) {
      case 'ENABLE':
        return Validation.enable;
      case 'DISABLE':
        return Validation.disable;
      case 'USE_LOCAL_RESOURCE_SETTING':
        return Validation.useLocalResourceSetting;
    }
    throw Exception('$this is not known in enum Validation');
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

class UnknownResourceException extends _s.GenericAwsException {
  UnknownResourceException({String? type, String? message})
      : super(type: type, code: 'UnknownResourceException', message: message);
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
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnknownResourceException': (type, message) =>
      UnknownResourceException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
