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

import 'v2012_06_01.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

/// A load balancer can distribute incoming traffic across your EC2 instances.
/// This enables you to increase the availability of your application. The load
/// balancer also monitors the health of its registered instances and ensures
/// that it routes traffic only to healthy instances. You configure your load
/// balancer to accept incoming traffic by specifying one or more listeners,
/// which are configured with a protocol and port number for connections from
/// clients to the load balancer and a protocol and port number for connections
/// from the load balancer to the instances.
class ElasticLoadBalancing {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  ElasticLoadBalancing({
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

  /// Adds the specified tags to the specified load balancer. Each load balancer
  /// can have a maximum of 10 tags.
  ///
  /// Each tag consists of a key and an optional value. If a tag with the same
  /// key is already associated with the load balancer, <code>AddTags</code>
  /// updates its value.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/add-remove-tags.html">Tag
  /// Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [TooManyTagsException].
  /// May throw [DuplicateTagKeysException].
  ///
  /// Parameter [loadBalancerNames] :
  /// The name of the load balancer. You can specify one load balancer only.
  ///
  /// Parameter [tags] :
  /// The tags.
  Future<void> addTags({
    required List<String> loadBalancerNames,
    required List<Tag> tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerNames'] = loadBalancerNames;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'AddTags',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddTagsInput'],
      shapes: shapes,
      resultWrapper: 'AddTagsResult',
    );
  }

  /// Associates one or more security groups with your load balancer in a
  /// virtual private cloud (VPC). The specified security groups override the
  /// previously associated security groups.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-groups.html#elb-vpc-security-groups">Security
  /// Groups for Load Balancers in a VPC</a> in the <i>Classic Load Balancers
  /// Guide</i>.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [InvalidSecurityGroupException].
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  ///
  /// Parameter [securityGroups] :
  /// The IDs of the security groups to associate with the load balancer. Note
  /// that you cannot specify the name of the security group.
  Future<ApplySecurityGroupsToLoadBalancerOutput>
      applySecurityGroupsToLoadBalancer({
    required String loadBalancerName,
    required List<String> securityGroups,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerName'] = loadBalancerName;
    $request['SecurityGroups'] = securityGroups;
    final $result = await _protocol.send(
      $request,
      action: 'ApplySecurityGroupsToLoadBalancer',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ApplySecurityGroupsToLoadBalancerInput'],
      shapes: shapes,
      resultWrapper: 'ApplySecurityGroupsToLoadBalancerResult',
    );
    return ApplySecurityGroupsToLoadBalancerOutput.fromXml($result);
  }

  /// Adds one or more subnets to the set of configured subnets for the
  /// specified load balancer.
  ///
  /// The load balancer evenly distributes requests across all registered
  /// subnets. For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-manage-subnets.html">Add
  /// or Remove Subnets for Your Load Balancer in a VPC</a> in the <i>Classic
  /// Load Balancers Guide</i>.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [SubnetNotFoundException].
  /// May throw [InvalidSubnetException].
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  ///
  /// Parameter [subnets] :
  /// The IDs of the subnets to add. You can add only one subnet per
  /// Availability Zone.
  Future<AttachLoadBalancerToSubnetsOutput> attachLoadBalancerToSubnets({
    required String loadBalancerName,
    required List<String> subnets,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerName'] = loadBalancerName;
    $request['Subnets'] = subnets;
    final $result = await _protocol.send(
      $request,
      action: 'AttachLoadBalancerToSubnets',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AttachLoadBalancerToSubnetsInput'],
      shapes: shapes,
      resultWrapper: 'AttachLoadBalancerToSubnetsResult',
    );
    return AttachLoadBalancerToSubnetsOutput.fromXml($result);
  }

  /// Specifies the health check settings to use when evaluating the health
  /// state of your EC2 instances.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-healthchecks.html">Configure
  /// Health Checks for Your Load Balancer</a> in the <i>Classic Load Balancers
  /// Guide</i>.
  ///
  /// May throw [AccessPointNotFoundException].
  ///
  /// Parameter [healthCheck] :
  /// The configuration information.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  Future<ConfigureHealthCheckOutput> configureHealthCheck({
    required HealthCheck healthCheck,
    required String loadBalancerName,
  }) async {
    final $request = <String, dynamic>{};
    $request['HealthCheck'] = healthCheck;
    $request['LoadBalancerName'] = loadBalancerName;
    final $result = await _protocol.send(
      $request,
      action: 'ConfigureHealthCheck',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ConfigureHealthCheckInput'],
      shapes: shapes,
      resultWrapper: 'ConfigureHealthCheckResult',
    );
    return ConfigureHealthCheckOutput.fromXml($result);
  }

  /// Generates a stickiness policy with sticky session lifetimes that follow
  /// that of an application-generated cookie. This policy can be associated
  /// only with HTTP/HTTPS listeners.
  ///
  /// This policy is similar to the policy created by
  /// <a>CreateLBCookieStickinessPolicy</a>, except that the lifetime of the
  /// special Elastic Load Balancing cookie, <code>AWSELB</code>, follows the
  /// lifetime of the application-generated cookie specified in the policy
  /// configuration. The load balancer only inserts a new stickiness cookie when
  /// the application response includes a new application cookie.
  ///
  /// If the application cookie is explicitly removed or expires, the session
  /// stops being sticky until a new application cookie is issued.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application">Application-Controlled
  /// Session Stickiness</a> in the <i>Classic Load Balancers Guide</i>.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [DuplicatePolicyNameException].
  /// May throw [TooManyPoliciesException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [cookieName] :
  /// The name of the application cookie used for stickiness.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  ///
  /// Parameter [policyName] :
  /// The name of the policy being created. Policy names must consist of
  /// alphanumeric characters and dashes (-). This name must be unique within
  /// the set of policies for this load balancer.
  Future<void> createAppCookieStickinessPolicy({
    required String cookieName,
    required String loadBalancerName,
    required String policyName,
  }) async {
    final $request = <String, dynamic>{};
    $request['CookieName'] = cookieName;
    $request['LoadBalancerName'] = loadBalancerName;
    $request['PolicyName'] = policyName;
    await _protocol.send(
      $request,
      action: 'CreateAppCookieStickinessPolicy',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateAppCookieStickinessPolicyInput'],
      shapes: shapes,
      resultWrapper: 'CreateAppCookieStickinessPolicyResult',
    );
  }

  /// Generates a stickiness policy with sticky session lifetimes controlled by
  /// the lifetime of the browser (user-agent) or a specified expiration period.
  /// This policy can be associated only with HTTP/HTTPS listeners.
  ///
  /// When a load balancer implements this policy, the load balancer uses a
  /// special cookie to track the instance for each request. When the load
  /// balancer receives a request, it first checks to see if this cookie is
  /// present in the request. If so, the load balancer sends the request to the
  /// application server specified in the cookie. If not, the load balancer
  /// sends the request to a server that is chosen based on the existing
  /// load-balancing algorithm.
  ///
  /// A cookie is inserted into the response for binding subsequent requests
  /// from the same user to that server. The validity of the cookie is based on
  /// the cookie expiration time, which is specified in the policy
  /// configuration.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration">Duration-Based
  /// Session Stickiness</a> in the <i>Classic Load Balancers Guide</i>.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [DuplicatePolicyNameException].
  /// May throw [TooManyPoliciesException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  ///
  /// Parameter [policyName] :
  /// The name of the policy being created. Policy names must consist of
  /// alphanumeric characters and dashes (-). This name must be unique within
  /// the set of policies for this load balancer.
  ///
  /// Parameter [cookieExpirationPeriod] :
  /// The time period, in seconds, after which the cookie should be considered
  /// stale. If you do not specify this parameter, the default value is 0, which
  /// indicates that the sticky session should last for the duration of the
  /// browser session.
  Future<void> createLBCookieStickinessPolicy({
    required String loadBalancerName,
    required String policyName,
    int? cookieExpirationPeriod,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerName'] = loadBalancerName;
    $request['PolicyName'] = policyName;
    cookieExpirationPeriod
        ?.also((arg) => $request['CookieExpirationPeriod'] = arg);
    await _protocol.send(
      $request,
      action: 'CreateLBCookieStickinessPolicy',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateLBCookieStickinessPolicyInput'],
      shapes: shapes,
      resultWrapper: 'CreateLBCookieStickinessPolicyResult',
    );
  }

  /// Creates a Classic Load Balancer.
  ///
  /// You can add listeners, security groups, subnets, and tags when you create
  /// your load balancer, or you can add them later using
  /// <a>CreateLoadBalancerListeners</a>,
  /// <a>ApplySecurityGroupsToLoadBalancer</a>,
  /// <a>AttachLoadBalancerToSubnets</a>, and <a>AddTags</a>.
  ///
  /// To describe your current load balancers, see <a>DescribeLoadBalancers</a>.
  /// When you are finished with a load balancer, you can delete it using
  /// <a>DeleteLoadBalancer</a>.
  ///
  /// You can create up to 20 load balancers per region per account. You can
  /// request an increase for the number of load balancers for your account. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-limits.html">Limits
  /// for Your Classic Load Balancer</a> in the <i>Classic Load Balancers
  /// Guide</i>.
  ///
  /// May throw [DuplicateAccessPointNameException].
  /// May throw [TooManyAccessPointsException].
  /// May throw [CertificateNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [SubnetNotFoundException].
  /// May throw [InvalidSubnetException].
  /// May throw [InvalidSecurityGroupException].
  /// May throw [InvalidSchemeException].
  /// May throw [TooManyTagsException].
  /// May throw [DuplicateTagKeysException].
  /// May throw [UnsupportedProtocolException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [listeners] :
  /// The listeners.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html">Listeners
  /// for Your Classic Load Balancer</a> in the <i>Classic Load Balancers
  /// Guide</i>.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  ///
  /// This name must be unique within your set of load balancers for the region,
  /// must have a maximum of 32 characters, must contain only alphanumeric
  /// characters or hyphens, and cannot begin or end with a hyphen.
  ///
  /// Parameter [availabilityZones] :
  /// One or more Availability Zones from the same region as the load balancer.
  ///
  /// You must specify at least one Availability Zone.
  ///
  /// You can add more Availability Zones after you create the load balancer
  /// using <a>EnableAvailabilityZonesForLoadBalancer</a>.
  ///
  /// Parameter [scheme] :
  /// The type of a load balancer. Valid only for load balancers in a VPC.
  ///
  /// By default, Elastic Load Balancing creates an Internet-facing load
  /// balancer with a DNS name that resolves to public IP addresses. For more
  /// information about Internet-facing and Internal load balancers, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/how-elastic-load-balancing-works.html#load-balancer-scheme">Load
  /// Balancer Scheme</a> in the <i>Elastic Load Balancing User Guide</i>.
  ///
  /// Specify <code>internal</code> to create a load balancer with a DNS name
  /// that resolves to private IP addresses.
  ///
  /// Parameter [securityGroups] :
  /// The IDs of the security groups to assign to the load balancer.
  ///
  /// Parameter [subnets] :
  /// The IDs of the subnets in your VPC to attach to the load balancer. Specify
  /// one subnet per Availability Zone specified in
  /// <code>AvailabilityZones</code>.
  ///
  /// Parameter [tags] :
  /// A list of tags to assign to the load balancer.
  ///
  /// For more information about tagging your load balancer, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/add-remove-tags.html">Tag
  /// Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.
  Future<CreateAccessPointOutput> createLoadBalancer({
    required List<Listener> listeners,
    required String loadBalancerName,
    List<String>? availabilityZones,
    String? scheme,
    List<String>? securityGroups,
    List<String>? subnets,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['Listeners'] = listeners;
    $request['LoadBalancerName'] = loadBalancerName;
    availabilityZones?.also((arg) => $request['AvailabilityZones'] = arg);
    scheme?.also((arg) => $request['Scheme'] = arg);
    securityGroups?.also((arg) => $request['SecurityGroups'] = arg);
    subnets?.also((arg) => $request['Subnets'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateLoadBalancer',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateAccessPointInput'],
      shapes: shapes,
      resultWrapper: 'CreateLoadBalancerResult',
    );
    return CreateAccessPointOutput.fromXml($result);
  }

  /// Creates one or more listeners for the specified load balancer. If a
  /// listener with the specified port does not already exist, it is created;
  /// otherwise, the properties of the new listener must match the properties of
  /// the existing listener.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html">Listeners
  /// for Your Classic Load Balancer</a> in the <i>Classic Load Balancers
  /// Guide</i>.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [DuplicateListenerException].
  /// May throw [CertificateNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [UnsupportedProtocolException].
  ///
  /// Parameter [listeners] :
  /// The listeners.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  Future<void> createLoadBalancerListeners({
    required List<Listener> listeners,
    required String loadBalancerName,
  }) async {
    final $request = <String, dynamic>{};
    $request['Listeners'] = listeners;
    $request['LoadBalancerName'] = loadBalancerName;
    await _protocol.send(
      $request,
      action: 'CreateLoadBalancerListeners',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateLoadBalancerListenerInput'],
      shapes: shapes,
      resultWrapper: 'CreateLoadBalancerListenersResult',
    );
  }

  /// Creates a policy with the specified attributes for the specified load
  /// balancer.
  ///
  /// Policies are settings that are saved for your load balancer and that can
  /// be applied to the listener or the application server, depending on the
  /// policy type.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [PolicyTypeNotFoundException].
  /// May throw [DuplicatePolicyNameException].
  /// May throw [TooManyPoliciesException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  ///
  /// Parameter [policyName] :
  /// The name of the load balancer policy to be created. This name must be
  /// unique within the set of policies for this load balancer.
  ///
  /// Parameter [policyTypeName] :
  /// The name of the base policy type. To get the list of policy types, use
  /// <a>DescribeLoadBalancerPolicyTypes</a>.
  ///
  /// Parameter [policyAttributes] :
  /// The policy attributes.
  Future<void> createLoadBalancerPolicy({
    required String loadBalancerName,
    required String policyName,
    required String policyTypeName,
    List<PolicyAttribute>? policyAttributes,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerName'] = loadBalancerName;
    $request['PolicyName'] = policyName;
    $request['PolicyTypeName'] = policyTypeName;
    policyAttributes?.also((arg) => $request['PolicyAttributes'] = arg);
    await _protocol.send(
      $request,
      action: 'CreateLoadBalancerPolicy',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateLoadBalancerPolicyInput'],
      shapes: shapes,
      resultWrapper: 'CreateLoadBalancerPolicyResult',
    );
  }

  /// Deletes the specified load balancer.
  ///
  /// If you are attempting to recreate a load balancer, you must reconfigure
  /// all settings. The DNS name associated with a deleted load balancer are no
  /// longer usable. The name and associated DNS record of the deleted load
  /// balancer no longer exist and traffic sent to any of its IP addresses is no
  /// longer delivered to your instances.
  ///
  /// If the load balancer does not exist or has already been deleted, the call
  /// to <code>DeleteLoadBalancer</code> still succeeds.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  Future<void> deleteLoadBalancer({
    required String loadBalancerName,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerName'] = loadBalancerName;
    await _protocol.send(
      $request,
      action: 'DeleteLoadBalancer',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteAccessPointInput'],
      shapes: shapes,
      resultWrapper: 'DeleteLoadBalancerResult',
    );
  }

  /// Deletes the specified listeners from the specified load balancer.
  ///
  /// May throw [AccessPointNotFoundException].
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  ///
  /// Parameter [loadBalancerPorts] :
  /// The client port numbers of the listeners.
  Future<void> deleteLoadBalancerListeners({
    required String loadBalancerName,
    required List<int> loadBalancerPorts,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerName'] = loadBalancerName;
    $request['LoadBalancerPorts'] = loadBalancerPorts;
    await _protocol.send(
      $request,
      action: 'DeleteLoadBalancerListeners',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteLoadBalancerListenerInput'],
      shapes: shapes,
      resultWrapper: 'DeleteLoadBalancerListenersResult',
    );
  }

  /// Deletes the specified policy from the specified load balancer. This policy
  /// must not be enabled for any listeners.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  ///
  /// Parameter [policyName] :
  /// The name of the policy.
  Future<void> deleteLoadBalancerPolicy({
    required String loadBalancerName,
    required String policyName,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerName'] = loadBalancerName;
    $request['PolicyName'] = policyName;
    await _protocol.send(
      $request,
      action: 'DeleteLoadBalancerPolicy',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteLoadBalancerPolicyInput'],
      shapes: shapes,
      resultWrapper: 'DeleteLoadBalancerPolicyResult',
    );
  }

  /// Deregisters the specified instances from the specified load balancer.
  /// After the instance is deregistered, it no longer receives traffic from the
  /// load balancer.
  ///
  /// You can use <a>DescribeLoadBalancers</a> to verify that the instance is
  /// deregistered from the load balancer.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html">Register
  /// or De-Register EC2 Instances</a> in the <i>Classic Load Balancers
  /// Guide</i>.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [InvalidEndPointException].
  ///
  /// Parameter [instances] :
  /// The IDs of the instances.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  Future<DeregisterEndPointsOutput> deregisterInstancesFromLoadBalancer({
    required List<Instance> instances,
    required String loadBalancerName,
  }) async {
    final $request = <String, dynamic>{};
    $request['Instances'] = instances;
    $request['LoadBalancerName'] = loadBalancerName;
    final $result = await _protocol.send(
      $request,
      action: 'DeregisterInstancesFromLoadBalancer',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeregisterEndPointsInput'],
      shapes: shapes,
      resultWrapper: 'DeregisterInstancesFromLoadBalancerResult',
    );
    return DeregisterEndPointsOutput.fromXml($result);
  }

  /// Describes the current Elastic Load Balancing resource limits for your AWS
  /// account.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-limits.html">Limits
  /// for Your Classic Load Balancer</a> in the <i>Classic Load Balancers
  /// Guide</i>.
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
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAccountLimitsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeAccountLimitsResult',
    );
    return DescribeAccountLimitsOutput.fromXml($result);
  }

  /// Describes the state of the specified instances with respect to the
  /// specified load balancer. If no instances are specified, the call describes
  /// the state of all instances that are currently registered with the load
  /// balancer. If instances are specified, their state is returned even if they
  /// are no longer registered with the load balancer. The state of terminated
  /// instances is not returned.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [InvalidEndPointException].
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  ///
  /// Parameter [instances] :
  /// The IDs of the instances.
  Future<DescribeEndPointStateOutput> describeInstanceHealth({
    required String loadBalancerName,
    List<Instance>? instances,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerName'] = loadBalancerName;
    instances?.also((arg) => $request['Instances'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeInstanceHealth',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEndPointStateInput'],
      shapes: shapes,
      resultWrapper: 'DescribeInstanceHealthResult',
    );
    return DescribeEndPointStateOutput.fromXml($result);
  }

  /// Describes the attributes for the specified load balancer.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [LoadBalancerAttributeNotFoundException].
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  Future<DescribeLoadBalancerAttributesOutput> describeLoadBalancerAttributes({
    required String loadBalancerName,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerName'] = loadBalancerName;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeLoadBalancerAttributes',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeLoadBalancerAttributesInput'],
      shapes: shapes,
      resultWrapper: 'DescribeLoadBalancerAttributesResult',
    );
    return DescribeLoadBalancerAttributesOutput.fromXml($result);
  }

  /// Describes the specified policies.
  ///
  /// If you specify a load balancer name, the action returns the descriptions
  /// of all policies created for the load balancer. If you specify a policy
  /// name associated with your load balancer, the action returns the
  /// description of that policy. If you don't specify a load balancer name, the
  /// action returns descriptions of the specified sample policies, or
  /// descriptions of all sample policies. The names of the sample policies have
  /// the <code>ELBSample-</code> prefix.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [PolicyNotFoundException].
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  ///
  /// Parameter [policyNames] :
  /// The names of the policies.
  Future<DescribeLoadBalancerPoliciesOutput> describeLoadBalancerPolicies({
    String? loadBalancerName,
    List<String>? policyNames,
  }) async {
    final $request = <String, dynamic>{};
    loadBalancerName?.also((arg) => $request['LoadBalancerName'] = arg);
    policyNames?.also((arg) => $request['PolicyNames'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeLoadBalancerPolicies',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeLoadBalancerPoliciesInput'],
      shapes: shapes,
      resultWrapper: 'DescribeLoadBalancerPoliciesResult',
    );
    return DescribeLoadBalancerPoliciesOutput.fromXml($result);
  }

  /// Describes the specified load balancer policy types or all load balancer
  /// policy types.
  ///
  /// The description of each type indicates how it can be used. For example,
  /// some policies can be used only with layer 7 listeners, some policies can
  /// be used only with layer 4 listeners, and some policies can be used only
  /// with your EC2 instances.
  ///
  /// You can use <a>CreateLoadBalancerPolicy</a> to create a policy
  /// configuration for any of these policy types. Then, depending on the policy
  /// type, use either <a>SetLoadBalancerPoliciesOfListener</a> or
  /// <a>SetLoadBalancerPoliciesForBackendServer</a> to set the policy.
  ///
  /// May throw [PolicyTypeNotFoundException].
  ///
  /// Parameter [policyTypeNames] :
  /// The names of the policy types. If no names are specified, describes all
  /// policy types defined by Elastic Load Balancing.
  Future<DescribeLoadBalancerPolicyTypesOutput>
      describeLoadBalancerPolicyTypes({
    List<String>? policyTypeNames,
  }) async {
    final $request = <String, dynamic>{};
    policyTypeNames?.also((arg) => $request['PolicyTypeNames'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeLoadBalancerPolicyTypes',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeLoadBalancerPolicyTypesInput'],
      shapes: shapes,
      resultWrapper: 'DescribeLoadBalancerPolicyTypesResult',
    );
    return DescribeLoadBalancerPolicyTypesOutput.fromXml($result);
  }

  /// Describes the specified the load balancers. If no load balancers are
  /// specified, the call describes all of your load balancers.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [DependencyThrottleException].
  ///
  /// Parameter [loadBalancerNames] :
  /// The names of the load balancers.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call (a number from 1 to
  /// 400). The default is 400.
  Future<DescribeAccessPointsOutput> describeLoadBalancers({
    List<String>? loadBalancerNames,
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
    loadBalancerNames?.also((arg) => $request['LoadBalancerNames'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeLoadBalancers',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAccessPointsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeLoadBalancersResult',
    );
    return DescribeAccessPointsOutput.fromXml($result);
  }

  /// Describes the tags associated with the specified load balancers.
  ///
  /// May throw [AccessPointNotFoundException].
  ///
  /// Parameter [loadBalancerNames] :
  /// The names of the load balancers.
  Future<DescribeTagsOutput> describeTags({
    required List<String> loadBalancerNames,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerNames'] = loadBalancerNames;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTags',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTagsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeTagsResult',
    );
    return DescribeTagsOutput.fromXml($result);
  }

  /// Removes the specified subnets from the set of configured subnets for the
  /// load balancer.
  ///
  /// After a subnet is removed, all EC2 instances registered with the load
  /// balancer in the removed subnet go into the <code>OutOfService</code>
  /// state. Then, the load balancer balances the traffic among the remaining
  /// routable subnets.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  ///
  /// Parameter [subnets] :
  /// The IDs of the subnets.
  Future<DetachLoadBalancerFromSubnetsOutput> detachLoadBalancerFromSubnets({
    required String loadBalancerName,
    required List<String> subnets,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerName'] = loadBalancerName;
    $request['Subnets'] = subnets;
    final $result = await _protocol.send(
      $request,
      action: 'DetachLoadBalancerFromSubnets',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DetachLoadBalancerFromSubnetsInput'],
      shapes: shapes,
      resultWrapper: 'DetachLoadBalancerFromSubnetsResult',
    );
    return DetachLoadBalancerFromSubnetsOutput.fromXml($result);
  }

  /// Removes the specified Availability Zones from the set of Availability
  /// Zones for the specified load balancer in EC2-Classic or a default VPC.
  ///
  /// For load balancers in a non-default VPC, use
  /// <a>DetachLoadBalancerFromSubnets</a>.
  ///
  /// There must be at least one Availability Zone registered with a load
  /// balancer at all times. After an Availability Zone is removed, all
  /// instances registered with the load balancer that are in the removed
  /// Availability Zone go into the <code>OutOfService</code> state. Then, the
  /// load balancer attempts to equally balance the traffic among its remaining
  /// Availability Zones.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html">Add
  /// or Remove Availability Zones</a> in the <i>Classic Load Balancers
  /// Guide</i>.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [availabilityZones] :
  /// The Availability Zones.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  Future<RemoveAvailabilityZonesOutput>
      disableAvailabilityZonesForLoadBalancer({
    required List<String> availabilityZones,
    required String loadBalancerName,
  }) async {
    final $request = <String, dynamic>{};
    $request['AvailabilityZones'] = availabilityZones;
    $request['LoadBalancerName'] = loadBalancerName;
    final $result = await _protocol.send(
      $request,
      action: 'DisableAvailabilityZonesForLoadBalancer',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveAvailabilityZonesInput'],
      shapes: shapes,
      resultWrapper: 'DisableAvailabilityZonesForLoadBalancerResult',
    );
    return RemoveAvailabilityZonesOutput.fromXml($result);
  }

  /// Adds the specified Availability Zones to the set of Availability Zones for
  /// the specified load balancer in EC2-Classic or a default VPC.
  ///
  /// For load balancers in a non-default VPC, use
  /// <a>AttachLoadBalancerToSubnets</a>.
  ///
  /// The load balancer evenly distributes requests across all its registered
  /// Availability Zones that contain instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html">Add
  /// or Remove Availability Zones</a> in the <i>Classic Load Balancers
  /// Guide</i>.
  ///
  /// May throw [AccessPointNotFoundException].
  ///
  /// Parameter [availabilityZones] :
  /// The Availability Zones. These must be in the same region as the load
  /// balancer.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  Future<AddAvailabilityZonesOutput> enableAvailabilityZonesForLoadBalancer({
    required List<String> availabilityZones,
    required String loadBalancerName,
  }) async {
    final $request = <String, dynamic>{};
    $request['AvailabilityZones'] = availabilityZones;
    $request['LoadBalancerName'] = loadBalancerName;
    final $result = await _protocol.send(
      $request,
      action: 'EnableAvailabilityZonesForLoadBalancer',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddAvailabilityZonesInput'],
      shapes: shapes,
      resultWrapper: 'EnableAvailabilityZonesForLoadBalancerResult',
    );
    return AddAvailabilityZonesOutput.fromXml($result);
  }

  /// Modifies the attributes of the specified load balancer.
  ///
  /// You can modify the load balancer attributes, such as
  /// <code>AccessLogs</code>, <code>ConnectionDraining</code>, and
  /// <code>CrossZoneLoadBalancing</code> by either enabling or disabling them.
  /// Or, you can modify the load balancer attribute
  /// <code>ConnectionSettings</code> by specifying an idle connection timeout
  /// value for your load balancer.
  ///
  /// For more information, see the following in the <i>Classic Load Balancers
  /// Guide</i>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-crosszone-lb.html">Cross-Zone
  /// Load Balancing</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-conn-drain.html">Connection
  /// Draining</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/access-log-collection.html">Access
  /// Logs</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-idle-timeout.html">Idle
  /// Connection Timeout</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [LoadBalancerAttributeNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [loadBalancerAttributes] :
  /// The attributes for the load balancer.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  Future<ModifyLoadBalancerAttributesOutput> modifyLoadBalancerAttributes({
    required LoadBalancerAttributes loadBalancerAttributes,
    required String loadBalancerName,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerAttributes'] = loadBalancerAttributes;
    $request['LoadBalancerName'] = loadBalancerName;
    final $result = await _protocol.send(
      $request,
      action: 'ModifyLoadBalancerAttributes',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyLoadBalancerAttributesInput'],
      shapes: shapes,
      resultWrapper: 'ModifyLoadBalancerAttributesResult',
    );
    return ModifyLoadBalancerAttributesOutput.fromXml($result);
  }

  /// Adds the specified instances to the specified load balancer.
  ///
  /// The instance must be a running instance in the same network as the load
  /// balancer (EC2-Classic or the same VPC). If you have EC2-Classic instances
  /// and a load balancer in a VPC with ClassicLink enabled, you can link the
  /// EC2-Classic instances to that VPC and then register the linked EC2-Classic
  /// instances with the load balancer in the VPC.
  ///
  /// Note that <code>RegisterInstanceWithLoadBalancer</code> completes when the
  /// request has been registered. Instance registration takes a little time to
  /// complete. To check the state of the registered instances, use
  /// <a>DescribeLoadBalancers</a> or <a>DescribeInstanceHealth</a>.
  ///
  /// After the instance is registered, it starts receiving traffic and requests
  /// from the load balancer. Any instance that is not in one of the
  /// Availability Zones registered for the load balancer is moved to the
  /// <code>OutOfService</code> state. If an Availability Zone is added to the
  /// load balancer later, any instances registered with the load balancer move
  /// to the <code>InService</code> state.
  ///
  /// To deregister instances from a load balancer, use
  /// <a>DeregisterInstancesFromLoadBalancer</a>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html">Register
  /// or De-Register EC2 Instances</a> in the <i>Classic Load Balancers
  /// Guide</i>.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [InvalidEndPointException].
  ///
  /// Parameter [instances] :
  /// The IDs of the instances.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  Future<RegisterEndPointsOutput> registerInstancesWithLoadBalancer({
    required List<Instance> instances,
    required String loadBalancerName,
  }) async {
    final $request = <String, dynamic>{};
    $request['Instances'] = instances;
    $request['LoadBalancerName'] = loadBalancerName;
    final $result = await _protocol.send(
      $request,
      action: 'RegisterInstancesWithLoadBalancer',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RegisterEndPointsInput'],
      shapes: shapes,
      resultWrapper: 'RegisterInstancesWithLoadBalancerResult',
    );
    return RegisterEndPointsOutput.fromXml($result);
  }

  /// Removes one or more tags from the specified load balancer.
  ///
  /// May throw [AccessPointNotFoundException].
  ///
  /// Parameter [loadBalancerNames] :
  /// The name of the load balancer. You can specify a maximum of one load
  /// balancer name.
  ///
  /// Parameter [tags] :
  /// The list of tag keys to remove.
  Future<void> removeTags({
    required List<String> loadBalancerNames,
    required List<TagKeyOnly> tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerNames'] = loadBalancerNames;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'RemoveTags',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveTagsInput'],
      shapes: shapes,
      resultWrapper: 'RemoveTagsResult',
    );
  }

  /// Sets the certificate that terminates the specified listener's SSL
  /// connections. The specified certificate replaces any prior certificate that
  /// was used on the same load balancer and port.
  ///
  /// For more information about updating your SSL certificate, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-update-ssl-cert.html">Replace
  /// the SSL Certificate for Your Load Balancer</a> in the <i>Classic Load
  /// Balancers Guide</i>.
  ///
  /// May throw [CertificateNotFoundException].
  /// May throw [AccessPointNotFoundException].
  /// May throw [ListenerNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [UnsupportedProtocolException].
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  ///
  /// Parameter [loadBalancerPort] :
  /// The port that uses the specified SSL certificate.
  ///
  /// Parameter [sSLCertificateId] :
  /// The Amazon Resource Name (ARN) of the SSL certificate.
  Future<void> setLoadBalancerListenerSSLCertificate({
    required String loadBalancerName,
    required int loadBalancerPort,
    required String sSLCertificateId,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerName'] = loadBalancerName;
    $request['LoadBalancerPort'] = loadBalancerPort;
    $request['SSLCertificateId'] = sSLCertificateId;
    await _protocol.send(
      $request,
      action: 'SetLoadBalancerListenerSSLCertificate',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetLoadBalancerListenerSSLCertificateInput'],
      shapes: shapes,
      resultWrapper: 'SetLoadBalancerListenerSSLCertificateResult',
    );
  }

  /// Replaces the set of policies associated with the specified port on which
  /// the EC2 instance is listening with a new set of policies. At this time,
  /// only the back-end server authentication policy type can be applied to the
  /// instance ports; this policy type is composed of multiple public key
  /// policies.
  ///
  /// Each time you use <code>SetLoadBalancerPoliciesForBackendServer</code> to
  /// enable the policies, use the <code>PolicyNames</code> parameter to list
  /// the policies that you want to enable.
  ///
  /// You can use <a>DescribeLoadBalancers</a> or
  /// <a>DescribeLoadBalancerPolicies</a> to verify that the policy is
  /// associated with the EC2 instance.
  ///
  /// For more information about enabling back-end instance authentication, see
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-create-https-ssl-load-balancer.html#configure_backendauth_clt">Configure
  /// Back-end Instance Authentication</a> in the <i>Classic Load Balancers
  /// Guide</i>. For more information about Proxy Protocol, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-proxy-protocol.html">Configure
  /// Proxy Protocol Support</a> in the <i>Classic Load Balancers Guide</i>.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [PolicyNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [instancePort] :
  /// The port number associated with the EC2 instance.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  ///
  /// Parameter [policyNames] :
  /// The names of the policies. If the list is empty, then all current polices
  /// are removed from the EC2 instance.
  Future<void> setLoadBalancerPoliciesForBackendServer({
    required int instancePort,
    required String loadBalancerName,
    required List<String> policyNames,
  }) async {
    final $request = <String, dynamic>{};
    $request['InstancePort'] = instancePort;
    $request['LoadBalancerName'] = loadBalancerName;
    $request['PolicyNames'] = policyNames;
    await _protocol.send(
      $request,
      action: 'SetLoadBalancerPoliciesForBackendServer',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetLoadBalancerPoliciesForBackendServerInput'],
      shapes: shapes,
      resultWrapper: 'SetLoadBalancerPoliciesForBackendServerResult',
    );
  }

  /// Replaces the current set of policies for the specified load balancer port
  /// with the specified set of policies.
  ///
  /// To enable back-end server authentication, use
  /// <a>SetLoadBalancerPoliciesForBackendServer</a>.
  ///
  /// For more information about setting policies, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/ssl-config-update.html">Update
  /// the SSL Negotiation Configuration</a>, <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration">Duration-Based
  /// Session Stickiness</a>, and <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application">Application-Controlled
  /// Session Stickiness</a> in the <i>Classic Load Balancers Guide</i>.
  ///
  /// May throw [AccessPointNotFoundException].
  /// May throw [PolicyNotFoundException].
  /// May throw [ListenerNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  ///
  /// Parameter [loadBalancerPort] :
  /// The external port of the load balancer.
  ///
  /// Parameter [policyNames] :
  /// The names of the policies. This list must include all policies to be
  /// enabled. If you omit a policy that is currently enabled, it is disabled.
  /// If the list is empty, all current policies are disabled.
  Future<void> setLoadBalancerPoliciesOfListener({
    required String loadBalancerName,
    required int loadBalancerPort,
    required List<String> policyNames,
  }) async {
    final $request = <String, dynamic>{};
    $request['LoadBalancerName'] = loadBalancerName;
    $request['LoadBalancerPort'] = loadBalancerPort;
    $request['PolicyNames'] = policyNames;
    await _protocol.send(
      $request,
      action: 'SetLoadBalancerPoliciesOfListener',
      version: '2012-06-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetLoadBalancerPoliciesOfListenerInput'],
      shapes: shapes,
      resultWrapper: 'SetLoadBalancerPoliciesOfListenerResult',
    );
  }
}

