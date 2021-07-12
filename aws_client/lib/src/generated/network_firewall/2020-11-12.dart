// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
    required String firewallPolicyArn,
    String? firewallArn,
    String? firewallName,
    String? updateToken,
  }) async {
    ArgumentError.checkNotNull(firewallPolicyArn, 'firewallPolicyArn');
    _s.validateStringLength(
      'firewallPolicyArn',
      firewallPolicyArn,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
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
  /// May throw [InsufficientCapacityException].
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
    required List<SubnetMapping> subnetMappings,
    String? firewallArn,
    String? firewallName,
    String? updateToken,
  }) async {
    ArgumentError.checkNotNull(subnetMappings, 'subnetMappings');
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
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
    required String firewallName,
    required String firewallPolicyArn,
    required List<SubnetMapping> subnetMappings,
    required String vpcId,
    bool? deleteProtection,
    String? description,
    bool? firewallPolicyChangeProtection,
    bool? subnetChangeProtection,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(firewallName, 'firewallName');
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
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
    ArgumentError.checkNotNull(subnetMappings, 'subnetMappings');
    ArgumentError.checkNotNull(vpcId, 'vpcId');
    _s.validateStringLength(
      'vpcId',
      vpcId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
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
    required FirewallPolicy firewallPolicy,
    required String firewallPolicyName,
    String? description,
    bool? dryRun,
    List<Tag>? tags,
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
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
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
  /// A string containing stateful rule group rules specifications in Suricata
  /// flat format, with one rule per line. Use this to import your existing
  /// Suricata compatible rule groups.
  /// <note>
  /// You must provide either this rules setting or a populated
  /// <code>RuleGroup</code> setting, but not both.
  /// </note>
  /// You can provide your rule group specification in Suricata flat format
  /// through this setting when you create or update your rule group. The call
  /// response returns a <a>RuleGroup</a> object that Network Firewall has
  /// populated from your string.
  ///
  /// Parameter [tags] :
  /// The key:value pairs to associate with the resource.
  Future<CreateRuleGroupResponse> createRuleGroup({
    required int capacity,
    required String ruleGroupName,
    required RuleGroupType type,
    String? description,
    bool? dryRun,
    RuleGroup? ruleGroup,
    String? rules,
    List<Tag>? tags,
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
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
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
        'Type': type.toValue(),
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
    String? firewallArn,
    String? firewallName,
  }) async {
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
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
    String? firewallPolicyArn,
    String? firewallPolicyName,
  }) async {
    _s.validateStringLength(
      'firewallPolicyArn',
      firewallPolicyArn,
      1,
      256,
    );
    _s.validateStringLength(
      'firewallPolicyName',
      firewallPolicyName,
      1,
      128,
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
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the rule group or firewall policy whose
  /// resource policy you want to delete.
  Future<void> deleteResourcePolicy({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.DeleteResourcePolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );
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
    String? ruleGroupArn,
    String? ruleGroupName,
    RuleGroupType? type,
  }) async {
    _s.validateStringLength(
      'ruleGroupArn',
      ruleGroupArn,
      1,
      256,
    );
    _s.validateStringLength(
      'ruleGroupName',
      ruleGroupName,
      1,
      128,
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
    String? firewallArn,
    String? firewallName,
  }) async {
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
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
    String? firewallPolicyArn,
    String? firewallPolicyName,
  }) async {
    _s.validateStringLength(
      'firewallPolicyArn',
      firewallPolicyArn,
      1,
      256,
    );
    _s.validateStringLength(
      'firewallPolicyName',
      firewallPolicyName,
      1,
      128,
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
    String? firewallArn,
    String? firewallName,
  }) async {
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
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
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the rule group or firewall policy whose
  /// resource policy you want to retrieve.
  Future<DescribeResourcePolicyResponse> describeResourcePolicy({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      256,
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
    String? ruleGroupArn,
    String? ruleGroupName,
    RuleGroupType? type,
  }) async {
    _s.validateStringLength(
      'ruleGroupArn',
      ruleGroupArn,
      1,
      256,
    );
    _s.validateStringLength(
      'ruleGroupName',
      ruleGroupName,
      1,
      128,
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
    required List<String> subnetIds,
    String? firewallArn,
    String? firewallName,
    String? updateToken,
  }) async {
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
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
    int? maxResults,
    String? nextToken,
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
    int? maxResults,
    String? nextToken,
    List<String>? vpcIds,
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
    int? maxResults,
    String? nextToken,
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
  /// May throw [InvalidRequestException].
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
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      256,
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
    required String policy,
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(policy, 'policy');
    _s.validateStringLength(
      'policy',
      policy,
      1,
      395000,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.PutResourcePolicy'
    };
    await _protocol.send(
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
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.TagResource'
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.UntagResource'
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
    required bool deleteProtection,
    String? firewallArn,
    String? firewallName,
    String? updateToken,
  }) async {
    ArgumentError.checkNotNull(deleteProtection, 'deleteProtection');
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
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
    String? description,
    String? firewallArn,
    String? firewallName,
    String? updateToken,
  }) async {
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
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
    required FirewallPolicy firewallPolicy,
    required String updateToken,
    String? description,
    bool? dryRun,
    String? firewallPolicyArn,
    String? firewallPolicyName,
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
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
    _s.validateStringLength(
      'firewallPolicyArn',
      firewallPolicyArn,
      1,
      256,
    );
    _s.validateStringLength(
      'firewallPolicyName',
      firewallPolicyName,
      1,
      128,
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
    required bool firewallPolicyChangeProtection,
    String? firewallArn,
    String? firewallName,
    String? updateToken,
  }) async {
    ArgumentError.checkNotNull(
        firewallPolicyChangeProtection, 'firewallPolicyChangeProtection');
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
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
    String? firewallArn,
    String? firewallName,
    LoggingConfiguration? loggingConfiguration,
  }) async {
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
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
  /// A string containing stateful rule group rules specifications in Suricata
  /// flat format, with one rule per line. Use this to import your existing
  /// Suricata compatible rule groups.
  /// <note>
  /// You must provide either this rules setting or a populated
  /// <code>RuleGroup</code> setting, but not both.
  /// </note>
  /// You can provide your rule group specification in Suricata flat format
  /// through this setting when you create or update your rule group. The call
  /// response returns a <a>RuleGroup</a> object that Network Firewall has
  /// populated from your string.
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
    required String updateToken,
    String? description,
    bool? dryRun,
    RuleGroup? ruleGroup,
    String? ruleGroupArn,
    String? ruleGroupName,
    String? rules,
    RuleGroupType? type,
  }) async {
    ArgumentError.checkNotNull(updateToken, 'updateToken');
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
    _s.validateStringLength(
      'ruleGroupArn',
      ruleGroupArn,
      1,
      256,
    );
    _s.validateStringLength(
      'ruleGroupName',
      ruleGroupName,
      1,
      128,
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
    required bool subnetChangeProtection,
    String? firewallArn,
    String? firewallName,
    String? updateToken,
  }) async {
    ArgumentError.checkNotNull(
        subnetChangeProtection, 'subnetChangeProtection');
    _s.validateStringLength(
      'firewallArn',
      firewallArn,
      1,
      256,
    );
    _s.validateStringLength(
      'firewallName',
      firewallName,
      1,
      128,
    );
    _s.validateStringLength(
      'updateToken',
      updateToken,
      1,
      1024,
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
  final PublishMetricAction? publishMetricAction;

  ActionDefinition({
    this.publishMetricAction,
  });

  factory ActionDefinition.fromJson(Map<String, dynamic> json) {
    return ActionDefinition(
      publishMetricAction: json['PublishMetricAction'] != null
          ? PublishMetricAction.fromJson(
              json['PublishMetricAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final publishMetricAction = this.publishMetricAction;
    return {
      if (publishMetricAction != null)
        'PublishMetricAction': publishMetricAction,
    };
  }
}

/// A single IP address specification. This is used in the
/// <a>MatchAttributes</a> source and destination specifications.
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
  final String addressDefinition;

  Address({
    required this.addressDefinition,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressDefinition: json['AddressDefinition'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final addressDefinition = this.addressDefinition;
    return {
      'AddressDefinition': addressDefinition,
    };
  }
}

class AssociateFirewallPolicyResponse {
  /// The Amazon Resource Name (ARN) of the firewall.
  final String? firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  final String? firewallName;

  /// The Amazon Resource Name (ARN) of the firewall policy.
  final String? firewallPolicyArn;

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
  final String? updateToken;

  AssociateFirewallPolicyResponse({
    this.firewallArn,
    this.firewallName,
    this.firewallPolicyArn,
    this.updateToken,
  });

  factory AssociateFirewallPolicyResponse.fromJson(Map<String, dynamic> json) {
    return AssociateFirewallPolicyResponse(
      firewallArn: json['FirewallArn'] as String?,
      firewallName: json['FirewallName'] as String?,
      firewallPolicyArn: json['FirewallPolicyArn'] as String?,
      updateToken: json['UpdateToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallArn = this.firewallArn;
    final firewallName = this.firewallName;
    final firewallPolicyArn = this.firewallPolicyArn;
    final updateToken = this.updateToken;
    return {
      if (firewallArn != null) 'FirewallArn': firewallArn,
      if (firewallName != null) 'FirewallName': firewallName,
      if (firewallPolicyArn != null) 'FirewallPolicyArn': firewallPolicyArn,
      if (updateToken != null) 'UpdateToken': updateToken,
    };
  }
}

class AssociateSubnetsResponse {
  /// The Amazon Resource Name (ARN) of the firewall.
  final String? firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  final String? firewallName;

  /// The IDs of the subnets that are associated with the firewall.
  final List<SubnetMapping>? subnetMappings;

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
  final String? updateToken;

  AssociateSubnetsResponse({
    this.firewallArn,
    this.firewallName,
    this.subnetMappings,
    this.updateToken,
  });

  factory AssociateSubnetsResponse.fromJson(Map<String, dynamic> json) {
    return AssociateSubnetsResponse(
      firewallArn: json['FirewallArn'] as String?,
      firewallName: json['FirewallName'] as String?,
      subnetMappings: (json['SubnetMappings'] as List?)
          ?.whereNotNull()
          .map((e) => SubnetMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      updateToken: json['UpdateToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallArn = this.firewallArn;
    final firewallName = this.firewallName;
    final subnetMappings = this.subnetMappings;
    final updateToken = this.updateToken;
    return {
      if (firewallArn != null) 'FirewallArn': firewallArn,
      if (firewallName != null) 'FirewallName': firewallName,
      if (subnetMappings != null) 'SubnetMappings': subnetMappings,
      if (updateToken != null) 'UpdateToken': updateToken,
    };
  }
}

/// The configuration and status for a single subnet that you've specified for
/// use by the AWS Network Firewall firewall. This is part of the
/// <a>FirewallStatus</a>.
class Attachment {
  /// The identifier of the firewall endpoint that Network Firewall has
  /// instantiated in the subnet. You use this to identify the firewall endpoint
  /// in the VPC route tables, when you redirect the VPC traffic through the
  /// endpoint.
  final String? endpointId;

  /// The current status of the firewall endpoint in the subnet. This value
  /// reflects both the instantiation of the endpoint in the VPC subnet and the
  /// sync states that are reported in the <code>Config</code> settings. When this
  /// value is <code>READY</code>, the endpoint is available and configured
  /// properly to handle network traffic. When the endpoint isn't available for
  /// traffic, this value will reflect its state, for example
  /// <code>CREATING</code>, <code>DELETING</code>, or <code>FAILED</code>.
  final AttachmentStatus? status;

  /// The unique identifier of the subnet that you've specified to be used for a
  /// firewall endpoint.
  final String? subnetId;

  Attachment({
    this.endpointId,
    this.status,
    this.subnetId,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      endpointId: json['EndpointId'] as String?,
      status: (json['Status'] as String?)?.toAttachmentStatus(),
      subnetId: json['SubnetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpointId = this.endpointId;
    final status = this.status;
    final subnetId = this.subnetId;
    return {
      if (endpointId != null) 'EndpointId': endpointId,
      if (status != null) 'Status': status.toValue(),
      if (subnetId != null) 'SubnetId': subnetId,
    };
  }
}

enum AttachmentStatus {
  creating,
  deleting,
  scaling,
  ready,
}

extension on AttachmentStatus {
  String toValue() {
    switch (this) {
      case AttachmentStatus.creating:
        return 'CREATING';
      case AttachmentStatus.deleting:
        return 'DELETING';
      case AttachmentStatus.scaling:
        return 'SCALING';
      case AttachmentStatus.ready:
        return 'READY';
    }
  }
}

extension on String {
  AttachmentStatus toAttachmentStatus() {
    switch (this) {
      case 'CREATING':
        return AttachmentStatus.creating;
      case 'DELETING':
        return AttachmentStatus.deleting;
      case 'SCALING':
        return AttachmentStatus.scaling;
      case 'READY':
        return AttachmentStatus.ready;
    }
    throw Exception('$this is not known in enum AttachmentStatus');
  }
}

enum ConfigurationSyncState {
  pending,
  inSync,
}

extension on ConfigurationSyncState {
  String toValue() {
    switch (this) {
      case ConfigurationSyncState.pending:
        return 'PENDING';
      case ConfigurationSyncState.inSync:
        return 'IN_SYNC';
    }
  }
}

extension on String {
  ConfigurationSyncState toConfigurationSyncState() {
    switch (this) {
      case 'PENDING':
        return ConfigurationSyncState.pending;
      case 'IN_SYNC':
        return ConfigurationSyncState.inSync;
    }
    throw Exception('$this is not known in enum ConfigurationSyncState');
  }
}

class CreateFirewallPolicyResponse {
  /// The high-level properties of a firewall policy. This, along with the
  /// <a>FirewallPolicy</a>, define the policy. You can retrieve all objects for a
  /// firewall policy by calling <a>DescribeFirewallPolicy</a>.
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
  final String updateToken;

  CreateFirewallPolicyResponse({
    required this.firewallPolicyResponse,
    required this.updateToken,
  });

  factory CreateFirewallPolicyResponse.fromJson(Map<String, dynamic> json) {
    return CreateFirewallPolicyResponse(
      firewallPolicyResponse: FirewallPolicyResponse.fromJson(
          json['FirewallPolicyResponse'] as Map<String, dynamic>),
      updateToken: json['UpdateToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallPolicyResponse = this.firewallPolicyResponse;
    final updateToken = this.updateToken;
    return {
      'FirewallPolicyResponse': firewallPolicyResponse,
      'UpdateToken': updateToken,
    };
  }
}

class CreateFirewallResponse {
  /// The configuration settings for the firewall. These settings include the
  /// firewall policy and the subnets in your VPC to use for the firewall
  /// endpoints.
  final Firewall? firewall;

  /// Detailed information about the current status of a <a>Firewall</a>. You can
  /// retrieve this for a firewall by calling <a>DescribeFirewall</a> and
  /// providing the firewall name and ARN.
  final FirewallStatus? firewallStatus;

  CreateFirewallResponse({
    this.firewall,
    this.firewallStatus,
  });

  factory CreateFirewallResponse.fromJson(Map<String, dynamic> json) {
    return CreateFirewallResponse(
      firewall: json['Firewall'] != null
          ? Firewall.fromJson(json['Firewall'] as Map<String, dynamic>)
          : null,
      firewallStatus: json['FirewallStatus'] != null
          ? FirewallStatus.fromJson(
              json['FirewallStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewall = this.firewall;
    final firewallStatus = this.firewallStatus;
    return {
      if (firewall != null) 'Firewall': firewall,
      if (firewallStatus != null) 'FirewallStatus': firewallStatus,
    };
  }
}

class CreateRuleGroupResponse {
  /// The high-level properties of a rule group. This, along with the
  /// <a>RuleGroup</a>, define the rule group. You can retrieve all objects for a
  /// rule group by calling <a>DescribeRuleGroup</a>.
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
  final String updateToken;

  CreateRuleGroupResponse({
    required this.ruleGroupResponse,
    required this.updateToken,
  });

  factory CreateRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateRuleGroupResponse(
      ruleGroupResponse: RuleGroupResponse.fromJson(
          json['RuleGroupResponse'] as Map<String, dynamic>),
      updateToken: json['UpdateToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleGroupResponse = this.ruleGroupResponse;
    final updateToken = this.updateToken;
    return {
      'RuleGroupResponse': ruleGroupResponse,
      'UpdateToken': updateToken,
    };
  }
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
class CustomAction {
  /// The custom action associated with the action name.
  final ActionDefinition actionDefinition;

  /// The descriptive name of the custom action. You can't change the name of a
  /// custom action after you create it.
  final String actionName;

  CustomAction({
    required this.actionDefinition,
    required this.actionName,
  });

  factory CustomAction.fromJson(Map<String, dynamic> json) {
    return CustomAction(
      actionDefinition: ActionDefinition.fromJson(
          json['ActionDefinition'] as Map<String, dynamic>),
      actionName: json['ActionName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final actionDefinition = this.actionDefinition;
    final actionName = this.actionName;
    return {
      'ActionDefinition': actionDefinition,
      'ActionName': actionName,
    };
  }
}

class DeleteFirewallPolicyResponse {
  /// The object containing the definition of the <a>FirewallPolicyResponse</a>
  /// that you asked to delete.
  final FirewallPolicyResponse firewallPolicyResponse;

  DeleteFirewallPolicyResponse({
    required this.firewallPolicyResponse,
  });

  factory DeleteFirewallPolicyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFirewallPolicyResponse(
      firewallPolicyResponse: FirewallPolicyResponse.fromJson(
          json['FirewallPolicyResponse'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final firewallPolicyResponse = this.firewallPolicyResponse;
    return {
      'FirewallPolicyResponse': firewallPolicyResponse,
    };
  }
}

class DeleteFirewallResponse {
  final Firewall? firewall;
  final FirewallStatus? firewallStatus;

  DeleteFirewallResponse({
    this.firewall,
    this.firewallStatus,
  });

  factory DeleteFirewallResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFirewallResponse(
      firewall: json['Firewall'] != null
          ? Firewall.fromJson(json['Firewall'] as Map<String, dynamic>)
          : null,
      firewallStatus: json['FirewallStatus'] != null
          ? FirewallStatus.fromJson(
              json['FirewallStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewall = this.firewall;
    final firewallStatus = this.firewallStatus;
    return {
      if (firewall != null) 'Firewall': firewall,
      if (firewallStatus != null) 'FirewallStatus': firewallStatus,
    };
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

class DeleteRuleGroupResponse {
  /// The high-level properties of a rule group. This, along with the
  /// <a>RuleGroup</a>, define the rule group. You can retrieve all objects for a
  /// rule group by calling <a>DescribeRuleGroup</a>.
  final RuleGroupResponse ruleGroupResponse;

  DeleteRuleGroupResponse({
    required this.ruleGroupResponse,
  });

  factory DeleteRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRuleGroupResponse(
      ruleGroupResponse: RuleGroupResponse.fromJson(
          json['RuleGroupResponse'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final ruleGroupResponse = this.ruleGroupResponse;
    return {
      'RuleGroupResponse': ruleGroupResponse,
    };
  }
}

class DescribeFirewallPolicyResponse {
  /// The high-level properties of a firewall policy. This, along with the
  /// <a>FirewallPolicy</a>, define the policy. You can retrieve all objects for a
  /// firewall policy by calling <a>DescribeFirewallPolicy</a>.
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
  final String updateToken;

  /// The policy for the specified firewall policy.
  final FirewallPolicy? firewallPolicy;

  DescribeFirewallPolicyResponse({
    required this.firewallPolicyResponse,
    required this.updateToken,
    this.firewallPolicy,
  });

  factory DescribeFirewallPolicyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFirewallPolicyResponse(
      firewallPolicyResponse: FirewallPolicyResponse.fromJson(
          json['FirewallPolicyResponse'] as Map<String, dynamic>),
      updateToken: json['UpdateToken'] as String,
      firewallPolicy: json['FirewallPolicy'] != null
          ? FirewallPolicy.fromJson(
              json['FirewallPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallPolicyResponse = this.firewallPolicyResponse;
    final updateToken = this.updateToken;
    final firewallPolicy = this.firewallPolicy;
    return {
      'FirewallPolicyResponse': firewallPolicyResponse,
      'UpdateToken': updateToken,
      if (firewallPolicy != null) 'FirewallPolicy': firewallPolicy,
    };
  }
}

class DescribeFirewallResponse {
  /// The configuration settings for the firewall. These settings include the
  /// firewall policy and the subnets in your VPC to use for the firewall
  /// endpoints.
  final Firewall? firewall;

  /// Detailed information about the current status of a <a>Firewall</a>. You can
  /// retrieve this for a firewall by calling <a>DescribeFirewall</a> and
  /// providing the firewall name and ARN.
  final FirewallStatus? firewallStatus;

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
  final String? updateToken;

  DescribeFirewallResponse({
    this.firewall,
    this.firewallStatus,
    this.updateToken,
  });

  factory DescribeFirewallResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFirewallResponse(
      firewall: json['Firewall'] != null
          ? Firewall.fromJson(json['Firewall'] as Map<String, dynamic>)
          : null,
      firewallStatus: json['FirewallStatus'] != null
          ? FirewallStatus.fromJson(
              json['FirewallStatus'] as Map<String, dynamic>)
          : null,
      updateToken: json['UpdateToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewall = this.firewall;
    final firewallStatus = this.firewallStatus;
    final updateToken = this.updateToken;
    return {
      if (firewall != null) 'Firewall': firewall,
      if (firewallStatus != null) 'FirewallStatus': firewallStatus,
      if (updateToken != null) 'UpdateToken': updateToken,
    };
  }
}

class DescribeLoggingConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the firewall.
  final String? firewallArn;
  final LoggingConfiguration? loggingConfiguration;

  DescribeLoggingConfigurationResponse({
    this.firewallArn,
    this.loggingConfiguration,
  });

  factory DescribeLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeLoggingConfigurationResponse(
      firewallArn: json['FirewallArn'] as String?,
      loggingConfiguration: json['LoggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['LoggingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallArn = this.firewallArn;
    final loggingConfiguration = this.loggingConfiguration;
    return {
      if (firewallArn != null) 'FirewallArn': firewallArn,
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
    };
  }
}

class DescribeResourcePolicyResponse {
  /// The AWS Identity and Access Management policy for the resource.
  final String? policy;

  DescribeResourcePolicyResponse({
    this.policy,
  });

  factory DescribeResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeResourcePolicyResponse(
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

class DescribeRuleGroupResponse {
  /// The high-level properties of a rule group. This, along with the
  /// <a>RuleGroup</a>, define the rule group. You can retrieve all objects for a
  /// rule group by calling <a>DescribeRuleGroup</a>.
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
  final RuleGroup? ruleGroup;

  DescribeRuleGroupResponse({
    required this.ruleGroupResponse,
    required this.updateToken,
    this.ruleGroup,
  });

  factory DescribeRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRuleGroupResponse(
      ruleGroupResponse: RuleGroupResponse.fromJson(
          json['RuleGroupResponse'] as Map<String, dynamic>),
      updateToken: json['UpdateToken'] as String,
      ruleGroup: json['RuleGroup'] != null
          ? RuleGroup.fromJson(json['RuleGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleGroupResponse = this.ruleGroupResponse;
    final updateToken = this.updateToken;
    final ruleGroup = this.ruleGroup;
    return {
      'RuleGroupResponse': ruleGroupResponse,
      'UpdateToken': updateToken,
      if (ruleGroup != null) 'RuleGroup': ruleGroup,
    };
  }
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
class Dimension {
  /// The value to use in the custom metric dimension.
  final String value;

  Dimension({
    required this.value,
  });

  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'Value': value,
    };
  }
}

class DisassociateSubnetsResponse {
  /// The Amazon Resource Name (ARN) of the firewall.
  final String? firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  final String? firewallName;

  /// The IDs of the subnets that are associated with the firewall.
  final List<SubnetMapping>? subnetMappings;

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
  final String? updateToken;

  DisassociateSubnetsResponse({
    this.firewallArn,
    this.firewallName,
    this.subnetMappings,
    this.updateToken,
  });

  factory DisassociateSubnetsResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateSubnetsResponse(
      firewallArn: json['FirewallArn'] as String?,
      firewallName: json['FirewallName'] as String?,
      subnetMappings: (json['SubnetMappings'] as List?)
          ?.whereNotNull()
          .map((e) => SubnetMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      updateToken: json['UpdateToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallArn = this.firewallArn;
    final firewallName = this.firewallName;
    final subnetMappings = this.subnetMappings;
    final updateToken = this.updateToken;
    return {
      if (firewallArn != null) 'FirewallArn': firewallArn,
      if (firewallName != null) 'FirewallName': firewallName,
      if (subnetMappings != null) 'SubnetMappings': subnetMappings,
      if (updateToken != null) 'UpdateToken': updateToken,
    };
  }
}

/// The firewall defines the configuration settings for an AWS Network Firewall
/// firewall. These settings include the firewall policy, the subnets in your
/// VPC to use for the firewall endpoints, and any tags that are attached to the
/// firewall AWS resource.
///
/// The status of the firewall, for example whether it's ready to filter network
/// traffic, is provided in the corresponding <a>FirewallStatus</a>. You can
/// retrieve both objects by calling <a>DescribeFirewall</a>.
class Firewall {
  /// The unique identifier for the firewall.
  final String firewallId;

  /// The Amazon Resource Name (ARN) of the firewall policy.
  ///
  /// The relationship of firewall to firewall policy is many to one. Each
  /// firewall requires one firewall policy association, and you can use the same
  /// firewall policy for multiple firewalls.
  final String firewallPolicyArn;

  /// The public subnets that Network Firewall is using for the firewall. Each
  /// subnet must belong to a different Availability Zone.
  final List<SubnetMapping> subnetMappings;

  /// The unique identifier of the VPC where the firewall is in use.
  final String vpcId;

  /// A flag indicating whether it is possible to delete the firewall. A setting
  /// of <code>TRUE</code> indicates that the firewall is protected against
  /// deletion. Use this setting to protect against accidentally deleting a
  /// firewall that is in use. When you create a firewall, the operation
  /// initializes this flag to <code>TRUE</code>.
  final bool? deleteProtection;

  /// A description of the firewall.
  final String? description;

  /// The Amazon Resource Name (ARN) of the firewall.
  final String? firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  final String? firewallName;

  /// A setting indicating whether the firewall is protected against a change to
  /// the firewall policy association. Use this setting to protect against
  /// accidentally modifying the firewall policy for a firewall that is in use.
  /// When you create a firewall, the operation initializes this setting to
  /// <code>TRUE</code>.
  final bool? firewallPolicyChangeProtection;

  /// A setting indicating whether the firewall is protected against changes to
  /// the subnet associations. Use this setting to protect against accidentally
  /// modifying the subnet associations for a firewall that is in use. When you
  /// create a firewall, the operation initializes this setting to
  /// <code>TRUE</code>.
  final bool? subnetChangeProtection;

  /// <p/>
  final List<Tag>? tags;

  Firewall({
    required this.firewallId,
    required this.firewallPolicyArn,
    required this.subnetMappings,
    required this.vpcId,
    this.deleteProtection,
    this.description,
    this.firewallArn,
    this.firewallName,
    this.firewallPolicyChangeProtection,
    this.subnetChangeProtection,
    this.tags,
  });

  factory Firewall.fromJson(Map<String, dynamic> json) {
    return Firewall(
      firewallId: json['FirewallId'] as String,
      firewallPolicyArn: json['FirewallPolicyArn'] as String,
      subnetMappings: (json['SubnetMappings'] as List)
          .whereNotNull()
          .map((e) => SubnetMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcId: json['VpcId'] as String,
      deleteProtection: json['DeleteProtection'] as bool?,
      description: json['Description'] as String?,
      firewallArn: json['FirewallArn'] as String?,
      firewallName: json['FirewallName'] as String?,
      firewallPolicyChangeProtection:
          json['FirewallPolicyChangeProtection'] as bool?,
      subnetChangeProtection: json['SubnetChangeProtection'] as bool?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final firewallId = this.firewallId;
    final firewallPolicyArn = this.firewallPolicyArn;
    final subnetMappings = this.subnetMappings;
    final vpcId = this.vpcId;
    final deleteProtection = this.deleteProtection;
    final description = this.description;
    final firewallArn = this.firewallArn;
    final firewallName = this.firewallName;
    final firewallPolicyChangeProtection = this.firewallPolicyChangeProtection;
    final subnetChangeProtection = this.subnetChangeProtection;
    final tags = this.tags;
    return {
      'FirewallId': firewallId,
      'FirewallPolicyArn': firewallPolicyArn,
      'SubnetMappings': subnetMappings,
      'VpcId': vpcId,
      if (deleteProtection != null) 'DeleteProtection': deleteProtection,
      if (description != null) 'Description': description,
      if (firewallArn != null) 'FirewallArn': firewallArn,
      if (firewallName != null) 'FirewallName': firewallName,
      if (firewallPolicyChangeProtection != null)
        'FirewallPolicyChangeProtection': firewallPolicyChangeProtection,
      if (subnetChangeProtection != null)
        'SubnetChangeProtection': subnetChangeProtection,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// High-level information about a firewall, returned by operations like create
/// and describe. You can use the information provided in the metadata to
/// retrieve and manage a firewall.
class FirewallMetadata {
  /// The Amazon Resource Name (ARN) of the firewall.
  final String? firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  final String? firewallName;

  FirewallMetadata({
    this.firewallArn,
    this.firewallName,
  });

  factory FirewallMetadata.fromJson(Map<String, dynamic> json) {
    return FirewallMetadata(
      firewallArn: json['FirewallArn'] as String?,
      firewallName: json['FirewallName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallArn = this.firewallArn;
    final firewallName = this.firewallName;
    return {
      if (firewallArn != null) 'FirewallArn': firewallArn,
      if (firewallName != null) 'FirewallName': firewallName,
    };
  }
}

/// The firewall policy defines the behavior of a firewall using a collection of
/// stateless and stateful rule groups and other settings. You can use one
/// firewall policy for multiple firewalls.
///
/// This, along with <a>FirewallPolicyResponse</a>, define the policy. You can
/// retrieve all objects for a firewall policy by calling
/// <a>DescribeFirewallPolicy</a>.
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
  final List<String> statelessDefaultActions;

  /// The actions to take on a fragmented UDP packet if it doesn't match any of
  /// the stateless rules in the policy. Network Firewall only manages UDP packet
  /// fragments and silently drops packet fragments for other protocols. If you
  /// want non-matching fragmented UDP packets to be forwarded for stateful
  /// inspection, specify <code>aws:forward_to_sfe</code>.
  ///
  /// You must specify one of the standard actions: <code>aws:pass</code>,
  /// <code>aws:drop</code>, or <code>aws:forward_to_sfe</code>. In addition, you
  /// can specify custom actions that are compatible with your standard section
  /// choice.
  ///
  /// For example, you could specify <code>["aws:pass"]</code> or you could
  /// specify <code>["aws:pass", “customActionName”]</code>. For information about
  /// compatibility, see the custom action descriptions under <a>CustomAction</a>.
  final List<String> statelessFragmentDefaultActions;

  /// References to the stateless rule groups that are used in the policy. These
  /// define the inspection criteria in stateful rules.
  final List<StatefulRuleGroupReference>? statefulRuleGroupReferences;

  /// The custom action definitions that are available for use in the firewall
  /// policy's <code>StatelessDefaultActions</code> setting. You name each custom
  /// action that you define, and then you can use it by name in your default
  /// actions specifications.
  final List<CustomAction>? statelessCustomActions;

  /// References to the stateless rule groups that are used in the policy. These
  /// define the matching criteria in stateless rules.
  final List<StatelessRuleGroupReference>? statelessRuleGroupReferences;

  FirewallPolicy({
    required this.statelessDefaultActions,
    required this.statelessFragmentDefaultActions,
    this.statefulRuleGroupReferences,
    this.statelessCustomActions,
    this.statelessRuleGroupReferences,
  });

  factory FirewallPolicy.fromJson(Map<String, dynamic> json) {
    return FirewallPolicy(
      statelessDefaultActions: (json['StatelessDefaultActions'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      statelessFragmentDefaultActions:
          (json['StatelessFragmentDefaultActions'] as List)
              .whereNotNull()
              .map((e) => e as String)
              .toList(),
      statefulRuleGroupReferences: (json['StatefulRuleGroupReferences']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              StatefulRuleGroupReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      statelessCustomActions: (json['StatelessCustomActions'] as List?)
          ?.whereNotNull()
          .map((e) => CustomAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      statelessRuleGroupReferences: (json['StatelessRuleGroupReferences']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              StatelessRuleGroupReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statelessDefaultActions = this.statelessDefaultActions;
    final statelessFragmentDefaultActions =
        this.statelessFragmentDefaultActions;
    final statefulRuleGroupReferences = this.statefulRuleGroupReferences;
    final statelessCustomActions = this.statelessCustomActions;
    final statelessRuleGroupReferences = this.statelessRuleGroupReferences;
    return {
      'StatelessDefaultActions': statelessDefaultActions,
      'StatelessFragmentDefaultActions': statelessFragmentDefaultActions,
      if (statefulRuleGroupReferences != null)
        'StatefulRuleGroupReferences': statefulRuleGroupReferences,
      if (statelessCustomActions != null)
        'StatelessCustomActions': statelessCustomActions,
      if (statelessRuleGroupReferences != null)
        'StatelessRuleGroupReferences': statelessRuleGroupReferences,
    };
  }
}

/// High-level information about a firewall policy, returned by operations like
/// create and describe. You can use the information provided in the metadata to
/// retrieve and manage a firewall policy. You can retrieve all objects for a
/// firewall policy by calling <a>DescribeFirewallPolicy</a>.
class FirewallPolicyMetadata {
  /// The Amazon Resource Name (ARN) of the firewall policy.
  final String? arn;

  /// The descriptive name of the firewall policy. You can't change the name of a
  /// firewall policy after you create it.
  final String? name;

  FirewallPolicyMetadata({
    this.arn,
    this.name,
  });

  factory FirewallPolicyMetadata.fromJson(Map<String, dynamic> json) {
    return FirewallPolicyMetadata(
      arn: json['Arn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (name != null) 'Name': name,
    };
  }
}

/// The high-level properties of a firewall policy. This, along with the
/// <a>FirewallPolicy</a>, define the policy. You can retrieve all objects for a
/// firewall policy by calling <a>DescribeFirewallPolicy</a>.
class FirewallPolicyResponse {
  /// The Amazon Resource Name (ARN) of the firewall policy.
  /// <note>
  /// If this response is for a create request that had <code>DryRun</code> set to
  /// <code>TRUE</code>, then this ARN is a placeholder that isn't attached to a
  /// valid resource.
  /// </note>
  final String firewallPolicyArn;

  /// The unique identifier for the firewall policy.
  final String firewallPolicyId;

  /// The descriptive name of the firewall policy. You can't change the name of a
  /// firewall policy after you create it.
  final String firewallPolicyName;

  /// A description of the firewall policy.
  final String? description;

  /// The current status of the firewall policy. You can retrieve this for a
  /// firewall policy by calling <a>DescribeFirewallPolicy</a> and providing the
  /// firewall policy's name or ARN.
  final ResourceStatus? firewallPolicyStatus;

  /// The key:value pairs to associate with the resource.
  final List<Tag>? tags;

  FirewallPolicyResponse({
    required this.firewallPolicyArn,
    required this.firewallPolicyId,
    required this.firewallPolicyName,
    this.description,
    this.firewallPolicyStatus,
    this.tags,
  });

  factory FirewallPolicyResponse.fromJson(Map<String, dynamic> json) {
    return FirewallPolicyResponse(
      firewallPolicyArn: json['FirewallPolicyArn'] as String,
      firewallPolicyId: json['FirewallPolicyId'] as String,
      firewallPolicyName: json['FirewallPolicyName'] as String,
      description: json['Description'] as String?,
      firewallPolicyStatus:
          (json['FirewallPolicyStatus'] as String?)?.toResourceStatus(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final firewallPolicyArn = this.firewallPolicyArn;
    final firewallPolicyId = this.firewallPolicyId;
    final firewallPolicyName = this.firewallPolicyName;
    final description = this.description;
    final firewallPolicyStatus = this.firewallPolicyStatus;
    final tags = this.tags;
    return {
      'FirewallPolicyArn': firewallPolicyArn,
      'FirewallPolicyId': firewallPolicyId,
      'FirewallPolicyName': firewallPolicyName,
      if (description != null) 'Description': description,
      if (firewallPolicyStatus != null)
        'FirewallPolicyStatus': firewallPolicyStatus.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Detailed information about the current status of a <a>Firewall</a>. You can
/// retrieve this for a firewall by calling <a>DescribeFirewall</a> and
/// providing the firewall name and ARN.
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
  final ConfigurationSyncState configurationSyncStateSummary;

  /// The readiness of the configured firewall to handle network traffic across
  /// all of the Availability Zones where you've configured it. This setting is
  /// <code>READY</code> only when the <code>ConfigurationSyncStateSummary</code>
  /// value is <code>IN_SYNC</code> and the <code>Attachment</code>
  /// <code>Status</code> values for all of the configured subnets are
  /// <code>READY</code>.
  final FirewallStatusValue status;

  /// The subnets that you've configured for use by the Network Firewall firewall.
  /// This contains one array element per Availability Zone where you've
  /// configured a subnet. These objects provide details of the information that
  /// is summarized in the <code>ConfigurationSyncStateSummary</code> and
  /// <code>Status</code>, broken down by zone and configuration object.
  final Map<String, SyncState>? syncStates;

  FirewallStatus({
    required this.configurationSyncStateSummary,
    required this.status,
    this.syncStates,
  });

  factory FirewallStatus.fromJson(Map<String, dynamic> json) {
    return FirewallStatus(
      configurationSyncStateSummary:
          (json['ConfigurationSyncStateSummary'] as String)
              .toConfigurationSyncState(),
      status: (json['Status'] as String).toFirewallStatusValue(),
      syncStates: (json['SyncStates'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, SyncState.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSyncStateSummary = this.configurationSyncStateSummary;
    final status = this.status;
    final syncStates = this.syncStates;
    return {
      'ConfigurationSyncStateSummary': configurationSyncStateSummary.toValue(),
      'Status': status.toValue(),
      if (syncStates != null) 'SyncStates': syncStates,
    };
  }
}

enum FirewallStatusValue {
  provisioning,
  deleting,
  ready,
}

extension on FirewallStatusValue {
  String toValue() {
    switch (this) {
      case FirewallStatusValue.provisioning:
        return 'PROVISIONING';
      case FirewallStatusValue.deleting:
        return 'DELETING';
      case FirewallStatusValue.ready:
        return 'READY';
    }
  }
}

extension on String {
  FirewallStatusValue toFirewallStatusValue() {
    switch (this) {
      case 'PROVISIONING':
        return FirewallStatusValue.provisioning;
      case 'DELETING':
        return FirewallStatusValue.deleting;
      case 'READY':
        return FirewallStatusValue.ready;
    }
    throw Exception('$this is not known in enum FirewallStatusValue');
  }
}

enum GeneratedRulesType {
  allowlist,
  denylist,
}

extension on GeneratedRulesType {
  String toValue() {
    switch (this) {
      case GeneratedRulesType.allowlist:
        return 'ALLOWLIST';
      case GeneratedRulesType.denylist:
        return 'DENYLIST';
    }
  }
}

extension on String {
  GeneratedRulesType toGeneratedRulesType() {
    switch (this) {
      case 'ALLOWLIST':
        return GeneratedRulesType.allowlist;
      case 'DENYLIST':
        return GeneratedRulesType.denylist;
    }
    throw Exception('$this is not known in enum GeneratedRulesType');
  }
}

/// The 5-tuple criteria for AWS Network Firewall to use to inspect packet
/// headers in stateful traffic flow inspection. Traffic flows that match the
/// criteria are a match for the corresponding <a>StatefulRule</a>.
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
  final String destination;

  /// The destination port to inspect for. You can specify an individual port, for
  /// example <code>1994</code> and you can specify a port range, for example
  /// <code>1990-1994</code>. To match with any port, specify <code>ANY</code>.
  final String destinationPort;

  /// The direction of traffic flow to inspect. If set to <code>ANY</code>, the
  /// inspection matches bidirectional traffic, both from the source to the
  /// destination and from the destination to the source. If set to
  /// <code>FORWARD</code>, the inspection only matches traffic going from the
  /// source to the destination.
  final StatefulRuleDirection direction;

  /// The protocol to inspect for. To specify all, you can use <code>IP</code>,
  /// because all traffic on AWS and on the internet is IP.
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
  final String source;

  /// The source port to inspect for. You can specify an individual port, for
  /// example <code>1994</code> and you can specify a port range, for example
  /// <code>1990-1994</code>. To match with any port, specify <code>ANY</code>.
  final String sourcePort;

  Header({
    required this.destination,
    required this.destinationPort,
    required this.direction,
    required this.protocol,
    required this.source,
    required this.sourcePort,
  });

  factory Header.fromJson(Map<String, dynamic> json) {
    return Header(
      destination: json['Destination'] as String,
      destinationPort: json['DestinationPort'] as String,
      direction: (json['Direction'] as String).toStatefulRuleDirection(),
      protocol: (json['Protocol'] as String).toStatefulRuleProtocol(),
      source: json['Source'] as String,
      sourcePort: json['SourcePort'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final destinationPort = this.destinationPort;
    final direction = this.direction;
    final protocol = this.protocol;
    final source = this.source;
    final sourcePort = this.sourcePort;
    return {
      'Destination': destination,
      'DestinationPort': destinationPort,
      'Direction': direction.toValue(),
      'Protocol': protocol.toValue(),
      'Source': source,
      'SourcePort': sourcePort,
    };
  }
}

/// A list of IP addresses and address ranges, in CIDR notation. This is part of
/// a <a>RuleVariables</a>.
class IPSet {
  /// The list of IP addresses and address ranges, in CIDR notation.
  final List<String> definition;

  IPSet({
    required this.definition,
  });

  factory IPSet.fromJson(Map<String, dynamic> json) {
    return IPSet(
      definition: (json['Definition'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    return {
      'Definition': definition,
    };
  }
}

class ListFirewallPoliciesResponse {
  /// The metadata for the firewall policies. Depending on your setting for max
  /// results and the number of firewall policies that you have, this might not be
  /// the full list.
  final List<FirewallPolicyMetadata>? firewallPolicies;

  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Network Firewall returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  final String? nextToken;

  ListFirewallPoliciesResponse({
    this.firewallPolicies,
    this.nextToken,
  });

  factory ListFirewallPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListFirewallPoliciesResponse(
      firewallPolicies: (json['FirewallPolicies'] as List?)
          ?.whereNotNull()
          .map(
              (e) => FirewallPolicyMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallPolicies = this.firewallPolicies;
    final nextToken = this.nextToken;
    return {
      if (firewallPolicies != null) 'FirewallPolicies': firewallPolicies,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFirewallsResponse {
  /// The firewall metadata objects for the VPCs that you specified. Depending on
  /// your setting for max results and the number of firewalls you have, a single
  /// call might not be the full list.
  final List<FirewallMetadata>? firewalls;

  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Network Firewall returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  final String? nextToken;

  ListFirewallsResponse({
    this.firewalls,
    this.nextToken,
  });

  factory ListFirewallsResponse.fromJson(Map<String, dynamic> json) {
    return ListFirewallsResponse(
      firewalls: (json['Firewalls'] as List?)
          ?.whereNotNull()
          .map((e) => FirewallMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewalls = this.firewalls;
    final nextToken = this.nextToken;
    return {
      if (firewalls != null) 'Firewalls': firewalls,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRuleGroupsResponse {
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Network Firewall returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  final String? nextToken;

  /// The rule group metadata objects that you've defined. Depending on your
  /// setting for max results and the number of rule groups, this might not be the
  /// full list.
  final List<RuleGroupMetadata>? ruleGroups;

  ListRuleGroupsResponse({
    this.nextToken,
    this.ruleGroups,
  });

  factory ListRuleGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListRuleGroupsResponse(
      nextToken: json['NextToken'] as String?,
      ruleGroups: (json['RuleGroups'] as List?)
          ?.whereNotNull()
          .map((e) => RuleGroupMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final ruleGroups = this.ruleGroups;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (ruleGroups != null) 'RuleGroups': ruleGroups,
    };
  }
}

class ListTagsForResourceResponse {
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Network Firewall returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  final String? nextToken;

  /// The tags that are associated with the resource.
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
  final Map<String, String> logDestination;

  /// The type of storage destination to send these logs to. You can send logs to
  /// an Amazon S3 bucket, a CloudWatch log group, or a Kinesis Data Firehose
  /// delivery stream.
  final LogDestinationType logDestinationType;

  /// The type of log to send. Alert logs report traffic that matches a
  /// <a>StatefulRule</a> with an action setting that sends an alert log message.
  /// Flow logs are standard network traffic flow logs.
  final LogType logType;

  LogDestinationConfig({
    required this.logDestination,
    required this.logDestinationType,
    required this.logType,
  });

  factory LogDestinationConfig.fromJson(Map<String, dynamic> json) {
    return LogDestinationConfig(
      logDestination: (json['LogDestination'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      logDestinationType:
          (json['LogDestinationType'] as String).toLogDestinationType(),
      logType: (json['LogType'] as String).toLogType(),
    );
  }

  Map<String, dynamic> toJson() {
    final logDestination = this.logDestination;
    final logDestinationType = this.logDestinationType;
    final logType = this.logType;
    return {
      'LogDestination': logDestination,
      'LogDestinationType': logDestinationType.toValue(),
      'LogType': logType.toValue(),
    };
  }
}

enum LogDestinationType {
  s3,
  cloudWatchLogs,
  kinesisDataFirehose,
}

extension on LogDestinationType {
  String toValue() {
    switch (this) {
      case LogDestinationType.s3:
        return 'S3';
      case LogDestinationType.cloudWatchLogs:
        return 'CloudWatchLogs';
      case LogDestinationType.kinesisDataFirehose:
        return 'KinesisDataFirehose';
    }
  }
}

extension on String {
  LogDestinationType toLogDestinationType() {
    switch (this) {
      case 'S3':
        return LogDestinationType.s3;
      case 'CloudWatchLogs':
        return LogDestinationType.cloudWatchLogs;
      case 'KinesisDataFirehose':
        return LogDestinationType.kinesisDataFirehose;
    }
    throw Exception('$this is not known in enum LogDestinationType');
  }
}

enum LogType {
  alert,
  flow,
}

extension on LogType {
  String toValue() {
    switch (this) {
      case LogType.alert:
        return 'ALERT';
      case LogType.flow:
        return 'FLOW';
    }
  }
}

extension on String {
  LogType toLogType() {
    switch (this) {
      case 'ALERT':
        return LogType.alert;
      case 'FLOW':
        return LogType.flow;
    }
    throw Exception('$this is not known in enum LogType');
  }
}

/// Defines how AWS Network Firewall performs logging for a <a>Firewall</a>.
class LoggingConfiguration {
  /// Defines the logging destinations for the logs for a firewall. Network
  /// Firewall generates logs for stateful rule groups.
  final List<LogDestinationConfig> logDestinationConfigs;

  LoggingConfiguration({
    required this.logDestinationConfigs,
  });

  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return LoggingConfiguration(
      logDestinationConfigs: (json['LogDestinationConfigs'] as List)
          .whereNotNull()
          .map((e) => LogDestinationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logDestinationConfigs = this.logDestinationConfigs;
    return {
      'LogDestinationConfigs': logDestinationConfigs,
    };
  }
}

/// Criteria for Network Firewall to use to inspect an individual packet in
/// stateless rule inspection. Each match attributes set can include one or more
/// items such as IP address, CIDR range, port number, protocol, and TCP flags.
class MatchAttributes {
  /// The destination ports to inspect for. If not specified, this matches with
  /// any destination port. This setting is only used for protocols 6 (TCP) and 17
  /// (UDP).
  ///
  /// You can specify individual ports, for example <code>1994</code> and you can
  /// specify port ranges, for example <code>1990-1994</code>.
  final List<PortRange>? destinationPorts;

  /// The destination IP addresses and address ranges to inspect for, in CIDR
  /// notation. If not specified, this matches with any destination address.
  final List<Address>? destinations;

  /// The protocols to inspect for, specified using each protocol's assigned
  /// internet protocol number (IANA). If not specified, this matches with any
  /// protocol.
  final List<int>? protocols;

  /// The source ports to inspect for. If not specified, this matches with any
  /// source port. This setting is only used for protocols 6 (TCP) and 17 (UDP).
  ///
  /// You can specify individual ports, for example <code>1994</code> and you can
  /// specify port ranges, for example <code>1990-1994</code>.
  final List<PortRange>? sourcePorts;

  /// The source IP addresses and address ranges to inspect for, in CIDR notation.
  /// If not specified, this matches with any source address.
  final List<Address>? sources;

  /// The TCP flags and masks to inspect for. If not specified, this matches with
  /// any settings. This setting is only used for protocol 6 (TCP).
  final List<TCPFlagField>? tCPFlags;

  MatchAttributes({
    this.destinationPorts,
    this.destinations,
    this.protocols,
    this.sourcePorts,
    this.sources,
    this.tCPFlags,
  });

  factory MatchAttributes.fromJson(Map<String, dynamic> json) {
    return MatchAttributes(
      destinationPorts: (json['DestinationPorts'] as List?)
          ?.whereNotNull()
          .map((e) => PortRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      destinations: (json['Destinations'] as List?)
          ?.whereNotNull()
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      protocols: (json['Protocols'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      sourcePorts: (json['SourcePorts'] as List?)
          ?.whereNotNull()
          .map((e) => PortRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      sources: (json['Sources'] as List?)
          ?.whereNotNull()
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      tCPFlags: (json['TCPFlags'] as List?)
          ?.whereNotNull()
          .map((e) => TCPFlagField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationPorts = this.destinationPorts;
    final destinations = this.destinations;
    final protocols = this.protocols;
    final sourcePorts = this.sourcePorts;
    final sources = this.sources;
    final tCPFlags = this.tCPFlags;
    return {
      if (destinationPorts != null) 'DestinationPorts': destinationPorts,
      if (destinations != null) 'Destinations': destinations,
      if (protocols != null) 'Protocols': protocols,
      if (sourcePorts != null) 'SourcePorts': sourcePorts,
      if (sources != null) 'Sources': sources,
      if (tCPFlags != null) 'TCPFlags': tCPFlags,
    };
  }
}

/// Provides configuration status for a single policy or rule group that is used
/// for a firewall endpoint. Network Firewall provides each endpoint with the
/// rules that are configured in the firewall policy. Each time you add a subnet
/// or modify the associated firewall policy, Network Firewall synchronizes the
/// rules in the endpoint, so it can properly filter network traffic. This is
/// part of a <a>SyncState</a> for a firewall.
class PerObjectStatus {
  /// Indicates whether this object is in sync with the version indicated in the
  /// update token.
  final PerObjectSyncStatus? syncStatus;

  /// The current version of the object that is either in sync or pending
  /// synchronization.
  final String? updateToken;

  PerObjectStatus({
    this.syncStatus,
    this.updateToken,
  });

  factory PerObjectStatus.fromJson(Map<String, dynamic> json) {
    return PerObjectStatus(
      syncStatus: (json['SyncStatus'] as String?)?.toPerObjectSyncStatus(),
      updateToken: json['UpdateToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final syncStatus = this.syncStatus;
    final updateToken = this.updateToken;
    return {
      if (syncStatus != null) 'SyncStatus': syncStatus.toValue(),
      if (updateToken != null) 'UpdateToken': updateToken,
    };
  }
}

enum PerObjectSyncStatus {
  pending,
  inSync,
}

extension on PerObjectSyncStatus {
  String toValue() {
    switch (this) {
      case PerObjectSyncStatus.pending:
        return 'PENDING';
      case PerObjectSyncStatus.inSync:
        return 'IN_SYNC';
    }
  }
}

extension on String {
  PerObjectSyncStatus toPerObjectSyncStatus() {
    switch (this) {
      case 'PENDING':
        return PerObjectSyncStatus.pending;
      case 'IN_SYNC':
        return PerObjectSyncStatus.inSync;
    }
    throw Exception('$this is not known in enum PerObjectSyncStatus');
  }
}

/// A single port range specification. This is used for source and destination
/// port ranges in the stateless rule <a>MatchAttributes</a>,
/// <code>SourcePorts</code>, and <code>DestinationPorts</code> settings.
class PortRange {
  /// The lower limit of the port range. This must be less than or equal to the
  /// <code>ToPort</code> specification.
  final int fromPort;

  /// The upper limit of the port range. This must be greater than or equal to the
  /// <code>FromPort</code> specification.
  final int toPort;

  PortRange({
    required this.fromPort,
    required this.toPort,
  });

  factory PortRange.fromJson(Map<String, dynamic> json) {
    return PortRange(
      fromPort: json['FromPort'] as int,
      toPort: json['ToPort'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final fromPort = this.fromPort;
    final toPort = this.toPort;
    return {
      'FromPort': fromPort,
      'ToPort': toPort,
    };
  }
}

/// A set of port ranges for use in the rules in a rule group.
class PortSet {
  /// The set of port ranges.
  final List<String>? definition;

  PortSet({
    this.definition,
  });

  factory PortSet.fromJson(Map<String, dynamic> json) {
    return PortSet(
      definition: (json['Definition'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    return {
      if (definition != null) 'Definition': definition,
    };
  }
}

/// Stateless inspection criteria that publishes the specified metrics to Amazon
/// CloudWatch for the matching packet. This setting defines a CloudWatch
/// dimension value to be published.
class PublishMetricAction {
  /// <p/>
  final List<Dimension> dimensions;

  PublishMetricAction({
    required this.dimensions,
  });

  factory PublishMetricAction.fromJson(Map<String, dynamic> json) {
    return PublishMetricAction(
      dimensions: (json['Dimensions'] as List)
          .whereNotNull()
          .map((e) => Dimension.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    return {
      'Dimensions': dimensions,
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

enum ResourceStatus {
  active,
  deleting,
}

extension on ResourceStatus {
  String toValue() {
    switch (this) {
      case ResourceStatus.active:
        return 'ACTIVE';
      case ResourceStatus.deleting:
        return 'DELETING';
    }
  }
}

extension on String {
  ResourceStatus toResourceStatus() {
    switch (this) {
      case 'ACTIVE':
        return ResourceStatus.active;
      case 'DELETING':
        return ResourceStatus.deleting;
    }
    throw Exception('$this is not known in enum ResourceStatus');
  }
}

/// The inspection criteria and action for a single stateless rule. AWS Network
/// Firewall inspects each packet for the specified matching criteria. When a
/// packet matches the criteria, Network Firewall performs the rule's actions on
/// the packet.
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
  final List<String> actions;

  /// Criteria for Network Firewall to use to inspect an individual packet in
  /// stateless rule inspection. Each match attributes set can include one or more
  /// items such as IP address, CIDR range, port number, protocol, and TCP flags.
  final MatchAttributes matchAttributes;

  RuleDefinition({
    required this.actions,
    required this.matchAttributes,
  });

  factory RuleDefinition.fromJson(Map<String, dynamic> json) {
    return RuleDefinition(
      actions: (json['Actions'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      matchAttributes: MatchAttributes.fromJson(
          json['MatchAttributes'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final matchAttributes = this.matchAttributes;
    return {
      'Actions': actions,
      'MatchAttributes': matchAttributes,
    };
  }
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
class RuleGroup {
  /// The stateful rules or stateless rules for the rule group.
  final RulesSource rulesSource;

  /// Settings that are available for use in the rules in the rule group. You can
  /// only use these for stateful rule groups.
  final RuleVariables? ruleVariables;

  RuleGroup({
    required this.rulesSource,
    this.ruleVariables,
  });

  factory RuleGroup.fromJson(Map<String, dynamic> json) {
    return RuleGroup(
      rulesSource:
          RulesSource.fromJson(json['RulesSource'] as Map<String, dynamic>),
      ruleVariables: json['RuleVariables'] != null
          ? RuleVariables.fromJson(
              json['RuleVariables'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final rulesSource = this.rulesSource;
    final ruleVariables = this.ruleVariables;
    return {
      'RulesSource': rulesSource,
      if (ruleVariables != null) 'RuleVariables': ruleVariables,
    };
  }
}

/// High-level information about a rule group, returned by
/// <a>ListRuleGroups</a>. You can use the information provided in the metadata
/// to retrieve and manage a rule group.
class RuleGroupMetadata {
  /// The Amazon Resource Name (ARN) of the rule group.
  final String? arn;

  /// The descriptive name of the rule group. You can't change the name of a rule
  /// group after you create it.
  final String? name;

  RuleGroupMetadata({
    this.arn,
    this.name,
  });

  factory RuleGroupMetadata.fromJson(Map<String, dynamic> json) {
    return RuleGroupMetadata(
      arn: json['Arn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (name != null) 'Name': name,
    };
  }
}

/// The high-level properties of a rule group. This, along with the
/// <a>RuleGroup</a>, define the rule group. You can retrieve all objects for a
/// rule group by calling <a>DescribeRuleGroup</a>.
class RuleGroupResponse {
  /// The Amazon Resource Name (ARN) of the rule group.
  /// <note>
  /// If this response is for a create request that had <code>DryRun</code> set to
  /// <code>TRUE</code>, then this ARN is a placeholder that isn't attached to a
  /// valid resource.
  /// </note>
  final String ruleGroupArn;

  /// The unique identifier for the rule group.
  final String ruleGroupId;

  /// The descriptive name of the rule group. You can't change the name of a rule
  /// group after you create it.
  final String ruleGroupName;

  /// The maximum operating resources that this rule group can use. Rule group
  /// capacity is fixed at creation. When you update a rule group, you are limited
  /// to this capacity. When you reference a rule group from a firewall policy,
  /// Network Firewall reserves this capacity for the rule group.
  ///
  /// You can retrieve the capacity that would be required for a rule group before
  /// you create the rule group by calling <a>CreateRuleGroup</a> with
  /// <code>DryRun</code> set to <code>TRUE</code>.
  final int? capacity;

  /// A description of the rule group.
  final String? description;

  /// Detailed information about the current status of a rule group.
  final ResourceStatus? ruleGroupStatus;

  /// The key:value pairs to associate with the resource.
  final List<Tag>? tags;

  /// Indicates whether the rule group is stateless or stateful. If the rule group
  /// is stateless, it contains stateless rules. If it is stateful, it contains
  /// stateful rules.
  final RuleGroupType? type;

  RuleGroupResponse({
    required this.ruleGroupArn,
    required this.ruleGroupId,
    required this.ruleGroupName,
    this.capacity,
    this.description,
    this.ruleGroupStatus,
    this.tags,
    this.type,
  });

  factory RuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return RuleGroupResponse(
      ruleGroupArn: json['RuleGroupArn'] as String,
      ruleGroupId: json['RuleGroupId'] as String,
      ruleGroupName: json['RuleGroupName'] as String,
      capacity: json['Capacity'] as int?,
      description: json['Description'] as String?,
      ruleGroupStatus: (json['RuleGroupStatus'] as String?)?.toResourceStatus(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.toRuleGroupType(),
    );
  }

  Map<String, dynamic> toJson() {
    final ruleGroupArn = this.ruleGroupArn;
    final ruleGroupId = this.ruleGroupId;
    final ruleGroupName = this.ruleGroupName;
    final capacity = this.capacity;
    final description = this.description;
    final ruleGroupStatus = this.ruleGroupStatus;
    final tags = this.tags;
    final type = this.type;
    return {
      'RuleGroupArn': ruleGroupArn,
      'RuleGroupId': ruleGroupId,
      'RuleGroupName': ruleGroupName,
      if (capacity != null) 'Capacity': capacity,
      if (description != null) 'Description': description,
      if (ruleGroupStatus != null) 'RuleGroupStatus': ruleGroupStatus.toValue(),
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum RuleGroupType {
  stateless,
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
  }
}

extension on String {
  RuleGroupType toRuleGroupType() {
    switch (this) {
      case 'STATELESS':
        return RuleGroupType.stateless;
      case 'STATEFUL':
        return RuleGroupType.stateful;
    }
    throw Exception('$this is not known in enum RuleGroupType');
  }
}

/// Additional settings for a stateful rule. This is part of the
/// <a>StatefulRule</a> configuration.
class RuleOption {
  /// <p/>
  final String keyword;

  /// <p/>
  final List<String>? settings;

  RuleOption({
    required this.keyword,
    this.settings,
  });

  factory RuleOption.fromJson(Map<String, dynamic> json) {
    return RuleOption(
      keyword: json['Keyword'] as String,
      settings: (json['Settings'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyword = this.keyword;
    final settings = this.settings;
    return {
      'Keyword': keyword,
      if (settings != null) 'Settings': settings,
    };
  }
}

/// Settings that are available for use in the rules in the <a>RuleGroup</a>
/// where this is defined.
class RuleVariables {
  /// A list of IP addresses and address ranges, in CIDR notation.
  final Map<String, IPSet>? iPSets;

  /// A list of port ranges.
  final Map<String, PortSet>? portSets;

  RuleVariables({
    this.iPSets,
    this.portSets,
  });

  factory RuleVariables.fromJson(Map<String, dynamic> json) {
    return RuleVariables(
      iPSets: (json['IPSets'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, IPSet.fromJson(e as Map<String, dynamic>))),
      portSets: (json['PortSets'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, PortSet.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final iPSets = this.iPSets;
    final portSets = this.portSets;
    return {
      if (iPSets != null) 'IPSets': iPSets,
      if (portSets != null) 'PortSets': portSets,
    };
  }
}

/// The stateless or stateful rules definitions for use in a single rule group.
/// Each rule group requires a single <code>RulesSource</code>. You can use an
/// instance of this for either stateless rules or stateful rules.
class RulesSource {
  /// Stateful inspection criteria for a domain list rule group.
  final RulesSourceList? rulesSourceList;

  /// Stateful inspection criteria, provided in Suricata compatible intrusion
  /// prevention system (IPS) rules. Suricata is an open-source network IPS that
  /// includes a standard rule-based language for network traffic inspection.
  ///
  /// These rules contain the inspection criteria and the action to take for
  /// traffic that matches the criteria, so this type of rule group doesn't have a
  /// separate action setting.
  final String? rulesString;

  /// The 5-tuple stateful inspection criteria. This contains an array of
  /// individual 5-tuple stateful rules to be used together in a stateful rule
  /// group.
  final List<StatefulRule>? statefulRules;

  /// Stateless inspection criteria to be used in a stateless rule group.
  final StatelessRulesAndCustomActions? statelessRulesAndCustomActions;

  RulesSource({
    this.rulesSourceList,
    this.rulesString,
    this.statefulRules,
    this.statelessRulesAndCustomActions,
  });

  factory RulesSource.fromJson(Map<String, dynamic> json) {
    return RulesSource(
      rulesSourceList: json['RulesSourceList'] != null
          ? RulesSourceList.fromJson(
              json['RulesSourceList'] as Map<String, dynamic>)
          : null,
      rulesString: json['RulesString'] as String?,
      statefulRules: (json['StatefulRules'] as List?)
          ?.whereNotNull()
          .map((e) => StatefulRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      statelessRulesAndCustomActions: json['StatelessRulesAndCustomActions'] !=
              null
          ? StatelessRulesAndCustomActions.fromJson(
              json['StatelessRulesAndCustomActions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final rulesSourceList = this.rulesSourceList;
    final rulesString = this.rulesString;
    final statefulRules = this.statefulRules;
    final statelessRulesAndCustomActions = this.statelessRulesAndCustomActions;
    return {
      if (rulesSourceList != null) 'RulesSourceList': rulesSourceList,
      if (rulesString != null) 'RulesString': rulesString,
      if (statefulRules != null) 'StatefulRules': statefulRules,
      if (statelessRulesAndCustomActions != null)
        'StatelessRulesAndCustomActions': statelessRulesAndCustomActions,
    };
  }
}

/// Stateful inspection criteria for a domain list rule group.
///
/// For HTTPS traffic, domain filtering is SNI-based. It uses the server name
/// indicator extension of the TLS handshake.
///
/// By default, Network Firewall domain list inspection only includes traffic
/// coming from the VPC where you deploy the firewall. To inspect traffic from
/// IP addresses outside of the deployment VPC, you set the
/// <code>HOME_NET</code> rule variable to include the CIDR range of the
/// deployment VPC plus the other CIDR ranges. For more information, see
/// <a>RuleVariables</a> in this guide and <a
/// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/stateful-rule-groups-domain-names.html">Stateful
/// domain list rule groups in AWS Network Firewall</a> in the <i>Network
/// Firewall Developer Guide</i>
class RulesSourceList {
  /// Whether you want to allow or deny access to the domains in your target list.
  final GeneratedRulesType generatedRulesType;

  /// The protocols you want to inspect. Specify <code>TLS_SNI</code> for
  /// <code>HTTPS</code>. Specity <code>HTTP_HOST</code> for <code>HTTP</code>.
  /// You can specify either or both.
  final List<TargetType> targetTypes;

  /// The domains that you want to inspect for in your traffic flows. To provide
  /// multiple domains, separate them with commas. Valid domain specifications are
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// Explicit names. For example, <code>abc.example.com</code> matches only the
  /// domain <code>abc.example.com</code>.
  /// </li>
  /// <li>
  /// Names that use a domain wildcard, which you indicate with an initial
  /// '<code>.</code>'. For example,<code>.example.com</code> matches
  /// <code>example.com</code> and matches all subdomains of
  /// <code>example.com</code>, such as <code>abc.example.com</code> and
  /// <code>www.example.com</code>.
  /// </li>
  /// </ul>
  final List<String> targets;

  RulesSourceList({
    required this.generatedRulesType,
    required this.targetTypes,
    required this.targets,
  });

  factory RulesSourceList.fromJson(Map<String, dynamic> json) {
    return RulesSourceList(
      generatedRulesType:
          (json['GeneratedRulesType'] as String).toGeneratedRulesType(),
      targetTypes: (json['TargetTypes'] as List)
          .whereNotNull()
          .map((e) => (e as String).toTargetType())
          .toList(),
      targets: (json['Targets'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final generatedRulesType = this.generatedRulesType;
    final targetTypes = this.targetTypes;
    final targets = this.targets;
    return {
      'GeneratedRulesType': generatedRulesType.toValue(),
      'TargetTypes': targetTypes.map((e) => e.toValue()).toList(),
      'Targets': targets,
    };
  }
}

enum StatefulAction {
  pass,
  drop,
  alert,
}

extension on StatefulAction {
  String toValue() {
    switch (this) {
      case StatefulAction.pass:
        return 'PASS';
      case StatefulAction.drop:
        return 'DROP';
      case StatefulAction.alert:
        return 'ALERT';
    }
  }
}

extension on String {
  StatefulAction toStatefulAction() {
    switch (this) {
      case 'PASS':
        return StatefulAction.pass;
      case 'DROP':
        return StatefulAction.drop;
      case 'ALERT':
        return StatefulAction.alert;
    }
    throw Exception('$this is not known in enum StatefulAction');
  }
}

/// A single 5-tuple stateful rule, for use in a stateful rule group.
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
  final StatefulAction action;

  /// The stateful 5-tuple inspection criteria for this rule, used to inspect
  /// traffic flows.
  final Header header;

  /// <p/>
  final List<RuleOption> ruleOptions;

  StatefulRule({
    required this.action,
    required this.header,
    required this.ruleOptions,
  });

  factory StatefulRule.fromJson(Map<String, dynamic> json) {
    return StatefulRule(
      action: (json['Action'] as String).toStatefulAction(),
      header: Header.fromJson(json['Header'] as Map<String, dynamic>),
      ruleOptions: (json['RuleOptions'] as List)
          .whereNotNull()
          .map((e) => RuleOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final header = this.header;
    final ruleOptions = this.ruleOptions;
    return {
      'Action': action.toValue(),
      'Header': header,
      'RuleOptions': ruleOptions,
    };
  }
}

enum StatefulRuleDirection {
  forward,
  any,
}

extension on StatefulRuleDirection {
  String toValue() {
    switch (this) {
      case StatefulRuleDirection.forward:
        return 'FORWARD';
      case StatefulRuleDirection.any:
        return 'ANY';
    }
  }
}

extension on String {
  StatefulRuleDirection toStatefulRuleDirection() {
    switch (this) {
      case 'FORWARD':
        return StatefulRuleDirection.forward;
      case 'ANY':
        return StatefulRuleDirection.any;
    }
    throw Exception('$this is not known in enum StatefulRuleDirection');
  }
}

/// Identifier for a single stateful rule group, used in a firewall policy to
/// refer to a rule group.
class StatefulRuleGroupReference {
  /// The Amazon Resource Name (ARN) of the stateful rule group.
  final String resourceArn;

  StatefulRuleGroupReference({
    required this.resourceArn,
  });

  factory StatefulRuleGroupReference.fromJson(Map<String, dynamic> json) {
    return StatefulRuleGroupReference(
      resourceArn: json['ResourceArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    return {
      'ResourceArn': resourceArn,
    };
  }
}

enum StatefulRuleProtocol {
  ip,
  tcp,
  udp,
  icmp,
  http,
  ftp,
  tls,
  smb,
  dns,
  dcerpc,
  ssh,
  smtp,
  imap,
  msn,
  krb5,
  ikev2,
  tftp,
  ntp,
  dhcp,
}

extension on StatefulRuleProtocol {
  String toValue() {
    switch (this) {
      case StatefulRuleProtocol.ip:
        return 'IP';
      case StatefulRuleProtocol.tcp:
        return 'TCP';
      case StatefulRuleProtocol.udp:
        return 'UDP';
      case StatefulRuleProtocol.icmp:
        return 'ICMP';
      case StatefulRuleProtocol.http:
        return 'HTTP';
      case StatefulRuleProtocol.ftp:
        return 'FTP';
      case StatefulRuleProtocol.tls:
        return 'TLS';
      case StatefulRuleProtocol.smb:
        return 'SMB';
      case StatefulRuleProtocol.dns:
        return 'DNS';
      case StatefulRuleProtocol.dcerpc:
        return 'DCERPC';
      case StatefulRuleProtocol.ssh:
        return 'SSH';
      case StatefulRuleProtocol.smtp:
        return 'SMTP';
      case StatefulRuleProtocol.imap:
        return 'IMAP';
      case StatefulRuleProtocol.msn:
        return 'MSN';
      case StatefulRuleProtocol.krb5:
        return 'KRB5';
      case StatefulRuleProtocol.ikev2:
        return 'IKEV2';
      case StatefulRuleProtocol.tftp:
        return 'TFTP';
      case StatefulRuleProtocol.ntp:
        return 'NTP';
      case StatefulRuleProtocol.dhcp:
        return 'DHCP';
    }
  }
}

extension on String {
  StatefulRuleProtocol toStatefulRuleProtocol() {
    switch (this) {
      case 'IP':
        return StatefulRuleProtocol.ip;
      case 'TCP':
        return StatefulRuleProtocol.tcp;
      case 'UDP':
        return StatefulRuleProtocol.udp;
      case 'ICMP':
        return StatefulRuleProtocol.icmp;
      case 'HTTP':
        return StatefulRuleProtocol.http;
      case 'FTP':
        return StatefulRuleProtocol.ftp;
      case 'TLS':
        return StatefulRuleProtocol.tls;
      case 'SMB':
        return StatefulRuleProtocol.smb;
      case 'DNS':
        return StatefulRuleProtocol.dns;
      case 'DCERPC':
        return StatefulRuleProtocol.dcerpc;
      case 'SSH':
        return StatefulRuleProtocol.ssh;
      case 'SMTP':
        return StatefulRuleProtocol.smtp;
      case 'IMAP':
        return StatefulRuleProtocol.imap;
      case 'MSN':
        return StatefulRuleProtocol.msn;
      case 'KRB5':
        return StatefulRuleProtocol.krb5;
      case 'IKEV2':
        return StatefulRuleProtocol.ikev2;
      case 'TFTP':
        return StatefulRuleProtocol.tftp;
      case 'NTP':
        return StatefulRuleProtocol.ntp;
      case 'DHCP':
        return StatefulRuleProtocol.dhcp;
    }
    throw Exception('$this is not known in enum StatefulRuleProtocol');
  }
}

/// A single stateless rule. This is used in
/// <a>StatelessRulesAndCustomActions</a>.
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
  final int priority;

  /// Defines the stateless 5-tuple packet inspection criteria and the action to
  /// take on a packet that matches the criteria.
  final RuleDefinition ruleDefinition;

  StatelessRule({
    required this.priority,
    required this.ruleDefinition,
  });

  factory StatelessRule.fromJson(Map<String, dynamic> json) {
    return StatelessRule(
      priority: json['Priority'] as int,
      ruleDefinition: RuleDefinition.fromJson(
          json['RuleDefinition'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final priority = this.priority;
    final ruleDefinition = this.ruleDefinition;
    return {
      'Priority': priority,
      'RuleDefinition': ruleDefinition,
    };
  }
}

/// Identifier for a single stateless rule group, used in a firewall policy to
/// refer to the rule group.
class StatelessRuleGroupReference {
  /// An integer setting that indicates the order in which to run the stateless
  /// rule groups in a single <a>FirewallPolicy</a>. Network Firewall applies each
  /// stateless rule group to a packet starting with the group that has the lowest
  /// priority setting. You must ensure that the priority settings are unique
  /// within each policy.
  final int priority;

  /// The Amazon Resource Name (ARN) of the stateless rule group.
  final String resourceArn;

  StatelessRuleGroupReference({
    required this.priority,
    required this.resourceArn,
  });

  factory StatelessRuleGroupReference.fromJson(Map<String, dynamic> json) {
    return StatelessRuleGroupReference(
      priority: json['Priority'] as int,
      resourceArn: json['ResourceArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final priority = this.priority;
    final resourceArn = this.resourceArn;
    return {
      'Priority': priority,
      'ResourceArn': resourceArn,
    };
  }
}

/// Stateless inspection criteria. Each stateless rule group uses exactly one of
/// these data types to define its stateless rules.
class StatelessRulesAndCustomActions {
  /// Defines the set of stateless rules for use in a stateless rule group.
  final List<StatelessRule> statelessRules;

  /// Defines an array of individual custom action definitions that are available
  /// for use by the stateless rules in this
  /// <code>StatelessRulesAndCustomActions</code> specification. You name each
  /// custom action that you define, and then you can use it by name in your
  /// <a>StatelessRule</a> <a>RuleDefinition</a> <code>Actions</code>
  /// specification.
  final List<CustomAction>? customActions;

  StatelessRulesAndCustomActions({
    required this.statelessRules,
    this.customActions,
  });

  factory StatelessRulesAndCustomActions.fromJson(Map<String, dynamic> json) {
    return StatelessRulesAndCustomActions(
      statelessRules: (json['StatelessRules'] as List)
          .whereNotNull()
          .map((e) => StatelessRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      customActions: (json['CustomActions'] as List?)
          ?.whereNotNull()
          .map((e) => CustomAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statelessRules = this.statelessRules;
    final customActions = this.customActions;
    return {
      'StatelessRules': statelessRules,
      if (customActions != null) 'CustomActions': customActions,
    };
  }
}

/// The ID for a subnet that you want to associate with the firewall. This is
/// used with <a>CreateFirewall</a> and <a>AssociateSubnets</a>. AWS Network
/// Firewall creates an instance of the associated firewall in each subnet that
/// you specify, to filter traffic in the subnet's Availability Zone.
class SubnetMapping {
  /// The unique identifier for the subnet.
  final String subnetId;

  SubnetMapping({
    required this.subnetId,
  });

  factory SubnetMapping.fromJson(Map<String, dynamic> json) {
    return SubnetMapping(
      subnetId: json['SubnetId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetId = this.subnetId;
    return {
      'SubnetId': subnetId,
    };
  }
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
class SyncState {
  /// The attachment status of the firewall's association with a single VPC
  /// subnet. For each configured subnet, Network Firewall creates the attachment
  /// by instantiating the firewall endpoint in the subnet so that it's ready to
  /// take traffic. This is part of the <a>FirewallStatus</a>.
  final Attachment? attachment;

  /// The configuration status of the firewall endpoint in a single VPC subnet.
  /// Network Firewall provides each endpoint with the rules that are configured
  /// in the firewall policy. Each time you add a subnet or modify the associated
  /// firewall policy, Network Firewall synchronizes the rules in the endpoint, so
  /// it can properly filter network traffic. This is part of the
  /// <a>FirewallStatus</a>.
  final Map<String, PerObjectStatus>? config;

  SyncState({
    this.attachment,
    this.config,
  });

  factory SyncState.fromJson(Map<String, dynamic> json) {
    return SyncState(
      attachment: json['Attachment'] != null
          ? Attachment.fromJson(json['Attachment'] as Map<String, dynamic>)
          : null,
      config: (json['Config'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, PerObjectStatus.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final attachment = this.attachment;
    final config = this.config;
    return {
      if (attachment != null) 'Attachment': attachment,
      if (config != null) 'Config': config,
    };
  }
}

enum TCPFlag {
  fin,
  syn,
  rst,
  psh,
  ack,
  urg,
  ece,
  cwr,
}

extension on TCPFlag {
  String toValue() {
    switch (this) {
      case TCPFlag.fin:
        return 'FIN';
      case TCPFlag.syn:
        return 'SYN';
      case TCPFlag.rst:
        return 'RST';
      case TCPFlag.psh:
        return 'PSH';
      case TCPFlag.ack:
        return 'ACK';
      case TCPFlag.urg:
        return 'URG';
      case TCPFlag.ece:
        return 'ECE';
      case TCPFlag.cwr:
        return 'CWR';
    }
  }
}

extension on String {
  TCPFlag toTCPFlag() {
    switch (this) {
      case 'FIN':
        return TCPFlag.fin;
      case 'SYN':
        return TCPFlag.syn;
      case 'RST':
        return TCPFlag.rst;
      case 'PSH':
        return TCPFlag.psh;
      case 'ACK':
        return TCPFlag.ack;
      case 'URG':
        return TCPFlag.urg;
      case 'ECE':
        return TCPFlag.ece;
      case 'CWR':
        return TCPFlag.cwr;
    }
    throw Exception('$this is not known in enum TCPFlag');
  }
}

/// TCP flags and masks to inspect packets for, used in stateless rules
/// <a>MatchAttributes</a> settings.
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
  final List<TCPFlag> flags;

  /// The set of flags to consider in the inspection. To inspect all flags in the
  /// valid values list, leave this with no setting.
  final List<TCPFlag>? masks;

  TCPFlagField({
    required this.flags,
    this.masks,
  });

  factory TCPFlagField.fromJson(Map<String, dynamic> json) {
    return TCPFlagField(
      flags: (json['Flags'] as List)
          .whereNotNull()
          .map((e) => (e as String).toTCPFlag())
          .toList(),
      masks: (json['Masks'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toTCPFlag())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final flags = this.flags;
    final masks = this.masks;
    return {
      'Flags': flags.map((e) => e.toValue()).toList(),
      if (masks != null) 'Masks': masks.map((e) => e.toValue()).toList(),
    };
  }
}

/// A key:value pair associated with an AWS resource. The key:value pair can be
/// anything you define. Typically, the tag key represents a category (such as
/// "environment") and the tag value represents a specific value within that
/// category (such as "test," "development," or "production"). You can add up to
/// 50 tags to each AWS resource.
class Tag {
  /// The part of the key:value pair that defines a tag. You can use a tag key to
  /// describe a category of information, such as "customer." Tag keys are
  /// case-sensitive.
  final String key;

  /// The part of the key:value pair that defines a tag. You can use a tag value
  /// to describe a specific value within a category, such as "companyA" or
  /// "companyB." Tag values are case-sensitive.
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

enum TargetType {
  tlsSni,
  httpHost,
}

extension on TargetType {
  String toValue() {
    switch (this) {
      case TargetType.tlsSni:
        return 'TLS_SNI';
      case TargetType.httpHost:
        return 'HTTP_HOST';
    }
  }
}

extension on String {
  TargetType toTargetType() {
    switch (this) {
      case 'TLS_SNI':
        return TargetType.tlsSni;
      case 'HTTP_HOST':
        return TargetType.httpHost;
    }
    throw Exception('$this is not known in enum TargetType');
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

class UpdateFirewallDeleteProtectionResponse {
  /// <p/>
  final bool? deleteProtection;

  /// The Amazon Resource Name (ARN) of the firewall.
  final String? firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  final String? firewallName;

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
  final String? updateToken;

  UpdateFirewallDeleteProtectionResponse({
    this.deleteProtection,
    this.firewallArn,
    this.firewallName,
    this.updateToken,
  });

  factory UpdateFirewallDeleteProtectionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateFirewallDeleteProtectionResponse(
      deleteProtection: json['DeleteProtection'] as bool?,
      firewallArn: json['FirewallArn'] as String?,
      firewallName: json['FirewallName'] as String?,
      updateToken: json['UpdateToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deleteProtection = this.deleteProtection;
    final firewallArn = this.firewallArn;
    final firewallName = this.firewallName;
    final updateToken = this.updateToken;
    return {
      if (deleteProtection != null) 'DeleteProtection': deleteProtection,
      if (firewallArn != null) 'FirewallArn': firewallArn,
      if (firewallName != null) 'FirewallName': firewallName,
      if (updateToken != null) 'UpdateToken': updateToken,
    };
  }
}

class UpdateFirewallDescriptionResponse {
  /// A description of the firewall.
  final String? description;

  /// The Amazon Resource Name (ARN) of the firewall.
  final String? firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  final String? firewallName;

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
  final String? updateToken;

  UpdateFirewallDescriptionResponse({
    this.description,
    this.firewallArn,
    this.firewallName,
    this.updateToken,
  });

  factory UpdateFirewallDescriptionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateFirewallDescriptionResponse(
      description: json['Description'] as String?,
      firewallArn: json['FirewallArn'] as String?,
      firewallName: json['FirewallName'] as String?,
      updateToken: json['UpdateToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final firewallArn = this.firewallArn;
    final firewallName = this.firewallName;
    final updateToken = this.updateToken;
    return {
      if (description != null) 'Description': description,
      if (firewallArn != null) 'FirewallArn': firewallArn,
      if (firewallName != null) 'FirewallName': firewallName,
      if (updateToken != null) 'UpdateToken': updateToken,
    };
  }
}

class UpdateFirewallPolicyChangeProtectionResponse {
  /// The Amazon Resource Name (ARN) of the firewall.
  final String? firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  final String? firewallName;

  /// A setting indicating whether the firewall is protected against a change to
  /// the firewall policy association. Use this setting to protect against
  /// accidentally modifying the firewall policy for a firewall that is in use.
  /// When you create a firewall, the operation initializes this setting to
  /// <code>TRUE</code>.
  final bool? firewallPolicyChangeProtection;

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
  final String? updateToken;

  UpdateFirewallPolicyChangeProtectionResponse({
    this.firewallArn,
    this.firewallName,
    this.firewallPolicyChangeProtection,
    this.updateToken,
  });

  factory UpdateFirewallPolicyChangeProtectionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateFirewallPolicyChangeProtectionResponse(
      firewallArn: json['FirewallArn'] as String?,
      firewallName: json['FirewallName'] as String?,
      firewallPolicyChangeProtection:
          json['FirewallPolicyChangeProtection'] as bool?,
      updateToken: json['UpdateToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallArn = this.firewallArn;
    final firewallName = this.firewallName;
    final firewallPolicyChangeProtection = this.firewallPolicyChangeProtection;
    final updateToken = this.updateToken;
    return {
      if (firewallArn != null) 'FirewallArn': firewallArn,
      if (firewallName != null) 'FirewallName': firewallName,
      if (firewallPolicyChangeProtection != null)
        'FirewallPolicyChangeProtection': firewallPolicyChangeProtection,
      if (updateToken != null) 'UpdateToken': updateToken,
    };
  }
}

class UpdateFirewallPolicyResponse {
  /// The high-level properties of a firewall policy. This, along with the
  /// <a>FirewallPolicy</a>, define the policy. You can retrieve all objects for a
  /// firewall policy by calling <a>DescribeFirewallPolicy</a>.
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
  final String updateToken;

  UpdateFirewallPolicyResponse({
    required this.firewallPolicyResponse,
    required this.updateToken,
  });

  factory UpdateFirewallPolicyResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFirewallPolicyResponse(
      firewallPolicyResponse: FirewallPolicyResponse.fromJson(
          json['FirewallPolicyResponse'] as Map<String, dynamic>),
      updateToken: json['UpdateToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallPolicyResponse = this.firewallPolicyResponse;
    final updateToken = this.updateToken;
    return {
      'FirewallPolicyResponse': firewallPolicyResponse,
      'UpdateToken': updateToken,
    };
  }
}

class UpdateLoggingConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the firewall.
  final String? firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  final String? firewallName;
  final LoggingConfiguration? loggingConfiguration;

  UpdateLoggingConfigurationResponse({
    this.firewallArn,
    this.firewallName,
    this.loggingConfiguration,
  });

  factory UpdateLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateLoggingConfigurationResponse(
      firewallArn: json['FirewallArn'] as String?,
      firewallName: json['FirewallName'] as String?,
      loggingConfiguration: json['LoggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['LoggingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallArn = this.firewallArn;
    final firewallName = this.firewallName;
    final loggingConfiguration = this.loggingConfiguration;
    return {
      if (firewallArn != null) 'FirewallArn': firewallArn,
      if (firewallName != null) 'FirewallName': firewallName,
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
    };
  }
}

class UpdateRuleGroupResponse {
  /// The high-level properties of a rule group. This, along with the
  /// <a>RuleGroup</a>, define the rule group. You can retrieve all objects for a
  /// rule group by calling <a>DescribeRuleGroup</a>.
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
  final String updateToken;

  UpdateRuleGroupResponse({
    required this.ruleGroupResponse,
    required this.updateToken,
  });

  factory UpdateRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRuleGroupResponse(
      ruleGroupResponse: RuleGroupResponse.fromJson(
          json['RuleGroupResponse'] as Map<String, dynamic>),
      updateToken: json['UpdateToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleGroupResponse = this.ruleGroupResponse;
    final updateToken = this.updateToken;
    return {
      'RuleGroupResponse': ruleGroupResponse,
      'UpdateToken': updateToken,
    };
  }
}

class UpdateSubnetChangeProtectionResponse {
  /// The Amazon Resource Name (ARN) of the firewall.
  final String? firewallArn;

  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
  final String? firewallName;

  /// A setting indicating whether the firewall is protected against changes to
  /// the subnet associations. Use this setting to protect against accidentally
  /// modifying the subnet associations for a firewall that is in use. When you
  /// create a firewall, the operation initializes this setting to
  /// <code>TRUE</code>.
  final bool? subnetChangeProtection;

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
  final String? updateToken;

  UpdateSubnetChangeProtectionResponse({
    this.firewallArn,
    this.firewallName,
    this.subnetChangeProtection,
    this.updateToken,
  });

  factory UpdateSubnetChangeProtectionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateSubnetChangeProtectionResponse(
      firewallArn: json['FirewallArn'] as String?,
      firewallName: json['FirewallName'] as String?,
      subnetChangeProtection: json['SubnetChangeProtection'] as bool?,
      updateToken: json['UpdateToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallArn = this.firewallArn;
    final firewallName = this.firewallName;
    final subnetChangeProtection = this.subnetChangeProtection;
    final updateToken = this.updateToken;
    return {
      if (firewallArn != null) 'FirewallArn': firewallArn,
      if (firewallName != null) 'FirewallName': firewallName,
      if (subnetChangeProtection != null)
        'SubnetChangeProtection': subnetChangeProtection,
      if (updateToken != null) 'UpdateToken': updateToken,
    };
  }
}

class InsufficientCapacityException extends _s.GenericAwsException {
  InsufficientCapacityException({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientCapacityException',
            message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String? type, String? message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class InvalidResourcePolicyException extends _s.GenericAwsException {
  InvalidResourcePolicyException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidResourcePolicyException',
            message: message);
}

class InvalidTokenException extends _s.GenericAwsException {
  InvalidTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidTokenException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class LogDestinationPermissionException extends _s.GenericAwsException {
  LogDestinationPermissionException({String? type, String? message})
      : super(
            type: type,
            code: 'LogDestinationPermissionException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceOwnerCheckException extends _s.GenericAwsException {
  ResourceOwnerCheckException({String? type, String? message})
      : super(
            type: type, code: 'ResourceOwnerCheckException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String? type, String? message})
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
