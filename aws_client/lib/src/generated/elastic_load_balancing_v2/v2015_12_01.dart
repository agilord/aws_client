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

import 'v2015_12_01.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

/// A load balancer distributes incoming traffic across targets, such as your
/// EC2 instances. This enables you to increase the availability of your
/// application. The load balancer also monitors the health of its registered
/// targets and ensures that it routes traffic only to healthy targets. You
/// configure your load balancer to accept incoming traffic by specifying one or
/// more listeners, which are configured with a protocol and port number for
/// connections from clients to the load balancer. You configure a target group
/// with a protocol and port number for connections from the load balancer to
/// the targets, and with health check settings to be used when checking the
/// health status of the targets.
class ElasticLoadBalancingV2 {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  ElasticLoadBalancingV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'elasticloadbalancing',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Adds the specified SSL server certificate to the certificate list for the
  /// specified HTTPS or TLS listener.
  ///
  /// If the certificate in already in the certificate list, the call is
  /// successful but the certificate is not added again.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html">HTTPS
  /// listeners</a> in the <i>Application Load Balancers Guide</i> or <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html">TLS
  /// listeners</a> in the <i>Network Load Balancers Guide</i>.
  ///
  /// May throw [ListenerNotFoundException].
  /// May throw [TooManyCertificatesException].
  /// May throw [CertificateNotFoundException].
  ///
  /// Parameter [certificates] :
  /// The certificate to add. You can specify one certificate per call. Set
  /// <code>CertificateArn</code> to the certificate ARN but do not set
  /// <code>IsDefault</code>.
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener.
  Future<AddListenerCertificatesOutput> addListenerCertificates({
    required List<Certificate> certificates,
    required String listenerArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['Certificates'] = certificates;
    $request['ListenerArn'] = listenerArn;
    final $result = await _protocol.send(
      $request,
      action: 'AddListenerCertificates',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddListenerCertificatesInput'],
      shapes: shapes,
      resultWrapper: 'AddListenerCertificatesResult',
    );
    return AddListenerCertificatesOutput.fromXml($result);
  }

  /// Adds the specified tags to the specified Elastic Load Balancing resource.
  /// You can tag your Application Load Balancers, Network Load Balancers,
  /// Gateway Load Balancers, target groups, trust stores, listeners, and rules.
  ///
  /// Each tag consists of a key and an optional value. If a resource already
  /// has a tag with the same key, <code>AddTags</code> updates its value.
  ///
  /// May throw [DuplicateTagKeysException].
  /// May throw [TooManyTagsException].
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [TargetGroupNotFoundException].
  /// May throw [ListenerNotFoundException].
  /// May throw [RuleNotFoundException].
  /// May throw [TrustStoreNotFoundException].
  ///
  /// Parameter [resourceArns] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags.
  Future<void> addTags({
    required List<String> resourceArns,
    required List<Tag> tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceArns'] = resourceArns;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'AddTags',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddTagsInput'],
      shapes: shapes,
      resultWrapper: 'AddTagsResult',
    );
  }