/// Information about the <code>AccessLog</code> attribute.
class AccessLog {
  /// Specifies whether access logs are enabled for the load balancer.
  final bool enabled;

  /// The interval for publishing the access logs. You can specify an interval of
  /// either 5 minutes or 60 minutes.
  ///
  /// Default: 60 minutes
  final int? emitInterval;

  /// The name of the Amazon S3 bucket where the access logs are stored.
  final String? s3BucketName;

  /// The logical hierarchy you created for your Amazon S3 bucket, for example
  /// <code>my-bucket-prefix/prod</code>. If the prefix is not provided, the log
  /// is placed at the root level of the bucket.
  final String? s3BucketPrefix;

  AccessLog({
    required this.enabled,
    this.emitInterval,
    this.s3BucketName,
    this.s3BucketPrefix,
  });
  factory AccessLog.fromXml(_s.XmlElement elem) {
    return AccessLog(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled')!,
      emitInterval: _s.extractXmlIntValue(elem, 'EmitInterval'),
      s3BucketName: _s.extractXmlStringValue(elem, 'S3BucketName'),
      s3BucketPrefix: _s.extractXmlStringValue(elem, 'S3BucketPrefix'),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final emitInterval = this.emitInterval;
    final s3BucketName = this.s3BucketName;
    final s3BucketPrefix = this.s3BucketPrefix;
    return {
      'Enabled': enabled,
      if (emitInterval != null) 'EmitInterval': emitInterval,
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3BucketPrefix != null) 'S3BucketPrefix': s3BucketPrefix,
    };
  }
}

