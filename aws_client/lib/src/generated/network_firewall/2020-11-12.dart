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

part '2020-11-12.g.dart';

/// This is the API Reference for AWS Network Firewall. This guide is for
/// developers who need detailed information about the Network Firewall API
/// actions, data types, and errors.
///
/// <ul>
/// <li>
/// The REST API requires you to handle connection details, such as calculating
/// signatures, handling request retries, and error handling. For general
/// information about using the AWS REST APIs, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/aws-apis.html">AWS
/// APIs</a>.
///
/// To access Network Firewall using the REST API endpoint:
/// <code>https://network-firewall.&lt;region&gt;.amazonaws.com </code>
/// </li>
/// <li>
/// Alternatively, you can use one of the AWS SDKs to access an API that's
/// tailored to the programming language or platform that you're using. For more
/// information, see <a href="http://aws.amazon.com/tools/#SDKs">AWS SDKs</a>.
/// </li>
/// <li>
/// For descriptions of Network Firewall features, including and step-by-step
/// instructions on how to use them through the Network Firewall console, see
/// the <a
/// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/">Network
/// Firewall Developer Guide</a>.
/// </li>
/// </ul>
/// Network Firewall is a stateful, managed, network firewall and intrusion
/// detection and prevention service for Amazon Virtual Private Cloud (Amazon
/// VPC). With Network Firewall, you can filter traffic at the perimeter of your
/// VPC. This includes filtering traffic going to and coming from an internet
/// gateway, NAT gateway, or over VPN or AWS Direct Connect. Network Firewall
/// uses rules that are compatible with Suricata, a free, open source intrusion
/// detection system (IDS) engine. For information about Suricata, see the <a
/// href="https://suricata-ids.org/">Suricata website</a>.
///
/// You can use Network Firewall to monitor and protect your VPC traffic in a
/// number of ways. The following are just a few examples:
///
/// <ul>
/// <li>
/// Allow domains or IP addresses for known AWS service endpoints, such as
/// Amazon S3, and block all other forms of traffic.
/// </li>
/// <li>
/// Use custom lists of known bad domains to limit the types of domain names
/// that your applications can access.
/// </li>
/// <li>
/// Perform deep packet inspection on traffic entering or leaving your VPC.
/// </li>
/// <li>
/// Rate limit traffic going from AWS to on-premises IP destinations.
/// </li>
/// <li>
/// Use stateful protocol detection to filter protocols like HTTPS, regardless
/// of the port used.
/// </li>
/// </ul>
/// To enable Network Firewall for your VPCs, you perform steps in both Amazon
/// VPC and in Network Firewall. For information about using Amazon VPC, see <a
/// href="https://docs.aws.amazon.com/vpc/latest/userguide/">Amazon VPC User
/// Guide</a>.
///
/// To start using Network Firewall, do the following:
/// <ol>
/// <li>
/// (Optional) If you don't already have a VPC that you want to protect, create
/// it in Amazon VPC.
/// </li>
/// <li>
/// In Amazon VPC, in each Availability Zone where you want to have a firewall
/// endpoint, create a subnet for the sole use of Network Firewall.
/// </li>
/// <li>
/// In Network Firewall, create stateless and stateful rule groups, to define
/// the components of the network traffic filtering behavior that you want your
/// firewall to have.
/// </li>
/// <li>
/// In Network Firewall, create a firewall policy that uses your rule groups and
/// specifies additional default traffic filtering behavior.
/// </li>
/// <li>
/// In Network Firewall, create a firewall and specify your new firewall policy
/// and VPC subnets. Network Firewall creates a firewall endpoint in each subnet
/// that you specify, with the behavior that's defined in the firewall policy.
/// </li>
/// <li>
/// In Amazon VPC, use ingress routing enhancements to route traffic through the
/// new firewall endpoints.
/// </li> </ol>
class NetworkFirewall {
  final _s.JsonProtocol _protocol;
  NetworkFirewall({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'network-firewall',
            signingName: 'network-firewall',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associates a <a>FirewallPolicy</a> to a <a>Firewall</a>.
  ///
  /// A firewall policy defines how to monitor and manage your VPC network
  /// traffic, using a collection of inspection rule groups and other settings.
  /// Each firewall requires one firewall policy association, and you can use
  /// the same firewall policy for multiple firewalls.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidTokenException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [firewallPolicyArn] :
  /// The Amazon Resource Name (ARN) of the firewall policy.
  ///
  /// Parameter [firewallArn] :
  /// The Amazon Resource Name (ARN) of the firewall.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [firewallName] :
  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [updateToken] :
  /// An optional token that you can use for optimistic locking. Network
  /// Firewall returns a token to your requests that access the firewall. The
  /// token marks the state of the firewall resource at the time of the request.
  ///
  /// To make an unconditional change to the firewall, omit the token in your
  /// update request. Without the token, Network Firewall performs your updates
  /// regardless of whether the firewall has changed since you last retrieved
  /// it.
  ///
  /// To make a conditional change to the firewall, provide the token in your
  /// update request. Network Firewall uses the token to ensure that the
  /// firewall hasn't changed since you last retrieved it. If it has changed,
  /// the operation fails with an <code>InvalidTokenException</code>. If this
  /// happens, retrieve the firewall again to get a current copy of it with a
  /// new token. Reapply your changes as needed, then try the operation again
  /// using the new token.
  Future<AssociateFirewallPolicyResponse> associateFirewallPolicy({
    @_s.required String firewallPolicyArn,
    String firewallArn,
    String firewallName,
    String updateToken,
  }) async {
    ArgumentError.checkNotNull(firewallPolicyArn, 'firewallPolicyArn');
    _s.validateStringLength(
      'firewallPolicyArn',
      firewallPolicyArn,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'firewallPolicyArn',
      firewallPolicyArn,
      r'''^arn:aws.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'firewallArn',
      firewallArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringPattern(
      'firewallName',
      firewallName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'updateToken',
      updateToken,
      r'''^([0-9a-f]{8})-([0-9a-f]{4}-){3}([0-9a-f]{12})$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.AssociateFirewallPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallPolicyArn': firewallPolicyArn,
        if (firewallArn != null) 'FirewallArn': firewallArn,
        if (firewallName != null) 'FirewallName': firewallName,
        if (updateToken != null) 'UpdateToken': updateToken,
      },
    );

    return AssociateFirewallPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Associates the specified subnets in the Amazon VPC to the firewall. You
  /// can specify one subnet for each of the Availability Zones that the VPC
  /// spans.
  ///
  /// This request creates an AWS Network Firewall firewall endpoint in each of
  /// the subnets. To enable the firewall's protections, you must also modify
  /// the VPC's route tables for each subnet's Availability Zone, to redirect
  /// the traffic that's coming into and going out of the zone through the
  /// firewall endpoint.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidTokenException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [subnetMappings] :
  /// The IDs of the subnets that you want to associate with the firewall.
  ///
  /// Parameter [firewallArn] :
  /// The Amazon Resource Name (ARN) of the firewall.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [firewallName] :
  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [updateToken] :
  /// An optional token that you can use for optimistic locking. Network
  /// Firewall returns a token to your requests that access the firewall. The
  /// token marks the state of the firewall resource at the time of the request.
  ///
  /// To make an unconditional change to the firewall, omit the token in your
  /// update request. Without the token, Network Firewall performs your updates
  /// regardless of whether the firewall has changed since you last retrieved
  /// it.
  ///
  /// To make a conditional change to the firewall, provide the token in your
  /// update request. Network Firewall uses the token to ensure that the
  /// firewall hasn't changed since you last retrieved it. If it has changed,
  /// the operation fails with an <code>InvalidTokenException</code>. If this
  /// happens, retrieve the firewall again to get a current copy of it with a
  /// new token. Reapply your changes as needed, then try the operation again
  /// using the new token.
  Future<AssociateSubnetsResponse> associateSubnets({
    @_s.required List<SubnetMapping> subnetMappings,
    String firewallArn,
    String firewallName,
    String updateToken,
  }) async {
    ArgumentError.checkNotNull(subnetMappings, 'subnetMappings');
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'firewallArn',
      firewallArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringPattern(
      'firewallName',
      firewallName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'updateToken',
      updateToken,
      r'''^([0-9a-f]{8})-([0-9a-f]{4}-){3}([0-9a-f]{12})$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.AssociateSubnets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SubnetMappings': subnetMappings,
        if (firewallArn != null) 'FirewallArn': firewallArn,
        if (firewallName != null) 'FirewallName': firewallName,
        if (updateToken != null) 'UpdateToken': updateToken,
      },
    );

    return AssociateSubnetsResponse.fromJson(jsonResponse.body);
  }

  /// Creates an AWS Network Firewall <a>Firewall</a> and accompanying
  /// <a>FirewallStatus</a> for a VPC.
  ///
  /// The firewall defines the configuration settings for an AWS Network
  /// Firewall firewall. The settings that you can define at creation include
  /// the firewall policy, the subnets in your VPC to use for the firewall
  /// endpoints, and any tags that are attached to the firewall AWS resource.
  ///
  /// After you create a firewall, you can provide additional settings, like the
  /// logging configuration.
  ///
  /// To update the settings for a firewall, you use the operations that apply
  /// to the settings themselves, for example <a>UpdateLoggingConfiguration</a>,
  /// <a>AssociateSubnets</a>, and <a>UpdateFirewallDeleteProtection</a>.
  ///
  /// To manage a firewall's tags, use the standard AWS resource tagging
  /// operations, <a>ListTagsForResource</a>, <a>TagResource</a>, and
  /// <a>UntagResource</a>.
  ///
  /// To retrieve information about firewalls, use <a>ListFirewalls</a> and
  /// <a>DescribeFirewall</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [InsufficientCapacityException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [firewallName] :
  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  ///
  /// Parameter [firewallPolicyArn] :
  /// The Amazon Resource Name (ARN) of the <a>FirewallPolicy</a> that you want
  /// to use for the firewall.
  ///
  /// Parameter [subnetMappings] :
  /// The public subnets to use for your Network Firewall firewalls. Each subnet
  /// must belong to a different Availability Zone in the VPC. Network Firewall
  /// creates a firewall endpoint in each subnet.
  ///
  /// Parameter [vpcId] :
  /// The unique identifier of the VPC where Network Firewall should create the
  /// firewall.
  ///
  /// You can't change this setting after you create the firewall.
  ///
  /// Parameter [deleteProtection] :
  /// A flag indicating whether it is possible to delete the firewall. A setting
  /// of <code>TRUE</code> indicates that the firewall is protected against
  /// deletion. Use this setting to protect against accidentally deleting a
  /// firewall that is in use. When you create a firewall, the operation
  /// initializes this flag to <code>TRUE</code>.
  ///
  /// Parameter [description] :
  /// A description of the firewall.
  ///
  /// Parameter [firewallPolicyChangeProtection] :
  /// A setting indicating whether the firewall is protected against a change to
  /// the firewall policy association. Use this setting to protect against
  /// accidentally modifying the firewall policy for a firewall that is in use.
  /// When you create a firewall, the operation initializes this setting to
  /// <code>TRUE</code>.
  ///
  /// Parameter [subnetChangeProtection] :
  /// A setting indicating whether the firewall is protected against changes to
  /// the subnet associations. Use this setting to protect against accidentally
  /// modifying the subnet associations for a firewall that is in use. When you
  /// create a firewall, the operation initializes this setting to
  /// <code>TRUE</code>.
  ///
  /// Parameter [tags] :
  /// The key:value pairs to associate with the resource.
  Future<CreateFirewallResponse> createFirewall({
    @_s.required String firewallName,
    @_s.required String firewallPolicyArn,
    @_s.required List<SubnetMapping> subnetMappings,
    @_s.required String vpcId,
    bool deleteProtection,
    String description,
    bool firewallPolicyChangeProtection,
    bool subnetChangeProtection,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(firewallName, 'firewallName');
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'firewallName',
      firewallName,
      r'''^[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(firewallPolicyArn, 'firewallPolicyArn');
    _s.validateStringLength(
      'firewallPolicyArn',
      firewallPolicyArn,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'firewallPolicyArn',
      firewallPolicyArn,
      r'''^arn:aws.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(subnetMappings, 'subnetMappings');
    ArgumentError.checkNotNull(vpcId, 'vpcId');
    _s.validateStringLength(
      'vpcId',
      vpcId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'vpcId',
      vpcId,
      r'''^vpc-[0-9a-f]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^.*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.CreateFirewall'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallName': firewallName,
        'FirewallPolicyArn': firewallPolicyArn,
        'SubnetMappings': subnetMappings,
        'VpcId': vpcId,
        if (deleteProtection != null) 'DeleteProtection': deleteProtection,
        if (description != null) 'Description': description,
        if (firewallPolicyChangeProtection != null)
          'FirewallPolicyChangeProtection': firewallPolicyChangeProtection,
        if (subnetChangeProtection != null)
          'SubnetChangeProtection': subnetChangeProtection,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateFirewallResponse.fromJson(jsonResponse.body);
  }

  /// Creates the firewall policy for the firewall according to the
  /// specifications.
  ///
  /// An AWS Network Firewall firewall policy defines the behavior of a
  /// firewall, in a collection of stateless and stateful rule groups and other
  /// settings. You can use one firewall policy for multiple firewalls.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [InsufficientCapacityException].
  ///
  /// Parameter [firewallPolicy] :
  /// The rule groups and policy actions to use in the firewall policy.
  ///
  /// Parameter [firewallPolicyName] :
  /// The descriptive name of the firewall policy. You can't change the name of
  /// a firewall policy after you create it.
  ///
  /// Parameter [description] :
  /// A description of the firewall policy.
  ///
  /// Parameter [dryRun] :
  /// Indicates whether you want Network Firewall to just check the validity of
  /// the request, rather than run the request.
  ///
  /// If set to <code>TRUE</code>, Network Firewall checks whether the request
  /// can run successfully, but doesn't actually make the requested changes. The
  /// call returns the value that the request would return if you ran it with
  /// dry run set to <code>FALSE</code>, but doesn't make additions or changes
  /// to your resources. This option allows you to make sure that you have the
  /// required permissions to run the request and that your request parameters
  /// are valid.
  ///
  /// If set to <code>FALSE</code>, Network Firewall makes the requested changes
  /// to your resources.
  ///
  /// Parameter [tags] :
  /// The key:value pairs to associate with the resource.
  Future<CreateFirewallPolicyResponse> createFirewallPolicy({
    @_s.required FirewallPolicy firewallPolicy,
    @_s.required String firewallPolicyName,
    String description,
    bool dryRun,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(firewallPolicy, 'firewallPolicy');
    ArgumentError.checkNotNull(firewallPolicyName, 'firewallPolicyName');
    _s.validateStringLength(
      'firewallPolicyName',
      firewallPolicyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'firewallPolicyName',
      firewallPolicyName,
      r'''^[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^.*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.CreateFirewallPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallPolicy': firewallPolicy,
        'FirewallPolicyName': firewallPolicyName,
        if (description != null) 'Description': description,
        if (dryRun != null) 'DryRun': dryRun,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateFirewallPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Creates the specified stateless or stateful rule group, which includes the
  /// rules for network traffic inspection, a capacity setting, and tags.
  ///
  /// You provide your rule group specification in your request using either
  /// <code>RuleGroup</code> or <code>Rules</code>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [InsufficientCapacityException].
  ///
  /// Parameter [capacity] :
  /// The maximum operating resources that this rule group can use. Rule group
  /// capacity is fixed at creation. When you update a rule group, you are
  /// limited to this capacity. When you reference a rule group from a firewall
  /// policy, Network Firewall reserves this capacity for the rule group.
  ///
  /// You can retrieve the capacity that would be required for a rule group
  /// before you create the rule group by calling <a>CreateRuleGroup</a> with
  /// <code>DryRun</code> set to <code>TRUE</code>.
  /// <note>
  /// You can't change or exceed this capacity when you update the rule group,
  /// so leave room for your rule group to grow.
  /// </note>
  /// <b>Capacity for a stateless rule group</b>
  ///
  /// For a stateless rule group, the capacity required is the sum of the
  /// capacity requirements of the individual rules that you expect to have in
  /// the rule group.
  ///
  /// To calculate the capacity requirement of a single rule, multiply the
  /// capacity requirement values of each of the rule's match settings:
  ///
  /// <ul>
  /// <li>
  /// A match setting with no criteria specified has a value of 1.
  /// </li>
  /// <li>
  /// A match setting with <code>Any</code> specified has a value of 1.
  /// </li>
  /// <li>
  /// All other match settings have a value equal to the number of elements
  /// provided in the setting. For example, a protocol setting ["UDP"] and a
  /// source setting ["10.0.0.0/24"] each have a value of 1. A protocol setting
  /// ["UDP","TCP"] has a value of 2. A source setting
  /// ["10.0.0.0/24","10.0.0.1/24","10.0.0.2/24"] has a value of 3.
  /// </li>
  /// </ul>
  /// A rule with no criteria specified in any of its match settings has a
  /// capacity requirement of 1. A rule with protocol setting ["UDP","TCP"],
  /// source setting ["10.0.0.0/24","10.0.0.1/24","10.0.0.2/24"], and a single
  /// specification or no specification for each of the other match settings has
  /// a capacity requirement of 6.
  ///
  /// <b>Capacity for a stateful rule group</b>
  ///
  /// For a stateful rule group, the minimum capacity required is the number of
  /// individual rules that you expect to have in the rule group.
  ///
  /// Parameter [ruleGroupName] :
  /// The descriptive name of the rule group. You can't change the name of a
  /// rule group after you create it.
  ///
  /// Parameter [type] :
  /// Indicates whether the rule group is stateless or stateful. If the rule
  /// group is stateless, it contains stateless rules. If it is stateful, it
  /// contains stateful rules.
  ///
  /// Parameter [description] :
  /// A description of the rule group.
  ///
  /// Parameter [dryRun] :
  /// Indicates whether you want Network Firewall to just check the validity of
  /// the request, rather than run the request.
  ///
  /// If set to <code>TRUE</code>, Network Firewall checks whether the request
  /// can run successfully, but doesn't actually make the requested changes. The
  /// call returns the value that the request would return if you ran it with
  /// dry run set to <code>FALSE</code>, but doesn't make additions or changes
  /// to your resources. This option allows you to make sure that you have the
  /// required permissions to run the request and that your request parameters
  /// are valid.
  ///
  /// If set to <code>FALSE</code>, Network Firewall makes the requested changes
  /// to your resources.
  ///
  /// Parameter [ruleGroup] :
  /// An object that defines the rule group rules.
  /// <note>
  /// You must provide either this rule group setting or a <code>Rules</code>
  /// setting, but not both.
  /// </note>
  ///
  /// Parameter [rules] :
  /// The name of a file containing stateful rule group rules specifications in
  /// Suricata flat format, with one rule per line. Use this to import your
  /// existing Suricata compatible rule groups.
  /// <note>
  /// You must provide either this rules setting or a populated
  /// <code>RuleGroup</code> setting, but not both.
  /// </note>
  /// You can provide your rule group specification in a file through this
  /// setting when you create or update your rule group. The call response
  /// returns a <a>RuleGroup</a> object that Network Firewall has populated from
  /// your file. Network Firewall uses the file contents to populate the rule
  /// group rules, but does not maintain a reference to the file or use the file
  /// in any way after performing the create or update. If you call
  /// <a>DescribeRuleGroup</a> to retrieve the rule group, Network Firewall
  /// returns rules settings inside a <a>RuleGroup</a> object.
  ///
  /// Parameter [tags] :
  /// The key:value pairs to associate with the resource.
  Future<CreateRuleGroupResponse> createRuleGroup({
    @_s.required int capacity,
    @_s.required String ruleGroupName,
    @_s.required RuleGroupType type,
    String description,
    bool dryRun,
    RuleGroup ruleGroup,
    String rules,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(capacity, 'capacity');
    ArgumentError.checkNotNull(ruleGroupName, 'ruleGroupName');
    _s.validateStringLength(
      'ruleGroupName',
      ruleGroupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ruleGroupName',
      ruleGroupName,
      r'''^[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^.*$''',
    );
    _s.validateStringLength(
      'rules',
      rules,
      0,
      1000000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.CreateRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Capacity': capacity,
        'RuleGroupName': ruleGroupName,
        'Type': type?.toValue() ?? '',
        if (description != null) 'Description': description,
        if (dryRun != null) 'DryRun': dryRun,
        if (ruleGroup != null) 'RuleGroup': ruleGroup,
        if (rules != null) 'Rules': rules,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified <a>Firewall</a> and its <a>FirewallStatus</a>. This
  /// operation requires the firewall's <code>DeleteProtection</code> flag to be
  /// <code>FALSE</code>. You can't revert this operation.
  ///
  /// You can check whether a firewall is in use by reviewing the route tables
  /// for the Availability Zones where you have firewall subnet mappings.
  /// Retrieve the subnet mappings by calling <a>DescribeFirewall</a>. You
  /// define and update the route tables through Amazon VPC. As needed, update
  /// the route tables for the zones to remove the firewall endpoints. When the
  /// route tables no longer use the firewall endpoints, you can remove the
  /// firewall safely.
  ///
  /// To delete a firewall, remove the delete protection if you need to using
  /// <a>UpdateFirewallDeleteProtection</a>, then delete the firewall by calling
  /// <a>DeleteFirewall</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [firewallArn] :
  /// The Amazon Resource Name (ARN) of the firewall.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [firewallName] :
  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  Future<DeleteFirewallResponse> deleteFirewall({
    String firewallArn,
    String firewallName,
  }) async {
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'firewallArn',
      firewallArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringPattern(
      'firewallName',
      firewallName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.DeleteFirewall'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (firewallArn != null) 'FirewallArn': firewallArn,
        if (firewallName != null) 'FirewallName': firewallName,
      },
    );

    return DeleteFirewallResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified <a>FirewallPolicy</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [firewallPolicyArn] :
  /// The Amazon Resource Name (ARN) of the firewall policy.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [firewallPolicyName] :
  /// The descriptive name of the firewall policy. You can't change the name of
  /// a firewall policy after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  Future<DeleteFirewallPolicyResponse> deleteFirewallPolicy({
    String firewallPolicyArn,
    String firewallPolicyName,
  }) async {
    _s.validateStringLength(
      'firewallPolicyArn',
      firewallPolicyArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'firewallPolicyArn',
      firewallPolicyArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'firewallPolicyName',
      firewallPolicyName,
      1,
      128,
    );
    _s.validateStringPattern(
      'firewallPolicyName',
      firewallPolicyName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.DeleteFirewallPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (firewallPolicyArn != null) 'FirewallPolicyArn': firewallPolicyArn,
        if (firewallPolicyName != null)
          'FirewallPolicyName': firewallPolicyName,
      },
    );

    return DeleteFirewallPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a resource policy that you created in a <a>PutResourcePolicy</a>
  /// request.
  ///
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the rule group or firewall policy whose
  /// resource policy you want to delete.
  Future<void> deleteResourcePolicy({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws.*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.DeleteResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return DeleteResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified <a>RuleGroup</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [ruleGroupArn] :
  /// The Amazon Resource Name (ARN) of the rule group.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [ruleGroupName] :
  /// The descriptive name of the rule group. You can't change the name of a
  /// rule group after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [type] :
  /// Indicates whether the rule group is stateless or stateful. If the rule
  /// group is stateless, it contains stateless rules. If it is stateful, it
  /// contains stateful rules.
  /// <note>
  /// This setting is required for requests that do not include the
  /// <code>RuleGroupARN</code>.
  /// </note>
  Future<DeleteRuleGroupResponse> deleteRuleGroup({
    String ruleGroupArn,
    String ruleGroupName,
    RuleGroupType type,
  }) async {
    _s.validateStringLength(
      'ruleGroupArn',
      ruleGroupArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'ruleGroupArn',
      ruleGroupArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'ruleGroupName',
      ruleGroupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'ruleGroupName',
      ruleGroupName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.DeleteRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (ruleGroupArn != null) 'RuleGroupArn': ruleGroupArn,
        if (ruleGroupName != null) 'RuleGroupName': ruleGroupName,
        if (type != null) 'Type': type.toValue(),
      },
    );

    return DeleteRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// Returns the data objects for the specified firewall.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallArn] :
  /// The Amazon Resource Name (ARN) of the firewall.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [firewallName] :
  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  Future<DescribeFirewallResponse> describeFirewall({
    String firewallArn,
    String firewallName,
  }) async {
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'firewallArn',
      firewallArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringPattern(
      'firewallName',
      firewallName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.DescribeFirewall'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (firewallArn != null) 'FirewallArn': firewallArn,
        if (firewallName != null) 'FirewallName': firewallName,
      },
    );

    return DescribeFirewallResponse.fromJson(jsonResponse.body);
  }

  /// Returns the data objects for the specified firewall policy.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [firewallPolicyArn] :
  /// The Amazon Resource Name (ARN) of the firewall policy.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [firewallPolicyName] :
  /// The descriptive name of the firewall policy. You can't change the name of
  /// a firewall policy after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  Future<DescribeFirewallPolicyResponse> describeFirewallPolicy({
    String firewallPolicyArn,
    String firewallPolicyName,
  }) async {
    _s.validateStringLength(
      'firewallPolicyArn',
      firewallPolicyArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'firewallPolicyArn',
      firewallPolicyArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'firewallPolicyName',
      firewallPolicyName,
      1,
      128,
    );
    _s.validateStringPattern(
      'firewallPolicyName',
      firewallPolicyName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.DescribeFirewallPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (firewallPolicyArn != null) 'FirewallPolicyArn': firewallPolicyArn,
        if (firewallPolicyName != null)
          'FirewallPolicyName': firewallPolicyName,
      },
    );

    return DescribeFirewallPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Returns the logging configuration for the specified firewall.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [firewallArn] :
  /// The Amazon Resource Name (ARN) of the firewall.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [firewallName] :
  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  Future<DescribeLoggingConfigurationResponse> describeLoggingConfiguration({
    String firewallArn,
    String firewallName,
  }) async {
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'firewallArn',
      firewallArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringPattern(
      'firewallName',
      firewallName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.DescribeLoggingConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (firewallArn != null) 'FirewallArn': firewallArn,
        if (firewallName != null) 'FirewallName': firewallName,
      },
    );

    return DescribeLoggingConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a resource policy that you created in a <a>PutResourcePolicy</a>
  /// request.
  ///
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the rule group or firewall policy whose
  /// resource policy you want to retrieve.
  Future<DescribeResourcePolicyResponse> describeResourcePolicy({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws.*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.DescribeResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return DescribeResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Returns the data objects for the specified rule group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [ruleGroupArn] :
  /// The Amazon Resource Name (ARN) of the rule group.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [ruleGroupName] :
  /// The descriptive name of the rule group. You can't change the name of a
  /// rule group after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [type] :
  /// Indicates whether the rule group is stateless or stateful. If the rule
  /// group is stateless, it contains stateless rules. If it is stateful, it
  /// contains stateful rules.
  /// <note>
  /// This setting is required for requests that do not include the
  /// <code>RuleGroupARN</code>.
  /// </note>
  Future<DescribeRuleGroupResponse> describeRuleGroup({
    String ruleGroupArn,
    String ruleGroupName,
    RuleGroupType type,
  }) async {
    _s.validateStringLength(
      'ruleGroupArn',
      ruleGroupArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'ruleGroupArn',
      ruleGroupArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'ruleGroupName',
      ruleGroupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'ruleGroupName',
      ruleGroupName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.DescribeRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (ruleGroupArn != null) 'RuleGroupArn': ruleGroupArn,
        if (ruleGroupName != null) 'RuleGroupName': ruleGroupName,
        if (type != null) 'Type': type.toValue(),
      },
    );

    return DescribeRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// Removes the specified subnet associations from the firewall. This removes
  /// the firewall endpoints from the subnets and removes any network filtering
  /// protections that the endpoints were providing.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidTokenException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [subnetIds] :
  /// The unique identifiers for the subnets that you want to disassociate.
  ///
  /// Parameter [firewallArn] :
  /// The Amazon Resource Name (ARN) of the firewall.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [firewallName] :
  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [updateToken] :
  /// An optional token that you can use for optimistic locking. Network
  /// Firewall returns a token to your requests that access the firewall. The
  /// token marks the state of the firewall resource at the time of the request.
  ///
  /// To make an unconditional change to the firewall, omit the token in your
  /// update request. Without the token, Network Firewall performs your updates
  /// regardless of whether the firewall has changed since you last retrieved
  /// it.
  ///
  /// To make a conditional change to the firewall, provide the token in your
  /// update request. Network Firewall uses the token to ensure that the
  /// firewall hasn't changed since you last retrieved it. If it has changed,
  /// the operation fails with an <code>InvalidTokenException</code>. If this
  /// happens, retrieve the firewall again to get a current copy of it with a
  /// new token. Reapply your changes as needed, then try the operation again
  /// using the new token.
  Future<DisassociateSubnetsResponse> disassociateSubnets({
    @_s.required List<String> subnetIds,
    String firewallArn,
    String firewallName,
    String updateToken,
  }) async {
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'firewallArn',
      firewallArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringPattern(
      'firewallName',
      firewallName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'updateToken',
      updateToken,
      r'''^([0-9a-f]{8})-([0-9a-f]{4}-){3}([0-9a-f]{12})$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.DisassociateSubnets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SubnetIds': subnetIds,
        if (firewallArn != null) 'FirewallArn': firewallArn,
        if (firewallName != null) 'FirewallName': firewallName,
        if (updateToken != null) 'UpdateToken': updateToken,
      },
    );

    return DisassociateSubnetsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the metadata for the firewall policies that you have defined.
  /// Depending on your setting for max results and the number of firewall
  /// policies, a single call might not return the full list.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Network Firewall to return for
  /// this request. If more objects are available, in the response, Network
  /// Firewall provides a <code>NextToken</code> value that you can use in a
  /// subsequent call to get the next batch of objects.
  ///
  /// Parameter [nextToken] :
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds
  /// the maximum you requested, Network Firewall returns a
  /// <code>NextToken</code> value in the response. To retrieve the next batch
  /// of objects, use the token returned from the prior request in your next
  /// request.
  Future<ListFirewallPoliciesResponse> listFirewallPolicies({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[0-9A-Za-z:\/+=]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.ListFirewallPolicies'
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

    return ListFirewallPoliciesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the metadata for the firewalls that you have defined. If you
  /// provide VPC identifiers in your request, this returns only the firewalls
  /// for those VPCs.
  ///
  /// Depending on your setting for max results and the number of firewalls, a
  /// single call might not return the full list.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Network Firewall to return for
  /// this request. If more objects are available, in the response, Network
  /// Firewall provides a <code>NextToken</code> value that you can use in a
  /// subsequent call to get the next batch of objects.
  ///
  /// Parameter [nextToken] :
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds
  /// the maximum you requested, Network Firewall returns a
  /// <code>NextToken</code> value in the response. To retrieve the next batch
  /// of objects, use the token returned from the prior request in your next
  /// request.
  ///
  /// Parameter [vpcIds] :
  /// The unique identifiers of the VPCs that you want Network Firewall to
  /// retrieve the firewalls for. Leave this blank to retrieve all firewalls
  /// that you have defined.
  Future<ListFirewallsResponse> listFirewalls({
    int maxResults,
    String nextToken,
    List<String> vpcIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[0-9A-Za-z:\/+=]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.ListFirewalls'
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
        if (vpcIds != null) 'VpcIds': vpcIds,
      },
    );

    return ListFirewallsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the metadata for the rule groups that you have defined.
  /// Depending on your setting for max results and the number of rule groups, a
  /// single call might not return the full list.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Network Firewall to return for
  /// this request. If more objects are available, in the response, Network
  /// Firewall provides a <code>NextToken</code> value that you can use in a
  /// subsequent call to get the next batch of objects.
  ///
  /// Parameter [nextToken] :
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds
  /// the maximum you requested, Network Firewall returns a
  /// <code>NextToken</code> value in the response. To retrieve the next batch
  /// of objects, use the token returned from the prior request in your next
  /// request.
  Future<ListRuleGroupsResponse> listRuleGroups({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[0-9A-Za-z:\/+=]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.ListRuleGroups'
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

    return ListRuleGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the tags associated with the specified resource. Tags are
  /// key:value pairs that you can use to categorize and manage your resources,
  /// for purposes like billing. For example, you might set the tag key to
  /// "customer" and the value to the customer name or ID. You can specify one
  /// or more tags to add to each AWS resource, up to 50 tags for a resource.
  ///
  /// You can tag the AWS resources that you manage through AWS Network
  /// Firewall: firewalls, firewall policies, and rule groups.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Network Firewall to return for
  /// this request. If more objects are available, in the response, Network
  /// Firewall provides a <code>NextToken</code> value that you can use in a
  /// subsequent call to get the next batch of objects.
  ///
  /// Parameter [nextToken] :
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds
  /// the maximum you requested, Network Firewall returns a
  /// <code>NextToken</code> value in the response. To retrieve the next batch
  /// of objects, use the token returned from the prior request in your next
  /// request.
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
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws.*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[0-9A-Za-z:\/+=]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.ListTagsForResource'
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

  /// Creates or updates an AWS Identity and Access Management policy for your
  /// rule group or firewall policy. Use this to share rule groups and firewall
  /// policies between accounts. This operation works in conjunction with the
  /// AWS Resource Access Manager (RAM) service to manage resource sharing for
  /// Network Firewall.
  ///
  /// Use this operation to create or update a resource policy for your rule
  /// group or firewall policy. In the policy, you specify the accounts that you
  /// want to share the resource with and the operations that you want the
  /// accounts to be able to perform.
  ///
  /// When you add an account in the resource policy, you then run the following
  /// Resource Access Manager (RAM) operations to access and accept the shared
  /// rule group or firewall policy.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/ram/latest/APIReference/API_GetResourceShareInvitations.html">GetResourceShareInvitations</a>
  /// - Returns the Amazon Resource Names (ARNs) of the resource share
  /// invitations.
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/ram/latest/APIReference/API_AcceptResourceShareInvitation.html">AcceptResourceShareInvitation</a>
  /// - Accepts the share invitation for a specified resource share.
  /// </li>
  /// </ul>
  /// For additional information about resource sharing using RAM, see <a
  /// href="https://docs.aws.amazon.com/ram/latest/userguide/what-is.html">AWS
  /// Resource Access Manager User Guide</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidResourcePolicyException].
  ///
  /// Parameter [policy] :
  /// The AWS Identity and Access Management policy statement that lists the
  /// accounts that you want to share your rule group or firewall policy with
  /// and the operations that you want the accounts to be able to perform.
  ///
  /// For a rule group resource, you can specify the following operations in the
  /// Actions section of the statement:
  ///
  /// <ul>
  /// <li>
  /// network-firewall:CreateFirewallPolicy
  /// </li>
  /// <li>
  /// network-firewall:UpdateFirewallPolicy
  /// </li>
  /// <li>
  /// network-firewall:ListRuleGroups
  /// </li>
  /// </ul>
  /// For a firewall policy resource, you can specify the following operations
  /// in the Actions section of the statement:
  ///
  /// <ul>
  /// <li>
  /// network-firewall:CreateFirewall
  /// </li>
  /// <li>
  /// network-firewall:UpdateFirewall
  /// </li>
  /// <li>
  /// network-firewall:AssociateFirewallPolicy
  /// </li>
  /// <li>
  /// network-firewall:ListFirewallPolicies
  /// </li>
  /// </ul>
  /// In the Resource section of the statement, you specify the ARNs for the
  /// rule groups and firewall policies that you want to share with the account
  /// that you specified in <code>Arn</code>.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the account that you want to share rule
  /// groups and firewall policies with.
  Future<void> putResourcePolicy({
    @_s.required String policy,
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(policy, 'policy');
    _s.validateStringLength(
      'policy',
      policy,
      1,
      395000,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policy',
      policy,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws.*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.PutResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Policy': policy,
        'ResourceArn': resourceArn,
      },
    );

    return PutResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Adds the specified tags to the specified resource. Tags are key:value
  /// pairs that you can use to categorize and manage your resources, for
  /// purposes like billing. For example, you might set the tag key to
  /// "customer" and the value to the customer name or ID. You can specify one
  /// or more tags to add to each AWS resource, up to 50 tags for a resource.
  ///
  /// You can tag the AWS resources that you manage through AWS Network
  /// Firewall: firewalls, firewall policies, and rule groups.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// <p/>
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.TagResource'
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

  /// Removes the tags with the specified keys from the specified resource. Tags
  /// are key:value pairs that you can use to categorize and manage your
  /// resources, for purposes like billing. For example, you might set the tag
  /// key to "customer" and the value to the customer name or ID. You can
  /// specify one or more tags to add to each AWS resource, up to 50 tags for a
  /// resource.
  ///
  /// You can manage tags for the AWS resources that you manage through AWS
  /// Network Firewall: firewalls, firewall policies, and rule groups.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// <p/>
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.UntagResource'
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

  /// Modifies the flag, <code>DeleteProtection</code>, which indicates whether
  /// it is possible to delete the firewall. If the flag is set to
  /// <code>TRUE</code>, the firewall is protected against deletion. This
  /// setting helps protect against accidentally deleting a firewall that's in
  /// use.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidTokenException].
  /// May throw [ResourceOwnerCheckException].
  ///
  /// Parameter [deleteProtection] :
  /// A flag indicating whether it is possible to delete the firewall. A setting
  /// of <code>TRUE</code> indicates that the firewall is protected against
  /// deletion. Use this setting to protect against accidentally deleting a
  /// firewall that is in use. When you create a firewall, the operation
  /// initializes this flag to <code>TRUE</code>.
  ///
  /// Parameter [firewallArn] :
  /// The Amazon Resource Name (ARN) of the firewall.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [firewallName] :
  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [updateToken] :
  /// An optional token that you can use for optimistic locking. Network
  /// Firewall returns a token to your requests that access the firewall. The
  /// token marks the state of the firewall resource at the time of the request.
  ///
  /// To make an unconditional change to the firewall, omit the token in your
  /// update request. Without the token, Network Firewall performs your updates
  /// regardless of whether the firewall has changed since you last retrieved
  /// it.
  ///
  /// To make a conditional change to the firewall, provide the token in your
  /// update request. Network Firewall uses the token to ensure that the
  /// firewall hasn't changed since you last retrieved it. If it has changed,
  /// the operation fails with an <code>InvalidTokenException</code>. If this
  /// happens, retrieve the firewall again to get a current copy of it with a
  /// new token. Reapply your changes as needed, then try the operation again
  /// using the new token.
  Future<UpdateFirewallDeleteProtectionResponse>
      updateFirewallDeleteProtection({
    @_s.required bool deleteProtection,
    String firewallArn,
    String firewallName,
    String updateToken,
  }) async {
    ArgumentError.checkNotNull(deleteProtection, 'deleteProtection');
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'firewallArn',
      firewallArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringPattern(
      'firewallName',
      firewallName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'updateToken',
      updateToken,
      r'''^([0-9a-f]{8})-([0-9a-f]{4}-){3}([0-9a-f]{12})$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.UpdateFirewallDeleteProtection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeleteProtection': deleteProtection,
        if (firewallArn != null) 'FirewallArn': firewallArn,
        if (firewallName != null) 'FirewallName': firewallName,
        if (updateToken != null) 'UpdateToken': updateToken,
      },
    );

    return UpdateFirewallDeleteProtectionResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the description for the specified firewall. Use the description
  /// to help you identify the firewall when you're working with it.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidTokenException].
  ///
  /// Parameter [description] :
  /// The new description for the firewall. If you omit this setting, Network
  /// Firewall removes the description for the firewall.
  ///
  /// Parameter [firewallArn] :
  /// The Amazon Resource Name (ARN) of the firewall.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [firewallName] :
  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [updateToken] :
  /// An optional token that you can use for optimistic locking. Network
  /// Firewall returns a token to your requests that access the firewall. The
  /// token marks the state of the firewall resource at the time of the request.
  ///
  /// To make an unconditional change to the firewall, omit the token in your
  /// update request. Without the token, Network Firewall performs your updates
  /// regardless of whether the firewall has changed since you last retrieved
  /// it.
  ///
  /// To make a conditional change to the firewall, provide the token in your
  /// update request. Network Firewall uses the token to ensure that the
  /// firewall hasn't changed since you last retrieved it. If it has changed,
  /// the operation fails with an <code>InvalidTokenException</code>. If this
  /// happens, retrieve the firewall again to get a current copy of it with a
  /// new token. Reapply your changes as needed, then try the operation again
  /// using the new token.
  Future<UpdateFirewallDescriptionResponse> updateFirewallDescription({
    String description,
    String firewallArn,
    String firewallName,
    String updateToken,
  }) async {
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^.*$''',
    );
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'firewallArn',
      firewallArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringPattern(
      'firewallName',
      firewallName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'updateToken',
      updateToken,
      r'''^([0-9a-f]{8})-([0-9a-f]{4}-){3}([0-9a-f]{12})$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.UpdateFirewallDescription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (description != null) 'Description': description,
        if (firewallArn != null) 'FirewallArn': firewallArn,
        if (firewallName != null) 'FirewallName': firewallName,
        if (updateToken != null) 'UpdateToken': updateToken,
      },
    );

    return UpdateFirewallDescriptionResponse.fromJson(jsonResponse.body);
  }

  /// Updates the properties of the specified firewall policy.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [InvalidTokenException].
  ///
  /// Parameter [firewallPolicy] :
  /// The updated firewall policy to use for the firewall.
  ///
  /// Parameter [updateToken] :
  /// A token used for optimistic locking. Network Firewall returns a token to
  /// your requests that access the firewall policy. The token marks the state
  /// of the policy resource at the time of the request.
  ///
  /// To make changes to the policy, you provide the token in your request.
  /// Network Firewall uses the token to ensure that the policy hasn't changed
  /// since you last retrieved it. If it has changed, the operation fails with
  /// an <code>InvalidTokenException</code>. If this happens, retrieve the
  /// firewall policy again to get a current copy of it with current token.
  /// Reapply your changes as needed, then try the operation again using the new
  /// token.
  ///
  /// Parameter [description] :
  /// A description of the firewall policy.
  ///
  /// Parameter [dryRun] :
  /// Indicates whether you want Network Firewall to just check the validity of
  /// the request, rather than run the request.
  ///
  /// If set to <code>TRUE</code>, Network Firewall checks whether the request
  /// can run successfully, but doesn't actually make the requested changes. The
  /// call returns the value that the request would return if you ran it with
  /// dry run set to <code>FALSE</code>, but doesn't make additions or changes
  /// to your resources. This option allows you to make sure that you have the
  /// required permissions to run the request and that your request parameters
  /// are valid.
  ///
  /// If set to <code>FALSE</code>, Network Firewall makes the requested changes
  /// to your resources.
  ///
  /// Parameter [firewallPolicyArn] :
  /// The Amazon Resource Name (ARN) of the firewall policy.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [firewallPolicyName] :
  /// The descriptive name of the firewall policy. You can't change the name of
  /// a firewall policy after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  Future<UpdateFirewallPolicyResponse> updateFirewallPolicy({
    @_s.required FirewallPolicy firewallPolicy,
    @_s.required String updateToken,
    String description,
    bool dryRun,
    String firewallPolicyArn,
    String firewallPolicyName,
  }) async {
    ArgumentError.checkNotNull(firewallPolicy, 'firewallPolicy');
    ArgumentError.checkNotNull(updateToken, 'updateToken');
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'updateToken',
      updateToken,
      r'''^([0-9a-f]{8})-([0-9a-f]{4}-){3}([0-9a-f]{12})$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^.*$''',
    );
    _s.validateStringLength(
      'firewallPolicyArn',
      firewallPolicyArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'firewallPolicyArn',
      firewallPolicyArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'firewallPolicyName',
      firewallPolicyName,
      1,
      128,
    );
    _s.validateStringPattern(
      'firewallPolicyName',
      firewallPolicyName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.UpdateFirewallPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallPolicy': firewallPolicy,
        'UpdateToken': updateToken,
        if (description != null) 'Description': description,
        if (dryRun != null) 'DryRun': dryRun,
        if (firewallPolicyArn != null) 'FirewallPolicyArn': firewallPolicyArn,
        if (firewallPolicyName != null)
          'FirewallPolicyName': firewallPolicyName,
      },
    );

    return UpdateFirewallPolicyResponse.fromJson(jsonResponse.body);
  }

  /// <p/>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidTokenException].
  /// May throw [ResourceOwnerCheckException].
  ///
  /// Parameter [firewallPolicyChangeProtection] :
  /// A setting indicating whether the firewall is protected against a change to
  /// the firewall policy association. Use this setting to protect against
  /// accidentally modifying the firewall policy for a firewall that is in use.
  /// When you create a firewall, the operation initializes this setting to
  /// <code>TRUE</code>.
  ///
  /// Parameter [firewallArn] :
  /// The Amazon Resource Name (ARN) of the firewall.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [firewallName] :
  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [updateToken] :
  /// An optional token that you can use for optimistic locking. Network
  /// Firewall returns a token to your requests that access the firewall. The
  /// token marks the state of the firewall resource at the time of the request.
  ///
  /// To make an unconditional change to the firewall, omit the token in your
  /// update request. Without the token, Network Firewall performs your updates
  /// regardless of whether the firewall has changed since you last retrieved
  /// it.
  ///
  /// To make a conditional change to the firewall, provide the token in your
  /// update request. Network Firewall uses the token to ensure that the
  /// firewall hasn't changed since you last retrieved it. If it has changed,
  /// the operation fails with an <code>InvalidTokenException</code>. If this
  /// happens, retrieve the firewall again to get a current copy of it with a
  /// new token. Reapply your changes as needed, then try the operation again
  /// using the new token.
  Future<UpdateFirewallPolicyChangeProtectionResponse>
      updateFirewallPolicyChangeProtection({
    @_s.required bool firewallPolicyChangeProtection,
    String firewallArn,
    String firewallName,
    String updateToken,
  }) async {
    ArgumentError.checkNotNull(
        firewallPolicyChangeProtection, 'firewallPolicyChangeProtection');
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'firewallArn',
      firewallArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringPattern(
      'firewallName',
      firewallName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'updateToken',
      updateToken,
      r'''^([0-9a-f]{8})-([0-9a-f]{4}-){3}([0-9a-f]{12})$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'NetworkFirewall_20201112.UpdateFirewallPolicyChangeProtection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirewallPolicyChangeProtection': firewallPolicyChangeProtection,
        if (firewallArn != null) 'FirewallArn': firewallArn,
        if (firewallName != null) 'FirewallName': firewallName,
        if (updateToken != null) 'UpdateToken': updateToken,
      },
    );

    return UpdateFirewallPolicyChangeProtectionResponse.fromJson(
        jsonResponse.body);
  }

  /// Sets the logging configuration for the specified firewall.
  ///
  /// To change the logging configuration, retrieve the
  /// <a>LoggingConfiguration</a> by calling
  /// <a>DescribeLoggingConfiguration</a>, then change it and provide the
  /// modified object to this update call. You must change the logging
  /// configuration one <a>LogDestinationConfig</a> at a time inside the
  /// retrieved <a>LoggingConfiguration</a> object.
  ///
  /// You can perform only one of the following actions in any call to
  /// <code>UpdateLoggingConfiguration</code>:
  ///
  /// <ul>
  /// <li>
  /// Create a new log destination object by adding a single
  /// <code>LogDestinationConfig</code> array element to
  /// <code>LogDestinationConfigs</code>.
  /// </li>
  /// <li>
  /// Delete a log destination object by removing a single
  /// <code>LogDestinationConfig</code> array element from
  /// <code>LogDestinationConfigs</code>.
  /// </li>
  /// <li>
  /// Change the <code>LogDestination</code> setting in a single
  /// <code>LogDestinationConfig</code> array element.
  /// </li>
  /// </ul>
  /// You can't change the <code>LogDestinationType</code> or
  /// <code>LogType</code> in a <code>LogDestinationConfig</code>. To change
  /// these settings, delete the existing <code>LogDestinationConfig</code>
  /// object and create a new one, using two separate calls to this update
  /// operation.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidTokenException].
  /// May throw [LogDestinationPermissionException].
  ///
  /// Parameter [firewallArn] :
  /// The Amazon Resource Name (ARN) of the firewall.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [firewallName] :
  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [loggingConfiguration] :
  /// Defines how Network Firewall performs logging for a firewall. If you omit
  /// this setting, Network Firewall disables logging for the firewall.
  Future<UpdateLoggingConfigurationResponse> updateLoggingConfiguration({
    String firewallArn,
    String firewallName,
    LoggingConfiguration loggingConfiguration,
  }) async {
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'firewallArn',
      firewallArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringPattern(
      'firewallName',
      firewallName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.UpdateLoggingConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (firewallArn != null) 'FirewallArn': firewallArn,
        if (firewallName != null) 'FirewallName': firewallName,
        if (loggingConfiguration != null)
          'LoggingConfiguration': loggingConfiguration,
      },
    );

    return UpdateLoggingConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Updates the rule settings for the specified rule group. You use a rule
  /// group by reference in one or more firewall policies. When you modify a
  /// rule group, you modify all firewall policies that use the rule group.
  ///
  /// To update a rule group, first call <a>DescribeRuleGroup</a> to retrieve
  /// the current <a>RuleGroup</a> object, update the object as needed, and then
  /// provide the updated object to this call.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [InvalidTokenException].
  ///
  /// Parameter [updateToken] :
  /// A token used for optimistic locking. Network Firewall returns a token to
  /// your requests that access the rule group. The token marks the state of the
  /// rule group resource at the time of the request.
  ///
  /// To make changes to the rule group, you provide the token in your request.
  /// Network Firewall uses the token to ensure that the rule group hasn't
  /// changed since you last retrieved it. If it has changed, the operation
  /// fails with an <code>InvalidTokenException</code>. If this happens,
  /// retrieve the rule group again to get a current copy of it with a current
  /// token. Reapply your changes as needed, then try the operation again using
  /// the new token.
  ///
  /// Parameter [description] :
  /// A description of the rule group.
  ///
  /// Parameter [dryRun] :
  /// Indicates whether you want Network Firewall to just check the validity of
  /// the request, rather than run the request.
  ///
  /// If set to <code>TRUE</code>, Network Firewall checks whether the request
  /// can run successfully, but doesn't actually make the requested changes. The
  /// call returns the value that the request would return if you ran it with
  /// dry run set to <code>FALSE</code>, but doesn't make additions or changes
  /// to your resources. This option allows you to make sure that you have the
  /// required permissions to run the request and that your request parameters
  /// are valid.
  ///
  /// If set to <code>FALSE</code>, Network Firewall makes the requested changes
  /// to your resources.
  ///
  /// Parameter [ruleGroup] :
  /// An object that defines the rule group rules.
  /// <note>
  /// You must provide either this rule group setting or a <code>Rules</code>
  /// setting, but not both.
  /// </note>
  ///
  /// Parameter [ruleGroupArn] :
  /// The Amazon Resource Name (ARN) of the rule group.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [ruleGroupName] :
  /// The descriptive name of the rule group. You can't change the name of a
  /// rule group after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [rules] :
  /// The name of a file containing stateful rule group rules specifications in
  /// Suricata flat format, with one rule per line. Use this to import your
  /// existing Suricata compatible rule groups.
  /// <note>
  /// You must provide either this rules setting or a populated
  /// <code>RuleGroup</code> setting, but not both.
  /// </note>
  /// You can provide your rule group specification in a file through this
  /// setting when you create or update your rule group. The call response
  /// returns a <a>RuleGroup</a> object that Network Firewall has populated from
  /// your file. Network Firewall uses the file contents to populate the rule
  /// group rules, but does not maintain a reference to the file or use the file
  /// in any way after performing the create or update. If you call
  /// <a>DescribeRuleGroup</a> to retrieve the rule group, Network Firewall
  /// returns rules settings inside a <a>RuleGroup</a> object.
  ///
  /// Parameter [type] :
  /// Indicates whether the rule group is stateless or stateful. If the rule
  /// group is stateless, it contains stateless rules. If it is stateful, it
  /// contains stateful rules.
  /// <note>
  /// This setting is required for requests that do not include the
  /// <code>RuleGroupARN</code>.
  /// </note>
  Future<UpdateRuleGroupResponse> updateRuleGroup({
    @_s.required String updateToken,
    String description,
    bool dryRun,
    RuleGroup ruleGroup,
    String ruleGroupArn,
    String ruleGroupName,
    String rules,
    RuleGroupType type,
  }) async {
    ArgumentError.checkNotNull(updateToken, 'updateToken');
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'updateToken',
      updateToken,
      r'''^([0-9a-f]{8})-([0-9a-f]{4}-){3}([0-9a-f]{12})$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^.*$''',
    );
    _s.validateStringLength(
      'ruleGroupArn',
      ruleGroupArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'ruleGroupArn',
      ruleGroupArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'ruleGroupName',
      ruleGroupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'ruleGroupName',
      ruleGroupName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    _s.validateStringLength(
      'rules',
      rules,
      0,
      1000000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.UpdateRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UpdateToken': updateToken,
        if (description != null) 'Description': description,
        if (dryRun != null) 'DryRun': dryRun,
        if (ruleGroup != null) 'RuleGroup': ruleGroup,
        if (ruleGroupArn != null) 'RuleGroupArn': ruleGroupArn,
        if (ruleGroupName != null) 'RuleGroupName': ruleGroupName,
        if (rules != null) 'Rules': rules,
        if (type != null) 'Type': type.toValue(),
      },
    );

    return UpdateRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// <p/>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidTokenException].
  /// May throw [ResourceOwnerCheckException].
  ///
  /// Parameter [subnetChangeProtection] :
  /// A setting indicating whether the firewall is protected against changes to
  /// the subnet associations. Use this setting to protect against accidentally
  /// modifying the subnet associations for a firewall that is in use. When you
  /// create a firewall, the operation initializes this setting to
  /// <code>TRUE</code>.
  ///
  /// Parameter [firewallArn] :
  /// The Amazon Resource Name (ARN) of the firewall.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [firewallName] :
  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [updateToken] :
  /// An optional token that you can use for optimistic locking. Network
  /// Firewall returns a token to your requests that access the firewall. The
  /// token marks the state of the firewall resource at the time of the request.
  ///
  /// To make an unconditional change to the firewall, omit the token in your
  /// update request. Without the token, Network Firewall performs your updates
  /// regardless of whether the firewall has changed since you last retrieved
  /// it.
  ///
  /// To make a conditional change to the firewall, provide the token in your
  /// update request. Network Firewall uses the token to ensure that the
  /// firewall hasn't changed since you last retrieved it. If it has changed,
  /// the operation fails with an <code>InvalidTokenException</code>. If this
  /// happens, retrieve the firewall again to get a current copy of it with a
  /// new token. Reapply your changes as needed, then try the operation again
  /// using the new token.
  Future<UpdateSubnetChangeProtectionResponse> updateSubnetChangeProtection({
    @_s.required bool subnetChangeProtection,
    String firewallArn,
    String firewallName,
    String updateToken,
  }) async {
    ArgumentError.checkNotNull(
        subnetChangeProtection, 'subnetChangeProtection');
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringPattern(
      'firewallArn',
      firewallArn,
      r'''^arn:aws.*''',
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringPattern(
      'firewallName',
      firewallName,
      r'''^[a-zA-Z0-9-]+$''',
    );
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'updateToken',
      updateToken,
      r'''^([0-9a-f]{8})-([0-9a-f]{4}-){3}([0-9a-f]{12})$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.UpdateSubnetChangeProtection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SubnetChangeProtection': subnetChangeProtection,
        if (firewallArn != null) 'FirewallArn': firewallArn,
        if (firewallName != null) 'FirewallName': firewallName,
        if (updateToken != null) 'UpdateToken': updateToken,
      },
    );

    return UpdateSubnetChangeProtectionResponse.fromJson(jsonResponse.body);
  }
}

/// A custom action to use in stateless rule actions settings. This is used in
/// <a>CustomAction</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ActionDefinition {
  /// Stateless inspection criteria that publishes the specified metrics to Amazon
  /// CloudWatch for the matching packet. This setting defines a CloudWatch
  /// dimension value to be published.
  ///
  /// You can pair this custom action with any of the standard stateless rule
  /// actions. For example, you could pair this in a rule action with the standard
  /// action that forwards the packet for stateful inspection. Then, when a packet
  /// matches the rule, Network Firewall publishes metrics for the packet and
  /// forwards it.
  @_s.JsonKey(name: 'PublishMetricAction')
  final PublishMetricAction publishMetricAction;

  ActionDefinition({
    this.publishMetricAction,
  });
  factory ActionDefinition.fromJson(Map<String, dynamic> json) =>
      _$ActionDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$ActionDefinitionToJson(this);
}

/// A single IP address specification. This is used in the
/// <a>MatchAttributes</a> source and destination specifications.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Address {
  /// Specify an IP address or a block of IP addresses in Classless Inter-Domain
  /// Routing (CIDR) notation. Network Firewall supports all address ranges for
  /// IPv4.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// To configure Network Firewall to inspect for the IP address 192.0.2.44,
  /// specify <code>192.0.2.44/32</code>.
  /// </li>
  /// <li>
  /// To configure Network Firewall to inspect for IP addresses from 192.0.2.0 to
  /// 192.0.2.255, specify <code>192.0.2.0/24</code>.
  /// </li>
  /// </ul>
  /// For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  @_s.JsonKey(name: 'AddressDefinition')
  final String addressDefinition;

  Address({
    @_s.required this.addressDefinition,
  });
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateFirewallPolicyResponse {
  /// The Amazon Resource Name (ARN) of the firewall.
  @_s.JsonKey(name: 'FirewallArn')
  final String firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  @_s.JsonKey(name: 'FirewallName')
  final String firewallName;

  /// The Amazon Resource Name (ARN) of the firewall policy.
  @_s.JsonKey(name: 'FirewallPolicyArn')
  final String firewallPolicyArn;

  /// An optional token that you can use for optimistic locking. Network Firewall
  /// returns a token to your requests that access the firewall. The token marks
  /// the state of the firewall resource at the time of the request.
  ///
  /// To make an unconditional change to the firewall, omit the token in your
  /// update request. Without the token, Network Firewall performs your updates
  /// regardless of whether the firewall has changed since you last retrieved it.
  ///
  /// To make a conditional change to the firewall, provide the token in your
  /// update request. Network Firewall uses the token to ensure that the firewall
  /// hasn't changed since you last retrieved it. If it has changed, the operation
  /// fails with an <code>InvalidTokenException</code>. If this happens, retrieve
  /// the firewall again to get a current copy of it with a new token. Reapply
  /// your changes as needed, then try the operation again using the new token.
  @_s.JsonKey(name: 'UpdateToken')
  final String updateToken;

  AssociateFirewallPolicyResponse({
    this.firewallArn,
    this.firewallName,
    this.firewallPolicyArn,
    this.updateToken,
  });
  factory AssociateFirewallPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateFirewallPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateSubnetsResponse {
  /// The Amazon Resource Name (ARN) of the firewall.
  @_s.JsonKey(name: 'FirewallArn')
  final String firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  @_s.JsonKey(name: 'FirewallName')
  final String firewallName;

  /// The IDs of the subnets that are associated with the firewall.
  @_s.JsonKey(name: 'SubnetMappings')
  final List<SubnetMapping> subnetMappings;

  /// An optional token that you can use for optimistic locking. Network Firewall
  /// returns a token to your requests that access the firewall. The token marks
  /// the state of the firewall resource at the time of the request.
  ///
  /// To make an unconditional change to the firewall, omit the token in your
  /// update request. Without the token, Network Firewall performs your updates
  /// regardless of whether the firewall has changed since you last retrieved it.
  ///
  /// To make a conditional change to the firewall, provide the token in your
  /// update request. Network Firewall uses the token to ensure that the firewall
  /// hasn't changed since you last retrieved it. If it has changed, the operation
  /// fails with an <code>InvalidTokenException</code>. If this happens, retrieve
  /// the firewall again to get a current copy of it with a new token. Reapply
  /// your changes as needed, then try the operation again using the new token.
  @_s.JsonKey(name: 'UpdateToken')
  final String updateToken;

  AssociateSubnetsResponse({
    this.firewallArn,
    this.firewallName,
    this.subnetMappings,
    this.updateToken,
  });
  factory AssociateSubnetsResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateSubnetsResponseFromJson(json);
}

/// The configuration and status for a single subnet that you've specified for
/// use by the AWS Network Firewall firewall. This is part of the
/// <a>FirewallStatus</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Attachment {
  /// The identifier of the firewall endpoint that Network Firewall has
  /// instantiated in the subnet. You use this to identify the firewall endpoint
  /// in the VPC route tables, when you redirect the VPC traffic through the
  /// endpoint.
  @_s.JsonKey(name: 'EndpointId')
  final String endpointId;

  /// The current status of the firewall endpoint in the subnet. This value
  /// reflects both the instantiation of the endpoint in the VPC subnet and the
  /// sync states that are reported in the <code>Config</code> settings. When this
  /// value is <code>READY</code>, the endpoint is available and configured
  /// properly to handle network traffic. When the endpoint isn't available for
  /// traffic, this value will reflect its state, for example
  /// <code>CREATING</code>, <code>DELETING</code>, or <code>FAILED</code>.
  @_s.JsonKey(name: 'Status')
  final AttachmentStatus status;

  /// The unique identifier of the subnet that you've specified to be used for a
  /// firewall endpoint.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  Attachment({
    this.endpointId,
    this.status,
    this.subnetId,
  });
  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
}

enum AttachmentStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('SCALING')
  scaling,
  @_s.JsonValue('READY')
  ready,
}

enum ConfigurationSyncState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('IN_SYNC')
  inSync,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFirewallPolicyResponse {
  /// The high-level properties of a firewall policy. This, along with the
  /// <a>FirewallPolicy</a>, define the policy. You can retrieve all objects for a
  /// firewall policy by calling <a>DescribeFirewallPolicy</a>.
  @_s.JsonKey(name: 'FirewallPolicyResponse')
  final FirewallPolicyResponse firewallPolicyResponse;

  /// A token used for optimistic locking. Network Firewall returns a token to
  /// your requests that access the firewall policy. The token marks the state of
  /// the policy resource at the time of the request.
  ///
  /// To make changes to the policy, you provide the token in your request.
  /// Network Firewall uses the token to ensure that the policy hasn't changed
  /// since you last retrieved it. If it has changed, the operation fails with an
  /// <code>InvalidTokenException</code>. If this happens, retrieve the firewall
  /// policy again to get a current copy of it with current token. Reapply your
  /// changes as needed, then try the operation again using the new token.
  @_s.JsonKey(name: 'UpdateToken')
  final String updateToken;

  CreateFirewallPolicyResponse({
    @_s.required this.firewallPolicyResponse,
    @_s.required this.updateToken,
  });
  factory CreateFirewallPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFirewallPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFirewallResponse {
  /// The configuration settings for the firewall. These settings include the
  /// firewall policy and the subnets in your VPC to use for the firewall
  /// endpoints.
  @_s.JsonKey(name: 'Firewall')
  final Firewall firewall;

  /// Detailed information about the current status of a <a>Firewall</a>. You can
  /// retrieve this for a firewall by calling <a>DescribeFirewall</a> and
  /// providing the firewall name and ARN.
  @_s.JsonKey(name: 'FirewallStatus')
  final FirewallStatus firewallStatus;

  CreateFirewallResponse({
    this.firewall,
    this.firewallStatus,
  });
  factory CreateFirewallResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFirewallResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRuleGroupResponse {
  /// The high-level properties of a rule group. This, along with the
  /// <a>RuleGroup</a>, define the rule group. You can retrieve all objects for a
  /// rule group by calling <a>DescribeRuleGroup</a>.
  @_s.JsonKey(name: 'RuleGroupResponse')
  final RuleGroupResponse ruleGroupResponse;

  /// A token used for optimistic locking. Network Firewall returns a token to
  /// your requests that access the rule group. The token marks the state of the
  /// rule group resource at the time of the request.
  ///
  /// To make changes to the rule group, you provide the token in your request.
  /// Network Firewall uses the token to ensure that the rule group hasn't changed
  /// since you last retrieved it. If it has changed, the operation fails with an
  /// <code>InvalidTokenException</code>. If this happens, retrieve the rule group
  /// again to get a current copy of it with a current token. Reapply your changes
  /// as needed, then try the operation again using the new token.
  @_s.JsonKey(name: 'UpdateToken')
  final String updateToken;

  CreateRuleGroupResponse({
    @_s.required this.ruleGroupResponse,
    @_s.required this.updateToken,
  });
  factory CreateRuleGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRuleGroupResponseFromJson(json);
}

/// An optional, non-standard action to use for stateless packet handling. You
/// can define this in addition to the standard action that you must specify.
///
/// You define and name the custom actions that you want to be able to use, and
/// then you reference them by name in your actions settings.
///
/// You can use custom actions in the following places:
///
/// <ul>
/// <li>
/// In a rule group's <a>StatelessRulesAndCustomActions</a> specification. The
/// custom actions are available for use by name inside the
/// <code>StatelessRulesAndCustomActions</code> where you define them. You can
/// use them for your stateless rule actions to specify what to do with a packet
/// that matches the rule's match attributes.
/// </li>
/// <li>
/// In a <a>FirewallPolicy</a> specification, in
/// <code>StatelessCustomActions</code>. The custom actions are available for
/// use inside the policy where you define them. You can use them for the
/// policy's default stateless actions settings to specify what to do with
/// packets that don't match any of the policy's stateless rules.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CustomAction {
  /// The custom action associated with the action name.
  @_s.JsonKey(name: 'ActionDefinition')
  final ActionDefinition actionDefinition;

  /// The descriptive name of the custom action. You can't change the name of a
  /// custom action after you create it.
  @_s.JsonKey(name: 'ActionName')
  final String actionName;

  CustomAction({
    @_s.required this.actionDefinition,
    @_s.required this.actionName,
  });
  factory CustomAction.fromJson(Map<String, dynamic> json) =>
      _$CustomActionFromJson(json);

  Map<String, dynamic> toJson() => _$CustomActionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFirewallPolicyResponse {
  /// The object containing the definition of the <a>FirewallPolicyResponse</a>
  /// that you asked to delete.
  @_s.JsonKey(name: 'FirewallPolicyResponse')
  final FirewallPolicyResponse firewallPolicyResponse;

  DeleteFirewallPolicyResponse({
    @_s.required this.firewallPolicyResponse,
  });
  factory DeleteFirewallPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFirewallPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFirewallResponse {
  @_s.JsonKey(name: 'Firewall')
  final Firewall firewall;
  @_s.JsonKey(name: 'FirewallStatus')
  final FirewallStatus firewallStatus;

  DeleteFirewallResponse({
    this.firewall,
    this.firewallStatus,
  });
  factory DeleteFirewallResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFirewallResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteResourcePolicyResponse {
  DeleteResourcePolicyResponse();
  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteResourcePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRuleGroupResponse {
  /// The high-level properties of a rule group. This, along with the
  /// <a>RuleGroup</a>, define the rule group. You can retrieve all objects for a
  /// rule group by calling <a>DescribeRuleGroup</a>.
  @_s.JsonKey(name: 'RuleGroupResponse')
  final RuleGroupResponse ruleGroupResponse;

  DeleteRuleGroupResponse({
    @_s.required this.ruleGroupResponse,
  });
  factory DeleteRuleGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteRuleGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFirewallPolicyResponse {
  /// The high-level properties of a firewall policy. This, along with the
  /// <a>FirewallPolicy</a>, define the policy. You can retrieve all objects for a
  /// firewall policy by calling <a>DescribeFirewallPolicy</a>.
  @_s.JsonKey(name: 'FirewallPolicyResponse')
  final FirewallPolicyResponse firewallPolicyResponse;

  /// A token used for optimistic locking. Network Firewall returns a token to
  /// your requests that access the firewall policy. The token marks the state of
  /// the policy resource at the time of the request.
  ///
  /// To make changes to the policy, you provide the token in your request.
  /// Network Firewall uses the token to ensure that the policy hasn't changed
  /// since you last retrieved it. If it has changed, the operation fails with an
  /// <code>InvalidTokenException</code>. If this happens, retrieve the firewall
  /// policy again to get a current copy of it with current token. Reapply your
  /// changes as needed, then try the operation again using the new token.
  @_s.JsonKey(name: 'UpdateToken')
  final String updateToken;

  /// The policy for the specified firewall policy.
  @_s.JsonKey(name: 'FirewallPolicy')
  final FirewallPolicy firewallPolicy;

  DescribeFirewallPolicyResponse({
    @_s.required this.firewallPolicyResponse,
    @_s.required this.updateToken,
    this.firewallPolicy,
  });
  factory DescribeFirewallPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFirewallPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFirewallResponse {
  /// The configuration settings for the firewall. These settings include the
  /// firewall policy and the subnets in your VPC to use for the firewall
  /// endpoints.
  @_s.JsonKey(name: 'Firewall')
  final Firewall firewall;

  /// Detailed information about the current status of a <a>Firewall</a>. You can
  /// retrieve this for a firewall by calling <a>DescribeFirewall</a> and
  /// providing the firewall name and ARN.
  @_s.JsonKey(name: 'FirewallStatus')
  final FirewallStatus firewallStatus;

  /// An optional token that you can use for optimistic locking. Network Firewall
  /// returns a token to your requests that access the firewall. The token marks
  /// the state of the firewall resource at the time of the request.
  ///
  /// To make an unconditional change to the firewall, omit the token in your
  /// update request. Without the token, Network Firewall performs your updates
  /// regardless of whether the firewall has changed since you last retrieved it.
  ///
  /// To make a conditional change to the firewall, provide the token in your
  /// update request. Network Firewall uses the token to ensure that the firewall
  /// hasn't changed since you last retrieved it. If it has changed, the operation
  /// fails with an <code>InvalidTokenException</code>. If this happens, retrieve
  /// the firewall again to get a current copy of it with a new token. Reapply
  /// your changes as needed, then try the operation again using the new token.
  @_s.JsonKey(name: 'UpdateToken')
  final String updateToken;

  DescribeFirewallResponse({
    this.firewall,
    this.firewallStatus,
    this.updateToken,
  });
  factory DescribeFirewallResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFirewallResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLoggingConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the firewall.
  @_s.JsonKey(name: 'FirewallArn')
  final String firewallArn;
  @_s.JsonKey(name: 'LoggingConfiguration')
  final LoggingConfiguration loggingConfiguration;

  DescribeLoggingConfigurationResponse({
    this.firewallArn,
    this.loggingConfiguration,
  });
  factory DescribeLoggingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeLoggingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeResourcePolicyResponse {
  /// The AWS Identity and Access Management policy for the resource.
  @_s.JsonKey(name: 'Policy')
  final String policy;

  DescribeResourcePolicyResponse({
    this.policy,
  });
  factory DescribeResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeResourcePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRuleGroupResponse {
  /// The high-level properties of a rule group. This, along with the
  /// <a>RuleGroup</a>, define the rule group. You can retrieve all objects for a
  /// rule group by calling <a>DescribeRuleGroup</a>.
  @_s.JsonKey(name: 'RuleGroupResponse')
  final RuleGroupResponse ruleGroupResponse;

  /// A token used for optimistic locking. Network Firewall returns a token to
  /// your requests that access the rule group. The token marks the state of the
  /// rule group resource at the time of the request.
  ///
  /// To make changes to the rule group, you provide the token in your request.
  /// Network Firewall uses the token to ensure that the rule group hasn't changed
  /// since you last retrieved it. If it has changed, the operation fails with an
  /// <code>InvalidTokenException</code>. If this happens, retrieve the rule group
  /// again to get a current copy of it with a current token. Reapply your changes
  /// as needed, then try the operation again using the new token.
  @_s.JsonKey(name: 'UpdateToken')
  final String updateToken;

  /// The object that defines the rules in a rule group. This, along with
  /// <a>RuleGroupResponse</a>, define the rule group. You can retrieve all
  /// objects for a rule group by calling <a>DescribeRuleGroup</a>.
  ///
  /// AWS Network Firewall uses a rule group to inspect and control network
  /// traffic. You define stateless rule groups to inspect individual packets and
  /// you define stateful rule groups to inspect packets in the context of their
  /// traffic flow.
  ///
  /// To use a rule group, you include it by reference in an Network Firewall
  /// firewall policy, then you use the policy in a firewall. You can reference a
  /// rule group from more than one firewall policy, and you can use a firewall
  /// policy in more than one firewall.
  @_s.JsonKey(name: 'RuleGroup')
  final RuleGroup ruleGroup;

  DescribeRuleGroupResponse({
    @_s.required this.ruleGroupResponse,
    @_s.required this.updateToken,
    this.ruleGroup,
  });
  factory DescribeRuleGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeRuleGroupResponseFromJson(json);
}

/// The value to use in an Amazon CloudWatch custom metric dimension. This is
/// used in the <code>PublishMetrics</code> <a>CustomAction</a>. A CloudWatch
/// custom metric dimension is a name/value pair that's part of the identity of
/// a metric.
///
/// AWS Network Firewall sets the dimension name to <code>CustomAction</code>
/// and you provide the dimension value.
///
/// For more information about CloudWatch custom metric dimensions, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html#usingDimensions">Publishing
/// Custom Metrics</a> in the <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html">Amazon
/// CloudWatch User Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Dimension {
  /// The value to use in the custom metric dimension.
  @_s.JsonKey(name: 'Value')
  final String value;

  Dimension({
    @_s.required this.value,
  });
  factory Dimension.fromJson(Map<String, dynamic> json) =>
      _$DimensionFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateSubnetsResponse {
  /// The Amazon Resource Name (ARN) of the firewall.
  @_s.JsonKey(name: 'FirewallArn')
  final String firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  @_s.JsonKey(name: 'FirewallName')
  final String firewallName;

  /// The IDs of the subnets that are associated with the firewall.
  @_s.JsonKey(name: 'SubnetMappings')
  final List<SubnetMapping> subnetMappings;

  /// An optional token that you can use for optimistic locking. Network Firewall
  /// returns a token to your requests that access the firewall. The token marks
  /// the state of the firewall resource at the time of the request.
  ///
  /// To make an unconditional change to the firewall, omit the token in your
  /// update request. Without the token, Network Firewall performs your updates
  /// regardless of whether the firewall has changed since you last retrieved it.
  ///
  /// To make a conditional change to the firewall, provide the token in your
  /// update request. Network Firewall uses the token to ensure that the firewall
  /// hasn't changed since you last retrieved it. If it has changed, the operation
  /// fails with an <code>InvalidTokenException</code>. If this happens, retrieve
  /// the firewall again to get a current copy of it with a new token. Reapply
  /// your changes as needed, then try the operation again using the new token.
  @_s.JsonKey(name: 'UpdateToken')
  final String updateToken;

  DisassociateSubnetsResponse({
    this.firewallArn,
    this.firewallName,
    this.subnetMappings,
    this.updateToken,
  });
  factory DisassociateSubnetsResponse.fromJson(Map<String, dynamic> json) =>
      _$DisassociateSubnetsResponseFromJson(json);
}

/// The firewall defines the configuration settings for an AWS Network Firewall
/// firewall. These settings include the firewall policy, the subnets in your
/// VPC to use for the firewall endpoints, and any tags that are attached to the
/// firewall AWS resource.
///
/// The status of the firewall, for example whether it's ready to filter network
/// traffic, is provided in the corresponding <a>FirewallStatus</a>. You can
/// retrieve both objects by calling <a>DescribeFirewall</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Firewall {
  /// The unique identifier for the firewall.
  @_s.JsonKey(name: 'FirewallId')
  final String firewallId;

  /// The Amazon Resource Name (ARN) of the firewall policy.
  ///
  /// The relationship of firewall to firewall policy is many to one. Each
  /// firewall requires one firewall policy association, and you can use the same
  /// firewall policy for multiple firewalls.
  @_s.JsonKey(name: 'FirewallPolicyArn')
  final String firewallPolicyArn;

  /// The public subnets that Network Firewall is using for the firewall. Each
  /// subnet must belong to a different Availability Zone.
  @_s.JsonKey(name: 'SubnetMappings')
  final List<SubnetMapping> subnetMappings;

  /// The unique identifier of the VPC where the firewall is in use.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  /// A flag indicating whether it is possible to delete the firewall. A setting
  /// of <code>TRUE</code> indicates that the firewall is protected against
  /// deletion. Use this setting to protect against accidentally deleting a
  /// firewall that is in use. When you create a firewall, the operation
  /// initializes this flag to <code>TRUE</code>.
  @_s.JsonKey(name: 'DeleteProtection')
  final bool deleteProtection;

  /// A description of the firewall.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The Amazon Resource Name (ARN) of the firewall.
  @_s.JsonKey(name: 'FirewallArn')
  final String firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  @_s.JsonKey(name: 'FirewallName')
  final String firewallName;

  /// A setting indicating whether the firewall is protected against a change to
  /// the firewall policy association. Use this setting to protect against
  /// accidentally modifying the firewall policy for a firewall that is in use.
  /// When you create a firewall, the operation initializes this setting to
  /// <code>TRUE</code>.
  @_s.JsonKey(name: 'FirewallPolicyChangeProtection')
  final bool firewallPolicyChangeProtection;

  /// A setting indicating whether the firewall is protected against changes to
  /// the subnet associations. Use this setting to protect against accidentally
  /// modifying the subnet associations for a firewall that is in use. When you
  /// create a firewall, the operation initializes this setting to
  /// <code>TRUE</code>.
  @_s.JsonKey(name: 'SubnetChangeProtection')
  final bool subnetChangeProtection;

  /// <p/>
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  Firewall({
    @_s.required this.firewallId,
    @_s.required this.firewallPolicyArn,
    @_s.required this.subnetMappings,
    @_s.required this.vpcId,
    this.deleteProtection,
    this.description,
    this.firewallArn,
    this.firewallName,
    this.firewallPolicyChangeProtection,
    this.subnetChangeProtection,
    this.tags,
  });
  factory Firewall.fromJson(Map<String, dynamic> json) =>
      _$FirewallFromJson(json);
}

/// High-level information about a firewall, returned by operations like create
/// and describe. You can use the information provided in the metadata to
/// retrieve and manage a firewall.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FirewallMetadata {
  /// The Amazon Resource Name (ARN) of the firewall.
  @_s.JsonKey(name: 'FirewallArn')
  final String firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  @_s.JsonKey(name: 'FirewallName')
  final String firewallName;

  FirewallMetadata({
    this.firewallArn,
    this.firewallName,
  });
  factory FirewallMetadata.fromJson(Map<String, dynamic> json) =>
      _$FirewallMetadataFromJson(json);
}

/// The firewall policy defines the behavior of a firewall using a collection of
/// stateless and stateful rule groups and other settings. You can use one
/// firewall policy for multiple firewalls.
///
/// This, along with <a>FirewallPolicyResponse</a>, define the policy. You can
/// retrieve all objects for a firewall policy by calling
/// <a>DescribeFirewallPolicy</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FirewallPolicy {
  /// The actions to take on a packet if it doesn't match any of the stateless
  /// rules in the policy. If you want non-matching packets to be forwarded for
  /// stateful inspection, specify <code>aws:forward_to_sfe</code>.
  ///
  /// You must specify one of the standard actions: <code>aws:pass</code>,
  /// <code>aws:drop</code>, or <code>aws:forward_to_sfe</code>. In addition, you
  /// can specify custom actions that are compatible with your standard section
  /// choice.
  ///
  /// For example, you could specify <code>["aws:pass"]</code> or you could
  /// specify <code>["aws:pass", “customActionName”]</code>. For information about
  /// compatibility, see the custom action descriptions under <a>CustomAction</a>.
  @_s.JsonKey(name: 'StatelessDefaultActions')
  final List<String> statelessDefaultActions;

  /// The actions to take on a fragmented packet if it doesn't match any of the
  /// stateless rules in the policy. If you want non-matching fragmented packets
  /// to be forwarded for stateful inspection, specify
  /// <code>aws:forward_to_sfe</code>.
  ///
  /// You must specify one of the standard actions: <code>aws:pass</code>,
  /// <code>aws:drop</code>, or <code>aws:forward_to_sfe</code>. In addition, you
  /// can specify custom actions that are compatible with your standard section
  /// choice.
  ///
  /// For example, you could specify <code>["aws:pass"]</code> or you could
  /// specify <code>["aws:pass", “customActionName”]</code>. For information about
  /// compatibility, see the custom action descriptions under <a>CustomAction</a>.
  @_s.JsonKey(name: 'StatelessFragmentDefaultActions')
  final List<String> statelessFragmentDefaultActions;

  /// References to the stateless rule groups that are used in the policy. These
  /// define the inspection criteria in stateful rules.
  @_s.JsonKey(name: 'StatefulRuleGroupReferences')
  final List<StatefulRuleGroupReference> statefulRuleGroupReferences;

  /// The custom action definitions that are available for use in the firewall
  /// policy's <code>StatelessDefaultActions</code> setting. You name each custom
  /// action that you define, and then you can use it by name in your default
  /// actions specifications.
  @_s.JsonKey(name: 'StatelessCustomActions')
  final List<CustomAction> statelessCustomActions;

  /// References to the stateless rule groups that are used in the policy. These
  /// define the matching criteria in stateless rules.
  @_s.JsonKey(name: 'StatelessRuleGroupReferences')
  final List<StatelessRuleGroupReference> statelessRuleGroupReferences;

  FirewallPolicy({
    @_s.required this.statelessDefaultActions,
    @_s.required this.statelessFragmentDefaultActions,
    this.statefulRuleGroupReferences,
    this.statelessCustomActions,
    this.statelessRuleGroupReferences,
  });
  factory FirewallPolicy.fromJson(Map<String, dynamic> json) =>
      _$FirewallPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$FirewallPolicyToJson(this);
}

/// High-level information about a firewall policy, returned by operations like
/// create and describe. You can use the information provided in the metadata to
/// retrieve and manage a firewall policy. You can retrieve all objects for a
/// firewall policy by calling <a>DescribeFirewallPolicy</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FirewallPolicyMetadata {
  /// The Amazon Resource Name (ARN) of the firewall policy.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The descriptive name of the firewall policy. You can't change the name of a
  /// firewall policy after you create it.
  @_s.JsonKey(name: 'Name')
  final String name;

  FirewallPolicyMetadata({
    this.arn,
    this.name,
  });
  factory FirewallPolicyMetadata.fromJson(Map<String, dynamic> json) =>
      _$FirewallPolicyMetadataFromJson(json);
}

/// The high-level properties of a firewall policy. This, along with the
/// <a>FirewallPolicy</a>, define the policy. You can retrieve all objects for a
/// firewall policy by calling <a>DescribeFirewallPolicy</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FirewallPolicyResponse {
  /// The Amazon Resource Name (ARN) of the firewall policy.
  /// <note>
  /// If this response is for a create request that had <code>DryRun</code> set to
  /// <code>TRUE</code>, then this ARN is a placeholder that isn't attached to a
  /// valid resource.
  /// </note>
  @_s.JsonKey(name: 'FirewallPolicyArn')
  final String firewallPolicyArn;

  /// The unique identifier for the firewall policy.
  @_s.JsonKey(name: 'FirewallPolicyId')
  final String firewallPolicyId;

  /// The descriptive name of the firewall policy. You can't change the name of a
  /// firewall policy after you create it.
  @_s.JsonKey(name: 'FirewallPolicyName')
  final String firewallPolicyName;

  /// A description of the firewall policy.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The current status of the firewall policy. You can retrieve this for a
  /// firewall policy by calling <a>DescribeFirewallPolicy</a> and providing the
  /// firewall policy's name or ARN.
  @_s.JsonKey(name: 'FirewallPolicyStatus')
  final ResourceStatus firewallPolicyStatus;

  /// The key:value pairs to associate with the resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  FirewallPolicyResponse({
    @_s.required this.firewallPolicyArn,
    @_s.required this.firewallPolicyId,
    @_s.required this.firewallPolicyName,
    this.description,
    this.firewallPolicyStatus,
    this.tags,
  });
  factory FirewallPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$FirewallPolicyResponseFromJson(json);
}

/// Detailed information about the current status of a <a>Firewall</a>. You can
/// retrieve this for a firewall by calling <a>DescribeFirewall</a> and
/// providing the firewall name and ARN.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FirewallStatus {
  /// The configuration sync state for the firewall. This summarizes the sync
  /// states reported in the <code>Config</code> settings for all of the
  /// Availability Zones where you have configured the firewall.
  ///
  /// When you create a firewall or update its configuration, for example by
  /// adding a rule group to its firewall policy, Network Firewall distributes the
  /// configuration changes to all zones where the firewall is in use. This
  /// summary indicates whether the configuration changes have been applied
  /// everywhere.
  ///
  /// This status must be <code>IN_SYNC</code> for the firewall to be ready for
  /// use, but it doesn't indicate that the firewall is ready. The
  /// <code>Status</code> setting indicates firewall readiness.
  @_s.JsonKey(name: 'ConfigurationSyncStateSummary')
  final ConfigurationSyncState configurationSyncStateSummary;

  /// The readiness of the configured firewall to handle network traffic across
  /// all of the Availability Zones where you've configured it. This setting is
  /// <code>READY</code> only when the <code>ConfigurationSyncStateSummary</code>
  /// value is <code>IN_SYNC</code> and the <code>Attachment</code>
  /// <code>Status</code> values for all of the configured subnets are
  /// <code>READY</code>.
  @_s.JsonKey(name: 'Status')
  final FirewallStatusValue status;

  /// The subnets that you've configured for use by the Network Firewall firewall.
  /// This contains one array element per Availability Zone where you've
  /// configured a subnet. These objects provide details of the information that
  /// is summarized in the <code>ConfigurationSyncStateSummary</code> and
  /// <code>Status</code>, broken down by zone and configuration object.
  @_s.JsonKey(name: 'SyncStates')
  final Map<String, SyncState> syncStates;

  FirewallStatus({
    @_s.required this.configurationSyncStateSummary,
    @_s.required this.status,
    this.syncStates,
  });
  factory FirewallStatus.fromJson(Map<String, dynamic> json) =>
      _$FirewallStatusFromJson(json);
}

enum FirewallStatusValue {
  @_s.JsonValue('PROVISIONING')
  provisioning,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('READY')
  ready,
}

enum GeneratedRulesType {
  @_s.JsonValue('ALLOWLIST')
  allowlist,
  @_s.JsonValue('DENYLIST')
  denylist,
}

/// The 5-tuple criteria for AWS Network Firewall to use to inspect packet
/// headers in stateful traffic flow inspection. Traffic flows that match the
/// criteria are a match for the corresponding <a>StatefulRule</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Header {
  /// The destination IP address or address range to inspect for, in CIDR
  /// notation. To match with any address, specify <code>ANY</code>.
  ///
  /// Specify an IP address or a block of IP addresses in Classless Inter-Domain
  /// Routing (CIDR) notation. Network Firewall supports all address ranges for
  /// IPv4.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// To configure Network Firewall to inspect for the IP address 192.0.2.44,
  /// specify <code>192.0.2.44/32</code>.
  /// </li>
  /// <li>
  /// To configure Network Firewall to inspect for IP addresses from 192.0.2.0 to
  /// 192.0.2.255, specify <code>192.0.2.0/24</code>.
  /// </li>
  /// </ul>
  /// For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  @_s.JsonKey(name: 'Destination')
  final String destination;

  /// The destination port to inspect for. You can specify an individual port, for
  /// example <code>1994</code> and you can specify a port range, for example
  /// <code>1990-1994</code>. To match with any port, specify <code>ANY</code>.
  @_s.JsonKey(name: 'DestinationPort')
  final String destinationPort;

  /// The direction of traffic flow to inspect. If set to <code>ANY</code>, the
  /// inspection matches bidirectional traffic, both from the source to the
  /// destination and from the destination to the source. If set to
  /// <code>FORWARD</code>, the inspection only matches traffic going from the
  /// source to the destination.
  @_s.JsonKey(name: 'Direction')
  final StatefulRuleDirection direction;

  /// The protocol to inspect for. To match with any protocol, specify
  /// <code>ANY</code>.
  @_s.JsonKey(name: 'Protocol')
  final StatefulRuleProtocol protocol;

  /// The source IP address or address range to inspect for, in CIDR notation. To
  /// match with any address, specify <code>ANY</code>.
  ///
  /// Specify an IP address or a block of IP addresses in Classless Inter-Domain
  /// Routing (CIDR) notation. Network Firewall supports all address ranges for
  /// IPv4.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// To configure Network Firewall to inspect for the IP address 192.0.2.44,
  /// specify <code>192.0.2.44/32</code>.
  /// </li>
  /// <li>
  /// To configure Network Firewall to inspect for IP addresses from 192.0.2.0 to
  /// 192.0.2.255, specify <code>192.0.2.0/24</code>.
  /// </li>
  /// </ul>
  /// For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  @_s.JsonKey(name: 'Source')
  final String source;

  /// The source port to inspect for. You can specify an individual port, for
  /// example <code>1994</code> and you can specify a port range, for example
  /// <code>1990-1994</code>. To match with any port, specify <code>ANY</code>.
  @_s.JsonKey(name: 'SourcePort')
  final String sourcePort;

  Header({
    @_s.required this.destination,
    @_s.required this.destinationPort,
    @_s.required this.direction,
    @_s.required this.protocol,
    @_s.required this.source,
    @_s.required this.sourcePort,
  });
  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderToJson(this);
}

/// A list of IP addresses and address ranges, in CIDR notation. This is part of
/// a <a>RuleVariables</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IPSet {
  /// The list of IP addresses and address ranges, in CIDR notation.
  @_s.JsonKey(name: 'Definition')
  final List<String> definition;

  IPSet({
    @_s.required this.definition,
  });
  factory IPSet.fromJson(Map<String, dynamic> json) => _$IPSetFromJson(json);

  Map<String, dynamic> toJson() => _$IPSetToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFirewallPoliciesResponse {
  /// The metadata for the firewall policies. Depending on your setting for max
  /// results and the number of firewall policies that you have, this might not be
  /// the full list.
  @_s.JsonKey(name: 'FirewallPolicies')
  final List<FirewallPolicyMetadata> firewallPolicies;

  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Network Firewall returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListFirewallPoliciesResponse({
    this.firewallPolicies,
    this.nextToken,
  });
  factory ListFirewallPoliciesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFirewallPoliciesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFirewallsResponse {
  /// The firewall metadata objects for the VPCs that you specified. Depending on
  /// your setting for max results and the number of firewalls you have, a single
  /// call might not be the full list.
  @_s.JsonKey(name: 'Firewalls')
  final List<FirewallMetadata> firewalls;

  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Network Firewall returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListFirewallsResponse({
    this.firewalls,
    this.nextToken,
  });
  factory ListFirewallsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFirewallsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRuleGroupsResponse {
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Network Firewall returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The rule group metadata objects that you've defined. Depending on your
  /// setting for max results and the number of rule groups, this might not be the
  /// full list.
  @_s.JsonKey(name: 'RuleGroups')
  final List<RuleGroupMetadata> ruleGroups;

  ListRuleGroupsResponse({
    this.nextToken,
    this.ruleGroups,
  });
  factory ListRuleGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRuleGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Network Firewall returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The tags that are associated with the resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Defines where AWS Network Firewall sends logs for the firewall for one log
/// type. This is used in <a>LoggingConfiguration</a>. You can send each type of
/// log to an Amazon S3 bucket, a CloudWatch log group, or a Kinesis Data
/// Firehose delivery stream.
///
/// Network Firewall generates logs for stateful rule groups. You can save alert
/// and flow log types. The stateful rules engine records flow logs for all
/// network traffic that it receives. It records alert logs for traffic that
/// matches stateful rules that have the rule action set to <code>DROP</code> or
/// <code>ALERT</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LogDestinationConfig {
  /// The named location for the logs, provided in a key:value mapping that is
  /// specific to the chosen destination type.
  ///
  /// <ul>
  /// <li>
  /// For an Amazon S3 bucket, provide the name of the bucket, with key
  /// <code>bucketName</code>, and optionally provide a prefix, with key
  /// <code>prefix</code>. The following example specifies an Amazon S3 bucket
  /// named <code>DOC-EXAMPLE-BUCKET</code> and the prefix <code>alerts</code>:
  ///
  /// <code>"LogDestination": { "bucketName": "DOC-EXAMPLE-BUCKET", "prefix":
  /// "alerts" }</code>
  /// </li>
  /// <li>
  /// For a CloudWatch log group, provide the name of the CloudWatch log group,
  /// with key <code>logGroup</code>. The following example specifies a log group
  /// named <code>alert-log-group</code>:
  ///
  /// <code>"LogDestination": { "logGroup": "alert-log-group" }</code>
  /// </li>
  /// <li>
  /// For a Kinesis Data Firehose delivery stream, provide the name of the
  /// delivery stream, with key <code>deliveryStream</code>. The following example
  /// specifies a delivery stream named <code>alert-delivery-stream</code>:
  ///
  /// <code>"LogDestination": { "deliveryStream": "alert-delivery-stream" }</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'LogDestination')
  final Map<String, String> logDestination;

  /// The type of storage destination to send these logs to. You can send logs to
  /// an Amazon S3 bucket, a CloudWatch log group, or a Kinesis Data Firehose
  /// delivery stream.
  @_s.JsonKey(name: 'LogDestinationType')
  final LogDestinationType logDestinationType;

  /// The type of log to send. Alert logs report traffic that matches a
  /// <a>StatefulRule</a> with an action setting that sends an alert log message.
  /// Flow logs are standard network traffic flow logs.
  @_s.JsonKey(name: 'LogType')
  final LogType logType;

  LogDestinationConfig({
    @_s.required this.logDestination,
    @_s.required this.logDestinationType,
    @_s.required this.logType,
  });
  factory LogDestinationConfig.fromJson(Map<String, dynamic> json) =>
      _$LogDestinationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$LogDestinationConfigToJson(this);
}

enum LogDestinationType {
  @_s.JsonValue('S3')
  s3,
  @_s.JsonValue('CloudWatchLogs')
  cloudWatchLogs,
  @_s.JsonValue('KinesisDataFirehose')
  kinesisDataFirehose,
}

enum LogType {
  @_s.JsonValue('ALERT')
  alert,
  @_s.JsonValue('FLOW')
  flow,
}

/// Defines how AWS Network Firewall performs logging for a <a>Firewall</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoggingConfiguration {
  /// Defines the logging destinations for the logs for a firewall. Network
  /// Firewall generates logs for stateful rule groups.
  @_s.JsonKey(name: 'LogDestinationConfigs')
  final List<LogDestinationConfig> logDestinationConfigs;

  LoggingConfiguration({
    @_s.required this.logDestinationConfigs,
  });
  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$LoggingConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$LoggingConfigurationToJson(this);
}

/// Criteria for Network Firewall to use to inspect an individual packet in
/// stateless rule inspection. Each match attributes set can include one or more
/// items such as IP address, CIDR range, port number, protocol, and TCP flags.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MatchAttributes {
  /// The destination ports to inspect for. If not specified, this matches with
  /// any destination port. This setting is only used for protocols 6 (TCP) and 17
  /// (UDP).
  ///
  /// You can specify individual ports, for example <code>1994</code> and you can
  /// specify port ranges, for example <code>1990-1994</code>.
  @_s.JsonKey(name: 'DestinationPorts')
  final List<PortRange> destinationPorts;

  /// The destination IP addresses and address ranges to inspect for, in CIDR
  /// notation. If not specified, this matches with any destination address.
  @_s.JsonKey(name: 'Destinations')
  final List<Address> destinations;

  /// The protocols to inspect for, specified using each protocol's assigned
  /// internet protocol number (IANA). If not specified, this matches with any
  /// protocol.
  @_s.JsonKey(name: 'Protocols')
  final List<int> protocols;

  /// The source ports to inspect for. If not specified, this matches with any
  /// source port. This setting is only used for protocols 6 (TCP) and 17 (UDP).
  ///
  /// You can specify individual ports, for example <code>1994</code> and you can
  /// specify port ranges, for example <code>1990-1994</code>.
  @_s.JsonKey(name: 'SourcePorts')
  final List<PortRange> sourcePorts;

  /// The source IP addresses and address ranges to inspect for, in CIDR notation.
  /// If not specified, this matches with any source address.
  @_s.JsonKey(name: 'Sources')
  final List<Address> sources;

  /// The TCP flags and masks to inspect for. If not specified, this matches with
  /// any settings. This setting is only used for protocol 6 (TCP).
  @_s.JsonKey(name: 'TCPFlags')
  final List<TCPFlagField> tCPFlags;

  MatchAttributes({
    this.destinationPorts,
    this.destinations,
    this.protocols,
    this.sourcePorts,
    this.sources,
    this.tCPFlags,
  });
  factory MatchAttributes.fromJson(Map<String, dynamic> json) =>
      _$MatchAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$MatchAttributesToJson(this);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PerObjectStatus {
  /// <p/>
  @_s.JsonKey(name: 'SyncStatus')
  final PerObjectSyncStatus syncStatus;

  PerObjectStatus({
    this.syncStatus,
  });
  factory PerObjectStatus.fromJson(Map<String, dynamic> json) =>
      _$PerObjectStatusFromJson(json);
}

enum PerObjectSyncStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('IN_SYNC')
  inSync,
}

/// A single port range specification. This is used for source and destination
/// port ranges in the stateless rule <a>MatchAttributes</a>,
/// <code>SourcePorts</code>, and <code>DestinationPorts</code> settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PortRange {
  /// The lower limit of the port range. This must be less than or equal to the
  /// <code>ToPort</code> specification.
  @_s.JsonKey(name: 'FromPort')
  final int fromPort;

  /// The upper limit of the port range. This must be greater than or equal to the
  /// <code>FromPort</code> specification.
  @_s.JsonKey(name: 'ToPort')
  final int toPort;

  PortRange({
    @_s.required this.fromPort,
    @_s.required this.toPort,
  });
  factory PortRange.fromJson(Map<String, dynamic> json) =>
      _$PortRangeFromJson(json);

  Map<String, dynamic> toJson() => _$PortRangeToJson(this);
}

/// A set of port ranges for use in the rules in a rule group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PortSet {
  /// The set of port ranges.
  @_s.JsonKey(name: 'Definition')
  final List<String> definition;

  PortSet({
    this.definition,
  });
  factory PortSet.fromJson(Map<String, dynamic> json) =>
      _$PortSetFromJson(json);

  Map<String, dynamic> toJson() => _$PortSetToJson(this);
}

/// Stateless inspection criteria that publishes the specified metrics to Amazon
/// CloudWatch for the matching packet. This setting defines a CloudWatch
/// dimension value to be published.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PublishMetricAction {
  /// <p/>
  @_s.JsonKey(name: 'Dimensions')
  final List<Dimension> dimensions;

  PublishMetricAction({
    @_s.required this.dimensions,
  });
  factory PublishMetricAction.fromJson(Map<String, dynamic> json) =>
      _$PublishMetricActionFromJson(json);

  Map<String, dynamic> toJson() => _$PublishMetricActionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutResourcePolicyResponse {
  PutResourcePolicyResponse();
  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutResourcePolicyResponseFromJson(json);
}

enum ResourceStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
}

/// The inspection criteria and action for a single stateless rule. AWS Network
/// Firewall inspects each packet for the specified matching criteria. When a
/// packet matches the criteria, Network Firewall performs the rule's actions on
/// the packet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RuleDefinition {
  /// The actions to take on a packet that matches one of the stateless rule
  /// definition's match attributes. You must specify a standard action and you
  /// can add custom actions.
  /// <note>
  /// Network Firewall only forwards a packet for stateful rule inspection if you
  /// specify <code>aws:forward_to_sfe</code> for a rule that the packet matches,
  /// or if the packet doesn't match any stateless rule and you specify
  /// <code>aws:forward_to_sfe</code> for the <code>StatelessDefaultActions</code>
  /// setting for the <a>FirewallPolicy</a>.
  /// </note>
  /// For every rule, you must specify exactly one of the following standard
  /// actions.
  ///
  /// <ul>
  /// <li>
  /// <b>aws:pass</b> - Discontinues all inspection of the packet and permits it
  /// to go to its intended destination.
  /// </li>
  /// <li>
  /// <b>aws:drop</b> - Discontinues all inspection of the packet and blocks it
  /// from going to its intended destination.
  /// </li>
  /// <li>
  /// <b>aws:forward_to_sfe</b> - Discontinues stateless inspection of the packet
  /// and forwards it to the stateful rule engine for inspection.
  /// </li>
  /// </ul>
  /// Additionally, you can specify a custom action. To do this, you define a
  /// custom action by name and type, then provide the name you've assigned to the
  /// action in this <code>Actions</code> setting. For information about the
  /// options, see <a>CustomAction</a>.
  ///
  /// To provide more than one action in this setting, separate the settings with
  /// a comma. For example, if you have a custom <code>PublishMetrics</code>
  /// action that you've named <code>MyMetricsAction</code>, then you could
  /// specify the standard action <code>aws:pass</code> and the custom action with
  /// <code>[“aws:pass”, “MyMetricsAction”]</code>.
  @_s.JsonKey(name: 'Actions')
  final List<String> actions;

  /// Criteria for Network Firewall to use to inspect an individual packet in
  /// stateless rule inspection. Each match attributes set can include one or more
  /// items such as IP address, CIDR range, port number, protocol, and TCP flags.
  @_s.JsonKey(name: 'MatchAttributes')
  final MatchAttributes matchAttributes;

  RuleDefinition({
    @_s.required this.actions,
    @_s.required this.matchAttributes,
  });
  factory RuleDefinition.fromJson(Map<String, dynamic> json) =>
      _$RuleDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$RuleDefinitionToJson(this);
}

/// The object that defines the rules in a rule group. This, along with
/// <a>RuleGroupResponse</a>, define the rule group. You can retrieve all
/// objects for a rule group by calling <a>DescribeRuleGroup</a>.
///
/// AWS Network Firewall uses a rule group to inspect and control network
/// traffic. You define stateless rule groups to inspect individual packets and
/// you define stateful rule groups to inspect packets in the context of their
/// traffic flow.
///
/// To use a rule group, you include it by reference in an Network Firewall
/// firewall policy, then you use the policy in a firewall. You can reference a
/// rule group from more than one firewall policy, and you can use a firewall
/// policy in more than one firewall.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RuleGroup {
  /// The stateful rules or stateless rules for the rule group.
  @_s.JsonKey(name: 'RulesSource')
  final RulesSource rulesSource;

  /// Settings that are available for use in the rules in the rule group. You can
  /// only use these for stateful rule groups.
  @_s.JsonKey(name: 'RuleVariables')
  final RuleVariables ruleVariables;

  RuleGroup({
    @_s.required this.rulesSource,
    this.ruleVariables,
  });
  factory RuleGroup.fromJson(Map<String, dynamic> json) =>
      _$RuleGroupFromJson(json);

  Map<String, dynamic> toJson() => _$RuleGroupToJson(this);
}

/// High-level information about a rule group, returned by
/// <a>ListRuleGroups</a>. You can use the information provided in the metadata
/// to retrieve and manage a rule group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RuleGroupMetadata {
  /// The Amazon Resource Name (ARN) of the rule group.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The descriptive name of the rule group. You can't change the name of a rule
  /// group after you create it.
  @_s.JsonKey(name: 'Name')
  final String name;

  RuleGroupMetadata({
    this.arn,
    this.name,
  });
  factory RuleGroupMetadata.fromJson(Map<String, dynamic> json) =>
      _$RuleGroupMetadataFromJson(json);
}

/// The high-level properties of a rule group. This, along with the
/// <a>RuleGroup</a>, define the rule group. You can retrieve all objects for a
/// rule group by calling <a>DescribeRuleGroup</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RuleGroupResponse {
  /// The Amazon Resource Name (ARN) of the rule group.
  /// <note>
  /// If this response is for a create request that had <code>DryRun</code> set to
  /// <code>TRUE</code>, then this ARN is a placeholder that isn't attached to a
  /// valid resource.
  /// </note>
  @_s.JsonKey(name: 'RuleGroupArn')
  final String ruleGroupArn;

  /// The unique identifier for the rule group.
  @_s.JsonKey(name: 'RuleGroupId')
  final String ruleGroupId;

  /// The descriptive name of the rule group. You can't change the name of a rule
  /// group after you create it.
  @_s.JsonKey(name: 'RuleGroupName')
  final String ruleGroupName;

  /// The maximum operating resources that this rule group can use. Rule group
  /// capacity is fixed at creation. When you update a rule group, you are limited
  /// to this capacity. When you reference a rule group from a firewall policy,
  /// Network Firewall reserves this capacity for the rule group.
  ///
  /// You can retrieve the capacity that would be required for a rule group before
  /// you create the rule group by calling <a>CreateRuleGroup</a> with
  /// <code>DryRun</code> set to <code>TRUE</code>.
  @_s.JsonKey(name: 'Capacity')
  final int capacity;

  /// A description of the rule group.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Detailed information about the current status of a rule group.
  @_s.JsonKey(name: 'RuleGroupStatus')
  final ResourceStatus ruleGroupStatus;

  /// The key:value pairs to associate with the resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// Indicates whether the rule group is stateless or stateful. If the rule group
  /// is stateless, it contains stateless rules. If it is stateful, it contains
  /// stateful rules.
  @_s.JsonKey(name: 'Type')
  final RuleGroupType type;

  RuleGroupResponse({
    @_s.required this.ruleGroupArn,
    @_s.required this.ruleGroupId,
    @_s.required this.ruleGroupName,
    this.capacity,
    this.description,
    this.ruleGroupStatus,
    this.tags,
    this.type,
  });
  factory RuleGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$RuleGroupResponseFromJson(json);
}

enum RuleGroupType {
  @_s.JsonValue('STATELESS')
  stateless,
  @_s.JsonValue('STATEFUL')
  stateful,
}

extension on RuleGroupType {
  String toValue() {
    switch (this) {
      case RuleGroupType.stateless:
        return 'STATELESS';
      case RuleGroupType.stateful:
        return 'STATEFUL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Additional settings for a stateful rule. This is part of the
/// <a>StatefulRule</a> configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RuleOption {
  /// <p/>
  @_s.JsonKey(name: 'Keyword')
  final String keyword;

  /// <p/>
  @_s.JsonKey(name: 'Settings')
  final List<String> settings;

  RuleOption({
    @_s.required this.keyword,
    this.settings,
  });
  factory RuleOption.fromJson(Map<String, dynamic> json) =>
      _$RuleOptionFromJson(json);

  Map<String, dynamic> toJson() => _$RuleOptionToJson(this);
}

/// Settings that are available for use in the rules in the <a>RuleGroup</a>
/// where this is defined.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RuleVariables {
  /// A list of IP addresses and address ranges, in CIDR notation.
  @_s.JsonKey(name: 'IPSets')
  final Map<String, IPSet> iPSets;

  /// A list of port ranges.
  @_s.JsonKey(name: 'PortSets')
  final Map<String, PortSet> portSets;

  RuleVariables({
    this.iPSets,
    this.portSets,
  });
  factory RuleVariables.fromJson(Map<String, dynamic> json) =>
      _$RuleVariablesFromJson(json);

  Map<String, dynamic> toJson() => _$RuleVariablesToJson(this);
}

/// The stateless or stateful rules definitions for use in a single rule group.
/// Each rule group requires a single <code>RulesSource</code>. You can use an
/// instance of this for either stateless rules or stateful rules.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RulesSource {
  /// Stateful inspection criteria for a domain list rule group.
  @_s.JsonKey(name: 'RulesSourceList')
  final RulesSourceList rulesSourceList;

  /// Stateful inspection criteria, provided in Suricata compatible intrusion
  /// prevention system (IPS) rules. Suricata is an open-source network IPS that
  /// includes a standard rule-based language for network traffic inspection.
  ///
  /// These rules contain the inspection criteria and the action to take for
  /// traffic that matches the criteria, so this type of rule group doesn't have a
  /// separate action setting.
  ///
  /// You can provide the rules from a file that you've stored in an Amazon S3
  /// bucket, or by providing the rules in a Suricata rules string. To import from
  /// Amazon S3, provide the fully qualified name of the file that contains the
  /// rules definitions. To provide a Suricata rule string, provide the complete,
  /// Suricata compatible rule.
  @_s.JsonKey(name: 'RulesString')
  final String rulesString;

  /// The 5-tuple stateful inspection criteria. This contains an array of
  /// individual 5-tuple stateful rules to be used together in a stateful rule
  /// group.
  @_s.JsonKey(name: 'StatefulRules')
  final List<StatefulRule> statefulRules;

  /// Stateless inspection criteria to be used in a stateless rule group.
  @_s.JsonKey(name: 'StatelessRulesAndCustomActions')
  final StatelessRulesAndCustomActions statelessRulesAndCustomActions;

  RulesSource({
    this.rulesSourceList,
    this.rulesString,
    this.statefulRules,
    this.statelessRulesAndCustomActions,
  });
  factory RulesSource.fromJson(Map<String, dynamic> json) =>
      _$RulesSourceFromJson(json);

  Map<String, dynamic> toJson() => _$RulesSourceToJson(this);
}

/// Stateful inspection criteria for a domain list rule group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RulesSourceList {
  /// Whether you want to allow or deny access to the domains in your target list.
  @_s.JsonKey(name: 'GeneratedRulesType')
  final GeneratedRulesType generatedRulesType;

  /// <p/>
  @_s.JsonKey(name: 'TargetTypes')
  final List<TargetType> targetTypes;

  /// The domains that you want to inspect for in your traffic flows. To provide
  /// multiple domains, separate them with commas.
  @_s.JsonKey(name: 'Targets')
  final List<String> targets;

  RulesSourceList({
    @_s.required this.generatedRulesType,
    @_s.required this.targetTypes,
    @_s.required this.targets,
  });
  factory RulesSourceList.fromJson(Map<String, dynamic> json) =>
      _$RulesSourceListFromJson(json);

  Map<String, dynamic> toJson() => _$RulesSourceListToJson(this);
}

enum StatefulAction {
  @_s.JsonValue('PASS')
  pass,
  @_s.JsonValue('DROP')
  drop,
  @_s.JsonValue('ALERT')
  alert,
}

/// A single 5-tuple stateful rule, for use in a stateful rule group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StatefulRule {
  /// Defines what Network Firewall should do with the packets in a traffic flow
  /// when the flow matches the stateful rule criteria. For all actions, Network
  /// Firewall performs the specified action and discontinues stateful inspection
  /// of the traffic flow.
  ///
  /// The actions for a stateful rule are defined as follows:
  ///
  /// <ul>
  /// <li>
  /// <b>PASS</b> - Permits the packets to go to the intended destination.
  /// </li>
  /// <li>
  /// <b>DROP</b> - Blocks the packets from going to the intended destination and
  /// sends an alert log message, if alert logging is configured in the
  /// <a>Firewall</a> <a>LoggingConfiguration</a>.
  /// </li>
  /// <li>
  /// <b>ALERT</b> - Permits the packets to go to the intended destination and
  /// sends an alert log message, if alert logging is configured in the
  /// <a>Firewall</a> <a>LoggingConfiguration</a>.
  ///
  /// You can use this action to test a rule that you intend to use to drop
  /// traffic. You can enable the rule with <code>ALERT</code> action, verify in
  /// the logs that the rule is filtering as you want, then change the action to
  /// <code>DROP</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Action')
  final StatefulAction action;

  /// The stateful 5-tuple inspection criteria for this rule, used to inspect
  /// traffic flows.
  @_s.JsonKey(name: 'Header')
  final Header header;

  /// <p/>
  @_s.JsonKey(name: 'RuleOptions')
  final List<RuleOption> ruleOptions;

  StatefulRule({
    @_s.required this.action,
    @_s.required this.header,
    @_s.required this.ruleOptions,
  });
  factory StatefulRule.fromJson(Map<String, dynamic> json) =>
      _$StatefulRuleFromJson(json);

  Map<String, dynamic> toJson() => _$StatefulRuleToJson(this);
}

enum StatefulRuleDirection {
  @_s.JsonValue('FORWARD')
  forward,
  @_s.JsonValue('ANY')
  any,
}

/// Identifier for a single stateful rule group, used in a firewall policy to
/// refer to a rule group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StatefulRuleGroupReference {
  /// The Amazon Resource Name (ARN) of the stateful rule group.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  StatefulRuleGroupReference({
    @_s.required this.resourceArn,
  });
  factory StatefulRuleGroupReference.fromJson(Map<String, dynamic> json) =>
      _$StatefulRuleGroupReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$StatefulRuleGroupReferenceToJson(this);
}

enum StatefulRuleProtocol {
  @_s.JsonValue('IP')
  ip,
  @_s.JsonValue('TCP')
  tcp,
  @_s.JsonValue('UDP')
  udp,
  @_s.JsonValue('ICMP')
  icmp,
  @_s.JsonValue('HTTP')
  http,
  @_s.JsonValue('FTP')
  ftp,
  @_s.JsonValue('TLS')
  tls,
  @_s.JsonValue('SMB')
  smb,
  @_s.JsonValue('DNS')
  dns,
  @_s.JsonValue('DCERPC')
  dcerpc,
  @_s.JsonValue('SSH')
  ssh,
  @_s.JsonValue('SMTP')
  smtp,
  @_s.JsonValue('IMAP')
  imap,
  @_s.JsonValue('MSN')
  msn,
  @_s.JsonValue('KRB5')
  krb5,
  @_s.JsonValue('IKEV2')
  ikev2,
  @_s.JsonValue('TFTP')
  tftp,
  @_s.JsonValue('NTP')
  ntp,
  @_s.JsonValue('DHCP')
  dhcp,
}

/// A single stateless rule. This is used in
/// <a>StatelessRulesAndCustomActions</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StatelessRule {
  /// A setting that indicates the order in which to run this rule relative to all
  /// of the rules that are defined for a stateless rule group. Network Firewall
  /// evaluates the rules in a rule group starting with the lowest priority
  /// setting. You must ensure that the priority settings are unique for the rule
  /// group.
  ///
  /// Each stateless rule group uses exactly one
  /// <code>StatelessRulesAndCustomActions</code> object, and each
  /// <code>StatelessRulesAndCustomActions</code> contains exactly one
  /// <code>StatelessRules</code> object. To ensure unique priority settings for
  /// your rule groups, set unique priorities for the stateless rules that you
  /// define inside any single <code>StatelessRules</code> object.
  ///
  /// You can change the priority settings of your rules at any time. To make it
  /// easier to insert rules later, number them so there's a wide range in
  /// between, for example use 100, 200, and so on.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// Defines the stateless 5-tuple packet inspection criteria and the action to
  /// take on a packet that matches the criteria.
  @_s.JsonKey(name: 'RuleDefinition')
  final RuleDefinition ruleDefinition;

  StatelessRule({
    @_s.required this.priority,
    @_s.required this.ruleDefinition,
  });
  factory StatelessRule.fromJson(Map<String, dynamic> json) =>
      _$StatelessRuleFromJson(json);

  Map<String, dynamic> toJson() => _$StatelessRuleToJson(this);
}

/// Identifier for a single stateless rule group, used in a firewall policy to
/// refer to the rule group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StatelessRuleGroupReference {
  /// An integer setting that indicates the order in which to run the stateless
  /// rule groups in a single <a>FirewallPolicy</a>. Network Firewall applies each
  /// stateless rule group to a packet starting with the group that has the lowest
  /// priority setting. You must ensure that the priority settings are unique
  /// within each policy.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// The Amazon Resource Name (ARN) of the stateless rule group.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  StatelessRuleGroupReference({
    @_s.required this.priority,
    @_s.required this.resourceArn,
  });
  factory StatelessRuleGroupReference.fromJson(Map<String, dynamic> json) =>
      _$StatelessRuleGroupReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$StatelessRuleGroupReferenceToJson(this);
}

/// Stateless inspection criteria. Each stateless rule group uses exactly one of
/// these data types to define its stateless rules.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StatelessRulesAndCustomActions {
  /// Defines the set of stateless rules for use in a stateless rule group.
  @_s.JsonKey(name: 'StatelessRules')
  final List<StatelessRule> statelessRules;

  /// Defines an array of individual custom action definitions that are available
  /// for use by the stateless rules in this
  /// <code>StatelessRulesAndCustomActions</code> specification. You name each
  /// custom action that you define, and then you can use it by name in your
  /// <a>StatelessRule</a> <a>RuleDefinition</a> <code>Actions</code>
  /// specification.
  @_s.JsonKey(name: 'CustomActions')
  final List<CustomAction> customActions;

  StatelessRulesAndCustomActions({
    @_s.required this.statelessRules,
    this.customActions,
  });
  factory StatelessRulesAndCustomActions.fromJson(Map<String, dynamic> json) =>
      _$StatelessRulesAndCustomActionsFromJson(json);

  Map<String, dynamic> toJson() => _$StatelessRulesAndCustomActionsToJson(this);
}

/// The ID for a subnet that you want to associate with the firewall. This is
/// used with <a>CreateFirewall</a> and <a>AssociateSubnets</a>. AWS Network
/// Firewall creates an instance of the associated firewall in each subnet that
/// you specify, to filter traffic in the subnet's Availability Zone.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SubnetMapping {
  /// The unique identifier for the subnet.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  SubnetMapping({
    @_s.required this.subnetId,
  });
  factory SubnetMapping.fromJson(Map<String, dynamic> json) =>
      _$SubnetMappingFromJson(json);

  Map<String, dynamic> toJson() => _$SubnetMappingToJson(this);
}

/// The status of the firewall endpoint and firewall policy configuration for a
/// single VPC subnet.
///
/// For each VPC subnet that you associate with a firewall, AWS Network Firewall
/// does the following:
///
/// <ul>
/// <li>
/// Instantiates a firewall endpoint in the subnet, ready to take traffic.
/// </li>
/// <li>
/// Configures the endpoint with the current firewall policy settings, to
/// provide the filtering behavior for the endpoint.
/// </li>
/// </ul>
/// When you update a firewall, for example to add a subnet association or
/// change a rule group in the firewall policy, the affected sync states reflect
/// out-of-sync or not ready status until the changes are complete.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SyncState {
  /// The attachment status of the firewall's association with a single VPC
  /// subnet. For each configured subnet, Network Firewall creates the attachment
  /// by instantiating the firewall endpoint in the subnet so that it's ready to
  /// take traffic. This is part of the <a>FirewallStatus</a>.
  @_s.JsonKey(name: 'Attachment')
  final Attachment attachment;

  /// The configuration status of the firewall endpoint in a single VPC subnet.
  /// Network Firewall provides each endpoint with the rules that are configured
  /// in the firewall policy. Each time you add a subnet or modify the associated
  /// firewall policy, Network Firewall synchronizes the rules in the endpoint, so
  /// it can properly filter network traffic. This is part of the
  /// <a>FirewallStatus</a>.
  @_s.JsonKey(name: 'Config')
  final Map<String, PerObjectStatus> config;

  SyncState({
    this.attachment,
    this.config,
  });
  factory SyncState.fromJson(Map<String, dynamic> json) =>
      _$SyncStateFromJson(json);
}

enum TCPFlag {
  @_s.JsonValue('FIN')
  fin,
  @_s.JsonValue('SYN')
  syn,
  @_s.JsonValue('RST')
  rst,
  @_s.JsonValue('PSH')
  psh,
  @_s.JsonValue('ACK')
  ack,
  @_s.JsonValue('URG')
  urg,
  @_s.JsonValue('ECE')
  ece,
  @_s.JsonValue('CWR')
  cwr,
}

/// TCP flags and masks to inspect packets for, used in stateless rules
/// <a>MatchAttributes</a> settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TCPFlagField {
  /// Used in conjunction with the <code>Masks</code> setting to define the flags
  /// that must be set and flags that must not be set in order for the packet to
  /// match. This setting can only specify values that are also specified in the
  /// <code>Masks</code> setting.
  ///
  /// For the flags that are specified in the masks setting, the following must be
  /// true for the packet to match:
  ///
  /// <ul>
  /// <li>
  /// The ones that are set in this flags setting must be set in the packet.
  /// </li>
  /// <li>
  /// The ones that are not set in this flags setting must also not be set in the
  /// packet.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Flags')
  final List<TCPFlag> flags;

  /// The set of flags to consider in the inspection. To inspect all flags in the
  /// valid values list, leave this with no setting.
  @_s.JsonKey(name: 'Masks')
  final List<TCPFlag> masks;

  TCPFlagField({
    @_s.required this.flags,
    this.masks,
  });
  factory TCPFlagField.fromJson(Map<String, dynamic> json) =>
      _$TCPFlagFieldFromJson(json);

  Map<String, dynamic> toJson() => _$TCPFlagFieldToJson(this);
}

/// A key:value pair associated with an AWS resource. The key:value pair can be
/// anything you define. Typically, the tag key represents a category (such as
/// "environment") and the tag value represents a specific value within that
/// category (such as "test," "development," or "production"). You can add up to
/// 50 tags to each AWS resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The part of the key:value pair that defines a tag. You can use a tag key to
  /// describe a category of information, such as "customer." Tag keys are
  /// case-sensitive.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The part of the key:value pair that defines a tag. You can use a tag value
  /// to describe a specific value within a category, such as "companyA" or
  /// "companyB." Tag values are case-sensitive.
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

enum TargetType {
  @_s.JsonValue('TLS_SNI')
  tlsSni,
  @_s.JsonValue('HTTP_HOST')
  httpHost,
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
class UpdateFirewallDeleteProtectionResponse {
  /// <p/>
  @_s.JsonKey(name: 'DeleteProtection')
  final bool deleteProtection;

  /// The Amazon Resource Name (ARN) of the firewall.
  @_s.JsonKey(name: 'FirewallArn')
  final String firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  @_s.JsonKey(name: 'FirewallName')
  final String firewallName;

  /// An optional token that you can use for optimistic locking. Network Firewall
  /// returns a token to your requests that access the firewall. The token marks
  /// the state of the firewall resource at the time of the request.
  ///
  /// To make an unconditional change to the firewall, omit the token in your
  /// update request. Without the token, Network Firewall performs your updates
  /// regardless of whether the firewall has changed since you last retrieved it.
  ///
  /// To make a conditional change to the firewall, provide the token in your
  /// update request. Network Firewall uses the token to ensure that the firewall
  /// hasn't changed since you last retrieved it. If it has changed, the operation
  /// fails with an <code>InvalidTokenException</code>. If this happens, retrieve
  /// the firewall again to get a current copy of it with a new token. Reapply
  /// your changes as needed, then try the operation again using the new token.
  @_s.JsonKey(name: 'UpdateToken')
  final String updateToken;

  UpdateFirewallDeleteProtectionResponse({
    this.deleteProtection,
    this.firewallArn,
    this.firewallName,
    this.updateToken,
  });
  factory UpdateFirewallDeleteProtectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateFirewallDeleteProtectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFirewallDescriptionResponse {
  /// A description of the firewall.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The Amazon Resource Name (ARN) of the firewall.
  @_s.JsonKey(name: 'FirewallArn')
  final String firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  @_s.JsonKey(name: 'FirewallName')
  final String firewallName;

  /// An optional token that you can use for optimistic locking. Network Firewall
  /// returns a token to your requests that access the firewall. The token marks
  /// the state of the firewall resource at the time of the request.
  ///
  /// To make an unconditional change to the firewall, omit the token in your
  /// update request. Without the token, Network Firewall performs your updates
  /// regardless of whether the firewall has changed since you last retrieved it.
  ///
  /// To make a conditional change to the firewall, provide the token in your
  /// update request. Network Firewall uses the token to ensure that the firewall
  /// hasn't changed since you last retrieved it. If it has changed, the operation
  /// fails with an <code>InvalidTokenException</code>. If this happens, retrieve
  /// the firewall again to get a current copy of it with a new token. Reapply
  /// your changes as needed, then try the operation again using the new token.
  @_s.JsonKey(name: 'UpdateToken')
  final String updateToken;

  UpdateFirewallDescriptionResponse({
    this.description,
    this.firewallArn,
    this.firewallName,
    this.updateToken,
  });
  factory UpdateFirewallDescriptionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateFirewallDescriptionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFirewallPolicyChangeProtectionResponse {
  /// The Amazon Resource Name (ARN) of the firewall.
  @_s.JsonKey(name: 'FirewallArn')
  final String firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  @_s.JsonKey(name: 'FirewallName')
  final String firewallName;

  /// A setting indicating whether the firewall is protected against a change to
  /// the firewall policy association. Use this setting to protect against
  /// accidentally modifying the firewall policy for a firewall that is in use.
  /// When you create a firewall, the operation initializes this setting to
  /// <code>TRUE</code>.
  @_s.JsonKey(name: 'FirewallPolicyChangeProtection')
  final bool firewallPolicyChangeProtection;

  /// An optional token that you can use for optimistic locking. Network Firewall
  /// returns a token to your requests that access the firewall. The token marks
  /// the state of the firewall resource at the time of the request.
  ///
  /// To make an unconditional change to the firewall, omit the token in your
  /// update request. Without the token, Network Firewall performs your updates
  /// regardless of whether the firewall has changed since you last retrieved it.
  ///
  /// To make a conditional change to the firewall, provide the token in your
  /// update request. Network Firewall uses the token to ensure that the firewall
  /// hasn't changed since you last retrieved it. If it has changed, the operation
  /// fails with an <code>InvalidTokenException</code>. If this happens, retrieve
  /// the firewall again to get a current copy of it with a new token. Reapply
  /// your changes as needed, then try the operation again using the new token.
  @_s.JsonKey(name: 'UpdateToken')
  final String updateToken;

  UpdateFirewallPolicyChangeProtectionResponse({
    this.firewallArn,
    this.firewallName,
    this.firewallPolicyChangeProtection,
    this.updateToken,
  });
  factory UpdateFirewallPolicyChangeProtectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateFirewallPolicyChangeProtectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFirewallPolicyResponse {
  /// The high-level properties of a firewall policy. This, along with the
  /// <a>FirewallPolicy</a>, define the policy. You can retrieve all objects for a
  /// firewall policy by calling <a>DescribeFirewallPolicy</a>.
  @_s.JsonKey(name: 'FirewallPolicyResponse')
  final FirewallPolicyResponse firewallPolicyResponse;

  /// A token used for optimistic locking. Network Firewall returns a token to
  /// your requests that access the firewall policy. The token marks the state of
  /// the policy resource at the time of the request.
  ///
  /// To make changes to the policy, you provide the token in your request.
  /// Network Firewall uses the token to ensure that the policy hasn't changed
  /// since you last retrieved it. If it has changed, the operation fails with an
  /// <code>InvalidTokenException</code>. If this happens, retrieve the firewall
  /// policy again to get a current copy of it with current token. Reapply your
  /// changes as needed, then try the operation again using the new token.
  @_s.JsonKey(name: 'UpdateToken')
  final String updateToken;

  UpdateFirewallPolicyResponse({
    @_s.required this.firewallPolicyResponse,
    @_s.required this.updateToken,
  });
  factory UpdateFirewallPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFirewallPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateLoggingConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the firewall.
  @_s.JsonKey(name: 'FirewallArn')
  final String firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  @_s.JsonKey(name: 'FirewallName')
  final String firewallName;
  @_s.JsonKey(name: 'LoggingConfiguration')
  final LoggingConfiguration loggingConfiguration;

  UpdateLoggingConfigurationResponse({
    this.firewallArn,
    this.firewallName,
    this.loggingConfiguration,
  });
  factory UpdateLoggingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateLoggingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRuleGroupResponse {
  /// The high-level properties of a rule group. This, along with the
  /// <a>RuleGroup</a>, define the rule group. You can retrieve all objects for a
  /// rule group by calling <a>DescribeRuleGroup</a>.
  @_s.JsonKey(name: 'RuleGroupResponse')
  final RuleGroupResponse ruleGroupResponse;

  /// A token used for optimistic locking. Network Firewall returns a token to
  /// your requests that access the rule group. The token marks the state of the
  /// rule group resource at the time of the request.
  ///
  /// To make changes to the rule group, you provide the token in your request.
  /// Network Firewall uses the token to ensure that the rule group hasn't changed
  /// since you last retrieved it. If it has changed, the operation fails with an
  /// <code>InvalidTokenException</code>. If this happens, retrieve the rule group
  /// again to get a current copy of it with a current token. Reapply your changes
  /// as needed, then try the operation again using the new token.
  @_s.JsonKey(name: 'UpdateToken')
  final String updateToken;

  UpdateRuleGroupResponse({
    @_s.required this.ruleGroupResponse,
    @_s.required this.updateToken,
  });
  factory UpdateRuleGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRuleGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSubnetChangeProtectionResponse {
  /// The Amazon Resource Name (ARN) of the firewall.
  @_s.JsonKey(name: 'FirewallArn')
  final String firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  @_s.JsonKey(name: 'FirewallName')
  final String firewallName;

  /// A setting indicating whether the firewall is protected against changes to
  /// the subnet associations. Use this setting to protect against accidentally
  /// modifying the subnet associations for a firewall that is in use. When you
  /// create a firewall, the operation initializes this setting to
  /// <code>TRUE</code>.
  @_s.JsonKey(name: 'SubnetChangeProtection')
  final bool subnetChangeProtection;

  /// An optional token that you can use for optimistic locking. Network Firewall
  /// returns a token to your requests that access the firewall. The token marks
  /// the state of the firewall resource at the time of the request.
  ///
  /// To make an unconditional change to the firewall, omit the token in your
  /// update request. Without the token, Network Firewall performs your updates
  /// regardless of whether the firewall has changed since you last retrieved it.
  ///
  /// To make a conditional change to the firewall, provide the token in your
  /// update request. Network Firewall uses the token to ensure that the firewall
  /// hasn't changed since you last retrieved it. If it has changed, the operation
  /// fails with an <code>InvalidTokenException</code>. If this happens, retrieve
  /// the firewall again to get a current copy of it with a new token. Reapply
  /// your changes as needed, then try the operation again using the new token.
  @_s.JsonKey(name: 'UpdateToken')
  final String updateToken;

  UpdateSubnetChangeProtectionResponse({
    this.firewallArn,
    this.firewallName,
    this.subnetChangeProtection,
    this.updateToken,
  });
  factory UpdateSubnetChangeProtectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateSubnetChangeProtectionResponseFromJson(json);
}

class InsufficientCapacityException extends _s.GenericAwsException {
  InsufficientCapacityException({String type, String message})
      : super(
            type: type,
            code: 'InsufficientCapacityException',
            message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String type, String message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String type, String message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class InvalidResourcePolicyException extends _s.GenericAwsException {
  InvalidResourcePolicyException({String type, String message})
      : super(
            type: type,
            code: 'InvalidResourcePolicyException',
            message: message);
}

class InvalidTokenException extends _s.GenericAwsException {
  InvalidTokenException({String type, String message})
      : super(type: type, code: 'InvalidTokenException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class LogDestinationPermissionException extends _s.GenericAwsException {
  LogDestinationPermissionException({String type, String message})
      : super(
            type: type,
            code: 'LogDestinationPermissionException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceOwnerCheckException extends _s.GenericAwsException {
  ResourceOwnerCheckException({String type, String message})
      : super(
            type: type, code: 'ResourceOwnerCheckException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InsufficientCapacityException': (type, message) =>
      InsufficientCapacityException(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'InvalidOperationException': (type, message) =>
      InvalidOperationException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'InvalidResourcePolicyException': (type, message) =>
      InvalidResourcePolicyException(type: type, message: message),
  'InvalidTokenException': (type, message) =>
      InvalidTokenException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'LogDestinationPermissionException': (type, message) =>
      LogDestinationPermissionException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceOwnerCheckException': (type, message) =>
      ResourceOwnerCheckException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
};