  /// Adds the specified revocation file to the specified trust store.
  ///
  /// May throw [TrustStoreNotFoundException].
  /// May throw [InvalidRevocationContentException].
  /// May throw [TooManyTrustStoreRevocationEntriesException].
  /// May throw [RevocationContentNotFoundException].
  ///
  /// Parameter [trustStoreArn] :
  /// The Amazon Resource Name (ARN) of the trust store.
  ///
  /// Parameter [revocationContents] :
  /// The revocation file to add.
  Future<AddTrustStoreRevocationsOutput> addTrustStoreRevocations({
    required String trustStoreArn,
    List<RevocationContent>? revocationContents,
  }) async {
    final $request = <String, dynamic>{};
    $request['TrustStoreArn'] = trustStoreArn;
    revocationContents?.also((arg) => $request['RevocationContents'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'AddTrustStoreRevocations',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddTrustStoreRevocationsInput'],
      shapes: shapes,
      resultWrapper: 'AddTrustStoreRevocationsResult',
    );
    return AddTrustStoreRevocationsOutput.fromXml($result);
  }

  /// Creates a listener for the specified Application Load Balancer, Network
  /// Load Balancer, or Gateway Load Balancer.
  ///
  /// For more information, see the following:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html">Listeners
  /// for your Application Load Balancers</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-listeners.html">Listeners
  /// for your Network Load Balancers</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-listeners.html">Listeners
  /// for your Gateway Load Balancers</a>
  /// </li>
  /// </ul>
  /// This operation is idempotent, which means that it completes at most one
  /// time. If you attempt to create multiple listeners with the same settings,
  /// each call succeeds.
  ///
  /// May throw [DuplicateListenerException].
  /// May throw [TooManyListenersException].
  /// May throw [TooManyCertificatesException].
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [TargetGroupNotFoundException].
  /// May throw [TargetGroupAssociationLimitException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [IncompatibleProtocolsException].
  /// May throw [SSLPolicyNotFoundException].
  /// May throw [CertificateNotFoundException].
  /// May throw [UnsupportedProtocolException].
  /// May throw [TooManyRegistrationsForTargetIdException].
  /// May throw [TooManyTargetsException].
  /// May throw [TooManyActionsException].
  /// May throw [InvalidLoadBalancerActionException].
  /// May throw [TooManyUniqueTargetGroupsPerLoadBalancerException].
  /// May throw [ALPNPolicyNotSupportedException].
  /// May throw [TooManyTagsException].
  /// May throw [TrustStoreNotFoundException].
  /// May throw [TrustStoreNotReadyException].
  ///
  /// Parameter [defaultActions] :
  /// The actions for the default rule.
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// Parameter [alpnPolicy] :
  /// [TLS listeners] The name of the Application-Layer Protocol Negotiation
  /// (ALPN) policy. You can specify one policy name. The following are the
  /// possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>HTTP1Only</code>
  /// </li>
  /// <li>
  /// <code>HTTP2Only</code>
  /// </li>
  /// <li>
  /// <code>HTTP2Optional</code>
  /// </li>
  /// <li>
  /// <code>HTTP2Preferred</code>
  /// </li>
  /// <li>
  /// <code>None</code>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#alpn-policies">ALPN
  /// policies</a> in the <i>Network Load Balancers Guide</i>.
  ///
  /// Parameter [certificates] :
  /// [HTTPS and TLS listeners] The default certificate for the listener. You
  /// must provide exactly one certificate. Set <code>CertificateArn</code> to
  /// the certificate ARN but do not set <code>IsDefault</code>.
  ///
  /// Parameter [mutualAuthentication] :
  /// The mutual authentication configuration information.
  ///
  /// Parameter [port] :
  /// The port on which the load balancer is listening. You cannot specify a
  /// port for a Gateway Load Balancer.
  ///
  /// Parameter [protocol] :
  /// The protocol for connections from clients to the load balancer. For
  /// Application Load Balancers, the supported protocols are HTTP and HTTPS.
  /// For Network Load Balancers, the supported protocols are TCP, TLS, UDP, and
  /// TCP_UDP. You can’t specify the UDP or TCP_UDP protocol if dual-stack mode
  /// is enabled. You cannot specify a protocol for a Gateway Load Balancer.
  ///
  /// Parameter [sslPolicy] :
  /// [HTTPS and TLS listeners] The security policy that defines which protocols
  /// and ciphers are supported.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies">Security
  /// policies</a> in the <i>Application Load Balancers Guide</i> and <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#describe-ssl-policies">Security
  /// policies</a> in the <i>Network Load Balancers Guide</i>.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the listener.
  Future<CreateListenerOutput> createListener({
    required List<Action> defaultActions,
    required String loadBalancerArn,
    List<String>? alpnPolicy,
    List<Certificate>? certificates,
    MutualAuthenticationAttributes? mutualAuthentication,
    int? port,
    ProtocolEnum? protocol,
    String? sslPolicy,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'port',
      port,
      1,
      65535,
    );
    final $request = <String, dynamic>{};
    $request['DefaultActions'] = defaultActions;
    $request['LoadBalancerArn'] = loadBalancerArn;
    alpnPolicy?.also((arg) => $request['AlpnPolicy'] = arg);
    certificates?.also((arg) => $request['Certificates'] = arg);
    mutualAuthentication?.also((arg) => $request['MutualAuthentication'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    protocol?.also((arg) => $request['Protocol'] = arg.toValue());
    sslPolicy?.also((arg) => $request['SslPolicy'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateListener',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateListenerInput'],
      shapes: shapes,
      resultWrapper: 'CreateListenerResult',
    );
    return CreateListenerOutput.fromXml($result);
  }

  /// Creates an Application Load Balancer, Network Load Balancer, or Gateway
  /// Load Balancer.
  ///
  /// For more information, see the following:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html">Application
  /// Load Balancers</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html">Network
  /// Load Balancers</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-load-balancers.html">Gateway
  /// Load Balancers</a>
  /// </li>
  /// </ul>
  /// This operation is idempotent, which means that it completes at most one
  /// time. If you attempt to create multiple load balancers with the same
  /// settings, each call succeeds.
  ///
  /// May throw [DuplicateLoadBalancerNameException].
  /// May throw [TooManyLoadBalancersException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [SubnetNotFoundException].
  /// May throw [InvalidSubnetException].
  /// May throw [InvalidSecurityGroupException].
  /// May throw [InvalidSchemeException].
  /// May throw [TooManyTagsException].
  /// May throw [DuplicateTagKeysException].
  /// May throw [ResourceInUseException].
  /// May throw [AllocationIdNotFoundException].
  /// May throw [AvailabilityZoneNotSupportedException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [name] :
  /// The name of the load balancer.
  ///
  /// This name must be unique per region per account, can have a maximum of 32
  /// characters, must contain only alphanumeric characters or hyphens, must not
  /// begin or end with a hyphen, and must not begin with "internal-".
  ///
  /// Parameter [customerOwnedIpv4Pool] :
  /// [Application Load Balancers on Outposts] The ID of the customer-owned
  /// address pool (CoIP pool).
  ///
  /// Parameter [ipAddressType] :
  /// Note: Internal load balancers must use the <code>ipv4</code> IP address
  /// type.
  ///
  /// [Application Load Balancers] The IP address type. The possible values are
  /// <code>ipv4</code> (for only IPv4 addresses), <code>dualstack</code> (for
  /// IPv4 and IPv6 addresses), and <code>dualstack-without-public-ipv4</code>
  /// (for IPv6 only public addresses, with private IPv4 and IPv6 addresses).
  ///
  /// [Network Load Balancers] The IP address type. The possible values are
  /// <code>ipv4</code> (for only IPv4 addresses) and <code>dualstack</code>
  /// (for IPv4 and IPv6 addresses). You can’t specify <code>dualstack</code>
  /// for a load balancer with a UDP or TCP_UDP listener.
  ///
  /// [Gateway Load Balancers] The IP address type. The possible values are
  /// <code>ipv4</code> (for only IPv4 addresses) and <code>dualstack</code>
  /// (for IPv4 and IPv6 addresses).
  ///
  /// Parameter [scheme] :
  /// The nodes of an Internet-facing load balancer have public IP addresses.
  /// The DNS name of an Internet-facing load balancer is publicly resolvable to
  /// the public IP addresses of the nodes. Therefore, Internet-facing load
  /// balancers can route requests from clients over the internet.
  ///
  /// The nodes of an internal load balancer have only private IP addresses. The
  /// DNS name of an internal load balancer is publicly resolvable to the
  /// private IP addresses of the nodes. Therefore, internal load balancers can
  /// route requests only from clients with access to the VPC for the load
  /// balancer.
  ///
  /// The default is an Internet-facing load balancer.
  ///
  /// You cannot specify a scheme for a Gateway Load Balancer.
  ///
  /// Parameter [securityGroups] :
  /// [Application Load Balancers and Network Load Balancers] The IDs of the
  /// security groups for the load balancer.
  ///
  /// Parameter [subnetMappings] :
  /// The IDs of the subnets. You can specify only one subnet per Availability
  /// Zone. You must specify either subnets or subnet mappings, but not both.
  ///
  /// [Application Load Balancers] You must specify subnets from at least two
  /// Availability Zones. You cannot specify Elastic IP addresses for your
  /// subnets.
  ///
  /// [Application Load Balancers on Outposts] You must specify one Outpost
  /// subnet.
  ///
  /// [Application Load Balancers on Local Zones] You can specify subnets from
  /// one or more Local Zones.
  ///
  /// [Network Load Balancers] You can specify subnets from one or more
  /// Availability Zones. You can specify one Elastic IP address per subnet if
  /// you need static IP addresses for your internet-facing load balancer. For
  /// internal load balancers, you can specify one private IP address per subnet
  /// from the IPv4 range of the subnet. For internet-facing load balancer, you
  /// can specify one IPv6 address per subnet.
  ///
  /// [Gateway Load Balancers] You can specify subnets from one or more
  /// Availability Zones. You cannot specify Elastic IP addresses for your
  /// subnets.
  ///
  /// Parameter [subnets] :
  /// The IDs of the subnets. You can specify only one subnet per Availability
  /// Zone. You must specify either subnets or subnet mappings, but not both. To
  /// specify an Elastic IP address, specify subnet mappings instead of subnets.
  ///
  /// [Application Load Balancers] You must specify subnets from at least two
  /// Availability Zones.
  ///
  /// [Application Load Balancers on Outposts] You must specify one Outpost
  /// subnet.
  ///
  /// [Application Load Balancers on Local Zones] You can specify subnets from
  /// one or more Local Zones.
  ///
  /// [Network Load Balancers] You can specify subnets from one or more
  /// Availability Zones.
  ///
  /// [Gateway Load Balancers] You can specify subnets from one or more
  /// Availability Zones.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the load balancer.
  ///
  /// Parameter [type] :
  /// The type of load balancer. The default is <code>application</code>.
  Future<CreateLoadBalancerOutput> createLoadBalancer({
    required String name,
    String? customerOwnedIpv4Pool,
    IpAddressType? ipAddressType,
    LoadBalancerSchemeEnum? scheme,
    List<String>? securityGroups,
    List<SubnetMapping>? subnetMappings,
    List<String>? subnets,
    List<Tag>? tags,
    LoadBalancerTypeEnum? type,
  }) async {
    final $request = <String, dynamic>{};
    $request['Name'] = name;
    customerOwnedIpv4Pool
        ?.also((arg) => $request['CustomerOwnedIpv4Pool'] = arg);
    ipAddressType?.also((arg) => $request['IpAddressType'] = arg.toValue());
    scheme?.also((arg) => $request['Scheme'] = arg.toValue());
    securityGroups?.also((arg) => $request['SecurityGroups'] = arg);
    subnetMappings?.also((arg) => $request['SubnetMappings'] = arg);
    subnets?.also((arg) => $request['Subnets'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    type?.also((arg) => $request['Type'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'CreateLoadBalancer',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateLoadBalancerInput'],
      shapes: shapes,
      resultWrapper: 'CreateLoadBalancerResult',
    );
    return CreateLoadBalancerOutput.fromXml($result);
  }

  /// Creates a rule for the specified listener. The listener must be associated
  /// with an Application Load Balancer.
  ///
  /// Each rule consists of a priority, one or more actions, and one or more
  /// conditions. Rules are evaluated in priority order, from the lowest value
  /// to the highest value. When the conditions for a rule are met, its actions
  /// are performed. If the conditions for no rules are met, the actions for the
  /// default rule are performed. For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#listener-rules">Listener
  /// rules</a> in the <i>Application Load Balancers Guide</i>.
  ///
  /// May throw [PriorityInUseException].
  /// May throw [TooManyTargetGroupsException].
  /// May throw [TooManyRulesException].
  /// May throw [TargetGroupAssociationLimitException].
  /// May throw [IncompatibleProtocolsException].
  /// May throw [ListenerNotFoundException].
  /// May throw [TargetGroupNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [TooManyRegistrationsForTargetIdException].
  /// May throw [TooManyTargetsException].
  /// May throw [UnsupportedProtocolException].
  /// May throw [TooManyActionsException].
  /// May throw [InvalidLoadBalancerActionException].
  /// May throw [TooManyUniqueTargetGroupsPerLoadBalancerException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [actions] :
  /// The actions.
  ///
  /// Parameter [conditions] :
  /// The conditions.
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [priority] :
  /// The rule priority. A listener can't have multiple rules with the same
  /// priority.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the rule.
  Future<CreateRuleOutput> createRule({
    required List<Action> actions,
    required List<RuleCondition> conditions,
    required String listenerArn,
    required int priority,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      1,
      50000,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['Actions'] = actions;
    $request['Conditions'] = conditions;
    $request['ListenerArn'] = listenerArn;
    $request['Priority'] = priority;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateRule',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateRuleInput'],
      shapes: shapes,
      resultWrapper: 'CreateRuleResult',
    );
    return CreateRuleOutput.fromXml($result);
  }

  /// Creates a target group.
  ///
  /// For more information, see the following:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html">Target
  /// groups for your Application Load Balancers</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html">Target
  /// groups for your Network Load Balancers</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html">Target
  /// groups for your Gateway Load Balancers</a>
  /// </li>
  /// </ul>
  /// This operation is idempotent, which means that it completes at most one
  /// time. If you attempt to create multiple target groups with the same
  /// settings, each call succeeds.
  ///
  /// May throw [DuplicateTargetGroupNameException].
  /// May throw [TooManyTargetGroupsException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [name] :
  /// The name of the target group.
  ///
  /// This name must be unique per region per account, can have a maximum of 32
  /// characters, must contain only alphanumeric characters or hyphens, and must
  /// not begin or end with a hyphen.
  ///
  /// Parameter [healthCheckEnabled] :
  /// Indicates whether health checks are enabled. If the target type is
  /// <code>lambda</code>, health checks are disabled by default but can be
  /// enabled. If the target type is <code>instance</code>, <code>ip</code>, or
  /// <code>alb</code>, health checks are always enabled and cannot be disabled.
  ///
  /// Parameter [healthCheckIntervalSeconds] :
  /// The approximate amount of time, in seconds, between health checks of an
  /// individual target. The range is 5-300. If the target group protocol is
  /// TCP, TLS, UDP, TCP_UDP, HTTP or HTTPS, the default is 30 seconds. If the
  /// target group protocol is GENEVE, the default is 10 seconds. If the target
  /// type is <code>lambda</code>, the default is 35 seconds.
  ///
  /// Parameter [healthCheckPath] :
  /// [HTTP/HTTPS health checks] The destination for health checks on the
  /// targets.
  ///
  /// [HTTP1 or HTTP2 protocol version] The ping path. The default is /.
  ///
  /// [GRPC protocol version] The path of a custom health check method with the
  /// format /package.service/method. The default is /Amazon Web
  /// Services.ALB/healthcheck.
  ///
  /// Parameter [healthCheckPort] :
  /// The port the load balancer uses when performing health checks on targets.
  /// If the protocol is HTTP, HTTPS, TCP, TLS, UDP, or TCP_UDP, the default is
  /// <code>traffic-port</code>, which is the port on which each target receives
  /// traffic from the load balancer. If the protocol is GENEVE, the default is
  /// port 80.
  ///
  /// Parameter [healthCheckProtocol] :
  /// The protocol the load balancer uses when performing health checks on
  /// targets. For Application Load Balancers, the default is HTTP. For Network
  /// Load Balancers and Gateway Load Balancers, the default is TCP. The TCP
  /// protocol is not supported for health checks if the protocol of the target
  /// group is HTTP or HTTPS. The GENEVE, TLS, UDP, and TCP_UDP protocols are
  /// not supported for health checks.
  ///
  /// Parameter [healthCheckTimeoutSeconds] :
  /// The amount of time, in seconds, during which no response from a target
  /// means a failed health check. The range is 2–120 seconds. For target groups
  /// with a protocol of HTTP, the default is 6 seconds. For target groups with
  /// a protocol of TCP, TLS or HTTPS, the default is 10 seconds. For target
  /// groups with a protocol of GENEVE, the default is 5 seconds. If the target
  /// type is <code>lambda</code>, the default is 30 seconds.
  ///
  /// Parameter [healthyThresholdCount] :
  /// The number of consecutive health check successes required before
  /// considering a target healthy. The range is 2-10. If the target group
  /// protocol is TCP, TCP_UDP, UDP, TLS, HTTP or HTTPS, the default is 5. For
  /// target groups with a protocol of GENEVE, the default is 5. If the target
  /// type is <code>lambda</code>, the default is 5.
  ///
  /// Parameter [ipAddressType] :
  /// The type of IP address used for this target group. The possible values are
  /// <code>ipv4</code> and <code>ipv6</code>. This is an optional parameter. If
  /// not specified, the IP address type defaults to <code>ipv4</code>.
  ///
  /// Parameter [matcher] :
  /// [HTTP/HTTPS health checks] The HTTP or gRPC codes to use when checking for
  /// a successful response from a target. For target groups with a protocol of
  /// TCP, TCP_UDP, UDP or TLS the range is 200-599. For target groups with a
  /// protocol of HTTP or HTTPS, the range is 200-499. For target groups with a
  /// protocol of GENEVE, the range is 200-399.
  ///
  /// Parameter [port] :
  /// The port on which the targets receive traffic. This port is used unless
  /// you specify a port override when registering the target. If the target is
  /// a Lambda function, this parameter does not apply. If the protocol is
  /// GENEVE, the supported port is 6081.
  ///
  /// Parameter [protocol] :
  /// The protocol to use for routing traffic to the targets. For Application
  /// Load Balancers, the supported protocols are HTTP and HTTPS. For Network
  /// Load Balancers, the supported protocols are TCP, TLS, UDP, or TCP_UDP. For
  /// Gateway Load Balancers, the supported protocol is GENEVE. A TCP_UDP
  /// listener must be associated with a TCP_UDP target group. If the target is
  /// a Lambda function, this parameter does not apply.
  ///
  /// Parameter [protocolVersion] :
  /// [HTTP/HTTPS protocol] The protocol version. Specify <code>GRPC</code> to
  /// send requests to targets using gRPC. Specify <code>HTTP2</code> to send
  /// requests to targets using HTTP/2. The default is <code>HTTP1</code>, which
  /// sends requests to targets using HTTP/1.1.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the target group.
  ///
  /// Parameter [targetType] :
  /// The type of target that you must specify when registering targets with
  /// this target group. You can't specify targets for a target group using more
  /// than one target type.
  ///
  /// <ul>
  /// <li>
  /// <code>instance</code> - Register targets by instance ID. This is the
  /// default value.
  /// </li>
  /// <li>
  /// <code>ip</code> - Register targets by IP address. You can specify IP
  /// addresses from the subnets of the virtual private cloud (VPC) for the
  /// target group, the RFC 1918 range (10.0.0.0/8, 172.16.0.0/12, and
  /// 192.168.0.0/16), and the RFC 6598 range (100.64.0.0/10). You can't specify
  /// publicly routable IP addresses.
  /// </li>
  /// <li>
  /// <code>lambda</code> - Register a single Lambda function as a target.
  /// </li>
  /// <li>
  /// <code>alb</code> - Register a single Application Load Balancer as a
  /// target.
  /// </li>
  /// </ul>
  ///
  /// Parameter [unhealthyThresholdCount] :
  /// The number of consecutive health check failures required before
  /// considering a target unhealthy. The range is 2-10. If the target group
  /// protocol is TCP, TCP_UDP, UDP, TLS, HTTP or HTTPS, the default is 2. For
  /// target groups with a protocol of GENEVE, the default is 2. If the target
  /// type is <code>lambda</code>, the default is 5.
  ///
  /// Parameter [vpcId] :
  /// The identifier of the virtual private cloud (VPC). If the target is a
  /// Lambda function, this parameter does not apply. Otherwise, this parameter
  /// is required.
  Future<CreateTargetGroupOutput> createTargetGroup({
    required String name,
    bool? healthCheckEnabled,
    int? healthCheckIntervalSeconds,
    String? healthCheckPath,
    String? healthCheckPort,
    ProtocolEnum? healthCheckProtocol,
    int? healthCheckTimeoutSeconds,
    int? healthyThresholdCount,
    TargetGroupIpAddressTypeEnum? ipAddressType,
    Matcher? matcher,
    int? port,
    ProtocolEnum? protocol,
    String? protocolVersion,
    List<Tag>? tags,
    TargetTypeEnum? targetType,
    int? unhealthyThresholdCount,
    String? vpcId,
  }) async {
    _s.validateNumRange(
      'healthCheckIntervalSeconds',
      healthCheckIntervalSeconds,
      5,
      300,
    );
    _s.validateNumRange(
      'healthCheckTimeoutSeconds',
      healthCheckTimeoutSeconds,
      2,
      120,
    );
    _s.validateNumRange(
      'healthyThresholdCount',
      healthyThresholdCount,
      2,
      10,
    );
    _s.validateNumRange(
      'port',
      port,
      1,
      65535,
    );
    _s.validateNumRange(
      'unhealthyThresholdCount',
      unhealthyThresholdCount,
      2,
      10,
    );
    final $request = <String, dynamic>{};
    $request['Name'] = name;
    healthCheckEnabled?.also((arg) => $request['HealthCheckEnabled'] = arg);
    healthCheckIntervalSeconds
        ?.also((arg) => $request['HealthCheckIntervalSeconds'] = arg);
    healthCheckPath?.also((arg) => $request['HealthCheckPath'] = arg);
    healthCheckPort?.also((arg) => $request['HealthCheckPort'] = arg);
    healthCheckProtocol
        ?.also((arg) => $request['HealthCheckProtocol'] = arg.toValue());
    healthCheckTimeoutSeconds
        ?.also((arg) => $request['HealthCheckTimeoutSeconds'] = arg);
    healthyThresholdCount
        ?.also((arg) => $request['HealthyThresholdCount'] = arg);
    ipAddressType?.also((arg) => $request['IpAddressType'] = arg.toValue());
    matcher?.also((arg) => $request['Matcher'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    protocol?.also((arg) => $request['Protocol'] = arg.toValue());
    protocolVersion?.also((arg) => $request['ProtocolVersion'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    targetType?.also((arg) => $request['TargetType'] = arg.toValue());
    unhealthyThresholdCount
        ?.also((arg) => $request['UnhealthyThresholdCount'] = arg);
    vpcId?.also((arg) => $request['VpcId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateTargetGroup',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateTargetGroupInput'],
      shapes: shapes,
      resultWrapper: 'CreateTargetGroupResult',
    );
    return CreateTargetGroupOutput.fromXml($result);
  }

  /// Creates a trust store.
  ///
  /// May throw [DuplicateTrustStoreNameException].
  /// May throw [TooManyTrustStoresException].
  /// May throw [InvalidCaCertificatesBundleException].
  /// May throw [CaCertificatesBundleNotFoundException].
  /// May throw [TooManyTagsException].
  /// May throw [DuplicateTagKeysException].
  ///
  /// Parameter [caCertificatesBundleS3Bucket] :
  /// The Amazon S3 bucket for the ca certificates bundle.
  ///
  /// Parameter [caCertificatesBundleS3Key] :
  /// The Amazon S3 path for the ca certificates bundle.
  ///
  /// Parameter [name] :
  /// The name of the trust store.
  ///
  /// This name must be unique per region and cannot be changed after creation.
  ///
  /// Parameter [caCertificatesBundleS3ObjectVersion] :
  /// The Amazon S3 object version for the ca certificates bundle. If undefined
  /// the current version is used.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the trust store.
  Future<CreateTrustStoreOutput> createTrustStore({
    required String caCertificatesBundleS3Bucket,
    required String caCertificatesBundleS3Key,
    required String name,
    String? caCertificatesBundleS3ObjectVersion,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['CaCertificatesBundleS3Bucket'] = caCertificatesBundleS3Bucket;
    $request['CaCertificatesBundleS3Key'] = caCertificatesBundleS3Key;
    $request['Name'] = name;
    caCertificatesBundleS3ObjectVersion
        ?.also((arg) => $request['CaCertificatesBundleS3ObjectVersion'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateTrustStore',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateTrustStoreInput'],
      shapes: shapes,
      resultWrapper: 'CreateTrustStoreResult',
    );
    return CreateTrustStoreOutput.fromXml($result);
  }

  /// Deletes the specified listener.
  ///
  /// Alternatively, your listener is deleted when you delete the load balancer
  /// to which it is attached.
  ///
  /// May throw [ListenerNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener.
  Future<void> deleteListener({
    required String listenerArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['ListenerArn'] = listenerArn;
    await _protocol.send(
      $request,
      action: 'DeleteListener',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteListenerInput'],
      shapes: shapes,
      resultWrapper: 'DeleteListenerResult',
    );
  }

  /// Deletes the specified Application Load Balancer, Network Load Balancer, or
  /// Gateway Load Balancer. Deleting a load balancer also deletes its
  /// listeners.
  ///
  /// You can't delete a load balancer if deletion protection is enabled. If the
  /// load balancer does not exist or has already been deleted, the call
  /// succeeds.
  ///
  /// Deleting a load balancer does not affect its registered targets. For
  /// example, your EC2 instances continue to run and are still registered to
  /// their target groups. If you no longer need these EC2 instances, you can
  /// stop or terminate them.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  Future<void> deleteLoadBalancer({
    required String loadBalancerArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerArn'] = loadBalancerArn;
    await _protocol.send(
      $request,
      action: 'DeleteLoadBalancer',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteLoadBalancerInput'],
      shapes: shapes,
      resultWrapper: 'DeleteLoadBalancerResult',
    );
  }

  /// Deletes the specified rule.
  ///
  /// You can't delete the default rule.
  ///
  /// May throw [RuleNotFoundException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [ruleArn] :
  /// The Amazon Resource Name (ARN) of the rule.
  Future<void> deleteRule({
    required String ruleArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['RuleArn'] = ruleArn;
    await _protocol.send(
      $request,
      action: 'DeleteRule',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteRuleInput'],
      shapes: shapes,
      resultWrapper: 'DeleteRuleResult',
    );
  }

  /// Deletes the specified target group.
  ///
  /// You can delete a target group if it is not referenced by any actions.
  /// Deleting a target group also deletes any associated health checks.
  /// Deleting a target group does not affect its registered targets. For
  /// example, any EC2 instances continue to run until you stop or terminate
  /// them.
  ///
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [targetGroupArn] :
  /// The Amazon Resource Name (ARN) of the target group.
  Future<void> deleteTargetGroup({
    required String targetGroupArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['TargetGroupArn'] = targetGroupArn;
    await _protocol.send(
      $request,
      action: 'DeleteTargetGroup',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteTargetGroupInput'],
      shapes: shapes,
      resultWrapper: 'DeleteTargetGroupResult',
    );
  }

  /// Deletes a trust store.
  ///
  /// May throw [TrustStoreNotFoundException].
  /// May throw [TrustStoreInUseException].
  ///
  /// Parameter [trustStoreArn] :
  /// The Amazon Resource Name (ARN) of the trust store.
  Future<void> deleteTrustStore({
    required String trustStoreArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['TrustStoreArn'] = trustStoreArn;
    await _protocol.send(
      $request,
      action: 'DeleteTrustStore',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteTrustStoreInput'],
      shapes: shapes,
      resultWrapper: 'DeleteTrustStoreResult',
    );
  }

  /// Deregisters the specified targets from the specified target group. After
  /// the targets are deregistered, they no longer receive traffic from the load
  /// balancer.
  ///
  /// The load balancer stops sending requests to targets that are
  /// deregistering, but uses connection draining to ensure that in-flight
  /// traffic completes on the existing connections. This deregistration delay
  /// is configured by default but can be updated for each target group.
  ///
  /// For more information, see the following:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html#deregistration-delay">
  /// Deregistration delay</a> in the <i>Application Load Balancers User
  /// Guide</i>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html#deregistration-delay">
  /// Deregistration delay</a> in the <i>Network Load Balancers User Guide</i>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html#deregistration-delay">
  /// Deregistration delay</a> in the <i>Gateway Load Balancers User Guide</i>
  /// </li>
  /// </ul>
  /// Note: If the specified target does not exist, the action returns
  /// successfully.
  ///
  /// May throw [TargetGroupNotFoundException].
  /// May throw [InvalidTargetException].
  ///
  /// Parameter [targetGroupArn] :
  /// The Amazon Resource Name (ARN) of the target group.
  ///
  /// Parameter [targets] :
  /// The targets. If you specified a port override when you registered a
  /// target, you must specify both the target ID and the port when you
  /// deregister it.
  Future<void> deregisterTargets({
    required String targetGroupArn,
    required List<TargetDescription> targets,
  }) async {
    final $request = <String, dynamic>{};
    $request['TargetGroupArn'] = targetGroupArn;
    $request['Targets'] = targets;
    await _protocol.send(
      $request,
      action: 'DeregisterTargets',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeregisterTargetsInput'],
      shapes: shapes,
      resultWrapper: 'DeregisterTargetsResult',
    );
  }

  /// Describes the current Elastic Load Balancing resource limits for your
  /// Amazon Web Services account.
  ///
  /// For more information, see the following:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html">Quotas
  /// for your Application Load Balancers</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-limits.html">Quotas
  /// for your Network Load Balancers</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/quotas-limits.html">Quotas
  /// for your Gateway Load Balancers</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  Future<DescribeAccountLimitsOutput> describeAccountLimits({
    String? marker,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAccountLimits',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAccountLimitsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeAccountLimitsResult',
    );
    return DescribeAccountLimitsOutput.fromXml($result);
  }

  /// Describes the default certificate and the certificate list for the
  /// specified HTTPS or TLS listener.
  ///
  /// If the default certificate is also in the certificate list, it appears
  /// twice in the results (once with <code>IsDefault</code> set to true and
  /// once with <code>IsDefault</code> set to false).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#https-listener-certificates">SSL
  /// certificates</a> in the <i>Application Load Balancers Guide</i> or <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#tls-listener-certificate">Server
  /// certificates</a> in the <i>Network Load Balancers Guide</i>.
  ///
  /// May throw [ListenerNotFoundException].
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Names (ARN) of the listener.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  Future<DescribeListenerCertificatesOutput> describeListenerCertificates({
    required String listenerArn,
    String? marker,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    $request['ListenerArn'] = listenerArn;
    marker?.also((arg) => $request['Marker'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeListenerCertificates',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeListenerCertificatesInput'],
      shapes: shapes,
      resultWrapper: 'DescribeListenerCertificatesResult',
    );
    return DescribeListenerCertificatesOutput.fromXml($result);
  }

  /// Describes the specified listeners or the listeners for the specified
  /// Application Load Balancer, Network Load Balancer, or Gateway Load
  /// Balancer. You must specify either a load balancer or one or more
  /// listeners.
  ///
  /// May throw [ListenerNotFoundException].
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [UnsupportedProtocolException].
  ///
  /// Parameter [listenerArns] :
  /// The Amazon Resource Names (ARN) of the listeners.
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  Future<DescribeListenersOutput> describeListeners({
    List<String>? listenerArns,
    String? loadBalancerArn,
    String? marker,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    listenerArns?.also((arg) => $request['ListenerArns'] = arg);
    loadBalancerArn?.also((arg) => $request['LoadBalancerArn'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeListeners',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeListenersInput'],
      shapes: shapes,
      resultWrapper: 'DescribeListenersResult',
    );
    return DescribeListenersOutput.fromXml($result);
  }

  /// Describes the attributes for the specified Application Load Balancer,
  /// Network Load Balancer, or Gateway Load Balancer.
  ///
  /// For more information, see the following:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html#load-balancer-attributes">Load
  /// balancer attributes</a> in the <i>Application Load Balancers Guide</i>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html#load-balancer-attributes">Load
  /// balancer attributes</a> in the <i>Network Load Balancers Guide</i>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-load-balancers.html#load-balancer-attributes">Load
  /// balancer attributes</a> in the <i>Gateway Load Balancers Guide</i>
  /// </li>
  /// </ul>
  ///
  /// May throw [LoadBalancerNotFoundException].
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  Future<DescribeLoadBalancerAttributesOutput> describeLoadBalancerAttributes({
    required String loadBalancerArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerArn'] = loadBalancerArn;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeLoadBalancerAttributes',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeLoadBalancerAttributesInput'],
      shapes: shapes,
      resultWrapper: 'DescribeLoadBalancerAttributesResult',
    );
    return DescribeLoadBalancerAttributesOutput.fromXml($result);
  }

  /// Describes the specified load balancers or all of your load balancers.
  ///
  /// May throw [LoadBalancerNotFoundException].
  ///
  /// Parameter [loadBalancerArns] :
  /// The Amazon Resource Names (ARN) of the load balancers. You can specify up
  /// to 20 load balancers in a single call.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [names] :
  /// The names of the load balancers.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  Future<DescribeLoadBalancersOutput> describeLoadBalancers({
    List<String>? loadBalancerArns,
    String? marker,
    List<String>? names,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    loadBalancerArns?.also((arg) => $request['LoadBalancerArns'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    names?.also((arg) => $request['Names'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeLoadBalancers',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeLoadBalancersInput'],
      shapes: shapes,
      resultWrapper: 'DescribeLoadBalancersResult',
    );
    return DescribeLoadBalancersOutput.fromXml($result);
  }

  /// Describes the specified rules or the rules for the specified listener. You
  /// must specify either a listener or one or more rules.
  ///
  /// May throw [ListenerNotFoundException].
  /// May throw [RuleNotFoundException].
  /// May throw [UnsupportedProtocolException].
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  ///
  /// Parameter [ruleArns] :
  /// The Amazon Resource Names (ARN) of the rules.
  Future<DescribeRulesOutput> describeRules({
    String? listenerArn,
    String? marker,
    int? pageSize,
    List<String>? ruleArns,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    listenerArn?.also((arg) => $request['ListenerArn'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    ruleArns?.also((arg) => $request['RuleArns'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeRules',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeRulesInput'],
      shapes: shapes,
      resultWrapper: 'DescribeRulesResult',
    );
    return DescribeRulesOutput.fromXml($result);
  }

  /// Describes the specified policies or all policies used for SSL negotiation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies">Security
  /// policies</a> in the <i>Application Load Balancers Guide</i> or <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#describe-ssl-policies">Security
  /// policies</a> in the <i>Network Load Balancers Guide</i>.
  ///
  /// May throw [SSLPolicyNotFoundException].
  ///
  /// Parameter [loadBalancerType] :
  /// The type of load balancer. The default lists the SSL policies for all load
  /// balancers.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [names] :
  /// The names of the policies.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  Future<DescribeSSLPoliciesOutput> describeSSLPolicies({
    LoadBalancerTypeEnum? loadBalancerType,
    String? marker,
    List<String>? names,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    loadBalancerType
        ?.also((arg) => $request['LoadBalancerType'] = arg.toValue());
    marker?.also((arg) => $request['Marker'] = arg);
    names?.also((arg) => $request['Names'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeSSLPolicies',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeSSLPoliciesInput'],
      shapes: shapes,
      resultWrapper: 'DescribeSSLPoliciesResult',
    );
    return DescribeSSLPoliciesOutput.fromXml($result);
  }

  /// Describes the tags for the specified Elastic Load Balancing resources. You
  /// can describe the tags for one or more Application Load Balancers, Network
  /// Load Balancers, Gateway Load Balancers, target groups, listeners, or
  /// rules.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [TargetGroupNotFoundException].
  /// May throw [ListenerNotFoundException].
  /// May throw [RuleNotFoundException].
  /// May throw [TrustStoreNotFoundException].
  ///
  /// Parameter [resourceArns] :
  /// The Amazon Resource Names (ARN) of the resources. You can specify up to 20
  /// resources in a single call.
  Future<DescribeTagsOutput> describeTags({
    required List<String> resourceArns,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceArns'] = resourceArns;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTags',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTagsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeTagsResult',
    );
    return DescribeTagsOutput.fromXml($result);
  }

  /// Describes the attributes for the specified target group.
  ///
  /// For more information, see the following:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html#target-group-attributes">Target
  /// group attributes</a> in the <i>Application Load Balancers Guide</i>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html#target-group-attributes">Target
  /// group attributes</a> in the <i>Network Load Balancers Guide</i>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html#target-group-attributes">Target
  /// group attributes</a> in the <i>Gateway Load Balancers Guide</i>
  /// </li>
  /// </ul>
  ///
  /// May throw [TargetGroupNotFoundException].
  ///
  /// Parameter [targetGroupArn] :
  /// The Amazon Resource Name (ARN) of the target group.
  Future<DescribeTargetGroupAttributesOutput> describeTargetGroupAttributes({
    required String targetGroupArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['TargetGroupArn'] = targetGroupArn;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTargetGroupAttributes',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTargetGroupAttributesInput'],
      shapes: shapes,
      resultWrapper: 'DescribeTargetGroupAttributesResult',
    );
    return DescribeTargetGroupAttributesOutput.fromXml($result);
  }

  /// Describes the specified target groups or all of your target groups. By
  /// default, all target groups are described. Alternatively, you can specify
  /// one of the following to filter the results: the ARN of the load balancer,
  /// the names of one or more target groups, or the ARNs of one or more target
  /// groups.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [TargetGroupNotFoundException].
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [names] :
  /// The names of the target groups.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  ///
  /// Parameter [targetGroupArns] :
  /// The Amazon Resource Names (ARN) of the target groups.
  Future<DescribeTargetGroupsOutput> describeTargetGroups({
    String? loadBalancerArn,
    String? marker,
    List<String>? names,
    int? pageSize,
    List<String>? targetGroupArns,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    loadBalancerArn?.also((arg) => $request['LoadBalancerArn'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    names?.also((arg) => $request['Names'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    targetGroupArns?.also((arg) => $request['TargetGroupArns'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTargetGroups',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTargetGroupsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeTargetGroupsResult',
    );
    return DescribeTargetGroupsOutput.fromXml($result);
  }

  /// Describes the health of the specified targets or all of your targets.
  ///
  /// May throw [InvalidTargetException].
  /// May throw [TargetGroupNotFoundException].
  /// May throw [HealthUnavailableException].
  ///
  /// Parameter [targetGroupArn] :
  /// The Amazon Resource Name (ARN) of the target group.
  ///
  /// Parameter [include] :
  /// Used to inclue anomaly detection information.
  ///
  /// Parameter [targets] :
  /// The targets.
  Future<DescribeTargetHealthOutput> describeTargetHealth({
    required String targetGroupArn,
    List<DescribeTargetHealthInputIncludeEnum>? include,
    List<TargetDescription>? targets,
  }) async {
    final $request = <String, dynamic>{};
    $request['TargetGroupArn'] = targetGroupArn;
    include?.also(
        (arg) => $request['Include'] = arg.map((e) => e.toValue()).toList());
    targets?.also((arg) => $request['Targets'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTargetHealth',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTargetHealthInput'],
      shapes: shapes,
      resultWrapper: 'DescribeTargetHealthResult',
    );
    return DescribeTargetHealthOutput.fromXml($result);
  }

  /// Describes all resources associated with the specified trust store.
  ///
  /// May throw [TrustStoreNotFoundException].
  ///
  /// Parameter [trustStoreArn] :
  /// The Amazon Resource Name (ARN) of the trust store.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  Future<DescribeTrustStoreAssociationsOutput> describeTrustStoreAssociations({
    required String trustStoreArn,
    String? marker,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    $request['TrustStoreArn'] = trustStoreArn;
    marker?.also((arg) => $request['Marker'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTrustStoreAssociations',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTrustStoreAssociationsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeTrustStoreAssociationsResult',
    );
    return DescribeTrustStoreAssociationsOutput.fromXml($result);
  }

  /// Describes the revocation files in use by the specified trust store arn, or
  /// revocation ID.
  ///
  /// May throw [TrustStoreNotFoundException].
  /// May throw [RevocationIdNotFoundException].
  ///
  /// Parameter [trustStoreArn] :
  /// The Amazon Resource Name (ARN) of the trust store.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  ///
  /// Parameter [revocationIds] :
  /// The revocation IDs of the revocation files you want to describe.
  Future<DescribeTrustStoreRevocationsOutput> describeTrustStoreRevocations({
    required String trustStoreArn,
    String? marker,
    int? pageSize,
    List<int>? revocationIds,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    $request['TrustStoreArn'] = trustStoreArn;
    marker?.also((arg) => $request['Marker'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    revocationIds?.also((arg) => $request['RevocationIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTrustStoreRevocations',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTrustStoreRevocationsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeTrustStoreRevocationsResult',
    );
    return DescribeTrustStoreRevocationsOutput.fromXml($result);
  }

  /// Describes all trust stores for a given account by trust store arn’s or
  /// name.
  ///
  /// May throw [TrustStoreNotFoundException].
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [names] :
  /// The names of the trust stores.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  ///
  /// Parameter [trustStoreArns] :
  /// The Amazon Resource Name (ARN) of the trust store.
  Future<DescribeTrustStoresOutput> describeTrustStores({
    String? marker,
    List<String>? names,
    int? pageSize,
    List<String>? trustStoreArns,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    names?.also((arg) => $request['Names'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    trustStoreArns?.also((arg) => $request['TrustStoreArns'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTrustStores',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTrustStoresInput'],
      shapes: shapes,
      resultWrapper: 'DescribeTrustStoresResult',
    );
    return DescribeTrustStoresOutput.fromXml($result);
  }

  /// Retrieves the ca certificate bundle.
  ///
  /// This action returns a pre-signed S3 URI which is active for ten minutes.
  ///
  /// May throw [TrustStoreNotFoundException].
  ///
  /// Parameter [trustStoreArn] :
  /// The Amazon Resource Name (ARN) of the trust store.
  Future<GetTrustStoreCaCertificatesBundleOutput>
      getTrustStoreCaCertificatesBundle({
    required String trustStoreArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['TrustStoreArn'] = trustStoreArn;
    final $result = await _protocol.send(
      $request,
      action: 'GetTrustStoreCaCertificatesBundle',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetTrustStoreCaCertificatesBundleInput'],
      shapes: shapes,
      resultWrapper: 'GetTrustStoreCaCertificatesBundleResult',
    );
    return GetTrustStoreCaCertificatesBundleOutput.fromXml($result);
  }

  /// Retrieves the specified revocation file.
  ///
  /// This action returns a pre-signed S3 URI which is active for ten minutes.
  ///
  /// May throw [TrustStoreNotFoundException].
  /// May throw [RevocationIdNotFoundException].
  ///
  /// Parameter [revocationId] :
  /// The revocation ID of the revocation file.
  ///
  /// Parameter [trustStoreArn] :
  /// The Amazon Resource Name (ARN) of the trust store.
  Future<GetTrustStoreRevocationContentOutput> getTrustStoreRevocationContent({
    required int revocationId,
    required String trustStoreArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['RevocationId'] = revocationId;
    $request['TrustStoreArn'] = trustStoreArn;
    final $result = await _protocol.send(
      $request,
      action: 'GetTrustStoreRevocationContent',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetTrustStoreRevocationContentInput'],
      shapes: shapes,
      resultWrapper: 'GetTrustStoreRevocationContentResult',
    );
    return GetTrustStoreRevocationContentOutput.fromXml($result);
  }

  /// Replaces the specified properties of the specified listener. Any
  /// properties that you do not specify remain unchanged.
  ///
  /// Changing the protocol from HTTPS to HTTP, or from TLS to TCP, removes the
  /// security policy and default certificate properties. If you change the
  /// protocol from HTTP to HTTPS, or from TCP to TLS, you must add the security
  /// policy and default certificate properties.
  ///
  /// To add an item to a list, remove an item from a list, or update an item in
  /// a list, you must provide the entire list. For example, to add an action,
  /// specify a list with the current actions plus the new action.
  ///
  /// May throw [DuplicateListenerException].
  /// May throw [TooManyListenersException].
  /// May throw [TooManyCertificatesException].
  /// May throw [ListenerNotFoundException].
  /// May throw [TargetGroupNotFoundException].
  /// May throw [TargetGroupAssociationLimitException].
  /// May throw [IncompatibleProtocolsException].
  /// May throw [SSLPolicyNotFoundException].
  /// May throw [CertificateNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [UnsupportedProtocolException].
  /// May throw [TooManyRegistrationsForTargetIdException].
  /// May throw [TooManyTargetsException].
  /// May throw [TooManyActionsException].
  /// May throw [InvalidLoadBalancerActionException].
  /// May throw [TooManyUniqueTargetGroupsPerLoadBalancerException].
  /// May throw [ALPNPolicyNotSupportedException].
  /// May throw [TrustStoreNotFoundException].
  /// May throw [TrustStoreNotReadyException].
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [alpnPolicy] :
  /// [TLS listeners] The name of the Application-Layer Protocol Negotiation
  /// (ALPN) policy. You can specify one policy name. The following are the
  /// possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>HTTP1Only</code>
  /// </li>
  /// <li>
  /// <code>HTTP2Only</code>
  /// </li>
  /// <li>
  /// <code>HTTP2Optional</code>
  /// </li>
  /// <li>
  /// <code>HTTP2Preferred</code>
  /// </li>
  /// <li>
  /// <code>None</code>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#alpn-policies">ALPN
  /// policies</a> in the <i>Network Load Balancers Guide</i>.
  ///
  /// Parameter [certificates] :
  /// [HTTPS and TLS listeners] The default certificate for the listener. You
  /// must provide exactly one certificate. Set <code>CertificateArn</code> to
  /// the certificate ARN but do not set <code>IsDefault</code>.
  ///
  /// Parameter [defaultActions] :
  /// The actions for the default rule.
  ///
  /// Parameter [mutualAuthentication] :
  /// The mutual authentication configuration information.
  ///
  /// Parameter [port] :
  /// The port for connections from clients to the load balancer. You cannot
  /// specify a port for a Gateway Load Balancer.
  ///
  /// Parameter [protocol] :
  /// The protocol for connections from clients to the load balancer.
  /// Application Load Balancers support the HTTP and HTTPS protocols. Network
  /// Load Balancers support the TCP, TLS, UDP, and TCP_UDP protocols. You can’t
  /// change the protocol to UDP or TCP_UDP if dual-stack mode is enabled. You
  /// cannot specify a protocol for a Gateway Load Balancer.
  ///
  /// Parameter [sslPolicy] :
  /// [HTTPS and TLS listeners] The security policy that defines which protocols
  /// and ciphers are supported.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies">Security
  /// policies</a> in the <i>Application Load Balancers Guide</i> or <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#describe-ssl-policies">Security
  /// policies</a> in the <i>Network Load Balancers Guide</i>.
  Future<ModifyListenerOutput> modifyListener({
    required String listenerArn,
    List<String>? alpnPolicy,
    List<Certificate>? certificates,
    List<Action>? defaultActions,
    MutualAuthenticationAttributes? mutualAuthentication,
    int? port,
    ProtocolEnum? protocol,
    String? sslPolicy,
  }) async {
    _s.validateNumRange(
      'port',
      port,
      1,
      65535,
    );
    final $request = <String, dynamic>{};
    $request['ListenerArn'] = listenerArn;
    alpnPolicy?.also((arg) => $request['AlpnPolicy'] = arg);
    certificates?.also((arg) => $request['Certificates'] = arg);
    defaultActions?.also((arg) => $request['DefaultActions'] = arg);
    mutualAuthentication?.also((arg) => $request['MutualAuthentication'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    protocol?.also((arg) => $request['Protocol'] = arg.toValue());
    sslPolicy?.also((arg) => $request['SslPolicy'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyListener',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyListenerInput'],
      shapes: shapes,
      resultWrapper: 'ModifyListenerResult',
    );
    return ModifyListenerOutput.fromXml($result);
  }

  /// Modifies the specified attributes of the specified Application Load
  /// Balancer, Network Load Balancer, or Gateway Load Balancer.
  ///
  /// If any of the specified attributes can't be modified as requested, the
  /// call fails. Any existing attributes that you do not modify retain their
  /// current values.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [attributes] :
  /// The load balancer attributes.
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  Future<ModifyLoadBalancerAttributesOutput> modifyLoadBalancerAttributes({
    required List<LoadBalancerAttribute> attributes,
    required String loadBalancerArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['Attributes'] = attributes;
    $request['LoadBalancerArn'] = loadBalancerArn;
    final $result = await _protocol.send(
      $request,
      action: 'ModifyLoadBalancerAttributes',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyLoadBalancerAttributesInput'],
      shapes: shapes,
      resultWrapper: 'ModifyLoadBalancerAttributesResult',
    );
    return ModifyLoadBalancerAttributesOutput.fromXml($result);
  }

  /// Replaces the specified properties of the specified rule. Any properties
  /// that you do not specify are unchanged.
  ///
  /// To add an item to a list, remove an item from a list, or update an item in
  /// a list, you must provide the entire list. For example, to add an action,
  /// specify a list with the current actions plus the new action.
  ///
  /// May throw [TargetGroupAssociationLimitException].
  /// May throw [IncompatibleProtocolsException].
  /// May throw [RuleNotFoundException].
  /// May throw [OperationNotPermittedException].
  /// May throw [TooManyRegistrationsForTargetIdException].
  /// May throw [TooManyTargetsException].
  /// May throw [TargetGroupNotFoundException].
  /// May throw [UnsupportedProtocolException].
  /// May throw [TooManyActionsException].
  /// May throw [InvalidLoadBalancerActionException].
  /// May throw [TooManyUniqueTargetGroupsPerLoadBalancerException].
  ///
  /// Parameter [ruleArn] :
  /// The Amazon Resource Name (ARN) of the rule.
  ///
  /// Parameter [actions] :
  /// The actions.
  ///
  /// Parameter [conditions] :
  /// The conditions.
  Future<ModifyRuleOutput> modifyRule({
    required String ruleArn,
    List<Action>? actions,
    List<RuleCondition>? conditions,
  }) async {
    final $request = <String, dynamic>{};
    $request['RuleArn'] = ruleArn;
    actions?.also((arg) => $request['Actions'] = arg);
    conditions?.also((arg) => $request['Conditions'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyRule',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyRuleInput'],
      shapes: shapes,
      resultWrapper: 'ModifyRuleResult',
    );
    return ModifyRuleOutput.fromXml($result);
  }

  /// Modifies the health checks used when evaluating the health state of the
  /// targets in the specified target group.
  ///
  /// May throw [TargetGroupNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [targetGroupArn] :
  /// The Amazon Resource Name (ARN) of the target group.
  ///
  /// Parameter [healthCheckEnabled] :
  /// Indicates whether health checks are enabled.
  ///
  /// Parameter [healthCheckIntervalSeconds] :
  /// The approximate amount of time, in seconds, between health checks of an
  /// individual target.
  ///
  /// Parameter [healthCheckPath] :
  /// [HTTP/HTTPS health checks] The destination for health checks on the
  /// targets.
  ///
  /// [HTTP1 or HTTP2 protocol version] The ping path. The default is /.
  ///
  /// [GRPC protocol version] The path of a custom health check method with the
  /// format /package.service/method. The default is /Amazon Web
  /// Services.ALB/healthcheck.
  ///
  /// Parameter [healthCheckPort] :
  /// The port the load balancer uses when performing health checks on targets.
  ///
  /// Parameter [healthCheckProtocol] :
  /// The protocol the load balancer uses when performing health checks on
  /// targets. For Application Load Balancers, the default is HTTP. For Network
  /// Load Balancers and Gateway Load Balancers, the default is TCP. The TCP
  /// protocol is not supported for health checks if the protocol of the target
  /// group is HTTP or HTTPS. It is supported for health checks only if the
  /// protocol of the target group is TCP, TLS, UDP, or TCP_UDP. The GENEVE,
  /// TLS, UDP, and TCP_UDP protocols are not supported for health checks.
  ///
  /// Parameter [healthCheckTimeoutSeconds] :
  /// [HTTP/HTTPS health checks] The amount of time, in seconds, during which no
  /// response means a failed health check.
  ///
  /// Parameter [healthyThresholdCount] :
  /// The number of consecutive health checks successes required before
  /// considering an unhealthy target healthy.
  ///
  /// Parameter [matcher] :
  /// [HTTP/HTTPS health checks] The HTTP or gRPC codes to use when checking for
  /// a successful response from a target. For target groups with a protocol of
  /// TCP, TCP_UDP, UDP or TLS the range is 200-599. For target groups with a
  /// protocol of HTTP or HTTPS, the range is 200-499. For target groups with a
  /// protocol of GENEVE, the range is 200-399.
  ///
  /// Parameter [unhealthyThresholdCount] :
  /// The number of consecutive health check failures required before
  /// considering the target unhealthy.
  Future<ModifyTargetGroupOutput> modifyTargetGroup({
    required String targetGroupArn,
    bool? healthCheckEnabled,
    int? healthCheckIntervalSeconds,
    String? healthCheckPath,
    String? healthCheckPort,
    ProtocolEnum? healthCheckProtocol,
    int? healthCheckTimeoutSeconds,
    int? healthyThresholdCount,
    Matcher? matcher,
    int? unhealthyThresholdCount,
  }) async {
    _s.validateNumRange(
      'healthCheckIntervalSeconds',
      healthCheckIntervalSeconds,
      5,
      300,
    );
    _s.validateNumRange(
      'healthCheckTimeoutSeconds',
      healthCheckTimeoutSeconds,
      2,
      120,
    );
    _s.validateNumRange(
      'healthyThresholdCount',
      healthyThresholdCount,
      2,
      10,
    );
    _s.validateNumRange(
      'unhealthyThresholdCount',
      unhealthyThresholdCount,
      2,
      10,
    );
    final $request = <String, dynamic>{};
    $request['TargetGroupArn'] = targetGroupArn;
    healthCheckEnabled?.also((arg) => $request['HealthCheckEnabled'] = arg);
    healthCheckIntervalSeconds
        ?.also((arg) => $request['HealthCheckIntervalSeconds'] = arg);
    healthCheckPath?.also((arg) => $request['HealthCheckPath'] = arg);
    healthCheckPort?.also((arg) => $request['HealthCheckPort'] = arg);
    healthCheckProtocol
        ?.also((arg) => $request['HealthCheckProtocol'] = arg.toValue());
    healthCheckTimeoutSeconds
        ?.also((arg) => $request['HealthCheckTimeoutSeconds'] = arg);
    healthyThresholdCount
        ?.also((arg) => $request['HealthyThresholdCount'] = arg);
    matcher?.also((arg) => $request['Matcher'] = arg);
    unhealthyThresholdCount
        ?.also((arg) => $request['UnhealthyThresholdCount'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyTargetGroup',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyTargetGroupInput'],
      shapes: shapes,
      resultWrapper: 'ModifyTargetGroupResult',
    );
    return ModifyTargetGroupOutput.fromXml($result);
  }

  /// Modifies the specified attributes of the specified target group.
  ///
  /// May throw [TargetGroupNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [attributes] :
  /// The attributes.
  ///
  /// Parameter [targetGroupArn] :
  /// The Amazon Resource Name (ARN) of the target group.
  Future<ModifyTargetGroupAttributesOutput> modifyTargetGroupAttributes({
    required List<TargetGroupAttribute> attributes,
    required String targetGroupArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['Attributes'] = attributes;
    $request['TargetGroupArn'] = targetGroupArn;
    final $result = await _protocol.send(
      $request,
      action: 'ModifyTargetGroupAttributes',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyTargetGroupAttributesInput'],
      shapes: shapes,
      resultWrapper: 'ModifyTargetGroupAttributesResult',
    );
    return ModifyTargetGroupAttributesOutput.fromXml($result);
  }

  /// Update the ca certificate bundle for a given trust store.
  ///
  /// May throw [TrustStoreNotFoundException].
  /// May throw [InvalidCaCertificatesBundleException].
  /// May throw [CaCertificatesBundleNotFoundException].
  ///
  /// Parameter [caCertificatesBundleS3Bucket] :
  /// The Amazon S3 bucket for the ca certificates bundle.
  ///
  /// Parameter [caCertificatesBundleS3Key] :
  /// The Amazon S3 path for the ca certificates bundle.
  ///
  /// Parameter [trustStoreArn] :
  /// The Amazon Resource Name (ARN) of the trust store.
  ///
  /// Parameter [caCertificatesBundleS3ObjectVersion] :
  /// The Amazon S3 object version for the ca certificates bundle. If undefined
  /// the current version is used.
  Future<ModifyTrustStoreOutput> modifyTrustStore({
    required String caCertificatesBundleS3Bucket,
    required String caCertificatesBundleS3Key,
    required String trustStoreArn,
    String? caCertificatesBundleS3ObjectVersion,
  }) async {
    final $request = <String, dynamic>{};
    $request['CaCertificatesBundleS3Bucket'] = caCertificatesBundleS3Bucket;
    $request['CaCertificatesBundleS3Key'] = caCertificatesBundleS3Key;
    $request['TrustStoreArn'] = trustStoreArn;
    caCertificatesBundleS3ObjectVersion
        ?.also((arg) => $request['CaCertificatesBundleS3ObjectVersion'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyTrustStore',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyTrustStoreInput'],
      shapes: shapes,
      resultWrapper: 'ModifyTrustStoreResult',
    );
    return ModifyTrustStoreOutput.fromXml($result);
  }

  /// Registers the specified targets with the specified target group.
  ///
  /// If the target is an EC2 instance, it must be in the <code>running</code>
  /// state when you register it.
  ///
  /// By default, the load balancer routes requests to registered targets using
  /// the protocol and port for the target group. Alternatively, you can
  /// override the port for a target when you register it. You can register each
  /// EC2 instance or IP address with the same target group multiple times using
  /// different ports.
  ///
  /// With a Network Load Balancer, you cannot register instances by instance ID
  /// if they have the following instance types: C1, CC1, CC2, CG1, CG2, CR1,
  /// CS1, G1, G2, HI1, HS1, M1, M2, M3, and T1. You can register instances of
  /// these types by IP address.
  ///
  /// May throw [TargetGroupNotFoundException].
  /// May throw [TooManyTargetsException].
  /// May throw [InvalidTargetException].
  /// May throw [TooManyRegistrationsForTargetIdException].
  ///
  /// Parameter [targetGroupArn] :
  /// The Amazon Resource Name (ARN) of the target group.
  ///
  /// Parameter [targets] :
  /// The targets.
  Future<void> registerTargets({
    required String targetGroupArn,
    required List<TargetDescription> targets,
  }) async {
    final $request = <String, dynamic>{};
    $request['TargetGroupArn'] = targetGroupArn;
    $request['Targets'] = targets;
    await _protocol.send(
      $request,
      action: 'RegisterTargets',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RegisterTargetsInput'],
      shapes: shapes,
      resultWrapper: 'RegisterTargetsResult',
    );
  }

  /// Removes the specified certificate from the certificate list for the
  /// specified HTTPS or TLS listener.
  ///
  /// May throw [ListenerNotFoundException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [certificates] :
  /// The certificate to remove. You can specify one certificate per call. Set
  /// <code>CertificateArn</code> to the certificate ARN but do not set
  /// <code>IsDefault</code>.
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener.
  Future<void> removeListenerCertificates({
    required List<Certificate> certificates,
    required String listenerArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['Certificates'] = certificates;
    $request['ListenerArn'] = listenerArn;
    await _protocol.send(
      $request,
      action: 'RemoveListenerCertificates',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveListenerCertificatesInput'],
      shapes: shapes,
      resultWrapper: 'RemoveListenerCertificatesResult',
    );
  }

  /// Removes the specified tags from the specified Elastic Load Balancing
  /// resources. You can remove the tags for one or more Application Load
  /// Balancers, Network Load Balancers, Gateway Load Balancers, target groups,
  /// listeners, or rules.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [TargetGroupNotFoundException].
  /// May throw [ListenerNotFoundException].
  /// May throw [RuleNotFoundException].
  /// May throw [TooManyTagsException].
  /// May throw [TrustStoreNotFoundException].
  ///
  /// Parameter [resourceArns] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys for the tags to remove.
  Future<void> removeTags({
    required List<String> resourceArns,
    required List<String> tagKeys,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceArns'] = resourceArns;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      action: 'RemoveTags',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveTagsInput'],
      shapes: shapes,
      resultWrapper: 'RemoveTagsResult',
    );
  }

  /// Removes the specified revocation file from the specified trust store.
  ///
  /// May throw [TrustStoreNotFoundException].
  /// May throw [RevocationIdNotFoundException].
  ///
  /// Parameter [revocationIds] :
  /// The revocation IDs of the revocation files you want to remove.
  ///
  /// Parameter [trustStoreArn] :
  /// The Amazon Resource Name (ARN) of the trust store.
  Future<void> removeTrustStoreRevocations({
    required List<int> revocationIds,
    required String trustStoreArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['RevocationIds'] = revocationIds;
    $request['TrustStoreArn'] = trustStoreArn;
    await _protocol.send(
      $request,
      action: 'RemoveTrustStoreRevocations',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveTrustStoreRevocationsInput'],
      shapes: shapes,
      resultWrapper: 'RemoveTrustStoreRevocationsResult',
    );
  }

  /// Sets the type of IP addresses used by the subnets of the specified load
  /// balancer.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [InvalidSubnetException].
  ///
  /// Parameter [ipAddressType] :
  /// Note: Internal load balancers must use the <code>ipv4</code> IP address
  /// type.
  ///
  /// [Application Load Balancers] The IP address type. The possible values are
  /// <code>ipv4</code> (for only IPv4 addresses), <code>dualstack</code> (for
  /// IPv4 and IPv6 addresses), and <code>dualstack-without-public-ipv4</code>
  /// (for IPv6 only public addresses, with private IPv4 and IPv6 addresses).
  ///
  /// [Network Load Balancers] The IP address type. The possible values are
  /// <code>ipv4</code> (for only IPv4 addresses) and <code>dualstack</code>
  /// (for IPv4 and IPv6 addresses). You can’t specify <code>dualstack</code>
  /// for a load balancer with a UDP or TCP_UDP listener.
  ///
  /// [Gateway Load Balancers] The IP address type. The possible values are
  /// <code>ipv4</code> (for only IPv4 addresses) and <code>dualstack</code>
  /// (for IPv4 and IPv6 addresses).
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  Future<SetIpAddressTypeOutput> setIpAddressType({
    required IpAddressType ipAddressType,
    required String loadBalancerArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['IpAddressType'] = ipAddressType.toValue();
    $request['LoadBalancerArn'] = loadBalancerArn;
    final $result = await _protocol.send(
      $request,
      action: 'SetIpAddressType',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetIpAddressTypeInput'],
      shapes: shapes,
      resultWrapper: 'SetIpAddressTypeResult',
    );
    return SetIpAddressTypeOutput.fromXml($result);
  }

  /// Sets the priorities of the specified rules.
  ///
  /// You can reorder the rules as long as there are no priority conflicts in
  /// the new order. Any existing rules that you do not specify retain their
  /// current priority.
  ///
  /// May throw [RuleNotFoundException].
  /// May throw [PriorityInUseException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [rulePriorities] :
  /// The rule priorities.
  Future<SetRulePrioritiesOutput> setRulePriorities({
    required List<RulePriorityPair> rulePriorities,
  }) async {
    final $request = <String, dynamic>{};
    $request['RulePriorities'] = rulePriorities;
    final $result = await _protocol.send(
      $request,
      action: 'SetRulePriorities',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetRulePrioritiesInput'],
      shapes: shapes,
      resultWrapper: 'SetRulePrioritiesResult',
    );
    return SetRulePrioritiesOutput.fromXml($result);
  }

  /// Associates the specified security groups with the specified Application
  /// Load Balancer or Network Load Balancer. The specified security groups
  /// override the previously associated security groups.
  ///
  /// You can't perform this operation on a Network Load Balancer unless you
  /// specified a security group for the load balancer when you created it.
  ///
  /// You can't associate a security group with a Gateway Load Balancer.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [InvalidSecurityGroupException].
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// Parameter [securityGroups] :
  /// The IDs of the security groups.
  ///
  /// Parameter [enforceSecurityGroupInboundRulesOnPrivateLinkTraffic] :
  /// Indicates whether to evaluate inbound security group rules for traffic
  /// sent to a Network Load Balancer through Amazon Web Services PrivateLink.
  /// The default is <code>on</code>.
  Future<SetSecurityGroupsOutput> setSecurityGroups({
    required String loadBalancerArn,
    required List<String> securityGroups,
    EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum?
        enforceSecurityGroupInboundRulesOnPrivateLinkTraffic,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerArn'] = loadBalancerArn;
    $request['SecurityGroups'] = securityGroups;
    enforceSecurityGroupInboundRulesOnPrivateLinkTraffic?.also((arg) =>
        $request['EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic'] =
            arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'SetSecurityGroups',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetSecurityGroupsInput'],
      shapes: shapes,
      resultWrapper: 'SetSecurityGroupsResult',
    );
    return SetSecurityGroupsOutput.fromXml($result);
  }

  /// Enables the Availability Zones for the specified public subnets for the
  /// specified Application Load Balancer, Network Load Balancer or Gateway Load
  /// Balancer. The specified subnets replace the previously enabled subnets.
  ///
  /// When you specify subnets for a Network Load Balancer, or Gateway Load
  /// Balancer you must include all subnets that were enabled previously, with
  /// their existing configurations, plus any additional subnets.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [SubnetNotFoundException].
  /// May throw [InvalidSubnetException].
  /// May throw [AllocationIdNotFoundException].
  /// May throw [AvailabilityZoneNotSupportedException].
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// Parameter [ipAddressType] :
  /// [Application Load Balancers] The IP address type. The possible values are
  /// <code>ipv4</code> (for only IPv4 addresses), <code>dualstack</code> (for
  /// IPv4 and IPv6 addresses), and <code>dualstack-without-public-ipv4</code>
  /// (for IPv6 only public addresses, with private IPv4 and IPv6 addresses).
  ///
  /// [Network Load Balancers] The type of IP addresses used by the subnets for
  /// your load balancer. The possible values are <code>ipv4</code> (for IPv4
  /// addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses). You
  /// can’t specify <code>dualstack</code> for a load balancer with a UDP or
  /// TCP_UDP listener.
  ///
  /// [Gateway Load Balancers] The type of IP addresses used by the subnets for
  /// your load balancer. The possible values are <code>ipv4</code> (for IPv4
  /// addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses).
  ///
  /// Parameter [subnetMappings] :
  /// The IDs of the public subnets. You can specify only one subnet per
  /// Availability Zone. You must specify either subnets or subnet mappings.
  ///
  /// [Application Load Balancers] You must specify subnets from at least two
  /// Availability Zones. You cannot specify Elastic IP addresses for your
  /// subnets.
  ///
  /// [Application Load Balancers on Outposts] You must specify one Outpost
  /// subnet.
  ///
  /// [Application Load Balancers on Local Zones] You can specify subnets from
  /// one or more Local Zones.
  ///
  /// [Network Load Balancers] You can specify subnets from one or more
  /// Availability Zones. You can specify one Elastic IP address per subnet if
  /// you need static IP addresses for your internet-facing load balancer. For
  /// internal load balancers, you can specify one private IP address per subnet
  /// from the IPv4 range of the subnet. For internet-facing load balancer, you
  /// can specify one IPv6 address per subnet.
  ///
  /// [Gateway Load Balancers] You can specify subnets from one or more
  /// Availability Zones.
  ///
  /// Parameter [subnets] :
  /// The IDs of the public subnets. You can specify only one subnet per
  /// Availability Zone. You must specify either subnets or subnet mappings.
  ///
  /// [Application Load Balancers] You must specify subnets from at least two
  /// Availability Zones.
  ///
  /// [Application Load Balancers on Outposts] You must specify one Outpost
  /// subnet.
  ///
  /// [Application Load Balancers on Local Zones] You can specify subnets from
  /// one or more Local Zones.
  ///
  /// [Network Load Balancers] You can specify subnets from one or more
  /// Availability Zones.
  ///
  /// [Gateway Load Balancers] You can specify subnets from one or more
  /// Availability Zones.
  Future<SetSubnetsOutput> setSubnets({
    required String loadBalancerArn,
    IpAddressType? ipAddressType,
    List<SubnetMapping>? subnetMappings,
    List<String>? subnets,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerArn'] = loadBalancerArn;
    ipAddressType?.also((arg) => $request['IpAddressType'] = arg.toValue());
    subnetMappings?.also((arg) => $request['SubnetMappings'] = arg);
    subnets?.also((arg) => $request['Subnets'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'SetSubnets',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetSubnetsInput'],
      shapes: shapes,
      resultWrapper: 'SetSubnetsResult',
    );
    return SetSubnetsOutput.fromXml($result);
  }
}

/// Information about an action.
///
/// Each rule must include exactly one of the following types of actions:
/// <code>forward</code>, <code>fixed-response</code>, or <code>redirect</code>,
/// and it must be the last action to be performed.
class Action {
  /// The type of action.
  final ActionTypeEnum type;

  /// [HTTPS listeners] Information for using Amazon Cognito to authenticate
  /// users. Specify only when <code>Type</code> is
  /// <code>authenticate-cognito</code>.
  final AuthenticateCognitoActionConfig? authenticateCognitoConfig;

  /// [HTTPS listeners] Information about an identity provider that is compliant
  /// with OpenID Connect (OIDC). Specify only when <code>Type</code> is
  /// <code>authenticate-oidc</code>.
  final AuthenticateOidcActionConfig? authenticateOidcConfig;

  /// [Application Load Balancer] Information for creating an action that returns
  /// a custom HTTP response. Specify only when <code>Type</code> is
  /// <code>fixed-response</code>.
  final FixedResponseActionConfig? fixedResponseConfig;

  /// Information for creating an action that distributes requests among one or
  /// more target groups. For Network Load Balancers, you can specify a single
  /// target group. Specify only when <code>Type</code> is <code>forward</code>.
  /// If you specify both <code>ForwardConfig</code> and
  /// <code>TargetGroupArn</code>, you can specify only one target group using
  /// <code>ForwardConfig</code> and it must be the same target group specified in
  /// <code>TargetGroupArn</code>.
  final ForwardActionConfig? forwardConfig;

  /// The order for the action. This value is required for rules with multiple
  /// actions. The action with the lowest value for order is performed first.
  final int? order;

  /// [Application Load Balancer] Information for creating a redirect action.
  /// Specify only when <code>Type</code> is <code>redirect</code>.
  final RedirectActionConfig? redirectConfig;

  /// The Amazon Resource Name (ARN) of the target group. Specify only when
  /// <code>Type</code> is <code>forward</code> and you want to route to a single
  /// target group. To route to one or more target groups, use
  /// <code>ForwardConfig</code> instead.
  final String? targetGroupArn;

  Action({
    required this.type,
    this.authenticateCognitoConfig,
    this.authenticateOidcConfig,
    this.fixedResponseConfig,
    this.forwardConfig,
    this.order,
    this.redirectConfig,
    this.targetGroupArn,
  });
  factory Action.fromXml(_s.XmlElement elem) {
    return Action(
      type: _s.extractXmlStringValue(elem, 'Type')!.toActionTypeEnum(),
      authenticateCognitoConfig: _s
          .extractXmlChild(elem, 'AuthenticateCognitoConfig')
          ?.let(AuthenticateCognitoActionConfig.fromXml),
      authenticateOidcConfig: _s
          .extractXmlChild(elem, 'AuthenticateOidcConfig')
          ?.let(AuthenticateOidcActionConfig.fromXml),
      fixedResponseConfig: _s
          .extractXmlChild(elem, 'FixedResponseConfig')
          ?.let(FixedResponseActionConfig.fromXml),
      forwardConfig: _s
          .extractXmlChild(elem, 'ForwardConfig')
          ?.let(ForwardActionConfig.fromXml),
      order: _s.extractXmlIntValue(elem, 'Order'),
      redirectConfig: _s
          .extractXmlChild(elem, 'RedirectConfig')
          ?.let(RedirectActionConfig.fromXml),
      targetGroupArn: _s.extractXmlStringValue(elem, 'TargetGroupArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final authenticateCognitoConfig = this.authenticateCognitoConfig;
    final authenticateOidcConfig = this.authenticateOidcConfig;
    final fixedResponseConfig = this.fixedResponseConfig;
    final forwardConfig = this.forwardConfig;
    final order = this.order;
    final redirectConfig = this.redirectConfig;
    final targetGroupArn = this.targetGroupArn;
    return {
      'Type': type.toValue(),
      if (authenticateCognitoConfig != null)
        'AuthenticateCognitoConfig': authenticateCognitoConfig,
      if (authenticateOidcConfig != null)
        'AuthenticateOidcConfig': authenticateOidcConfig,
      if (fixedResponseConfig != null)
        'FixedResponseConfig': fixedResponseConfig,
      if (forwardConfig != null) 'ForwardConfig': forwardConfig,
      if (order != null) 'Order': order,
      if (redirectConfig != null) 'RedirectConfig': redirectConfig,
      if (targetGroupArn != null) 'TargetGroupArn': targetGroupArn,
    };
  }
}

enum ActionTypeEnum {
  forward,
  authenticateOidc,
  authenticateCognito,
  redirect,
  fixedResponse,
}

extension ActionTypeEnumValueExtension on ActionTypeEnum {
  String toValue() {
    switch (this) {
      case ActionTypeEnum.forward:
        return 'forward';
      case ActionTypeEnum.authenticateOidc:
        return 'authenticate-oidc';
      case ActionTypeEnum.authenticateCognito:
        return 'authenticate-cognito';
      case ActionTypeEnum.redirect:
        return 'redirect';
      case ActionTypeEnum.fixedResponse:
        return 'fixed-response';
    }
  }
}

extension ActionTypeEnumFromString on String {
  ActionTypeEnum toActionTypeEnum() {
    switch (this) {
      case 'forward':
        return ActionTypeEnum.forward;
      case 'authenticate-oidc':
        return ActionTypeEnum.authenticateOidc;
      case 'authenticate-cognito':
        return ActionTypeEnum.authenticateCognito;
      case 'redirect':
        return ActionTypeEnum.redirect;
      case 'fixed-response':
        return ActionTypeEnum.fixedResponse;
    }
    throw Exception('$this is not known in enum ActionTypeEnum');
  }
}

class AddListenerCertificatesOutput {
  /// Information about the certificates in the certificate list.
  final List<Certificate>? certificates;

  AddListenerCertificatesOutput({
    this.certificates,
  });
  factory AddListenerCertificatesOutput.fromXml(_s.XmlElement elem) {
    return AddListenerCertificatesOutput(
      certificates: _s.extractXmlChild(elem, 'Certificates')?.let((elem) =>
          elem.findElements('member').map(Certificate.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final certificates = this.certificates;
    return {
      if (certificates != null) 'Certificates': certificates,
    };
  }
}

class AddTagsOutput {
  AddTagsOutput();
  factory AddTagsOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return AddTagsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AddTrustStoreRevocationsOutput {
  /// Information about the revocation file added to the trust store.
  final List<TrustStoreRevocation>? trustStoreRevocations;

  AddTrustStoreRevocationsOutput({
    this.trustStoreRevocations,
  });
  factory AddTrustStoreRevocationsOutput.fromXml(_s.XmlElement elem) {
    return AddTrustStoreRevocationsOutput(
      trustStoreRevocations: _s
          .extractXmlChild(elem, 'TrustStoreRevocations')
          ?.let((elem) => elem
              .findElements('member')
              .map(TrustStoreRevocation.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final trustStoreRevocations = this.trustStoreRevocations;
    return {
      if (trustStoreRevocations != null)
        'TrustStoreRevocations': trustStoreRevocations,
    };
  }
}

/// Information about anomaly detection and mitigation.
class AnomalyDetection {
  /// Indicates whether anomaly mitigation is in progress.
  final MitigationInEffectEnum? mitigationInEffect;

  /// The latest anomaly detection result.
  final AnomalyResultEnum? result;

  AnomalyDetection({
    this.mitigationInEffect,
    this.result,
  });
  factory AnomalyDetection.fromXml(_s.XmlElement elem) {
    return AnomalyDetection(
      mitigationInEffect: _s
          .extractXmlStringValue(elem, 'MitigationInEffect')
          ?.toMitigationInEffectEnum(),
      result: _s.extractXmlStringValue(elem, 'Result')?.toAnomalyResultEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final mitigationInEffect = this.mitigationInEffect;
    final result = this.result;
    return {
      if (mitigationInEffect != null)
        'MitigationInEffect': mitigationInEffect.toValue(),
      if (result != null) 'Result': result.toValue(),
    };
  }
}

enum AnomalyResultEnum {
  anomalous,
  normal,
}

extension AnomalyResultEnumValueExtension on AnomalyResultEnum {
  String toValue() {
    switch (this) {
      case AnomalyResultEnum.anomalous:
        return 'anomalous';
      case AnomalyResultEnum.normal:
        return 'normal';
    }
  }
}

extension AnomalyResultEnumFromString on String {
  AnomalyResultEnum toAnomalyResultEnum() {
    switch (this) {
      case 'anomalous':
        return AnomalyResultEnum.anomalous;
      case 'normal':
        return AnomalyResultEnum.normal;
    }
    throw Exception('$this is not known in enum AnomalyResultEnum');
  }
}

enum AuthenticateCognitoActionConditionalBehaviorEnum {
  deny,
  allow,
  authenticate,
}

extension AuthenticateCognitoActionConditionalBehaviorEnumValueExtension
    on AuthenticateCognitoActionConditionalBehaviorEnum {
  String toValue() {
    switch (this) {
      case AuthenticateCognitoActionConditionalBehaviorEnum.deny:
        return 'deny';
      case AuthenticateCognitoActionConditionalBehaviorEnum.allow:
        return 'allow';
      case AuthenticateCognitoActionConditionalBehaviorEnum.authenticate:
        return 'authenticate';
    }
  }
}

extension AuthenticateCognitoActionConditionalBehaviorEnumFromString on String {
  AuthenticateCognitoActionConditionalBehaviorEnum
      toAuthenticateCognitoActionConditionalBehaviorEnum() {
    switch (this) {
      case 'deny':
        return AuthenticateCognitoActionConditionalBehaviorEnum.deny;
      case 'allow':
        return AuthenticateCognitoActionConditionalBehaviorEnum.allow;
      case 'authenticate':
        return AuthenticateCognitoActionConditionalBehaviorEnum.authenticate;
    }
    throw Exception(
        '$this is not known in enum AuthenticateCognitoActionConditionalBehaviorEnum');
  }
}

/// Request parameters to use when integrating with Amazon Cognito to
/// authenticate users.
class AuthenticateCognitoActionConfig {
  /// The Amazon Resource Name (ARN) of the Amazon Cognito user pool.
  final String userPoolArn;

  /// The ID of the Amazon Cognito user pool client.
  final String userPoolClientId;

  /// The domain prefix or fully-qualified domain name of the Amazon Cognito user
  /// pool.
  final String userPoolDomain;

  /// The query parameters (up to 10) to include in the redirect request to the
  /// authorization endpoint.
  final Map<String, String>? authenticationRequestExtraParams;

  /// The behavior if the user is not authenticated. The following are possible
  /// values:
  ///
  /// <ul>
  /// <li>
  /// deny<code/> - Return an HTTP 401 Unauthorized error.
  /// </li>
  /// <li>
  /// allow<code/> - Allow the request to be forwarded to the target.
  /// </li>
  /// <li>
  /// authenticate<code/> - Redirect the request to the IdP authorization
  /// endpoint. This is the default value.
  /// </li>
  /// </ul>
  final AuthenticateCognitoActionConditionalBehaviorEnum?
      onUnauthenticatedRequest;

  /// The set of user claims to be requested from the IdP. The default is
  /// <code>openid</code>.
  ///
  /// To verify which scope values your IdP supports and how to separate multiple
  /// values, see the documentation for your IdP.
  final String? scope;

  /// The name of the cookie used to maintain session information. The default is
  /// AWSELBAuthSessionCookie.
  final String? sessionCookieName;

  /// The maximum duration of the authentication session, in seconds. The default
  /// is 604800 seconds (7 days).
  final int? sessionTimeout;

  AuthenticateCognitoActionConfig({
    required this.userPoolArn,
    required this.userPoolClientId,
    required this.userPoolDomain,
    this.authenticationRequestExtraParams,
    this.onUnauthenticatedRequest,
    this.scope,
    this.sessionCookieName,
    this.sessionTimeout,
  });
  factory AuthenticateCognitoActionConfig.fromXml(_s.XmlElement elem) {
    return AuthenticateCognitoActionConfig(
      userPoolArn: _s.extractXmlStringValue(elem, 'UserPoolArn')!,
      userPoolClientId: _s.extractXmlStringValue(elem, 'UserPoolClientId')!,
      userPoolDomain: _s.extractXmlStringValue(elem, 'UserPoolDomain')!,
      authenticationRequestExtraParams: Map.fromEntries(
        elem
                .getElement('AuthenticationRequestExtraParams')
                ?.findElements('entry')
                .map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
      onUnauthenticatedRequest: _s
          .extractXmlStringValue(elem, 'OnUnauthenticatedRequest')
          ?.toAuthenticateCognitoActionConditionalBehaviorEnum(),
      scope: _s.extractXmlStringValue(elem, 'Scope'),
      sessionCookieName: _s.extractXmlStringValue(elem, 'SessionCookieName'),
      sessionTimeout: _s.extractXmlIntValue(elem, 'SessionTimeout'),
    );
  }

  Map<String, dynamic> toJson() {
    final userPoolArn = this.userPoolArn;
    final userPoolClientId = this.userPoolClientId;
    final userPoolDomain = this.userPoolDomain;
    final authenticationRequestExtraParams =
        this.authenticationRequestExtraParams;
    final onUnauthenticatedRequest = this.onUnauthenticatedRequest;
    final scope = this.scope;
    final sessionCookieName = this.sessionCookieName;
    final sessionTimeout = this.sessionTimeout;
    return {
      'UserPoolArn': userPoolArn,
      'UserPoolClientId': userPoolClientId,
      'UserPoolDomain': userPoolDomain,
      if (authenticationRequestExtraParams != null)
        'AuthenticationRequestExtraParams': authenticationRequestExtraParams,
      if (onUnauthenticatedRequest != null)
        'OnUnauthenticatedRequest': onUnauthenticatedRequest.toValue(),
      if (scope != null) 'Scope': scope,
      if (sessionCookieName != null) 'SessionCookieName': sessionCookieName,
      if (sessionTimeout != null) 'SessionTimeout': sessionTimeout,
    };
  }
}

enum AuthenticateOidcActionConditionalBehaviorEnum {
  deny,
  allow,
  authenticate,
}

extension AuthenticateOidcActionConditionalBehaviorEnumValueExtension
    on AuthenticateOidcActionConditionalBehaviorEnum {
  String toValue() {
    switch (this) {
      case AuthenticateOidcActionConditionalBehaviorEnum.deny:
        return 'deny';
      case AuthenticateOidcActionConditionalBehaviorEnum.allow:
        return 'allow';
      case AuthenticateOidcActionConditionalBehaviorEnum.authenticate:
        return 'authenticate';
    }
  }
}

extension AuthenticateOidcActionConditionalBehaviorEnumFromString on String {
  AuthenticateOidcActionConditionalBehaviorEnum
      toAuthenticateOidcActionConditionalBehaviorEnum() {
    switch (this) {
      case 'deny':
        return AuthenticateOidcActionConditionalBehaviorEnum.deny;
      case 'allow':
        return AuthenticateOidcActionConditionalBehaviorEnum.allow;
      case 'authenticate':
        return AuthenticateOidcActionConditionalBehaviorEnum.authenticate;
    }
    throw Exception(
        '$this is not known in enum AuthenticateOidcActionConditionalBehaviorEnum');
  }
}

/// Request parameters when using an identity provider (IdP) that is compliant
/// with OpenID Connect (OIDC) to authenticate users.
class AuthenticateOidcActionConfig {
  /// The authorization endpoint of the IdP. This must be a full URL, including
  /// the HTTPS protocol, the domain, and the path.
  final String authorizationEndpoint;

  /// The OAuth 2.0 client identifier.
  final String clientId;

  /// The OIDC issuer identifier of the IdP. This must be a full URL, including
  /// the HTTPS protocol, the domain, and the path.
  final String issuer;

  /// The token endpoint of the IdP. This must be a full URL, including the HTTPS
  /// protocol, the domain, and the path.
  final String tokenEndpoint;

  /// The user info endpoint of the IdP. This must be a full URL, including the
  /// HTTPS protocol, the domain, and the path.
  final String userInfoEndpoint;

  /// The query parameters (up to 10) to include in the redirect request to the
  /// authorization endpoint.
  final Map<String, String>? authenticationRequestExtraParams;

  /// The OAuth 2.0 client secret. This parameter is required if you are creating
  /// a rule. If you are modifying a rule, you can omit this parameter if you set
  /// <code>UseExistingClientSecret</code> to true.
  final String? clientSecret;

  /// The behavior if the user is not authenticated. The following are possible
  /// values:
  ///
  /// <ul>
  /// <li>
  /// deny<code/> - Return an HTTP 401 Unauthorized error.
  /// </li>
  /// <li>
  /// allow<code/> - Allow the request to be forwarded to the target.
  /// </li>
  /// <li>
  /// authenticate<code/> - Redirect the request to the IdP authorization
  /// endpoint. This is the default value.
  /// </li>
  /// </ul>
  final AuthenticateOidcActionConditionalBehaviorEnum? onUnauthenticatedRequest;

  /// The set of user claims to be requested from the IdP. The default is
  /// <code>openid</code>.
  ///
  /// To verify which scope values your IdP supports and how to separate multiple
  /// values, see the documentation for your IdP.
  final String? scope;

  /// The name of the cookie used to maintain session information. The default is
  /// AWSELBAuthSessionCookie.
  final String? sessionCookieName;

  /// The maximum duration of the authentication session, in seconds. The default
  /// is 604800 seconds (7 days).
  final int? sessionTimeout;

  /// Indicates whether to use the existing client secret when modifying a rule.
  /// If you are creating a rule, you can omit this parameter or set it to false.
  final bool? useExistingClientSecret;

  AuthenticateOidcActionConfig({
    required this.authorizationEndpoint,
    required this.clientId,
    required this.issuer,
    required this.tokenEndpoint,
    required this.userInfoEndpoint,
    this.authenticationRequestExtraParams,
    this.clientSecret,
    this.onUnauthenticatedRequest,
    this.scope,
    this.sessionCookieName,
    this.sessionTimeout,
    this.useExistingClientSecret,
  });
  factory AuthenticateOidcActionConfig.fromXml(_s.XmlElement elem) {
    return AuthenticateOidcActionConfig(
      authorizationEndpoint:
          _s.extractXmlStringValue(elem, 'AuthorizationEndpoint')!,
      clientId: _s.extractXmlStringValue(elem, 'ClientId')!,
      issuer: _s.extractXmlStringValue(elem, 'Issuer')!,
      tokenEndpoint: _s.extractXmlStringValue(elem, 'TokenEndpoint')!,
      userInfoEndpoint: _s.extractXmlStringValue(elem, 'UserInfoEndpoint')!,
      authenticationRequestExtraParams: Map.fromEntries(
        elem
                .getElement('AuthenticationRequestExtraParams')
                ?.findElements('entry')
                .map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
      clientSecret: _s.extractXmlStringValue(elem, 'ClientSecret'),
      onUnauthenticatedRequest: _s
          .extractXmlStringValue(elem, 'OnUnauthenticatedRequest')
          ?.toAuthenticateOidcActionConditionalBehaviorEnum(),
      scope: _s.extractXmlStringValue(elem, 'Scope'),
      sessionCookieName: _s.extractXmlStringValue(elem, 'SessionCookieName'),
      sessionTimeout: _s.extractXmlIntValue(elem, 'SessionTimeout'),
      useExistingClientSecret:
          _s.extractXmlBoolValue(elem, 'UseExistingClientSecret'),
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationEndpoint = this.authorizationEndpoint;
    final clientId = this.clientId;
    final issuer = this.issuer;
    final tokenEndpoint = this.tokenEndpoint;
    final userInfoEndpoint = this.userInfoEndpoint;
    final authenticationRequestExtraParams =
        this.authenticationRequestExtraParams;
    final clientSecret = this.clientSecret;
    final onUnauthenticatedRequest = this.onUnauthenticatedRequest;
    final scope = this.scope;
    final sessionCookieName = this.sessionCookieName;
    final sessionTimeout = this.sessionTimeout;
    final useExistingClientSecret = this.useExistingClientSecret;
    return {
      'AuthorizationEndpoint': authorizationEndpoint,
      'ClientId': clientId,
      'Issuer': issuer,
      'TokenEndpoint': tokenEndpoint,
      'UserInfoEndpoint': userInfoEndpoint,
      if (authenticationRequestExtraParams != null)
        'AuthenticationRequestExtraParams': authenticationRequestExtraParams,
      if (clientSecret != null) 'ClientSecret': clientSecret,
      if (onUnauthenticatedRequest != null)
        'OnUnauthenticatedRequest': onUnauthenticatedRequest.toValue(),
      if (scope != null) 'Scope': scope,
      if (sessionCookieName != null) 'SessionCookieName': sessionCookieName,
      if (sessionTimeout != null) 'SessionTimeout': sessionTimeout,
      if (useExistingClientSecret != null)
        'UseExistingClientSecret': useExistingClientSecret,
    };
  }
}

/// Information about an Availability Zone.
class AvailabilityZone {
  /// [Network Load Balancers] If you need static IP addresses for your load
  /// balancer, you can specify one Elastic IP address per Availability Zone when
  /// you create an internal-facing load balancer. For internal load balancers,
  /// you can specify a private IP address from the IPv4 range of the subnet.
  final List<LoadBalancerAddress>? loadBalancerAddresses;

  /// [Application Load Balancers on Outposts] The ID of the Outpost.
  final String? outpostId;

  /// The ID of the subnet. You can specify one subnet per Availability Zone.
  final String? subnetId;

  /// The name of the Availability Zone.
  final String? zoneName;

  AvailabilityZone({
    this.loadBalancerAddresses,
    this.outpostId,
    this.subnetId,
    this.zoneName,
  });
  factory AvailabilityZone.fromXml(_s.XmlElement elem) {
    return AvailabilityZone(
      loadBalancerAddresses: _s
          .extractXmlChild(elem, 'LoadBalancerAddresses')
          ?.let((elem) => elem
              .findElements('member')
              .map(LoadBalancerAddress.fromXml)
              .toList()),
      outpostId: _s.extractXmlStringValue(elem, 'OutpostId'),
      subnetId: _s.extractXmlStringValue(elem, 'SubnetId'),
      zoneName: _s.extractXmlStringValue(elem, 'ZoneName'),
    );
  }

  Map<String, dynamic> toJson() {
    final loadBalancerAddresses = this.loadBalancerAddresses;
    final outpostId = this.outpostId;
    final subnetId = this.subnetId;
    final zoneName = this.zoneName;
    return {
      if (loadBalancerAddresses != null)
        'LoadBalancerAddresses': loadBalancerAddresses,
      if (outpostId != null) 'OutpostId': outpostId,
      if (subnetId != null) 'SubnetId': subnetId,
      if (zoneName != null) 'ZoneName': zoneName,
    };
  }
}

/// Information about an SSL server certificate.
class Certificate {
  /// The Amazon Resource Name (ARN) of the certificate.
  final String? certificateArn;

  /// Indicates whether the certificate is the default certificate. Do not set
  /// this value when specifying a certificate as an input. This value is not
  /// included in the output when describing a listener, but is included when
  /// describing listener certificates.
  final bool? isDefault;

  Certificate({
    this.certificateArn,
    this.isDefault,
  });
  factory Certificate.fromXml(_s.XmlElement elem) {
    return Certificate(
      certificateArn: _s.extractXmlStringValue(elem, 'CertificateArn'),
      isDefault: _s.extractXmlBoolValue(elem, 'IsDefault'),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final isDefault = this.isDefault;
    return {
      if (certificateArn != null) 'CertificateArn': certificateArn,
      if (isDefault != null) 'IsDefault': isDefault,
    };
  }
}

/// Information about a cipher used in a policy.
class Cipher {
  /// The name of the cipher.
  final String? name;

  /// The priority of the cipher.
  final int? priority;

  Cipher({
    this.name,
    this.priority,
  });
  factory Cipher.fromXml(_s.XmlElement elem) {
    return Cipher(
      name: _s.extractXmlStringValue(elem, 'Name'),
      priority: _s.extractXmlIntValue(elem, 'Priority'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final priority = this.priority;
    return {
      if (name != null) 'Name': name,
      if (priority != null) 'Priority': priority,
    };
  }
}

class CreateListenerOutput {
  /// Information about the listener.
  final List<Listener>? listeners;

  CreateListenerOutput({
    this.listeners,
  });
  factory CreateListenerOutput.fromXml(_s.XmlElement elem) {
    return CreateListenerOutput(
      listeners: _s.extractXmlChild(elem, 'Listeners')?.let(
          (elem) => elem.findElements('member').map(Listener.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final listeners = this.listeners;
    return {
      if (listeners != null) 'Listeners': listeners,
    };
  }
}

class CreateLoadBalancerOutput {
  /// Information about the load balancer.
  final List<LoadBalancer>? loadBalancers;

  CreateLoadBalancerOutput({
    this.loadBalancers,
  });
  factory CreateLoadBalancerOutput.fromXml(_s.XmlElement elem) {
    return CreateLoadBalancerOutput(
      loadBalancers: _s.extractXmlChild(elem, 'LoadBalancers')?.let((elem) =>
          elem.findElements('member').map(LoadBalancer.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final loadBalancers = this.loadBalancers;
    return {
      if (loadBalancers != null) 'LoadBalancers': loadBalancers,
    };
  }
}

class CreateRuleOutput {
  /// Information about the rule.
  final List<Rule>? rules;

  CreateRuleOutput({
    this.rules,
  });
  factory CreateRuleOutput.fromXml(_s.XmlElement elem) {
    return CreateRuleOutput(
      rules: _s.extractXmlChild(elem, 'Rules')?.let(
          (elem) => elem.findElements('member').map(Rule.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    return {
      if (rules != null) 'Rules': rules,
    };
  }
}

class CreateTargetGroupOutput {
  /// Information about the target group.
  final List<TargetGroup>? targetGroups;

  CreateTargetGroupOutput({
    this.targetGroups,
  });
  factory CreateTargetGroupOutput.fromXml(_s.XmlElement elem) {
    return CreateTargetGroupOutput(
      targetGroups: _s.extractXmlChild(elem, 'TargetGroups')?.let((elem) =>
          elem.findElements('member').map(TargetGroup.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final targetGroups = this.targetGroups;
    return {
      if (targetGroups != null) 'TargetGroups': targetGroups,
    };
  }
}

class CreateTrustStoreOutput {
  /// Information about the trust store created.
  final List<TrustStore>? trustStores;

  CreateTrustStoreOutput({
    this.trustStores,
  });
  factory CreateTrustStoreOutput.fromXml(_s.XmlElement elem) {
    return CreateTrustStoreOutput(
      trustStores: _s.extractXmlChild(elem, 'TrustStores')?.let((elem) =>
          elem.findElements('member').map(TrustStore.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final trustStores = this.trustStores;
    return {
      if (trustStores != null) 'TrustStores': trustStores,
    };
  }
}

class DeleteListenerOutput {
  DeleteListenerOutput();
  factory DeleteListenerOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteListenerOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLoadBalancerOutput {
  DeleteLoadBalancerOutput();
  factory DeleteLoadBalancerOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteLoadBalancerOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRuleOutput {
  DeleteRuleOutput();
  factory DeleteRuleOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteRuleOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTargetGroupOutput {
  DeleteTargetGroupOutput();
  factory DeleteTargetGroupOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteTargetGroupOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTrustStoreOutput {
  DeleteTrustStoreOutput();
  factory DeleteTrustStoreOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteTrustStoreOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeregisterTargetsOutput {
  DeregisterTargetsOutput();
  factory DeregisterTargetsOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeregisterTargetsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAccountLimitsOutput {
  /// Information about the limits.
  final List<Limit>? limits;

  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String? nextMarker;

  DescribeAccountLimitsOutput({
    this.limits,
    this.nextMarker,
  });
  factory DescribeAccountLimitsOutput.fromXml(_s.XmlElement elem) {
    return DescribeAccountLimitsOutput(
      limits: _s.extractXmlChild(elem, 'Limits')?.let(
          (elem) => elem.findElements('member').map(Limit.fromXml).toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }

  Map<String, dynamic> toJson() {
    final limits = this.limits;
    final nextMarker = this.nextMarker;
    return {
      if (limits != null) 'Limits': limits,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class DescribeListenerCertificatesOutput {
  /// Information about the certificates.
  final List<Certificate>? certificates;

  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String? nextMarker;

  DescribeListenerCertificatesOutput({
    this.certificates,
    this.nextMarker,
  });
  factory DescribeListenerCertificatesOutput.fromXml(_s.XmlElement elem) {
    return DescribeListenerCertificatesOutput(
      certificates: _s.extractXmlChild(elem, 'Certificates')?.let((elem) =>
          elem.findElements('member').map(Certificate.fromXml).toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }

  Map<String, dynamic> toJson() {
    final certificates = this.certificates;
    final nextMarker = this.nextMarker;
    return {
      if (certificates != null) 'Certificates': certificates,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class DescribeListenersOutput {
  /// Information about the listeners.
  final List<Listener>? listeners;

  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String? nextMarker;

  DescribeListenersOutput({
    this.listeners,
    this.nextMarker,
  });
  factory DescribeListenersOutput.fromXml(_s.XmlElement elem) {
    return DescribeListenersOutput(
      listeners: _s.extractXmlChild(elem, 'Listeners')?.let(
          (elem) => elem.findElements('member').map(Listener.fromXml).toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }

  Map<String, dynamic> toJson() {
    final listeners = this.listeners;
    final nextMarker = this.nextMarker;
    return {
      if (listeners != null) 'Listeners': listeners,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class DescribeLoadBalancerAttributesOutput {
  /// Information about the load balancer attributes.
  final List<LoadBalancerAttribute>? attributes;

  DescribeLoadBalancerAttributesOutput({
    this.attributes,
  });
  factory DescribeLoadBalancerAttributesOutput.fromXml(_s.XmlElement elem) {
    return DescribeLoadBalancerAttributesOutput(
      attributes: _s.extractXmlChild(elem, 'Attributes')?.let((elem) => elem
          .findElements('member')
          .map(LoadBalancerAttribute.fromXml)
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

class DescribeLoadBalancersOutput {
  /// Information about the load balancers.
  final List<LoadBalancer>? loadBalancers;

  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String? nextMarker;

  DescribeLoadBalancersOutput({
    this.loadBalancers,
    this.nextMarker,
  });
  factory DescribeLoadBalancersOutput.fromXml(_s.XmlElement elem) {
    return DescribeLoadBalancersOutput(
      loadBalancers: _s.extractXmlChild(elem, 'LoadBalancers')?.let((elem) =>
          elem.findElements('member').map(LoadBalancer.fromXml).toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }

  Map<String, dynamic> toJson() {
    final loadBalancers = this.loadBalancers;
    final nextMarker = this.nextMarker;
    return {
      if (loadBalancers != null) 'LoadBalancers': loadBalancers,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class DescribeRulesOutput {
  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String? nextMarker;

  /// Information about the rules.
  final List<Rule>? rules;

  DescribeRulesOutput({
    this.nextMarker,
    this.rules,
  });
  factory DescribeRulesOutput.fromXml(_s.XmlElement elem) {
    return DescribeRulesOutput(
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
      rules: _s.extractXmlChild(elem, 'Rules')?.let(
          (elem) => elem.findElements('member').map(Rule.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final rules = this.rules;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (rules != null) 'Rules': rules,
    };
  }
}

class DescribeSSLPoliciesOutput {
  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String? nextMarker;

  /// Information about the security policies.
  final List<SslPolicy>? sslPolicies;

  DescribeSSLPoliciesOutput({
    this.nextMarker,
    this.sslPolicies,
  });
  factory DescribeSSLPoliciesOutput.fromXml(_s.XmlElement elem) {
    return DescribeSSLPoliciesOutput(
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
      sslPolicies: _s.extractXmlChild(elem, 'SslPolicies')?.let((elem) =>
          elem.findElements('member').map(SslPolicy.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final sslPolicies = this.sslPolicies;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (sslPolicies != null) 'SslPolicies': sslPolicies,
    };
  }
}

class DescribeTagsOutput {
  /// Information about the tags.
  final List<TagDescription>? tagDescriptions;

  DescribeTagsOutput({
    this.tagDescriptions,
  });
  factory DescribeTagsOutput.fromXml(_s.XmlElement elem) {
    return DescribeTagsOutput(
      tagDescriptions: _s.extractXmlChild(elem, 'TagDescriptions')?.let(
          (elem) =>
              elem.findElements('member').map(TagDescription.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final tagDescriptions = this.tagDescriptions;
    return {
      if (tagDescriptions != null) 'TagDescriptions': tagDescriptions,
    };
  }
}

class DescribeTargetGroupAttributesOutput {
  /// Information about the target group attributes
  final List<TargetGroupAttribute>? attributes;

  DescribeTargetGroupAttributesOutput({
    this.attributes,
  });
  factory DescribeTargetGroupAttributesOutput.fromXml(_s.XmlElement elem) {
    return DescribeTargetGroupAttributesOutput(
      attributes: _s.extractXmlChild(elem, 'Attributes')?.let((elem) => elem
          .findElements('member')
          .map(TargetGroupAttribute.fromXml)
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

class DescribeTargetGroupsOutput {
  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String? nextMarker;

  /// Information about the target groups.
  final List<TargetGroup>? targetGroups;

  DescribeTargetGroupsOutput({
    this.nextMarker,
    this.targetGroups,
  });
  factory DescribeTargetGroupsOutput.fromXml(_s.XmlElement elem) {
    return DescribeTargetGroupsOutput(
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
      targetGroups: _s.extractXmlChild(elem, 'TargetGroups')?.let((elem) =>
          elem.findElements('member').map(TargetGroup.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final targetGroups = this.targetGroups;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (targetGroups != null) 'TargetGroups': targetGroups,
    };
  }
}

enum DescribeTargetHealthInputIncludeEnum {
  anomalyDetection,
  all,
}

extension DescribeTargetHealthInputIncludeEnumValueExtension
    on DescribeTargetHealthInputIncludeEnum {
  String toValue() {
    switch (this) {
      case DescribeTargetHealthInputIncludeEnum.anomalyDetection:
        return 'AnomalyDetection';
      case DescribeTargetHealthInputIncludeEnum.all:
        return 'All';
    }
  }
}

extension DescribeTargetHealthInputIncludeEnumFromString on String {
  DescribeTargetHealthInputIncludeEnum
      toDescribeTargetHealthInputIncludeEnum() {
    switch (this) {
      case 'AnomalyDetection':
        return DescribeTargetHealthInputIncludeEnum.anomalyDetection;
      case 'All':
        return DescribeTargetHealthInputIncludeEnum.all;
    }
    throw Exception(
        '$this is not known in enum DescribeTargetHealthInputIncludeEnum');
  }
}

class DescribeTargetHealthOutput {
  /// Information about the health of the targets.
  final List<TargetHealthDescription>? targetHealthDescriptions;

  DescribeTargetHealthOutput({
    this.targetHealthDescriptions,
  });
  factory DescribeTargetHealthOutput.fromXml(_s.XmlElement elem) {
    return DescribeTargetHealthOutput(
      targetHealthDescriptions: _s
          .extractXmlChild(elem, 'TargetHealthDescriptions')
          ?.let((elem) => elem
              .findElements('member')
              .map(TargetHealthDescription.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final targetHealthDescriptions = this.targetHealthDescriptions;
    return {
      if (targetHealthDescriptions != null)
        'TargetHealthDescriptions': targetHealthDescriptions,
    };
  }
}

class DescribeTrustStoreAssociationsOutput {
  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String? nextMarker;

  /// Information about the resources the trust store is associated to.
  final List<TrustStoreAssociation>? trustStoreAssociations;

  DescribeTrustStoreAssociationsOutput({
    this.nextMarker,
    this.trustStoreAssociations,
  });
  factory DescribeTrustStoreAssociationsOutput.fromXml(_s.XmlElement elem) {
    return DescribeTrustStoreAssociationsOutput(
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
      trustStoreAssociations: _s
          .extractXmlChild(elem, 'TrustStoreAssociations')
          ?.let((elem) => elem
              .findElements('member')
              .map(TrustStoreAssociation.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final trustStoreAssociations = this.trustStoreAssociations;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (trustStoreAssociations != null)
        'TrustStoreAssociations': trustStoreAssociations,
    };
  }
}

/// Information about the revocations used by a trust store.
class DescribeTrustStoreRevocation {
  /// The number of revoked certificates.
  final int? numberOfRevokedEntries;

  /// The revocation ID of a revocation file in use.
  final int? revocationId;

  /// The type of revocation file.
  final RevocationType? revocationType;

  /// The Amazon Resource Name (ARN) of the trust store.
  final String? trustStoreArn;

  DescribeTrustStoreRevocation({
    this.numberOfRevokedEntries,
    this.revocationId,
    this.revocationType,
    this.trustStoreArn,
  });
  factory DescribeTrustStoreRevocation.fromXml(_s.XmlElement elem) {
    return DescribeTrustStoreRevocation(
      numberOfRevokedEntries:
          _s.extractXmlIntValue(elem, 'NumberOfRevokedEntries'),
      revocationId: _s.extractXmlIntValue(elem, 'RevocationId'),
      revocationType:
          _s.extractXmlStringValue(elem, 'RevocationType')?.toRevocationType(),
      trustStoreArn: _s.extractXmlStringValue(elem, 'TrustStoreArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfRevokedEntries = this.numberOfRevokedEntries;
    final revocationId = this.revocationId;
    final revocationType = this.revocationType;
    final trustStoreArn = this.trustStoreArn;
    return {
      if (numberOfRevokedEntries != null)
        'NumberOfRevokedEntries': numberOfRevokedEntries,
      if (revocationId != null) 'RevocationId': revocationId,
      if (revocationType != null) 'RevocationType': revocationType.toValue(),
      if (trustStoreArn != null) 'TrustStoreArn': trustStoreArn,
    };
  }
}

class DescribeTrustStoreRevocationsOutput {
  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String? nextMarker;

  /// Information about the revocation file in the trust store.
  final List<DescribeTrustStoreRevocation>? trustStoreRevocations;

  DescribeTrustStoreRevocationsOutput({
    this.nextMarker,
    this.trustStoreRevocations,
  });
  factory DescribeTrustStoreRevocationsOutput.fromXml(_s.XmlElement elem) {
    return DescribeTrustStoreRevocationsOutput(
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
      trustStoreRevocations: _s
          .extractXmlChild(elem, 'TrustStoreRevocations')
          ?.let((elem) => elem
              .findElements('member')
              .map(DescribeTrustStoreRevocation.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final trustStoreRevocations = this.trustStoreRevocations;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (trustStoreRevocations != null)
        'TrustStoreRevocations': trustStoreRevocations,
    };
  }
}

class DescribeTrustStoresOutput {
  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String? nextMarker;

  /// Information about the trust stores.
  final List<TrustStore>? trustStores;

  DescribeTrustStoresOutput({
    this.nextMarker,
    this.trustStores,
  });
  factory DescribeTrustStoresOutput.fromXml(_s.XmlElement elem) {
    return DescribeTrustStoresOutput(
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
      trustStores: _s.extractXmlChild(elem, 'TrustStores')?.let((elem) =>
          elem.findElements('member').map(TrustStore.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final trustStores = this.trustStores;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (trustStores != null) 'TrustStores': trustStores,
    };
  }
}

enum EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum {
  on,
  off,
}

extension EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnumValueExtension
    on EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum {
  String toValue() {
    switch (this) {
      case EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum.on:
        return 'on';
      case EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum.off:
        return 'off';
    }
  }
}

extension EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnumFromString
    on String {
  EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum
      toEnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum() {
    switch (this) {
      case 'on':
        return EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum.on;
      case 'off':
        return EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum.off;
    }
    throw Exception(
        '$this is not known in enum EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum');
  }
}

/// Information about an action that returns a custom HTTP response.
class FixedResponseActionConfig {
  /// The HTTP response code (2XX, 4XX, or 5XX).
  final String statusCode;

  /// The content type.
  ///
  /// Valid Values: text/plain | text/css | text/html | application/javascript |
  /// application/json
  final String? contentType;

  /// The message.
  final String? messageBody;

  FixedResponseActionConfig({
    required this.statusCode,
    this.contentType,
    this.messageBody,
  });
  factory FixedResponseActionConfig.fromXml(_s.XmlElement elem) {
    return FixedResponseActionConfig(
      statusCode: _s.extractXmlStringValue(elem, 'StatusCode')!,
      contentType: _s.extractXmlStringValue(elem, 'ContentType'),
      messageBody: _s.extractXmlStringValue(elem, 'MessageBody'),
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final contentType = this.contentType;
    final messageBody = this.messageBody;
    return {
      'StatusCode': statusCode,
      if (contentType != null) 'ContentType': contentType,
      if (messageBody != null) 'MessageBody': messageBody,
    };
  }
}

/// Information about a forward action.
class ForwardActionConfig {
  /// The target group stickiness for the rule.
  final TargetGroupStickinessConfig? targetGroupStickinessConfig;

  /// The target groups. For Network Load Balancers, you can specify a single
  /// target group.
  final List<TargetGroupTuple>? targetGroups;

  ForwardActionConfig({
    this.targetGroupStickinessConfig,
    this.targetGroups,
  });
  factory ForwardActionConfig.fromXml(_s.XmlElement elem) {
    return ForwardActionConfig(
      targetGroupStickinessConfig: _s
          .extractXmlChild(elem, 'TargetGroupStickinessConfig')
          ?.let(TargetGroupStickinessConfig.fromXml),
      targetGroups: _s.extractXmlChild(elem, 'TargetGroups')?.let((elem) =>
          elem.findElements('member').map(TargetGroupTuple.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final targetGroupStickinessConfig = this.targetGroupStickinessConfig;
    final targetGroups = this.targetGroups;
    return {
      if (targetGroupStickinessConfig != null)
        'TargetGroupStickinessConfig': targetGroupStickinessConfig,
      if (targetGroups != null) 'TargetGroups': targetGroups,
    };
  }
}

class GetTrustStoreCaCertificatesBundleOutput {
  /// The ca certificate bundles Amazon S3 URI.
  final String? location;

  GetTrustStoreCaCertificatesBundleOutput({
    this.location,
  });
  factory GetTrustStoreCaCertificatesBundleOutput.fromXml(_s.XmlElement elem) {
    return GetTrustStoreCaCertificatesBundleOutput(
      location: _s.extractXmlStringValue(elem, 'Location'),
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    return {
      if (location != null) 'Location': location,
    };
  }
}

class GetTrustStoreRevocationContentOutput {
  /// The revocation files Amazon S3 URI.
  final String? location;

  GetTrustStoreRevocationContentOutput({
    this.location,
  });
  factory GetTrustStoreRevocationContentOutput.fromXml(_s.XmlElement elem) {
    return GetTrustStoreRevocationContentOutput(
      location: _s.extractXmlStringValue(elem, 'Location'),
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    return {
      if (location != null) 'Location': location,
    };
  }
}

/// Information about a host header condition.
class HostHeaderConditionConfig {
  /// The host names. The maximum size of each name is 128 characters. The
  /// comparison is case insensitive. The following wildcard characters are
  /// supported: * (matches 0 or more characters) and ? (matches exactly 1
  /// character).
  ///
  /// If you specify multiple strings, the condition is satisfied if one of the
  /// strings matches the host name.
  final List<String>? values;

  HostHeaderConditionConfig({
    this.values,
  });
  factory HostHeaderConditionConfig.fromXml(_s.XmlElement elem) {
    return HostHeaderConditionConfig(
      values: _s
          .extractXmlChild(elem, 'Values')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final values = this.values;
    return {
      if (values != null) 'Values': values,
    };
  }
}

/// Information about an HTTP header condition.
///
/// There is a set of standard HTTP header fields. You can also define custom
/// HTTP header fields.
class HttpHeaderConditionConfig {
  /// The name of the HTTP header field. The maximum size is 40 characters. The
  /// header name is case insensitive. The allowed characters are specified by RFC
  /// 7230. Wildcards are not supported.
  ///
  /// You can't use an HTTP header condition to specify the host header. Use
  /// <a>HostHeaderConditionConfig</a> to specify a host header condition.
  final String? httpHeaderName;

  /// The strings to compare against the value of the HTTP header. The maximum
  /// size of each string is 128 characters. The comparison strings are case
  /// insensitive. The following wildcard characters are supported: * (matches 0
  /// or more characters) and ? (matches exactly 1 character).
  ///
  /// If the same header appears multiple times in the request, we search them in
  /// order until a match is found.
  ///
  /// If you specify multiple strings, the condition is satisfied if one of the
  /// strings matches the value of the HTTP header. To require that all of the
  /// strings are a match, create one condition per string.
  final List<String>? values;

  HttpHeaderConditionConfig({
    this.httpHeaderName,
    this.values,
  });
  factory HttpHeaderConditionConfig.fromXml(_s.XmlElement elem) {
    return HttpHeaderConditionConfig(
      httpHeaderName: _s.extractXmlStringValue(elem, 'HttpHeaderName'),
      values: _s
          .extractXmlChild(elem, 'Values')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final httpHeaderName = this.httpHeaderName;
    final values = this.values;
    return {
      if (httpHeaderName != null) 'HttpHeaderName': httpHeaderName,
      if (values != null) 'Values': values,
    };
  }
}

/// Information about an HTTP method condition.
///
/// HTTP defines a set of request methods, also referred to as HTTP verbs. For
/// more information, see the <a
/// href="https://www.iana.org/assignments/http-methods/http-methods.xhtml">HTTP
/// Method Registry</a>. You can also define custom HTTP methods.
class HttpRequestMethodConditionConfig {
  /// The name of the request method. The maximum size is 40 characters. The
  /// allowed characters are A-Z, hyphen (-), and underscore (_). The comparison
  /// is case sensitive. Wildcards are not supported; therefore, the method name
  /// must be an exact match.
  ///
  /// If you specify multiple strings, the condition is satisfied if one of the
  /// strings matches the HTTP request method. We recommend that you route GET and
  /// HEAD requests in the same way, because the response to a HEAD request may be
  /// cached.
  final List<String>? values;

  HttpRequestMethodConditionConfig({
    this.values,
  });
  factory HttpRequestMethodConditionConfig.fromXml(_s.XmlElement elem) {
    return HttpRequestMethodConditionConfig(
      values: _s
          .extractXmlChild(elem, 'Values')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final values = this.values;
    return {
      if (values != null) 'Values': values,
    };
  }
}

enum IpAddressType {
  ipv4,
  dualstack,
  dualstackWithoutPublicIpv4,
}

extension IpAddressTypeValueExtension on IpAddressType {
  String toValue() {
    switch (this) {
      case IpAddressType.ipv4:
        return 'ipv4';
      case IpAddressType.dualstack:
        return 'dualstack';
      case IpAddressType.dualstackWithoutPublicIpv4:
        return 'dualstack-without-public-ipv4';
    }
  }
}

extension IpAddressTypeFromString on String {
  IpAddressType toIpAddressType() {
    switch (this) {
      case 'ipv4':
        return IpAddressType.ipv4;
      case 'dualstack':
        return IpAddressType.dualstack;
      case 'dualstack-without-public-ipv4':
        return IpAddressType.dualstackWithoutPublicIpv4;
    }
    throw Exception('$this is not known in enum IpAddressType');
  }
}

/// Information about an Elastic Load Balancing resource limit for your Amazon
/// Web Services account.
///
/// For more information, see the following:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html">Quotas
/// for your Application Load Balancers</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-limits.html">Quotas
/// for your Network Load Balancers</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/quotas-limits.html">Quotas
/// for your Gateway Load Balancers</a>
/// </li>
/// </ul>
class Limit {
  /// The maximum value of the limit.
  final String? max;

  /// The name of the limit. The possible values are:
  ///
  /// <ul>
  /// <li>
  /// application-load-balancers
  /// </li>
  /// <li>
  /// condition-values-per-alb-rule
  /// </li>
  /// <li>
  /// condition-wildcards-per-alb-rule
  /// </li>
  /// <li>
  /// gateway-load-balancers
  /// </li>
  /// <li>
  /// gateway-load-balancers-per-vpc
  /// </li>
  /// <li>
  /// geneve-target-groups
  /// </li>
  /// <li>
  /// listeners-per-application-load-balancer
  /// </li>
  /// <li>
  /// listeners-per-network-load-balancer
  /// </li>
  /// <li>
  /// network-load-balancers
  /// </li>
  /// <li>
  /// rules-per-application-load-balancer
  /// </li>
  /// <li>
  /// target-groups
  /// </li>
  /// <li>
  /// target-groups-per-action-on-application-load-balancer
  /// </li>
  /// <li>
  /// target-groups-per-action-on-network-load-balancer
  /// </li>
  /// <li>
  /// target-groups-per-application-load-balancer
  /// </li>
  /// <li>
  /// targets-per-application-load-balancer
  /// </li>
  /// <li>
  /// targets-per-availability-zone-per-gateway-load-balancer
  /// </li>
  /// <li>
  /// targets-per-availability-zone-per-network-load-balancer
  /// </li>
  /// <li>
  /// targets-per-network-load-balancer
  /// </li>
  /// </ul>
  final String? name;

  Limit({
    this.max,
    this.name,
  });
  factory Limit.fromXml(_s.XmlElement elem) {
    return Limit(
      max: _s.extractXmlStringValue(elem, 'Max'),
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }

  Map<String, dynamic> toJson() {
    final max = this.max;
    final name = this.name;
    return {
      if (max != null) 'Max': max,
      if (name != null) 'Name': name,
    };
  }
}

/// Information about a listener.
class Listener {
  /// [TLS listener] The name of the Application-Layer Protocol Negotiation (ALPN)
  /// policy.
  final List<String>? alpnPolicy;

  /// [HTTPS or TLS listener] The default certificate for the listener.
  final List<Certificate>? certificates;

  /// The default actions for the listener.
  final List<Action>? defaultActions;

  /// The Amazon Resource Name (ARN) of the listener.
  final String? listenerArn;

  /// The Amazon Resource Name (ARN) of the load balancer.
  final String? loadBalancerArn;

  /// The mutual authentication configuration information.
  final MutualAuthenticationAttributes? mutualAuthentication;

  /// The port on which the load balancer is listening.
  final int? port;

  /// The protocol for connections from clients to the load balancer.
  final ProtocolEnum? protocol;

  /// [HTTPS or TLS listener] The security policy that defines which protocols and
  /// ciphers are supported.
  final String? sslPolicy;

  Listener({
    this.alpnPolicy,
    this.certificates,
    this.defaultActions,
    this.listenerArn,
    this.loadBalancerArn,
    this.mutualAuthentication,
    this.port,
    this.protocol,
    this.sslPolicy,
  });
  factory Listener.fromXml(_s.XmlElement elem) {
    return Listener(
      alpnPolicy: _s
          .extractXmlChild(elem, 'AlpnPolicy')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      certificates: _s.extractXmlChild(elem, 'Certificates')?.let((elem) =>
          elem.findElements('member').map(Certificate.fromXml).toList()),
      defaultActions: _s.extractXmlChild(elem, 'DefaultActions')?.let(
          (elem) => elem.findElements('member').map(Action.fromXml).toList()),
      listenerArn: _s.extractXmlStringValue(elem, 'ListenerArn'),
      loadBalancerArn: _s.extractXmlStringValue(elem, 'LoadBalancerArn'),
      mutualAuthentication: _s
          .extractXmlChild(elem, 'MutualAuthentication')
          ?.let(MutualAuthenticationAttributes.fromXml),
      port: _s.extractXmlIntValue(elem, 'Port'),
      protocol: _s.extractXmlStringValue(elem, 'Protocol')?.toProtocolEnum(),
      sslPolicy: _s.extractXmlStringValue(elem, 'SslPolicy'),
    );
  }

  Map<String, dynamic> toJson() {
    final alpnPolicy = this.alpnPolicy;
    final certificates = this.certificates;
    final defaultActions = this.defaultActions;
    final listenerArn = this.listenerArn;
    final loadBalancerArn = this.loadBalancerArn;
    final mutualAuthentication = this.mutualAuthentication;
    final port = this.port;
    final protocol = this.protocol;
    final sslPolicy = this.sslPolicy;
    return {
      if (alpnPolicy != null) 'AlpnPolicy': alpnPolicy,
      if (certificates != null) 'Certificates': certificates,
      if (defaultActions != null) 'DefaultActions': defaultActions,
      if (listenerArn != null) 'ListenerArn': listenerArn,
      if (loadBalancerArn != null) 'LoadBalancerArn': loadBalancerArn,
      if (mutualAuthentication != null)
        'MutualAuthentication': mutualAuthentication,
      if (port != null) 'Port': port,
      if (protocol != null) 'Protocol': protocol.toValue(),
      if (sslPolicy != null) 'SslPolicy': sslPolicy,
    };
  }
}

/// Information about a load balancer.
class LoadBalancer {
  /// The subnets for the load balancer.
  final List<AvailabilityZone>? availabilityZones;

  /// The ID of the Amazon Route 53 hosted zone associated with the load balancer.
  final String? canonicalHostedZoneId;

  /// The date and time the load balancer was created.
  final DateTime? createdTime;

  /// [Application Load Balancers on Outposts] The ID of the customer-owned
  /// address pool.
  final String? customerOwnedIpv4Pool;

  /// The public DNS name of the load balancer.
  final String? dNSName;

  /// Indicates whether to evaluate inbound security group rules for traffic sent
  /// to a Network Load Balancer through Amazon Web Services PrivateLink.
  final String? enforceSecurityGroupInboundRulesOnPrivateLinkTraffic;

  /// [Application Load Balancers] The type of IP addresses used for public or
  /// private connections by the subnets attached to your load balancer. The
  /// possible values are <code>ipv4</code> (for only IPv4 addresses),
  /// <code>dualstack</code> (for IPv4 and IPv6 addresses), and
  /// <code>dualstack-without-public-ipv4</code> (for IPv6 only public addresses,
  /// with private IPv4 and IPv6 addresses).
  ///
  /// [Network Load Balancers and Gateway Load Balancers] The type of IP addresses
  /// used for public or private connections by the subnets attached to your load
  /// balancer. The possible values are <code>ipv4</code> (for only IPv4
  /// addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses).
  final IpAddressType? ipAddressType;

  /// The Amazon Resource Name (ARN) of the load balancer.
  final String? loadBalancerArn;

  /// The name of the load balancer.
  final String? loadBalancerName;

  /// The nodes of an Internet-facing load balancer have public IP addresses. The
  /// DNS name of an Internet-facing load balancer is publicly resolvable to the
  /// public IP addresses of the nodes. Therefore, Internet-facing load balancers
  /// can route requests from clients over the internet.
  ///
  /// The nodes of an internal load balancer have only private IP addresses. The
  /// DNS name of an internal load balancer is publicly resolvable to the private
  /// IP addresses of the nodes. Therefore, internal load balancers can route
  /// requests only from clients with access to the VPC for the load balancer.
  final LoadBalancerSchemeEnum? scheme;

  /// The IDs of the security groups for the load balancer.
  final List<String>? securityGroups;

  /// The state of the load balancer.
  final LoadBalancerState? state;

  /// The type of load balancer.
  final LoadBalancerTypeEnum? type;

  /// The ID of the VPC for the load balancer.
  final String? vpcId;

  LoadBalancer({
    this.availabilityZones,
    this.canonicalHostedZoneId,
    this.createdTime,
    this.customerOwnedIpv4Pool,
    this.dNSName,
    this.enforceSecurityGroupInboundRulesOnPrivateLinkTraffic,
    this.ipAddressType,
    this.loadBalancerArn,
    this.loadBalancerName,
    this.scheme,
    this.securityGroups,
    this.state,
    this.type,
    this.vpcId,
  });
  factory LoadBalancer.fromXml(_s.XmlElement elem) {
    return LoadBalancer(
      availabilityZones: _s.extractXmlChild(elem, 'AvailabilityZones')?.let(
          (elem) => elem
              .findElements('member')
              .map(AvailabilityZone.fromXml)
              .toList()),
      canonicalHostedZoneId:
          _s.extractXmlStringValue(elem, 'CanonicalHostedZoneId'),
      createdTime: _s.extractXmlDateTimeValue(elem, 'CreatedTime'),
      customerOwnedIpv4Pool:
          _s.extractXmlStringValue(elem, 'CustomerOwnedIpv4Pool'),
      dNSName: _s.extractXmlStringValue(elem, 'DNSName'),
      enforceSecurityGroupInboundRulesOnPrivateLinkTraffic:
          _s.extractXmlStringValue(
              elem, 'EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic'),
      ipAddressType:
          _s.extractXmlStringValue(elem, 'IpAddressType')?.toIpAddressType(),
      loadBalancerArn: _s.extractXmlStringValue(elem, 'LoadBalancerArn'),
      loadBalancerName: _s.extractXmlStringValue(elem, 'LoadBalancerName'),
      scheme:
          _s.extractXmlStringValue(elem, 'Scheme')?.toLoadBalancerSchemeEnum(),
      securityGroups: _s
          .extractXmlChild(elem, 'SecurityGroups')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      state: _s.extractXmlChild(elem, 'State')?.let(LoadBalancerState.fromXml),
      type: _s.extractXmlStringValue(elem, 'Type')?.toLoadBalancerTypeEnum(),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final canonicalHostedZoneId = this.canonicalHostedZoneId;
    final createdTime = this.createdTime;
    final customerOwnedIpv4Pool = this.customerOwnedIpv4Pool;
    final dNSName = this.dNSName;
    final enforceSecurityGroupInboundRulesOnPrivateLinkTraffic =
        this.enforceSecurityGroupInboundRulesOnPrivateLinkTraffic;
    final ipAddressType = this.ipAddressType;
    final loadBalancerArn = this.loadBalancerArn;
    final loadBalancerName = this.loadBalancerName;
    final scheme = this.scheme;
    final securityGroups = this.securityGroups;
    final state = this.state;
    final type = this.type;
    final vpcId = this.vpcId;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (canonicalHostedZoneId != null)
        'CanonicalHostedZoneId': canonicalHostedZoneId,
      if (createdTime != null) 'CreatedTime': iso8601ToJson(createdTime),
      if (customerOwnedIpv4Pool != null)
        'CustomerOwnedIpv4Pool': customerOwnedIpv4Pool,
      if (dNSName != null) 'DNSName': dNSName,
      if (enforceSecurityGroupInboundRulesOnPrivateLinkTraffic != null)
        'EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic':
            enforceSecurityGroupInboundRulesOnPrivateLinkTraffic,
      if (ipAddressType != null) 'IpAddressType': ipAddressType.toValue(),
      if (loadBalancerArn != null) 'LoadBalancerArn': loadBalancerArn,
      if (loadBalancerName != null) 'LoadBalancerName': loadBalancerName,
      if (scheme != null) 'Scheme': scheme.toValue(),
      if (securityGroups != null) 'SecurityGroups': securityGroups,
      if (state != null) 'State': state,
      if (type != null) 'Type': type.toValue(),
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Information about a static IP address for a load balancer.
class LoadBalancerAddress {
  /// [Network Load Balancers] The allocation ID of the Elastic IP address for an
  /// internal-facing load balancer.
  final String? allocationId;

  /// [Network Load Balancers] The IPv6 address.
  final String? iPv6Address;

  /// The static IP address.
  final String? ipAddress;

  /// [Network Load Balancers] The private IPv4 address for an internal load
  /// balancer.
  final String? privateIPv4Address;

  LoadBalancerAddress({
    this.allocationId,
    this.iPv6Address,
    this.ipAddress,
    this.privateIPv4Address,
  });
  factory LoadBalancerAddress.fromXml(_s.XmlElement elem) {
    return LoadBalancerAddress(
      allocationId: _s.extractXmlStringValue(elem, 'AllocationId'),
      iPv6Address: _s.extractXmlStringValue(elem, 'IPv6Address'),
      ipAddress: _s.extractXmlStringValue(elem, 'IpAddress'),
      privateIPv4Address: _s.extractXmlStringValue(elem, 'PrivateIPv4Address'),
    );
  }

  Map<String, dynamic> toJson() {
    final allocationId = this.allocationId;
    final iPv6Address = this.iPv6Address;
    final ipAddress = this.ipAddress;
    final privateIPv4Address = this.privateIPv4Address;
    return {
      if (allocationId != null) 'AllocationId': allocationId,
      if (iPv6Address != null) 'IPv6Address': iPv6Address,
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (privateIPv4Address != null) 'PrivateIPv4Address': privateIPv4Address,
    };
  }
}

/// Information about a load balancer attribute.
class LoadBalancerAttribute {
  /// The name of the attribute.
  ///
  /// The following attributes are supported by all load balancers:
  ///
  /// <ul>
  /// <li>
  /// <code>deletion_protection.enabled</code> - Indicates whether deletion
  /// protection is enabled. The value is <code>true</code> or <code>false</code>.
  /// The default is <code>false</code>.
  /// </li>
  /// <li>
  /// <code>load_balancing.cross_zone.enabled</code> - Indicates whether
  /// cross-zone load balancing is enabled. The possible values are
  /// <code>true</code> and <code>false</code>. The default for Network Load
  /// Balancers and Gateway Load Balancers is <code>false</code>. The default for
  /// Application Load Balancers is <code>true</code>, and cannot be changed.
  /// </li>
  /// </ul>
  /// The following attributes are supported by both Application Load Balancers
  /// and Network Load Balancers:
  ///
  /// <ul>
  /// <li>
  /// <code>access_logs.s3.enabled</code> - Indicates whether access logs are
  /// enabled. The value is <code>true</code> or <code>false</code>. The default
  /// is <code>false</code>.
  /// </li>
  /// <li>
  /// <code>access_logs.s3.bucket</code> - The name of the S3 bucket for the
  /// access logs. This attribute is required if access logs are enabled. The
  /// bucket must exist in the same region as the load balancer and have a bucket
  /// policy that grants Elastic Load Balancing permissions to write to the
  /// bucket.
  /// </li>
  /// <li>
  /// <code>access_logs.s3.prefix</code> - The prefix for the location in the S3
  /// bucket for the access logs.
  /// </li>
  /// <li>
  /// <code>ipv6.deny_all_igw_traffic</code> - Blocks internet gateway (IGW)
  /// access to the load balancer. It is set to <code>false</code> for
  /// internet-facing load balancers and <code>true</code> for internal load
  /// balancers, preventing unintended access to your internal load balancer
  /// through an internet gateway.
  /// </li>
  /// </ul>
  /// The following attributes are supported by only Application Load Balancers:
  ///
  /// <ul>
  /// <li>
  /// <code>idle_timeout.timeout_seconds</code> - The idle timeout value, in
  /// seconds. The valid range is 1-4000 seconds. The default is 60 seconds.
  /// </li>
  /// <li>
  /// <code>client_keep_alive.seconds</code> - The client keep alive value, in
  /// seconds. The valid range is 60-604800 seconds. The default is 3600 seconds.
  /// </li>
  /// <li>
  /// <code>connection_logs.s3.enabled</code> - Indicates whether connection logs
  /// are enabled. The value is <code>true</code> or <code>false</code>. The
  /// default is <code>false</code>.
  /// </li>
  /// <li>
  /// <code>connection_logs.s3.bucket</code> - The name of the S3 bucket for the
  /// connection logs. This attribute is required if connection logs are enabled.
  /// The bucket must exist in the same region as the load balancer and have a
  /// bucket policy that grants Elastic Load Balancing permissions to write to the
  /// bucket.
  /// </li>
  /// <li>
  /// <code>connection_logs.s3.prefix</code> - The prefix for the location in the
  /// S3 bucket for the connection logs.
  /// </li>
  /// <li>
  /// <code>routing.http.desync_mitigation_mode</code> - Determines how the load
  /// balancer handles requests that might pose a security risk to your
  /// application. The possible values are <code>monitor</code>,
  /// <code>defensive</code>, and <code>strictest</code>. The default is
  /// <code>defensive</code>.
  /// </li>
  /// <li>
  /// <code>routing.http.drop_invalid_header_fields.enabled</code> - Indicates
  /// whether HTTP headers with invalid header fields are removed by the load
  /// balancer (<code>true</code>) or routed to targets (<code>false</code>). The
  /// default is <code>false</code>.
  /// </li>
  /// <li>
  /// <code>routing.http.preserve_host_header.enabled</code> - Indicates whether
  /// the Application Load Balancer should preserve the <code>Host</code> header
  /// in the HTTP request and send it to the target without any change. The
  /// possible values are <code>true</code> and <code>false</code>. The default is
  /// <code>false</code>.
  /// </li>
  /// <li>
  /// <code>routing.http.x_amzn_tls_version_and_cipher_suite.enabled</code> -
  /// Indicates whether the two headers (<code>x-amzn-tls-version</code> and
  /// <code>x-amzn-tls-cipher-suite</code>), which contain information about the
  /// negotiated TLS version and cipher suite, are added to the client request
  /// before sending it to the target. The <code>x-amzn-tls-version</code> header
  /// has information about the TLS protocol version negotiated with the client,
  /// and the <code>x-amzn-tls-cipher-suite</code> header has information about
  /// the cipher suite negotiated with the client. Both headers are in OpenSSL
  /// format. The possible values for the attribute are <code>true</code> and
  /// <code>false</code>. The default is <code>false</code>.
  /// </li>
  /// <li>
  /// <code>routing.http.xff_client_port.enabled</code> - Indicates whether the
  /// <code>X-Forwarded-For</code> header should preserve the source port that the
  /// client used to connect to the load balancer. The possible values are
  /// <code>true</code> and <code>false</code>. The default is <code>false</code>.
  /// </li>
  /// <li>
  /// <code>routing.http.xff_header_processing.mode</code> - Enables you to
  /// modify, preserve, or remove the <code>X-Forwarded-For</code> header in the
  /// HTTP request before the Application Load Balancer sends the request to the
  /// target. The possible values are <code>append</code>, <code>preserve</code>,
  /// and <code>remove</code>. The default is <code>append</code>.
  ///
  /// <ul>
  /// <li>
  /// If the value is <code>append</code>, the Application Load Balancer adds the
  /// client IP address (of the last hop) to the <code>X-Forwarded-For</code>
  /// header in the HTTP request before it sends it to targets.
  /// </li>
  /// <li>
  /// If the value is <code>preserve</code> the Application Load Balancer
  /// preserves the <code>X-Forwarded-For</code> header in the HTTP request, and
  /// sends it to targets without any change.
  /// </li>
  /// <li>
  /// If the value is <code>remove</code>, the Application Load Balancer removes
  /// the <code>X-Forwarded-For</code> header in the HTTP request before it sends
  /// it to targets.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>routing.http2.enabled</code> - Indicates whether HTTP/2 is enabled.
  /// The possible values are <code>true</code> and <code>false</code>. The
  /// default is <code>true</code>. Elastic Load Balancing requires that message
  /// header names contain only alphanumeric characters and hyphens.
  /// </li>
  /// <li>
  /// <code>waf.fail_open.enabled</code> - Indicates whether to allow a
  /// WAF-enabled load balancer to route requests to targets if it is unable to
  /// forward the request to Amazon Web Services WAF. The possible values are
  /// <code>true</code> and <code>false</code>. The default is <code>false</code>.
  /// </li>
  /// </ul>
  /// The following attributes are supported by only Network Load Balancers:
  ///
  /// <ul>
  /// <li>
  /// <code>dns_record.client_routing_policy</code> - Indicates how traffic is
  /// distributed among the load balancer Availability Zones. The possible values
  /// are <code>availability_zone_affinity</code> with 100 percent zonal affinity,
  /// <code>partial_availability_zone_affinity</code> with 85 percent zonal
  /// affinity, and <code>any_availability_zone</code> with 0 percent zonal
  /// affinity.
  /// </li>
  /// </ul>
  final String? key;

  /// The value of the attribute.
  final String? value;

  LoadBalancerAttribute({
    this.key,
    this.value,
  });
  factory LoadBalancerAttribute.fromXml(_s.XmlElement elem) {
    return LoadBalancerAttribute(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

enum LoadBalancerSchemeEnum {
  internetFacing,
  internal,
}

extension LoadBalancerSchemeEnumValueExtension on LoadBalancerSchemeEnum {
  String toValue() {
    switch (this) {
      case LoadBalancerSchemeEnum.internetFacing:
        return 'internet-facing';
      case LoadBalancerSchemeEnum.internal:
        return 'internal';
    }
  }
}

extension LoadBalancerSchemeEnumFromString on String {
  LoadBalancerSchemeEnum toLoadBalancerSchemeEnum() {
    switch (this) {
      case 'internet-facing':
        return LoadBalancerSchemeEnum.internetFacing;
      case 'internal':
        return LoadBalancerSchemeEnum.internal;
    }
    throw Exception('$this is not known in enum LoadBalancerSchemeEnum');
  }
}

/// Information about the state of the load balancer.
class LoadBalancerState {
  /// The state code. The initial state of the load balancer is
  /// <code>provisioning</code>. After the load balancer is fully set up and ready
  /// to route traffic, its state is <code>active</code>. If load balancer is
  /// routing traffic but does not have the resources it needs to scale, its state
  /// is<code>active_impaired</code>. If the load balancer could not be set up,
  /// its state is <code>failed</code>.
  final LoadBalancerStateEnum? code;

  /// A description of the state.
  final String? reason;

  LoadBalancerState({
    this.code,
    this.reason,
  });
  factory LoadBalancerState.fromXml(_s.XmlElement elem) {
    return LoadBalancerState(
      code: _s.extractXmlStringValue(elem, 'Code')?.toLoadBalancerStateEnum(),
      reason: _s.extractXmlStringValue(elem, 'Reason'),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final reason = this.reason;
    return {
      if (code != null) 'Code': code.toValue(),
      if (reason != null) 'Reason': reason,
    };
  }
}

enum LoadBalancerStateEnum {
  active,
  provisioning,
  activeImpaired,
  failed,
}

extension LoadBalancerStateEnumValueExtension on LoadBalancerStateEnum {
  String toValue() {
    switch (this) {
      case LoadBalancerStateEnum.active:
        return 'active';
      case LoadBalancerStateEnum.provisioning:
        return 'provisioning';
      case LoadBalancerStateEnum.activeImpaired:
        return 'active_impaired';
      case LoadBalancerStateEnum.failed:
        return 'failed';
    }
  }
}

extension LoadBalancerStateEnumFromString on String {
  LoadBalancerStateEnum toLoadBalancerStateEnum() {
    switch (this) {
      case 'active':
        return LoadBalancerStateEnum.active;
      case 'provisioning':
        return LoadBalancerStateEnum.provisioning;
      case 'active_impaired':
        return LoadBalancerStateEnum.activeImpaired;
      case 'failed':
        return LoadBalancerStateEnum.failed;
    }
    throw Exception('$this is not known in enum LoadBalancerStateEnum');
  }
}

enum LoadBalancerTypeEnum {
  application,
  network,
  gateway,
}

extension LoadBalancerTypeEnumValueExtension on LoadBalancerTypeEnum {
  String toValue() {
    switch (this) {
      case LoadBalancerTypeEnum.application:
        return 'application';
      case LoadBalancerTypeEnum.network:
        return 'network';
      case LoadBalancerTypeEnum.gateway:
        return 'gateway';
    }
  }
}

extension LoadBalancerTypeEnumFromString on String {
  LoadBalancerTypeEnum toLoadBalancerTypeEnum() {
    switch (this) {
      case 'application':
        return LoadBalancerTypeEnum.application;
      case 'network':
        return LoadBalancerTypeEnum.network;
      case 'gateway':
        return LoadBalancerTypeEnum.gateway;
    }
    throw Exception('$this is not known in enum LoadBalancerTypeEnum');
  }
}

/// The codes to use when checking for a successful response from a target. If
/// the protocol version is gRPC, these are gRPC codes. Otherwise, these are
/// HTTP codes.
class Matcher {
  /// You can specify values between 0 and 99. You can specify multiple values
  /// (for example, "0,1") or a range of values (for example, "0-5"). The default
  /// value is 12.
  final String? grpcCode;

  /// For Application Load Balancers, you can specify values between 200 and 499,
  /// with the default value being 200. You can specify multiple values (for
  /// example, "200,202") or a range of values (for example, "200-299").
  ///
  /// For Network Load Balancers, you can specify values between 200 and 599, with
  /// the default value being 200-399. You can specify multiple values (for
  /// example, "200,202") or a range of values (for example, "200-299").
  ///
  /// For Gateway Load Balancers, this must be "200–399".
  ///
  /// Note that when using shorthand syntax, some values such as commas need to be
  /// escaped.
  final String? httpCode;

  Matcher({
    this.grpcCode,
    this.httpCode,
  });
  factory Matcher.fromXml(_s.XmlElement elem) {
    return Matcher(
      grpcCode: _s.extractXmlStringValue(elem, 'GrpcCode'),
      httpCode: _s.extractXmlStringValue(elem, 'HttpCode'),
    );
  }

  Map<String, dynamic> toJson() {
    final grpcCode = this.grpcCode;
    final httpCode = this.httpCode;
    return {
      if (grpcCode != null) 'GrpcCode': grpcCode,
      if (httpCode != null) 'HttpCode': httpCode,
    };
  }
}

enum MitigationInEffectEnum {
  yes,
  no,
}

extension MitigationInEffectEnumValueExtension on MitigationInEffectEnum {
  String toValue() {
    switch (this) {
      case MitigationInEffectEnum.yes:
        return 'yes';
      case MitigationInEffectEnum.no:
        return 'no';
    }
  }
}

extension MitigationInEffectEnumFromString on String {
  MitigationInEffectEnum toMitigationInEffectEnum() {
    switch (this) {
      case 'yes':
        return MitigationInEffectEnum.yes;
      case 'no':
        return MitigationInEffectEnum.no;
    }
    throw Exception('$this is not known in enum MitigationInEffectEnum');
  }
}

class ModifyListenerOutput {
  /// Information about the modified listener.
  final List<Listener>? listeners;

  ModifyListenerOutput({
    this.listeners,
  });
  factory ModifyListenerOutput.fromXml(_s.XmlElement elem) {
    return ModifyListenerOutput(
      listeners: _s.extractXmlChild(elem, 'Listeners')?.let(
          (elem) => elem.findElements('member').map(Listener.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final listeners = this.listeners;
    return {
      if (listeners != null) 'Listeners': listeners,
    };
  }
}

class ModifyLoadBalancerAttributesOutput {
  /// Information about the load balancer attributes.
  final List<LoadBalancerAttribute>? attributes;

  ModifyLoadBalancerAttributesOutput({
    this.attributes,
  });
  factory ModifyLoadBalancerAttributesOutput.fromXml(_s.XmlElement elem) {
    return ModifyLoadBalancerAttributesOutput(
      attributes: _s.extractXmlChild(elem, 'Attributes')?.let((elem) => elem
          .findElements('member')
          .map(LoadBalancerAttribute.fromXml)
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

class ModifyRuleOutput {
  /// Information about the modified rule.
  final List<Rule>? rules;

  ModifyRuleOutput({
    this.rules,
  });
  factory ModifyRuleOutput.fromXml(_s.XmlElement elem) {
    return ModifyRuleOutput(
      rules: _s.extractXmlChild(elem, 'Rules')?.let(
          (elem) => elem.findElements('member').map(Rule.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    return {
      if (rules != null) 'Rules': rules,
    };
  }
}

class ModifyTargetGroupAttributesOutput {
  /// Information about the attributes.
  final List<TargetGroupAttribute>? attributes;

  ModifyTargetGroupAttributesOutput({
    this.attributes,
  });
  factory ModifyTargetGroupAttributesOutput.fromXml(_s.XmlElement elem) {
    return ModifyTargetGroupAttributesOutput(
      attributes: _s.extractXmlChild(elem, 'Attributes')?.let((elem) => elem
          .findElements('member')
          .map(TargetGroupAttribute.fromXml)
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

class ModifyTargetGroupOutput {
  /// Information about the modified target group.
  final List<TargetGroup>? targetGroups;

  ModifyTargetGroupOutput({
    this.targetGroups,
  });
  factory ModifyTargetGroupOutput.fromXml(_s.XmlElement elem) {
    return ModifyTargetGroupOutput(
      targetGroups: _s.extractXmlChild(elem, 'TargetGroups')?.let((elem) =>
          elem.findElements('member').map(TargetGroup.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final targetGroups = this.targetGroups;
    return {
      if (targetGroups != null) 'TargetGroups': targetGroups,
    };
  }
}

class ModifyTrustStoreOutput {
  /// Information about the modified trust store.
  final List<TrustStore>? trustStores;

  ModifyTrustStoreOutput({
    this.trustStores,
  });
  factory ModifyTrustStoreOutput.fromXml(_s.XmlElement elem) {
    return ModifyTrustStoreOutput(
      trustStores: _s.extractXmlChild(elem, 'TrustStores')?.let((elem) =>
          elem.findElements('member').map(TrustStore.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final trustStores = this.trustStores;
    return {
      if (trustStores != null) 'TrustStores': trustStores,
    };
  }
}

/// Information about the mutual authentication attributes of a listener.
class MutualAuthenticationAttributes {
  /// Indicates whether expired client certificates are ignored.
  final bool? ignoreClientCertificateExpiry;

  /// The client certificate handling method. Options are <code>off</code>,
  /// <code>passthrough</code> or <code>verify</code>. The default value is
  /// <code>off</code>.
  final String? mode;

  /// The Amazon Resource Name (ARN) of the trust store.
  final String? trustStoreArn;

  MutualAuthenticationAttributes({
    this.ignoreClientCertificateExpiry,
    this.mode,
    this.trustStoreArn,
  });
  factory MutualAuthenticationAttributes.fromXml(_s.XmlElement elem) {
    return MutualAuthenticationAttributes(
      ignoreClientCertificateExpiry:
          _s.extractXmlBoolValue(elem, 'IgnoreClientCertificateExpiry'),
      mode: _s.extractXmlStringValue(elem, 'Mode'),
      trustStoreArn: _s.extractXmlStringValue(elem, 'TrustStoreArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final ignoreClientCertificateExpiry = this.ignoreClientCertificateExpiry;
    final mode = this.mode;
    final trustStoreArn = this.trustStoreArn;
    return {
      if (ignoreClientCertificateExpiry != null)
        'IgnoreClientCertificateExpiry': ignoreClientCertificateExpiry,
      if (mode != null) 'Mode': mode,
      if (trustStoreArn != null) 'TrustStoreArn': trustStoreArn,
    };
  }
}

/// Information about a path pattern condition.
class PathPatternConditionConfig {
  /// The path patterns to compare against the request URL. The maximum size of
  /// each string is 128 characters. The comparison is case sensitive. The
  /// following wildcard characters are supported: * (matches 0 or more
  /// characters) and ? (matches exactly 1 character).
  ///
  /// If you specify multiple strings, the condition is satisfied if one of them
  /// matches the request URL. The path pattern is compared only to the path of
  /// the URL, not to its query string. To compare against the query string, use
  /// <a>QueryStringConditionConfig</a>.
  final List<String>? values;

  PathPatternConditionConfig({
    this.values,
  });
  factory PathPatternConditionConfig.fromXml(_s.XmlElement elem) {
    return PathPatternConditionConfig(
      values: _s
          .extractXmlChild(elem, 'Values')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final values = this.values;
    return {
      if (values != null) 'Values': values,
    };
  }
}

enum ProtocolEnum {
  http,
  https,
  tcp,
  tls,
  udp,
  tcpUdp,
  geneve,
}

extension ProtocolEnumValueExtension on ProtocolEnum {
  String toValue() {
    switch (this) {
      case ProtocolEnum.http:
        return 'HTTP';
      case ProtocolEnum.https:
        return 'HTTPS';
      case ProtocolEnum.tcp:
        return 'TCP';
      case ProtocolEnum.tls:
        return 'TLS';
      case ProtocolEnum.udp:
        return 'UDP';
      case ProtocolEnum.tcpUdp:
        return 'TCP_UDP';
      case ProtocolEnum.geneve:
        return 'GENEVE';
    }
  }
}

extension ProtocolEnumFromString on String {
  ProtocolEnum toProtocolEnum() {
    switch (this) {
      case 'HTTP':
        return ProtocolEnum.http;
      case 'HTTPS':
        return ProtocolEnum.https;
      case 'TCP':
        return ProtocolEnum.tcp;
      case 'TLS':
        return ProtocolEnum.tls;
      case 'UDP':
        return ProtocolEnum.udp;
      case 'TCP_UDP':
        return ProtocolEnum.tcpUdp;
      case 'GENEVE':
        return ProtocolEnum.geneve;
    }
    throw Exception('$this is not known in enum ProtocolEnum');
  }
}

/// Information about a query string condition.
///
/// The query string component of a URI starts after the first '?' character and
/// is terminated by either a '#' character or the end of the URI. A typical
/// query string contains key/value pairs separated by '&amp;' characters. The
/// allowed characters are specified by RFC 3986. Any character can be
/// percentage encoded.
class QueryStringConditionConfig {
  /// The key/value pairs or values to find in the query string. The maximum size
  /// of each string is 128 characters. The comparison is case insensitive. The
  /// following wildcard characters are supported: * (matches 0 or more
  /// characters) and ? (matches exactly 1 character). To search for a literal '*'
  /// or '?' character in a query string, you must escape these characters in
  /// <code>Values</code> using a '\' character.
  ///
  /// If you specify multiple key/value pairs or values, the condition is
  /// satisfied if one of them is found in the query string.
  final List<QueryStringKeyValuePair>? values;

  QueryStringConditionConfig({
    this.values,
  });
  factory QueryStringConditionConfig.fromXml(_s.XmlElement elem) {
    return QueryStringConditionConfig(
      values: _s.extractXmlChild(elem, 'Values')?.let((elem) => elem
          .findElements('member')
          .map(QueryStringKeyValuePair.fromXml)
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final values = this.values;
    return {
      if (values != null) 'Values': values,
    };
  }
}

/// Information about a key/value pair.
class QueryStringKeyValuePair {
  /// The key. You can omit the key.
  final String? key;

  /// The value.
  final String? value;

  QueryStringKeyValuePair({
    this.key,
    this.value,
  });
  factory QueryStringKeyValuePair.fromXml(_s.XmlElement elem) {
    return QueryStringKeyValuePair(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// Information about a redirect action.
///
/// A URI consists of the following components:
/// protocol://hostname:port/path?query. You must modify at least one of the
/// following components to avoid a redirect loop: protocol, hostname, port, or
/// path. Any components that you do not modify retain their original values.
///
/// You can reuse URI components using the following reserved keywords:
///
/// <ul>
/// <li>
/// #{protocol}
/// </li>
/// <li>
/// #{host}
/// </li>
/// <li>
/// #{port}
/// </li>
/// <li>
/// #{path} (the leading "/" is removed)
/// </li>
/// <li>
/// #{query}
/// </li>
/// </ul>
/// For example, you can change the path to "/new/#{path}", the hostname to
/// "example.#{host}", or the query to "#{query}&amp;value=xyz".
class RedirectActionConfig {
  /// The HTTP redirect code. The redirect is either permanent (HTTP 301) or
  /// temporary (HTTP 302).
  final RedirectActionStatusCodeEnum statusCode;

  /// The hostname. This component is not percent-encoded. The hostname can
  /// contain #{host}.
  final String? host;

  /// The absolute path, starting with the leading "/". This component is not
  /// percent-encoded. The path can contain #{host}, #{path}, and #{port}.
  final String? path;

  /// The port. You can specify a value from 1 to 65535 or #{port}.
  final String? port;

  /// The protocol. You can specify HTTP, HTTPS, or #{protocol}. You can redirect
  /// HTTP to HTTP, HTTP to HTTPS, and HTTPS to HTTPS. You cannot redirect HTTPS
  /// to HTTP.
  final String? protocol;

  /// The query parameters, URL-encoded when necessary, but not percent-encoded.
  /// Do not include the leading "?", as it is automatically added. You can
  /// specify any of the reserved keywords.
  final String? query;

  RedirectActionConfig({
    required this.statusCode,
    this.host,
    this.path,
    this.port,
    this.protocol,
    this.query,
  });
  factory RedirectActionConfig.fromXml(_s.XmlElement elem) {
    return RedirectActionConfig(
      statusCode: _s
          .extractXmlStringValue(elem, 'StatusCode')!
          .toRedirectActionStatusCodeEnum(),
      host: _s.extractXmlStringValue(elem, 'Host'),
      path: _s.extractXmlStringValue(elem, 'Path'),
      port: _s.extractXmlStringValue(elem, 'Port'),
      protocol: _s.extractXmlStringValue(elem, 'Protocol'),
      query: _s.extractXmlStringValue(elem, 'Query'),
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final host = this.host;
    final path = this.path;
    final port = this.port;
    final protocol = this.protocol;
    final query = this.query;
    return {
      'StatusCode': statusCode.toValue(),
      if (host != null) 'Host': host,
      if (path != null) 'Path': path,
      if (port != null) 'Port': port,
      if (protocol != null) 'Protocol': protocol,
      if (query != null) 'Query': query,
    };
  }
}

enum RedirectActionStatusCodeEnum {
  http_301,
  http_302,
}

extension RedirectActionStatusCodeEnumValueExtension
    on RedirectActionStatusCodeEnum {
  String toValue() {
    switch (this) {
      case RedirectActionStatusCodeEnum.http_301:
        return 'HTTP_301';
      case RedirectActionStatusCodeEnum.http_302:
        return 'HTTP_302';
    }
  }
}

extension RedirectActionStatusCodeEnumFromString on String {
  RedirectActionStatusCodeEnum toRedirectActionStatusCodeEnum() {
    switch (this) {
      case 'HTTP_301':
        return RedirectActionStatusCodeEnum.http_301;
      case 'HTTP_302':
        return RedirectActionStatusCodeEnum.http_302;
    }
    throw Exception('$this is not known in enum RedirectActionStatusCodeEnum');
  }
}

class RegisterTargetsOutput {
  RegisterTargetsOutput();
  factory RegisterTargetsOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return RegisterTargetsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RemoveListenerCertificatesOutput {
  RemoveListenerCertificatesOutput();
  factory RemoveListenerCertificatesOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return RemoveListenerCertificatesOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RemoveTagsOutput {
  RemoveTagsOutput();
  factory RemoveTagsOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return RemoveTagsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RemoveTrustStoreRevocationsOutput {
  RemoveTrustStoreRevocationsOutput();
  factory RemoveTrustStoreRevocationsOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return RemoveTrustStoreRevocationsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about a revocation file.
class RevocationContent {
  /// The type of revocation file.
  final RevocationType? revocationType;

  /// The Amazon S3 bucket for the revocation file.
  final String? s3Bucket;

  /// The Amazon S3 path for the revocation file.
  final String? s3Key;

  /// The Amazon S3 object version of the revocation file.
  final String? s3ObjectVersion;

  RevocationContent({
    this.revocationType,
    this.s3Bucket,
    this.s3Key,
    this.s3ObjectVersion,
  });

  Map<String, dynamic> toJson() {
    final revocationType = this.revocationType;
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    final s3ObjectVersion = this.s3ObjectVersion;
    return {
      if (revocationType != null) 'RevocationType': revocationType.toValue(),
      if (s3Bucket != null) 'S3Bucket': s3Bucket,
      if (s3Key != null) 'S3Key': s3Key,
      if (s3ObjectVersion != null) 'S3ObjectVersion': s3ObjectVersion,
    };
  }
}

enum RevocationType {
  crl,
}

extension RevocationTypeValueExtension on RevocationType {
  String toValue() {
    switch (this) {
      case RevocationType.crl:
        return 'CRL';
    }
  }
}

extension RevocationTypeFromString on String {
  RevocationType toRevocationType() {
    switch (this) {
      case 'CRL':
        return RevocationType.crl;
    }
    throw Exception('$this is not known in enum RevocationType');
  }
}

/// Information about a rule.
class Rule {
  /// The actions. Each rule must include exactly one of the following types of
  /// actions: <code>forward</code>, <code>redirect</code>, or
  /// <code>fixed-response</code>, and it must be the last action to be performed.
  final List<Action>? actions;

  /// The conditions. Each rule can include zero or one of the following
  /// conditions: <code>http-request-method</code>, <code>host-header</code>,
  /// <code>path-pattern</code>, and <code>source-ip</code>, and zero or more of
  /// the following conditions: <code>http-header</code> and
  /// <code>query-string</code>.
  final List<RuleCondition>? conditions;

  /// Indicates whether this is the default rule.
  final bool? isDefault;

  /// The priority.
  final String? priority;

  /// The Amazon Resource Name (ARN) of the rule.
  final String? ruleArn;

  Rule({
    this.actions,
    this.conditions,
    this.isDefault,
    this.priority,
    this.ruleArn,
  });
  factory Rule.fromXml(_s.XmlElement elem) {
    return Rule(
      actions: _s.extractXmlChild(elem, 'Actions')?.let(
          (elem) => elem.findElements('member').map(Action.fromXml).toList()),
      conditions: _s.extractXmlChild(elem, 'Conditions')?.let((elem) =>
          elem.findElements('member').map(RuleCondition.fromXml).toList()),
      isDefault: _s.extractXmlBoolValue(elem, 'IsDefault'),
      priority: _s.extractXmlStringValue(elem, 'Priority'),
      ruleArn: _s.extractXmlStringValue(elem, 'RuleArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final conditions = this.conditions;
    final isDefault = this.isDefault;
    final priority = this.priority;
    final ruleArn = this.ruleArn;
    return {
      if (actions != null) 'Actions': actions,
      if (conditions != null) 'Conditions': conditions,
      if (isDefault != null) 'IsDefault': isDefault,
      if (priority != null) 'Priority': priority,
      if (ruleArn != null) 'RuleArn': ruleArn,
    };
  }
}

/// Information about a condition for a rule.
///
/// Each rule can optionally include up to one of each of the following
/// conditions: <code>http-request-method</code>, <code>host-header</code>,
/// <code>path-pattern</code>, and <code>source-ip</code>. Each rule can also
/// optionally include one or more of each of the following conditions:
/// <code>http-header</code> and <code>query-string</code>. Note that the value
/// for a condition cannot be empty.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html">Quotas
/// for your Application Load Balancers</a>.
class RuleCondition {
  /// The field in the HTTP request. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>http-header</code>
  /// </li>
  /// <li>
  /// <code>http-request-method</code>
  /// </li>
  /// <li>
  /// <code>host-header</code>
  /// </li>
  /// <li>
  /// <code>path-pattern</code>
  /// </li>
  /// <li>
  /// <code>query-string</code>
  /// </li>
  /// <li>
  /// <code>source-ip</code>
  /// </li>
  /// </ul>
  final String? field;

  /// Information for a host header condition. Specify only when
  /// <code>Field</code> is <code>host-header</code>.
  final HostHeaderConditionConfig? hostHeaderConfig;

  /// Information for an HTTP header condition. Specify only when
  /// <code>Field</code> is <code>http-header</code>.
  final HttpHeaderConditionConfig? httpHeaderConfig;

  /// Information for an HTTP method condition. Specify only when
  /// <code>Field</code> is <code>http-request-method</code>.
  final HttpRequestMethodConditionConfig? httpRequestMethodConfig;

  /// Information for a path pattern condition. Specify only when
  /// <code>Field</code> is <code>path-pattern</code>.
  final PathPatternConditionConfig? pathPatternConfig;

  /// Information for a query string condition. Specify only when
  /// <code>Field</code> is <code>query-string</code>.
  final QueryStringConditionConfig? queryStringConfig;

  /// Information for a source IP condition. Specify only when <code>Field</code>
  /// is <code>source-ip</code>.
  final SourceIpConditionConfig? sourceIpConfig;

  /// The condition value. Specify only when <code>Field</code> is
  /// <code>host-header</code> or <code>path-pattern</code>. Alternatively, to
  /// specify multiple host names or multiple path patterns, use
  /// <code>HostHeaderConfig</code> or <code>PathPatternConfig</code>.
  ///
  /// If <code>Field</code> is <code>host-header</code> and you are not using
  /// <code>HostHeaderConfig</code>, you can specify a single host name (for
  /// example, my.example.com) in <code>Values</code>. A host name is case
  /// insensitive, can be up to 128 characters in length, and can contain any of
  /// the following characters.
  ///
  /// <ul>
  /// <li>
  /// A-Z, a-z, 0-9
  /// </li>
  /// <li>
  /// - .
  /// </li>
  /// <li>
  /// * (matches 0 or more characters)
  /// </li>
  /// <li>
  /// ? (matches exactly 1 character)
  /// </li>
  /// </ul>
  /// If <code>Field</code> is <code>path-pattern</code> and you are not using
  /// <code>PathPatternConfig</code>, you can specify a single path pattern (for
  /// example, /img/*) in <code>Values</code>. A path pattern is case-sensitive,
  /// can be up to 128 characters in length, and can contain any of the following
  /// characters.
  ///
  /// <ul>
  /// <li>
  /// A-Z, a-z, 0-9
  /// </li>
  /// <li>
  /// _ - . $ / ~ " ' @ : +
  /// </li>
  /// <li>
  /// &amp; (using &amp;amp;)
  /// </li>
  /// <li>
  /// * (matches 0 or more characters)
  /// </li>
  /// <li>
  /// ? (matches exactly 1 character)
  /// </li>
  /// </ul>
  final List<String>? values;

  RuleCondition({
    this.field,
    this.hostHeaderConfig,
    this.httpHeaderConfig,
    this.httpRequestMethodConfig,
    this.pathPatternConfig,
    this.queryStringConfig,
    this.sourceIpConfig,
    this.values,
  });
  factory RuleCondition.fromXml(_s.XmlElement elem) {
    return RuleCondition(
      field: _s.extractXmlStringValue(elem, 'Field'),
      hostHeaderConfig: _s
          .extractXmlChild(elem, 'HostHeaderConfig')
          ?.let(HostHeaderConditionConfig.fromXml),
      httpHeaderConfig: _s
          .extractXmlChild(elem, 'HttpHeaderConfig')
          ?.let(HttpHeaderConditionConfig.fromXml),
      httpRequestMethodConfig: _s
          .extractXmlChild(elem, 'HttpRequestMethodConfig')
          ?.let(HttpRequestMethodConditionConfig.fromXml),
      pathPatternConfig: _s
          .extractXmlChild(elem, 'PathPatternConfig')
          ?.let(PathPatternConditionConfig.fromXml),
      queryStringConfig: _s
          .extractXmlChild(elem, 'QueryStringConfig')
          ?.let(QueryStringConditionConfig.fromXml),
      sourceIpConfig: _s
          .extractXmlChild(elem, 'SourceIpConfig')
          ?.let(SourceIpConditionConfig.fromXml),
      values: _s
          .extractXmlChild(elem, 'Values')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final field = this.field;
    final hostHeaderConfig = this.hostHeaderConfig;
    final httpHeaderConfig = this.httpHeaderConfig;
    final httpRequestMethodConfig = this.httpRequestMethodConfig;
    final pathPatternConfig = this.pathPatternConfig;
    final queryStringConfig = this.queryStringConfig;
    final sourceIpConfig = this.sourceIpConfig;
    final values = this.values;
    return {
      if (field != null) 'Field': field,
      if (hostHeaderConfig != null) 'HostHeaderConfig': hostHeaderConfig,
      if (httpHeaderConfig != null) 'HttpHeaderConfig': httpHeaderConfig,
      if (httpRequestMethodConfig != null)
        'HttpRequestMethodConfig': httpRequestMethodConfig,
      if (pathPatternConfig != null) 'PathPatternConfig': pathPatternConfig,
      if (queryStringConfig != null) 'QueryStringConfig': queryStringConfig,
      if (sourceIpConfig != null) 'SourceIpConfig': sourceIpConfig,
      if (values != null) 'Values': values,
    };
  }
}

/// Information about the priorities for the rules for a listener.
class RulePriorityPair {
  /// The rule priority.
  final int? priority;

  /// The Amazon Resource Name (ARN) of the rule.
  final String? ruleArn;

  RulePriorityPair({
    this.priority,
    this.ruleArn,
  });

  Map<String, dynamic> toJson() {
    final priority = this.priority;
    final ruleArn = this.ruleArn;
    return {
      if (priority != null) 'Priority': priority,
      if (ruleArn != null) 'RuleArn': ruleArn,
    };
  }
}

class SetIpAddressTypeOutput {
  /// The IP address type.
  final IpAddressType? ipAddressType;

  SetIpAddressTypeOutput({
    this.ipAddressType,
  });
  factory SetIpAddressTypeOutput.fromXml(_s.XmlElement elem) {
    return SetIpAddressTypeOutput(
      ipAddressType:
          _s.extractXmlStringValue(elem, 'IpAddressType')?.toIpAddressType(),
    );
  }

  Map<String, dynamic> toJson() {
    final ipAddressType = this.ipAddressType;
    return {
      if (ipAddressType != null) 'IpAddressType': ipAddressType.toValue(),
    };
  }
}

class SetRulePrioritiesOutput {
  /// Information about the rules.
  final List<Rule>? rules;

  SetRulePrioritiesOutput({
    this.rules,
  });
  factory SetRulePrioritiesOutput.fromXml(_s.XmlElement elem) {
    return SetRulePrioritiesOutput(
      rules: _s.extractXmlChild(elem, 'Rules')?.let(
          (elem) => elem.findElements('member').map(Rule.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    return {
      if (rules != null) 'Rules': rules,
    };
  }
}

class SetSecurityGroupsOutput {
  /// Indicates whether to evaluate inbound security group rules for traffic sent
  /// to a Network Load Balancer through Amazon Web Services PrivateLink.
  final EnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum?
      enforceSecurityGroupInboundRulesOnPrivateLinkTraffic;

  /// The IDs of the security groups associated with the load balancer.
  final List<String>? securityGroupIds;

  SetSecurityGroupsOutput({
    this.enforceSecurityGroupInboundRulesOnPrivateLinkTraffic,
    this.securityGroupIds,
  });
  factory SetSecurityGroupsOutput.fromXml(_s.XmlElement elem) {
    return SetSecurityGroupsOutput(
      enforceSecurityGroupInboundRulesOnPrivateLinkTraffic: _s
          .extractXmlStringValue(
              elem, 'EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic')
          ?.toEnforceSecurityGroupInboundRulesOnPrivateLinkTrafficEnum(),
      securityGroupIds: _s
          .extractXmlChild(elem, 'SecurityGroupIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final enforceSecurityGroupInboundRulesOnPrivateLinkTraffic =
        this.enforceSecurityGroupInboundRulesOnPrivateLinkTraffic;
    final securityGroupIds = this.securityGroupIds;
    return {
      if (enforceSecurityGroupInboundRulesOnPrivateLinkTraffic != null)
        'EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic':
            enforceSecurityGroupInboundRulesOnPrivateLinkTraffic.toValue(),
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
    };
  }
}

class SetSubnetsOutput {
  /// Information about the subnets.
  final List<AvailabilityZone>? availabilityZones;

  /// [Application Load Balancers] The IP address type.
  ///
  /// [Network Load Balancers] The IP address type.
  ///
  /// [Gateway Load Balancers] The IP address type.
  final IpAddressType? ipAddressType;

  SetSubnetsOutput({
    this.availabilityZones,
    this.ipAddressType,
  });
  factory SetSubnetsOutput.fromXml(_s.XmlElement elem) {
    return SetSubnetsOutput(
      availabilityZones: _s.extractXmlChild(elem, 'AvailabilityZones')?.let(
          (elem) => elem
              .findElements('member')
              .map(AvailabilityZone.fromXml)
              .toList()),
      ipAddressType:
          _s.extractXmlStringValue(elem, 'IpAddressType')?.toIpAddressType(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final ipAddressType = this.ipAddressType;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (ipAddressType != null) 'IpAddressType': ipAddressType.toValue(),
    };
  }
}

/// Information about a source IP condition.
///
/// You can use this condition to route based on the IP address of the source
/// that connects to the load balancer. If a client is behind a proxy, this is
/// the IP address of the proxy not the IP address of the client.
class SourceIpConditionConfig {
  /// The source IP addresses, in CIDR format. You can use both IPv4 and IPv6
  /// addresses. Wildcards are not supported.
  ///
  /// If you specify multiple addresses, the condition is satisfied if the source
  /// IP address of the request matches one of the CIDR blocks. This condition is
  /// not satisfied by the addresses in the X-Forwarded-For header. To search for
  /// addresses in the X-Forwarded-For header, use
  /// <a>HttpHeaderConditionConfig</a>.
  ///
  /// The total number of values must be less than, or equal to five.
  final List<String>? values;

  SourceIpConditionConfig({
    this.values,
  });
  factory SourceIpConditionConfig.fromXml(_s.XmlElement elem) {
    return SourceIpConditionConfig(
      values: _s
          .extractXmlChild(elem, 'Values')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final values = this.values;
    return {
      if (values != null) 'Values': values,
    };
  }
}

/// Information about a policy used for SSL negotiation.
class SslPolicy {
  /// The ciphers.
  final List<Cipher>? ciphers;

  /// The name of the policy.
  final String? name;

  /// The protocols.
  final List<String>? sslProtocols;

  /// The supported load balancers.
  final List<String>? supportedLoadBalancerTypes;

  SslPolicy({
    this.ciphers,
    this.name,
    this.sslProtocols,
    this.supportedLoadBalancerTypes,
  });
  factory SslPolicy.fromXml(_s.XmlElement elem) {
    return SslPolicy(
      ciphers: _s.extractXmlChild(elem, 'Ciphers')?.let(
          (elem) => elem.findElements('member').map(Cipher.fromXml).toList()),
      name: _s.extractXmlStringValue(elem, 'Name'),
      sslProtocols: _s
          .extractXmlChild(elem, 'SslProtocols')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      supportedLoadBalancerTypes: _s
          .extractXmlChild(elem, 'SupportedLoadBalancerTypes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final ciphers = this.ciphers;
    final name = this.name;
    final sslProtocols = this.sslProtocols;
    final supportedLoadBalancerTypes = this.supportedLoadBalancerTypes;
    return {
      if (ciphers != null) 'Ciphers': ciphers,
      if (name != null) 'Name': name,
      if (sslProtocols != null) 'SslProtocols': sslProtocols,
      if (supportedLoadBalancerTypes != null)
        'SupportedLoadBalancerTypes': supportedLoadBalancerTypes,
    };
  }
}

/// Information about a subnet mapping.
class SubnetMapping {
  /// [Network Load Balancers] The allocation ID of the Elastic IP address for an
  /// internet-facing load balancer.
  final String? allocationId;

  /// [Network Load Balancers] The IPv6 address.
  final String? iPv6Address;

  /// [Network Load Balancers] The private IPv4 address for an internal load
  /// balancer.
  final String? privateIPv4Address;

  /// The ID of the subnet.
  final String? subnetId;

  SubnetMapping({
    this.allocationId,
    this.iPv6Address,
    this.privateIPv4Address,
    this.subnetId,
  });

  Map<String, dynamic> toJson() {
    final allocationId = this.allocationId;
    final iPv6Address = this.iPv6Address;
    final privateIPv4Address = this.privateIPv4Address;
    final subnetId = this.subnetId;
    return {
      if (allocationId != null) 'AllocationId': allocationId,
      if (iPv6Address != null) 'IPv6Address': iPv6Address,
      if (privateIPv4Address != null) 'PrivateIPv4Address': privateIPv4Address,
      if (subnetId != null) 'SubnetId': subnetId,
    };
  }
}

/// Information about a tag.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String? value;

  Tag({
    required this.key,
    this.value,
  });
  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key')!,
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// The tags associated with a resource.
class TagDescription {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? resourceArn;

  /// Information about the tags.
  final List<Tag>? tags;

  TagDescription({
    this.resourceArn,
    this.tags,
  });
  factory TagDescription.fromXml(_s.XmlElement elem) {
    return TagDescription(
      resourceArn: _s.extractXmlStringValue(elem, 'ResourceArn'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final tags = this.tags;
    return {
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Information about a target.
class TargetDescription {
  /// The ID of the target. If the target type of the target group is
  /// <code>instance</code>, specify an instance ID. If the target type is
  /// <code>ip</code>, specify an IP address. If the target type is
  /// <code>lambda</code>, specify the ARN of the Lambda function. If the target
  /// type is <code>alb</code>, specify the ARN of the Application Load Balancer
  /// target.
  final String id;

  /// An Availability Zone or <code>all</code>. This determines whether the target
  /// receives traffic from the load balancer nodes in the specified Availability
  /// Zone or from all enabled Availability Zones for the load balancer.
  ///
  /// For Application Load Balancer target groups, the specified Availability Zone
  /// value is only applicable when cross-zone load balancing is off. Otherwise
  /// the parameter is ignored and treated as <code>all</code>.
  ///
  /// This parameter is not supported if the target type of the target group is
  /// <code>instance</code> or <code>alb</code>.
  ///
  /// If the target type is <code>ip</code> and the IP address is in a subnet of
  /// the VPC for the target group, the Availability Zone is automatically
  /// detected and this parameter is optional. If the IP address is outside the
  /// VPC, this parameter is required.
  ///
  /// For Application Load Balancer target groups with cross-zone load balancing
  /// off, if the target type is <code>ip</code> and the IP address is outside of
  /// the VPC for the target group, this should be an Availability Zone inside the
  /// VPC for the target group.
  ///
  /// If the target type is <code>lambda</code>, this parameter is optional and
  /// the only supported value is <code>all</code>.
  final String? availabilityZone;

  /// The port on which the target is listening. If the target group protocol is
  /// GENEVE, the supported port is 6081. If the target type is <code>alb</code>,
  /// the targeted Application Load Balancer must have at least one listener whose
  /// port matches the target group port. This parameter is not used if the target
  /// is a Lambda function.
  final int? port;

  TargetDescription({
    required this.id,
    this.availabilityZone,
    this.port,
  });
  factory TargetDescription.fromXml(_s.XmlElement elem) {
    return TargetDescription(
      id: _s.extractXmlStringValue(elem, 'Id')!,
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      port: _s.extractXmlIntValue(elem, 'Port'),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final availabilityZone = this.availabilityZone;
    final port = this.port;
    return {
      'Id': id,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (port != null) 'Port': port,
    };
  }
}

/// Information about a target group.
class TargetGroup {
  /// Indicates whether health checks are enabled.
  final bool? healthCheckEnabled;

  /// The approximate amount of time, in seconds, between health checks of an
  /// individual target.
  final int? healthCheckIntervalSeconds;

  /// The destination for health checks on the targets.
  final String? healthCheckPath;

  /// The port to use to connect with the target.
  final String? healthCheckPort;

  /// The protocol to use to connect with the target. The GENEVE, TLS, UDP, and
  /// TCP_UDP protocols are not supported for health checks.
  final ProtocolEnum? healthCheckProtocol;

  /// The amount of time, in seconds, during which no response means a failed
  /// health check.
  final int? healthCheckTimeoutSeconds;

  /// The number of consecutive health checks successes required before
  /// considering an unhealthy target healthy.
  final int? healthyThresholdCount;

  /// The type of IP address used for this target group. The possible values are
  /// <code>ipv4</code> and <code>ipv6</code>. This is an optional parameter. If
  /// not specified, the IP address type defaults to <code>ipv4</code>.
  final TargetGroupIpAddressTypeEnum? ipAddressType;

  /// The Amazon Resource Name (ARN) of the load balancer that routes traffic to
  /// this target group. You can use each target group with only one load
  /// balancer.
  final List<String>? loadBalancerArns;

  /// The HTTP or gRPC codes to use when checking for a successful response from a
  /// target.
  final Matcher? matcher;

  /// The port on which the targets are listening. This parameter is not used if
  /// the target is a Lambda function.
  final int? port;

  /// The protocol to use for routing traffic to the targets.
  final ProtocolEnum? protocol;

  /// [HTTP/HTTPS protocol] The protocol version. The possible values are
  /// <code>GRPC</code>, <code>HTTP1</code>, and <code>HTTP2</code>.
  final String? protocolVersion;

  /// The Amazon Resource Name (ARN) of the target group.
  final String? targetGroupArn;

  /// The name of the target group.
  final String? targetGroupName;

  /// The type of target that you must specify when registering targets with this
  /// target group. The possible values are <code>instance</code> (register
  /// targets by instance ID), <code>ip</code> (register targets by IP address),
  /// <code>lambda</code> (register a single Lambda function as a target), or
  /// <code>alb</code> (register a single Application Load Balancer as a target).
  final TargetTypeEnum? targetType;

  /// The number of consecutive health check failures required before considering
  /// the target unhealthy.
  final int? unhealthyThresholdCount;

  /// The ID of the VPC for the targets.
  final String? vpcId;

  TargetGroup({
    this.healthCheckEnabled,
    this.healthCheckIntervalSeconds,
    this.healthCheckPath,
    this.healthCheckPort,
    this.healthCheckProtocol,
    this.healthCheckTimeoutSeconds,
    this.healthyThresholdCount,
    this.ipAddressType,
    this.loadBalancerArns,
    this.matcher,
    this.port,
    this.protocol,
    this.protocolVersion,
    this.targetGroupArn,
    this.targetGroupName,
    this.targetType,
    this.unhealthyThresholdCount,
    this.vpcId,
  });
  factory TargetGroup.fromXml(_s.XmlElement elem) {
    return TargetGroup(
      healthCheckEnabled: _s.extractXmlBoolValue(elem, 'HealthCheckEnabled'),
      healthCheckIntervalSeconds:
          _s.extractXmlIntValue(elem, 'HealthCheckIntervalSeconds'),
      healthCheckPath: _s.extractXmlStringValue(elem, 'HealthCheckPath'),
      healthCheckPort: _s.extractXmlStringValue(elem, 'HealthCheckPort'),
      healthCheckProtocol: _s
          .extractXmlStringValue(elem, 'HealthCheckProtocol')
          ?.toProtocolEnum(),
      healthCheckTimeoutSeconds:
          _s.extractXmlIntValue(elem, 'HealthCheckTimeoutSeconds'),
      healthyThresholdCount:
          _s.extractXmlIntValue(elem, 'HealthyThresholdCount'),
      ipAddressType: _s
          .extractXmlStringValue(elem, 'IpAddressType')
          ?.toTargetGroupIpAddressTypeEnum(),
      loadBalancerArns: _s
          .extractXmlChild(elem, 'LoadBalancerArns')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      matcher: _s.extractXmlChild(elem, 'Matcher')?.let(Matcher.fromXml),
      port: _s.extractXmlIntValue(elem, 'Port'),
      protocol: _s.extractXmlStringValue(elem, 'Protocol')?.toProtocolEnum(),
      protocolVersion: _s.extractXmlStringValue(elem, 'ProtocolVersion'),
      targetGroupArn: _s.extractXmlStringValue(elem, 'TargetGroupArn'),
      targetGroupName: _s.extractXmlStringValue(elem, 'TargetGroupName'),
      targetType:
          _s.extractXmlStringValue(elem, 'TargetType')?.toTargetTypeEnum(),
      unhealthyThresholdCount:
          _s.extractXmlIntValue(elem, 'UnhealthyThresholdCount'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }

  Map<String, dynamic> toJson() {
    final healthCheckEnabled = this.healthCheckEnabled;
    final healthCheckIntervalSeconds = this.healthCheckIntervalSeconds;
    final healthCheckPath = this.healthCheckPath;
    final healthCheckPort = this.healthCheckPort;
    final healthCheckProtocol = this.healthCheckProtocol;
    final healthCheckTimeoutSeconds = this.healthCheckTimeoutSeconds;
    final healthyThresholdCount = this.healthyThresholdCount;
    final ipAddressType = this.ipAddressType;
    final loadBalancerArns = this.loadBalancerArns;
    final matcher = this.matcher;
    final port = this.port;
    final protocol = this.protocol;
    final protocolVersion = this.protocolVersion;
    final targetGroupArn = this.targetGroupArn;
    final targetGroupName = this.targetGroupName;
    final targetType = this.targetType;
    final unhealthyThresholdCount = this.unhealthyThresholdCount;
    final vpcId = this.vpcId;
    return {
      if (healthCheckEnabled != null) 'HealthCheckEnabled': healthCheckEnabled,
      if (healthCheckIntervalSeconds != null)
        'HealthCheckIntervalSeconds': healthCheckIntervalSeconds,
      if (healthCheckPath != null) 'HealthCheckPath': healthCheckPath,
      if (healthCheckPort != null) 'HealthCheckPort': healthCheckPort,
      if (healthCheckProtocol != null)
        'HealthCheckProtocol': healthCheckProtocol.toValue(),
      if (healthCheckTimeoutSeconds != null)
        'HealthCheckTimeoutSeconds': healthCheckTimeoutSeconds,
      if (healthyThresholdCount != null)
        'HealthyThresholdCount': healthyThresholdCount,
      if (ipAddressType != null) 'IpAddressType': ipAddressType.toValue(),
      if (loadBalancerArns != null) 'LoadBalancerArns': loadBalancerArns,
      if (matcher != null) 'Matcher': matcher,
      if (port != null) 'Port': port,
      if (protocol != null) 'Protocol': protocol.toValue(),
      if (protocolVersion != null) 'ProtocolVersion': protocolVersion,
      if (targetGroupArn != null) 'TargetGroupArn': targetGroupArn,
      if (targetGroupName != null) 'TargetGroupName': targetGroupName,
      if (targetType != null) 'TargetType': targetType.toValue(),
      if (unhealthyThresholdCount != null)
        'UnhealthyThresholdCount': unhealthyThresholdCount,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Information about a target group attribute.
class TargetGroupAttribute {
  /// The name of the attribute.
  ///
  /// The following attributes are supported by all load balancers:
  ///
  /// <ul>
  /// <li>
  /// <code>deregistration_delay.timeout_seconds</code> - The amount of time, in
  /// seconds, for Elastic Load Balancing to wait before changing the state of a
  /// deregistering target from <code>draining</code> to <code>unused</code>. The
  /// range is 0-3600 seconds. The default value is 300 seconds. If the target is
  /// a Lambda function, this attribute is not supported.
  /// </li>
  /// <li>
  /// <code>stickiness.enabled</code> - Indicates whether target stickiness is
  /// enabled. The value is <code>true</code> or <code>false</code>. The default
  /// is <code>false</code>.
  /// </li>
  /// <li>
  /// <code>stickiness.type</code> - Indicates the type of stickiness. The
  /// possible values are:
  ///
  /// <ul>
  /// <li>
  /// <code>lb_cookie</code> and <code>app_cookie</code> for Application Load
  /// Balancers.
  /// </li>
  /// <li>
  /// <code>source_ip</code> for Network Load Balancers.
  /// </li>
  /// <li>
  /// <code>source_ip_dest_ip</code> and <code>source_ip_dest_ip_proto</code> for
  /// Gateway Load Balancers.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// The following attributes are supported by Application Load Balancers and
  /// Network Load Balancers:
  ///
  /// <ul>
  /// <li>
  /// <code>load_balancing.cross_zone.enabled</code> - Indicates whether cross
  /// zone load balancing is enabled. The value is <code>true</code>,
  /// <code>false</code> or <code>use_load_balancer_configuration</code>. The
  /// default is <code>use_load_balancer_configuration</code>.
  /// </li>
  /// <li>
  /// <code>target_group_health.dns_failover.minimum_healthy_targets.count</code>
  /// - The minimum number of targets that must be healthy. If the number of
  /// healthy targets is below this value, mark the zone as unhealthy in DNS, so
  /// that traffic is routed only to healthy zones. The possible values are
  /// <code>off</code> or an integer from 1 to the maximum number of targets. The
  /// default is <code>off</code>.
  /// </li>
  /// <li>
  /// <code>target_group_health.dns_failover.minimum_healthy_targets.percentage</code>
  /// - The minimum percentage of targets that must be healthy. If the percentage
  /// of healthy targets is below this value, mark the zone as unhealthy in DNS,
  /// so that traffic is routed only to healthy zones. The possible values are
  /// <code>off</code> or an integer from 1 to 100. The default is
  /// <code>off</code>.
  /// </li>
  /// <li>
  /// <code>target_group_health.unhealthy_state_routing.minimum_healthy_targets.count</code>
  /// - The minimum number of targets that must be healthy. If the number of
  /// healthy targets is below this value, send traffic to all targets, including
  /// unhealthy targets. The possible values are 1 to the maximum number of
  /// targets. The default is 1.
  /// </li>
  /// <li>
  /// <code>target_group_health.unhealthy_state_routing.minimum_healthy_targets.percentage</code>
  /// - The minimum percentage of targets that must be healthy. If the percentage
  /// of healthy targets is below this value, send traffic to all targets,
  /// including unhealthy targets. The possible values are <code>off</code> or an
  /// integer from 1 to 100. The default is <code>off</code>.
  /// </li>
  /// </ul>
  /// The following attributes are supported only if the load balancer is an
  /// Application Load Balancer and the target is an instance or an IP address:
  ///
  /// <ul>
  /// <li>
  /// <code>load_balancing.algorithm.type</code> - The load balancing algorithm
  /// determines how the load balancer selects targets when routing requests. The
  /// value is <code>round_robin</code>, <code>least_outstanding_requests</code>,
  /// or <code>weighted_random</code>. The default is <code>round_robin</code>.
  /// </li>
  /// <li>
  /// <code>load_balancing.algorithm.anomaly_mitigation</code> - Only available
  /// when <code>load_balancing.algorithm.type</code> is
  /// <code>weighted_random</code>. Indicates whether anomaly mitigation is
  /// enabled. The value is <code>on</code> or <code>off</code>. The default is
  /// <code>off</code>.
  /// </li>
  /// <li>
  /// <code>slow_start.duration_seconds</code> - The time period, in seconds,
  /// during which a newly registered target receives an increasing share of the
  /// traffic to the target group. After this time period ends, the target
  /// receives its full share of traffic. The range is 30-900 seconds (15
  /// minutes). The default is 0 seconds (disabled).
  /// </li>
  /// <li>
  /// <code>stickiness.app_cookie.cookie_name</code> - Indicates the name of the
  /// application-based cookie. Names that start with the following prefixes are
  /// not allowed: <code>AWSALB</code>, <code>AWSALBAPP</code>, and
  /// <code>AWSALBTG</code>; they're reserved for use by the load balancer.
  /// </li>
  /// <li>
  /// <code>stickiness.app_cookie.duration_seconds</code> - The time period, in
  /// seconds, during which requests from a client should be routed to the same
  /// target. After this time period expires, the application-based cookie is
  /// considered stale. The range is 1 second to 1 week (604800 seconds). The
  /// default value is 1 day (86400 seconds).
  /// </li>
  /// <li>
  /// <code>stickiness.lb_cookie.duration_seconds</code> - The time period, in
  /// seconds, during which requests from a client should be routed to the same
  /// target. After this time period expires, the load balancer-generated cookie
  /// is considered stale. The range is 1 second to 1 week (604800 seconds). The
  /// default value is 1 day (86400 seconds).
  /// </li>
  /// </ul>
  /// The following attribute is supported only if the load balancer is an
  /// Application Load Balancer and the target is a Lambda function:
  ///
  /// <ul>
  /// <li>
  /// <code>lambda.multi_value_headers.enabled</code> - Indicates whether the
  /// request and response headers that are exchanged between the load balancer
  /// and the Lambda function include arrays of values or strings. The value is
  /// <code>true</code> or <code>false</code>. The default is <code>false</code>.
  /// If the value is <code>false</code> and the request contains a duplicate
  /// header field name or query parameter key, the load balancer uses the last
  /// value sent by the client.
  /// </li>
  /// </ul>
  /// The following attributes are supported only by Network Load Balancers:
  ///
  /// <ul>
  /// <li>
  /// <code>deregistration_delay.connection_termination.enabled</code> - Indicates
  /// whether the load balancer terminates connections at the end of the
  /// deregistration timeout. The value is <code>true</code> or
  /// <code>false</code>. For new UDP/TCP_UDP target groups the default is
  /// <code>true</code>. Otherwise, the default is <code>false</code>.
  /// </li>
  /// <li>
  /// <code>preserve_client_ip.enabled</code> - Indicates whether client IP
  /// preservation is enabled. The value is <code>true</code> or
  /// <code>false</code>. The default is disabled if the target group type is IP
  /// address and the target group protocol is TCP or TLS. Otherwise, the default
  /// is enabled. Client IP preservation cannot be disabled for UDP and TCP_UDP
  /// target groups.
  /// </li>
  /// <li>
  /// <code>proxy_protocol_v2.enabled</code> - Indicates whether Proxy Protocol
  /// version 2 is enabled. The value is <code>true</code> or <code>false</code>.
  /// The default is <code>false</code>.
  /// </li>
  /// <li>
  /// <code>target_health_state.unhealthy.connection_termination.enabled</code> -
  /// Indicates whether the load balancer terminates connections to unhealthy
  /// targets. The value is <code>true</code> or <code>false</code>. The default
  /// is <code>true</code>.
  /// </li>
  /// <li>
  /// <code>target_health_state.unhealthy.draining_interval_seconds</code> - The
  /// amount of time for Elastic Load Balancing to wait before changing the state
  /// of an unhealthy target from <code>unhealthy.draining</code> to
  /// <code>unhealthy</code>. The range is 0-360000 seconds. The default value is
  /// 0 seconds.
  ///
  /// Note: This attribute can only be configured when
  /// <code>target_health_state.unhealthy.connection_termination.enabled</code> is
  /// <code>false</code>.
  /// </li>
  /// </ul>
  /// The following attributes are supported only by Gateway Load Balancers:
  ///
  /// <ul>
  /// <li>
  /// <code>target_failover.on_deregistration</code> - Indicates how the Gateway
  /// Load Balancer handles existing flows when a target is deregistered. The
  /// possible values are <code>rebalance</code> and <code>no_rebalance</code>.
  /// The default is <code>no_rebalance</code>. The two attributes
  /// (<code>target_failover.on_deregistration</code> and
  /// <code>target_failover.on_unhealthy</code>) can't be set independently. The
  /// value you set for both attributes must be the same.
  /// </li>
  /// <li>
  /// <code>target_failover.on_unhealthy</code> - Indicates how the Gateway Load
  /// Balancer handles existing flows when a target is unhealthy. The possible
  /// values are <code>rebalance</code> and <code>no_rebalance</code>. The default
  /// is <code>no_rebalance</code>. The two attributes
  /// (<code>target_failover.on_deregistration</code> and
  /// <code>target_failover.on_unhealthy</code>) cannot be set independently. The
  /// value you set for both attributes must be the same.
  /// </li>
  /// </ul>
  final String? key;

  /// The value of the attribute.
  final String? value;

  TargetGroupAttribute({
    this.key,
    this.value,
  });
  factory TargetGroupAttribute.fromXml(_s.XmlElement elem) {
    return TargetGroupAttribute(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

enum TargetGroupIpAddressTypeEnum {
  ipv4,
  ipv6,
}

extension TargetGroupIpAddressTypeEnumValueExtension
    on TargetGroupIpAddressTypeEnum {
  String toValue() {
    switch (this) {
      case TargetGroupIpAddressTypeEnum.ipv4:
        return 'ipv4';
      case TargetGroupIpAddressTypeEnum.ipv6:
        return 'ipv6';
    }
  }
}

extension TargetGroupIpAddressTypeEnumFromString on String {
  TargetGroupIpAddressTypeEnum toTargetGroupIpAddressTypeEnum() {
    switch (this) {
      case 'ipv4':
        return TargetGroupIpAddressTypeEnum.ipv4;
      case 'ipv6':
        return TargetGroupIpAddressTypeEnum.ipv6;
    }
    throw Exception('$this is not known in enum TargetGroupIpAddressTypeEnum');
  }
}

/// Information about the target group stickiness for a rule.
class TargetGroupStickinessConfig {
  /// The time period, in seconds, during which requests from a client should be
  /// routed to the same target group. The range is 1-604800 seconds (7 days).
  final int? durationSeconds;

  /// Indicates whether target group stickiness is enabled.
  final bool? enabled;

  TargetGroupStickinessConfig({
    this.durationSeconds,
    this.enabled,
  });
  factory TargetGroupStickinessConfig.fromXml(_s.XmlElement elem) {
    return TargetGroupStickinessConfig(
      durationSeconds: _s.extractXmlIntValue(elem, 'DurationSeconds'),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
    );
  }

  Map<String, dynamic> toJson() {
    final durationSeconds = this.durationSeconds;
    final enabled = this.enabled;
    return {
      if (durationSeconds != null) 'DurationSeconds': durationSeconds,
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// Information about how traffic will be distributed between multiple target
/// groups in a forward rule.
class TargetGroupTuple {
  /// The Amazon Resource Name (ARN) of the target group.
  final String? targetGroupArn;

  /// The weight. The range is 0 to 999.
  final int? weight;

  TargetGroupTuple({
    this.targetGroupArn,
    this.weight,
  });
  factory TargetGroupTuple.fromXml(_s.XmlElement elem) {
    return TargetGroupTuple(
      targetGroupArn: _s.extractXmlStringValue(elem, 'TargetGroupArn'),
      weight: _s.extractXmlIntValue(elem, 'Weight'),
    );
  }

  Map<String, dynamic> toJson() {
    final targetGroupArn = this.targetGroupArn;
    final weight = this.weight;
    return {
      if (targetGroupArn != null) 'TargetGroupArn': targetGroupArn,
      if (weight != null) 'Weight': weight,
    };
  }
}

/// Information about the current health of a target.
class TargetHealth {
  /// A description of the target health that provides additional details. If the
  /// state is <code>healthy</code>, a description is not provided.
  final String? description;

  /// The reason code.
  ///
  /// If the target state is <code>healthy</code>, a reason code is not provided.
  ///
  /// If the target state is <code>initial</code>, the reason code can be one of
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>Elb.RegistrationInProgress</code> - The target is in the process of
  /// being registered with the load balancer.
  /// </li>
  /// <li>
  /// <code>Elb.InitialHealthChecking</code> - The load balancer is still sending
  /// the target the minimum number of health checks required to determine its
  /// health status.
  /// </li>
  /// </ul>
  /// If the target state is <code>unhealthy</code>, the reason code can be one of
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>Target.ResponseCodeMismatch</code> - The health checks did not return
  /// an expected HTTP code. Applies only to Application Load Balancers and
  /// Gateway Load Balancers.
  /// </li>
  /// <li>
  /// <code>Target.Timeout</code> - The health check requests timed out. Applies
  /// only to Application Load Balancers and Gateway Load Balancers.
  /// </li>
  /// <li>
  /// <code>Target.FailedHealthChecks</code> - The load balancer received an error
  /// while establishing a connection to the target or the target response was
  /// malformed.
  /// </li>
  /// <li>
  /// <code>Elb.InternalError</code> - The health checks failed due to an internal
  /// error. Applies only to Application Load Balancers.
  /// </li>
  /// </ul>
  /// If the target state is <code>unused</code>, the reason code can be one of
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>Target.NotRegistered</code> - The target is not registered with the
  /// target group.
  /// </li>
  /// <li>
  /// <code>Target.NotInUse</code> - The target group is not used by any load
  /// balancer or the target is in an Availability Zone that is not enabled for
  /// its load balancer.
  /// </li>
  /// <li>
  /// <code>Target.InvalidState</code> - The target is in the stopped or
  /// terminated state.
  /// </li>
  /// <li>
  /// <code>Target.IpUnusable</code> - The target IP address is reserved for use
  /// by a load balancer.
  /// </li>
  /// </ul>
  /// If the target state is <code>draining</code>, the reason code can be the
  /// following value:
  ///
  /// <ul>
  /// <li>
  /// <code>Target.DeregistrationInProgress</code> - The target is in the process
  /// of being deregistered and the deregistration delay period has not expired.
  /// </li>
  /// </ul>
  /// If the target state is <code>unavailable</code>, the reason code can be the
  /// following value:
  ///
  /// <ul>
  /// <li>
  /// <code>Target.HealthCheckDisabled</code> - Health checks are disabled for the
  /// target group. Applies only to Application Load Balancers.
  /// </li>
  /// <li>
  /// <code>Elb.InternalError</code> - Target health is unavailable due to an
  /// internal error. Applies only to Network Load Balancers.
  /// </li>
  /// </ul>
  final TargetHealthReasonEnum? reason;

  /// The state of the target.
  final TargetHealthStateEnum? state;

  TargetHealth({
    this.description,
    this.reason,
    this.state,
  });
  factory TargetHealth.fromXml(_s.XmlElement elem) {
    return TargetHealth(
      description: _s.extractXmlStringValue(elem, 'Description'),
      reason:
          _s.extractXmlStringValue(elem, 'Reason')?.toTargetHealthReasonEnum(),
      state: _s.extractXmlStringValue(elem, 'State')?.toTargetHealthStateEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final reason = this.reason;
    final state = this.state;
    return {
      if (description != null) 'Description': description,
      if (reason != null) 'Reason': reason.toValue(),
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// Information about the health of a target.
class TargetHealthDescription {
  /// The anomaly detection result for the target.
  ///
  /// If no anomalies were detected, the result is <code>normal</code>.
  ///
  /// If anomalies were detected, the result is <code>anomalous</code>.
  final AnomalyDetection? anomalyDetection;

  /// The port to use to connect with the target.
  final String? healthCheckPort;

  /// The description of the target.
  final TargetDescription? target;

  /// The health information for the target.
  final TargetHealth? targetHealth;

  TargetHealthDescription({
    this.anomalyDetection,
    this.healthCheckPort,
    this.target,
    this.targetHealth,
  });
  factory TargetHealthDescription.fromXml(_s.XmlElement elem) {
    return TargetHealthDescription(
      anomalyDetection: _s
          .extractXmlChild(elem, 'AnomalyDetection')
          ?.let(AnomalyDetection.fromXml),
      healthCheckPort: _s.extractXmlStringValue(elem, 'HealthCheckPort'),
      target:
          _s.extractXmlChild(elem, 'Target')?.let(TargetDescription.fromXml),
      targetHealth:
          _s.extractXmlChild(elem, 'TargetHealth')?.let(TargetHealth.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetection = this.anomalyDetection;
    final healthCheckPort = this.healthCheckPort;
    final target = this.target;
    final targetHealth = this.targetHealth;
    return {
      if (anomalyDetection != null) 'AnomalyDetection': anomalyDetection,
      if (healthCheckPort != null) 'HealthCheckPort': healthCheckPort,
      if (target != null) 'Target': target,
      if (targetHealth != null) 'TargetHealth': targetHealth,
    };
  }
}

enum TargetHealthReasonEnum {
  elbRegistrationInProgress,
  elbInitialHealthChecking,
  targetResponseCodeMismatch,
  targetTimeout,
  targetFailedHealthChecks,
  targetNotRegistered,
  targetNotInUse,
  targetDeregistrationInProgress,
  targetInvalidState,
  targetIpUnusable,
  targetHealthCheckDisabled,
  elbInternalError,
}

extension TargetHealthReasonEnumValueExtension on TargetHealthReasonEnum {
  String toValue() {
    switch (this) {
      case TargetHealthReasonEnum.elbRegistrationInProgress:
        return 'Elb.RegistrationInProgress';
      case TargetHealthReasonEnum.elbInitialHealthChecking:
        return 'Elb.InitialHealthChecking';
      case TargetHealthReasonEnum.targetResponseCodeMismatch:
        return 'Target.ResponseCodeMismatch';
      case TargetHealthReasonEnum.targetTimeout:
        return 'Target.Timeout';
      case TargetHealthReasonEnum.targetFailedHealthChecks:
        return 'Target.FailedHealthChecks';
      case TargetHealthReasonEnum.targetNotRegistered:
        return 'Target.NotRegistered';
      case TargetHealthReasonEnum.targetNotInUse:
        return 'Target.NotInUse';
      case TargetHealthReasonEnum.targetDeregistrationInProgress:
        return 'Target.DeregistrationInProgress';
      case TargetHealthReasonEnum.targetInvalidState:
        return 'Target.InvalidState';
      case TargetHealthReasonEnum.targetIpUnusable:
        return 'Target.IpUnusable';
      case TargetHealthReasonEnum.targetHealthCheckDisabled:
        return 'Target.HealthCheckDisabled';
      case TargetHealthReasonEnum.elbInternalError:
        return 'Elb.InternalError';
    }
  }
}

extension TargetHealthReasonEnumFromString on String {
  TargetHealthReasonEnum toTargetHealthReasonEnum() {
    switch (this) {
      case 'Elb.RegistrationInProgress':
        return TargetHealthReasonEnum.elbRegistrationInProgress;
      case 'Elb.InitialHealthChecking':
        return TargetHealthReasonEnum.elbInitialHealthChecking;
      case 'Target.ResponseCodeMismatch':
        return TargetHealthReasonEnum.targetResponseCodeMismatch;
      case 'Target.Timeout':
        return TargetHealthReasonEnum.targetTimeout;
      case 'Target.FailedHealthChecks':
        return TargetHealthReasonEnum.targetFailedHealthChecks;
      case 'Target.NotRegistered':
        return TargetHealthReasonEnum.targetNotRegistered;
      case 'Target.NotInUse':
        return TargetHealthReasonEnum.targetNotInUse;
      case 'Target.DeregistrationInProgress':
        return TargetHealthReasonEnum.targetDeregistrationInProgress;
      case 'Target.InvalidState':
        return TargetHealthReasonEnum.targetInvalidState;
      case 'Target.IpUnusable':
        return TargetHealthReasonEnum.targetIpUnusable;
      case 'Target.HealthCheckDisabled':
        return TargetHealthReasonEnum.targetHealthCheckDisabled;
      case 'Elb.InternalError':
        return TargetHealthReasonEnum.elbInternalError;
    }
    throw Exception('$this is not known in enum TargetHealthReasonEnum');
  }
}

enum TargetHealthStateEnum {
  initial,
  healthy,
  unhealthy,
  unhealthyDraining,
  unused,
  draining,
  unavailable,
}

extension TargetHealthStateEnumValueExtension on TargetHealthStateEnum {
  String toValue() {
    switch (this) {
      case TargetHealthStateEnum.initial:
        return 'initial';
      case TargetHealthStateEnum.healthy:
        return 'healthy';
      case TargetHealthStateEnum.unhealthy:
        return 'unhealthy';
      case TargetHealthStateEnum.unhealthyDraining:
        return 'unhealthy.draining';
      case TargetHealthStateEnum.unused:
        return 'unused';
      case TargetHealthStateEnum.draining:
        return 'draining';
      case TargetHealthStateEnum.unavailable:
        return 'unavailable';
    }
  }
}

extension TargetHealthStateEnumFromString on String {
  TargetHealthStateEnum toTargetHealthStateEnum() {
    switch (this) {
      case 'initial':
        return TargetHealthStateEnum.initial;
      case 'healthy':
        return TargetHealthStateEnum.healthy;
      case 'unhealthy':
        return TargetHealthStateEnum.unhealthy;
      case 'unhealthy.draining':
        return TargetHealthStateEnum.unhealthyDraining;
      case 'unused':
        return TargetHealthStateEnum.unused;
      case 'draining':
        return TargetHealthStateEnum.draining;
      case 'unavailable':
        return TargetHealthStateEnum.unavailable;
    }
    throw Exception('$this is not known in enum TargetHealthStateEnum');
  }
}

enum TargetTypeEnum {
  instance,
  ip,
  lambda,
  alb,
}

extension TargetTypeEnumValueExtension on TargetTypeEnum {
  String toValue() {
    switch (this) {
      case TargetTypeEnum.instance:
        return 'instance';
      case TargetTypeEnum.ip:
        return 'ip';
      case TargetTypeEnum.lambda:
        return 'lambda';
      case TargetTypeEnum.alb:
        return 'alb';
    }
  }
}

extension TargetTypeEnumFromString on String {
  TargetTypeEnum toTargetTypeEnum() {
    switch (this) {
      case 'instance':
        return TargetTypeEnum.instance;
      case 'ip':
        return TargetTypeEnum.ip;
      case 'lambda':
        return TargetTypeEnum.lambda;
      case 'alb':
        return TargetTypeEnum.alb;
    }
    throw Exception('$this is not known in enum TargetTypeEnum');
  }
}

/// Information about a trust store.
class TrustStore {
  /// The name of the trust store.
  final String? name;

  /// The number of ca certificates in the trust store.
  final int? numberOfCaCertificates;

  /// The current status of the trust store.
  final TrustStoreStatus? status;

  /// The number of revoked certificates in the trust store.
  final int? totalRevokedEntries;

  /// The Amazon Resource Name (ARN) of the trust store.
  final String? trustStoreArn;

  TrustStore({
    this.name,
    this.numberOfCaCertificates,
    this.status,
    this.totalRevokedEntries,
    this.trustStoreArn,
  });
  factory TrustStore.fromXml(_s.XmlElement elem) {
    return TrustStore(
      name: _s.extractXmlStringValue(elem, 'Name'),
      numberOfCaCertificates:
          _s.extractXmlIntValue(elem, 'NumberOfCaCertificates'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toTrustStoreStatus(),
      totalRevokedEntries: _s.extractXmlIntValue(elem, 'TotalRevokedEntries'),
      trustStoreArn: _s.extractXmlStringValue(elem, 'TrustStoreArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final numberOfCaCertificates = this.numberOfCaCertificates;
    final status = this.status;
    final totalRevokedEntries = this.totalRevokedEntries;
    final trustStoreArn = this.trustStoreArn;
    return {
      if (name != null) 'Name': name,
      if (numberOfCaCertificates != null)
        'NumberOfCaCertificates': numberOfCaCertificates,
      if (status != null) 'Status': status.toValue(),
      if (totalRevokedEntries != null)
        'TotalRevokedEntries': totalRevokedEntries,
      if (trustStoreArn != null) 'TrustStoreArn': trustStoreArn,
    };
  }
}

/// Information about the resources a trust store is associated with.
class TrustStoreAssociation {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? resourceArn;

  TrustStoreAssociation({
    this.resourceArn,
  });
  factory TrustStoreAssociation.fromXml(_s.XmlElement elem) {
    return TrustStoreAssociation(
      resourceArn: _s.extractXmlStringValue(elem, 'ResourceArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    return {
      if (resourceArn != null) 'ResourceArn': resourceArn,
    };
  }
}

/// Information about a revocation file in use by a trust store.
class TrustStoreRevocation {
  /// The number of revoked certificates.
  final int? numberOfRevokedEntries;

  /// The revocation ID of the revocation file.
  final int? revocationId;

  /// The type of revocation file.
  final RevocationType? revocationType;

  /// The Amazon Resource Name (ARN) of the trust store.
  final String? trustStoreArn;

  TrustStoreRevocation({
    this.numberOfRevokedEntries,
    this.revocationId,
    this.revocationType,
    this.trustStoreArn,
  });
  factory TrustStoreRevocation.fromXml(_s.XmlElement elem) {
    return TrustStoreRevocation(
      numberOfRevokedEntries:
          _s.extractXmlIntValue(elem, 'NumberOfRevokedEntries'),
      revocationId: _s.extractXmlIntValue(elem, 'RevocationId'),
      revocationType:
          _s.extractXmlStringValue(elem, 'RevocationType')?.toRevocationType(),
      trustStoreArn: _s.extractXmlStringValue(elem, 'TrustStoreArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfRevokedEntries = this.numberOfRevokedEntries;
    final revocationId = this.revocationId;
    final revocationType = this.revocationType;
    final trustStoreArn = this.trustStoreArn;
    return {
      if (numberOfRevokedEntries != null)
        'NumberOfRevokedEntries': numberOfRevokedEntries,
      if (revocationId != null) 'RevocationId': revocationId,
      if (revocationType != null) 'RevocationType': revocationType.toValue(),
      if (trustStoreArn != null) 'TrustStoreArn': trustStoreArn,
    };
  }
}

enum TrustStoreStatus {
  active,
  creating,
}

extension TrustStoreStatusValueExtension on TrustStoreStatus {
  String toValue() {
    switch (this) {
      case TrustStoreStatus.active:
        return 'ACTIVE';
      case TrustStoreStatus.creating:
        return 'CREATING';
    }
  }
}

extension TrustStoreStatusFromString on String {
  TrustStoreStatus toTrustStoreStatus() {
    switch (this) {
      case 'ACTIVE':
        return TrustStoreStatus.active;
      case 'CREATING':
        return TrustStoreStatus.creating;
    }
    throw Exception('$this is not known in enum TrustStoreStatus');
  }
}

class ALPNPolicyNotSupportedException extends _s.GenericAwsException {
  ALPNPolicyNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'ALPNPolicyNotSupportedException',
            message: message);
}

class AllocationIdNotFoundException extends _s.GenericAwsException {
  AllocationIdNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'AllocationIdNotFoundException',
            message: message);
}

class AvailabilityZoneNotSupportedException extends _s.GenericAwsException {
  AvailabilityZoneNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'AvailabilityZoneNotSupportedException',
            message: message);
}

class CaCertificatesBundleNotFoundException extends _s.GenericAwsException {
  CaCertificatesBundleNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'CaCertificatesBundleNotFoundException',
            message: message);
}

class CertificateNotFoundException extends _s.GenericAwsException {
  CertificateNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'CertificateNotFoundException', message: message);
}

class DuplicateListenerException extends _s.GenericAwsException {
  DuplicateListenerException({String? type, String? message})
      : super(type: type, code: 'DuplicateListenerException', message: message);
}

class DuplicateLoadBalancerNameException extends _s.GenericAwsException {
  DuplicateLoadBalancerNameException({String? type, String? message})
      : super(
            type: type,
            code: 'DuplicateLoadBalancerNameException',
            message: message);
}

class DuplicateTagKeysException extends _s.GenericAwsException {
  DuplicateTagKeysException({String? type, String? message})
      : super(type: type, code: 'DuplicateTagKeysException', message: message);
}

class DuplicateTargetGroupNameException extends _s.GenericAwsException {
  DuplicateTargetGroupNameException({String? type, String? message})
      : super(
            type: type,
            code: 'DuplicateTargetGroupNameException',
            message: message);
}

class DuplicateTrustStoreNameException extends _s.GenericAwsException {
  DuplicateTrustStoreNameException({String? type, String? message})
      : super(
            type: type,
            code: 'DuplicateTrustStoreNameException',
            message: message);
}

class HealthUnavailableException extends _s.GenericAwsException {
  HealthUnavailableException({String? type, String? message})
      : super(type: type, code: 'HealthUnavailableException', message: message);
}

class IncompatibleProtocolsException extends _s.GenericAwsException {
  IncompatibleProtocolsException({String? type, String? message})
      : super(
            type: type,
            code: 'IncompatibleProtocolsException',
            message: message);
}

class InvalidCaCertificatesBundleException extends _s.GenericAwsException {
  InvalidCaCertificatesBundleException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCaCertificatesBundleException',
            message: message);
}

class InvalidConfigurationRequestException extends _s.GenericAwsException {
  InvalidConfigurationRequestException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidConfigurationRequestException',
            message: message);
}

class InvalidLoadBalancerActionException extends _s.GenericAwsException {
  InvalidLoadBalancerActionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidLoadBalancerActionException',
            message: message);
}

class InvalidRevocationContentException extends _s.GenericAwsException {
  InvalidRevocationContentException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRevocationContentException',
            message: message);
}

class InvalidSchemeException extends _s.GenericAwsException {
  InvalidSchemeException({String? type, String? message})
      : super(type: type, code: 'InvalidSchemeException', message: message);
}

class InvalidSecurityGroupException extends _s.GenericAwsException {
  InvalidSecurityGroupException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidSecurityGroupException',
            message: message);
}

class InvalidSubnetException extends _s.GenericAwsException {
  InvalidSubnetException({String? type, String? message})
      : super(type: type, code: 'InvalidSubnetException', message: message);
}

class InvalidTargetException extends _s.GenericAwsException {
  InvalidTargetException({String? type, String? message})
      : super(type: type, code: 'InvalidTargetException', message: message);
}

class ListenerNotFoundException extends _s.GenericAwsException {
  ListenerNotFoundException({String? type, String? message})
      : super(type: type, code: 'ListenerNotFoundException', message: message);
}

class LoadBalancerNotFoundException extends _s.GenericAwsException {
  LoadBalancerNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'LoadBalancerNotFoundException',
            message: message);
}

class OperationNotPermittedException extends _s.GenericAwsException {
  OperationNotPermittedException({String? type, String? message})
      : super(
            type: type,
            code: 'OperationNotPermittedException',
            message: message);
}

class PriorityInUseException extends _s.GenericAwsException {
  PriorityInUseException({String? type, String? message})
      : super(type: type, code: 'PriorityInUseException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class RevocationContentNotFoundException extends _s.GenericAwsException {
  RevocationContentNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'RevocationContentNotFoundException',
            message: message);
}

class RevocationIdNotFoundException extends _s.GenericAwsException {
  RevocationIdNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'RevocationIdNotFoundException',
            message: message);
}

class RuleNotFoundException extends _s.GenericAwsException {
  RuleNotFoundException({String? type, String? message})
      : super(type: type, code: 'RuleNotFoundException', message: message);
}

class SSLPolicyNotFoundException extends _s.GenericAwsException {
  SSLPolicyNotFoundException({String? type, String? message})
      : super(type: type, code: 'SSLPolicyNotFoundException', message: message);
}

class SubnetNotFoundException extends _s.GenericAwsException {
  SubnetNotFoundException({String? type, String? message})
      : super(type: type, code: 'SubnetNotFoundException', message: message);
}

class TargetGroupAssociationLimitException extends _s.GenericAwsException {
  TargetGroupAssociationLimitException({String? type, String? message})
      : super(
            type: type,
            code: 'TargetGroupAssociationLimitException',
            message: message);
}

class TargetGroupNotFoundException extends _s.GenericAwsException {
  TargetGroupNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'TargetGroupNotFoundException', message: message);
}

class TooManyActionsException extends _s.GenericAwsException {
  TooManyActionsException({String? type, String? message})
      : super(type: type, code: 'TooManyActionsException', message: message);
}

class TooManyCertificatesException extends _s.GenericAwsException {
  TooManyCertificatesException({String? type, String? message})
      : super(
            type: type, code: 'TooManyCertificatesException', message: message);
}

class TooManyListenersException extends _s.GenericAwsException {
  TooManyListenersException({String? type, String? message})
      : super(type: type, code: 'TooManyListenersException', message: message);
}

class TooManyLoadBalancersException extends _s.GenericAwsException {
  TooManyLoadBalancersException({String? type, String? message})
      : super(
            type: type,
            code: 'TooManyLoadBalancersException',
            message: message);
}

class TooManyRegistrationsForTargetIdException extends _s.GenericAwsException {
  TooManyRegistrationsForTargetIdException({String? type, String? message})
      : super(
            type: type,
            code: 'TooManyRegistrationsForTargetIdException',
            message: message);
}

class TooManyRulesException extends _s.GenericAwsException {
  TooManyRulesException({String? type, String? message})
      : super(type: type, code: 'TooManyRulesException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class TooManyTargetGroupsException extends _s.GenericAwsException {
  TooManyTargetGroupsException({String? type, String? message})
      : super(
            type: type, code: 'TooManyTargetGroupsException', message: message);
}

class TooManyTargetsException extends _s.GenericAwsException {
  TooManyTargetsException({String? type, String? message})
      : super(type: type, code: 'TooManyTargetsException', message: message);
}

class TooManyTrustStoreRevocationEntriesException
    extends _s.GenericAwsException {
  TooManyTrustStoreRevocationEntriesException({String? type, String? message})
      : super(
            type: type,
            code: 'TooManyTrustStoreRevocationEntriesException',
            message: message);
}

class TooManyTrustStoresException extends _s.GenericAwsException {
  TooManyTrustStoresException({String? type, String? message})
      : super(
            type: type, code: 'TooManyTrustStoresException', message: message);
}

class TooManyUniqueTargetGroupsPerLoadBalancerException
    extends _s.GenericAwsException {
  TooManyUniqueTargetGroupsPerLoadBalancerException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'TooManyUniqueTargetGroupsPerLoadBalancerException',
            message: message);
}

class TrustStoreInUseException extends _s.GenericAwsException {
  TrustStoreInUseException({String? type, String? message})
      : super(type: type, code: 'TrustStoreInUseException', message: message);
}

class TrustStoreNotFoundException extends _s.GenericAwsException {
  TrustStoreNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'TrustStoreNotFoundException', message: message);
}

class TrustStoreNotReadyException extends _s.GenericAwsException {
  TrustStoreNotReadyException({String? type, String? message})
      : super(
            type: type, code: 'TrustStoreNotReadyException', message: message);
}

class UnsupportedProtocolException extends _s.GenericAwsException {
  UnsupportedProtocolException({String? type, String? message})
      : super(
            type: type, code: 'UnsupportedProtocolException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ALPNPolicyNotSupportedException': (type, message) =>
      ALPNPolicyNotSupportedException(type: type, message: message),
  'AllocationIdNotFoundException': (type, message) =>
      AllocationIdNotFoundException(type: type, message: message),
  'AvailabilityZoneNotSupportedException': (type, message) =>
      AvailabilityZoneNotSupportedException(type: type, message: message),
  'CaCertificatesBundleNotFoundException': (type, message) =>
      CaCertificatesBundleNotFoundException(type: type, message: message),
  'CertificateNotFoundException': (type, message) =>
      CertificateNotFoundException(type: type, message: message),
  'DuplicateListenerException': (type, message) =>
      DuplicateListenerException(type: type, message: message),
  'DuplicateLoadBalancerNameException': (type, message) =>
      DuplicateLoadBalancerNameException(type: type, message: message),
  'DuplicateTagKeysException': (type, message) =>
      DuplicateTagKeysException(type: type, message: message),
  'DuplicateTargetGroupNameException': (type, message) =>
      DuplicateTargetGroupNameException(type: type, message: message),
  'DuplicateTrustStoreNameException': (type, message) =>
      DuplicateTrustStoreNameException(type: type, message: message),
  'HealthUnavailableException': (type, message) =>
      HealthUnavailableException(type: type, message: message),
  'IncompatibleProtocolsException': (type, message) =>
      IncompatibleProtocolsException(type: type, message: message),
  'InvalidCaCertificatesBundleException': (type, message) =>
      InvalidCaCertificatesBundleException(type: type, message: message),
  'InvalidConfigurationRequestException': (type, message) =>
      InvalidConfigurationRequestException(type: type, message: message),
  'InvalidLoadBalancerActionException': (type, message) =>
      InvalidLoadBalancerActionException(type: type, message: message),
  'InvalidRevocationContentException': (type, message) =>
      InvalidRevocationContentException(type: type, message: message),
  'InvalidSchemeException': (type, message) =>
      InvalidSchemeException(type: type, message: message),
  'InvalidSecurityGroupException': (type, message) =>
      InvalidSecurityGroupException(type: type, message: message),
  'InvalidSubnetException': (type, message) =>
      InvalidSubnetException(type: type, message: message),
  'InvalidTargetException': (type, message) =>
      InvalidTargetException(type: type, message: message),
  'ListenerNotFoundException': (type, message) =>
      ListenerNotFoundException(type: type, message: message),
  'LoadBalancerNotFoundException': (type, message) =>
      LoadBalancerNotFoundException(type: type, message: message),
  'OperationNotPermittedException': (type, message) =>
      OperationNotPermittedException(type: type, message: message),
  'PriorityInUseException': (type, message) =>
      PriorityInUseException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'RevocationContentNotFoundException': (type, message) =>
      RevocationContentNotFoundException(type: type, message: message),
  'RevocationIdNotFoundException': (type, message) =>
      RevocationIdNotFoundException(type: type, message: message),
  'RuleNotFoundException': (type, message) =>
      RuleNotFoundException(type: type, message: message),
  'SSLPolicyNotFoundException': (type, message) =>
      SSLPolicyNotFoundException(type: type, message: message),
  'SubnetNotFoundException': (type, message) =>
      SubnetNotFoundException(type: type, message: message),
  'TargetGroupAssociationLimitException': (type, message) =>
      TargetGroupAssociationLimitException(type: type, message: message),
  'TargetGroupNotFoundException': (type, message) =>
      TargetGroupNotFoundException(type: type, message: message),
  'TooManyActionsException': (type, message) =>
      TooManyActionsException(type: type, message: message),
  'TooManyCertificatesException': (type, message) =>
      TooManyCertificatesException(type: type, message: message),
  'TooManyListenersException': (type, message) =>
      TooManyListenersException(type: type, message: message),
  'TooManyLoadBalancersException': (type, message) =>
      TooManyLoadBalancersException(type: type, message: message),
  'TooManyRegistrationsForTargetIdException': (type, message) =>
      TooManyRegistrationsForTargetIdException(type: type, message: message),
  'TooManyRulesException': (type, message) =>
      TooManyRulesException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'TooManyTargetGroupsException': (type, message) =>
      TooManyTargetGroupsException(type: type, message: message),
  'TooManyTargetsException': (type, message) =>
      TooManyTargetsException(type: type, message: message),
  'TooManyTrustStoreRevocationEntriesException': (type, message) =>
      TooManyTrustStoreRevocationEntriesException(type: type, message: message),
  'TooManyTrustStoresException': (type, message) =>
      TooManyTrustStoresException(type: type, message: message),
  'TooManyUniqueTargetGroupsPerLoadBalancerException': (type, message) =>
      TooManyUniqueTargetGroupsPerLoadBalancerException(
          type: type, message: message),
  'TrustStoreInUseException': (type, message) =>
      TrustStoreInUseException(type: type, message: message),
  'TrustStoreNotFoundException': (type, message) =>
      TrustStoreNotFoundException(type: type, message: message),
  'TrustStoreNotReadyException': (type, message) =>
      TrustStoreNotReadyException(type: type, message: message),
  'UnsupportedProtocolException': (type, message) =>
      UnsupportedProtocolException(type: type, message: message),
};