/// Contains the output of EnableAvailabilityZonesForLoadBalancer.
class AddAvailabilityZonesOutput {
  /// The updated list of Availability Zones for the load balancer.
  final List<String>? availabilityZones;

  AddAvailabilityZonesOutput({
    this.availabilityZones,
  });
  factory AddAvailabilityZonesOutput.fromXml(_s.XmlElement elem) {
    return AddAvailabilityZonesOutput(
      availabilityZones: _s
          .extractXmlChild(elem, 'AvailabilityZones')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
    };
  }
}

/// Contains the output of AddTags.
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

/// Information about additional load balancer attributes.
class AdditionalAttribute {
  /// The name of the attribute.
  ///
  /// The following attribute is supported.
  ///
  /// <ul>
  /// <li>
  /// <code>elb.http.desyncmitigationmode</code> - Determines how the load
  /// balancer handles requests that might pose a security risk to your
  /// application. The possible values are <code>monitor</code>,
  /// <code>defensive</code>, and <code>strictest</code>. The default is
  /// <code>defensive</code>.
  /// </li>
  /// </ul>
  final String? key;

  /// This value of the attribute.
  final String? value;

  AdditionalAttribute({
    this.key,
    this.value,
  });
  factory AdditionalAttribute.fromXml(_s.XmlElement elem) {
    return AdditionalAttribute(
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

/// Information about a policy for application-controlled session stickiness.
class AppCookieStickinessPolicy {
  /// The name of the application cookie used for stickiness.
  final String? cookieName;

  /// The mnemonic name for the policy being created. The name must be unique
  /// within a set of policies for this load balancer.
  final String? policyName;

  AppCookieStickinessPolicy({
    this.cookieName,
    this.policyName,
  });
  factory AppCookieStickinessPolicy.fromXml(_s.XmlElement elem) {
    return AppCookieStickinessPolicy(
      cookieName: _s.extractXmlStringValue(elem, 'CookieName'),
      policyName: _s.extractXmlStringValue(elem, 'PolicyName'),
    );
  }

  Map<String, dynamic> toJson() {
    final cookieName = this.cookieName;
    final policyName = this.policyName;
    return {
      if (cookieName != null) 'CookieName': cookieName,
      if (policyName != null) 'PolicyName': policyName,
    };
  }
}

/// Contains the output of ApplySecurityGroupsToLoadBalancer.
class ApplySecurityGroupsToLoadBalancerOutput {
  /// The IDs of the security groups associated with the load balancer.
  final List<String>? securityGroups;

  ApplySecurityGroupsToLoadBalancerOutput({
    this.securityGroups,
  });
  factory ApplySecurityGroupsToLoadBalancerOutput.fromXml(_s.XmlElement elem) {
    return ApplySecurityGroupsToLoadBalancerOutput(
      securityGroups: _s
          .extractXmlChild(elem, 'SecurityGroups')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroups = this.securityGroups;
    return {
      if (securityGroups != null) 'SecurityGroups': securityGroups,
    };
  }
}

/// Contains the output of AttachLoadBalancerToSubnets.
class AttachLoadBalancerToSubnetsOutput {
  /// The IDs of the subnets attached to the load balancer.
  final List<String>? subnets;

  AttachLoadBalancerToSubnetsOutput({
    this.subnets,
  });
  factory AttachLoadBalancerToSubnetsOutput.fromXml(_s.XmlElement elem) {
    return AttachLoadBalancerToSubnetsOutput(
      subnets: _s
          .extractXmlChild(elem, 'Subnets')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final subnets = this.subnets;
    return {
      if (subnets != null) 'Subnets': subnets,
    };
  }
}

/// Information about the configuration of an EC2 instance.
class BackendServerDescription {
  /// The port on which the EC2 instance is listening.
  final int? instancePort;

  /// The names of the policies enabled for the EC2 instance.
  final List<String>? policyNames;

  BackendServerDescription({
    this.instancePort,
    this.policyNames,
  });
  factory BackendServerDescription.fromXml(_s.XmlElement elem) {
    return BackendServerDescription(
      instancePort: _s.extractXmlIntValue(elem, 'InstancePort'),
      policyNames: _s
          .extractXmlChild(elem, 'PolicyNames')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final instancePort = this.instancePort;
    final policyNames = this.policyNames;
    return {
      if (instancePort != null) 'InstancePort': instancePort,
      if (policyNames != null) 'PolicyNames': policyNames,
    };
  }
}

/// Contains the output of ConfigureHealthCheck.
class ConfigureHealthCheckOutput {
  /// The updated health check.
  final HealthCheck? healthCheck;

  ConfigureHealthCheckOutput({
    this.healthCheck,
  });
  factory ConfigureHealthCheckOutput.fromXml(_s.XmlElement elem) {
    return ConfigureHealthCheckOutput(
      healthCheck:
          _s.extractXmlChild(elem, 'HealthCheck')?.let(HealthCheck.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final healthCheck = this.healthCheck;
    return {
      if (healthCheck != null) 'HealthCheck': healthCheck,
    };
  }
}

/// Information about the <code>ConnectionDraining</code> attribute.
class ConnectionDraining {
  /// Specifies whether connection draining is enabled for the load balancer.
  final bool enabled;

  /// The maximum time, in seconds, to keep the existing connections open before
  /// deregistering the instances.
  final int? timeout;

  ConnectionDraining({
    required this.enabled,
    this.timeout,
  });
  factory ConnectionDraining.fromXml(_s.XmlElement elem) {
    return ConnectionDraining(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled')!,
      timeout: _s.extractXmlIntValue(elem, 'Timeout'),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final timeout = this.timeout;
    return {
      'Enabled': enabled,
      if (timeout != null) 'Timeout': timeout,
    };
  }
}

/// Information about the <code>ConnectionSettings</code> attribute.
class ConnectionSettings {
  /// The time, in seconds, that the connection is allowed to be idle (no data has
  /// been sent over the connection) before it is closed by the load balancer.
  final int idleTimeout;

  ConnectionSettings({
    required this.idleTimeout,
  });
  factory ConnectionSettings.fromXml(_s.XmlElement elem) {
    return ConnectionSettings(
      idleTimeout: _s.extractXmlIntValue(elem, 'IdleTimeout')!,
    );
  }

  Map<String, dynamic> toJson() {
    final idleTimeout = this.idleTimeout;
    return {
      'IdleTimeout': idleTimeout,
    };
  }
}

/// Contains the output for CreateLoadBalancer.
class CreateAccessPointOutput {
  /// The DNS name of the load balancer.
  final String? dNSName;

  CreateAccessPointOutput({
    this.dNSName,
  });
  factory CreateAccessPointOutput.fromXml(_s.XmlElement elem) {
    return CreateAccessPointOutput(
      dNSName: _s.extractXmlStringValue(elem, 'DNSName'),
    );
  }

  Map<String, dynamic> toJson() {
    final dNSName = this.dNSName;
    return {
      if (dNSName != null) 'DNSName': dNSName,
    };
  }
}

/// Contains the output for CreateAppCookieStickinessPolicy.
class CreateAppCookieStickinessPolicyOutput {
  CreateAppCookieStickinessPolicyOutput();
  factory CreateAppCookieStickinessPolicyOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateAppCookieStickinessPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the output for CreateLBCookieStickinessPolicy.
class CreateLBCookieStickinessPolicyOutput {
  CreateLBCookieStickinessPolicyOutput();
  factory CreateLBCookieStickinessPolicyOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateLBCookieStickinessPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the parameters for CreateLoadBalancerListener.
class CreateLoadBalancerListenerOutput {
  CreateLoadBalancerListenerOutput();
  factory CreateLoadBalancerListenerOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateLoadBalancerListenerOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the output of CreateLoadBalancerPolicy.
class CreateLoadBalancerPolicyOutput {
  CreateLoadBalancerPolicyOutput();
  factory CreateLoadBalancerPolicyOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateLoadBalancerPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about the <code>CrossZoneLoadBalancing</code> attribute.
class CrossZoneLoadBalancing {
  /// Specifies whether cross-zone load balancing is enabled for the load
  /// balancer.
  final bool enabled;

  CrossZoneLoadBalancing({
    required this.enabled,
  });
  factory CrossZoneLoadBalancing.fromXml(_s.XmlElement elem) {
    return CrossZoneLoadBalancing(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled')!,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      'Enabled': enabled,
    };
  }
}

/// Contains the output of DeleteLoadBalancer.
class DeleteAccessPointOutput {
  DeleteAccessPointOutput();
  factory DeleteAccessPointOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteAccessPointOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the output of DeleteLoadBalancerListeners.
class DeleteLoadBalancerListenerOutput {
  DeleteLoadBalancerListenerOutput();
  factory DeleteLoadBalancerListenerOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteLoadBalancerListenerOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the output of DeleteLoadBalancerPolicy.
class DeleteLoadBalancerPolicyOutput {
  DeleteLoadBalancerPolicyOutput();
  factory DeleteLoadBalancerPolicyOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteLoadBalancerPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the output of DeregisterInstancesFromLoadBalancer.
class DeregisterEndPointsOutput {
  /// The remaining instances registered with the load balancer.
  final List<Instance>? instances;

  DeregisterEndPointsOutput({
    this.instances,
  });
  factory DeregisterEndPointsOutput.fromXml(_s.XmlElement elem) {
    return DeregisterEndPointsOutput(
      instances: _s.extractXmlChild(elem, 'Instances')?.let(
          (elem) => elem.findElements('member').map(Instance.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final instances = this.instances;
    return {
      if (instances != null) 'Instances': instances,
    };
  }
}

/// Contains the parameters for DescribeLoadBalancers.
class DescribeAccessPointsOutput {
  /// Information about the load balancers.
  final List<LoadBalancerDescription>? loadBalancerDescriptions;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String? nextMarker;

  DescribeAccessPointsOutput({
    this.loadBalancerDescriptions,
    this.nextMarker,
  });
  factory DescribeAccessPointsOutput.fromXml(_s.XmlElement elem) {
    return DescribeAccessPointsOutput(
      loadBalancerDescriptions: _s
          .extractXmlChild(elem, 'LoadBalancerDescriptions')
          ?.let((elem) => elem
              .findElements('member')
              .map(LoadBalancerDescription.fromXml)
              .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }

  Map<String, dynamic> toJson() {
    final loadBalancerDescriptions = this.loadBalancerDescriptions;
    final nextMarker = this.nextMarker;
    return {
      if (loadBalancerDescriptions != null)
        'LoadBalancerDescriptions': loadBalancerDescriptions,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class DescribeAccountLimitsOutput {
  /// Information about the limits.
  final List<Limit>? limits;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
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

/// Contains the output for DescribeInstanceHealth.
class DescribeEndPointStateOutput {
  /// Information about the health of the instances.
  final List<InstanceState>? instanceStates;

  DescribeEndPointStateOutput({
    this.instanceStates,
  });
  factory DescribeEndPointStateOutput.fromXml(_s.XmlElement elem) {
    return DescribeEndPointStateOutput(
      instanceStates: _s.extractXmlChild(elem, 'InstanceStates')?.let((elem) =>
          elem.findElements('member').map(InstanceState.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceStates = this.instanceStates;
    return {
      if (instanceStates != null) 'InstanceStates': instanceStates,
    };
  }
}

/// Contains the output of DescribeLoadBalancerAttributes.
class DescribeLoadBalancerAttributesOutput {
  /// Information about the load balancer attributes.
  final LoadBalancerAttributes? loadBalancerAttributes;

  DescribeLoadBalancerAttributesOutput({
    this.loadBalancerAttributes,
  });
  factory DescribeLoadBalancerAttributesOutput.fromXml(_s.XmlElement elem) {
    return DescribeLoadBalancerAttributesOutput(
      loadBalancerAttributes: _s
          .extractXmlChild(elem, 'LoadBalancerAttributes')
          ?.let(LoadBalancerAttributes.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final loadBalancerAttributes = this.loadBalancerAttributes;
    return {
      if (loadBalancerAttributes != null)
        'LoadBalancerAttributes': loadBalancerAttributes,
    };
  }
}

/// Contains the output of DescribeLoadBalancerPolicies.
class DescribeLoadBalancerPoliciesOutput {
  /// Information about the policies.
  final List<PolicyDescription>? policyDescriptions;

  DescribeLoadBalancerPoliciesOutput({
    this.policyDescriptions,
  });
  factory DescribeLoadBalancerPoliciesOutput.fromXml(_s.XmlElement elem) {
    return DescribeLoadBalancerPoliciesOutput(
      policyDescriptions: _s.extractXmlChild(elem, 'PolicyDescriptions')?.let(
          (elem) => elem
              .findElements('member')
              .map(PolicyDescription.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final policyDescriptions = this.policyDescriptions;
    return {
      if (policyDescriptions != null) 'PolicyDescriptions': policyDescriptions,
    };
  }
}

/// Contains the output of DescribeLoadBalancerPolicyTypes.
class DescribeLoadBalancerPolicyTypesOutput {
  /// Information about the policy types.
  final List<PolicyTypeDescription>? policyTypeDescriptions;

  DescribeLoadBalancerPolicyTypesOutput({
    this.policyTypeDescriptions,
  });
  factory DescribeLoadBalancerPolicyTypesOutput.fromXml(_s.XmlElement elem) {
    return DescribeLoadBalancerPolicyTypesOutput(
      policyTypeDescriptions: _s
          .extractXmlChild(elem, 'PolicyTypeDescriptions')
          ?.let((elem) => elem
              .findElements('member')
              .map(PolicyTypeDescription.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final policyTypeDescriptions = this.policyTypeDescriptions;
    return {
      if (policyTypeDescriptions != null)
        'PolicyTypeDescriptions': policyTypeDescriptions,
    };
  }
}

/// Contains the output for DescribeTags.
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

/// Contains the output of DetachLoadBalancerFromSubnets.
class DetachLoadBalancerFromSubnetsOutput {
  /// The IDs of the remaining subnets for the load balancer.
  final List<String>? subnets;

  DetachLoadBalancerFromSubnetsOutput({
    this.subnets,
  });
  factory DetachLoadBalancerFromSubnetsOutput.fromXml(_s.XmlElement elem) {
    return DetachLoadBalancerFromSubnetsOutput(
      subnets: _s
          .extractXmlChild(elem, 'Subnets')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final subnets = this.subnets;
    return {
      if (subnets != null) 'Subnets': subnets,
    };
  }
}

/// Information about a health check.
class HealthCheck {
  /// The number of consecutive health checks successes required before moving the
  /// instance to the <code>Healthy</code> state.
  final int healthyThreshold;

  /// The approximate interval, in seconds, between health checks of an individual
  /// instance.
  final int interval;

  /// The instance being checked. The protocol is either TCP, HTTP, HTTPS, or SSL.
  /// The range of valid ports is one (1) through 65535.
  ///
  /// TCP is the default, specified as a TCP: port pair, for example "TCP:5000".
  /// In this case, a health check simply attempts to open a TCP connection to the
  /// instance on the specified port. Failure to connect within the configured
  /// timeout is considered unhealthy.
  ///
  /// SSL is also specified as SSL: port pair, for example, SSL:5000.
  ///
  /// For HTTP/HTTPS, you must include a ping path in the string. HTTP is
  /// specified as a HTTP:port;/;PathToPing; grouping, for example
  /// "HTTP:80/weather/us/wa/seattle". In this case, a HTTP GET request is issued
  /// to the instance on the given port and path. Any answer other than "200 OK"
  /// within the timeout period is considered unhealthy.
  ///
  /// The total length of the HTTP ping target must be 1024 16-bit Unicode
  /// characters or less.
  final String target;

  /// The amount of time, in seconds, during which no response means a failed
  /// health check.
  ///
  /// This value must be less than the <code>Interval</code> value.
  final int timeout;

  /// The number of consecutive health check failures required before moving the
  /// instance to the <code>Unhealthy</code> state.
  final int unhealthyThreshold;

  HealthCheck({
    required this.healthyThreshold,
    required this.interval,
    required this.target,
    required this.timeout,
    required this.unhealthyThreshold,
  });
  factory HealthCheck.fromXml(_s.XmlElement elem) {
    return HealthCheck(
      healthyThreshold: _s.extractXmlIntValue(elem, 'HealthyThreshold')!,
      interval: _s.extractXmlIntValue(elem, 'Interval')!,
      target: _s.extractXmlStringValue(elem, 'Target')!,
      timeout: _s.extractXmlIntValue(elem, 'Timeout')!,
      unhealthyThreshold: _s.extractXmlIntValue(elem, 'UnhealthyThreshold')!,
    );
  }

  Map<String, dynamic> toJson() {
    final healthyThreshold = this.healthyThreshold;
    final interval = this.interval;
    final target = this.target;
    final timeout = this.timeout;
    final unhealthyThreshold = this.unhealthyThreshold;
    return {
      'HealthyThreshold': healthyThreshold,
      'Interval': interval,
      'Target': target,
      'Timeout': timeout,
      'UnhealthyThreshold': unhealthyThreshold,
    };
  }
}

/// The ID of an EC2 instance.
class Instance {
  /// The instance ID.
  final String? instanceId;

  Instance({
    this.instanceId,
  });
  factory Instance.fromXml(_s.XmlElement elem) {
    return Instance(
      instanceId: _s.extractXmlStringValue(elem, 'InstanceId'),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    return {
      if (instanceId != null) 'InstanceId': instanceId,
    };
  }
}

/// Information about the state of an EC2 instance.
class InstanceState {
  /// A description of the instance state. This string can contain one or more of
  /// the following messages.
  ///
  /// <ul>
  /// <li>
  /// <code>N/A</code>
  /// </li>
  /// <li>
  /// <code>A transient error occurred. Please try again later.</code>
  /// </li>
  /// <li>
  /// <code>Instance has failed at least the UnhealthyThreshold number of health
  /// checks consecutively.</code>
  /// </li>
  /// <li>
  /// <code>Instance has not passed the configured HealthyThreshold number of
  /// health checks consecutively.</code>
  /// </li>
  /// <li>
  /// <code>Instance registration is still in progress.</code>
  /// </li>
  /// <li>
  /// <code>Instance is in the EC2 Availability Zone for which LoadBalancer is not
  /// configured to route traffic to.</code>
  /// </li>
  /// <li>
  /// <code>Instance is not currently registered with the LoadBalancer.</code>
  /// </li>
  /// <li>
  /// <code>Instance deregistration currently in progress.</code>
  /// </li>
  /// <li>
  /// <code>Disable Availability Zone is currently in progress.</code>
  /// </li>
  /// <li>
  /// <code>Instance is in pending state.</code>
  /// </li>
  /// <li>
  /// <code>Instance is in stopped state.</code>
  /// </li>
  /// <li>
  /// <code>Instance is in terminated state.</code>
  /// </li>
  /// </ul>
  final String? description;

  /// The ID of the instance.
  final String? instanceId;

  /// Information about the cause of <code>OutOfService</code> instances.
  /// Specifically, whether the cause is Elastic Load Balancing or the instance.
  ///
  /// Valid values: <code>ELB</code> | <code>Instance</code> | <code>N/A</code>
  final String? reasonCode;

  /// The current state of the instance.
  ///
  /// Valid values: <code>InService</code> | <code>OutOfService</code> |
  /// <code>Unknown</code>
  final String? state;

  InstanceState({
    this.description,
    this.instanceId,
    this.reasonCode,
    this.state,
  });
  factory InstanceState.fromXml(_s.XmlElement elem) {
    return InstanceState(
      description: _s.extractXmlStringValue(elem, 'Description'),
      instanceId: _s.extractXmlStringValue(elem, 'InstanceId'),
      reasonCode: _s.extractXmlStringValue(elem, 'ReasonCode'),
      state: _s.extractXmlStringValue(elem, 'State'),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final instanceId = this.instanceId;
    final reasonCode = this.reasonCode;
    final state = this.state;
    return {
      if (description != null) 'Description': description,
      if (instanceId != null) 'InstanceId': instanceId,
      if (reasonCode != null) 'ReasonCode': reasonCode,
      if (state != null) 'State': state,
    };
  }
}

/// Information about a policy for duration-based session stickiness.
class LBCookieStickinessPolicy {
  /// The time period, in seconds, after which the cookie should be considered
  /// stale. If this parameter is not specified, the stickiness session lasts for
  /// the duration of the browser session.
  final int? cookieExpirationPeriod;

  /// The name of the policy. This name must be unique within the set of policies
  /// for this load balancer.
  final String? policyName;

  LBCookieStickinessPolicy({
    this.cookieExpirationPeriod,
    this.policyName,
  });
  factory LBCookieStickinessPolicy.fromXml(_s.XmlElement elem) {
    return LBCookieStickinessPolicy(
      cookieExpirationPeriod:
          _s.extractXmlIntValue(elem, 'CookieExpirationPeriod'),
      policyName: _s.extractXmlStringValue(elem, 'PolicyName'),
    );
  }

  Map<String, dynamic> toJson() {
    final cookieExpirationPeriod = this.cookieExpirationPeriod;
    final policyName = this.policyName;
    return {
      if (cookieExpirationPeriod != null)
        'CookieExpirationPeriod': cookieExpirationPeriod,
      if (policyName != null) 'PolicyName': policyName,
    };
  }
}

/// Information about an Elastic Load Balancing resource limit for your AWS
/// account.
class Limit {
  /// The maximum value of the limit.
  final String? max;

  /// The name of the limit. The possible values are:
  ///
  /// <ul>
  /// <li>
  /// classic-listeners
  /// </li>
  /// <li>
  /// classic-load-balancers
  /// </li>
  /// <li>
  /// classic-registered-instances
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
///
/// For information about the protocols and the ports supported by Elastic Load
/// Balancing, see <a
/// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html">Listeners
/// for Your Classic Load Balancer</a> in the <i>Classic Load Balancers
/// Guide</i>.
class Listener {
  /// The port on which the instance is listening.
  final int instancePort;

  /// The port on which the load balancer is listening. On EC2-VPC, you can
  /// specify any port from the range 1-65535. On EC2-Classic, you can specify any
  /// port from the following list: 25, 80, 443, 465, 587, 1024-65535.
  final int loadBalancerPort;

  /// The load balancer transport protocol to use for routing: HTTP, HTTPS, TCP,
  /// or SSL.
  final String protocol;

  /// The protocol to use for routing traffic to instances: HTTP, HTTPS, TCP, or
  /// SSL.
  ///
  /// If the front-end protocol is TCP or SSL, the back-end protocol must be TCP
  /// or SSL. If the front-end protocol is HTTP or HTTPS, the back-end protocol
  /// must be HTTP or HTTPS.
  ///
  /// If there is another listener with the same <code>InstancePort</code> whose
  /// <code>InstanceProtocol</code> is secure, (HTTPS or SSL), the listener's
  /// <code>InstanceProtocol</code> must also be secure.
  ///
  /// If there is another listener with the same <code>InstancePort</code> whose
  /// <code>InstanceProtocol</code> is HTTP or TCP, the listener's
  /// <code>InstanceProtocol</code> must be HTTP or TCP.
  final String? instanceProtocol;

  /// The Amazon Resource Name (ARN) of the server certificate.
  final String? sSLCertificateId;

  Listener({
    required this.instancePort,
    required this.loadBalancerPort,
    required this.protocol,
    this.instanceProtocol,
    this.sSLCertificateId,
  });
  factory Listener.fromXml(_s.XmlElement elem) {
    return Listener(
      instancePort: _s.extractXmlIntValue(elem, 'InstancePort')!,
      loadBalancerPort: _s.extractXmlIntValue(elem, 'LoadBalancerPort')!,
      protocol: _s.extractXmlStringValue(elem, 'Protocol')!,
      instanceProtocol: _s.extractXmlStringValue(elem, 'InstanceProtocol'),
      sSLCertificateId: _s.extractXmlStringValue(elem, 'SSLCertificateId'),
    );
  }

  Map<String, dynamic> toJson() {
    final instancePort = this.instancePort;
    final loadBalancerPort = this.loadBalancerPort;
    final protocol = this.protocol;
    final instanceProtocol = this.instanceProtocol;
    final sSLCertificateId = this.sSLCertificateId;
    return {
      'InstancePort': instancePort,
      'LoadBalancerPort': loadBalancerPort,
      'Protocol': protocol,
      if (instanceProtocol != null) 'InstanceProtocol': instanceProtocol,
      if (sSLCertificateId != null) 'SSLCertificateId': sSLCertificateId,
    };
  }
}

/// The policies enabled for a listener.
class ListenerDescription {
  /// The listener.
  final Listener? listener;

  /// The policies. If there are no policies enabled, the list is empty.
  final List<String>? policyNames;

  ListenerDescription({
    this.listener,
    this.policyNames,
  });
  factory ListenerDescription.fromXml(_s.XmlElement elem) {
    return ListenerDescription(
      listener: _s.extractXmlChild(elem, 'Listener')?.let(Listener.fromXml),
      policyNames: _s
          .extractXmlChild(elem, 'PolicyNames')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final listener = this.listener;
    final policyNames = this.policyNames;
    return {
      if (listener != null) 'Listener': listener,
      if (policyNames != null) 'PolicyNames': policyNames,
    };
  }
}

/// The attributes for a load balancer.
class LoadBalancerAttributes {
  /// If enabled, the load balancer captures detailed information of all requests
  /// and delivers the information to the Amazon S3 bucket that you specify.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-access-logs.html">Enable
  /// Access Logs</a> in the <i>Classic Load Balancers Guide</i>.
  final AccessLog? accessLog;

  /// Any additional attributes.
  final List<AdditionalAttribute>? additionalAttributes;

  /// If enabled, the load balancer allows existing requests to complete before
  /// the load balancer shifts traffic away from a deregistered or unhealthy
  /// instance.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-conn-drain.html">Configure
  /// Connection Draining</a> in the <i>Classic Load Balancers Guide</i>.
  final ConnectionDraining? connectionDraining;

  /// If enabled, the load balancer allows the connections to remain idle (no data
  /// is sent over the connection) for the specified duration.
  ///
  /// By default, Elastic Load Balancing maintains a 60-second idle connection
  /// timeout for both front-end and back-end connections of your load balancer.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-idle-timeout.html">Configure
  /// Idle Connection Timeout</a> in the <i>Classic Load Balancers Guide</i>.
  final ConnectionSettings? connectionSettings;

  /// If enabled, the load balancer routes the request traffic evenly across all
  /// instances regardless of the Availability Zones.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-crosszone-lb.html">Configure
  /// Cross-Zone Load Balancing</a> in the <i>Classic Load Balancers Guide</i>.
  final CrossZoneLoadBalancing? crossZoneLoadBalancing;

  LoadBalancerAttributes({
    this.accessLog,
    this.additionalAttributes,
    this.connectionDraining,
    this.connectionSettings,
    this.crossZoneLoadBalancing,
  });
  factory LoadBalancerAttributes.fromXml(_s.XmlElement elem) {
    return LoadBalancerAttributes(
      accessLog: _s.extractXmlChild(elem, 'AccessLog')?.let(AccessLog.fromXml),
      additionalAttributes: _s
          .extractXmlChild(elem, 'AdditionalAttributes')
          ?.let((elem) => elem
              .findElements('member')
              .map(AdditionalAttribute.fromXml)
              .toList()),
      connectionDraining: _s
          .extractXmlChild(elem, 'ConnectionDraining')
          ?.let(ConnectionDraining.fromXml),
      connectionSettings: _s
          .extractXmlChild(elem, 'ConnectionSettings')
          ?.let(ConnectionSettings.fromXml),
      crossZoneLoadBalancing: _s
          .extractXmlChild(elem, 'CrossZoneLoadBalancing')
          ?.let(CrossZoneLoadBalancing.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final accessLog = this.accessLog;
    final additionalAttributes = this.additionalAttributes;
    final connectionDraining = this.connectionDraining;
    final connectionSettings = this.connectionSettings;
    final crossZoneLoadBalancing = this.crossZoneLoadBalancing;
    return {
      if (accessLog != null) 'AccessLog': accessLog,
      if (additionalAttributes != null)
        'AdditionalAttributes': additionalAttributes,
      if (connectionDraining != null) 'ConnectionDraining': connectionDraining,
      if (connectionSettings != null) 'ConnectionSettings': connectionSettings,
      if (crossZoneLoadBalancing != null)
        'CrossZoneLoadBalancing': crossZoneLoadBalancing,
    };
  }
}

/// Information about a load balancer.
class LoadBalancerDescription {
  /// The Availability Zones for the load balancer.
  final List<String>? availabilityZones;

  /// Information about your EC2 instances.
  final List<BackendServerDescription>? backendServerDescriptions;

  /// The DNS name of the load balancer.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/using-domain-names-with-elb.html">Configure
  /// a Custom Domain Name</a> in the <i>Classic Load Balancers Guide</i>.
  final String? canonicalHostedZoneName;

  /// The ID of the Amazon Route 53 hosted zone for the load balancer.
  final String? canonicalHostedZoneNameID;

  /// The date and time the load balancer was created.
  final DateTime? createdTime;

  /// The DNS name of the load balancer.
  final String? dNSName;

  /// Information about the health checks conducted on the load balancer.
  final HealthCheck? healthCheck;

  /// The IDs of the instances for the load balancer.
  final List<Instance>? instances;

  /// The listeners for the load balancer.
  final List<ListenerDescription>? listenerDescriptions;

  /// The name of the load balancer.
  final String? loadBalancerName;

  /// The policies defined for the load balancer.
  final Policies? policies;

  /// The type of load balancer. Valid only for load balancers in a VPC.
  ///
  /// If <code>Scheme</code> is <code>internet-facing</code>, the load balancer
  /// has a public DNS name that resolves to a public IP address.
  ///
  /// If <code>Scheme</code> is <code>internal</code>, the load balancer has a
  /// public DNS name that resolves to a private IP address.
  final String? scheme;

  /// The security groups for the load balancer. Valid only for load balancers in
  /// a VPC.
  final List<String>? securityGroups;

  /// The security group for the load balancer, which you can use as part of your
  /// inbound rules for your registered instances. To only allow traffic from load
  /// balancers, add a security group rule that specifies this source security
  /// group as the inbound source.
  final SourceSecurityGroup? sourceSecurityGroup;

  /// The IDs of the subnets for the load balancer.
  final List<String>? subnets;

  /// The ID of the VPC for the load balancer.
  final String? vPCId;

  LoadBalancerDescription({
    this.availabilityZones,
    this.backendServerDescriptions,
    this.canonicalHostedZoneName,
    this.canonicalHostedZoneNameID,
    this.createdTime,
    this.dNSName,
    this.healthCheck,
    this.instances,
    this.listenerDescriptions,
    this.loadBalancerName,
    this.policies,
    this.scheme,
    this.securityGroups,
    this.sourceSecurityGroup,
    this.subnets,
    this.vPCId,
  });
  factory LoadBalancerDescription.fromXml(_s.XmlElement elem) {
    return LoadBalancerDescription(
      availabilityZones: _s
          .extractXmlChild(elem, 'AvailabilityZones')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      backendServerDescriptions: _s
          .extractXmlChild(elem, 'BackendServerDescriptions')
          ?.let((elem) => elem
              .findElements('member')
              .map(BackendServerDescription.fromXml)
              .toList()),
      canonicalHostedZoneName:
          _s.extractXmlStringValue(elem, 'CanonicalHostedZoneName'),
      canonicalHostedZoneNameID:
          _s.extractXmlStringValue(elem, 'CanonicalHostedZoneNameID'),
      createdTime: _s.extractXmlDateTimeValue(elem, 'CreatedTime'),
      dNSName: _s.extractXmlStringValue(elem, 'DNSName'),
      healthCheck:
          _s.extractXmlChild(elem, 'HealthCheck')?.let(HealthCheck.fromXml),
      instances: _s.extractXmlChild(elem, 'Instances')?.let(
          (elem) => elem.findElements('member').map(Instance.fromXml).toList()),
      listenerDescriptions: _s
          .extractXmlChild(elem, 'ListenerDescriptions')
          ?.let((elem) => elem
              .findElements('member')
              .map(ListenerDescription.fromXml)
              .toList()),
      loadBalancerName: _s.extractXmlStringValue(elem, 'LoadBalancerName'),
      policies: _s.extractXmlChild(elem, 'Policies')?.let(Policies.fromXml),
      scheme: _s.extractXmlStringValue(elem, 'Scheme'),
      securityGroups: _s
          .extractXmlChild(elem, 'SecurityGroups')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      sourceSecurityGroup: _s
          .extractXmlChild(elem, 'SourceSecurityGroup')
          ?.let(SourceSecurityGroup.fromXml),
      subnets: _s
          .extractXmlChild(elem, 'Subnets')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      vPCId: _s.extractXmlStringValue(elem, 'VPCId'),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final backendServerDescriptions = this.backendServerDescriptions;
    final canonicalHostedZoneName = this.canonicalHostedZoneName;
    final canonicalHostedZoneNameID = this.canonicalHostedZoneNameID;
    final createdTime = this.createdTime;
    final dNSName = this.dNSName;
    final healthCheck = this.healthCheck;
    final instances = this.instances;
    final listenerDescriptions = this.listenerDescriptions;
    final loadBalancerName = this.loadBalancerName;
    final policies = this.policies;
    final scheme = this.scheme;
    final securityGroups = this.securityGroups;
    final sourceSecurityGroup = this.sourceSecurityGroup;
    final subnets = this.subnets;
    final vPCId = this.vPCId;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (backendServerDescriptions != null)
        'BackendServerDescriptions': backendServerDescriptions,
      if (canonicalHostedZoneName != null)
        'CanonicalHostedZoneName': canonicalHostedZoneName,
      if (canonicalHostedZoneNameID != null)
        'CanonicalHostedZoneNameID': canonicalHostedZoneNameID,
      if (createdTime != null) 'CreatedTime': iso8601ToJson(createdTime),
      if (dNSName != null) 'DNSName': dNSName,
      if (healthCheck != null) 'HealthCheck': healthCheck,
      if (instances != null) 'Instances': instances,
      if (listenerDescriptions != null)
        'ListenerDescriptions': listenerDescriptions,
      if (loadBalancerName != null) 'LoadBalancerName': loadBalancerName,
      if (policies != null) 'Policies': policies,
      if (scheme != null) 'Scheme': scheme,
      if (securityGroups != null) 'SecurityGroups': securityGroups,
      if (sourceSecurityGroup != null)
        'SourceSecurityGroup': sourceSecurityGroup,
      if (subnets != null) 'Subnets': subnets,
      if (vPCId != null) 'VPCId': vPCId,
    };
  }
}

/// Contains the output of ModifyLoadBalancerAttributes.
class ModifyLoadBalancerAttributesOutput {
  /// Information about the load balancer attributes.
  final LoadBalancerAttributes? loadBalancerAttributes;

  /// The name of the load balancer.
  final String? loadBalancerName;

  ModifyLoadBalancerAttributesOutput({
    this.loadBalancerAttributes,
    this.loadBalancerName,
  });
  factory ModifyLoadBalancerAttributesOutput.fromXml(_s.XmlElement elem) {
    return ModifyLoadBalancerAttributesOutput(
      loadBalancerAttributes: _s
          .extractXmlChild(elem, 'LoadBalancerAttributes')
          ?.let(LoadBalancerAttributes.fromXml),
      loadBalancerName: _s.extractXmlStringValue(elem, 'LoadBalancerName'),
    );
  }

  Map<String, dynamic> toJson() {
    final loadBalancerAttributes = this.loadBalancerAttributes;
    final loadBalancerName = this.loadBalancerName;
    return {
      if (loadBalancerAttributes != null)
        'LoadBalancerAttributes': loadBalancerAttributes,
      if (loadBalancerName != null) 'LoadBalancerName': loadBalancerName,
    };
  }
}

/// The policies for a load balancer.
class Policies {
  /// The stickiness policies created using
  /// <a>CreateAppCookieStickinessPolicy</a>.
  final List<AppCookieStickinessPolicy>? appCookieStickinessPolicies;

  /// The stickiness policies created using <a>CreateLBCookieStickinessPolicy</a>.
  final List<LBCookieStickinessPolicy>? lBCookieStickinessPolicies;

  /// The policies other than the stickiness policies.
  final List<String>? otherPolicies;

  Policies({
    this.appCookieStickinessPolicies,
    this.lBCookieStickinessPolicies,
    this.otherPolicies,
  });
  factory Policies.fromXml(_s.XmlElement elem) {
    return Policies(
      appCookieStickinessPolicies: _s
          .extractXmlChild(elem, 'AppCookieStickinessPolicies')
          ?.let((elem) => elem
              .findElements('member')
              .map(AppCookieStickinessPolicy.fromXml)
              .toList()),
      lBCookieStickinessPolicies: _s
          .extractXmlChild(elem, 'LBCookieStickinessPolicies')
          ?.let((elem) => elem
              .findElements('member')
              .map(LBCookieStickinessPolicy.fromXml)
              .toList()),
      otherPolicies: _s
          .extractXmlChild(elem, 'OtherPolicies')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final appCookieStickinessPolicies = this.appCookieStickinessPolicies;
    final lBCookieStickinessPolicies = this.lBCookieStickinessPolicies;
    final otherPolicies = this.otherPolicies;
    return {
      if (appCookieStickinessPolicies != null)
        'AppCookieStickinessPolicies': appCookieStickinessPolicies,
      if (lBCookieStickinessPolicies != null)
        'LBCookieStickinessPolicies': lBCookieStickinessPolicies,
      if (otherPolicies != null) 'OtherPolicies': otherPolicies,
    };
  }
}

/// Information about a policy attribute.
class PolicyAttribute {
  /// The name of the attribute.
  final String? attributeName;

  /// The value of the attribute.
  final String? attributeValue;

  PolicyAttribute({
    this.attributeName,
    this.attributeValue,
  });

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final attributeValue = this.attributeValue;
    return {
      if (attributeName != null) 'AttributeName': attributeName,
      if (attributeValue != null) 'AttributeValue': attributeValue,
    };
  }
}

/// Information about a policy attribute.
class PolicyAttributeDescription {
  /// The name of the attribute.
  final String? attributeName;

  /// The value of the attribute.
  final String? attributeValue;

  PolicyAttributeDescription({
    this.attributeName,
    this.attributeValue,
  });
  factory PolicyAttributeDescription.fromXml(_s.XmlElement elem) {
    return PolicyAttributeDescription(
      attributeName: _s.extractXmlStringValue(elem, 'AttributeName'),
      attributeValue: _s.extractXmlStringValue(elem, 'AttributeValue'),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final attributeValue = this.attributeValue;
    return {
      if (attributeName != null) 'AttributeName': attributeName,
      if (attributeValue != null) 'AttributeValue': attributeValue,
    };
  }
}

/// Information about a policy attribute type.
class PolicyAttributeTypeDescription {
  /// The name of the attribute.
  final String? attributeName;

  /// The type of the attribute. For example, <code>Boolean</code> or
  /// <code>Integer</code>.
  final String? attributeType;

  /// The cardinality of the attribute.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// ONE(1) : Single value required
  /// </li>
  /// <li>
  /// ZERO_OR_ONE(0..1) : Up to one value is allowed
  /// </li>
  /// <li>
  /// ZERO_OR_MORE(0..*) : Optional. Multiple values are allowed
  /// </li>
  /// <li>
  /// ONE_OR_MORE(1..*0) : Required. Multiple values are allowed
  /// </li>
  /// </ul>
  final String? cardinality;

  /// The default value of the attribute, if applicable.
  final String? defaultValue;

  /// A description of the attribute.
  final String? description;

  PolicyAttributeTypeDescription({
    this.attributeName,
    this.attributeType,
    this.cardinality,
    this.defaultValue,
    this.description,
  });
  factory PolicyAttributeTypeDescription.fromXml(_s.XmlElement elem) {
    return PolicyAttributeTypeDescription(
      attributeName: _s.extractXmlStringValue(elem, 'AttributeName'),
      attributeType: _s.extractXmlStringValue(elem, 'AttributeType'),
      cardinality: _s.extractXmlStringValue(elem, 'Cardinality'),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      description: _s.extractXmlStringValue(elem, 'Description'),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final attributeType = this.attributeType;
    final cardinality = this.cardinality;
    final defaultValue = this.defaultValue;
    final description = this.description;
    return {
      if (attributeName != null) 'AttributeName': attributeName,
      if (attributeType != null) 'AttributeType': attributeType,
      if (cardinality != null) 'Cardinality': cardinality,
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (description != null) 'Description': description,
    };
  }
}

/// Information about a policy.
class PolicyDescription {
  /// The policy attributes.
  final List<PolicyAttributeDescription>? policyAttributeDescriptions;

  /// The name of the policy.
  final String? policyName;

  /// The name of the policy type.
  final String? policyTypeName;

  PolicyDescription({
    this.policyAttributeDescriptions,
    this.policyName,
    this.policyTypeName,
  });
  factory PolicyDescription.fromXml(_s.XmlElement elem) {
    return PolicyDescription(
      policyAttributeDescriptions: _s
          .extractXmlChild(elem, 'PolicyAttributeDescriptions')
          ?.let((elem) => elem
              .findElements('member')
              .map(PolicyAttributeDescription.fromXml)
              .toList()),
      policyName: _s.extractXmlStringValue(elem, 'PolicyName'),
      policyTypeName: _s.extractXmlStringValue(elem, 'PolicyTypeName'),
    );
  }

  Map<String, dynamic> toJson() {
    final policyAttributeDescriptions = this.policyAttributeDescriptions;
    final policyName = this.policyName;
    final policyTypeName = this.policyTypeName;
    return {
      if (policyAttributeDescriptions != null)
        'PolicyAttributeDescriptions': policyAttributeDescriptions,
      if (policyName != null) 'PolicyName': policyName,
      if (policyTypeName != null) 'PolicyTypeName': policyTypeName,
    };
  }
}

/// Information about a policy type.
class PolicyTypeDescription {
  /// A description of the policy type.
  final String? description;

  /// The description of the policy attributes associated with the policies
  /// defined by Elastic Load Balancing.
  final List<PolicyAttributeTypeDescription>? policyAttributeTypeDescriptions;

  /// The name of the policy type.
  final String? policyTypeName;

  PolicyTypeDescription({
    this.description,
    this.policyAttributeTypeDescriptions,
    this.policyTypeName,
  });
  factory PolicyTypeDescription.fromXml(_s.XmlElement elem) {
    return PolicyTypeDescription(
      description: _s.extractXmlStringValue(elem, 'Description'),
      policyAttributeTypeDescriptions: _s
          .extractXmlChild(elem, 'PolicyAttributeTypeDescriptions')
          ?.let((elem) => elem
              .findElements('member')
              .map(PolicyAttributeTypeDescription.fromXml)
              .toList()),
      policyTypeName: _s.extractXmlStringValue(elem, 'PolicyTypeName'),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final policyAttributeTypeDescriptions =
        this.policyAttributeTypeDescriptions;
    final policyTypeName = this.policyTypeName;
    return {
      if (description != null) 'Description': description,
      if (policyAttributeTypeDescriptions != null)
        'PolicyAttributeTypeDescriptions': policyAttributeTypeDescriptions,
      if (policyTypeName != null) 'PolicyTypeName': policyTypeName,
    };
  }
}

/// Contains the output of RegisterInstancesWithLoadBalancer.
class RegisterEndPointsOutput {
  /// The updated list of instances for the load balancer.
  final List<Instance>? instances;

  RegisterEndPointsOutput({
    this.instances,
  });
  factory RegisterEndPointsOutput.fromXml(_s.XmlElement elem) {
    return RegisterEndPointsOutput(
      instances: _s.extractXmlChild(elem, 'Instances')?.let(
          (elem) => elem.findElements('member').map(Instance.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final instances = this.instances;
    return {
      if (instances != null) 'Instances': instances,
    };
  }
}

/// Contains the output for DisableAvailabilityZonesForLoadBalancer.
class RemoveAvailabilityZonesOutput {
  /// The remaining Availability Zones for the load balancer.
  final List<String>? availabilityZones;

  RemoveAvailabilityZonesOutput({
    this.availabilityZones,
  });
  factory RemoveAvailabilityZonesOutput.fromXml(_s.XmlElement elem) {
    return RemoveAvailabilityZonesOutput(
      availabilityZones: _s
          .extractXmlChild(elem, 'AvailabilityZones')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
    };
  }
}

/// Contains the output of RemoveTags.
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

/// Contains the output of SetLoadBalancerListenerSSLCertificate.
class SetLoadBalancerListenerSSLCertificateOutput {
  SetLoadBalancerListenerSSLCertificateOutput();
  factory SetLoadBalancerListenerSSLCertificateOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetLoadBalancerListenerSSLCertificateOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the output of SetLoadBalancerPoliciesForBackendServer.
class SetLoadBalancerPoliciesForBackendServerOutput {
  SetLoadBalancerPoliciesForBackendServerOutput();
  factory SetLoadBalancerPoliciesForBackendServerOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetLoadBalancerPoliciesForBackendServerOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the output of SetLoadBalancePoliciesOfListener.
class SetLoadBalancerPoliciesOfListenerOutput {
  SetLoadBalancerPoliciesOfListenerOutput();
  factory SetLoadBalancerPoliciesOfListenerOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetLoadBalancerPoliciesOfListenerOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about a source security group.
class SourceSecurityGroup {
  /// The name of the security group.
  final String? groupName;

  /// The owner of the security group.
  final String? ownerAlias;

  SourceSecurityGroup({
    this.groupName,
    this.ownerAlias,
  });
  factory SourceSecurityGroup.fromXml(_s.XmlElement elem) {
    return SourceSecurityGroup(
      groupName: _s.extractXmlStringValue(elem, 'GroupName'),
      ownerAlias: _s.extractXmlStringValue(elem, 'OwnerAlias'),
    );
  }

  Map<String, dynamic> toJson() {
    final groupName = this.groupName;
    final ownerAlias = this.ownerAlias;
    return {
      if (groupName != null) 'GroupName': groupName,
      if (ownerAlias != null) 'OwnerAlias': ownerAlias,
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

/// The tags associated with a load balancer.
class TagDescription {
  /// The name of the load balancer.
  final String? loadBalancerName;

  /// The tags.
  final List<Tag>? tags;

  TagDescription({
    this.loadBalancerName,
    this.tags,
  });
  factory TagDescription.fromXml(_s.XmlElement elem) {
    return TagDescription(
      loadBalancerName: _s.extractXmlStringValue(elem, 'LoadBalancerName'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final loadBalancerName = this.loadBalancerName;
    final tags = this.tags;
    return {
      if (loadBalancerName != null) 'LoadBalancerName': loadBalancerName,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// The key of a tag.
class TagKeyOnly {
  /// The name of the key.
  final String? key;

  TagKeyOnly({
    this.key,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      if (key != null) 'Key': key,
    };
  }
}

class AccessPointNotFoundException extends _s.GenericAwsException {
  AccessPointNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'AccessPointNotFoundException', message: message);
}

class CertificateNotFoundException extends _s.GenericAwsException {
  CertificateNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'CertificateNotFoundException', message: message);
}

class DependencyThrottleException extends _s.GenericAwsException {
  DependencyThrottleException({String? type, String? message})
      : super(
            type: type, code: 'DependencyThrottleException', message: message);
}

class DuplicateAccessPointNameException extends _s.GenericAwsException {
  DuplicateAccessPointNameException({String? type, String? message})
      : super(
            type: type,
            code: 'DuplicateAccessPointNameException',
            message: message);
}

class DuplicateListenerException extends _s.GenericAwsException {
  DuplicateListenerException({String? type, String? message})
      : super(type: type, code: 'DuplicateListenerException', message: message);
}

class DuplicatePolicyNameException extends _s.GenericAwsException {
  DuplicatePolicyNameException({String? type, String? message})
      : super(
            type: type, code: 'DuplicatePolicyNameException', message: message);
}

class DuplicateTagKeysException extends _s.GenericAwsException {
  DuplicateTagKeysException({String? type, String? message})
      : super(type: type, code: 'DuplicateTagKeysException', message: message);
}

class InvalidConfigurationRequestException extends _s.GenericAwsException {
  InvalidConfigurationRequestException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidConfigurationRequestException',
            message: message);
}

class InvalidEndPointException extends _s.GenericAwsException {
  InvalidEndPointException({String? type, String? message})
      : super(type: type, code: 'InvalidEndPointException', message: message);
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

class ListenerNotFoundException extends _s.GenericAwsException {
  ListenerNotFoundException({String? type, String? message})
      : super(type: type, code: 'ListenerNotFoundException', message: message);
}

class LoadBalancerAttributeNotFoundException extends _s.GenericAwsException {
  LoadBalancerAttributeNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'LoadBalancerAttributeNotFoundException',
            message: message);
}

class OperationNotPermittedException extends _s.GenericAwsException {
  OperationNotPermittedException({String? type, String? message})
      : super(
            type: type,
            code: 'OperationNotPermittedException',
            message: message);
}

class PolicyNotFoundException extends _s.GenericAwsException {
  PolicyNotFoundException({String? type, String? message})
      : super(type: type, code: 'PolicyNotFoundException', message: message);
}

class PolicyTypeNotFoundException extends _s.GenericAwsException {
  PolicyTypeNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'PolicyTypeNotFoundException', message: message);
}

class SubnetNotFoundException extends _s.GenericAwsException {
  SubnetNotFoundException({String? type, String? message})
      : super(type: type, code: 'SubnetNotFoundException', message: message);
}

class TooManyAccessPointsException extends _s.GenericAwsException {
  TooManyAccessPointsException({String? type, String? message})
      : super(
            type: type, code: 'TooManyAccessPointsException', message: message);
}

class TooManyPoliciesException extends _s.GenericAwsException {
  TooManyPoliciesException({String? type, String? message})
      : super(type: type, code: 'TooManyPoliciesException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnsupportedProtocolException extends _s.GenericAwsException {
  UnsupportedProtocolException({String? type, String? message})
      : super(
            type: type, code: 'UnsupportedProtocolException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessPointNotFoundException': (type, message) =>
      AccessPointNotFoundException(type: type, message: message),
  'CertificateNotFoundException': (type, message) =>
      CertificateNotFoundException(type: type, message: message),
  'DependencyThrottleException': (type, message) =>
      DependencyThrottleException(type: type, message: message),
  'DuplicateAccessPointNameException': (type, message) =>
      DuplicateAccessPointNameException(type: type, message: message),
  'DuplicateListenerException': (type, message) =>
      DuplicateListenerException(type: type, message: message),
  'DuplicatePolicyNameException': (type, message) =>
      DuplicatePolicyNameException(type: type, message: message),
  'DuplicateTagKeysException': (type, message) =>
      DuplicateTagKeysException(type: type, message: message),
  'InvalidConfigurationRequestException': (type, message) =>
      InvalidConfigurationRequestException(type: type, message: message),
  'InvalidEndPointException': (type, message) =>
      InvalidEndPointException(type: type, message: message),
  'InvalidSchemeException': (type, message) =>
      InvalidSchemeException(type: type, message: message),
  'InvalidSecurityGroupException': (type, message) =>
      InvalidSecurityGroupException(type: type, message: message),
  'InvalidSubnetException': (type, message) =>
      InvalidSubnetException(type: type, message: message),
  'ListenerNotFoundException': (type, message) =>
      ListenerNotFoundException(type: type, message: message),
  'LoadBalancerAttributeNotFoundException': (type, message) =>
      LoadBalancerAttributeNotFoundException(type: type, message: message),
  'OperationNotPermittedException': (type, message) =>
      OperationNotPermittedException(type: type, message: message),
  'PolicyNotFoundException': (type, message) =>
      PolicyNotFoundException(type: type, message: message),
  'PolicyTypeNotFoundException': (type, message) =>
      PolicyTypeNotFoundException(type: type, message: message),
  'SubnetNotFoundException': (type, message) =>
      SubnetNotFoundException(type: type, message: message),
  'TooManyAccessPointsException': (type, message) =>
      TooManyAccessPointsException(type: type, message: message),
  'TooManyPoliciesException': (type, message) =>
      TooManyPoliciesException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnsupportedProtocolException': (type, message) =>
      UnsupportedProtocolException(type: type, message: message),
};
