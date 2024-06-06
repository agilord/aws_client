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

/// This is the API Reference for Network Firewall. This guide is for developers
/// who need detailed information about the Network Firewall API actions, data
/// types, and errors.
///
/// <ul>
/// <li>
/// The REST API requires you to handle connection details, such as calculating
/// signatures, handling request retries, and error handling. For general
/// information about using the Amazon Web Services REST APIs, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/aws-apis.html">Amazon
/// Web Services APIs</a>.
///
/// To access Network Firewall using the REST API endpoint:
/// <code>https://network-firewall.&lt;region&gt;.amazonaws.com </code>
/// </li>
/// <li>
/// Alternatively, you can use one of the Amazon Web Services SDKs to access an
/// API that's tailored to the programming language or platform that you're
/// using. For more information, see <a
/// href="http://aws.amazon.com/tools/#SDKs">Amazon Web Services SDKs</a>.
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
/// gateway, NAT gateway, or over VPN or Direct Connect. Network Firewall uses
/// rules that are compatible with Suricata, a free, open source network
/// analysis and threat detection engine. Network Firewall supports Suricata
/// version 6.0.9. For information about Suricata, see the <a
/// href="https://suricata.io/">Suricata website</a>.
///
/// You can use Network Firewall to monitor and protect your VPC traffic in a
/// number of ways. The following are just a few examples:
///
/// <ul>
/// <li>
/// Allow domains or IP addresses for known Amazon Web Services service
/// endpoints, such as Amazon S3, and block all other forms of traffic.
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
    _s.AwsClientCredentialsProvider? credentialsProvider,
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
  /// This request creates an Network Firewall firewall endpoint in each of the
  /// subnets. To enable the firewall's protections, you must also modify the
  /// VPC's route tables for each subnet's Availability Zone, to redirect the
  /// traffic that's coming into and going out of the zone through the firewall
  /// endpoint.
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

  /// Creates an Network Firewall <a>Firewall</a> and accompanying
  /// <a>FirewallStatus</a> for a VPC.
  ///
  /// The firewall defines the configuration settings for an Network Firewall
  /// firewall. The settings that you can define at creation include the
  /// firewall policy, the subnets in your VPC to use for the firewall
  /// endpoints, and any tags that are attached to the firewall Amazon Web
  /// Services resource.
  ///
  /// After you create a firewall, you can provide additional settings, like the
  /// logging configuration.
  ///
  /// To update the settings for a firewall, you use the operations that apply
  /// to the settings themselves, for example <a>UpdateLoggingConfiguration</a>,
  /// <a>AssociateSubnets</a>, and <a>UpdateFirewallDeleteProtection</a>.
  ///
  /// To manage a firewall's tags, use the standard Amazon Web Services resource
  /// tagging operations, <a>ListTagsForResource</a>, <a>TagResource</a>, and
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
  /// Parameter [encryptionConfiguration] :
  /// A complex type that contains settings for encryption of your firewall
  /// resources.
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
    EncryptionConfiguration? encryptionConfiguration,
    bool? firewallPolicyChangeProtection,
    bool? subnetChangeProtection,
    List<Tag>? tags,
  }) async {
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
        if (encryptionConfiguration != null)
          'EncryptionConfiguration': encryptionConfiguration,
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
  /// An Network Firewall firewall policy defines the behavior of a firewall, in
  /// a collection of stateless and stateful rule groups and other settings. You
  /// can use one firewall policy for multiple firewalls.
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
  /// Parameter [encryptionConfiguration] :
  /// A complex type that contains settings for encryption of your firewall
  /// policy resources.
  ///
  /// Parameter [tags] :
  /// The key:value pairs to associate with the resource.
  Future<CreateFirewallPolicyResponse> createFirewallPolicy({
    required FirewallPolicy firewallPolicy,
    required String firewallPolicyName,
    String? description,
    bool? dryRun,
    EncryptionConfiguration? encryptionConfiguration,
    List<Tag>? tags,
  }) async {
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
        if (encryptionConfiguration != null)
          'EncryptionConfiguration': encryptionConfiguration,
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
  /// Parameter [analyzeRuleGroup] :
  /// Indicates whether you want Network Firewall to analyze the stateless rules
  /// in the rule group for rule behavior such as asymmetric routing. If set to
  /// <code>TRUE</code>, Network Firewall runs the analysis and then creates the
  /// rule group for you. To run the stateless rule group analyzer without
  /// creating the rule group, set <code>DryRun</code> to <code>TRUE</code>.
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
  /// Parameter [encryptionConfiguration] :
  /// A complex type that contains settings for encryption of your rule group
  /// resources.
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
  /// Parameter [sourceMetadata] :
  /// A complex type that contains metadata about the rule group that your own
  /// rule group is copied from. You can use the metadata to keep track of
  /// updates made to the originating rule group.
  ///
  /// Parameter [tags] :
  /// The key:value pairs to associate with the resource.
  Future<CreateRuleGroupResponse> createRuleGroup({
    required int capacity,
    required String ruleGroupName,
    required RuleGroupType type,
    bool? analyzeRuleGroup,
    String? description,
    bool? dryRun,
    EncryptionConfiguration? encryptionConfiguration,
    RuleGroup? ruleGroup,
    String? rules,
    SourceMetadata? sourceMetadata,
    List<Tag>? tags,
  }) async {
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
        if (analyzeRuleGroup != null) 'AnalyzeRuleGroup': analyzeRuleGroup,
        if (description != null) 'Description': description,
        if (dryRun != null) 'DryRun': dryRun,
        if (encryptionConfiguration != null)
          'EncryptionConfiguration': encryptionConfiguration,
        if (ruleGroup != null) 'RuleGroup': ruleGroup,
        if (rules != null) 'Rules': rules,
        if (sourceMetadata != null) 'SourceMetadata': sourceMetadata,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Network Firewall TLS inspection configuration. A TLS inspection
  /// configuration contains Certificate Manager certificate associations
  /// between and the scope configurations that Network Firewall uses to decrypt
  /// and re-encrypt traffic traveling through your firewall.
  ///
  /// After you create a TLS inspection configuration, you can associate it with
  /// a new firewall policy.
  ///
  /// To update the settings for a TLS inspection configuration, use
  /// <a>UpdateTLSInspectionConfiguration</a>.
  ///
  /// To manage a TLS inspection configuration's tags, use the standard Amazon
  /// Web Services resource tagging operations, <a>ListTagsForResource</a>,
  /// <a>TagResource</a>, and <a>UntagResource</a>.
  ///
  /// To retrieve information about TLS inspection configurations, use
  /// <a>ListTLSInspectionConfigurations</a> and
  /// <a>DescribeTLSInspectionConfiguration</a>.
  ///
  /// For more information about TLS inspection configurations, see <a
  /// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection.html">Inspecting
  /// SSL/TLS traffic with TLS inspection configurations</a> in the <i>Network
  /// Firewall Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [LimitExceededException].
  /// May throw [InsufficientCapacityException].
  ///
  /// Parameter [tLSInspectionConfiguration] :
  /// The object that defines a TLS inspection configuration. This, along with
  /// <a>TLSInspectionConfigurationResponse</a>, define the TLS inspection
  /// configuration. You can retrieve all objects for a TLS inspection
  /// configuration by calling <a>DescribeTLSInspectionConfiguration</a>.
  ///
  /// Network Firewall uses a TLS inspection configuration to decrypt traffic.
  /// Network Firewall re-encrypts the traffic before sending it to its
  /// destination.
  ///
  /// To use a TLS inspection configuration, you add it to a new Network
  /// Firewall firewall policy, then you apply the firewall policy to a
  /// firewall. Network Firewall acts as a proxy service to decrypt and inspect
  /// the traffic traveling through your firewalls. You can reference a TLS
  /// inspection configuration from more than one firewall policy, and you can
  /// use a firewall policy in more than one firewall. For more information
  /// about using TLS inspection configurations, see <a
  /// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection.html">Inspecting
  /// SSL/TLS traffic with TLS inspection configurations</a> in the <i>Network
  /// Firewall Developer Guide</i>.
  ///
  /// Parameter [tLSInspectionConfigurationName] :
  /// The descriptive name of the TLS inspection configuration. You can't change
  /// the name of a TLS inspection configuration after you create it.
  ///
  /// Parameter [description] :
  /// A description of the TLS inspection configuration.
  ///
  /// Parameter [tags] :
  /// The key:value pairs to associate with the resource.
  Future<CreateTLSInspectionConfigurationResponse>
      createTLSInspectionConfiguration({
    required TLSInspectionConfiguration tLSInspectionConfiguration,
    required String tLSInspectionConfigurationName,
    String? description,
    EncryptionConfiguration? encryptionConfiguration,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'NetworkFirewall_20201112.CreateTLSInspectionConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TLSInspectionConfiguration': tLSInspectionConfiguration,
        'TLSInspectionConfigurationName': tLSInspectionConfigurationName,
        if (description != null) 'Description': description,
        if (encryptionConfiguration != null)
          'EncryptionConfiguration': encryptionConfiguration,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateTLSInspectionConfigurationResponse.fromJson(jsonResponse.body);
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
  /// May throw [InvalidResourcePolicyException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the rule group or firewall policy whose
  /// resource policy you want to delete.
  Future<void> deleteResourcePolicy({
    required String resourceArn,
  }) async {
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

  /// Deletes the specified <a>TLSInspectionConfiguration</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [tLSInspectionConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the TLS inspection configuration.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [tLSInspectionConfigurationName] :
  /// The descriptive name of the TLS inspection configuration. You can't change
  /// the name of a TLS inspection configuration after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  Future<DeleteTLSInspectionConfigurationResponse>
      deleteTLSInspectionConfiguration({
    String? tLSInspectionConfigurationArn,
    String? tLSInspectionConfigurationName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'NetworkFirewall_20201112.DeleteTLSInspectionConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (tLSInspectionConfigurationArn != null)
          'TLSInspectionConfigurationArn': tLSInspectionConfigurationArn,
        if (tLSInspectionConfigurationName != null)
          'TLSInspectionConfigurationName': tLSInspectionConfigurationName,
      },
    );

    return DeleteTLSInspectionConfigurationResponse.fromJson(jsonResponse.body);
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
  /// Parameter [analyzeRuleGroup] :
  /// Indicates whether you want Network Firewall to analyze the stateless rules
  /// in the rule group for rule behavior such as asymmetric routing. If set to
  /// <code>TRUE</code>, Network Firewall runs the analysis.
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
    bool? analyzeRuleGroup,
    String? ruleGroupArn,
    String? ruleGroupName,
    RuleGroupType? type,
  }) async {
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
        if (analyzeRuleGroup != null) 'AnalyzeRuleGroup': analyzeRuleGroup,
        if (ruleGroupArn != null) 'RuleGroupArn': ruleGroupArn,
        if (ruleGroupName != null) 'RuleGroupName': ruleGroupName,
        if (type != null) 'Type': type.toValue(),
      },
    );

    return DescribeRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// High-level information about a rule group, returned by operations like
  /// create and describe. You can use the information provided in the metadata
  /// to retrieve and manage a rule group. You can retrieve all objects for a
  /// rule group by calling <a>DescribeRuleGroup</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [ruleGroupArn] :
  /// The descriptive name of the rule group. You can't change the name of a
  /// rule group after you create it.
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
  Future<DescribeRuleGroupMetadataResponse> describeRuleGroupMetadata({
    String? ruleGroupArn,
    String? ruleGroupName,
    RuleGroupType? type,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.DescribeRuleGroupMetadata'
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

    return DescribeRuleGroupMetadataResponse.fromJson(jsonResponse.body);
  }

  /// Returns the data objects for the specified TLS inspection configuration.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [tLSInspectionConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the TLS inspection configuration.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  ///
  /// Parameter [tLSInspectionConfigurationName] :
  /// The descriptive name of the TLS inspection configuration. You can't change
  /// the name of a TLS inspection configuration after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  Future<DescribeTLSInspectionConfigurationResponse>
      describeTLSInspectionConfiguration({
    String? tLSInspectionConfigurationArn,
    String? tLSInspectionConfigurationName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'NetworkFirewall_20201112.DescribeTLSInspectionConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (tLSInspectionConfigurationArn != null)
          'TLSInspectionConfigurationArn': tLSInspectionConfigurationArn,
        if (tLSInspectionConfigurationName != null)
          'TLSInspectionConfigurationName': tLSInspectionConfigurationName,
      },
    );

    return DescribeTLSInspectionConfigurationResponse.fromJson(
        jsonResponse.body);
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
  /// Parameter [managedType] :
  /// Indicates the general category of the Amazon Web Services managed rule
  /// group.
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
  /// Parameter [scope] :
  /// The scope of the request. The default setting of <code>ACCOUNT</code> or a
  /// setting of <code>NULL</code> returns all of the rule groups in your
  /// account. A setting of <code>MANAGED</code> returns all available managed
  /// rule groups.
  ///
  /// Parameter [type] :
  /// Indicates whether the rule group is stateless or stateful. If the rule
  /// group is stateless, it contains stateless rules. If it is stateful, it
  /// contains stateful rules.
  Future<ListRuleGroupsResponse> listRuleGroups({
    ResourceManagedType? managedType,
    int? maxResults,
    String? nextToken,
    ResourceManagedStatus? scope,
    RuleGroupType? type,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
        if (managedType != null) 'ManagedType': managedType.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (scope != null) 'Scope': scope.toValue(),
        if (type != null) 'Type': type.toValue(),
      },
    );

    return ListRuleGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the metadata for the TLS inspection configurations that you have
  /// defined. Depending on your setting for max results and the number of TLS
  /// inspection configurations, a single call might not return the full list.
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
  Future<ListTLSInspectionConfigurationsResponse>
      listTLSInspectionConfigurations({
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'NetworkFirewall_20201112.ListTLSInspectionConfigurations'
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

    return ListTLSInspectionConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the tags associated with the specified resource. Tags are
  /// key:value pairs that you can use to categorize and manage your resources,
  /// for purposes like billing. For example, you might set the tag key to
  /// "customer" and the value to the customer name or ID. You can specify one
  /// or more tags to add to each Amazon Web Services resource, up to 50 tags
  /// for a resource.
  ///
  /// You can tag the Amazon Web Services resources that you manage through
  /// Network Firewall: firewalls, firewall policies, and rule groups.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
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

  /// Creates or updates an IAM policy for your rule group or firewall policy.
  /// Use this to share rule groups and firewall policies between accounts. This
  /// operation works in conjunction with the Amazon Web Services Resource
  /// Access Manager (RAM) service to manage resource sharing for Network
  /// Firewall.
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
  /// href="https://docs.aws.amazon.com/ram/latest/userguide/what-is.html">Resource
  /// Access Manager User Guide</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidResourcePolicyException].
  ///
  /// Parameter [policy] :
  /// The IAM policy statement that lists the accounts that you want to share
  /// your rule group or firewall policy with and the operations that you want
  /// the accounts to be able to perform.
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
  /// or more tags to add to each Amazon Web Services resource, up to 50 tags
  /// for a resource.
  ///
  /// You can tag the Amazon Web Services resources that you manage through
  /// Network Firewall: firewalls, firewall policies, and rule groups.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
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
  /// specify one or more tags to add to each Amazon Web Services resource, up
  /// to 50 tags for a resource.
  ///
  /// You can manage tags for the Amazon Web Services resources that you manage
  /// through Network Firewall: firewalls, firewall policies, and rule groups.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
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

  /// A complex type that contains settings for encryption of your firewall
  /// resources.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidTokenException].
  /// May throw [ResourceOwnerCheckException].
  ///
  /// Parameter [firewallArn] :
  /// The Amazon Resource Name (ARN) of the firewall.
  ///
  /// Parameter [firewallName] :
  /// The descriptive name of the firewall. You can't change the name of a
  /// firewall after you create it.
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
  Future<UpdateFirewallEncryptionConfigurationResponse>
      updateFirewallEncryptionConfiguration({
    EncryptionConfiguration? encryptionConfiguration,
    String? firewallArn,
    String? firewallName,
    String? updateToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'NetworkFirewall_20201112.UpdateFirewallEncryptionConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (encryptionConfiguration != null)
          'EncryptionConfiguration': encryptionConfiguration,
        if (firewallArn != null) 'FirewallArn': firewallArn,
        if (firewallName != null) 'FirewallName': firewallName,
        if (updateToken != null) 'UpdateToken': updateToken,
      },
    );

    return UpdateFirewallEncryptionConfigurationResponse.fromJson(
        jsonResponse.body);
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
  /// The updated firewall policy to use for the firewall. You can't add or
  /// remove a <a>TLSInspectionConfiguration</a> after you create a firewall
  /// policy. However, you can replace an existing TLS inspection configuration
  /// with another <code>TLSInspectionConfiguration</code>.
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
  /// Parameter [encryptionConfiguration] :
  /// A complex type that contains settings for encryption of your firewall
  /// policy resources.
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
    EncryptionConfiguration? encryptionConfiguration,
    String? firewallPolicyArn,
    String? firewallPolicyName,
  }) async {
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
        if (encryptionConfiguration != null)
          'EncryptionConfiguration': encryptionConfiguration,
        if (firewallPolicyArn != null) 'FirewallPolicyArn': firewallPolicyArn,
        if (firewallPolicyName != null)
          'FirewallPolicyName': firewallPolicyName,
      },
    );

    return UpdateFirewallPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the flag, <code>ChangeProtection</code>, which indicates whether
  /// it is possible to change the firewall. If the flag is set to
  /// <code>TRUE</code>, the firewall is protected from changes. This setting
  /// helps protect against accidentally changing a firewall that's in use.
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
  /// Parameter [analyzeRuleGroup] :
  /// Indicates whether you want Network Firewall to analyze the stateless rules
  /// in the rule group for rule behavior such as asymmetric routing. If set to
  /// <code>TRUE</code>, Network Firewall runs the analysis and then updates the
  /// rule group for you. To run the stateless rule group analyzer without
  /// updating the rule group, set <code>DryRun</code> to <code>TRUE</code>.
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
  /// Parameter [encryptionConfiguration] :
  /// A complex type that contains settings for encryption of your rule group
  /// resources.
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
  /// Parameter [sourceMetadata] :
  /// A complex type that contains metadata about the rule group that your own
  /// rule group is copied from. You can use the metadata to keep track of
  /// updates made to the originating rule group.
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
    bool? analyzeRuleGroup,
    String? description,
    bool? dryRun,
    EncryptionConfiguration? encryptionConfiguration,
    RuleGroup? ruleGroup,
    String? ruleGroupArn,
    String? ruleGroupName,
    String? rules,
    SourceMetadata? sourceMetadata,
    RuleGroupType? type,
  }) async {
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
        if (analyzeRuleGroup != null) 'AnalyzeRuleGroup': analyzeRuleGroup,
        if (description != null) 'Description': description,
        if (dryRun != null) 'DryRun': dryRun,
        if (encryptionConfiguration != null)
          'EncryptionConfiguration': encryptionConfiguration,
        if (ruleGroup != null) 'RuleGroup': ruleGroup,
        if (ruleGroupArn != null) 'RuleGroupArn': ruleGroupArn,
        if (ruleGroupName != null) 'RuleGroupName': ruleGroupName,
        if (rules != null) 'Rules': rules,
        if (sourceMetadata != null) 'SourceMetadata': sourceMetadata,
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

  /// Updates the TLS inspection configuration settings for the specified TLS
  /// inspection configuration. You use a TLS inspection configuration by
  /// referencing it in one or more firewall policies. When you modify a TLS
  /// inspection configuration, you modify all firewall policies that use the
  /// TLS inspection configuration.
  ///
  /// To update a TLS inspection configuration, first call
  /// <a>DescribeTLSInspectionConfiguration</a> to retrieve the current
  /// <a>TLSInspectionConfiguration</a> object, update the object as needed, and
  /// then provide the updated object to this call.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [InvalidTokenException].
  ///
  /// Parameter [tLSInspectionConfiguration] :
  /// The object that defines a TLS inspection configuration. This, along with
  /// <a>TLSInspectionConfigurationResponse</a>, define the TLS inspection
  /// configuration. You can retrieve all objects for a TLS inspection
  /// configuration by calling <a>DescribeTLSInspectionConfiguration</a>.
  ///
  /// Network Firewall uses a TLS inspection configuration to decrypt traffic.
  /// Network Firewall re-encrypts the traffic before sending it to its
  /// destination.
  ///
  /// To use a TLS inspection configuration, you add it to a new Network
  /// Firewall firewall policy, then you apply the firewall policy to a
  /// firewall. Network Firewall acts as a proxy service to decrypt and inspect
  /// the traffic traveling through your firewalls. You can reference a TLS
  /// inspection configuration from more than one firewall policy, and you can
  /// use a firewall policy in more than one firewall. For more information
  /// about using TLS inspection configurations, see <a
  /// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection.html">Inspecting
  /// SSL/TLS traffic with TLS inspection configurations</a> in the <i>Network
  /// Firewall Developer Guide</i>.
  ///
  /// Parameter [updateToken] :
  /// A token used for optimistic locking. Network Firewall returns a token to
  /// your requests that access the TLS inspection configuration. The token
  /// marks the state of the TLS inspection configuration resource at the time
  /// of the request.
  ///
  /// To make changes to the TLS inspection configuration, you provide the token
  /// in your request. Network Firewall uses the token to ensure that the TLS
  /// inspection configuration hasn't changed since you last retrieved it. If it
  /// has changed, the operation fails with an
  /// <code>InvalidTokenException</code>. If this happens, retrieve the TLS
  /// inspection configuration again to get a current copy of it with a current
  /// token. Reapply your changes as needed, then try the operation again using
  /// the new token.
  ///
  /// Parameter [description] :
  /// A description of the TLS inspection configuration.
  ///
  /// Parameter [encryptionConfiguration] :
  /// A complex type that contains the Amazon Web Services KMS encryption
  /// configuration settings for your TLS inspection configuration.
  ///
  /// Parameter [tLSInspectionConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the TLS inspection configuration.
  ///
  /// Parameter [tLSInspectionConfigurationName] :
  /// The descriptive name of the TLS inspection configuration. You can't change
  /// the name of a TLS inspection configuration after you create it.
  Future<UpdateTLSInspectionConfigurationResponse>
      updateTLSInspectionConfiguration({
    required TLSInspectionConfiguration tLSInspectionConfiguration,
    required String updateToken,
    String? description,
    EncryptionConfiguration? encryptionConfiguration,
    String? tLSInspectionConfigurationArn,
    String? tLSInspectionConfigurationName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'NetworkFirewall_20201112.UpdateTLSInspectionConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TLSInspectionConfiguration': tLSInspectionConfiguration,
        'UpdateToken': updateToken,
        if (description != null) 'Description': description,
        if (encryptionConfiguration != null)
          'EncryptionConfiguration': encryptionConfiguration,
        if (tLSInspectionConfigurationArn != null)
          'TLSInspectionConfigurationArn': tLSInspectionConfigurationArn,
        if (tLSInspectionConfigurationName != null)
          'TLSInspectionConfigurationName': tLSInspectionConfigurationName,
      },
    );

    return UpdateTLSInspectionConfigurationResponse.fromJson(jsonResponse.body);
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
  /// IPv4 and IPv6.
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
  /// <li>
  /// To configure Network Firewall to inspect for the IP address
  /// 1111:0000:0000:0000:0000:0000:0000:0111, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0111/128</code>.
  /// </li>
  /// <li>
  /// To configure Network Firewall to inspect for IP addresses from
  /// 1111:0000:0000:0000:0000:0000:0000:0000 to
  /// 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0000/64</code>.
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

/// The analysis result for Network Firewall's stateless rule group analyzer.
/// Every time you call <a>CreateRuleGroup</a>, <a>UpdateRuleGroup</a>, or
/// <a>DescribeRuleGroup</a> on a stateless rule group, Network Firewall
/// analyzes the stateless rule groups in your account and identifies the rules
/// that might adversely effect your firewall's functionality. For example, if
/// Network Firewall detects a rule that's routing traffic asymmetrically, which
/// impacts the service's ability to properly process traffic, the service
/// includes the rule in a list of analysis results.
class AnalysisResult {
  /// Provides analysis details for the identified rule.
  final String? analysisDetail;

  /// The priority number of the stateless rules identified in the analysis.
  final List<String>? identifiedRuleIds;

  /// The types of rule configurations that Network Firewall analyzes your rule
  /// groups for. Network Firewall analyzes stateless rule groups for the
  /// following types of rule configurations:
  ///
  /// <ul>
  /// <li>
  /// <code>STATELESS_RULE_FORWARDING_ASYMMETRICALLY</code>
  ///
  /// Cause: One or more stateless rules with the action <code>pass</code> or
  /// <code>forward</code> are forwarding traffic asymmetrically. Specifically,
  /// the rule's set of source IP addresses or their associated port numbers,
  /// don't match the set of destination IP addresses or their associated port
  /// numbers.
  ///
  /// To mitigate: Make sure that there's an existing return path. For example, if
  /// the rule allows traffic from source 10.1.0.0/24 to destination 20.1.0.0/24,
  /// you should allow return traffic from source 20.1.0.0/24 to destination
  /// 10.1.0.0/24.
  /// </li>
  /// <li>
  /// <code>STATELESS_RULE_CONTAINS_TCP_FLAGS</code>
  ///
  /// Cause: At least one stateless rule with the action <code>pass</code>
  /// or<code>forward</code> contains TCP flags that are inconsistent in the
  /// forward and return directions.
  ///
  /// To mitigate: Prevent asymmetric routing issues caused by TCP flags by
  /// following these actions:
  ///
  /// <ul>
  /// <li>
  /// Remove unnecessary TCP flag inspections from the rules.
  /// </li>
  /// <li>
  /// If you need to inspect TCP flags, check that the rules correctly account for
  /// changes in TCP flags throughout the TCP connection cycle, for example
  /// <code>SYN</code> and <code>ACK</code> flags used in a 3-way TCP handshake.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final IdentifiedType? identifiedType;

  AnalysisResult({
    this.analysisDetail,
    this.identifiedRuleIds,
    this.identifiedType,
  });

  factory AnalysisResult.fromJson(Map<String, dynamic> json) {
    return AnalysisResult(
      analysisDetail: json['AnalysisDetail'] as String?,
      identifiedRuleIds: (json['IdentifiedRuleIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      identifiedType: (json['IdentifiedType'] as String?)?.toIdentifiedType(),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisDetail = this.analysisDetail;
    final identifiedRuleIds = this.identifiedRuleIds;
    final identifiedType = this.identifiedType;
    return {
      if (analysisDetail != null) 'AnalysisDetail': analysisDetail,
      if (identifiedRuleIds != null) 'IdentifiedRuleIds': identifiedRuleIds,
      if (identifiedType != null) 'IdentifiedType': identifiedType.toValue(),
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
/// use by the Network Firewall firewall. This is part of the
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
  /// <code>CREATING</code> or <code>DELETING</code>.
  final AttachmentStatus? status;

  /// If Network Firewall fails to create or delete the firewall endpoint in the
  /// subnet, it populates this with the reason for the error or failure and how
  /// to resolve it. A <code>FAILED</code> status indicates a non-recoverable
  /// state, and a <code>ERROR</code> status indicates an issue that you can fix.
  /// Depending on the error, it can take as many as 15 minutes to populate this
  /// field. For more information about the causes for failiure or errors and
  /// solutions available for this field, see <a
  /// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/firewall-troubleshooting-endpoint-failures.html">Troubleshooting
  /// firewall endpoint failures</a> in the <i>Network Firewall Developer
  /// Guide</i>.
  final String? statusMessage;

  /// The unique identifier of the subnet that you've specified to be used for a
  /// firewall endpoint.
  final String? subnetId;

  Attachment({
    this.endpointId,
    this.status,
    this.statusMessage,
    this.subnetId,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      endpointId: json['EndpointId'] as String?,
      status: (json['Status'] as String?)?.toAttachmentStatus(),
      statusMessage: json['StatusMessage'] as String?,
      subnetId: json['SubnetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpointId = this.endpointId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final subnetId = this.subnetId;
    return {
      if (endpointId != null) 'EndpointId': endpointId,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (subnetId != null) 'SubnetId': subnetId,
    };
  }
}

enum AttachmentStatus {
  creating,
  deleting,
  failed,
  error,
  scaling,
  ready,
}

extension AttachmentStatusValueExtension on AttachmentStatus {
  String toValue() {
    switch (this) {
      case AttachmentStatus.creating:
        return 'CREATING';
      case AttachmentStatus.deleting:
        return 'DELETING';
      case AttachmentStatus.failed:
        return 'FAILED';
      case AttachmentStatus.error:
        return 'ERROR';
      case AttachmentStatus.scaling:
        return 'SCALING';
      case AttachmentStatus.ready:
        return 'READY';
    }
  }
}

extension AttachmentStatusFromString on String {
  AttachmentStatus toAttachmentStatus() {
    switch (this) {
      case 'CREATING':
        return AttachmentStatus.creating;
      case 'DELETING':
        return AttachmentStatus.deleting;
      case 'FAILED':
        return AttachmentStatus.failed;
      case 'ERROR':
        return AttachmentStatus.error;
      case 'SCALING':
        return AttachmentStatus.scaling;
      case 'READY':
        return AttachmentStatus.ready;
    }
    throw Exception('$this is not known in enum AttachmentStatus');
  }
}

/// Summarizes the CIDR blocks used by the IP set references in a firewall.
/// Network Firewall calculates the number of CIDRs by taking an aggregated
/// count of all CIDRs used by the IP sets you are referencing.
class CIDRSummary {
  /// The number of CIDR blocks available for use by the IP set references in a
  /// firewall.
  final int? availableCIDRCount;

  /// The list of the IP set references used by a firewall.
  final Map<String, IPSetMetadata>? iPSetReferences;

  /// The number of CIDR blocks used by the IP set references in a firewall.
  final int? utilizedCIDRCount;

  CIDRSummary({
    this.availableCIDRCount,
    this.iPSetReferences,
    this.utilizedCIDRCount,
  });

  factory CIDRSummary.fromJson(Map<String, dynamic> json) {
    return CIDRSummary(
      availableCIDRCount: json['AvailableCIDRCount'] as int?,
      iPSetReferences: (json['IPSetReferences'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, IPSetMetadata.fromJson(e as Map<String, dynamic>))),
      utilizedCIDRCount: json['UtilizedCIDRCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final availableCIDRCount = this.availableCIDRCount;
    final iPSetReferences = this.iPSetReferences;
    final utilizedCIDRCount = this.utilizedCIDRCount;
    return {
      if (availableCIDRCount != null) 'AvailableCIDRCount': availableCIDRCount,
      if (iPSetReferences != null) 'IPSetReferences': iPSetReferences,
      if (utilizedCIDRCount != null) 'UtilizedCIDRCount': utilizedCIDRCount,
    };
  }
}

/// The capacity usage summary of the resources used by the <a>ReferenceSets</a>
/// in a firewall.
class CapacityUsageSummary {
  /// Describes the capacity usage of the CIDR blocks used by the IP set
  /// references in a firewall.
  final CIDRSummary? cIDRs;

  CapacityUsageSummary({
    this.cIDRs,
  });

  factory CapacityUsageSummary.fromJson(Map<String, dynamic> json) {
    return CapacityUsageSummary(
      cIDRs: json['CIDRs'] != null
          ? CIDRSummary.fromJson(json['CIDRs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cIDRs = this.cIDRs;
    return {
      if (cIDRs != null) 'CIDRs': cIDRs,
    };
  }
}

/// Defines the actions to take on the SSL/TLS connection if the certificate
/// presented by the server in the connection has a revoked or unknown status.
class CheckCertificateRevocationStatusActions {
  /// Configures how Network Firewall processes traffic when it determines that
  /// the certificate presented by the server in the SSL/TLS connection has a
  /// revoked status.
  ///
  /// <ul>
  /// <li>
  /// <b>PASS</b> - Allow the connection to continue, and pass subsequent packets
  /// to the stateful engine for inspection.
  /// </li>
  /// <li>
  /// <b>DROP</b> - Network Firewall closes the connection and drops subsequent
  /// packets for that connection.
  /// </li>
  /// <li>
  /// <b>REJECT</b> - Network Firewall sends a TCP reject packet back to your
  /// client. The service closes the connection and drops subsequent packets for
  /// that connection. <code>REJECT</code> is available only for TCP traffic.
  /// </li>
  /// </ul>
  final RevocationCheckAction? revokedStatusAction;

  /// Configures how Network Firewall processes traffic when it determines that
  /// the certificate presented by the server in the SSL/TLS connection has an
  /// unknown status, or a status that cannot be determined for any other reason,
  /// including when the service is unable to connect to the OCSP and CRL
  /// endpoints for the certificate.
  ///
  /// <ul>
  /// <li>
  /// <b>PASS</b> - Allow the connection to continue, and pass subsequent packets
  /// to the stateful engine for inspection.
  /// </li>
  /// <li>
  /// <b>DROP</b> - Network Firewall closes the connection and drops subsequent
  /// packets for that connection.
  /// </li>
  /// <li>
  /// <b>REJECT</b> - Network Firewall sends a TCP reject packet back to your
  /// client. The service closes the connection and drops subsequent packets for
  /// that connection. <code>REJECT</code> is available only for TCP traffic.
  /// </li>
  /// </ul>
  final RevocationCheckAction? unknownStatusAction;

  CheckCertificateRevocationStatusActions({
    this.revokedStatusAction,
    this.unknownStatusAction,
  });

  factory CheckCertificateRevocationStatusActions.fromJson(
      Map<String, dynamic> json) {
    return CheckCertificateRevocationStatusActions(
      revokedStatusAction:
          (json['RevokedStatusAction'] as String?)?.toRevocationCheckAction(),
      unknownStatusAction:
          (json['UnknownStatusAction'] as String?)?.toRevocationCheckAction(),
    );
  }

  Map<String, dynamic> toJson() {
    final revokedStatusAction = this.revokedStatusAction;
    final unknownStatusAction = this.unknownStatusAction;
    return {
      if (revokedStatusAction != null)
        'RevokedStatusAction': revokedStatusAction.toValue(),
      if (unknownStatusAction != null)
        'UnknownStatusAction': unknownStatusAction.toValue(),
    };
  }
}

enum ConfigurationSyncState {
  pending,
  inSync,
  capacityConstrained,
}

extension ConfigurationSyncStateValueExtension on ConfigurationSyncState {
  String toValue() {
    switch (this) {
      case ConfigurationSyncState.pending:
        return 'PENDING';
      case ConfigurationSyncState.inSync:
        return 'IN_SYNC';
      case ConfigurationSyncState.capacityConstrained:
        return 'CAPACITY_CONSTRAINED';
    }
  }
}

extension ConfigurationSyncStateFromString on String {
  ConfigurationSyncState toConfigurationSyncState() {
    switch (this) {
      case 'PENDING':
        return ConfigurationSyncState.pending;
      case 'IN_SYNC':
        return ConfigurationSyncState.inSync;
      case 'CAPACITY_CONSTRAINED':
        return ConfigurationSyncState.capacityConstrained;
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

class CreateTLSInspectionConfigurationResponse {
  /// The high-level properties of a TLS inspection configuration. This, along
  /// with the <a>TLSInspectionConfiguration</a>, define the TLS inspection
  /// configuration. You can retrieve all objects for a TLS inspection
  /// configuration by calling <a>DescribeTLSInspectionConfiguration</a>.
  final TLSInspectionConfigurationResponse tLSInspectionConfigurationResponse;

  /// A token used for optimistic locking. Network Firewall returns a token to
  /// your requests that access the TLS inspection configuration. The token marks
  /// the state of the TLS inspection configuration resource at the time of the
  /// request.
  ///
  /// To make changes to the TLS inspection configuration, you provide the token
  /// in your request. Network Firewall uses the token to ensure that the TLS
  /// inspection configuration hasn't changed since you last retrieved it. If it
  /// has changed, the operation fails with an <code>InvalidTokenException</code>.
  /// If this happens, retrieve the TLS inspection configuration again to get a
  /// current copy of it with a current token. Reapply your changes as needed,
  /// then try the operation again using the new token.
  final String updateToken;

  CreateTLSInspectionConfigurationResponse({
    required this.tLSInspectionConfigurationResponse,
    required this.updateToken,
  });

  factory CreateTLSInspectionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateTLSInspectionConfigurationResponse(
      tLSInspectionConfigurationResponse:
          TLSInspectionConfigurationResponse.fromJson(
              json['TLSInspectionConfigurationResponse']
                  as Map<String, dynamic>),
      updateToken: json['UpdateToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final tLSInspectionConfigurationResponse =
        this.tLSInspectionConfigurationResponse;
    final updateToken = this.updateToken;
    return {
      'TLSInspectionConfigurationResponse': tLSInspectionConfigurationResponse,
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

class DeleteTLSInspectionConfigurationResponse {
  /// The high-level properties of a TLS inspection configuration. This, along
  /// with the <a>TLSInspectionConfiguration</a>, define the TLS inspection
  /// configuration. You can retrieve all objects for a TLS inspection
  /// configuration by calling <a>DescribeTLSInspectionConfiguration</a>.
  final TLSInspectionConfigurationResponse tLSInspectionConfigurationResponse;

  DeleteTLSInspectionConfigurationResponse({
    required this.tLSInspectionConfigurationResponse,
  });

  factory DeleteTLSInspectionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteTLSInspectionConfigurationResponse(
      tLSInspectionConfigurationResponse:
          TLSInspectionConfigurationResponse.fromJson(
              json['TLSInspectionConfigurationResponse']
                  as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final tLSInspectionConfigurationResponse =
        this.tLSInspectionConfigurationResponse;
    return {
      'TLSInspectionConfigurationResponse': tLSInspectionConfigurationResponse,
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
  /// The IAM policy for the resource.
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

class DescribeRuleGroupMetadataResponse {
  /// The descriptive name of the rule group. You can't change the name of a rule
  /// group after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
  final String ruleGroupArn;

  /// The descriptive name of the rule group. You can't change the name of a rule
  /// group after you create it.
  ///
  /// You must specify the ARN or the name, and you can specify both.
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

  /// Returns the metadata objects for the specified rule group.
  final String? description;

  /// The last time that the rule group was changed.
  final DateTime? lastModifiedTime;
  final StatefulRuleOptions? statefulRuleOptions;

  /// Indicates whether the rule group is stateless or stateful. If the rule group
  /// is stateless, it contains stateless rules. If it is stateful, it contains
  /// stateful rules.
  /// <note>
  /// This setting is required for requests that do not include the
  /// <code>RuleGroupARN</code>.
  /// </note>
  final RuleGroupType? type;

  DescribeRuleGroupMetadataResponse({
    required this.ruleGroupArn,
    required this.ruleGroupName,
    this.capacity,
    this.description,
    this.lastModifiedTime,
    this.statefulRuleOptions,
    this.type,
  });

  factory DescribeRuleGroupMetadataResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRuleGroupMetadataResponse(
      ruleGroupArn: json['RuleGroupArn'] as String,
      ruleGroupName: json['RuleGroupName'] as String,
      capacity: json['Capacity'] as int?,
      description: json['Description'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      statefulRuleOptions: json['StatefulRuleOptions'] != null
          ? StatefulRuleOptions.fromJson(
              json['StatefulRuleOptions'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toRuleGroupType(),
    );
  }

  Map<String, dynamic> toJson() {
    final ruleGroupArn = this.ruleGroupArn;
    final ruleGroupName = this.ruleGroupName;
    final capacity = this.capacity;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final statefulRuleOptions = this.statefulRuleOptions;
    final type = this.type;
    return {
      'RuleGroupArn': ruleGroupArn,
      'RuleGroupName': ruleGroupName,
      if (capacity != null) 'Capacity': capacity,
      if (description != null) 'Description': description,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (statefulRuleOptions != null)
        'StatefulRuleOptions': statefulRuleOptions,
      if (type != null) 'Type': type.toValue(),
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
  /// Network Firewall uses a rule group to inspect and control network traffic.
  /// You define stateless rule groups to inspect individual packets and you
  /// define stateful rule groups to inspect packets in the context of their
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

class DescribeTLSInspectionConfigurationResponse {
  /// The high-level properties of a TLS inspection configuration. This, along
  /// with the <a>TLSInspectionConfiguration</a>, define the TLS inspection
  /// configuration. You can retrieve all objects for a TLS inspection
  /// configuration by calling <a>DescribeTLSInspectionConfiguration</a>.
  final TLSInspectionConfigurationResponse tLSInspectionConfigurationResponse;

  /// A token used for optimistic locking. Network Firewall returns a token to
  /// your requests that access the TLS inspection configuration. The token marks
  /// the state of the TLS inspection configuration resource at the time of the
  /// request.
  ///
  /// To make changes to the TLS inspection configuration, you provide the token
  /// in your request. Network Firewall uses the token to ensure that the TLS
  /// inspection configuration hasn't changed since you last retrieved it. If it
  /// has changed, the operation fails with an <code>InvalidTokenException</code>.
  /// If this happens, retrieve the TLS inspection configuration again to get a
  /// current copy of it with a current token. Reapply your changes as needed,
  /// then try the operation again using the new token.
  final String updateToken;

  /// The object that defines a TLS inspection configuration. This, along with
  /// <a>TLSInspectionConfigurationResponse</a>, define the TLS inspection
  /// configuration. You can retrieve all objects for a TLS inspection
  /// configuration by calling <a>DescribeTLSInspectionConfiguration</a>.
  ///
  /// Network Firewall uses a TLS inspection configuration to decrypt traffic.
  /// Network Firewall re-encrypts the traffic before sending it to its
  /// destination.
  ///
  /// To use a TLS inspection configuration, you add it to a new Network Firewall
  /// firewall policy, then you apply the firewall policy to a firewall. Network
  /// Firewall acts as a proxy service to decrypt and inspect the traffic
  /// traveling through your firewalls. You can reference a TLS inspection
  /// configuration from more than one firewall policy, and you can use a firewall
  /// policy in more than one firewall. For more information about using TLS
  /// inspection configurations, see <a
  /// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection.html">Inspecting
  /// SSL/TLS traffic with TLS inspection configurations</a> in the <i>Network
  /// Firewall Developer Guide</i>.
  final TLSInspectionConfiguration? tLSInspectionConfiguration;

  DescribeTLSInspectionConfigurationResponse({
    required this.tLSInspectionConfigurationResponse,
    required this.updateToken,
    this.tLSInspectionConfiguration,
  });

  factory DescribeTLSInspectionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeTLSInspectionConfigurationResponse(
      tLSInspectionConfigurationResponse:
          TLSInspectionConfigurationResponse.fromJson(
              json['TLSInspectionConfigurationResponse']
                  as Map<String, dynamic>),
      updateToken: json['UpdateToken'] as String,
      tLSInspectionConfiguration: json['TLSInspectionConfiguration'] != null
          ? TLSInspectionConfiguration.fromJson(
              json['TLSInspectionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tLSInspectionConfigurationResponse =
        this.tLSInspectionConfigurationResponse;
    final updateToken = this.updateToken;
    final tLSInspectionConfiguration = this.tLSInspectionConfiguration;
    return {
      'TLSInspectionConfigurationResponse': tLSInspectionConfigurationResponse,
      'UpdateToken': updateToken,
      if (tLSInspectionConfiguration != null)
        'TLSInspectionConfiguration': tLSInspectionConfiguration,
    };
  }
}

/// The value to use in an Amazon CloudWatch custom metric dimension. This is
/// used in the <code>PublishMetrics</code> <a>CustomAction</a>. A CloudWatch
/// custom metric dimension is a name/value pair that's part of the identity of
/// a metric.
///
/// Network Firewall sets the dimension name to <code>CustomAction</code> and
/// you provide the dimension value.
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

/// A complex type that contains optional Amazon Web Services Key Management
/// Service (KMS) encryption settings for your Network Firewall resources. Your
/// data is encrypted by default with an Amazon Web Services owned key that
/// Amazon Web Services owns and manages for you. You can use either the Amazon
/// Web Services owned key, or provide your own customer managed key. To learn
/// more about KMS encryption of your Network Firewall resources, see <a
/// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-encryption-at-rest.html">Encryption
/// at rest with Amazon Web Services Key Managment Service</a> in the <i>Network
/// Firewall Developer Guide</i>.
class EncryptionConfiguration {
  /// The type of Amazon Web Services KMS key to use for encryption of your
  /// Network Firewall resources.
  final EncryptionType type;

  /// The ID of the Amazon Web Services Key Management Service (KMS) customer
  /// managed key. You can use any of the key identifiers that KMS supports,
  /// unless you're using a key that's managed by another account. If you're using
  /// a key managed by another account, then specify the key ARN. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id">Key
  /// ID</a> in the <i>Amazon Web Services KMS Developer Guide</i>.
  final String? keyId;

  EncryptionConfiguration({
    required this.type,
    this.keyId,
  });

  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionConfiguration(
      type: (json['Type'] as String).toEncryptionType(),
      keyId: json['KeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final keyId = this.keyId;
    return {
      'Type': type.toValue(),
      if (keyId != null) 'KeyId': keyId,
    };
  }
}

enum EncryptionType {
  customerKms,
  awsOwnedKmsKey,
}

extension EncryptionTypeValueExtension on EncryptionType {
  String toValue() {
    switch (this) {
      case EncryptionType.customerKms:
        return 'CUSTOMER_KMS';
      case EncryptionType.awsOwnedKmsKey:
        return 'AWS_OWNED_KMS_KEY';
    }
  }
}

extension EncryptionTypeFromString on String {
  EncryptionType toEncryptionType() {
    switch (this) {
      case 'CUSTOMER_KMS':
        return EncryptionType.customerKms;
      case 'AWS_OWNED_KMS_KEY':
        return EncryptionType.awsOwnedKmsKey;
    }
    throw Exception('$this is not known in enum EncryptionType');
  }
}

/// The firewall defines the configuration settings for an Network Firewall
/// firewall. These settings include the firewall policy, the subnets in your
/// VPC to use for the firewall endpoints, and any tags that are attached to the
/// firewall Amazon Web Services resource.
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

  /// A complex type that contains the Amazon Web Services KMS encryption
  /// configuration settings for your firewall.
  final EncryptionConfiguration? encryptionConfiguration;

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
    this.encryptionConfiguration,
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
      encryptionConfiguration: json['EncryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['EncryptionConfiguration'] as Map<String, dynamic>)
          : null,
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
    final encryptionConfiguration = this.encryptionConfiguration;
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
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
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

  /// Contains variables that you can use to override default Suricata settings in
  /// your firewall policy.
  final PolicyVariables? policyVariables;

  /// The default actions to take on a packet that doesn't match any stateful
  /// rules. The stateful default action is optional, and is only valid when using
  /// the strict rule order.
  ///
  /// Valid values of the stateful default action:
  ///
  /// <ul>
  /// <li>
  /// aws:drop_strict
  /// </li>
  /// <li>
  /// aws:drop_established
  /// </li>
  /// <li>
  /// aws:alert_strict
  /// </li>
  /// <li>
  /// aws:alert_established
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/suricata-rule-evaluation-order.html#suricata-strict-rule-evaluation-order.html">Strict
  /// evaluation order</a> in the <i>Network Firewall Developer Guide</i>.
  final List<String>? statefulDefaultActions;

  /// Additional options governing how Network Firewall handles stateful rules.
  /// The stateful rule groups that you use in your policy must have stateful rule
  /// options settings that are compatible with these settings.
  final StatefulEngineOptions? statefulEngineOptions;

  /// References to the stateful rule groups that are used in the policy. These
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

  /// The Amazon Resource Name (ARN) of the TLS inspection configuration.
  final String? tLSInspectionConfigurationArn;

  FirewallPolicy({
    required this.statelessDefaultActions,
    required this.statelessFragmentDefaultActions,
    this.policyVariables,
    this.statefulDefaultActions,
    this.statefulEngineOptions,
    this.statefulRuleGroupReferences,
    this.statelessCustomActions,
    this.statelessRuleGroupReferences,
    this.tLSInspectionConfigurationArn,
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
      policyVariables: json['PolicyVariables'] != null
          ? PolicyVariables.fromJson(
              json['PolicyVariables'] as Map<String, dynamic>)
          : null,
      statefulDefaultActions: (json['StatefulDefaultActions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      statefulEngineOptions: json['StatefulEngineOptions'] != null
          ? StatefulEngineOptions.fromJson(
              json['StatefulEngineOptions'] as Map<String, dynamic>)
          : null,
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
      tLSInspectionConfigurationArn:
          json['TLSInspectionConfigurationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statelessDefaultActions = this.statelessDefaultActions;
    final statelessFragmentDefaultActions =
        this.statelessFragmentDefaultActions;
    final policyVariables = this.policyVariables;
    final statefulDefaultActions = this.statefulDefaultActions;
    final statefulEngineOptions = this.statefulEngineOptions;
    final statefulRuleGroupReferences = this.statefulRuleGroupReferences;
    final statelessCustomActions = this.statelessCustomActions;
    final statelessRuleGroupReferences = this.statelessRuleGroupReferences;
    final tLSInspectionConfigurationArn = this.tLSInspectionConfigurationArn;
    return {
      'StatelessDefaultActions': statelessDefaultActions,
      'StatelessFragmentDefaultActions': statelessFragmentDefaultActions,
      if (policyVariables != null) 'PolicyVariables': policyVariables,
      if (statefulDefaultActions != null)
        'StatefulDefaultActions': statefulDefaultActions,
      if (statefulEngineOptions != null)
        'StatefulEngineOptions': statefulEngineOptions,
      if (statefulRuleGroupReferences != null)
        'StatefulRuleGroupReferences': statefulRuleGroupReferences,
      if (statelessCustomActions != null)
        'StatelessCustomActions': statelessCustomActions,
      if (statelessRuleGroupReferences != null)
        'StatelessRuleGroupReferences': statelessRuleGroupReferences,
      if (tLSInspectionConfigurationArn != null)
        'TLSInspectionConfigurationArn': tLSInspectionConfigurationArn,
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

  /// The number of capacity units currently consumed by the policy's stateful
  /// rules.
  final int? consumedStatefulRuleCapacity;

  /// The number of capacity units currently consumed by the policy's stateless
  /// rules.
  final int? consumedStatelessRuleCapacity;

  /// A description of the firewall policy.
  final String? description;

  /// A complex type that contains the Amazon Web Services KMS encryption
  /// configuration settings for your firewall policy.
  final EncryptionConfiguration? encryptionConfiguration;

  /// The current status of the firewall policy. You can retrieve this for a
  /// firewall policy by calling <a>DescribeFirewallPolicy</a> and providing the
  /// firewall policy's name or ARN.
  final ResourceStatus? firewallPolicyStatus;

  /// The last time that the firewall policy was changed.
  final DateTime? lastModifiedTime;

  /// The number of firewalls that are associated with this firewall policy.
  final int? numberOfAssociations;

  /// The key:value pairs to associate with the resource.
  final List<Tag>? tags;

  FirewallPolicyResponse({
    required this.firewallPolicyArn,
    required this.firewallPolicyId,
    required this.firewallPolicyName,
    this.consumedStatefulRuleCapacity,
    this.consumedStatelessRuleCapacity,
    this.description,
    this.encryptionConfiguration,
    this.firewallPolicyStatus,
    this.lastModifiedTime,
    this.numberOfAssociations,
    this.tags,
  });

  factory FirewallPolicyResponse.fromJson(Map<String, dynamic> json) {
    return FirewallPolicyResponse(
      firewallPolicyArn: json['FirewallPolicyArn'] as String,
      firewallPolicyId: json['FirewallPolicyId'] as String,
      firewallPolicyName: json['FirewallPolicyName'] as String,
      consumedStatefulRuleCapacity:
          json['ConsumedStatefulRuleCapacity'] as int?,
      consumedStatelessRuleCapacity:
          json['ConsumedStatelessRuleCapacity'] as int?,
      description: json['Description'] as String?,
      encryptionConfiguration: json['EncryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['EncryptionConfiguration'] as Map<String, dynamic>)
          : null,
      firewallPolicyStatus:
          (json['FirewallPolicyStatus'] as String?)?.toResourceStatus(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      numberOfAssociations: json['NumberOfAssociations'] as int?,
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
    final consumedStatefulRuleCapacity = this.consumedStatefulRuleCapacity;
    final consumedStatelessRuleCapacity = this.consumedStatelessRuleCapacity;
    final description = this.description;
    final encryptionConfiguration = this.encryptionConfiguration;
    final firewallPolicyStatus = this.firewallPolicyStatus;
    final lastModifiedTime = this.lastModifiedTime;
    final numberOfAssociations = this.numberOfAssociations;
    final tags = this.tags;
    return {
      'FirewallPolicyArn': firewallPolicyArn,
      'FirewallPolicyId': firewallPolicyId,
      'FirewallPolicyName': firewallPolicyName,
      if (consumedStatefulRuleCapacity != null)
        'ConsumedStatefulRuleCapacity': consumedStatefulRuleCapacity,
      if (consumedStatelessRuleCapacity != null)
        'ConsumedStatelessRuleCapacity': consumedStatelessRuleCapacity,
      if (description != null) 'Description': description,
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (firewallPolicyStatus != null)
        'FirewallPolicyStatus': firewallPolicyStatus.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (numberOfAssociations != null)
        'NumberOfAssociations': numberOfAssociations,
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

  /// Describes the capacity usage of the resources contained in a firewall's
  /// reference sets. Network Firewall calclulates the capacity usage by taking an
  /// aggregated count of all of the resources used by all of the reference sets
  /// in a firewall.
  final CapacityUsageSummary? capacityUsageSummary;

  /// The subnets that you've configured for use by the Network Firewall firewall.
  /// This contains one array element per Availability Zone where you've
  /// configured a subnet. These objects provide details of the information that
  /// is summarized in the <code>ConfigurationSyncStateSummary</code> and
  /// <code>Status</code>, broken down by zone and configuration object.
  final Map<String, SyncState>? syncStates;

  FirewallStatus({
    required this.configurationSyncStateSummary,
    required this.status,
    this.capacityUsageSummary,
    this.syncStates,
  });

  factory FirewallStatus.fromJson(Map<String, dynamic> json) {
    return FirewallStatus(
      configurationSyncStateSummary:
          (json['ConfigurationSyncStateSummary'] as String)
              .toConfigurationSyncState(),
      status: (json['Status'] as String).toFirewallStatusValue(),
      capacityUsageSummary: json['CapacityUsageSummary'] != null
          ? CapacityUsageSummary.fromJson(
              json['CapacityUsageSummary'] as Map<String, dynamic>)
          : null,
      syncStates: (json['SyncStates'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, SyncState.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSyncStateSummary = this.configurationSyncStateSummary;
    final status = this.status;
    final capacityUsageSummary = this.capacityUsageSummary;
    final syncStates = this.syncStates;
    return {
      'ConfigurationSyncStateSummary': configurationSyncStateSummary.toValue(),
      'Status': status.toValue(),
      if (capacityUsageSummary != null)
        'CapacityUsageSummary': capacityUsageSummary,
      if (syncStates != null) 'SyncStates': syncStates,
    };
  }
}

enum FirewallStatusValue {
  provisioning,
  deleting,
  ready,
}

extension FirewallStatusValueValueExtension on FirewallStatusValue {
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

extension FirewallStatusValueFromString on String {
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

extension GeneratedRulesTypeValueExtension on GeneratedRulesType {
  String toValue() {
    switch (this) {
      case GeneratedRulesType.allowlist:
        return 'ALLOWLIST';
      case GeneratedRulesType.denylist:
        return 'DENYLIST';
    }
  }
}

extension GeneratedRulesTypeFromString on String {
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

/// The basic rule criteria for Network Firewall to use to inspect packet
/// headers in stateful traffic flow inspection. Traffic flows that match the
/// criteria are a match for the corresponding <a>StatefulRule</a>.
class Header {
  /// The destination IP address or address range to inspect for, in CIDR
  /// notation. To match with any address, specify <code>ANY</code>.
  ///
  /// Specify an IP address or a block of IP addresses in Classless Inter-Domain
  /// Routing (CIDR) notation. Network Firewall supports all address ranges for
  /// IPv4 and IPv6.
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
  /// <li>
  /// To configure Network Firewall to inspect for the IP address
  /// 1111:0000:0000:0000:0000:0000:0000:0111, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0111/128</code>.
  /// </li>
  /// <li>
  /// To configure Network Firewall to inspect for IP addresses from
  /// 1111:0000:0000:0000:0000:0000:0000:0000 to
  /// 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0000/64</code>.
  /// </li>
  /// </ul>
  /// For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  final String destination;

  /// The destination port to inspect for. You can specify an individual port, for
  /// example <code>1994</code> and you can specify a port range, for example
  /// <code>1990:1994</code>. To match with any port, specify <code>ANY</code>.
  final String destinationPort;

  /// The direction of traffic flow to inspect. If set to <code>ANY</code>, the
  /// inspection matches bidirectional traffic, both from the source to the
  /// destination and from the destination to the source. If set to
  /// <code>FORWARD</code>, the inspection only matches traffic going from the
  /// source to the destination.
  final StatefulRuleDirection direction;

  /// The protocol to inspect for. To specify all, you can use <code>IP</code>,
  /// because all traffic on Amazon Web Services and on the internet is IP.
  final StatefulRuleProtocol protocol;

  /// The source IP address or address range to inspect for, in CIDR notation. To
  /// match with any address, specify <code>ANY</code>.
  ///
  /// Specify an IP address or a block of IP addresses in Classless Inter-Domain
  /// Routing (CIDR) notation. Network Firewall supports all address ranges for
  /// IPv4 and IPv6.
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
  /// <li>
  /// To configure Network Firewall to inspect for the IP address
  /// 1111:0000:0000:0000:0000:0000:0000:0111, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0111/128</code>.
  /// </li>
  /// <li>
  /// To configure Network Firewall to inspect for IP addresses from
  /// 1111:0000:0000:0000:0000:0000:0000:0000 to
  /// 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0000/64</code>.
  /// </li>
  /// </ul>
  /// For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  final String source;

  /// The source port to inspect for. You can specify an individual port, for
  /// example <code>1994</code> and you can specify a port range, for example
  /// <code>1990:1994</code>. To match with any port, specify <code>ANY</code>.
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

enum IPAddressType {
  dualstack,
  ipv4,
  ipv6,
}

extension IPAddressTypeValueExtension on IPAddressType {
  String toValue() {
    switch (this) {
      case IPAddressType.dualstack:
        return 'DUALSTACK';
      case IPAddressType.ipv4:
        return 'IPV4';
      case IPAddressType.ipv6:
        return 'IPV6';
    }
  }
}

extension IPAddressTypeFromString on String {
  IPAddressType toIPAddressType() {
    switch (this) {
      case 'DUALSTACK':
        return IPAddressType.dualstack;
      case 'IPV4':
        return IPAddressType.ipv4;
      case 'IPV6':
        return IPAddressType.ipv6;
    }
    throw Exception('$this is not known in enum IPAddressType');
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

/// General information about the IP set.
class IPSetMetadata {
  /// Describes the total number of CIDR blocks currently in use by the IP set
  /// references in a firewall. To determine how many CIDR blocks are available
  /// for you to use in a firewall, you can call <code>AvailableCIDRCount</code>.
  final int? resolvedCIDRCount;

  IPSetMetadata({
    this.resolvedCIDRCount,
  });

  factory IPSetMetadata.fromJson(Map<String, dynamic> json) {
    return IPSetMetadata(
      resolvedCIDRCount: json['ResolvedCIDRCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final resolvedCIDRCount = this.resolvedCIDRCount;
    return {
      if (resolvedCIDRCount != null) 'ResolvedCIDRCount': resolvedCIDRCount,
    };
  }
}

/// Configures one or more IP set references for a Suricata-compatible rule
/// group. This is used in <a>CreateRuleGroup</a> or <a>UpdateRuleGroup</a>. An
/// IP set reference is a rule variable that references resources that you
/// create and manage in another Amazon Web Services service, such as an Amazon
/// VPC prefix list. Network Firewall IP set references enable you to
/// dynamically update the contents of your rules. When you create, update, or
/// delete the resource you are referencing in your rule, Network Firewall
/// automatically updates the rule's content with the changes. For more
/// information about IP set references in Network Firewall, see <a
/// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/rule-groups-ip-set-references">Using
/// IP set references</a> in the <i>Network Firewall Developer Guide</i>.
///
/// Network Firewall currently supports <a
/// href="https://docs.aws.amazon.com/vpc/latest/userguide/managed-prefix-lists.html">Amazon
/// VPC prefix lists</a> and <a
/// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/rule-groups-ip-set-references.html#rule-groups-referencing-resource-groups">resource
/// groups</a> in IP set references.
class IPSetReference {
  /// The Amazon Resource Name (ARN) of the resource that you are referencing in
  /// your rule group.
  final String? referenceArn;

  IPSetReference({
    this.referenceArn,
  });

  factory IPSetReference.fromJson(Map<String, dynamic> json) {
    return IPSetReference(
      referenceArn: json['ReferenceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final referenceArn = this.referenceArn;
    return {
      if (referenceArn != null) 'ReferenceArn': referenceArn,
    };
  }
}

enum IdentifiedType {
  statelessRuleForwardingAsymmetrically,
  statelessRuleContainsTcpFlags,
}

extension IdentifiedTypeValueExtension on IdentifiedType {
  String toValue() {
    switch (this) {
      case IdentifiedType.statelessRuleForwardingAsymmetrically:
        return 'STATELESS_RULE_FORWARDING_ASYMMETRICALLY';
      case IdentifiedType.statelessRuleContainsTcpFlags:
        return 'STATELESS_RULE_CONTAINS_TCP_FLAGS';
    }
  }
}

extension IdentifiedTypeFromString on String {
  IdentifiedType toIdentifiedType() {
    switch (this) {
      case 'STATELESS_RULE_FORWARDING_ASYMMETRICALLY':
        return IdentifiedType.statelessRuleForwardingAsymmetrically;
      case 'STATELESS_RULE_CONTAINS_TCP_FLAGS':
        return IdentifiedType.statelessRuleContainsTcpFlags;
    }
    throw Exception('$this is not known in enum IdentifiedType');
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

class ListTLSInspectionConfigurationsResponse {
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Network Firewall returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  final String? nextToken;

  /// The TLS inspection configuration metadata objects that you've defined.
  /// Depending on your setting for max results and the number of TLS inspection
  /// configurations, this might not be the full list.
  final List<TLSInspectionConfigurationMetadata>? tLSInspectionConfigurations;

  ListTLSInspectionConfigurationsResponse({
    this.nextToken,
    this.tLSInspectionConfigurations,
  });

  factory ListTLSInspectionConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListTLSInspectionConfigurationsResponse(
      nextToken: json['NextToken'] as String?,
      tLSInspectionConfigurations:
          (json['TLSInspectionConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => TLSInspectionConfigurationMetadata.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tLSInspectionConfigurations = this.tLSInspectionConfigurations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tLSInspectionConfigurations != null)
        'TLSInspectionConfigurations': tLSInspectionConfigurations,
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

/// Defines where Network Firewall sends logs for the firewall for one log type.
/// This is used in <a>LoggingConfiguration</a>. You can send each type of log
/// to an Amazon S3 bucket, a CloudWatch log group, or a Kinesis Data Firehose
/// delivery stream.
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

extension LogDestinationTypeValueExtension on LogDestinationType {
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

extension LogDestinationTypeFromString on String {
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

extension LogTypeValueExtension on LogType {
  String toValue() {
    switch (this) {
      case LogType.alert:
        return 'ALERT';
      case LogType.flow:
        return 'FLOW';
    }
  }
}

extension LogTypeFromString on String {
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

/// Defines how Network Firewall performs logging for a <a>Firewall</a>.
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
  /// specify port ranges, for example <code>1990:1994</code>.
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
  /// specify port ranges, for example <code>1990:1994</code>.
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

enum OverrideAction {
  dropToAlert,
}

extension OverrideActionValueExtension on OverrideAction {
  String toValue() {
    switch (this) {
      case OverrideAction.dropToAlert:
        return 'DROP_TO_ALERT';
    }
  }
}

extension OverrideActionFromString on String {
  OverrideAction toOverrideAction() {
    switch (this) {
      case 'DROP_TO_ALERT':
        return OverrideAction.dropToAlert;
    }
    throw Exception('$this is not known in enum OverrideAction');
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
  capacityConstrained,
}

extension PerObjectSyncStatusValueExtension on PerObjectSyncStatus {
  String toValue() {
    switch (this) {
      case PerObjectSyncStatus.pending:
        return 'PENDING';
      case PerObjectSyncStatus.inSync:
        return 'IN_SYNC';
      case PerObjectSyncStatus.capacityConstrained:
        return 'CAPACITY_CONSTRAINED';
    }
  }
}

extension PerObjectSyncStatusFromString on String {
  PerObjectSyncStatus toPerObjectSyncStatus() {
    switch (this) {
      case 'PENDING':
        return PerObjectSyncStatus.pending;
      case 'IN_SYNC':
        return PerObjectSyncStatus.inSync;
      case 'CAPACITY_CONSTRAINED':
        return PerObjectSyncStatus.capacityConstrained;
    }
    throw Exception('$this is not known in enum PerObjectSyncStatus');
  }
}

/// Contains variables that you can use to override default Suricata settings in
/// your firewall policy.
class PolicyVariables {
  /// The IPv4 or IPv6 addresses in CIDR notation to use for the Suricata
  /// <code>HOME_NET</code> variable. If your firewall uses an inspection VPC, you
  /// might want to override the <code>HOME_NET</code> variable with the CIDRs of
  /// your home networks. If you don't override <code>HOME_NET</code> with your
  /// own CIDRs, Network Firewall by default uses the CIDR of your inspection VPC.
  final Map<String, IPSet>? ruleVariables;

  PolicyVariables({
    this.ruleVariables,
  });

  factory PolicyVariables.fromJson(Map<String, dynamic> json) {
    return PolicyVariables(
      ruleVariables: (json['RuleVariables'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, IPSet.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final ruleVariables = this.ruleVariables;
    return {
      if (ruleVariables != null) 'RuleVariables': ruleVariables,
    };
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

/// Contains a set of IP set references.
class ReferenceSets {
  /// The list of IP set references.
  final Map<String, IPSetReference>? iPSetReferences;

  ReferenceSets({
    this.iPSetReferences,
  });

  factory ReferenceSets.fromJson(Map<String, dynamic> json) {
    return ReferenceSets(
      iPSetReferences: (json['IPSetReferences'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, IPSetReference.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final iPSetReferences = this.iPSetReferences;
    return {
      if (iPSetReferences != null) 'IPSetReferences': iPSetReferences,
    };
  }
}

enum ResourceManagedStatus {
  managed,
  account,
}

extension ResourceManagedStatusValueExtension on ResourceManagedStatus {
  String toValue() {
    switch (this) {
      case ResourceManagedStatus.managed:
        return 'MANAGED';
      case ResourceManagedStatus.account:
        return 'ACCOUNT';
    }
  }
}

extension ResourceManagedStatusFromString on String {
  ResourceManagedStatus toResourceManagedStatus() {
    switch (this) {
      case 'MANAGED':
        return ResourceManagedStatus.managed;
      case 'ACCOUNT':
        return ResourceManagedStatus.account;
    }
    throw Exception('$this is not known in enum ResourceManagedStatus');
  }
}

enum ResourceManagedType {
  awsManagedThreatSignatures,
  awsManagedDomainLists,
}

extension ResourceManagedTypeValueExtension on ResourceManagedType {
  String toValue() {
    switch (this) {
      case ResourceManagedType.awsManagedThreatSignatures:
        return 'AWS_MANAGED_THREAT_SIGNATURES';
      case ResourceManagedType.awsManagedDomainLists:
        return 'AWS_MANAGED_DOMAIN_LISTS';
    }
  }
}

extension ResourceManagedTypeFromString on String {
  ResourceManagedType toResourceManagedType() {
    switch (this) {
      case 'AWS_MANAGED_THREAT_SIGNATURES':
        return ResourceManagedType.awsManagedThreatSignatures;
      case 'AWS_MANAGED_DOMAIN_LISTS':
        return ResourceManagedType.awsManagedDomainLists;
    }
    throw Exception('$this is not known in enum ResourceManagedType');
  }
}

enum ResourceStatus {
  active,
  deleting,
  error,
}

extension ResourceStatusValueExtension on ResourceStatus {
  String toValue() {
    switch (this) {
      case ResourceStatus.active:
        return 'ACTIVE';
      case ResourceStatus.deleting:
        return 'DELETING';
      case ResourceStatus.error:
        return 'ERROR';
    }
  }
}

extension ResourceStatusFromString on String {
  ResourceStatus toResourceStatus() {
    switch (this) {
      case 'ACTIVE':
        return ResourceStatus.active;
      case 'DELETING':
        return ResourceStatus.deleting;
      case 'ERROR':
        return ResourceStatus.error;
    }
    throw Exception('$this is not known in enum ResourceStatus');
  }
}

enum RevocationCheckAction {
  pass,
  drop,
  reject,
}

extension RevocationCheckActionValueExtension on RevocationCheckAction {
  String toValue() {
    switch (this) {
      case RevocationCheckAction.pass:
        return 'PASS';
      case RevocationCheckAction.drop:
        return 'DROP';
      case RevocationCheckAction.reject:
        return 'REJECT';
    }
  }
}

extension RevocationCheckActionFromString on String {
  RevocationCheckAction toRevocationCheckAction() {
    switch (this) {
      case 'PASS':
        return RevocationCheckAction.pass;
      case 'DROP':
        return RevocationCheckAction.drop;
      case 'REJECT':
        return RevocationCheckAction.reject;
    }
    throw Exception('$this is not known in enum RevocationCheckAction');
  }
}

/// The inspection criteria and action for a single stateless rule. Network
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
/// Network Firewall uses a rule group to inspect and control network traffic.
/// You define stateless rule groups to inspect individual packets and you
/// define stateful rule groups to inspect packets in the context of their
/// traffic flow.
///
/// To use a rule group, you include it by reference in an Network Firewall
/// firewall policy, then you use the policy in a firewall. You can reference a
/// rule group from more than one firewall policy, and you can use a firewall
/// policy in more than one firewall.
class RuleGroup {
  /// The stateful rules or stateless rules for the rule group.
  final RulesSource rulesSource;

  /// The list of a rule group's reference sets.
  final ReferenceSets? referenceSets;

  /// Settings that are available for use in the rules in the rule group. You can
  /// only use these for stateful rule groups.
  final RuleVariables? ruleVariables;

  /// Additional options governing how Network Firewall handles stateful rules.
  /// The policies where you use your stateful rule group must have stateful rule
  /// options settings that are compatible with these settings. Some limitations
  /// apply; for more information, see <a
  /// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/suricata-limitations-caveats.html">Strict
  /// evaluation order</a> in the <i>Network Firewall Developer Guide</i>.
  final StatefulRuleOptions? statefulRuleOptions;

  RuleGroup({
    required this.rulesSource,
    this.referenceSets,
    this.ruleVariables,
    this.statefulRuleOptions,
  });

  factory RuleGroup.fromJson(Map<String, dynamic> json) {
    return RuleGroup(
      rulesSource:
          RulesSource.fromJson(json['RulesSource'] as Map<String, dynamic>),
      referenceSets: json['ReferenceSets'] != null
          ? ReferenceSets.fromJson(
              json['ReferenceSets'] as Map<String, dynamic>)
          : null,
      ruleVariables: json['RuleVariables'] != null
          ? RuleVariables.fromJson(
              json['RuleVariables'] as Map<String, dynamic>)
          : null,
      statefulRuleOptions: json['StatefulRuleOptions'] != null
          ? StatefulRuleOptions.fromJson(
              json['StatefulRuleOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final rulesSource = this.rulesSource;
    final referenceSets = this.referenceSets;
    final ruleVariables = this.ruleVariables;
    final statefulRuleOptions = this.statefulRuleOptions;
    return {
      'RulesSource': rulesSource,
      if (referenceSets != null) 'ReferenceSets': referenceSets,
      if (ruleVariables != null) 'RuleVariables': ruleVariables,
      if (statefulRuleOptions != null)
        'StatefulRuleOptions': statefulRuleOptions,
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

  /// The list of analysis results for <code>AnalyzeRuleGroup</code>. If you set
  /// <code>AnalyzeRuleGroup</code> to <code>TRUE</code> in
  /// <a>CreateRuleGroup</a>, <a>UpdateRuleGroup</a>, or <a>DescribeRuleGroup</a>,
  /// Network Firewall analyzes the rule group and identifies the rules that might
  /// adversely effect your firewall's functionality. For example, if Network
  /// Firewall detects a rule that's routing traffic asymmetrically, which impacts
  /// the service's ability to properly process traffic, the service includes the
  /// rule in the list of analysis results.
  final List<AnalysisResult>? analysisResults;

  /// The maximum operating resources that this rule group can use. Rule group
  /// capacity is fixed at creation. When you update a rule group, you are limited
  /// to this capacity. When you reference a rule group from a firewall policy,
  /// Network Firewall reserves this capacity for the rule group.
  ///
  /// You can retrieve the capacity that would be required for a rule group before
  /// you create the rule group by calling <a>CreateRuleGroup</a> with
  /// <code>DryRun</code> set to <code>TRUE</code>.
  final int? capacity;

  /// The number of capacity units currently consumed by the rule group rules.
  final int? consumedCapacity;

  /// A description of the rule group.
  final String? description;

  /// A complex type that contains the Amazon Web Services KMS encryption
  /// configuration settings for your rule group.
  final EncryptionConfiguration? encryptionConfiguration;

  /// The last time that the rule group was changed.
  final DateTime? lastModifiedTime;

  /// The number of firewall policies that use this rule group.
  final int? numberOfAssociations;

  /// Detailed information about the current status of a rule group.
  final ResourceStatus? ruleGroupStatus;

  /// The Amazon resource name (ARN) of the Amazon Simple Notification Service SNS
  /// topic that's used to record changes to the managed rule group. You can
  /// subscribe to the SNS topic to receive notifications when the managed rule
  /// group is modified, such as for new versions and for version expiration. For
  /// more information, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/welcome.html">Amazon Simple
  /// Notification Service Developer Guide.</a>.
  final String? snsTopic;

  /// A complex type that contains metadata about the rule group that your own
  /// rule group is copied from. You can use the metadata to track the version
  /// updates made to the originating rule group.
  final SourceMetadata? sourceMetadata;

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
    this.analysisResults,
    this.capacity,
    this.consumedCapacity,
    this.description,
    this.encryptionConfiguration,
    this.lastModifiedTime,
    this.numberOfAssociations,
    this.ruleGroupStatus,
    this.snsTopic,
    this.sourceMetadata,
    this.tags,
    this.type,
  });

  factory RuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return RuleGroupResponse(
      ruleGroupArn: json['RuleGroupArn'] as String,
      ruleGroupId: json['RuleGroupId'] as String,
      ruleGroupName: json['RuleGroupName'] as String,
      analysisResults: (json['AnalysisResults'] as List?)
          ?.whereNotNull()
          .map((e) => AnalysisResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      capacity: json['Capacity'] as int?,
      consumedCapacity: json['ConsumedCapacity'] as int?,
      description: json['Description'] as String?,
      encryptionConfiguration: json['EncryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['EncryptionConfiguration'] as Map<String, dynamic>)
          : null,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      numberOfAssociations: json['NumberOfAssociations'] as int?,
      ruleGroupStatus: (json['RuleGroupStatus'] as String?)?.toResourceStatus(),
      snsTopic: json['SnsTopic'] as String?,
      sourceMetadata: json['SourceMetadata'] != null
          ? SourceMetadata.fromJson(
              json['SourceMetadata'] as Map<String, dynamic>)
          : null,
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
    final analysisResults = this.analysisResults;
    final capacity = this.capacity;
    final consumedCapacity = this.consumedCapacity;
    final description = this.description;
    final encryptionConfiguration = this.encryptionConfiguration;
    final lastModifiedTime = this.lastModifiedTime;
    final numberOfAssociations = this.numberOfAssociations;
    final ruleGroupStatus = this.ruleGroupStatus;
    final snsTopic = this.snsTopic;
    final sourceMetadata = this.sourceMetadata;
    final tags = this.tags;
    final type = this.type;
    return {
      'RuleGroupArn': ruleGroupArn,
      'RuleGroupId': ruleGroupId,
      'RuleGroupName': ruleGroupName,
      if (analysisResults != null) 'AnalysisResults': analysisResults,
      if (capacity != null) 'Capacity': capacity,
      if (consumedCapacity != null) 'ConsumedCapacity': consumedCapacity,
      if (description != null) 'Description': description,
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (numberOfAssociations != null)
        'NumberOfAssociations': numberOfAssociations,
      if (ruleGroupStatus != null) 'RuleGroupStatus': ruleGroupStatus.toValue(),
      if (snsTopic != null) 'SnsTopic': snsTopic,
      if (sourceMetadata != null) 'SourceMetadata': sourceMetadata,
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum RuleGroupType {
  stateless,
  stateful,
}

extension RuleGroupTypeValueExtension on RuleGroupType {
  String toValue() {
    switch (this) {
      case RuleGroupType.stateless:
        return 'STATELESS';
      case RuleGroupType.stateful:
        return 'STATEFUL';
    }
  }
}

extension RuleGroupTypeFromString on String {
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
  /// The keyword for the Suricata compatible rule option. You must include a
  /// <code>sid</code> (signature ID), and can optionally include other keywords.
  /// For information about Suricata compatible keywords, see <a
  /// href="https://suricata.readthedocs.io/en/suricata-6.0.9/rules/intro.html#rule-options">Rule
  /// options</a> in the Suricata documentation.
  final String keyword;

  /// The settings of the Suricata compatible rule option. Rule options have zero
  /// or more setting values, and the number of possible and required settings
  /// depends on the <code>Keyword</code>. For more information about the settings
  /// for specific options, see <a
  /// href="https://suricata.readthedocs.io/en/suricata-6.0.9/rules/intro.html#rule-options">Rule
  /// options</a>.
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

enum RuleOrder {
  defaultActionOrder,
  strictOrder,
}

extension RuleOrderValueExtension on RuleOrder {
  String toValue() {
    switch (this) {
      case RuleOrder.defaultActionOrder:
        return 'DEFAULT_ACTION_ORDER';
      case RuleOrder.strictOrder:
        return 'STRICT_ORDER';
    }
  }
}

extension RuleOrderFromString on String {
  RuleOrder toRuleOrder() {
    switch (this) {
      case 'DEFAULT_ACTION_ORDER':
        return RuleOrder.defaultActionOrder;
      case 'STRICT_ORDER':
        return RuleOrder.strictOrder;
    }
    throw Exception('$this is not known in enum RuleOrder');
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

  /// Stateful inspection criteria, provided in Suricata compatible rules.
  /// Suricata is an open-source threat detection framework that includes a
  /// standard rule-based language for network traffic inspection.
  ///
  /// These rules contain the inspection criteria and the action to take for
  /// traffic that matches the criteria, so this type of rule group doesn't have a
  /// separate action setting.
  /// <note>
  /// You can't use the <code>priority</code> keyword if the
  /// <code>RuleOrder</code> option in <a>StatefulRuleOptions</a> is set to
  /// <code>STRICT_ORDER</code>.
  /// </note>
  final String? rulesString;

  /// An array of individual stateful rules inspection criteria to be used
  /// together in a stateful rule group. Use this option to specify simple
  /// Suricata rules with protocol, source and destination, ports, direction, and
  /// rule options. For information about the Suricata <code>Rules</code> format,
  /// see <a
  /// href="https://suricata.readthedocs.io/en/suricata-6.0.9/rules/intro.html">Rules
  /// Format</a>.
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
/// domain list rule groups in Network Firewall</a> in the <i>Network Firewall
/// Developer Guide</i>.
class RulesSourceList {
  /// Whether you want to allow or deny access to the domains in your target list.
  final GeneratedRulesType generatedRulesType;

  /// The protocols you want to inspect. Specify <code>TLS_SNI</code> for
  /// <code>HTTPS</code>. Specify <code>HTTP_HOST</code> for <code>HTTP</code>.
  /// You can specify either or both.
  final List<TargetType> targetTypes;

  /// The domains that you want to inspect for in your traffic flows. Valid domain
  /// specifications are the following:
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

/// Any Certificate Manager (ACM) Secure Sockets Layer/Transport Layer Security
/// (SSL/TLS) server certificate that's associated with a
/// <a>ServerCertificateConfiguration</a>. Used in a
/// <a>TLSInspectionConfiguration</a> for inspection of inbound traffic to your
/// firewall. You must request or import a SSL/TLS certificate into ACM for each
/// domain Network Firewall needs to decrypt and inspect. Network Firewall uses
/// the SSL/TLS certificates to decrypt specified inbound SSL/TLS traffic going
/// to your firewall. For information about working with certificates in
/// Certificate Manager, see <a
/// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html">Request
/// a public certificate </a> or <a
/// href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing
/// certificates</a> in the <i>Certificate Manager User Guide</i>.
class ServerCertificate {
  /// The Amazon Resource Name (ARN) of the Certificate Manager SSL/TLS server
  /// certificate that's used for inbound SSL/TLS inspection.
  final String? resourceArn;

  ServerCertificate({
    this.resourceArn,
  });

  factory ServerCertificate.fromJson(Map<String, dynamic> json) {
    return ServerCertificate(
      resourceArn: json['ResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    return {
      if (resourceArn != null) 'ResourceArn': resourceArn,
    };
  }
}

/// Configures the Certificate Manager certificates and scope that Network
/// Firewall uses to decrypt and re-encrypt traffic using a
/// <a>TLSInspectionConfiguration</a>. You can configure
/// <code>ServerCertificates</code> for inbound SSL/TLS inspection, a
/// <code>CertificateAuthorityArn</code> for outbound SSL/TLS inspection, or
/// both. For information about working with certificates for TLS inspection,
/// see <a
/// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection-certificate-requirements.html">
/// Using SSL/TLS server certficiates with TLS inspection configurations</a> in
/// the <i>Network Firewall Developer Guide</i>.
/// <note>
/// If a server certificate that's associated with your
/// <a>TLSInspectionConfiguration</a> is revoked, deleted, or expired it can
/// result in client-side TLS errors.
/// </note>
class ServerCertificateConfiguration {
  /// The Amazon Resource Name (ARN) of the imported certificate authority (CA)
  /// certificate within Certificate Manager (ACM) to use for outbound SSL/TLS
  /// inspection.
  ///
  /// The following limitations apply:
  ///
  /// <ul>
  /// <li>
  /// You can use CA certificates that you imported into ACM, but you can't
  /// generate CA certificates with ACM.
  /// </li>
  /// <li>
  /// You can't use certificates issued by Private Certificate Authority.
  /// </li>
  /// </ul>
  /// For more information about configuring certificates for outbound inspection,
  /// see <a
  /// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection-certificate-requirements.html">Using
  /// SSL/TLS certificates with certificates with TLS inspection
  /// configurations</a> in the <i>Network Firewall Developer Guide</i>.
  ///
  /// For information about working with certificates in ACM, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing
  /// certificates</a> in the <i>Certificate Manager User Guide</i>.
  final String? certificateAuthorityArn;

  /// When enabled, Network Firewall checks if the server certificate presented by
  /// the server in the SSL/TLS connection has a revoked or unkown status. If the
  /// certificate has an unknown or revoked status, you must specify the actions
  /// that Network Firewall takes on outbound traffic. To check the certificate
  /// revocation status, you must also specify a
  /// <code>CertificateAuthorityArn</code> in
  /// <a>ServerCertificateConfiguration</a>.
  final CheckCertificateRevocationStatusActions?
      checkCertificateRevocationStatus;

  /// A list of scopes.
  final List<ServerCertificateScope>? scopes;

  /// The list of server certificates to use for inbound SSL/TLS inspection.
  final List<ServerCertificate>? serverCertificates;

  ServerCertificateConfiguration({
    this.certificateAuthorityArn,
    this.checkCertificateRevocationStatus,
    this.scopes,
    this.serverCertificates,
  });

  factory ServerCertificateConfiguration.fromJson(Map<String, dynamic> json) {
    return ServerCertificateConfiguration(
      certificateAuthorityArn: json['CertificateAuthorityArn'] as String?,
      checkCertificateRevocationStatus:
          json['CheckCertificateRevocationStatus'] != null
              ? CheckCertificateRevocationStatusActions.fromJson(
                  json['CheckCertificateRevocationStatus']
                      as Map<String, dynamic>)
              : null,
      scopes: (json['Scopes'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ServerCertificateScope.fromJson(e as Map<String, dynamic>))
          .toList(),
      serverCertificates: (json['ServerCertificates'] as List?)
          ?.whereNotNull()
          .map((e) => ServerCertificate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAuthorityArn = this.certificateAuthorityArn;
    final checkCertificateRevocationStatus =
        this.checkCertificateRevocationStatus;
    final scopes = this.scopes;
    final serverCertificates = this.serverCertificates;
    return {
      if (certificateAuthorityArn != null)
        'CertificateAuthorityArn': certificateAuthorityArn,
      if (checkCertificateRevocationStatus != null)
        'CheckCertificateRevocationStatus': checkCertificateRevocationStatus,
      if (scopes != null) 'Scopes': scopes,
      if (serverCertificates != null) 'ServerCertificates': serverCertificates,
    };
  }
}

/// Settings that define the Secure Sockets Layer/Transport Layer Security
/// (SSL/TLS) traffic that Network Firewall should decrypt for inspection by the
/// stateful rule engine.
class ServerCertificateScope {
  /// The destination ports to decrypt for inspection, in Transmission Control
  /// Protocol (TCP) format. If not specified, this matches with any destination
  /// port.
  ///
  /// You can specify individual ports, for example <code>1994</code>, and you can
  /// specify port ranges, such as <code>1990:1994</code>.
  final List<PortRange>? destinationPorts;

  /// The destination IP addresses and address ranges to decrypt for inspection,
  /// in CIDR notation. If not specified, this matches with any destination
  /// address.
  final List<Address>? destinations;

  /// The protocols to decrypt for inspection, specified using each protocol's
  /// assigned internet protocol number (IANA). Network Firewall currently
  /// supports only TCP.
  final List<int>? protocols;

  /// The source ports to decrypt for inspection, in Transmission Control Protocol
  /// (TCP) format. If not specified, this matches with any source port.
  ///
  /// You can specify individual ports, for example <code>1994</code>, and you can
  /// specify port ranges, such as <code>1990:1994</code>.
  final List<PortRange>? sourcePorts;

  /// The source IP addresses and address ranges to decrypt for inspection, in
  /// CIDR notation. If not specified, this matches with any source address.
  final List<Address>? sources;

  ServerCertificateScope({
    this.destinationPorts,
    this.destinations,
    this.protocols,
    this.sourcePorts,
    this.sources,
  });

  factory ServerCertificateScope.fromJson(Map<String, dynamic> json) {
    return ServerCertificateScope(
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
    );
  }

  Map<String, dynamic> toJson() {
    final destinationPorts = this.destinationPorts;
    final destinations = this.destinations;
    final protocols = this.protocols;
    final sourcePorts = this.sourcePorts;
    final sources = this.sources;
    return {
      if (destinationPorts != null) 'DestinationPorts': destinationPorts,
      if (destinations != null) 'Destinations': destinations,
      if (protocols != null) 'Protocols': protocols,
      if (sourcePorts != null) 'SourcePorts': sourcePorts,
      if (sources != null) 'Sources': sources,
    };
  }
}

/// High-level information about the managed rule group that your own rule group
/// is copied from. You can use the the metadata to track version updates made
/// to the originating rule group. You can retrieve all objects for a rule group
/// by calling <a
/// href="https://docs.aws.amazon.com/network-firewall/latest/APIReference/API_DescribeRuleGroup.html">DescribeRuleGroup</a>.
class SourceMetadata {
  /// The Amazon Resource Name (ARN) of the rule group that your own rule group is
  /// copied from.
  final String? sourceArn;

  /// The update token of the Amazon Web Services managed rule group that your own
  /// rule group is copied from. To determine the update token for the managed
  /// rule group, call <a
  /// href="https://docs.aws.amazon.com/network-firewall/latest/APIReference/API_DescribeRuleGroup.html#networkfirewall-DescribeRuleGroup-response-UpdateToken">DescribeRuleGroup</a>.
  final String? sourceUpdateToken;

  SourceMetadata({
    this.sourceArn,
    this.sourceUpdateToken,
  });

  factory SourceMetadata.fromJson(Map<String, dynamic> json) {
    return SourceMetadata(
      sourceArn: json['SourceArn'] as String?,
      sourceUpdateToken: json['SourceUpdateToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceArn = this.sourceArn;
    final sourceUpdateToken = this.sourceUpdateToken;
    return {
      if (sourceArn != null) 'SourceArn': sourceArn,
      if (sourceUpdateToken != null) 'SourceUpdateToken': sourceUpdateToken,
    };
  }
}

enum StatefulAction {
  pass,
  drop,
  alert,
  reject,
}

extension StatefulActionValueExtension on StatefulAction {
  String toValue() {
    switch (this) {
      case StatefulAction.pass:
        return 'PASS';
      case StatefulAction.drop:
        return 'DROP';
      case StatefulAction.alert:
        return 'ALERT';
      case StatefulAction.reject:
        return 'REJECT';
    }
  }
}

extension StatefulActionFromString on String {
  StatefulAction toStatefulAction() {
    switch (this) {
      case 'PASS':
        return StatefulAction.pass;
      case 'DROP':
        return StatefulAction.drop;
      case 'ALERT':
        return StatefulAction.alert;
      case 'REJECT':
        return StatefulAction.reject;
    }
    throw Exception('$this is not known in enum StatefulAction');
  }
}

/// Configuration settings for the handling of the stateful rule groups in a
/// firewall policy.
class StatefulEngineOptions {
  /// Indicates how to manage the order of stateful rule evaluation for the
  /// policy. <code>STRICT_ORDER</code> is the default and recommended option.
  /// With <code>STRICT_ORDER</code>, provide your rules in the order that you
  /// want them to be evaluated. You can then choose one or more default actions
  /// for packets that don't match any rules. Choose <code>STRICT_ORDER</code> to
  /// have the stateful rules engine determine the evaluation order of your rules.
  /// The default action for this rule order is <code>PASS</code>, followed by
  /// <code>DROP</code>, <code>REJECT</code>, and <code>ALERT</code> actions.
  /// Stateful rules are provided to the rule engine as Suricata compatible
  /// strings, and Suricata evaluates them based on your settings. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/suricata-rule-evaluation-order.html">Evaluation
  /// order for stateful rules</a> in the <i>Network Firewall Developer Guide</i>.
  final RuleOrder? ruleOrder;

  /// Configures how Network Firewall processes traffic when a network connection
  /// breaks midstream. Network connections can break due to disruptions in
  /// external networks or within the firewall itself.
  ///
  /// <ul>
  /// <li>
  /// <code>DROP</code> - Network Firewall fails closed and drops all subsequent
  /// traffic going to the firewall. This is the default behavior.
  /// </li>
  /// <li>
  /// <code>CONTINUE</code> - Network Firewall continues to apply rules to the
  /// subsequent traffic without context from traffic before the break. This
  /// impacts the behavior of rules that depend on this context. For example, if
  /// you have a stateful rule to <code>drop http</code> traffic, Network Firewall
  /// won't match the traffic for this rule because the service won't have the
  /// context from session initialization defining the application layer protocol
  /// as HTTP. However, this behavior is rule dependent—a TCP-layer rule using a
  /// <code>flow:stateless</code> rule would still match, as would the
  /// <code>aws:drop_strict</code> default action.
  /// </li>
  /// <li>
  /// <code>REJECT</code> - Network Firewall fails closed and drops all subsequent
  /// traffic going to the firewall. Network Firewall also sends a TCP reject
  /// packet back to your client so that the client can immediately establish a
  /// new session. Network Firewall will have context about the new session and
  /// will apply rules to the subsequent traffic.
  /// </li>
  /// </ul>
  final StreamExceptionPolicy? streamExceptionPolicy;

  StatefulEngineOptions({
    this.ruleOrder,
    this.streamExceptionPolicy,
  });

  factory StatefulEngineOptions.fromJson(Map<String, dynamic> json) {
    return StatefulEngineOptions(
      ruleOrder: (json['RuleOrder'] as String?)?.toRuleOrder(),
      streamExceptionPolicy:
          (json['StreamExceptionPolicy'] as String?)?.toStreamExceptionPolicy(),
    );
  }

  Map<String, dynamic> toJson() {
    final ruleOrder = this.ruleOrder;
    final streamExceptionPolicy = this.streamExceptionPolicy;
    return {
      if (ruleOrder != null) 'RuleOrder': ruleOrder.toValue(),
      if (streamExceptionPolicy != null)
        'StreamExceptionPolicy': streamExceptionPolicy.toValue(),
    };
  }
}

/// A single Suricata rules specification, for use in a stateful rule group. Use
/// this option to specify a simple Suricata rule with protocol, source and
/// destination, ports, direction, and rule options. For information about the
/// Suricata <code>Rules</code> format, see <a
/// href="https://suricata.readthedocs.io/en/suricata-6.0.9/rules/intro.html">Rules
/// Format</a>.
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
  /// <b>ALERT</b> - Sends an alert log message, if alert logging is configured in
  /// the <a>Firewall</a> <a>LoggingConfiguration</a>.
  ///
  /// You can use this action to test a rule that you intend to use to drop
  /// traffic. You can enable the rule with <code>ALERT</code> action, verify in
  /// the logs that the rule is filtering as you want, then change the action to
  /// <code>DROP</code>.
  /// </li>
  /// </ul>
  final StatefulAction action;

  /// The stateful inspection criteria for this rule, used to inspect traffic
  /// flows.
  final Header header;

  /// Additional options for the rule. These are the Suricata
  /// <code>RuleOptions</code> settings.
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

extension StatefulRuleDirectionValueExtension on StatefulRuleDirection {
  String toValue() {
    switch (this) {
      case StatefulRuleDirection.forward:
        return 'FORWARD';
      case StatefulRuleDirection.any:
        return 'ANY';
    }
  }
}

extension StatefulRuleDirectionFromString on String {
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

/// The setting that allows the policy owner to change the behavior of the rule
/// group within a policy.
class StatefulRuleGroupOverride {
  /// The action that changes the rule group from <code>DROP</code> to
  /// <code>ALERT</code>. This only applies to managed rule groups.
  final OverrideAction? action;

  StatefulRuleGroupOverride({
    this.action,
  });

  factory StatefulRuleGroupOverride.fromJson(Map<String, dynamic> json) {
    return StatefulRuleGroupOverride(
      action: (json['Action'] as String?)?.toOverrideAction(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    return {
      if (action != null) 'Action': action.toValue(),
    };
  }
}

/// Identifier for a single stateful rule group, used in a firewall policy to
/// refer to a rule group.
class StatefulRuleGroupReference {
  /// The Amazon Resource Name (ARN) of the stateful rule group.
  final String resourceArn;

  /// The action that allows the policy owner to override the behavior of the rule
  /// group within a policy.
  final StatefulRuleGroupOverride? override;

  /// An integer setting that indicates the order in which to run the stateful
  /// rule groups in a single <a>FirewallPolicy</a>. This setting only applies to
  /// firewall policies that specify the <code>STRICT_ORDER</code> rule order in
  /// the stateful engine options settings.
  ///
  /// Network Firewall evalutes each stateful rule group against a packet starting
  /// with the group that has the lowest priority setting. You must ensure that
  /// the priority settings are unique within each policy.
  ///
  /// You can change the priority settings of your rule groups at any time. To
  /// make it easier to insert rule groups later, number them so there's a wide
  /// range in between, for example use 100, 200, and so on.
  final int? priority;

  StatefulRuleGroupReference({
    required this.resourceArn,
    this.override,
    this.priority,
  });

  factory StatefulRuleGroupReference.fromJson(Map<String, dynamic> json) {
    return StatefulRuleGroupReference(
      resourceArn: json['ResourceArn'] as String,
      override: json['Override'] != null
          ? StatefulRuleGroupOverride.fromJson(
              json['Override'] as Map<String, dynamic>)
          : null,
      priority: json['Priority'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final override = this.override;
    final priority = this.priority;
    return {
      'ResourceArn': resourceArn,
      if (override != null) 'Override': override,
      if (priority != null) 'Priority': priority,
    };
  }
}

/// Additional options governing how Network Firewall handles the rule group.
/// You can only use these for stateful rule groups.
class StatefulRuleOptions {
  /// Indicates how to manage the order of the rule evaluation for the rule group.
  /// <code>DEFAULT_ACTION_ORDER</code> is the default behavior. Stateful rules
  /// are provided to the rule engine as Suricata compatible strings, and Suricata
  /// evaluates them based on certain settings. For more information, see <a
  /// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/suricata-rule-evaluation-order.html">Evaluation
  /// order for stateful rules</a> in the <i>Network Firewall Developer Guide</i>.
  final RuleOrder? ruleOrder;

  StatefulRuleOptions({
    this.ruleOrder,
  });

  factory StatefulRuleOptions.fromJson(Map<String, dynamic> json) {
    return StatefulRuleOptions(
      ruleOrder: (json['RuleOrder'] as String?)?.toRuleOrder(),
    );
  }

  Map<String, dynamic> toJson() {
    final ruleOrder = this.ruleOrder;
    return {
      if (ruleOrder != null) 'RuleOrder': ruleOrder.toValue(),
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

extension StatefulRuleProtocolValueExtension on StatefulRuleProtocol {
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

extension StatefulRuleProtocolFromString on String {
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
  /// Indicates the order in which to run this rule relative to all of the rules
  /// that are defined for a stateless rule group. Network Firewall evaluates the
  /// rules in a rule group starting with the lowest priority setting. You must
  /// ensure that the priority settings are unique for the rule group.
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

enum StreamExceptionPolicy {
  drop,
  $continue,
  reject,
}

extension StreamExceptionPolicyValueExtension on StreamExceptionPolicy {
  String toValue() {
    switch (this) {
      case StreamExceptionPolicy.drop:
        return 'DROP';
      case StreamExceptionPolicy.$continue:
        return 'CONTINUE';
      case StreamExceptionPolicy.reject:
        return 'REJECT';
    }
  }
}

extension StreamExceptionPolicyFromString on String {
  StreamExceptionPolicy toStreamExceptionPolicy() {
    switch (this) {
      case 'DROP':
        return StreamExceptionPolicy.drop;
      case 'CONTINUE':
        return StreamExceptionPolicy.$continue;
      case 'REJECT':
        return StreamExceptionPolicy.reject;
    }
    throw Exception('$this is not known in enum StreamExceptionPolicy');
  }
}

/// The ID for a subnet that you want to associate with the firewall. This is
/// used with <a>CreateFirewall</a> and <a>AssociateSubnets</a>. Network
/// Firewall creates an instance of the associated firewall in each subnet that
/// you specify, to filter traffic in the subnet's Availability Zone.
class SubnetMapping {
  /// The unique identifier for the subnet.
  final String subnetId;

  /// The subnet's IP address type. You can't change the IP address type after you
  /// create the subnet.
  final IPAddressType? iPAddressType;

  SubnetMapping({
    required this.subnetId,
    this.iPAddressType,
  });

  factory SubnetMapping.fromJson(Map<String, dynamic> json) {
    return SubnetMapping(
      subnetId: json['SubnetId'] as String,
      iPAddressType: (json['IPAddressType'] as String?)?.toIPAddressType(),
    );
  }

  Map<String, dynamic> toJson() {
    final subnetId = this.subnetId;
    final iPAddressType = this.iPAddressType;
    return {
      'SubnetId': subnetId,
      if (iPAddressType != null) 'IPAddressType': iPAddressType.toValue(),
    };
  }
}

/// The status of the firewall endpoint and firewall policy configuration for a
/// single VPC subnet.
///
/// For each VPC subnet that you associate with a firewall, Network Firewall
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

extension TCPFlagValueExtension on TCPFlag {
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

extension TCPFlagFromString on String {
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

/// The object that defines a TLS inspection configuration. This, along with
/// <a>TLSInspectionConfigurationResponse</a>, define the TLS inspection
/// configuration. You can retrieve all objects for a TLS inspection
/// configuration by calling <a>DescribeTLSInspectionConfiguration</a>.
///
/// Network Firewall uses a TLS inspection configuration to decrypt traffic.
/// Network Firewall re-encrypts the traffic before sending it to its
/// destination.
///
/// To use a TLS inspection configuration, you add it to a new Network Firewall
/// firewall policy, then you apply the firewall policy to a firewall. Network
/// Firewall acts as a proxy service to decrypt and inspect the traffic
/// traveling through your firewalls. You can reference a TLS inspection
/// configuration from more than one firewall policy, and you can use a firewall
/// policy in more than one firewall. For more information about using TLS
/// inspection configurations, see <a
/// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection.html">Inspecting
/// SSL/TLS traffic with TLS inspection configurations</a> in the <i>Network
/// Firewall Developer Guide</i>.
class TLSInspectionConfiguration {
  /// Lists the server certificate configurations that are associated with the TLS
  /// configuration.
  final List<ServerCertificateConfiguration>? serverCertificateConfigurations;

  TLSInspectionConfiguration({
    this.serverCertificateConfigurations,
  });

  factory TLSInspectionConfiguration.fromJson(Map<String, dynamic> json) {
    return TLSInspectionConfiguration(
      serverCertificateConfigurations:
          (json['ServerCertificateConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => ServerCertificateConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final serverCertificateConfigurations =
        this.serverCertificateConfigurations;
    return {
      if (serverCertificateConfigurations != null)
        'ServerCertificateConfigurations': serverCertificateConfigurations,
    };
  }
}

/// High-level information about a TLS inspection configuration, returned by
/// <code>ListTLSInspectionConfigurations</code>. You can use the information
/// provided in the metadata to retrieve and manage a TLS configuration.
class TLSInspectionConfigurationMetadata {
  /// The Amazon Resource Name (ARN) of the TLS inspection configuration.
  final String? arn;

  /// The descriptive name of the TLS inspection configuration. You can't change
  /// the name of a TLS inspection configuration after you create it.
  final String? name;

  TLSInspectionConfigurationMetadata({
    this.arn,
    this.name,
  });

  factory TLSInspectionConfigurationMetadata.fromJson(
      Map<String, dynamic> json) {
    return TLSInspectionConfigurationMetadata(
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

/// The high-level properties of a TLS inspection configuration. This, along
/// with the <code>TLSInspectionConfiguration</code>, define the TLS inspection
/// configuration. You can retrieve all objects for a TLS inspection
/// configuration by calling <code>DescribeTLSInspectionConfiguration</code>.
class TLSInspectionConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the TLS inspection configuration.
  final String tLSInspectionConfigurationArn;

  /// A unique identifier for the TLS inspection configuration. This ID is
  /// returned in the responses to create and list commands. You provide it to
  /// operations such as update and delete.
  final String tLSInspectionConfigurationId;

  /// The descriptive name of the TLS inspection configuration. You can't change
  /// the name of a TLS inspection configuration after you create it.
  final String tLSInspectionConfigurationName;
  final TlsCertificateData? certificateAuthority;

  /// A list of the certificates associated with the TLS inspection configuration.
  final List<TlsCertificateData>? certificates;

  /// A description of the TLS inspection configuration.
  final String? description;

  /// A complex type that contains the Amazon Web Services KMS encryption
  /// configuration settings for your TLS inspection configuration.
  final EncryptionConfiguration? encryptionConfiguration;

  /// The last time that the TLS inspection configuration was changed.
  final DateTime? lastModifiedTime;

  /// The number of firewall policies that use this TLS inspection configuration.
  final int? numberOfAssociations;

  /// Detailed information about the current status of a
  /// <a>TLSInspectionConfiguration</a>. You can retrieve this for a TLS
  /// inspection configuration by calling
  /// <a>DescribeTLSInspectionConfiguration</a> and providing the TLS inspection
  /// configuration name and ARN.
  final ResourceStatus? tLSInspectionConfigurationStatus;

  /// The key:value pairs to associate with the resource.
  final List<Tag>? tags;

  TLSInspectionConfigurationResponse({
    required this.tLSInspectionConfigurationArn,
    required this.tLSInspectionConfigurationId,
    required this.tLSInspectionConfigurationName,
    this.certificateAuthority,
    this.certificates,
    this.description,
    this.encryptionConfiguration,
    this.lastModifiedTime,
    this.numberOfAssociations,
    this.tLSInspectionConfigurationStatus,
    this.tags,
  });

  factory TLSInspectionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return TLSInspectionConfigurationResponse(
      tLSInspectionConfigurationArn:
          json['TLSInspectionConfigurationArn'] as String,
      tLSInspectionConfigurationId:
          json['TLSInspectionConfigurationId'] as String,
      tLSInspectionConfigurationName:
          json['TLSInspectionConfigurationName'] as String,
      certificateAuthority: json['CertificateAuthority'] != null
          ? TlsCertificateData.fromJson(
              json['CertificateAuthority'] as Map<String, dynamic>)
          : null,
      certificates: (json['Certificates'] as List?)
          ?.whereNotNull()
          .map((e) => TlsCertificateData.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      encryptionConfiguration: json['EncryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['EncryptionConfiguration'] as Map<String, dynamic>)
          : null,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      numberOfAssociations: json['NumberOfAssociations'] as int?,
      tLSInspectionConfigurationStatus:
          (json['TLSInspectionConfigurationStatus'] as String?)
              ?.toResourceStatus(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tLSInspectionConfigurationArn = this.tLSInspectionConfigurationArn;
    final tLSInspectionConfigurationId = this.tLSInspectionConfigurationId;
    final tLSInspectionConfigurationName = this.tLSInspectionConfigurationName;
    final certificateAuthority = this.certificateAuthority;
    final certificates = this.certificates;
    final description = this.description;
    final encryptionConfiguration = this.encryptionConfiguration;
    final lastModifiedTime = this.lastModifiedTime;
    final numberOfAssociations = this.numberOfAssociations;
    final tLSInspectionConfigurationStatus =
        this.tLSInspectionConfigurationStatus;
    final tags = this.tags;
    return {
      'TLSInspectionConfigurationArn': tLSInspectionConfigurationArn,
      'TLSInspectionConfigurationId': tLSInspectionConfigurationId,
      'TLSInspectionConfigurationName': tLSInspectionConfigurationName,
      if (certificateAuthority != null)
        'CertificateAuthority': certificateAuthority,
      if (certificates != null) 'Certificates': certificates,
      if (description != null) 'Description': description,
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (numberOfAssociations != null)
        'NumberOfAssociations': numberOfAssociations,
      if (tLSInspectionConfigurationStatus != null)
        'TLSInspectionConfigurationStatus':
            tLSInspectionConfigurationStatus.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A key:value pair associated with an Amazon Web Services resource. The
/// key:value pair can be anything you define. Typically, the tag key represents
/// a category (such as "environment") and the tag value represents a specific
/// value within that category (such as "test," "development," or "production").
/// You can add up to 50 tags to each Amazon Web Services resource.
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

extension TargetTypeValueExtension on TargetType {
  String toValue() {
    switch (this) {
      case TargetType.tlsSni:
        return 'TLS_SNI';
      case TargetType.httpHost:
        return 'HTTP_HOST';
    }
  }
}

extension TargetTypeFromString on String {
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

/// Contains metadata about an Certificate Manager certificate.
class TlsCertificateData {
  /// The Amazon Resource Name (ARN) of the certificate.
  final String? certificateArn;

  /// The serial number of the certificate.
  final String? certificateSerial;

  /// The status of the certificate.
  final String? status;

  /// Contains details about the certificate status, including information about
  /// certificate errors.
  final String? statusMessage;

  TlsCertificateData({
    this.certificateArn,
    this.certificateSerial,
    this.status,
    this.statusMessage,
  });

  factory TlsCertificateData.fromJson(Map<String, dynamic> json) {
    return TlsCertificateData(
      certificateArn: json['CertificateArn'] as String?,
      certificateSerial: json['CertificateSerial'] as String?,
      status: json['Status'] as String?,
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final certificateSerial = this.certificateSerial;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (certificateArn != null) 'CertificateArn': certificateArn,
      if (certificateSerial != null) 'CertificateSerial': certificateSerial,
      if (status != null) 'Status': status,
      if (statusMessage != null) 'StatusMessage': statusMessage,
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

class UpdateFirewallDeleteProtectionResponse {
  /// A flag indicating whether it is possible to delete the firewall. A setting
  /// of <code>TRUE</code> indicates that the firewall is protected against
  /// deletion. Use this setting to protect against accidentally deleting a
  /// firewall that is in use. When you create a firewall, the operation
  /// initializes this flag to <code>TRUE</code>.
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

class UpdateFirewallEncryptionConfigurationResponse {
  final EncryptionConfiguration? encryptionConfiguration;

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

  UpdateFirewallEncryptionConfigurationResponse({
    this.encryptionConfiguration,
    this.firewallArn,
    this.firewallName,
    this.updateToken,
  });

  factory UpdateFirewallEncryptionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateFirewallEncryptionConfigurationResponse(
      encryptionConfiguration: json['EncryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['EncryptionConfiguration'] as Map<String, dynamic>)
          : null,
      firewallArn: json['FirewallArn'] as String?,
      firewallName: json['FirewallName'] as String?,
      updateToken: json['UpdateToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionConfiguration = this.encryptionConfiguration;
    final firewallArn = this.firewallArn;
    final firewallName = this.firewallName;
    final updateToken = this.updateToken;
    return {
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
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

class UpdateTLSInspectionConfigurationResponse {
  /// The high-level properties of a TLS inspection configuration. This, along
  /// with the <a>TLSInspectionConfiguration</a>, define the TLS inspection
  /// configuration. You can retrieve all objects for a TLS inspection
  /// configuration by calling <a>DescribeTLSInspectionConfiguration</a>.
  final TLSInspectionConfigurationResponse tLSInspectionConfigurationResponse;

  /// A token used for optimistic locking. Network Firewall returns a token to
  /// your requests that access the TLS inspection configuration. The token marks
  /// the state of the TLS inspection configuration resource at the time of the
  /// request.
  ///
  /// To make changes to the TLS inspection configuration, you provide the token
  /// in your request. Network Firewall uses the token to ensure that the TLS
  /// inspection configuration hasn't changed since you last retrieved it. If it
  /// has changed, the operation fails with an <code>InvalidTokenException</code>.
  /// If this happens, retrieve the TLS inspection configuration again to get a
  /// current copy of it with a current token. Reapply your changes as needed,
  /// then try the operation again using the new token.
  final String updateToken;

  UpdateTLSInspectionConfigurationResponse({
    required this.tLSInspectionConfigurationResponse,
    required this.updateToken,
  });

  factory UpdateTLSInspectionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateTLSInspectionConfigurationResponse(
      tLSInspectionConfigurationResponse:
          TLSInspectionConfigurationResponse.fromJson(
              json['TLSInspectionConfigurationResponse']
                  as Map<String, dynamic>),
      updateToken: json['UpdateToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final tLSInspectionConfigurationResponse =
        this.tLSInspectionConfigurationResponse;
    final updateToken = this.updateToken;
    return {
      'TLSInspectionConfigurationResponse': tLSInspectionConfigurationResponse,
      'UpdateToken': updateToken,
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
