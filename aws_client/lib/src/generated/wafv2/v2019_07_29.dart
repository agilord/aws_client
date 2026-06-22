// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2019_07_29.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// This is the latest version of the <b>WAF</b> API, released in November,
/// 2019. The names of the entities that you use to access this API, like
/// endpoints and namespaces, all have the versioning information added, like
/// "V2" or "v2", to distinguish from the prior version. We recommend migrating
/// your resources to this version, because it has a number of significant
/// improvements.
class WafV2 {
  final _s.JsonProtocol _protocol;
  factory WafV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'wafv2',
    );
    return WafV2._(
      protocol: _s.JsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  WafV2._({
    required _s.JsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Associates a web ACL with a resource, to protect the resource.
  ///
  /// Use this for all resource types except for Amazon CloudFront
  /// distributions. For Amazon CloudFront, call <code>UpdateDistribution</code>
  /// for the distribution and provide the Amazon Resource Name (ARN) of the web
  /// ACL in the web ACL ID. For information, see <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html">UpdateDistribution</a>
  /// in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// <b>Required permissions for customer-managed IAM policies</b>
  ///
  /// This call requires permissions that are specific to the protected resource
  /// type. For details, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-AssociateWebACL">Permissions
  /// for AssociateWebACL</a> in the <i>WAF Developer Guide</i>.
  ///
  /// <b>Temporary inconsistencies during updates</b>
  ///
  /// When you create or change a web ACL or other WAF resources, the changes
  /// take a small amount of time to propagate to all areas where the resources
  /// are stored. The propagation time can be from a few seconds to a number of
  /// minutes.
  ///
  /// The following are examples of the temporary inconsistencies that you might
  /// notice during change propagation:
  ///
  /// <ul>
  /// <li>
  /// After you create a web ACL, if you try to associate it with a resource,
  /// you might get an exception indicating that the web ACL is unavailable.
  /// </li>
  /// <li>
  /// After you add a rule group to a web ACL, the new rule group rules might be
  /// in effect in one area where the web ACL is used and not in another.
  /// </li>
  /// <li>
  /// After you change a rule action setting, you might see the old action in
  /// some places and the new action in others.
  /// </li>
  /// <li>
  /// After you add an IP address to an IP set that is in use in a blocking
  /// rule, the new address might be blocked in one area while still allowed in
  /// another.
  /// </li>
  /// </ul>
  ///
  /// May throw [WAFFeatureNotIncludedInPricingPlanException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFUnavailableEntityException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to associate with the web
  /// ACL.
  ///
  /// The ARN must be in one of the following formats:
  ///
  /// <ul>
  /// <li>
  /// For an Application Load Balancer:
  /// <code>arn:<i>partition</i>:elasticloadbalancing:<i>region</i>:<i>account-id</i>:loadbalancer/app/<i>load-balancer-name</i>/<i>load-balancer-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an Amazon API Gateway REST API:
  /// <code>arn:<i>partition</i>:apigateway:<i>region</i>::/restapis/<i>api-id</i>/stages/<i>stage-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an AppSync GraphQL API:
  /// <code>arn:<i>partition</i>:appsync:<i>region</i>:<i>account-id</i>:apis/<i>GraphQLApiId</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an Amazon Cognito user pool:
  /// <code>arn:<i>partition</i>:cognito-idp:<i>region</i>:<i>account-id</i>:userpool/<i>user-pool-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an App Runner service:
  /// <code>arn:<i>partition</i>:apprunner:<i>region</i>:<i>account-id</i>:service/<i>apprunner-service-name</i>/<i>apprunner-service-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an Amazon Web Services Verified Access instance:
  /// <code>arn:<i>partition</i>:ec2:<i>region</i>:<i>account-id</i>:verified-access-instance/<i>instance-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an Amplify application:
  /// <code>arn:<i>partition</i>:amplify:<i>region</i>:<i>account-id</i>:apps/<i>app-id</i>
  /// </code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [webACLArn] :
  /// The Amazon Resource Name (ARN) of the web ACL that you want to associate
  /// with the resource.
  Future<void> associateWebACL({
    required String resourceArn,
    required String webACLArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.AssociateWebACL'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'WebACLArn': webACLArn,
      },
    );
  }

  /// Returns the web ACL capacity unit (WCU) requirements for a specified scope
  /// and set of rules. You can use this to check the capacity requirements for
  /// the rules you want to use in a <a>RuleGroup</a> or <a>WebACL</a>.
  ///
  /// WAF uses WCUs to calculate and control the operating resources that are
  /// used to run your rules, rule groups, and web ACLs. WAF calculates capacity
  /// differently for each rule type, to reflect the relative cost of each rule.
  /// Simple rules that cost little to run use fewer WCUs than more complex
  /// rules that use more processing power. Rule group capacity is fixed at
  /// creation, which helps users plan their web ACL WCU usage when they use a
  /// rule group. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html">WAF
  /// web ACL capacity units (WCU)</a> in the <i>WAF Developer Guide</i>.
  ///
  /// May throw [WAFExpiredManagedRuleGroupVersionException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidResourceException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFSubscriptionNotFoundException].
  /// May throw [WAFUnavailableEntityException].
  ///
  /// Parameter [rules] :
  /// An array of <a>Rule</a> that you're configuring to use in a rule group or
  /// web ACL.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<CheckCapacityResponse> checkCapacity({
    required List<Rule> rules,
    required Scope scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.CheckCapacity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Rules': rules,
        'Scope': scope.value,
      },
    );

    return CheckCapacityResponse.fromJson(jsonResponse.body);
  }

  /// Creates an API key that contains a set of token domains.
  ///
  /// API keys are required for the integration of the CAPTCHA API in your
  /// JavaScript client applications. The API lets you customize the placement
  /// and characteristics of the CAPTCHA puzzle for your end users. For more
  /// information about the CAPTCHA JavaScript integration, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html">WAF
  /// client application integration</a> in the <i>WAF Developer Guide</i>.
  ///
  /// You can use a single key for up to 5 domains. After you generate a key,
  /// you can copy it for use in your JavaScript integration.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tokenDomains] :
  /// The client application domains that you want to use this API key for.
  ///
  /// Example JSON: <code>"TokenDomains": \["abc.com", "store.abc.com"\]</code>
  ///
  /// Public suffixes aren't allowed. For example, you can't use
  /// <code>gov.au</code> or <code>co.uk</code> as token domains.
  Future<CreateAPIKeyResponse> createAPIKey({
    required Scope scope,
    required List<String> tokenDomains,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.CreateAPIKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.value,
        'TokenDomains': tokenDomains,
      },
    );

    return CreateAPIKeyResponse.fromJson(jsonResponse.body);
  }

  /// Creates an <a>IPSet</a>, which you use to identify web requests that
  /// originate from specific IP addresses or ranges of IP addresses. For
  /// example, if you're receiving a lot of requests from a ranges of IP
  /// addresses, you can configure WAF to block them using an IPSet that lists
  /// those IP addresses.
  ///
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [addresses] :
  /// Contains an array of strings that specifies zero or more IP addresses or
  /// blocks of IP addresses that you want WAF to inspect for in incoming
  /// requests. All addresses must be specified using Classless Inter-Domain
  /// Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except
  /// for <code>/0</code>.
  ///
  /// Example address strings:
  ///
  /// <ul>
  /// <li>
  /// For requests that originated from the IP address 192.0.2.44, specify
  /// <code>192.0.2.44/32</code>.
  /// </li>
  /// <li>
  /// For requests that originated from IP addresses from 192.0.2.0 to
  /// 192.0.2.255, specify <code>192.0.2.0/24</code>.
  /// </li>
  /// <li>
  /// For requests that originated from the IP address
  /// 1111:0000:0000:0000:0000:0000:0000:0111, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0111/128</code>.
  /// </li>
  /// <li>
  /// For requests that originated from IP addresses
  /// 1111:0000:0000:0000:0000:0000:0000:0000 to
  /// 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0000/64</code>.
  /// </li>
  /// </ul>
  /// For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  ///
  /// Example JSON <code>Addresses</code> specifications:
  ///
  /// <ul>
  /// <li>
  /// Empty array: <code>"Addresses": \[\]</code>
  /// </li>
  /// <li>
  /// Array with one address: <code>"Addresses": \["192.0.2.44/32"\]</code>
  /// </li>
  /// <li>
  /// Array with three addresses: <code>"Addresses": \["192.0.2.44/32",
  /// "192.0.2.0/24", "192.0.0.0/16"\]</code>
  /// </li>
  /// <li>
  /// INVALID specification: <code>"Addresses": \[""\]</code> INVALID
  /// </li>
  /// </ul>
  ///
  /// Parameter [iPAddressVersion] :
  /// The version of the IP addresses, either <code>IPV4</code> or
  /// <code>IPV6</code>.
  ///
  /// Parameter [name] :
  /// The name of the IP set. You cannot change the name of an
  /// <code>IPSet</code> after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// A description of the IP set that helps with identification.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs to associate with the resource.
  Future<CreateIPSetResponse> createIPSet({
    required List<String> addresses,
    required IPAddressVersion iPAddressVersion,
    required String name,
    required Scope scope,
    String? description,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.CreateIPSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Addresses': addresses,
        'IPAddressVersion': iPAddressVersion.value,
        'Name': name,
        'Scope': scope.value,
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateIPSetResponse.fromJson(jsonResponse.body);
  }

  /// Creates a <a>RegexPatternSet</a>, which you reference in a
  /// <a>RegexPatternSetReferenceStatement</a>, to have WAF inspect a web
  /// request component for the specified patterns.
  ///
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [name] :
  /// The name of the set. You cannot change the name after you create the set.
  ///
  /// Parameter [regularExpressionList] :
  /// Array of regular expression strings.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// A description of the set that helps with identification.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs to associate with the resource.
  Future<CreateRegexPatternSetResponse> createRegexPatternSet({
    required String name,
    required List<Regex> regularExpressionList,
    required Scope scope,
    String? description,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.CreateRegexPatternSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'RegularExpressionList': regularExpressionList,
        'Scope': scope.value,
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRegexPatternSetResponse.fromJson(jsonResponse.body);
  }

  /// Creates a <a>RuleGroup</a> per the specifications provided.
  ///
  /// A rule group defines a collection of rules to inspect and control web
  /// requests that you can use in a <a>WebACL</a>. When you create a rule
  /// group, you define an immutable capacity limit. If you update a rule group,
  /// you must stay within the capacity. This allows others to reuse the rule
  /// group with confidence in its capacity requirements.
  ///
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFSubscriptionNotFoundException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFUnavailableEntityException].
  ///
  /// Parameter [capacity] :
  /// The web ACL capacity units (WCUs) required for this rule group.
  ///
  /// When you create your own rule group, you define this, and you cannot
  /// change it after creation. When you add or modify the rules in a rule
  /// group, WAF enforces this limit. You can check the capacity for a set of
  /// rules using <a>CheckCapacity</a>.
  ///
  /// WAF uses WCUs to calculate and control the operating resources that are
  /// used to run your rules, rule groups, and web ACLs. WAF calculates capacity
  /// differently for each rule type, to reflect the relative cost of each rule.
  /// Simple rules that cost little to run use fewer WCUs than more complex
  /// rules that use more processing power. Rule group capacity is fixed at
  /// creation, which helps users plan their web ACL WCU usage when they use a
  /// rule group. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html">WAF
  /// web ACL capacity units (WCU)</a> in the <i>WAF Developer Guide</i>.
  ///
  /// Parameter [name] :
  /// The name of the rule group. You cannot change the name of a rule group
  /// after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [visibilityConfig] :
  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  ///
  /// Parameter [customResponseBodies] :
  /// A map of custom response keys and content bodies. When you create a rule
  /// with a block action, you can send a custom response to the web request.
  /// You define these for the rule group, and then use them in the rules that
  /// you define in the rule group.
  ///
  /// For information about customizing web requests and responses, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html">Customizing
  /// web requests and responses in WAF</a> in the <i>WAF Developer Guide</i>.
  ///
  /// For information about the limits on count and size for custom request and
  /// response settings, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/limits.html">WAF
  /// quotas</a> in the <i>WAF Developer Guide</i>.
  ///
  /// Parameter [description] :
  /// A description of the rule group that helps with identification.
  ///
  /// Parameter [rules] :
  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to manage. Each rule includes one top-level statement that WAF uses to
  /// identify matching web requests, and parameters that govern how WAF handles
  /// them.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs to associate with the resource.
  Future<CreateRuleGroupResponse> createRuleGroup({
    required int capacity,
    required String name,
    required Scope scope,
    required VisibilityConfig visibilityConfig,
    Map<String, CustomResponseBody>? customResponseBodies,
    String? description,
    List<Rule>? rules,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'capacity',
      capacity,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.CreateRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Capacity': capacity,
        'Name': name,
        'Scope': scope.value,
        'VisibilityConfig': visibilityConfig,
        if (customResponseBodies != null)
          'CustomResponseBodies': customResponseBodies,
        if (description != null) 'Description': description,
        if (rules != null) 'Rules': rules,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a <a>WebACL</a> per the specifications provided.
  ///
  /// A web ACL defines a collection of rules to use to inspect and control web
  /// requests. Each rule has a statement that defines what to look for in web
  /// requests and an action that WAF applies to requests that match the
  /// statement. In the web ACL, you assign a default action to take (allow,
  /// block) for any request that does not match any of the rules. The rules in
  /// a web ACL can be a combination of the types <a>Rule</a>, <a>RuleGroup</a>,
  /// and managed rule group. You can associate a web ACL with one or more
  /// Amazon Web Services resources to protect. The resource types include
  /// Amazon CloudFront distribution, Amazon API Gateway REST API, Application
  /// Load Balancer, AppSync GraphQL API, Amazon Cognito user pool, App Runner
  /// service, Amplify application, and Amazon Web Services Verified Access
  /// instance.
  ///
  /// May throw [WAFConfigurationWarningException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFExpiredManagedRuleGroupVersionException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidResourceException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFSubscriptionNotFoundException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFUnavailableEntityException].
  ///
  /// Parameter [defaultAction] :
  /// The action to perform if none of the <code>Rules</code> contained in the
  /// <code>WebACL</code> match.
  ///
  /// Parameter [name] :
  /// The name of the web ACL. You cannot change the name of a web ACL after you
  /// create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [visibilityConfig] :
  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  ///
  /// Parameter [applicationConfig] :
  /// Configures the ability for the WAF console to store and retrieve
  /// application attributes during the web ACL creation process. Application
  /// attributes help WAF give recommendations for protection packs.
  ///
  /// Parameter [associationConfig] :
  /// Specifies custom configurations for the associations between the web ACL
  /// and protected resources.
  ///
  /// Use this to customize the maximum size of the request body that your
  /// protected resources forward to WAF for inspection. You can customize this
  /// setting for CloudFront, API Gateway, Amazon Cognito, App Runner, or
  /// Verified Access resources. The default setting is 16 KB (16,384 bytes).
  /// <note>
  /// You are charged additional fees when your protected resources forward body
  /// sizes that are larger than the default. For more information, see <a
  /// href="http://aws.amazon.com/waf/pricing/">WAF Pricing</a>.
  /// </note>
  /// For Application Load Balancer and AppSync, the limit is fixed at 8 KB
  /// (8,192 bytes).
  ///
  /// Parameter [captchaConfig] :
  /// Specifies how WAF should handle <code>CAPTCHA</code> evaluations for rules
  /// that don't have their own <code>CaptchaConfig</code> settings. If you
  /// don't specify this, WAF uses its default settings for
  /// <code>CaptchaConfig</code>.
  ///
  /// Parameter [challengeConfig] :
  /// Specifies how WAF should handle challenge evaluations for rules that don't
  /// have their own <code>ChallengeConfig</code> settings. If you don't specify
  /// this, WAF uses its default settings for <code>ChallengeConfig</code>.
  ///
  /// Parameter [customResponseBodies] :
  /// A map of custom response keys and content bodies. When you create a rule
  /// with a block action, you can send a custom response to the web request.
  /// You define these for the web ACL, and then use them in the rules and
  /// default actions that you define in the web ACL.
  ///
  /// For information about customizing web requests and responses, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html">Customizing
  /// web requests and responses in WAF</a> in the <i>WAF Developer Guide</i>.
  ///
  /// For information about the limits on count and size for custom request and
  /// response settings, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/limits.html">WAF
  /// quotas</a> in the <i>WAF Developer Guide</i>.
  ///
  /// Parameter [dataProtectionConfig] :
  /// Specifies data protection to apply to the web request data for the web
  /// ACL. This is a web ACL level data protection option.
  ///
  /// The data protection that you configure for the web ACL alters the data
  /// that's available for any other data collection activity, including your
  /// WAF logging destinations, web ACL request sampling, and Amazon Security
  /// Lake data collection and management. Your other option for data protection
  /// is in the logging configuration, which only affects logging.
  ///
  /// Parameter [description] :
  /// A description of the web ACL that helps with identification.
  ///
  /// Parameter [onSourceDDoSProtectionConfig] :
  /// Specifies the type of DDoS protection to apply to web request data for a
  /// web ACL. For most scenarios, it is recommended to use the default
  /// protection level, <code>ACTIVE_UNDER_DDOS</code>. If a web ACL is
  /// associated with multiple Application Load Balancers, the changes you make
  /// to DDoS protection in that web ACL will apply to all associated
  /// Application Load Balancers.
  ///
  /// Parameter [rules] :
  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to manage. Each rule includes one top-level statement that WAF uses to
  /// identify matching web requests, and parameters that govern how WAF handles
  /// them.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs to associate with the resource.
  ///
  /// Parameter [tokenDomains] :
  /// Specifies the domains that WAF should accept in a web request token. This
  /// enables the use of tokens across multiple protected websites. When WAF
  /// provides a token, it uses the domain of the Amazon Web Services resource
  /// that the web ACL is protecting. If you don't specify a list of token
  /// domains, WAF accepts tokens only for the domain of the protected resource.
  /// With a token domain list, WAF accepts the resource's host domain plus all
  /// domains in the token domain list, including their prefixed subdomains.
  ///
  /// Example JSON: <code>"TokenDomains": { "mywebsite.com",
  /// "myotherwebsite.com" }</code>
  ///
  /// Public suffixes aren't allowed. For example, you can't use
  /// <code>gov.au</code> or <code>co.uk</code> as token domains.
  Future<CreateWebACLResponse> createWebACL({
    required DefaultAction defaultAction,
    required String name,
    required Scope scope,
    required VisibilityConfig visibilityConfig,
    ApplicationConfig? applicationConfig,
    AssociationConfig? associationConfig,
    CaptchaConfig? captchaConfig,
    ChallengeConfig? challengeConfig,
    Map<String, CustomResponseBody>? customResponseBodies,
    DataProtectionConfig? dataProtectionConfig,
    String? description,
    OnSourceDDoSProtectionConfig? onSourceDDoSProtectionConfig,
    List<Rule>? rules,
    List<Tag>? tags,
    List<String>? tokenDomains,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.CreateWebACL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DefaultAction': defaultAction,
        'Name': name,
        'Scope': scope.value,
        'VisibilityConfig': visibilityConfig,
        if (applicationConfig != null) 'ApplicationConfig': applicationConfig,
        if (associationConfig != null) 'AssociationConfig': associationConfig,
        if (captchaConfig != null) 'CaptchaConfig': captchaConfig,
        if (challengeConfig != null) 'ChallengeConfig': challengeConfig,
        if (customResponseBodies != null)
          'CustomResponseBodies': customResponseBodies,
        if (dataProtectionConfig != null)
          'DataProtectionConfig': dataProtectionConfig,
        if (description != null) 'Description': description,
        if (onSourceDDoSProtectionConfig != null)
          'OnSourceDDoSProtectionConfig': onSourceDDoSProtectionConfig,
        if (rules != null) 'Rules': rules,
        if (tags != null) 'Tags': tags,
        if (tokenDomains != null) 'TokenDomains': tokenDomains,
      },
    );

    return CreateWebACLResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified API key.
  ///
  /// After you delete a key, it can take up to 24 hours for WAF to disallow use
  /// of the key in all regions.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  ///
  /// Parameter [aPIKey] :
  /// The encrypted API key that you want to delete.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<void> deleteAPIKey({
    required String aPIKey,
    required Scope scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteAPIKey'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'APIKey': aPIKey,
        'Scope': scope.value,
      },
    );
  }

  /// Deletes all rule groups that are managed by Firewall Manager from the
  /// specified <a>WebACL</a>.
  ///
  /// You can only use this if <code>ManagedByFirewallManager</code> and
  /// <code>RetrofittedByFirewallManager</code> are both false in the web ACL.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  ///
  /// Parameter [webACLArn] :
  /// The Amazon Resource Name (ARN) of the web ACL.
  ///
  /// Parameter [webACLLockToken] :
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity
  /// associated with the token, you provide the token to operations like
  /// <code>update</code> and <code>delete</code>. WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it.
  /// If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// <code>get</code>, and use the new token returned by that operation.
  Future<DeleteFirewallManagerRuleGroupsResponse>
      deleteFirewallManagerRuleGroups({
    required String webACLArn,
    required String webACLLockToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteFirewallManagerRuleGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WebACLArn': webACLArn,
        'WebACLLockToken': webACLLockToken,
      },
    );

    return DeleteFirewallManagerRuleGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified <a>IPSet</a>.
  ///
  /// May throw [WAFAssociatedItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity
  /// associated with the token, you provide the token to operations like
  /// <code>update</code> and <code>delete</code>. WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it.
  /// If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// <code>get</code>, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the IP set. You cannot change the name of an
  /// <code>IPSet</code> after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<void> deleteIPSet({
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteIPSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.value,
      },
    );
  }

  /// Deletes the <a>LoggingConfiguration</a> from the specified web ACL.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the web ACL from which you want to
  /// delete the <a>LoggingConfiguration</a>.
  ///
  /// Parameter [logScope] :
  /// The owner of the logging configuration, which must be set to
  /// <code>CUSTOMER</code> for the configurations that you manage.
  ///
  /// The log scope <code>SECURITY_LAKE</code> indicates a configuration that is
  /// managed through Amazon Security Lake. You can use Security Lake to collect
  /// log and event data from various sources for normalization, analysis, and
  /// management. For information, see <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html">Collecting
  /// data from Amazon Web Services services</a> in the <i>Amazon Security Lake
  /// user guide</i>.
  ///
  /// The log scope <code>CLOUDWATCH_TELEMETRY_RULE_MANAGED</code> indicates a
  /// configuration that is managed through Amazon CloudWatch Logs for telemetry
  /// data collection and analysis. For information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html">What
  /// is Amazon CloudWatch Logs ?</a> in the <i>Amazon CloudWatch Logs user
  /// guide</i>.
  ///
  /// Default: <code>CUSTOMER</code>
  ///
  /// Parameter [logType] :
  /// Used to distinguish between various logging options. Currently, there is
  /// one option.
  ///
  /// Default: <code>WAF_LOGS</code>
  Future<void> deleteLoggingConfiguration({
    required String resourceArn,
    LogScope? logScope,
    LogType? logType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteLoggingConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (logScope != null) 'LogScope': logScope.value,
        if (logType != null) 'LogType': logType.value,
      },
    );
  }

  /// Permanently deletes an IAM policy from the specified rule group.
  ///
  /// You must be the owner of the rule group to perform this operation.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the rule group from which you want to
  /// delete the policy.
  ///
  /// You must be the owner of the rule group to perform this operation.
  Future<void> deletePermissionPolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeletePermissionPolicy'
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

  /// Deletes the specified <a>RegexPatternSet</a>.
  ///
  /// May throw [WAFAssociatedItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity
  /// associated with the token, you provide the token to operations like
  /// <code>update</code> and <code>delete</code>. WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it.
  /// If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// <code>get</code>, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the set. You cannot change the name after you create the set.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<void> deleteRegexPatternSet({
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteRegexPatternSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.value,
      },
    );
  }

  /// Deletes the specified <a>RuleGroup</a>.
  ///
  /// May throw [WAFAssociatedItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the rule group. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity
  /// associated with the token, you provide the token to operations like
  /// <code>update</code> and <code>delete</code>. WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it.
  /// If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// <code>get</code>, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the rule group. You cannot change the name of a rule group
  /// after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<void> deleteRuleGroup({
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteRuleGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.value,
      },
    );
  }

  /// Deletes the specified <a>WebACL</a>.
  ///
  /// You can only use this if <code>ManagedByFirewallManager</code> is false in
  /// the web ACL.
  /// <note>
  /// Before deleting any web ACL, first disassociate it from all resources.
  ///
  /// <ul>
  /// <li>
  /// To retrieve a list of the resources that are associated with a web ACL,
  /// use the following calls:
  ///
  /// <ul>
  /// <li>
  /// For Amazon CloudFront distributions, use the CloudFront call
  /// <code>ListDistributionsByWebACLId</code>. For information, see <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_ListDistributionsByWebACLId.html">ListDistributionsByWebACLId</a>
  /// in the <i>Amazon CloudFront API Reference</i>.
  /// </li>
  /// <li>
  /// For all other resources, call <a>ListResourcesForWebACL</a>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// To disassociate a resource from a web ACL, use the following calls:
  ///
  /// <ul>
  /// <li>
  /// For Amazon CloudFront distributions, provide an empty web ACL ID in the
  /// CloudFront call <code>UpdateDistribution</code>. For information, see <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html">UpdateDistribution</a>
  /// in the <i>Amazon CloudFront API Reference</i>.
  /// </li>
  /// <li>
  /// For all other resources, call <a>DisassociateWebACL</a>.
  /// </li>
  /// </ul> </li>
  /// </ul> </note>
  ///
  /// May throw [WAFAssociatedItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the web ACL. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity
  /// associated with the token, you provide the token to operations like
  /// <code>update</code> and <code>delete</code>. WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it.
  /// If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// <code>get</code>, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the web ACL. You cannot change the name of a web ACL after you
  /// create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<void> deleteWebACL({
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteWebACL'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.value,
      },
    );
  }

  /// Provides high-level information for the Amazon Web Services Managed Rules
  /// rule groups and Amazon Web Services Marketplace managed rule groups.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<DescribeAllManagedProductsResponse> describeAllManagedProducts({
    required Scope scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DescribeAllManagedProducts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.value,
      },
    );

    return DescribeAllManagedProductsResponse.fromJson(jsonResponse.body);
  }

  /// Provides high-level information for the managed rule groups owned by a
  /// specific vendor.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [vendorName] :
  /// The name of the managed rule group vendor. You use this, along with the
  /// rule group name, to identify a rule group.
  Future<DescribeManagedProductsByVendorResponse>
      describeManagedProductsByVendor({
    required Scope scope,
    required String vendorName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DescribeManagedProductsByVendor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.value,
        'VendorName': vendorName,
      },
    );

    return DescribeManagedProductsByVendorResponse.fromJson(jsonResponse.body);
  }

  /// Provides high-level information for a managed rule group, including
  /// descriptions of the rules.
  ///
  /// May throw [WAFExpiredManagedRuleGroupVersionException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidResourceException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [name] :
  /// The name of the managed rule group. You use this, along with the vendor
  /// name, to identify the rule group.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [vendorName] :
  /// The name of the managed rule group vendor. You use this, along with the
  /// rule group name, to identify a rule group.
  ///
  /// Parameter [versionName] :
  /// The version of the rule group. You can only use a version that is not
  /// scheduled for expiration. If you don't provide this, WAF uses the vendor's
  /// default version.
  Future<DescribeManagedRuleGroupResponse> describeManagedRuleGroup({
    required String name,
    required Scope scope,
    required String vendorName,
    String? versionName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DescribeManagedRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'Scope': scope.value,
        'VendorName': vendorName,
        if (versionName != null) 'VersionName': versionName,
      },
    );

    return DescribeManagedRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// Disassociates the specified resource from its web ACL association, if it
  /// has one.
  ///
  /// Use this for all resource types except for Amazon CloudFront
  /// distributions. For Amazon CloudFront, call <code>UpdateDistribution</code>
  /// for the distribution and provide an empty web ACL ID. For information, see
  /// <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html">UpdateDistribution</a>
  /// in the <i>Amazon CloudFront API Reference</i>.
  ///
  /// <b>Required permissions for customer-managed IAM policies</b>
  ///
  /// This call requires permissions that are specific to the protected resource
  /// type. For details, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-DisassociateWebACL">Permissions
  /// for DisassociateWebACL</a> in the <i>WAF Developer Guide</i>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to disassociate from the
  /// web ACL.
  ///
  /// The ARN must be in one of the following formats:
  ///
  /// <ul>
  /// <li>
  /// For an Application Load Balancer:
  /// <code>arn:<i>partition</i>:elasticloadbalancing:<i>region</i>:<i>account-id</i>:loadbalancer/app/<i>load-balancer-name</i>/<i>load-balancer-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an Amazon API Gateway REST API:
  /// <code>arn:<i>partition</i>:apigateway:<i>region</i>::/restapis/<i>api-id</i>/stages/<i>stage-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an AppSync GraphQL API:
  /// <code>arn:<i>partition</i>:appsync:<i>region</i>:<i>account-id</i>:apis/<i>GraphQLApiId</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an Amazon Cognito user pool:
  /// <code>arn:<i>partition</i>:cognito-idp:<i>region</i>:<i>account-id</i>:userpool/<i>user-pool-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an App Runner service:
  /// <code>arn:<i>partition</i>:apprunner:<i>region</i>:<i>account-id</i>:service/<i>apprunner-service-name</i>/<i>apprunner-service-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an Amazon Web Services Verified Access instance:
  /// <code>arn:<i>partition</i>:ec2:<i>region</i>:<i>account-id</i>:verified-access-instance/<i>instance-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an Amplify application:
  /// <code>arn:<i>partition</i>:amplify:<i>region</i>:<i>account-id</i>:apps/<i>app-id</i>
  /// </code>
  /// </li>
  /// </ul>
  Future<void> disassociateWebACL({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DisassociateWebACL'
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

  /// Generates a presigned download URL for the specified release of the mobile
  /// SDK.
  ///
  /// The mobile SDK is not generally available. Customers who have access to
  /// the mobile SDK can use it to establish and manage WAF tokens for use in
  /// HTTP(S) requests from a mobile device to WAF. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html">WAF
  /// client application integration</a> in the <i>WAF Developer Guide</i>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [platform] :
  /// The device platform.
  ///
  /// Parameter [releaseVersion] :
  /// The release version. For the latest available version, specify
  /// <code>LATEST</code>.
  Future<GenerateMobileSdkReleaseUrlResponse> generateMobileSdkReleaseUrl({
    required Platform platform,
    required String releaseVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GenerateMobileSdkReleaseUrl'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Platform': platform.value,
        'ReleaseVersion': releaseVersion,
      },
    );

    return GenerateMobileSdkReleaseUrlResponse.fromJson(jsonResponse.body);
  }

  /// Returns your API key in decrypted form. Use this to check the token
  /// domains that you have defined for the key.
  ///
  /// API keys are required for the integration of the CAPTCHA API in your
  /// JavaScript client applications. The API lets you customize the placement
  /// and characteristics of the CAPTCHA puzzle for your end users. For more
  /// information about the CAPTCHA JavaScript integration, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html">WAF
  /// client application integration</a> in the <i>WAF Developer Guide</i>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidResourceException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [aPIKey] :
  /// The encrypted API key.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<GetDecryptedAPIKeyResponse> getDecryptedAPIKey({
    required String aPIKey,
    required Scope scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetDecryptedAPIKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'APIKey': aPIKey,
        'Scope': scope.value,
      },
    );

    return GetDecryptedAPIKeyResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the specified <a>IPSet</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  ///
  /// Parameter [name] :
  /// The name of the IP set. You cannot change the name of an
  /// <code>IPSet</code> after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<GetIPSetResponse> getIPSet({
    required String id,
    required String name,
    required Scope scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetIPSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'Name': name,
        'Scope': scope.value,
      },
    );

    return GetIPSetResponse.fromJson(jsonResponse.body);
  }

  /// Returns the <a>LoggingConfiguration</a> for the specified web ACL.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the web ACL for which you want to get
  /// the <a>LoggingConfiguration</a>.
  ///
  /// Parameter [logScope] :
  /// The owner of the logging configuration, which must be set to
  /// <code>CUSTOMER</code> for the configurations that you manage.
  ///
  /// The log scope <code>SECURITY_LAKE</code> indicates a configuration that is
  /// managed through Amazon Security Lake. You can use Security Lake to collect
  /// log and event data from various sources for normalization, analysis, and
  /// management. For information, see <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html">Collecting
  /// data from Amazon Web Services services</a> in the <i>Amazon Security Lake
  /// user guide</i>.
  ///
  /// The log scope <code>CLOUDWATCH_TELEMETRY_RULE_MANAGED</code> indicates a
  /// configuration that is managed through Amazon CloudWatch Logs for telemetry
  /// data collection and analysis. For information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html">What
  /// is Amazon CloudWatch Logs ?</a> in the <i>Amazon CloudWatch Logs user
  /// guide</i>.
  ///
  /// Default: <code>CUSTOMER</code>
  ///
  /// Parameter [logType] :
  /// Used to distinguish between various logging options. Currently, there is
  /// one option.
  ///
  /// Default: <code>WAF_LOGS</code>
  Future<GetLoggingConfigurationResponse> getLoggingConfiguration({
    required String resourceArn,
    LogScope? logScope,
    LogType? logType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetLoggingConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (logScope != null) 'LogScope': logScope.value,
        if (logType != null) 'LogType': logType.value,
      },
    );

    return GetLoggingConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the specified managed rule set.
  /// <note>
  /// This is intended for use only by vendors of managed rule sets. Vendors are
  /// Amazon Web Services and Amazon Web Services Marketplace sellers.
  ///
  /// Vendors, you can use the managed rule set APIs to provide controlled
  /// rollout of your versioned managed rule group offerings for your customers.
  /// The APIs are <code>ListManagedRuleSets</code>,
  /// <code>GetManagedRuleSet</code>, <code>PutManagedRuleSetVersions</code>,
  /// and <code>UpdateManagedRuleSetVersionExpiryDate</code>.
  /// </note>
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the managed rule set. The ID is returned in the
  /// responses to commands like <code>list</code>. You provide it to operations
  /// like <code>get</code> and <code>update</code>.
  ///
  /// Parameter [name] :
  /// The name of the managed rule set. You use this, along with the rule set
  /// ID, to identify the rule set.
  ///
  /// This name is assigned to the corresponding managed rule group, which your
  /// customers can access and use.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<GetManagedRuleSetResponse> getManagedRuleSet({
    required String id,
    required String name,
    required Scope scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetManagedRuleSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'Name': name,
        'Scope': scope.value,
      },
    );

    return GetManagedRuleSetResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information for the specified mobile SDK release, including
  /// release notes and tags.
  ///
  /// The mobile SDK is not generally available. Customers who have access to
  /// the mobile SDK can use it to establish and manage WAF tokens for use in
  /// HTTP(S) requests from a mobile device to WAF. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html">WAF
  /// client application integration</a> in the <i>WAF Developer Guide</i>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [platform] :
  /// The device platform.
  ///
  /// Parameter [releaseVersion] :
  /// The release version. For the latest available version, specify
  /// <code>LATEST</code>.
  Future<GetMobileSdkReleaseResponse> getMobileSdkRelease({
    required Platform platform,
    required String releaseVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetMobileSdkRelease'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Platform': platform.value,
        'ReleaseVersion': releaseVersion,
      },
    );

    return GetMobileSdkReleaseResponse.fromJson(jsonResponse.body);
  }

  /// Returns the IAM policy that is attached to the specified rule group.
  ///
  /// You must be the owner of the rule group to perform this operation.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the rule group for which you want to get
  /// the policy.
  Future<GetPermissionPolicyResponse> getPermissionPolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetPermissionPolicy'
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

    return GetPermissionPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the IP addresses that are currently blocked by a rate-based rule
  /// instance. This is only available for rate-based rules that aggregate
  /// solely on the IP address or on the forwarded IP address.
  ///
  /// The maximum number of addresses that can be blocked for a single
  /// rate-based rule instance is 10,000. If more than 10,000 addresses exceed
  /// the rate limit, those with the highest rates are blocked.
  ///
  /// For a rate-based rule that you've defined inside a rule group, provide the
  /// name of the rule group reference statement in your request, in addition to
  /// the rate-based rule name and the web ACL name.
  ///
  /// WAF monitors web requests and manages keys independently for each unique
  /// combination of web ACL, optional rule group, and rate-based rule. For
  /// example, if you define a rate-based rule inside a rule group, and then use
  /// the rule group in a web ACL, WAF monitors web requests and manages keys
  /// for that web ACL, rule group reference statement, and rate-based rule
  /// instance. If you use the same rule group in a second web ACL, WAF monitors
  /// web requests and manages keys for this second usage completely independent
  /// of your first.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFUnsupportedAggregateKeyTypeException].
  ///
  /// Parameter [ruleName] :
  /// The name of the rate-based rule to get the keys for. If you have the rule
  /// defined inside a rule group that you're using in your web ACL, also
  /// provide the name of the rule group reference statement in the request
  /// parameter <code>RuleGroupRuleName</code>.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [webACLId] :
  /// The unique identifier for the web ACL. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [webACLName] :
  /// The name of the web ACL. You cannot change the name of a web ACL after you
  /// create it.
  ///
  /// Parameter [ruleGroupRuleName] :
  /// The name of the rule group reference statement in your web ACL. This is
  /// required only when you have the rate-based rule nested inside a rule
  /// group.
  Future<GetRateBasedStatementManagedKeysResponse>
      getRateBasedStatementManagedKeys({
    required String ruleName,
    required Scope scope,
    required String webACLId,
    required String webACLName,
    String? ruleGroupRuleName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetRateBasedStatementManagedKeys'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RuleName': ruleName,
        'Scope': scope.value,
        'WebACLId': webACLId,
        'WebACLName': webACLName,
        if (ruleGroupRuleName != null) 'RuleGroupRuleName': ruleGroupRuleName,
      },
    );

    return GetRateBasedStatementManagedKeysResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the specified <a>RegexPatternSet</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  ///
  /// Parameter [name] :
  /// The name of the set. You cannot change the name after you create the set.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<GetRegexPatternSetResponse> getRegexPatternSet({
    required String id,
    required String name,
    required Scope scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetRegexPatternSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'Name': name,
        'Scope': scope.value,
      },
    );

    return GetRegexPatternSetResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the specified <a>RuleGroup</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the entity.
  ///
  /// Parameter [id] :
  /// A unique identifier for the rule group. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [name] :
  /// The name of the rule group. You cannot change the name of a rule group
  /// after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<GetRuleGroupResponse> getRuleGroup({
    String? arn,
    String? id,
    String? name,
    Scope? scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (arn != null) 'ARN': arn,
        if (id != null) 'Id': id,
        if (name != null) 'Name': name,
        if (scope != null) 'Scope': scope.value,
      },
    );

    return GetRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// Gets detailed information about a specified number of requests--a
  /// sample--that WAF randomly selects from among the first 5,000 requests that
  /// your Amazon Web Services resource received during a time range that you
  /// choose. You can specify a sample size of up to 500 requests, and you can
  /// specify any time range in the previous three hours.
  ///
  /// <code>GetSampledRequests</code> returns a time range, which is usually the
  /// time range that you specified. However, if your resource (such as a
  /// CloudFront distribution) received 5,000 requests before the specified time
  /// range elapsed, <code>GetSampledRequests</code> returns an updated time
  /// range. This new time range indicates the actual period during which WAF
  /// selected the requests in the sample.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [maxItems] :
  /// The number of requests that you want WAF to return from among the first
  /// 5,000 requests that your Amazon Web Services resource received during the
  /// time range. If your resource received fewer requests than the value of
  /// <code>MaxItems</code>, <code>GetSampledRequests</code> returns information
  /// about all of them.
  ///
  /// Parameter [ruleMetricName] :
  /// The metric name assigned to the <code>Rule</code> or
  /// <code>RuleGroup</code> dimension for which you want a sample of requests.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [timeWindow] :
  /// The start date and time and the end date and time of the range for which
  /// you want <code>GetSampledRequests</code> to return a sample of requests.
  /// You must specify the times in Coordinated Universal Time (UTC) format. UTC
  /// format includes the special designator, <code>Z</code>. For example,
  /// <code>"2016-09-27T14:50Z"</code>. You can specify any time range in the
  /// previous three hours. If you specify a start time that's earlier than
  /// three hours ago, WAF sets it to three hours ago.
  ///
  /// Parameter [webAclArn] :
  /// The Amazon resource name (ARN) of the <code>WebACL</code> for which you
  /// want a sample of requests.
  Future<GetSampledRequestsResponse> getSampledRequests({
    required int maxItems,
    required String ruleMetricName,
    required Scope scope,
    required TimeWindow timeWindow,
    required String webAclArn,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      500,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetSampledRequests'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxItems': maxItems,
        'RuleMetricName': ruleMetricName,
        'Scope': scope.value,
        'TimeWindow': timeWindow,
        'WebAclArn': webAclArn,
      },
    );

    return GetSampledRequestsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves aggregated statistics about the top URI paths accessed by bot
  /// traffic for a specified web ACL and time window. You can use this
  /// operation to analyze which paths on your web application receive the most
  /// bot traffic and identify the specific bots accessing those paths. The
  /// operation supports filtering by bot category, organization, or name, and
  /// allows you to drill down into specific path prefixes to view detailed
  /// URI-level statistics.
  ///
  /// May throw [WAFFeatureNotIncludedInPricingPlanException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [limit] :
  /// The maximum number of path statistics to return. Valid values are 1 to
  /// 100.
  ///
  /// Parameter [numberOfTopTrafficBotsPerPath] :
  /// The maximum number of top bots to include in the statistics for each path.
  /// Valid values are 1 to 10.
  ///
  /// Parameter [scope] :
  /// Specifies whether the web ACL is for an Amazon Web Services CloudFront
  /// distribution or for a regional application. A regional application can be
  /// an Application Load Balancer, an AppSync GraphQL API, an Amazon Cognito
  /// user pool, an Amazon Web Services App Runner service, or an Amazon Web
  /// Services Verified Access instance.
  ///
  /// Parameter [timeWindow] :
  /// The time window for which you want to retrieve path statistics. The time
  /// window must be within the data retention period for your web ACL.
  ///
  /// Parameter [webAclArn] :
  /// The Amazon Resource Name (ARN) of the web ACL for which you want to
  /// retrieve path statistics.
  ///
  /// Parameter [botCategory] :
  /// Filters the results to include only traffic from bots in the specified
  /// category. For example, you can filter by <code>ai</code> to see only AI
  /// crawler traffic, or <code>search_engine</code> to see only search engine
  /// bot traffic. When you apply this filter, the <code>Source</code> field is
  /// populated in the response.
  ///
  /// Parameter [botName] :
  /// Filters the results to include only traffic from the specified bot. For
  /// example, you can filter by <code>gptbot</code> or <code>googlebot</code>.
  /// When you apply this filter, the <code>Source</code> field is populated in
  /// the response.
  ///
  /// Parameter [botOrganization] :
  /// Filters the results to include only traffic from bots belonging to the
  /// specified organization. For example, you can filter by <code>openai</code>
  /// or <code>google</code>. When you apply this filter, the
  /// <code>Source</code> field is populated in the response.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  ///
  /// Parameter [uriPathPrefix] :
  /// A URI path prefix to filter the results. When you specify this parameter,
  /// the operation returns statistics for individual URIs within the specified
  /// path prefix. For example, if you specify <code>/api</code>, the response
  /// includes statistics for paths like <code>/api/v1/users</code> and
  /// <code>/api/v2/orders</code>. If you don't specify this parameter, the
  /// operation returns top-level path statistics.
  Future<GetTopPathStatisticsByTrafficResponse> getTopPathStatisticsByTraffic({
    required int limit,
    required int numberOfTopTrafficBotsPerPath,
    required Scope scope,
    required TimeWindow timeWindow,
    required String webAclArn,
    String? botCategory,
    String? botName,
    String? botOrganization,
    String? nextMarker,
    String? uriPathPrefix,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
      isRequired: true,
    );
    _s.validateNumRange(
      'numberOfTopTrafficBotsPerPath',
      numberOfTopTrafficBotsPerPath,
      1,
      10,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetTopPathStatisticsByTraffic'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Limit': limit,
        'NumberOfTopTrafficBotsPerPath': numberOfTopTrafficBotsPerPath,
        'Scope': scope.value,
        'TimeWindow': timeWindow,
        'WebAclArn': webAclArn,
        if (botCategory != null) 'BotCategory': botCategory,
        if (botName != null) 'BotName': botName,
        if (botOrganization != null) 'BotOrganization': botOrganization,
        if (nextMarker != null) 'NextMarker': nextMarker,
        if (uriPathPrefix != null) 'UriPathPrefix': uriPathPrefix,
      },
    );

    return GetTopPathStatisticsByTrafficResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the specified <a>WebACL</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the web ACL that you want to retrieve.
  ///
  /// Parameter [id] :
  /// The unique identifier for the web ACL. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [name] :
  /// The name of the web ACL. You cannot change the name of a web ACL after you
  /// create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  Future<GetWebACLResponse> getWebACL({
    String? arn,
    String? id,
    String? name,
    Scope? scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetWebACL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (arn != null) 'ARN': arn,
        if (id != null) 'Id': id,
        if (name != null) 'Name': name,
        if (scope != null) 'Scope': scope.value,
      },
    );

    return GetWebACLResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the <a>WebACL</a> for the specified resource.
  ///
  /// This call uses <code>GetWebACL</code>, to verify that your account has
  /// permission to access the retrieved web ACL. If you get an error that
  /// indicates that your account isn't authorized to perform
  /// <code>wafv2:GetWebACL</code> on the resource, that error won't be included
  /// in your CloudTrail event history.
  ///
  /// For Amazon CloudFront, don't use this call. Instead, call the CloudFront
  /// action <code>GetDistributionConfig</code>. For information, see <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_GetDistributionConfig.html">GetDistributionConfig</a>
  /// in the <i>Amazon CloudFront API Reference</i>.
  ///
  /// <b>Required permissions for customer-managed IAM policies</b>
  ///
  /// This call requires permissions that are specific to the protected resource
  /// type. For details, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-GetWebACLForResource">Permissions
  /// for GetWebACLForResource</a> in the <i>WAF Developer Guide</i>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFUnavailableEntityException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource whose web ACL you want to
  /// retrieve.
  ///
  /// The ARN must be in one of the following formats:
  ///
  /// <ul>
  /// <li>
  /// For an Application Load Balancer:
  /// <code>arn:<i>partition</i>:elasticloadbalancing:<i>region</i>:<i>account-id</i>:loadbalancer/app/<i>load-balancer-name</i>/<i>load-balancer-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an Amazon API Gateway REST API:
  /// <code>arn:<i>partition</i>:apigateway:<i>region</i>::/restapis/<i>api-id</i>/stages/<i>stage-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an AppSync GraphQL API:
  /// <code>arn:<i>partition</i>:appsync:<i>region</i>:<i>account-id</i>:apis/<i>GraphQLApiId</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an Amazon Cognito user pool:
  /// <code>arn:<i>partition</i>:cognito-idp:<i>region</i>:<i>account-id</i>:userpool/<i>user-pool-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an App Runner service:
  /// <code>arn:<i>partition</i>:apprunner:<i>region</i>:<i>account-id</i>:service/<i>apprunner-service-name</i>/<i>apprunner-service-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an Amazon Web Services Verified Access instance:
  /// <code>arn:<i>partition</i>:ec2:<i>region</i>:<i>account-id</i>:verified-access-instance/<i>instance-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an Amplify application:
  /// <code>arn:<i>partition</i>:amplify:<i>region</i>:<i>account-id</i>:apps/<i>app-id</i>
  /// </code>
  /// </li>
  /// </ul>
  Future<GetWebACLForResourceResponse> getWebACLForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.GetWebACLForResource'
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

    return GetWebACLForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of the API keys that you've defined for the specified
  /// scope.
  ///
  /// API keys are required for the integration of the CAPTCHA API in your
  /// JavaScript client applications. The API lets you customize the placement
  /// and characteristics of the CAPTCHA puzzle for your end users. For more
  /// information about the CAPTCHA JavaScript integration, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html">WAF
  /// client application integration</a> in the <i>WAF Developer Guide</i>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidResourceException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want WAF to return for this
  /// request. If more objects are available, in the response, WAF provides a
  /// <code>NextMarker</code> value that you can use in a subsequent call to get
  /// the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListAPIKeysResponse> listAPIKeys({
    required Scope scope,
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListAPIKeys'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.value,
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListAPIKeysResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves an array of managed rule groups that are available for you to
  /// use. This list includes all Amazon Web Services Managed Rules rule groups
  /// and all of the Amazon Web Services Marketplace managed rule groups that
  /// you're subscribed to.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want WAF to return for this
  /// request. If more objects are available, in the response, WAF provides a
  /// <code>NextMarker</code> value that you can use in a subsequent call to get
  /// the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListAvailableManagedRuleGroupsResponse>
      listAvailableManagedRuleGroups({
    required Scope scope,
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListAvailableManagedRuleGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.value,
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListAvailableManagedRuleGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of the available versions for the specified managed rule
  /// group.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [name] :
  /// The name of the managed rule group. You use this, along with the vendor
  /// name, to identify the rule group.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [vendorName] :
  /// The name of the managed rule group vendor. You use this, along with the
  /// rule group name, to identify a rule group.
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want WAF to return for this
  /// request. If more objects are available, in the response, WAF provides a
  /// <code>NextMarker</code> value that you can use in a subsequent call to get
  /// the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListAvailableManagedRuleGroupVersionsResponse>
      listAvailableManagedRuleGroupVersions({
    required String name,
    required Scope scope,
    required String vendorName,
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListAvailableManagedRuleGroupVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'Scope': scope.value,
        'VendorName': vendorName,
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListAvailableManagedRuleGroupVersionsResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves an array of <a>IPSetSummary</a> objects for the IP sets that you
  /// manage.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want WAF to return for this
  /// request. If more objects are available, in the response, WAF provides a
  /// <code>NextMarker</code> value that you can use in a subsequent call to get
  /// the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListIPSetsResponse> listIPSets({
    required Scope scope,
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListIPSets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.value,
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListIPSetsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves an array of your <a>LoggingConfiguration</a> objects.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want WAF to return for this
  /// request. If more objects are available, in the response, WAF provides a
  /// <code>NextMarker</code> value that you can use in a subsequent call to get
  /// the next batch of objects.
  ///
  /// Parameter [logScope] :
  /// The owner of the logging configuration, which must be set to
  /// <code>CUSTOMER</code> for the configurations that you manage.
  ///
  /// The log scope <code>SECURITY_LAKE</code> indicates a configuration that is
  /// managed through Amazon Security Lake. You can use Security Lake to collect
  /// log and event data from various sources for normalization, analysis, and
  /// management. For information, see <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html">Collecting
  /// data from Amazon Web Services services</a> in the <i>Amazon Security Lake
  /// user guide</i>.
  ///
  /// The log scope <code>CLOUDWATCH_TELEMETRY_RULE_MANAGED</code> indicates a
  /// configuration that is managed through Amazon CloudWatch Logs for telemetry
  /// data collection and analysis. For information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html">What
  /// is Amazon CloudWatch Logs ?</a> in the <i>Amazon CloudWatch Logs user
  /// guide</i>.
  ///
  /// Default: <code>CUSTOMER</code>
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListLoggingConfigurationsResponse> listLoggingConfigurations({
    required Scope scope,
    int? limit,
    LogScope? logScope,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListLoggingConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.value,
        if (limit != null) 'Limit': limit,
        if (logScope != null) 'LogScope': logScope.value,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListLoggingConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the managed rule sets that you own.
  /// <note>
  /// This is intended for use only by vendors of managed rule sets. Vendors are
  /// Amazon Web Services and Amazon Web Services Marketplace sellers.
  ///
  /// Vendors, you can use the managed rule set APIs to provide controlled
  /// rollout of your versioned managed rule group offerings for your customers.
  /// The APIs are <code>ListManagedRuleSets</code>,
  /// <code>GetManagedRuleSet</code>, <code>PutManagedRuleSetVersions</code>,
  /// and <code>UpdateManagedRuleSetVersionExpiryDate</code>.
  /// </note>
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want WAF to return for this
  /// request. If more objects are available, in the response, WAF provides a
  /// <code>NextMarker</code> value that you can use in a subsequent call to get
  /// the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListManagedRuleSetsResponse> listManagedRuleSets({
    required Scope scope,
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListManagedRuleSets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.value,
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListManagedRuleSetsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of the available releases for the mobile SDK and the
  /// specified device platform.
  ///
  /// The mobile SDK is not generally available. Customers who have access to
  /// the mobile SDK can use it to establish and manage WAF tokens for use in
  /// HTTP(S) requests from a mobile device to WAF. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html">WAF
  /// client application integration</a> in the <i>WAF Developer Guide</i>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [platform] :
  /// The device platform to retrieve the list for.
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want WAF to return for this
  /// request. If more objects are available, in the response, WAF provides a
  /// <code>NextMarker</code> value that you can use in a subsequent call to get
  /// the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListMobileSdkReleasesResponse> listMobileSdkReleases({
    required Platform platform,
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListMobileSdkReleases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Platform': platform.value,
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListMobileSdkReleasesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves an array of <a>RegexPatternSetSummary</a> objects for the regex
  /// pattern sets that you manage.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want WAF to return for this
  /// request. If more objects are available, in the response, WAF provides a
  /// <code>NextMarker</code> value that you can use in a subsequent call to get
  /// the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListRegexPatternSetsResponse> listRegexPatternSets({
    required Scope scope,
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListRegexPatternSets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.value,
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListRegexPatternSetsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves an array of the Amazon Resource Names (ARNs) for the resources
  /// that are associated with the specified web ACL.
  ///
  /// For Amazon CloudFront, don't use this call. Instead, use the CloudFront
  /// call <code>ListDistributionsByWebACLId</code>. For information, see <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_ListDistributionsByWebACLId.html">ListDistributionsByWebACLId</a>
  /// in the <i>Amazon CloudFront API Reference</i>.
  ///
  /// <b>Required permissions for customer-managed IAM policies</b>
  ///
  /// This call requires permissions that are specific to the protected resource
  /// type. For details, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-ListResourcesForWebACL">Permissions
  /// for ListResourcesForWebACL</a> in the <i>WAF Developer Guide</i>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [webACLArn] :
  /// The Amazon Resource Name (ARN) of the web ACL.
  ///
  /// Parameter [resourceType] :
  /// Retrieves the web ACLs that are used by the specified resource type.
  ///
  /// For Amazon CloudFront, don't use this call. Instead, use the CloudFront
  /// call <code>ListDistributionsByWebACLId</code>. For information, see <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_ListDistributionsByWebACLId.html">ListDistributionsByWebACLId</a>
  /// in the <i>Amazon CloudFront API Reference</i>.
  /// <note>
  /// If you don't provide a resource type, the call uses the resource type
  /// <code>APPLICATION_LOAD_BALANCER</code>.
  /// </note>
  /// Default: <code>APPLICATION_LOAD_BALANCER</code>
  Future<ListResourcesForWebACLResponse> listResourcesForWebACL({
    required String webACLArn,
    ResourceType? resourceType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListResourcesForWebACL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WebACLArn': webACLArn,
        if (resourceType != null) 'ResourceType': resourceType.value,
      },
    );

    return ListResourcesForWebACLResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves an array of <a>RuleGroupSummary</a> objects for the rule groups
  /// that you manage.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want WAF to return for this
  /// request. If more objects are available, in the response, WAF provides a
  /// <code>NextMarker</code> value that you can use in a subsequent call to get
  /// the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListRuleGroupsResponse> listRuleGroups({
    required Scope scope,
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListRuleGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.value,
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListRuleGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the <a>TagInfoForResource</a> for the specified resource. Tags
  /// are key:value pairs that you can use to categorize and manage your
  /// resources, for purposes like billing. For example, you might set the tag
  /// key to "customer" and the value to the customer name or ID. You can
  /// specify one or more tags to add to each Amazon Web Services resource, up
  /// to 50 tags for a resource.
  ///
  /// You can tag the Amazon Web Services resources that you manage through WAF:
  /// web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage
  /// or view tags through the WAF console.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want WAF to return for this
  /// request. If more objects are available, in the response, WAF provides a
  /// <code>NextMarker</code> value that you can use in a subsequent call to get
  /// the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves an array of <a>WebACLSummary</a> objects for the web ACLs that
  /// you manage.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want WAF to return for this
  /// request. If more objects are available, in the response, WAF provides a
  /// <code>NextMarker</code> value that you can use in a subsequent call to get
  /// the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListWebACLsResponse> listWebACLs({
    required Scope scope,
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.ListWebACLs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Scope': scope.value,
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListWebACLsResponse.fromJson(jsonResponse.body);
  }

  /// Enables the specified <a>LoggingConfiguration</a>, to start logging from a
  /// web ACL, according to the configuration provided.
  ///
  /// If you configure data protection for the web ACL, the protection applies
  /// to the data that WAF sends to the logs.
  /// <note>
  /// This operation completely replaces any mutable specifications that you
  /// already have for a logging configuration with the ones that you provide to
  /// this call.
  ///
  /// To modify an existing logging configuration, do the following:
  /// <ol>
  /// <li>
  /// Retrieve it by calling <a>GetLoggingConfiguration</a>
  /// </li>
  /// <li>
  /// Update its settings as needed
  /// </li>
  /// <li>
  /// Provide the complete logging configuration specification to this call
  /// </li> </ol> </note> <note>
  /// You can define one logging destination per web ACL.
  /// </note>
  /// You can access information about the traffic that WAF inspects using the
  /// following steps:
  /// <ol>
  /// <li>
  /// Create your logging destination. You can use an Amazon CloudWatch Logs log
  /// group, an Amazon Simple Storage Service (Amazon S3) bucket, or an Amazon
  /// Kinesis Data Firehose.
  ///
  /// The name that you give the destination must start with
  /// <code>aws-waf-logs-</code>. Depending on the type of destination, you
  /// might need to configure additional settings or permissions.
  ///
  /// For configuration requirements and pricing information for each
  /// destination type, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/logging.html">Logging
  /// web ACL traffic</a> in the <i>WAF Developer Guide</i>.
  /// </li>
  /// <li>
  /// Associate your logging destination to your web ACL using a
  /// <code>PutLoggingConfiguration</code> request.
  /// </li> </ol>
  /// When you successfully enable logging using a
  /// <code>PutLoggingConfiguration</code> request, WAF creates an additional
  /// role or policy that is required to write logs to the logging destination.
  /// For an Amazon CloudWatch Logs log group, WAF creates a resource policy on
  /// the log group. For an Amazon S3 bucket, WAF creates a bucket policy. For
  /// an Amazon Kinesis Data Firehose, WAF creates a service-linked role.
  ///
  /// For additional information about web ACL logging, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/logging.html">Logging
  /// web ACL traffic information</a> in the <i>WAF Developer Guide</i>.
  ///
  /// May throw [WAFFeatureNotIncludedInPricingPlanException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFLogDestinationPermissionIssueException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFServiceLinkedRoleErrorException].
  ///
  /// Parameter [loggingConfiguration] :
  ///
  Future<PutLoggingConfigurationResponse> putLoggingConfiguration({
    required LoggingConfiguration loggingConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.PutLoggingConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LoggingConfiguration': loggingConfiguration,
      },
    );

    return PutLoggingConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Defines the versions of your managed rule set that you are offering to the
  /// customers. Customers see your offerings as managed rule groups with
  /// versioning.
  /// <note>
  /// This is intended for use only by vendors of managed rule sets. Vendors are
  /// Amazon Web Services and Amazon Web Services Marketplace sellers.
  ///
  /// Vendors, you can use the managed rule set APIs to provide controlled
  /// rollout of your versioned managed rule group offerings for your customers.
  /// The APIs are <code>ListManagedRuleSets</code>,
  /// <code>GetManagedRuleSet</code>, <code>PutManagedRuleSetVersions</code>,
  /// and <code>UpdateManagedRuleSetVersionExpiryDate</code>.
  /// </note>
  /// Customers retrieve their managed rule group list by calling
  /// <a>ListAvailableManagedRuleGroups</a>. The name that you provide here for
  /// your managed rule set is the name the customer sees for the corresponding
  /// managed rule group. Customers can retrieve the available versions for a
  /// managed rule group by calling
  /// <a>ListAvailableManagedRuleGroupVersions</a>. You provide a rule group
  /// specification for each version. For each managed rule set, you must
  /// specify a version that you recommend using.
  ///
  /// To initiate the expiration of a managed rule group version, use
  /// <a>UpdateManagedRuleSetVersionExpiryDate</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the managed rule set. The ID is returned in the
  /// responses to commands like <code>list</code>. You provide it to operations
  /// like <code>get</code> and <code>update</code>.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity
  /// associated with the token, you provide the token to operations like
  /// <code>update</code> and <code>delete</code>. WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it.
  /// If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// <code>get</code>, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the managed rule set. You use this, along with the rule set
  /// ID, to identify the rule set.
  ///
  /// This name is assigned to the corresponding managed rule group, which your
  /// customers can access and use.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [recommendedVersion] :
  /// The version of the named managed rule group that you'd like your customers
  /// to choose, from among your version offerings.
  ///
  /// Parameter [versionsToPublish] :
  /// The versions of the named managed rule group that you want to offer to
  /// your customers.
  Future<PutManagedRuleSetVersionsResponse> putManagedRuleSetVersions({
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
    String? recommendedVersion,
    Map<String, VersionToPublish>? versionsToPublish,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.PutManagedRuleSetVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.value,
        if (recommendedVersion != null)
          'RecommendedVersion': recommendedVersion,
        if (versionsToPublish != null) 'VersionsToPublish': versionsToPublish,
      },
    );

    return PutManagedRuleSetVersionsResponse.fromJson(jsonResponse.body);
  }

  /// Use this to share a rule group with other accounts.
  ///
  /// This action attaches an IAM policy to the specified resource. You must be
  /// the owner of the rule group to perform this operation.
  ///
  /// This action is subject to the following restrictions:
  ///
  /// <ul>
  /// <li>
  /// You can attach only one policy with each <code>PutPermissionPolicy</code>
  /// request.
  /// </li>
  /// <li>
  /// The ARN in the request must be a valid WAF <a>RuleGroup</a> ARN and the
  /// rule group must exist in the same Region.
  /// </li>
  /// <li>
  /// The user making the request must be the owner of the rule group.
  /// </li>
  /// </ul>
  /// If a rule group has been shared with your account, you can access it
  /// through the call <code>GetRuleGroup</code>, and you can reference it in
  /// <code>CreateWebACL</code> and <code>UpdateWebACL</code>. Rule groups that
  /// are shared with you don't appear in your WAF console rule groups listing.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidPermissionPolicyException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [policy] :
  /// The policy to attach to the specified rule group.
  ///
  /// The policy specifications must conform to the following:
  ///
  /// <ul>
  /// <li>
  /// The policy must be composed using IAM Policy version 2012-10-17.
  /// </li>
  /// <li>
  /// The policy must include specifications for <code>Effect</code>,
  /// <code>Action</code>, and <code>Principal</code>.
  /// </li>
  /// <li>
  /// <code>Effect</code> must specify <code>Allow</code>.
  /// </li>
  /// <li>
  /// <code>Action</code> must specify <code>wafv2:CreateWebACL</code>,
  /// <code>wafv2:UpdateWebACL</code>, and
  /// <code>wafv2:PutFirewallManagerRuleGroups</code> and may optionally specify
  /// <code>wafv2:GetRuleGroup</code>. WAF rejects any extra actions or wildcard
  /// actions in the policy.
  /// </li>
  /// <li>
  /// The policy must not include a <code>Resource</code> parameter.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html">IAM
  /// Policies</a>.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the <a>RuleGroup</a> to which you want
  /// to attach the policy.
  Future<void> putPermissionPolicy({
    required String policy,
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.PutPermissionPolicy'
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

  /// Associates tags with the specified Amazon Web Services resource. Tags are
  /// key:value pairs that you can use to categorize and manage your resources,
  /// for purposes like billing. For example, you might set the tag key to
  /// "customer" and the value to the customer name or ID. You can specify one
  /// or more tags to add to each Amazon Web Services resource, up to 50 tags
  /// for a resource.
  ///
  /// You can tag the Amazon Web Services resources that you manage through WAF:
  /// web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage
  /// or view tags through the WAF console.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs to associate with the resource.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// Disassociates tags from an Amazon Web Services resource. Tags are
  /// key:value pairs that you can associate with Amazon Web Services resources.
  /// For example, the tag key might be "customer" and the tag value might be
  /// "companyA." You can specify one or more tags to add to each container. You
  /// can add up to 50 tags to each Amazon Web Services resource.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// An array of keys identifying the tags to disassociate from the resource.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates the specified <a>IPSet</a>.
  /// <note>
  /// This operation completely replaces the mutable specifications that you
  /// already have for the IP set with the ones that you provide to this call.
  ///
  /// To modify an IP set, do the following:
  /// <ol>
  /// <li>
  /// Retrieve it by calling <a>GetIPSet</a>
  /// </li>
  /// <li>
  /// Update its settings as needed
  /// </li>
  /// <li>
  /// Provide the complete IP set specification to this call
  /// </li> </ol> </note>
  /// <b>Temporary inconsistencies during updates</b>
  ///
  /// When you create or change a web ACL or other WAF resources, the changes
  /// take a small amount of time to propagate to all areas where the resources
  /// are stored. The propagation time can be from a few seconds to a number of
  /// minutes.
  ///
  /// The following are examples of the temporary inconsistencies that you might
  /// notice during change propagation:
  ///
  /// <ul>
  /// <li>
  /// After you create a web ACL, if you try to associate it with a resource,
  /// you might get an exception indicating that the web ACL is unavailable.
  /// </li>
  /// <li>
  /// After you add a rule group to a web ACL, the new rule group rules might be
  /// in effect in one area where the web ACL is used and not in another.
  /// </li>
  /// <li>
  /// After you change a rule action setting, you might see the old action in
  /// some places and the new action in others.
  /// </li>
  /// <li>
  /// After you add an IP address to an IP set that is in use in a blocking
  /// rule, the new address might be blocked in one area while still allowed in
  /// another.
  /// </li>
  /// </ul>
  ///
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  ///
  /// Parameter [addresses] :
  /// Contains an array of strings that specifies zero or more IP addresses or
  /// blocks of IP addresses that you want WAF to inspect for in incoming
  /// requests. All addresses must be specified using Classless Inter-Domain
  /// Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except
  /// for <code>/0</code>.
  ///
  /// Example address strings:
  ///
  /// <ul>
  /// <li>
  /// For requests that originated from the IP address 192.0.2.44, specify
  /// <code>192.0.2.44/32</code>.
  /// </li>
  /// <li>
  /// For requests that originated from IP addresses from 192.0.2.0 to
  /// 192.0.2.255, specify <code>192.0.2.0/24</code>.
  /// </li>
  /// <li>
  /// For requests that originated from the IP address
  /// 1111:0000:0000:0000:0000:0000:0000:0111, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0111/128</code>.
  /// </li>
  /// <li>
  /// For requests that originated from IP addresses
  /// 1111:0000:0000:0000:0000:0000:0000:0000 to
  /// 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0000/64</code>.
  /// </li>
  /// </ul>
  /// For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  ///
  /// Example JSON <code>Addresses</code> specifications:
  ///
  /// <ul>
  /// <li>
  /// Empty array: <code>"Addresses": \[\]</code>
  /// </li>
  /// <li>
  /// Array with one address: <code>"Addresses": \["192.0.2.44/32"\]</code>
  /// </li>
  /// <li>
  /// Array with three addresses: <code>"Addresses": \["192.0.2.44/32",
  /// "192.0.2.0/24", "192.0.0.0/16"\]</code>
  /// </li>
  /// <li>
  /// INVALID specification: <code>"Addresses": \[""\]</code> INVALID
  /// </li>
  /// </ul>
  ///
  /// Parameter [id] :
  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity
  /// associated with the token, you provide the token to operations like
  /// <code>update</code> and <code>delete</code>. WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it.
  /// If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// <code>get</code>, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the IP set. You cannot change the name of an
  /// <code>IPSet</code> after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// A description of the IP set that helps with identification.
  Future<UpdateIPSetResponse> updateIPSet({
    required List<String> addresses,
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.UpdateIPSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Addresses': addresses,
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.value,
        if (description != null) 'Description': description,
      },
    );

    return UpdateIPSetResponse.fromJson(jsonResponse.body);
  }

  /// Updates the expiration information for your managed rule set. Use this to
  /// initiate the expiration of a managed rule group version. After you
  /// initiate expiration for a version, WAF excludes it from the response to
  /// <a>ListAvailableManagedRuleGroupVersions</a> for the managed rule group.
  /// <note>
  /// This is intended for use only by vendors of managed rule sets. Vendors are
  /// Amazon Web Services and Amazon Web Services Marketplace sellers.
  ///
  /// Vendors, you can use the managed rule set APIs to provide controlled
  /// rollout of your versioned managed rule group offerings for your customers.
  /// The APIs are <code>ListManagedRuleSets</code>,
  /// <code>GetManagedRuleSet</code>, <code>PutManagedRuleSetVersions</code>,
  /// and <code>UpdateManagedRuleSetVersionExpiryDate</code>.
  /// </note>
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  ///
  /// Parameter [expiryTimestamp] :
  /// The time that you want the version to expire.
  ///
  /// Times are in Coordinated Universal Time (UTC) format. UTC format includes
  /// the special designator, Z. For example, "2016-09-27T14:50Z".
  ///
  /// Parameter [id] :
  /// A unique identifier for the managed rule set. The ID is returned in the
  /// responses to commands like <code>list</code>. You provide it to operations
  /// like <code>get</code> and <code>update</code>.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity
  /// associated with the token, you provide the token to operations like
  /// <code>update</code> and <code>delete</code>. WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it.
  /// If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// <code>get</code>, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the managed rule set. You use this, along with the rule set
  /// ID, to identify the rule set.
  ///
  /// This name is assigned to the corresponding managed rule group, which your
  /// customers can access and use.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [versionToExpire] :
  /// The version that you want to remove from your list of offerings for the
  /// named managed rule group.
  Future<UpdateManagedRuleSetVersionExpiryDateResponse>
      updateManagedRuleSetVersionExpiryDate({
    required DateTime expiryTimestamp,
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
    required String versionToExpire,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.UpdateManagedRuleSetVersionExpiryDate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExpiryTimestamp': unixTimestampToJson(expiryTimestamp),
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.value,
        'VersionToExpire': versionToExpire,
      },
    );

    return UpdateManagedRuleSetVersionExpiryDateResponse.fromJson(
        jsonResponse.body);
  }

  /// Updates the specified <a>RegexPatternSet</a>.
  /// <note>
  /// This operation completely replaces the mutable specifications that you
  /// already have for the regex pattern set with the ones that you provide to
  /// this call.
  ///
  /// To modify a regex pattern set, do the following:
  /// <ol>
  /// <li>
  /// Retrieve it by calling <a>GetRegexPatternSet</a>
  /// </li>
  /// <li>
  /// Update its settings as needed
  /// </li>
  /// <li>
  /// Provide the complete regex pattern set specification to this call
  /// </li> </ol> </note>
  /// <b>Temporary inconsistencies during updates</b>
  ///
  /// When you create or change a web ACL or other WAF resources, the changes
  /// take a small amount of time to propagate to all areas where the resources
  /// are stored. The propagation time can be from a few seconds to a number of
  /// minutes.
  ///
  /// The following are examples of the temporary inconsistencies that you might
  /// notice during change propagation:
  ///
  /// <ul>
  /// <li>
  /// After you create a web ACL, if you try to associate it with a resource,
  /// you might get an exception indicating that the web ACL is unavailable.
  /// </li>
  /// <li>
  /// After you add a rule group to a web ACL, the new rule group rules might be
  /// in effect in one area where the web ACL is used and not in another.
  /// </li>
  /// <li>
  /// After you change a rule action setting, you might see the old action in
  /// some places and the new action in others.
  /// </li>
  /// <li>
  /// After you add an IP address to an IP set that is in use in a blocking
  /// rule, the new address might be blocked in one area while still allowed in
  /// another.
  /// </li>
  /// </ul>
  ///
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity
  /// associated with the token, you provide the token to operations like
  /// <code>update</code> and <code>delete</code>. WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it.
  /// If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// <code>get</code>, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the set. You cannot change the name after you create the set.
  ///
  /// Parameter [regularExpressionList] :
  ///
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// A description of the set that helps with identification.
  Future<UpdateRegexPatternSetResponse> updateRegexPatternSet({
    required String id,
    required String lockToken,
    required String name,
    required List<Regex> regularExpressionList,
    required Scope scope,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.UpdateRegexPatternSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'RegularExpressionList': regularExpressionList,
        'Scope': scope.value,
        if (description != null) 'Description': description,
      },
    );

    return UpdateRegexPatternSetResponse.fromJson(jsonResponse.body);
  }

  /// Updates the specified <a>RuleGroup</a>.
  /// <note>
  /// This operation completely replaces the mutable specifications that you
  /// already have for the rule group with the ones that you provide to this
  /// call.
  ///
  /// To modify a rule group, do the following:
  /// <ol>
  /// <li>
  /// Retrieve it by calling <a>GetRuleGroup</a>
  /// </li>
  /// <li>
  /// Update its settings as needed
  /// </li>
  /// <li>
  /// Provide the complete rule group specification to this call
  /// </li> </ol> </note>
  /// A rule group defines a collection of rules to inspect and control web
  /// requests that you can use in a <a>WebACL</a>. When you create a rule
  /// group, you define an immutable capacity limit. If you update a rule group,
  /// you must stay within the capacity. This allows others to reuse the rule
  /// group with confidence in its capacity requirements.
  ///
  /// <b>Temporary inconsistencies during updates</b>
  ///
  /// When you create or change a web ACL or other WAF resources, the changes
  /// take a small amount of time to propagate to all areas where the resources
  /// are stored. The propagation time can be from a few seconds to a number of
  /// minutes.
  ///
  /// The following are examples of the temporary inconsistencies that you might
  /// notice during change propagation:
  ///
  /// <ul>
  /// <li>
  /// After you create a web ACL, if you try to associate it with a resource,
  /// you might get an exception indicating that the web ACL is unavailable.
  /// </li>
  /// <li>
  /// After you add a rule group to a web ACL, the new rule group rules might be
  /// in effect in one area where the web ACL is used and not in another.
  /// </li>
  /// <li>
  /// After you change a rule action setting, you might see the old action in
  /// some places and the new action in others.
  /// </li>
  /// <li>
  /// After you add an IP address to an IP set that is in use in a blocking
  /// rule, the new address might be blocked in one area while still allowed in
  /// another.
  /// </li>
  /// </ul>
  ///
  /// May throw [WAFConfigurationWarningException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFSubscriptionNotFoundException].
  /// May throw [WAFUnavailableEntityException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the rule group. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity
  /// associated with the token, you provide the token to operations like
  /// <code>update</code> and <code>delete</code>. WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it.
  /// If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// <code>get</code>, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the rule group. You cannot change the name of a rule group
  /// after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [visibilityConfig] :
  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  ///
  /// Parameter [customResponseBodies] :
  /// A map of custom response keys and content bodies. When you create a rule
  /// with a block action, you can send a custom response to the web request.
  /// You define these for the rule group, and then use them in the rules that
  /// you define in the rule group.
  ///
  /// For information about customizing web requests and responses, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html">Customizing
  /// web requests and responses in WAF</a> in the <i>WAF Developer Guide</i>.
  ///
  /// For information about the limits on count and size for custom request and
  /// response settings, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/limits.html">WAF
  /// quotas</a> in the <i>WAF Developer Guide</i>.
  ///
  /// Parameter [description] :
  /// A description of the rule group that helps with identification.
  ///
  /// Parameter [rules] :
  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to manage. Each rule includes one top-level statement that WAF uses to
  /// identify matching web requests, and parameters that govern how WAF handles
  /// them.
  Future<UpdateRuleGroupResponse> updateRuleGroup({
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
    required VisibilityConfig visibilityConfig,
    Map<String, CustomResponseBody>? customResponseBodies,
    String? description,
    List<Rule>? rules,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.UpdateRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.value,
        'VisibilityConfig': visibilityConfig,
        if (customResponseBodies != null)
          'CustomResponseBodies': customResponseBodies,
        if (description != null) 'Description': description,
        if (rules != null) 'Rules': rules,
      },
    );

    return UpdateRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// Updates the specified <a>WebACL</a>. While updating a web ACL, WAF
  /// provides continuous coverage to the resources that you have associated
  /// with the web ACL.
  /// <note>
  /// This operation completely replaces the mutable specifications that you
  /// already have for the web ACL with the ones that you provide to this call.
  ///
  /// To modify a web ACL, do the following:
  /// <ol>
  /// <li>
  /// Retrieve it by calling <a>GetWebACL</a>
  /// </li>
  /// <li>
  /// Update its settings as needed
  /// </li>
  /// <li>
  /// Provide the complete web ACL specification to this call
  /// </li> </ol> </note>
  /// A web ACL defines a collection of rules to use to inspect and control web
  /// requests. Each rule has a statement that defines what to look for in web
  /// requests and an action that WAF applies to requests that match the
  /// statement. In the web ACL, you assign a default action to take (allow,
  /// block) for any request that does not match any of the rules. The rules in
  /// a web ACL can be a combination of the types <a>Rule</a>, <a>RuleGroup</a>,
  /// and managed rule group. You can associate a web ACL with one or more
  /// Amazon Web Services resources to protect. The resource types include
  /// Amazon CloudFront distribution, Amazon API Gateway REST API, Application
  /// Load Balancer, AppSync GraphQL API, Amazon Cognito user pool, App Runner
  /// service, Amplify application, and Amazon Web Services Verified Access
  /// instance.
  ///
  /// <b>Temporary inconsistencies during updates</b>
  ///
  /// When you create or change a web ACL or other WAF resources, the changes
  /// take a small amount of time to propagate to all areas where the resources
  /// are stored. The propagation time can be from a few seconds to a number of
  /// minutes.
  ///
  /// The following are examples of the temporary inconsistencies that you might
  /// notice during change propagation:
  ///
  /// <ul>
  /// <li>
  /// After you create a web ACL, if you try to associate it with a resource,
  /// you might get an exception indicating that the web ACL is unavailable.
  /// </li>
  /// <li>
  /// After you add a rule group to a web ACL, the new rule group rules might be
  /// in effect in one area where the web ACL is used and not in another.
  /// </li>
  /// <li>
  /// After you change a rule action setting, you might see the old action in
  /// some places and the new action in others.
  /// </li>
  /// <li>
  /// After you add an IP address to an IP set that is in use in a blocking
  /// rule, the new address might be blocked in one area while still allowed in
  /// another.
  /// </li>
  /// </ul>
  ///
  /// May throw [WAFConfigurationWarningException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFExpiredManagedRuleGroupVersionException].
  /// May throw [WAFFeatureNotIncludedInPricingPlanException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidResourceException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFSubscriptionNotFoundException].
  /// May throw [WAFUnavailableEntityException].
  ///
  /// Parameter [defaultAction] :
  /// The action to perform if none of the <code>Rules</code> contained in the
  /// <code>WebACL</code> match.
  ///
  /// Parameter [id] :
  /// The unique identifier for the web ACL. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity
  /// associated with the token, you provide the token to operations like
  /// <code>update</code> and <code>delete</code>. WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it.
  /// If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// <code>get</code>, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the web ACL. You cannot change the name of a web ACL after you
  /// create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for a global resource type, such as a Amazon
  /// CloudFront distribution. For an Amplify application, use
  /// <code>CLOUDFRONT</code>.
  ///
  /// To work with CloudFront, you must also specify the Region US East (N.
  /// Virginia) as follows:
  ///
  /// <ul>
  /// <li>
  /// CLI - Specify the Region when you use the CloudFront scope:
  /// <code>--scope=CLOUDFRONT --region=us-east-1</code>.
  /// </li>
  /// <li>
  /// API and SDKs - For all calls, use the Region endpoint us-east-1.
  /// </li>
  /// </ul>
  ///
  /// Parameter [visibilityConfig] :
  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  ///
  /// Parameter [applicationConfig] :
  /// Configures the ability for the WAF console to store and retrieve
  /// application attributes. Application attributes help WAF give
  /// recommendations for protection packs.
  ///
  /// When using <code>UpdateWebACL</code>, <code>ApplicationConfig</code>
  /// follows these rules:
  ///
  /// <ul>
  /// <li>
  /// If you omit <code>ApplicationConfig</code> from the request, all existing
  /// entries in the web ACL are retained.
  /// </li>
  /// <li>
  /// If you include <code>ApplicationConfig</code>, entries must match the
  /// existing values exactly. Any attempt to modify existing entries will
  /// result in an error.
  /// </li>
  /// </ul>
  ///
  /// Parameter [associationConfig] :
  /// Specifies custom configurations for the associations between the web ACL
  /// and protected resources.
  ///
  /// Use this to customize the maximum size of the request body that your
  /// protected resources forward to WAF for inspection. You can customize this
  /// setting for CloudFront, API Gateway, Amazon Cognito, App Runner, or
  /// Verified Access resources. The default setting is 16 KB (16,384 bytes).
  /// <note>
  /// You are charged additional fees when your protected resources forward body
  /// sizes that are larger than the default. For more information, see <a
  /// href="http://aws.amazon.com/waf/pricing/">WAF Pricing</a>.
  /// </note>
  /// For Application Load Balancer and AppSync, the limit is fixed at 8 KB
  /// (8,192 bytes).
  ///
  /// Parameter [captchaConfig] :
  /// Specifies how WAF should handle <code>CAPTCHA</code> evaluations for rules
  /// that don't have their own <code>CaptchaConfig</code> settings. If you
  /// don't specify this, WAF uses its default settings for
  /// <code>CaptchaConfig</code>.
  ///
  /// Parameter [challengeConfig] :
  /// Specifies how WAF should handle challenge evaluations for rules that don't
  /// have their own <code>ChallengeConfig</code> settings. If you don't specify
  /// this, WAF uses its default settings for <code>ChallengeConfig</code>.
  ///
  /// Parameter [customResponseBodies] :
  /// A map of custom response keys and content bodies. When you create a rule
  /// with a block action, you can send a custom response to the web request.
  /// You define these for the web ACL, and then use them in the rules and
  /// default actions that you define in the web ACL.
  ///
  /// For information about customizing web requests and responses, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html">Customizing
  /// web requests and responses in WAF</a> in the <i>WAF Developer Guide</i>.
  ///
  /// For information about the limits on count and size for custom request and
  /// response settings, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/limits.html">WAF
  /// quotas</a> in the <i>WAF Developer Guide</i>.
  ///
  /// Parameter [dataProtectionConfig] :
  /// Specifies data protection to apply to the web request data for the web
  /// ACL. This is a web ACL level data protection option.
  ///
  /// The data protection that you configure for the web ACL alters the data
  /// that's available for any other data collection activity, including your
  /// WAF logging destinations, web ACL request sampling, and Amazon Security
  /// Lake data collection and management. Your other option for data protection
  /// is in the logging configuration, which only affects logging.
  ///
  /// Parameter [description] :
  /// A description of the web ACL that helps with identification.
  ///
  /// Parameter [onSourceDDoSProtectionConfig] :
  /// Specifies the type of DDoS protection to apply to web request data for a
  /// web ACL. For most scenarios, it is recommended to use the default
  /// protection level, <code>ACTIVE_UNDER_DDOS</code>. If a web ACL is
  /// associated with multiple Application Load Balancers, the changes you make
  /// to DDoS protection in that web ACL will apply to all associated
  /// Application Load Balancers.
  ///
  /// Parameter [rules] :
  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to manage. Each rule includes one top-level statement that WAF uses to
  /// identify matching web requests, and parameters that govern how WAF handles
  /// them.
  ///
  /// Parameter [tokenDomains] :
  /// Specifies the domains that WAF should accept in a web request token. This
  /// enables the use of tokens across multiple protected websites. When WAF
  /// provides a token, it uses the domain of the Amazon Web Services resource
  /// that the web ACL is protecting. If you don't specify a list of token
  /// domains, WAF accepts tokens only for the domain of the protected resource.
  /// With a token domain list, WAF accepts the resource's host domain plus all
  /// domains in the token domain list, including their prefixed subdomains.
  ///
  /// Example JSON: <code>"TokenDomains": { "mywebsite.com",
  /// "myotherwebsite.com" }</code>
  ///
  /// Public suffixes aren't allowed. For example, you can't use
  /// <code>gov.au</code> or <code>co.uk</code> as token domains.
  Future<UpdateWebACLResponse> updateWebACL({
    required DefaultAction defaultAction,
    required String id,
    required String lockToken,
    required String name,
    required Scope scope,
    required VisibilityConfig visibilityConfig,
    ApplicationConfig? applicationConfig,
    AssociationConfig? associationConfig,
    CaptchaConfig? captchaConfig,
    ChallengeConfig? challengeConfig,
    Map<String, CustomResponseBody>? customResponseBodies,
    DataProtectionConfig? dataProtectionConfig,
    String? description,
    OnSourceDDoSProtectionConfig? onSourceDDoSProtectionConfig,
    List<Rule>? rules,
    List<String>? tokenDomains,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.UpdateWebACL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DefaultAction': defaultAction,
        'Id': id,
        'LockToken': lockToken,
        'Name': name,
        'Scope': scope.value,
        'VisibilityConfig': visibilityConfig,
        if (applicationConfig != null) 'ApplicationConfig': applicationConfig,
        if (associationConfig != null) 'AssociationConfig': associationConfig,
        if (captchaConfig != null) 'CaptchaConfig': captchaConfig,
        if (challengeConfig != null) 'ChallengeConfig': challengeConfig,
        if (customResponseBodies != null)
          'CustomResponseBodies': customResponseBodies,
        if (dataProtectionConfig != null)
          'DataProtectionConfig': dataProtectionConfig,
        if (description != null) 'Description': description,
        if (onSourceDDoSProtectionConfig != null)
          'OnSourceDDoSProtectionConfig': onSourceDDoSProtectionConfig,
        if (rules != null) 'Rules': rules,
        if (tokenDomains != null) 'TokenDomains': tokenDomains,
      },
    );

    return UpdateWebACLResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class AssociateWebACLResponse {
  AssociateWebACLResponse();

  factory AssociateWebACLResponse.fromJson(Map<String, dynamic> _) {
    return AssociateWebACLResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CheckCapacityResponse {
  /// The capacity required by the rules and scope.
  final int? capacity;

  CheckCapacityResponse({
    this.capacity,
  });

  factory CheckCapacityResponse.fromJson(Map<String, dynamic> json) {
    return CheckCapacityResponse(
      capacity: json['Capacity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacity = this.capacity;
    return {
      if (capacity != null) 'Capacity': capacity,
    };
  }
}

/// @nodoc
class CreateAPIKeyResponse {
  /// The generated, encrypted API key. You can copy this for use in your
  /// JavaScript CAPTCHA integration.
  final String? aPIKey;

  CreateAPIKeyResponse({
    this.aPIKey,
  });

  factory CreateAPIKeyResponse.fromJson(Map<String, dynamic> json) {
    return CreateAPIKeyResponse(
      aPIKey: json['APIKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aPIKey = this.aPIKey;
    return {
      if (aPIKey != null) 'APIKey': aPIKey,
    };
  }
}

/// @nodoc
class CreateIPSetResponse {
  /// High-level information about an <a>IPSet</a>, returned by operations like
  /// create and list. This provides information like the ID, that you can use to
  /// retrieve and manage an <code>IPSet</code>, and the ARN, that you provide to
  /// the <a>IPSetReferenceStatement</a> to use the address set in a <a>Rule</a>.
  final IPSetSummary? summary;

  CreateIPSetResponse({
    this.summary,
  });

  factory CreateIPSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateIPSetResponse(
      summary: json['Summary'] != null
          ? IPSetSummary.fromJson(json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final summary = this.summary;
    return {
      if (summary != null) 'Summary': summary,
    };
  }
}

/// @nodoc
class CreateRegexPatternSetResponse {
  /// High-level information about a <a>RegexPatternSet</a>, returned by
  /// operations like create and list. This provides information like the ID, that
  /// you can use to retrieve and manage a <code>RegexPatternSet</code>, and the
  /// ARN, that you provide to the <a>RegexPatternSetReferenceStatement</a> to use
  /// the pattern set in a <a>Rule</a>.
  final RegexPatternSetSummary? summary;

  CreateRegexPatternSetResponse({
    this.summary,
  });

  factory CreateRegexPatternSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateRegexPatternSetResponse(
      summary: json['Summary'] != null
          ? RegexPatternSetSummary.fromJson(
              json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final summary = this.summary;
    return {
      if (summary != null) 'Summary': summary,
    };
  }
}

/// @nodoc
class CreateRuleGroupResponse {
  /// High-level information about a <a>RuleGroup</a>, returned by operations like
  /// create and list. This provides information like the ID, that you can use to
  /// retrieve and manage a <code>RuleGroup</code>, and the ARN, that you provide
  /// to the <a>RuleGroupReferenceStatement</a> to use the rule group in a
  /// <a>Rule</a>.
  final RuleGroupSummary? summary;

  CreateRuleGroupResponse({
    this.summary,
  });

  factory CreateRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateRuleGroupResponse(
      summary: json['Summary'] != null
          ? RuleGroupSummary.fromJson(json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final summary = this.summary;
    return {
      if (summary != null) 'Summary': summary,
    };
  }
}

/// @nodoc
class CreateWebACLResponse {
  /// High-level information about a <a>WebACL</a>, returned by operations like
  /// create and list. This provides information like the ID, that you can use to
  /// retrieve and manage a <code>WebACL</code>, and the ARN, that you provide to
  /// operations like <a>AssociateWebACL</a>.
  final WebACLSummary? summary;

  CreateWebACLResponse({
    this.summary,
  });

  factory CreateWebACLResponse.fromJson(Map<String, dynamic> json) {
    return CreateWebACLResponse(
      summary: json['Summary'] != null
          ? WebACLSummary.fromJson(json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final summary = this.summary;
    return {
      if (summary != null) 'Summary': summary,
    };
  }
}

/// @nodoc
class DeleteAPIKeyResponse {
  DeleteAPIKeyResponse();

  factory DeleteAPIKeyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAPIKeyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteFirewallManagerRuleGroupsResponse {
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity associated
  /// with the token, you provide the token to operations like <code>update</code>
  /// and <code>delete</code>. WAF uses the token to ensure that no changes have
  /// been made to the entity since you last retrieved it. If a change has been
  /// made, the update fails with a <code>WAFOptimisticLockException</code>. If
  /// this happens, perform another <code>get</code>, and use the new token
  /// returned by that operation.
  final String? nextWebACLLockToken;

  DeleteFirewallManagerRuleGroupsResponse({
    this.nextWebACLLockToken,
  });

  factory DeleteFirewallManagerRuleGroupsResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteFirewallManagerRuleGroupsResponse(
      nextWebACLLockToken: json['NextWebACLLockToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextWebACLLockToken = this.nextWebACLLockToken;
    return {
      if (nextWebACLLockToken != null)
        'NextWebACLLockToken': nextWebACLLockToken,
    };
  }
}

/// @nodoc
class DeleteIPSetResponse {
  DeleteIPSetResponse();

  factory DeleteIPSetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIPSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteLoggingConfigurationResponse {
  DeleteLoggingConfigurationResponse();

  factory DeleteLoggingConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLoggingConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeletePermissionPolicyResponse {
  DeletePermissionPolicyResponse();

  factory DeletePermissionPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeletePermissionPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteRegexPatternSetResponse {
  DeleteRegexPatternSetResponse();

  factory DeleteRegexPatternSetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRegexPatternSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteRuleGroupResponse {
  DeleteRuleGroupResponse();

  factory DeleteRuleGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRuleGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteWebACLResponse {
  DeleteWebACLResponse();

  factory DeleteWebACLResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWebACLResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DescribeAllManagedProductsResponse {
  /// High-level information for the Amazon Web Services Managed Rules rule groups
  /// and Amazon Web Services Marketplace managed rule groups.
  final List<ManagedProductDescriptor>? managedProducts;

  DescribeAllManagedProductsResponse({
    this.managedProducts,
  });

  factory DescribeAllManagedProductsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAllManagedProductsResponse(
      managedProducts: (json['ManagedProducts'] as List?)
          ?.nonNulls
          .map((e) =>
              ManagedProductDescriptor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final managedProducts = this.managedProducts;
    return {
      if (managedProducts != null) 'ManagedProducts': managedProducts,
    };
  }
}

/// @nodoc
class DescribeManagedProductsByVendorResponse {
  /// High-level information for the managed rule groups owned by the specified
  /// vendor.
  final List<ManagedProductDescriptor>? managedProducts;

  DescribeManagedProductsByVendorResponse({
    this.managedProducts,
  });

  factory DescribeManagedProductsByVendorResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeManagedProductsByVendorResponse(
      managedProducts: (json['ManagedProducts'] as List?)
          ?.nonNulls
          .map((e) =>
              ManagedProductDescriptor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final managedProducts = this.managedProducts;
    return {
      if (managedProducts != null) 'ManagedProducts': managedProducts,
    };
  }
}

/// @nodoc
class DescribeManagedRuleGroupResponse {
  /// The labels that one or more rules in this rule group add to matching web
  /// requests. These labels are defined in the <code>RuleLabels</code> for a
  /// <a>Rule</a>.
  final List<LabelSummary>? availableLabels;

  /// The web ACL capacity units (WCUs) required for this rule group.
  ///
  /// WAF uses WCUs to calculate and control the operating resources that are used
  /// to run your rules, rule groups, and web ACLs. WAF calculates capacity
  /// differently for each rule type, to reflect the relative cost of each rule.
  /// Simple rules that cost little to run use fewer WCUs than more complex rules
  /// that use more processing power. Rule group capacity is fixed at creation,
  /// which helps users plan their web ACL WCU usage when they use a rule group.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html">WAF
  /// web ACL capacity units (WCU)</a> in the <i>WAF Developer Guide</i>.
  final int? capacity;

  /// The labels that one or more rules in this rule group match against in label
  /// match statements. These labels are defined in a
  /// <code>LabelMatchStatement</code> specification, in the <a>Statement</a>
  /// definition of a rule.
  final List<LabelSummary>? consumedLabels;

  /// The label namespace prefix for this rule group. All labels added by rules in
  /// this rule group have this prefix.
  ///
  /// <ul>
  /// <li>
  /// The syntax for the label namespace prefix for a managed rule group is the
  /// following:
  ///
  /// <code>awswaf:managed:<vendor>:<rule group name></code>:
  /// </li>
  /// <li>
  /// When a rule with a label matches a web request, WAF adds the fully qualified
  /// label to the request. A fully qualified label is made up of the label
  /// namespace from the rule group or web ACL where the rule is defined and the
  /// label from the rule, separated by a colon:
  ///
  /// <code><label namespace>:<label from rule></code>
  /// </li>
  /// </ul>
  final String? labelNamespace;

  ///
  final List<RuleSummary>? rules;

  /// The Amazon resource name (ARN) of the Amazon Simple Notification Service SNS
  /// topic that's used to provide notification of changes to the managed rule
  /// group. You can subscribe to the SNS topic to receive notifications when the
  /// managed rule group is modified, such as for new versions and for version
  /// expiration. For more information, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/welcome.html">Amazon Simple
  /// Notification Service Developer Guide</a>.
  final String? snsTopicArn;

  /// The managed rule group's version.
  final String? versionName;

  DescribeManagedRuleGroupResponse({
    this.availableLabels,
    this.capacity,
    this.consumedLabels,
    this.labelNamespace,
    this.rules,
    this.snsTopicArn,
    this.versionName,
  });

  factory DescribeManagedRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribeManagedRuleGroupResponse(
      availableLabels: (json['AvailableLabels'] as List?)
          ?.nonNulls
          .map((e) => LabelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      capacity: json['Capacity'] as int?,
      consumedLabels: (json['ConsumedLabels'] as List?)
          ?.nonNulls
          .map((e) => LabelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      labelNamespace: json['LabelNamespace'] as String?,
      rules: (json['Rules'] as List?)
          ?.nonNulls
          .map((e) => RuleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      snsTopicArn: json['SnsTopicArn'] as String?,
      versionName: json['VersionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availableLabels = this.availableLabels;
    final capacity = this.capacity;
    final consumedLabels = this.consumedLabels;
    final labelNamespace = this.labelNamespace;
    final rules = this.rules;
    final snsTopicArn = this.snsTopicArn;
    final versionName = this.versionName;
    return {
      if (availableLabels != null) 'AvailableLabels': availableLabels,
      if (capacity != null) 'Capacity': capacity,
      if (consumedLabels != null) 'ConsumedLabels': consumedLabels,
      if (labelNamespace != null) 'LabelNamespace': labelNamespace,
      if (rules != null) 'Rules': rules,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (versionName != null) 'VersionName': versionName,
    };
  }
}

/// @nodoc
class DisassociateWebACLResponse {
  DisassociateWebACLResponse();

  factory DisassociateWebACLResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateWebACLResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GenerateMobileSdkReleaseUrlResponse {
  /// The presigned download URL for the specified SDK release.
  final String? url;

  GenerateMobileSdkReleaseUrlResponse({
    this.url,
  });

  factory GenerateMobileSdkReleaseUrlResponse.fromJson(
      Map<String, dynamic> json) {
    return GenerateMobileSdkReleaseUrlResponse(
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    return {
      if (url != null) 'Url': url,
    };
  }
}

/// @nodoc
class GetDecryptedAPIKeyResponse {
  /// The date and time that the key was created.
  final DateTime? creationTimestamp;

  /// The token domains that are defined in this API key.
  final List<String>? tokenDomains;

  GetDecryptedAPIKeyResponse({
    this.creationTimestamp,
    this.tokenDomains,
  });

  factory GetDecryptedAPIKeyResponse.fromJson(Map<String, dynamic> json) {
    return GetDecryptedAPIKeyResponse(
      creationTimestamp: timeStampFromJson(json['CreationTimestamp']),
      tokenDomains: (json['TokenDomains'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final tokenDomains = this.tokenDomains;
    return {
      if (creationTimestamp != null)
        'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      if (tokenDomains != null) 'TokenDomains': tokenDomains,
    };
  }
}

/// @nodoc
class GetIPSetResponse {
  ///
  final IPSet? iPSet;

  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity associated
  /// with the token, you provide the token to operations like <code>update</code>
  /// and <code>delete</code>. WAF uses the token to ensure that no changes have
  /// been made to the entity since you last retrieved it. If a change has been
  /// made, the update fails with a <code>WAFOptimisticLockException</code>. If
  /// this happens, perform another <code>get</code>, and use the new token
  /// returned by that operation.
  final String? lockToken;

  GetIPSetResponse({
    this.iPSet,
    this.lockToken,
  });

  factory GetIPSetResponse.fromJson(Map<String, dynamic> json) {
    return GetIPSetResponse(
      iPSet: json['IPSet'] != null
          ? IPSet.fromJson(json['IPSet'] as Map<String, dynamic>)
          : null,
      lockToken: json['LockToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final iPSet = this.iPSet;
    final lockToken = this.lockToken;
    return {
      if (iPSet != null) 'IPSet': iPSet,
      if (lockToken != null) 'LockToken': lockToken,
    };
  }
}

/// @nodoc
class GetLoggingConfigurationResponse {
  /// The <a>LoggingConfiguration</a> for the specified web ACL.
  final LoggingConfiguration? loggingConfiguration;

  GetLoggingConfigurationResponse({
    this.loggingConfiguration,
  });

  factory GetLoggingConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetLoggingConfigurationResponse(
      loggingConfiguration: json['LoggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['LoggingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final loggingConfiguration = this.loggingConfiguration;
    return {
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
    };
  }
}

/// @nodoc
class GetManagedRuleSetResponse {
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity associated
  /// with the token, you provide the token to operations like <code>update</code>
  /// and <code>delete</code>. WAF uses the token to ensure that no changes have
  /// been made to the entity since you last retrieved it. If a change has been
  /// made, the update fails with a <code>WAFOptimisticLockException</code>. If
  /// this happens, perform another <code>get</code>, and use the new token
  /// returned by that operation.
  final String? lockToken;

  /// The managed rule set that you requested.
  final ManagedRuleSet? managedRuleSet;

  GetManagedRuleSetResponse({
    this.lockToken,
    this.managedRuleSet,
  });

  factory GetManagedRuleSetResponse.fromJson(Map<String, dynamic> json) {
    return GetManagedRuleSetResponse(
      lockToken: json['LockToken'] as String?,
      managedRuleSet: json['ManagedRuleSet'] != null
          ? ManagedRuleSet.fromJson(
              json['ManagedRuleSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lockToken = this.lockToken;
    final managedRuleSet = this.managedRuleSet;
    return {
      if (lockToken != null) 'LockToken': lockToken,
      if (managedRuleSet != null) 'ManagedRuleSet': managedRuleSet,
    };
  }
}

/// @nodoc
class GetMobileSdkReleaseResponse {
  /// Information for a specified SDK release, including release notes and tags.
  final MobileSdkRelease? mobileSdkRelease;

  GetMobileSdkReleaseResponse({
    this.mobileSdkRelease,
  });

  factory GetMobileSdkReleaseResponse.fromJson(Map<String, dynamic> json) {
    return GetMobileSdkReleaseResponse(
      mobileSdkRelease: json['MobileSdkRelease'] != null
          ? MobileSdkRelease.fromJson(
              json['MobileSdkRelease'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mobileSdkRelease = this.mobileSdkRelease;
    return {
      if (mobileSdkRelease != null) 'MobileSdkRelease': mobileSdkRelease,
    };
  }
}

/// @nodoc
class GetPermissionPolicyResponse {
  /// The IAM policy that is attached to the specified rule group.
  final String? policy;

  GetPermissionPolicyResponse({
    this.policy,
  });

  factory GetPermissionPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetPermissionPolicyResponse(
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

/// @nodoc
class GetRateBasedStatementManagedKeysResponse {
  /// The keys that are of Internet Protocol version 4 (IPv4).
  final RateBasedStatementManagedKeysIPSet? managedKeysIPV4;

  /// The keys that are of Internet Protocol version 6 (IPv6).
  final RateBasedStatementManagedKeysIPSet? managedKeysIPV6;

  GetRateBasedStatementManagedKeysResponse({
    this.managedKeysIPV4,
    this.managedKeysIPV6,
  });

  factory GetRateBasedStatementManagedKeysResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRateBasedStatementManagedKeysResponse(
      managedKeysIPV4: json['ManagedKeysIPV4'] != null
          ? RateBasedStatementManagedKeysIPSet.fromJson(
              json['ManagedKeysIPV4'] as Map<String, dynamic>)
          : null,
      managedKeysIPV6: json['ManagedKeysIPV6'] != null
          ? RateBasedStatementManagedKeysIPSet.fromJson(
              json['ManagedKeysIPV6'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final managedKeysIPV4 = this.managedKeysIPV4;
    final managedKeysIPV6 = this.managedKeysIPV6;
    return {
      if (managedKeysIPV4 != null) 'ManagedKeysIPV4': managedKeysIPV4,
      if (managedKeysIPV6 != null) 'ManagedKeysIPV6': managedKeysIPV6,
    };
  }
}

/// @nodoc
class GetRegexPatternSetResponse {
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity associated
  /// with the token, you provide the token to operations like <code>update</code>
  /// and <code>delete</code>. WAF uses the token to ensure that no changes have
  /// been made to the entity since you last retrieved it. If a change has been
  /// made, the update fails with a <code>WAFOptimisticLockException</code>. If
  /// this happens, perform another <code>get</code>, and use the new token
  /// returned by that operation.
  final String? lockToken;

  ///
  final RegexPatternSet? regexPatternSet;

  GetRegexPatternSetResponse({
    this.lockToken,
    this.regexPatternSet,
  });

  factory GetRegexPatternSetResponse.fromJson(Map<String, dynamic> json) {
    return GetRegexPatternSetResponse(
      lockToken: json['LockToken'] as String?,
      regexPatternSet: json['RegexPatternSet'] != null
          ? RegexPatternSet.fromJson(
              json['RegexPatternSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lockToken = this.lockToken;
    final regexPatternSet = this.regexPatternSet;
    return {
      if (lockToken != null) 'LockToken': lockToken,
      if (regexPatternSet != null) 'RegexPatternSet': regexPatternSet,
    };
  }
}

/// @nodoc
class GetRuleGroupResponse {
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity associated
  /// with the token, you provide the token to operations like <code>update</code>
  /// and <code>delete</code>. WAF uses the token to ensure that no changes have
  /// been made to the entity since you last retrieved it. If a change has been
  /// made, the update fails with a <code>WAFOptimisticLockException</code>. If
  /// this happens, perform another <code>get</code>, and use the new token
  /// returned by that operation.
  final String? lockToken;

  ///
  final RuleGroup? ruleGroup;

  GetRuleGroupResponse({
    this.lockToken,
    this.ruleGroup,
  });

  factory GetRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetRuleGroupResponse(
      lockToken: json['LockToken'] as String?,
      ruleGroup: json['RuleGroup'] != null
          ? RuleGroup.fromJson(json['RuleGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lockToken = this.lockToken;
    final ruleGroup = this.ruleGroup;
    return {
      if (lockToken != null) 'LockToken': lockToken,
      if (ruleGroup != null) 'RuleGroup': ruleGroup,
    };
  }
}

/// @nodoc
class GetSampledRequestsResponse {
  /// The total number of requests from which <code>GetSampledRequests</code> got
  /// a sample of <code>MaxItems</code> requests. If <code>PopulationSize</code>
  /// is less than <code>MaxItems</code>, the sample includes every request that
  /// your Amazon Web Services resource received during the specified time range.
  final int? populationSize;

  /// A complex type that contains detailed information about each of the requests
  /// in the sample.
  final List<SampledHTTPRequest>? sampledRequests;

  /// Usually, <code>TimeWindow</code> is the time range that you specified in the
  /// <code>GetSampledRequests</code> request. However, if your Amazon Web
  /// Services resource received more than 5,000 requests during the time range
  /// that you specified in the request, <code>GetSampledRequests</code> returns
  /// the time range for the first 5,000 requests. Times are in Coordinated
  /// Universal Time (UTC) format.
  final TimeWindow? timeWindow;

  GetSampledRequestsResponse({
    this.populationSize,
    this.sampledRequests,
    this.timeWindow,
  });

  factory GetSampledRequestsResponse.fromJson(Map<String, dynamic> json) {
    return GetSampledRequestsResponse(
      populationSize: json['PopulationSize'] as int?,
      sampledRequests: (json['SampledRequests'] as List?)
          ?.nonNulls
          .map((e) => SampledHTTPRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeWindow: json['TimeWindow'] != null
          ? TimeWindow.fromJson(json['TimeWindow'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final populationSize = this.populationSize;
    final sampledRequests = this.sampledRequests;
    final timeWindow = this.timeWindow;
    return {
      if (populationSize != null) 'PopulationSize': populationSize,
      if (sampledRequests != null) 'SampledRequests': sampledRequests,
      if (timeWindow != null) 'TimeWindow': timeWindow,
    };
  }
}

/// @nodoc
class GetTopPathStatisticsByTrafficResponse {
  /// The list of path statistics, ordered by request count. Each entry includes
  /// the path, request count, percentage of total traffic, and the top bots
  /// accessing that path.
  final List<PathStatistics> pathStatistics;

  /// The total number of requests that match the query criteria within the
  /// specified time window.
  final int totalRequestCount;

  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// WAF returns a <code>NextMarker</code> value in the response. To retrieve the
  /// next batch of objects, provide the marker from the prior call in your next
  /// request.
  final String? nextMarker;

  /// Category-level aggregations for visualizing bot category to path
  /// relationships. This field is only populated when no bot filters are applied
  /// to the request. Each entry includes the bot category and the paths accessed
  /// by bots in that category.
  final List<PathStatistics>? topCategories;

  GetTopPathStatisticsByTrafficResponse({
    required this.pathStatistics,
    required this.totalRequestCount,
    this.nextMarker,
    this.topCategories,
  });

  factory GetTopPathStatisticsByTrafficResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTopPathStatisticsByTrafficResponse(
      pathStatistics: ((json['PathStatistics'] as List?) ?? const [])
          .nonNulls
          .map((e) => PathStatistics.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalRequestCount: (json['TotalRequestCount'] as int?) ?? 0,
      nextMarker: json['NextMarker'] as String?,
      topCategories: (json['TopCategories'] as List?)
          ?.nonNulls
          .map((e) => PathStatistics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pathStatistics = this.pathStatistics;
    final totalRequestCount = this.totalRequestCount;
    final nextMarker = this.nextMarker;
    final topCategories = this.topCategories;
    return {
      'PathStatistics': pathStatistics,
      'TotalRequestCount': totalRequestCount,
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (topCategories != null) 'TopCategories': topCategories,
    };
  }
}

/// @nodoc
class GetWebACLResponse {
  /// The URL to use in SDK integrations with Amazon Web Services managed rule
  /// groups. For example, you can use the integration SDKs with the account
  /// takeover prevention managed rule group
  /// <code>AWSManagedRulesATPRuleSet</code> and the account creation fraud
  /// prevention managed rule group <code>AWSManagedRulesACFPRuleSet</code>. This
  /// is only populated if you are using a rule group in your web ACL that
  /// integrates with your applications in this way. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html">WAF
  /// client application integration</a> in the <i>WAF Developer Guide</i>.
  final String? applicationIntegrationURL;

  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity associated
  /// with the token, you provide the token to operations like <code>update</code>
  /// and <code>delete</code>. WAF uses the token to ensure that no changes have
  /// been made to the entity since you last retrieved it. If a change has been
  /// made, the update fails with a <code>WAFOptimisticLockException</code>. If
  /// this happens, perform another <code>get</code>, and use the new token
  /// returned by that operation.
  final String? lockToken;

  /// The web ACL specification. You can modify the settings in this web ACL and
  /// use it to update this web ACL or create a new one.
  final WebACL? webACL;

  GetWebACLResponse({
    this.applicationIntegrationURL,
    this.lockToken,
    this.webACL,
  });

  factory GetWebACLResponse.fromJson(Map<String, dynamic> json) {
    return GetWebACLResponse(
      applicationIntegrationURL: json['ApplicationIntegrationURL'] as String?,
      lockToken: json['LockToken'] as String?,
      webACL: json['WebACL'] != null
          ? WebACL.fromJson(json['WebACL'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationIntegrationURL = this.applicationIntegrationURL;
    final lockToken = this.lockToken;
    final webACL = this.webACL;
    return {
      if (applicationIntegrationURL != null)
        'ApplicationIntegrationURL': applicationIntegrationURL,
      if (lockToken != null) 'LockToken': lockToken,
      if (webACL != null) 'WebACL': webACL,
    };
  }
}

/// @nodoc
class GetWebACLForResourceResponse {
  /// The web ACL that is associated with the resource. If there is no associated
  /// resource, WAF returns a null web ACL.
  final WebACL? webACL;

  GetWebACLForResourceResponse({
    this.webACL,
  });

  factory GetWebACLForResourceResponse.fromJson(Map<String, dynamic> json) {
    return GetWebACLForResourceResponse(
      webACL: json['WebACL'] != null
          ? WebACL.fromJson(json['WebACL'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final webACL = this.webACL;
    return {
      if (webACL != null) 'WebACL': webACL,
    };
  }
}

/// @nodoc
class ListAPIKeysResponse {
  /// The array of key summaries. If you specified a <code>Limit</code> in your
  /// request, this might not be the full list.
  final List<APIKeySummary>? aPIKeySummaries;

  /// The CAPTCHA application integration URL, for use in your JavaScript
  /// implementation.
  final String? applicationIntegrationURL;

  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// WAF returns a <code>NextMarker</code> value in the response. To retrieve the
  /// next batch of objects, provide the marker from the prior call in your next
  /// request.
  final String? nextMarker;

  ListAPIKeysResponse({
    this.aPIKeySummaries,
    this.applicationIntegrationURL,
    this.nextMarker,
  });

  factory ListAPIKeysResponse.fromJson(Map<String, dynamic> json) {
    return ListAPIKeysResponse(
      aPIKeySummaries: (json['APIKeySummaries'] as List?)
          ?.nonNulls
          .map((e) => APIKeySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      applicationIntegrationURL: json['ApplicationIntegrationURL'] as String?,
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aPIKeySummaries = this.aPIKeySummaries;
    final applicationIntegrationURL = this.applicationIntegrationURL;
    final nextMarker = this.nextMarker;
    return {
      if (aPIKeySummaries != null) 'APIKeySummaries': aPIKeySummaries,
      if (applicationIntegrationURL != null)
        'ApplicationIntegrationURL': applicationIntegrationURL,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class ListAvailableManagedRuleGroupsResponse {
  /// Array of managed rule groups that you can use. If you specified a
  /// <code>Limit</code> in your request, this might not be the full list.
  final List<ManagedRuleGroupSummary>? managedRuleGroups;

  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// WAF returns a <code>NextMarker</code> value in the response. To retrieve the
  /// next batch of objects, provide the marker from the prior call in your next
  /// request.
  final String? nextMarker;

  ListAvailableManagedRuleGroupsResponse({
    this.managedRuleGroups,
    this.nextMarker,
  });

  factory ListAvailableManagedRuleGroupsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAvailableManagedRuleGroupsResponse(
      managedRuleGroups: (json['ManagedRuleGroups'] as List?)
          ?.nonNulls
          .map((e) =>
              ManagedRuleGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final managedRuleGroups = this.managedRuleGroups;
    final nextMarker = this.nextMarker;
    return {
      if (managedRuleGroups != null) 'ManagedRuleGroups': managedRuleGroups,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class ListAvailableManagedRuleGroupVersionsResponse {
  /// The name of the version that's currently set as the default.
  final String? currentDefaultVersion;

  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// WAF returns a <code>NextMarker</code> value in the response. To retrieve the
  /// next batch of objects, provide the marker from the prior call in your next
  /// request.
  final String? nextMarker;

  /// The versions that are currently available for the specified managed rule
  /// group. If you specified a <code>Limit</code> in your request, this might not
  /// be the full list.
  final List<ManagedRuleGroupVersion>? versions;

  ListAvailableManagedRuleGroupVersionsResponse({
    this.currentDefaultVersion,
    this.nextMarker,
    this.versions,
  });

  factory ListAvailableManagedRuleGroupVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAvailableManagedRuleGroupVersionsResponse(
      currentDefaultVersion: json['CurrentDefaultVersion'] as String?,
      nextMarker: json['NextMarker'] as String?,
      versions: (json['Versions'] as List?)
          ?.nonNulls
          .map((e) =>
              ManagedRuleGroupVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final currentDefaultVersion = this.currentDefaultVersion;
    final nextMarker = this.nextMarker;
    final versions = this.versions;
    return {
      if (currentDefaultVersion != null)
        'CurrentDefaultVersion': currentDefaultVersion,
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (versions != null) 'Versions': versions,
    };
  }
}

/// @nodoc
class ListIPSetsResponse {
  /// Array of IPSets. If you specified a <code>Limit</code> in your request, this
  /// might not be the full list.
  final List<IPSetSummary>? iPSets;

  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// WAF returns a <code>NextMarker</code> value in the response. To retrieve the
  /// next batch of objects, provide the marker from the prior call in your next
  /// request.
  final String? nextMarker;

  ListIPSetsResponse({
    this.iPSets,
    this.nextMarker,
  });

  factory ListIPSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListIPSetsResponse(
      iPSets: (json['IPSets'] as List?)
          ?.nonNulls
          .map((e) => IPSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final iPSets = this.iPSets;
    final nextMarker = this.nextMarker;
    return {
      if (iPSets != null) 'IPSets': iPSets,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class ListLoggingConfigurationsResponse {
  /// Array of logging configurations. If you specified a <code>Limit</code> in
  /// your request, this might not be the full list.
  final List<LoggingConfiguration>? loggingConfigurations;

  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// WAF returns a <code>NextMarker</code> value in the response. To retrieve the
  /// next batch of objects, provide the marker from the prior call in your next
  /// request.
  final String? nextMarker;

  ListLoggingConfigurationsResponse({
    this.loggingConfigurations,
    this.nextMarker,
  });

  factory ListLoggingConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListLoggingConfigurationsResponse(
      loggingConfigurations: (json['LoggingConfigurations'] as List?)
          ?.nonNulls
          .map((e) => LoggingConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final loggingConfigurations = this.loggingConfigurations;
    final nextMarker = this.nextMarker;
    return {
      if (loggingConfigurations != null)
        'LoggingConfigurations': loggingConfigurations,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class ListManagedRuleSetsResponse {
  /// Your managed rule sets. If you specified a <code>Limit</code> in your
  /// request, this might not be the full list.
  final List<ManagedRuleSetSummary>? managedRuleSets;

  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// WAF returns a <code>NextMarker</code> value in the response. To retrieve the
  /// next batch of objects, provide the marker from the prior call in your next
  /// request.
  final String? nextMarker;

  ListManagedRuleSetsResponse({
    this.managedRuleSets,
    this.nextMarker,
  });

  factory ListManagedRuleSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListManagedRuleSetsResponse(
      managedRuleSets: (json['ManagedRuleSets'] as List?)
          ?.nonNulls
          .map((e) => ManagedRuleSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final managedRuleSets = this.managedRuleSets;
    final nextMarker = this.nextMarker;
    return {
      if (managedRuleSets != null) 'ManagedRuleSets': managedRuleSets,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class ListMobileSdkReleasesResponse {
  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// WAF returns a <code>NextMarker</code> value in the response. To retrieve the
  /// next batch of objects, provide the marker from the prior call in your next
  /// request.
  final String? nextMarker;

  /// The high level information for the available SDK releases. If you specified
  /// a <code>Limit</code> in your request, this might not be the full list.
  final List<ReleaseSummary>? releaseSummaries;

  ListMobileSdkReleasesResponse({
    this.nextMarker,
    this.releaseSummaries,
  });

  factory ListMobileSdkReleasesResponse.fromJson(Map<String, dynamic> json) {
    return ListMobileSdkReleasesResponse(
      nextMarker: json['NextMarker'] as String?,
      releaseSummaries: (json['ReleaseSummaries'] as List?)
          ?.nonNulls
          .map((e) => ReleaseSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final releaseSummaries = this.releaseSummaries;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (releaseSummaries != null) 'ReleaseSummaries': releaseSummaries,
    };
  }
}

/// @nodoc
class ListRegexPatternSetsResponse {
  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// WAF returns a <code>NextMarker</code> value in the response. To retrieve the
  /// next batch of objects, provide the marker from the prior call in your next
  /// request.
  final String? nextMarker;

  /// Array of regex pattern sets. If you specified a <code>Limit</code> in your
  /// request, this might not be the full list.
  final List<RegexPatternSetSummary>? regexPatternSets;

  ListRegexPatternSetsResponse({
    this.nextMarker,
    this.regexPatternSets,
  });

  factory ListRegexPatternSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListRegexPatternSetsResponse(
      nextMarker: json['NextMarker'] as String?,
      regexPatternSets: (json['RegexPatternSets'] as List?)
          ?.nonNulls
          .map(
              (e) => RegexPatternSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final regexPatternSets = this.regexPatternSets;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (regexPatternSets != null) 'RegexPatternSets': regexPatternSets,
    };
  }
}

/// @nodoc
class ListResourcesForWebACLResponse {
  /// The array of Amazon Resource Names (ARNs) of the associated resources.
  final List<String>? resourceArns;

  ListResourcesForWebACLResponse({
    this.resourceArns,
  });

  factory ListResourcesForWebACLResponse.fromJson(Map<String, dynamic> json) {
    return ListResourcesForWebACLResponse(
      resourceArns: (json['ResourceArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArns = this.resourceArns;
    return {
      if (resourceArns != null) 'ResourceArns': resourceArns,
    };
  }
}

/// @nodoc
class ListRuleGroupsResponse {
  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// WAF returns a <code>NextMarker</code> value in the response. To retrieve the
  /// next batch of objects, provide the marker from the prior call in your next
  /// request.
  final String? nextMarker;

  /// Array of rule groups. If you specified a <code>Limit</code> in your request,
  /// this might not be the full list.
  final List<RuleGroupSummary>? ruleGroups;

  ListRuleGroupsResponse({
    this.nextMarker,
    this.ruleGroups,
  });

  factory ListRuleGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListRuleGroupsResponse(
      nextMarker: json['NextMarker'] as String?,
      ruleGroups: (json['RuleGroups'] as List?)
          ?.nonNulls
          .map((e) => RuleGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final ruleGroups = this.ruleGroups;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (ruleGroups != null) 'RuleGroups': ruleGroups,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// WAF returns a <code>NextMarker</code> value in the response. To retrieve the
  /// next batch of objects, provide the marker from the prior call in your next
  /// request.
  final String? nextMarker;

  /// The collection of tagging definitions for the resource. If you specified a
  /// <code>Limit</code> in your request, this might not be the full list.
  final TagInfoForResource? tagInfoForResource;

  ListTagsForResourceResponse({
    this.nextMarker,
    this.tagInfoForResource,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextMarker: json['NextMarker'] as String?,
      tagInfoForResource: json['TagInfoForResource'] != null
          ? TagInfoForResource.fromJson(
              json['TagInfoForResource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final tagInfoForResource = this.tagInfoForResource;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (tagInfoForResource != null) 'TagInfoForResource': tagInfoForResource,
    };
  }
}

/// @nodoc
class ListWebACLsResponse {
  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// WAF returns a <code>NextMarker</code> value in the response. To retrieve the
  /// next batch of objects, provide the marker from the prior call in your next
  /// request.
  final String? nextMarker;

  /// Array of web ACLs. If you specified a <code>Limit</code> in your request,
  /// this might not be the full list.
  final List<WebACLSummary>? webACLs;

  ListWebACLsResponse({
    this.nextMarker,
    this.webACLs,
  });

  factory ListWebACLsResponse.fromJson(Map<String, dynamic> json) {
    return ListWebACLsResponse(
      nextMarker: json['NextMarker'] as String?,
      webACLs: (json['WebACLs'] as List?)
          ?.nonNulls
          .map((e) => WebACLSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final webACLs = this.webACLs;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (webACLs != null) 'WebACLs': webACLs,
    };
  }
}

/// @nodoc
class PutLoggingConfigurationResponse {
  ///
  final LoggingConfiguration? loggingConfiguration;

  PutLoggingConfigurationResponse({
    this.loggingConfiguration,
  });

  factory PutLoggingConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return PutLoggingConfigurationResponse(
      loggingConfiguration: json['LoggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['LoggingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final loggingConfiguration = this.loggingConfiguration;
    return {
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
    };
  }
}

/// @nodoc
class PutManagedRuleSetVersionsResponse {
  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity associated
  /// with the token, you provide the token to operations like <code>update</code>
  /// and <code>delete</code>. WAF uses the token to ensure that no changes have
  /// been made to the entity since you last retrieved it. If a change has been
  /// made, the update fails with a <code>WAFOptimisticLockException</code>. If
  /// this happens, perform another <code>get</code>, and use the new token
  /// returned by that operation.
  final String? nextLockToken;

  PutManagedRuleSetVersionsResponse({
    this.nextLockToken,
  });

  factory PutManagedRuleSetVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return PutManagedRuleSetVersionsResponse(
      nextLockToken: json['NextLockToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextLockToken = this.nextLockToken;
    return {
      if (nextLockToken != null) 'NextLockToken': nextLockToken,
    };
  }
}

/// @nodoc
class PutPermissionPolicyResponse {
  PutPermissionPolicyResponse();

  factory PutPermissionPolicyResponse.fromJson(Map<String, dynamic> _) {
    return PutPermissionPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateIPSetResponse {
  /// A token used for optimistic locking. WAF returns this token to your
  /// <code>update</code> requests. You use <code>NextLockToken</code> in the same
  /// manner as you use <code>LockToken</code>.
  final String? nextLockToken;

  UpdateIPSetResponse({
    this.nextLockToken,
  });

  factory UpdateIPSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateIPSetResponse(
      nextLockToken: json['NextLockToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextLockToken = this.nextLockToken;
    return {
      if (nextLockToken != null) 'NextLockToken': nextLockToken,
    };
  }
}

/// @nodoc
class UpdateManagedRuleSetVersionExpiryDateResponse {
  /// The version that is set to expire.
  final String? expiringVersion;

  /// The time that the version will expire.
  ///
  /// Times are in Coordinated Universal Time (UTC) format. UTC format includes
  /// the special designator, Z. For example, "2016-09-27T14:50Z".
  final DateTime? expiryTimestamp;

  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity associated
  /// with the token, you provide the token to operations like <code>update</code>
  /// and <code>delete</code>. WAF uses the token to ensure that no changes have
  /// been made to the entity since you last retrieved it. If a change has been
  /// made, the update fails with a <code>WAFOptimisticLockException</code>. If
  /// this happens, perform another <code>get</code>, and use the new token
  /// returned by that operation.
  final String? nextLockToken;

  UpdateManagedRuleSetVersionExpiryDateResponse({
    this.expiringVersion,
    this.expiryTimestamp,
    this.nextLockToken,
  });

  factory UpdateManagedRuleSetVersionExpiryDateResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateManagedRuleSetVersionExpiryDateResponse(
      expiringVersion: json['ExpiringVersion'] as String?,
      expiryTimestamp: timeStampFromJson(json['ExpiryTimestamp']),
      nextLockToken: json['NextLockToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expiringVersion = this.expiringVersion;
    final expiryTimestamp = this.expiryTimestamp;
    final nextLockToken = this.nextLockToken;
    return {
      if (expiringVersion != null) 'ExpiringVersion': expiringVersion,
      if (expiryTimestamp != null)
        'ExpiryTimestamp': unixTimestampToJson(expiryTimestamp),
      if (nextLockToken != null) 'NextLockToken': nextLockToken,
    };
  }
}

/// @nodoc
class UpdateRegexPatternSetResponse {
  /// A token used for optimistic locking. WAF returns this token to your
  /// <code>update</code> requests. You use <code>NextLockToken</code> in the same
  /// manner as you use <code>LockToken</code>.
  final String? nextLockToken;

  UpdateRegexPatternSetResponse({
    this.nextLockToken,
  });

  factory UpdateRegexPatternSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRegexPatternSetResponse(
      nextLockToken: json['NextLockToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextLockToken = this.nextLockToken;
    return {
      if (nextLockToken != null) 'NextLockToken': nextLockToken,
    };
  }
}

/// @nodoc
class UpdateRuleGroupResponse {
  /// A token used for optimistic locking. WAF returns this token to your
  /// <code>update</code> requests. You use <code>NextLockToken</code> in the same
  /// manner as you use <code>LockToken</code>.
  final String? nextLockToken;

  UpdateRuleGroupResponse({
    this.nextLockToken,
  });

  factory UpdateRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRuleGroupResponse(
      nextLockToken: json['NextLockToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextLockToken = this.nextLockToken;
    return {
      if (nextLockToken != null) 'NextLockToken': nextLockToken,
    };
  }
}

/// @nodoc
class UpdateWebACLResponse {
  /// A token used for optimistic locking. WAF returns this token to your
  /// <code>update</code> requests. You use <code>NextLockToken</code> in the same
  /// manner as you use <code>LockToken</code>.
  final String? nextLockToken;

  UpdateWebACLResponse({
    this.nextLockToken,
  });

  factory UpdateWebACLResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWebACLResponse(
      nextLockToken: json['NextLockToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextLockToken = this.nextLockToken;
    return {
      if (nextLockToken != null) 'NextLockToken': nextLockToken,
    };
  }
}

/// @nodoc
class Scope {
  static const cloudfront = Scope._('CLOUDFRONT');
  static const regional = Scope._('REGIONAL');

  final String value;

  const Scope._(this.value);

  static const values = [cloudfront, regional];

  static Scope fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Scope._(value));

  @override
  bool operator ==(other) => other is Scope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// In a <a>WebACL</a>, this is the action that you want WAF to perform when a
/// web request doesn't match any of the rules in the <code>WebACL</code>. The
/// default action must be a terminating action.
///
/// @nodoc
class DefaultAction {
  /// Specifies that WAF should allow requests by default.
  final AllowAction? allow;

  /// Specifies that WAF should block requests by default.
  final BlockAction? block;

  DefaultAction({
    this.allow,
    this.block,
  });

  factory DefaultAction.fromJson(Map<String, dynamic> json) {
    return DefaultAction(
      allow: json['Allow'] != null
          ? AllowAction.fromJson(json['Allow'] as Map<String, dynamic>)
          : null,
      block: json['Block'] != null
          ? BlockAction.fromJson(json['Block'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final allow = this.allow;
    final block = this.block;
    return {
      if (allow != null) 'Allow': allow,
      if (block != null) 'Block': block,
    };
  }
}

/// Defines and enables Amazon CloudWatch metrics and web request sample
/// collection.
///
/// @nodoc
class VisibilityConfig {
  /// Indicates whether the associated resource sends metrics to Amazon
  /// CloudWatch. For the list of available metrics, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/monitoring-cloudwatch.html#waf-metrics">WAF
  /// Metrics</a> in the <i>WAF Developer Guide</i>.
  ///
  /// For web ACLs, the metrics are for web requests that have the web ACL default
  /// action applied. WAF applies the default action to web requests that pass the
  /// inspection of all rules in the web ACL without being either allowed or
  /// blocked. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/web-acl-default-action.html">The
  /// web ACL default action</a> in the <i>WAF Developer Guide</i>.
  final bool cloudWatchMetricsEnabled;

  /// A name of the Amazon CloudWatch metric dimension. The name can contain only
  /// the characters: A-Z, a-z, 0-9, - (hyphen), and _ (underscore). The name can
  /// be from one to 128 characters long. It can't contain whitespace or metric
  /// names that are reserved for WAF, for example <code>All</code> and
  /// <code>Default_Action</code>.
  final String metricName;

  /// Indicates whether WAF should store a sampling of the web requests that match
  /// the rules. You can view the sampled requests through the WAF console.
  ///
  /// If you configure data protection for the web ACL, the protection applies to
  /// the web ACL's sampled web request data.
  /// <note>
  /// Request sampling doesn't provide a field redaction option, and any field
  /// redaction that you specify in your logging configuration doesn't affect
  /// sampling. You can only exclude fields from request sampling by disabling
  /// sampling in the web ACL visibility configuration or by configuring data
  /// protection for the web ACL.
  /// </note>
  final bool sampledRequestsEnabled;

  VisibilityConfig({
    required this.cloudWatchMetricsEnabled,
    required this.metricName,
    required this.sampledRequestsEnabled,
  });

  factory VisibilityConfig.fromJson(Map<String, dynamic> json) {
    return VisibilityConfig(
      cloudWatchMetricsEnabled:
          (json['CloudWatchMetricsEnabled'] as bool?) ?? false,
      metricName: (json['MetricName'] as String?) ?? '',
      sampledRequestsEnabled:
          (json['SampledRequestsEnabled'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchMetricsEnabled = this.cloudWatchMetricsEnabled;
    final metricName = this.metricName;
    final sampledRequestsEnabled = this.sampledRequestsEnabled;
    return {
      'CloudWatchMetricsEnabled': cloudWatchMetricsEnabled,
      'MetricName': metricName,
      'SampledRequestsEnabled': sampledRequestsEnabled,
    };
  }
}

/// Specifies data protection to apply to the web request data for the web ACL.
/// This is a web ACL level data protection option.
///
/// The data protection that you configure for the web ACL alters the data
/// that's available for any other data collection activity, including your WAF
/// logging destinations, web ACL request sampling, and Amazon Security Lake
/// data collection and management. Your other option for data protection is in
/// the logging configuration, which only affects logging.
///
/// This is part of the data protection configuration for a web ACL.
///
/// @nodoc
class DataProtectionConfig {
  /// An array of data protection configurations for specific web request field
  /// types. This is defined for each web ACL. WAF applies the specified
  /// protection to all web requests that the web ACL inspects.
  final List<DataProtection> dataProtections;

  DataProtectionConfig({
    required this.dataProtections,
  });

  factory DataProtectionConfig.fromJson(Map<String, dynamic> json) {
    return DataProtectionConfig(
      dataProtections: ((json['DataProtections'] as List?) ?? const [])
          .nonNulls
          .map((e) => DataProtection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataProtections = this.dataProtections;
    return {
      'DataProtections': dataProtections,
    };
  }
}

/// Specifies how WAF should handle <code>CAPTCHA</code> evaluations. This is
/// available at the web ACL level and in each rule.
///
/// @nodoc
class CaptchaConfig {
  /// Determines how long a <code>CAPTCHA</code> timestamp in the token remains
  /// valid after the client successfully solves a <code>CAPTCHA</code> puzzle.
  final ImmunityTimeProperty? immunityTimeProperty;

  CaptchaConfig({
    this.immunityTimeProperty,
  });

  factory CaptchaConfig.fromJson(Map<String, dynamic> json) {
    return CaptchaConfig(
      immunityTimeProperty: json['ImmunityTimeProperty'] != null
          ? ImmunityTimeProperty.fromJson(
              json['ImmunityTimeProperty'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final immunityTimeProperty = this.immunityTimeProperty;
    return {
      if (immunityTimeProperty != null)
        'ImmunityTimeProperty': immunityTimeProperty,
    };
  }
}

/// Specifies how WAF should handle <code>Challenge</code> evaluations. This is
/// available at the web ACL level and in each rule.
///
/// @nodoc
class ChallengeConfig {
  /// Determines how long a challenge timestamp in the token remains valid after
  /// the client successfully responds to a challenge.
  final ImmunityTimeProperty? immunityTimeProperty;

  ChallengeConfig({
    this.immunityTimeProperty,
  });

  factory ChallengeConfig.fromJson(Map<String, dynamic> json) {
    return ChallengeConfig(
      immunityTimeProperty: json['ImmunityTimeProperty'] != null
          ? ImmunityTimeProperty.fromJson(
              json['ImmunityTimeProperty'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final immunityTimeProperty = this.immunityTimeProperty;
    return {
      if (immunityTimeProperty != null)
        'ImmunityTimeProperty': immunityTimeProperty,
    };
  }
}

/// Specifies custom configurations for the associations between the web ACL and
/// protected resources.
///
/// Use this to customize the maximum size of the request body that your
/// protected resources forward to WAF for inspection. You can customize this
/// setting for CloudFront, API Gateway, Amazon Cognito, App Runner, or Verified
/// Access resources. The default setting is 16 KB (16,384 bytes).
/// <note>
/// You are charged additional fees when your protected resources forward body
/// sizes that are larger than the default. For more information, see <a
/// href="http://aws.amazon.com/waf/pricing/">WAF Pricing</a>.
/// </note>
/// For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192
/// bytes).
///
/// @nodoc
class AssociationConfig {
  /// Customizes the maximum size of the request body that your protected
  /// CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access
  /// resources forward to WAF for inspection. The default size is 16 KB (16,384
  /// bytes). You can change the setting for any of the available resource types.
  /// <note>
  /// You are charged additional fees when your protected resources forward body
  /// sizes that are larger than the default. For more information, see <a
  /// href="http://aws.amazon.com/waf/pricing/">WAF Pricing</a>.
  /// </note>
  /// Example JSON: <code> { "API_GATEWAY": "KB_48", "APP_RUNNER_SERVICE": "KB_32"
  /// }</code>
  ///
  /// For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192
  /// bytes).
  final Map<AssociatedResourceType, RequestBodyAssociatedResourceTypeConfig>?
      requestBody;

  AssociationConfig({
    this.requestBody,
  });

  factory AssociationConfig.fromJson(Map<String, dynamic> json) {
    return AssociationConfig(
      requestBody: (json['RequestBody'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              AssociatedResourceType.fromString(k),
              RequestBodyAssociatedResourceTypeConfig.fromJson(
                  e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final requestBody = this.requestBody;
    return {
      if (requestBody != null)
        'RequestBody': requestBody.map((k, e) => MapEntry(k.value, e)),
    };
  }
}

/// Configures the level of DDoS protection that applies to web ACLs associated
/// with Application Load Balancers.
///
/// @nodoc
class OnSourceDDoSProtectionConfig {
  /// The level of DDoS protection that applies to web ACLs associated with
  /// Application Load Balancers. <code>ACTIVE_UNDER_DDOS</code> protection is
  /// enabled by default whenever a web ACL is associated with an Application Load
  /// Balancer. In the event that an Application Load Balancer experiences
  /// high-load conditions or suspected DDoS attacks, the
  /// <code>ACTIVE_UNDER_DDOS</code> protection automatically rate limits traffic
  /// from known low reputation sources without disrupting Application Load
  /// Balancer availability. <code>ALWAYS_ON</code> protection provides constant,
  /// always-on monitoring of known low reputation sources for suspected DDoS
  /// attacks. While this provides a higher level of protection, there may be
  /// potential impacts on legitimate traffic.
  final LowReputationMode aLBLowReputationMode;

  OnSourceDDoSProtectionConfig({
    required this.aLBLowReputationMode,
  });

  factory OnSourceDDoSProtectionConfig.fromJson(Map<String, dynamic> json) {
    return OnSourceDDoSProtectionConfig(
      aLBLowReputationMode: LowReputationMode.fromString(
          (json['ALBLowReputationMode'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final aLBLowReputationMode = this.aLBLowReputationMode;
    return {
      'ALBLowReputationMode': aLBLowReputationMode.value,
    };
  }
}

/// A list of <code>ApplicationAttribute</code>s that contains information about
/// the application.
///
/// @nodoc
class ApplicationConfig {
  /// Contains the attribute name and a list of values for that attribute.
  final List<ApplicationAttribute>? attributes;

  ApplicationConfig({
    this.attributes,
  });

  factory ApplicationConfig.fromJson(Map<String, dynamic> json) {
    return ApplicationConfig(
      attributes: (json['Attributes'] as List?)
          ?.nonNulls
          .map((e) => ApplicationAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

/// Application details defined during the web ACL creation process. Application
/// attributes help WAF give recommendations for protection packs.
///
/// @nodoc
class ApplicationAttribute {
  /// Specifies the attribute name.
  final String? name;

  /// Specifies the attribute value.
  final List<String>? values;

  ApplicationAttribute({
    this.name,
    this.values,
  });

  factory ApplicationAttribute.fromJson(Map<String, dynamic> json) {
    return ApplicationAttribute(
      name: json['Name'] as String?,
      values:
          (json['Values'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'Name': name,
      if (values != null) 'Values': values,
    };
  }
}

/// @nodoc
class LowReputationMode {
  static const activeUnderDdos = LowReputationMode._('ACTIVE_UNDER_DDOS');
  static const alwaysOn = LowReputationMode._('ALWAYS_ON');

  final String value;

  const LowReputationMode._(this.value);

  static const values = [activeUnderDdos, alwaysOn];

  static LowReputationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LowReputationMode._(value));

  @override
  bool operator ==(other) => other is LowReputationMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AssociatedResourceType {
  static const cloudfront = AssociatedResourceType._('CLOUDFRONT');
  static const apiGateway = AssociatedResourceType._('API_GATEWAY');
  static const cognitoUserPool = AssociatedResourceType._('COGNITO_USER_POOL');
  static const appRunnerService =
      AssociatedResourceType._('APP_RUNNER_SERVICE');
  static const verifiedAccessInstance =
      AssociatedResourceType._('VERIFIED_ACCESS_INSTANCE');

  final String value;

  const AssociatedResourceType._(this.value);

  static const values = [
    cloudfront,
    apiGateway,
    cognitoUserPool,
    appRunnerService,
    verifiedAccessInstance
  ];

  static AssociatedResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AssociatedResourceType._(value));

  @override
  bool operator ==(other) =>
      other is AssociatedResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Customizes the maximum size of the request body that your protected
/// CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access
/// resources forward to WAF for inspection. The default size is 16 KB (16,384
/// bytes). You can change the setting for any of the available resource types.
/// <note>
/// You are charged additional fees when your protected resources forward body
/// sizes that are larger than the default. For more information, see <a
/// href="http://aws.amazon.com/waf/pricing/">WAF Pricing</a>.
/// </note>
/// Example JSON: <code> { "API_GATEWAY": "KB_48", "APP_RUNNER_SERVICE": "KB_32"
/// }</code>
///
/// For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192
/// bytes).
///
/// This is used in the <code>AssociationConfig</code> of the web ACL.
///
/// @nodoc
class RequestBodyAssociatedResourceTypeConfig {
  /// Specifies the maximum size of the web request body component that an
  /// associated CloudFront, API Gateway, Amazon Cognito, App Runner, or Verified
  /// Access resource should send to WAF for inspection. This applies to
  /// statements in the web ACL that inspect the body or JSON body.
  ///
  /// Default: <code>16 KB (16,384 bytes)</code>
  final SizeInspectionLimit defaultSizeInspectionLimit;

  RequestBodyAssociatedResourceTypeConfig({
    required this.defaultSizeInspectionLimit,
  });

  factory RequestBodyAssociatedResourceTypeConfig.fromJson(
      Map<String, dynamic> json) {
    return RequestBodyAssociatedResourceTypeConfig(
      defaultSizeInspectionLimit: SizeInspectionLimit.fromString(
          (json['DefaultSizeInspectionLimit'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultSizeInspectionLimit = this.defaultSizeInspectionLimit;
    return {
      'DefaultSizeInspectionLimit': defaultSizeInspectionLimit.value,
    };
  }
}

/// @nodoc
class SizeInspectionLimit {
  static const kb_16 = SizeInspectionLimit._('KB_16');
  static const kb_32 = SizeInspectionLimit._('KB_32');
  static const kb_48 = SizeInspectionLimit._('KB_48');
  static const kb_64 = SizeInspectionLimit._('KB_64');

  final String value;

  const SizeInspectionLimit._(this.value);

  static const values = [kb_16, kb_32, kb_48, kb_64];

  static SizeInspectionLimit fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SizeInspectionLimit._(value));

  @override
  bool operator ==(other) =>
      other is SizeInspectionLimit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Used for CAPTCHA and challenge token settings. Determines how long a
/// <code>CAPTCHA</code> or challenge timestamp remains valid after WAF updates
/// it for a successful <code>CAPTCHA</code> or challenge response.
///
/// @nodoc
class ImmunityTimeProperty {
  /// The amount of time, in seconds, that a <code>CAPTCHA</code> or challenge
  /// timestamp is considered valid by WAF. The default setting is 300.
  ///
  /// For the Challenge action, the minimum setting is 300.
  final int immunityTime;

  ImmunityTimeProperty({
    required this.immunityTime,
  });

  factory ImmunityTimeProperty.fromJson(Map<String, dynamic> json) {
    return ImmunityTimeProperty(
      immunityTime: (json['ImmunityTime'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final immunityTime = this.immunityTime;
    return {
      'ImmunityTime': immunityTime,
    };
  }
}

/// The response body to use in a custom response to a web request. This is
/// referenced by key from <a>CustomResponse</a>
/// <code>CustomResponseBodyKey</code>.
///
/// @nodoc
class CustomResponseBody {
  /// The payload of the custom response.
  ///
  /// You can use JSON escape strings in JSON content. To do this, you must
  /// specify JSON content in the <code>ContentType</code> setting.
  ///
  /// For information about the limits on count and size for custom request and
  /// response settings, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/limits.html">WAF
  /// quotas</a> in the <i>WAF Developer Guide</i>.
  final String content;

  /// The type of content in the payload that you are defining in the
  /// <code>Content</code> string.
  final ResponseContentType contentType;

  CustomResponseBody({
    required this.content,
    required this.contentType,
  });

  factory CustomResponseBody.fromJson(Map<String, dynamic> json) {
    return CustomResponseBody(
      content: (json['Content'] as String?) ?? '',
      contentType: ResponseContentType.fromString(
          (json['ContentType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final contentType = this.contentType;
    return {
      'Content': content,
      'ContentType': contentType.value,
    };
  }
}

/// @nodoc
class ResponseContentType {
  static const textPlain = ResponseContentType._('TEXT_PLAIN');
  static const textHtml = ResponseContentType._('TEXT_HTML');
  static const applicationJson = ResponseContentType._('APPLICATION_JSON');

  final String value;

  const ResponseContentType._(this.value);

  static const values = [textPlain, textHtml, applicationJson];

  static ResponseContentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResponseContentType._(value));

  @override
  bool operator ==(other) =>
      other is ResponseContentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the protection behavior for a field type. This is part of the data
/// protection configuration for a web ACL.
///
/// @nodoc
class DataProtection {
  /// Specifies how to protect the field. WAF can apply a one-way hash to the
  /// field or hard code a string substitution.
  ///
  /// <ul>
  /// <li>
  /// One-way hash example:
  /// <code>ade099751dEXAMPLEHASH2ea9f3393f80dd5d3bEXAMPLEHASH966ae0d3cd5a1e</code>
  /// </li>
  /// <li>
  /// Substitution example: <code>REDACTED</code>
  /// </li>
  /// </ul>
  final DataProtectionAction action;

  /// Specifies the field type and optional keys to apply the protection behavior
  /// to.
  final FieldToProtect field;

  /// Specifies whether to also exclude any rate-based rule details from the data
  /// protection you have enabled for a given field. If you specify this
  /// exception, RateBasedDetails will show the value of the field. For additional
  /// information, see the log field <code>rateBasedRuleList</code> at <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html">Log
  /// fields for web ACL traffic</a> in the <i>WAF Developer Guide</i>.
  ///
  /// Default: <code>FALSE</code>
  final bool? excludeRateBasedDetails;

  /// Specifies whether to also exclude any rule match details from the data
  /// protection you have enabled for a given field. WAF logs these details for
  /// non-terminating matching rules and for the terminating matching rule. For
  /// additional information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html">Log
  /// fields for web ACL traffic</a> in the <i>WAF Developer Guide</i>.
  ///
  /// Default: <code>FALSE</code>
  final bool? excludeRuleMatchDetails;

  DataProtection({
    required this.action,
    required this.field,
    this.excludeRateBasedDetails,
    this.excludeRuleMatchDetails,
  });

  factory DataProtection.fromJson(Map<String, dynamic> json) {
    return DataProtection(
      action:
          DataProtectionAction.fromString((json['Action'] as String?) ?? ''),
      field: FieldToProtect.fromJson((json['Field'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      excludeRateBasedDetails: json['ExcludeRateBasedDetails'] as bool?,
      excludeRuleMatchDetails: json['ExcludeRuleMatchDetails'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final field = this.field;
    final excludeRateBasedDetails = this.excludeRateBasedDetails;
    final excludeRuleMatchDetails = this.excludeRuleMatchDetails;
    return {
      'Action': action.value,
      'Field': field,
      if (excludeRateBasedDetails != null)
        'ExcludeRateBasedDetails': excludeRateBasedDetails,
      if (excludeRuleMatchDetails != null)
        'ExcludeRuleMatchDetails': excludeRuleMatchDetails,
    };
  }
}

/// Specifies a field type and keys to protect in stored web request data. This
/// is part of the data protection configuration for a web ACL.
///
/// @nodoc
class FieldToProtect {
  /// Specifies the web request component type to protect.
  final FieldToProtectType fieldType;

  /// Specifies the keys to protect for the specified field type. If you don't
  /// specify any key, then all keys for the field type are protected.
  final List<String>? fieldKeys;

  FieldToProtect({
    required this.fieldType,
    this.fieldKeys,
  });

  factory FieldToProtect.fromJson(Map<String, dynamic> json) {
    return FieldToProtect(
      fieldType:
          FieldToProtectType.fromString((json['FieldType'] as String?) ?? ''),
      fieldKeys: (json['FieldKeys'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldType = this.fieldType;
    final fieldKeys = this.fieldKeys;
    return {
      'FieldType': fieldType.value,
      if (fieldKeys != null) 'FieldKeys': fieldKeys,
    };
  }
}

/// @nodoc
class DataProtectionAction {
  static const substitution = DataProtectionAction._('SUBSTITUTION');
  static const hash = DataProtectionAction._('HASH');

  final String value;

  const DataProtectionAction._(this.value);

  static const values = [substitution, hash];

  static DataProtectionAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataProtectionAction._(value));

  @override
  bool operator ==(other) =>
      other is DataProtectionAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FieldToProtectType {
  static const singleHeader = FieldToProtectType._('SINGLE_HEADER');
  static const singleCookie = FieldToProtectType._('SINGLE_COOKIE');
  static const singleQueryArgument =
      FieldToProtectType._('SINGLE_QUERY_ARGUMENT');
  static const queryString = FieldToProtectType._('QUERY_STRING');
  static const body = FieldToProtectType._('BODY');

  final String value;

  const FieldToProtectType._(this.value);

  static const values = [
    singleHeader,
    singleCookie,
    singleQueryArgument,
    queryString,
    body
  ];

  static FieldToProtectType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FieldToProtectType._(value));

  @override
  bool operator ==(other) =>
      other is FieldToProtectType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A single rule, which you can use in a <a>WebACL</a> or <a>RuleGroup</a> to
/// identify web requests that you want to manage in some way. Each rule
/// includes one top-level <a>Statement</a> that WAF uses to identify matching
/// web requests, and parameters that govern how WAF handles them.
///
/// @nodoc
class Rule {
  /// The name of the rule.
  ///
  /// If you change the name of a <code>Rule</code> after you create it and you
  /// want the rule's metric name to reflect the change, update the metric name in
  /// the rule's <code>VisibilityConfig</code> settings. WAF doesn't automatically
  /// update the metric name when you update the rule name.
  final String name;

  /// If you define more than one <code>Rule</code> in a <code>WebACL</code>, WAF
  /// evaluates each request against the <code>Rules</code> in order based on the
  /// value of <code>Priority</code>. WAF processes rules with lower priority
  /// first. The priorities don't need to be consecutive, but they must all be
  /// different.
  final int priority;

  /// The WAF processing statement for the rule, for example
  /// <a>ByteMatchStatement</a> or <a>SizeConstraintStatement</a>.
  final Statement statement;

  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  ///
  /// If you change the name of a <code>Rule</code> after you create it and you
  /// want the rule's metric name to reflect the change, update the metric name as
  /// well. WAF doesn't automatically update the metric name.
  final VisibilityConfig visibilityConfig;

  /// The action that WAF should take on a web request when it matches the rule
  /// statement. Settings at the web ACL level can override the rule action
  /// setting.
  ///
  /// This is used only for rules whose statements do not reference a rule group.
  /// Rule statements that reference a rule group include
  /// <code>RuleGroupReferenceStatement</code> and
  /// <code>ManagedRuleGroupStatement</code>.
  ///
  /// You must specify either this <code>Action</code> setting or the rule
  /// <code>OverrideAction</code> setting, but not both:
  ///
  /// <ul>
  /// <li>
  /// If the rule statement does not reference a rule group, use this rule action
  /// setting and not the rule override action setting.
  /// </li>
  /// <li>
  /// If the rule statement references a rule group, use the override action
  /// setting and not this action setting.
  /// </li>
  /// </ul>
  final RuleAction? action;

  /// Specifies how WAF should handle <code>CAPTCHA</code> evaluations. If you
  /// don't specify this, WAF uses the <code>CAPTCHA</code> configuration that's
  /// defined for the web ACL.
  final CaptchaConfig? captchaConfig;

  /// Specifies how WAF should handle <code>Challenge</code> evaluations. If you
  /// don't specify this, WAF uses the challenge configuration that's defined for
  /// the web ACL.
  final ChallengeConfig? challengeConfig;

  /// The action to use in the place of the action that results from the rule
  /// group evaluation. Set the override action to none to leave the result of the
  /// rule group alone. Set it to count to override the result to count only.
  ///
  /// You can only use this for rule statements that reference a rule group, like
  /// <code>RuleGroupReferenceStatement</code> and
  /// <code>ManagedRuleGroupStatement</code>.
  /// <note>
  /// This option is usually set to none. It does not affect how the rules in the
  /// rule group are evaluated. If you want the rules in the rule group to only
  /// count matches, do not use this and instead use the rule action override
  /// option, with <code>Count</code> action, in your rule group reference
  /// statement settings.
  /// </note>
  final OverrideAction? overrideAction;

  /// Labels to apply to web requests that match the rule match statement. WAF
  /// applies fully qualified labels to matching web requests. A fully qualified
  /// label is the concatenation of a label namespace and a rule label. The rule's
  /// rule group or web ACL defines the label namespace.
  /// <note>
  /// Any rule that isn't a rule group reference statement or managed rule group
  /// statement can add labels to matching web requests.
  /// </note>
  /// Rules that run after this rule in the web ACL can match against these labels
  /// using a <code>LabelMatchStatement</code>.
  ///
  /// For each label, provide a case-sensitive string containing optional
  /// namespaces and a label name, according to the following guidelines:
  ///
  /// <ul>
  /// <li>
  /// Separate each component of the label with a colon.
  /// </li>
  /// <li>
  /// Each namespace or name can have up to 128 characters.
  /// </li>
  /// <li>
  /// You can specify up to 5 namespaces in a label.
  /// </li>
  /// <li>
  /// Don't use the following reserved words in your label specification:
  /// <code>aws</code>, <code>waf</code>, <code>managed</code>,
  /// <code>rulegroup</code>, <code>webacl</code>, <code>regexpatternset</code>,
  /// or <code>ipset</code>.
  /// </li>
  /// </ul>
  /// For example, <code>myLabelName</code> or
  /// <code>nameSpace1:nameSpace2:myLabelName</code>.
  final List<Label>? ruleLabels;

  Rule({
    required this.name,
    required this.priority,
    required this.statement,
    required this.visibilityConfig,
    this.action,
    this.captchaConfig,
    this.challengeConfig,
    this.overrideAction,
    this.ruleLabels,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      name: (json['Name'] as String?) ?? '',
      priority: (json['Priority'] as int?) ?? 0,
      statement: Statement.fromJson(
          (json['Statement'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      visibilityConfig: VisibilityConfig.fromJson(
          (json['VisibilityConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      action: json['Action'] != null
          ? RuleAction.fromJson(json['Action'] as Map<String, dynamic>)
          : null,
      captchaConfig: json['CaptchaConfig'] != null
          ? CaptchaConfig.fromJson(
              json['CaptchaConfig'] as Map<String, dynamic>)
          : null,
      challengeConfig: json['ChallengeConfig'] != null
          ? ChallengeConfig.fromJson(
              json['ChallengeConfig'] as Map<String, dynamic>)
          : null,
      overrideAction: json['OverrideAction'] != null
          ? OverrideAction.fromJson(
              json['OverrideAction'] as Map<String, dynamic>)
          : null,
      ruleLabels: (json['RuleLabels'] as List?)
          ?.nonNulls
          .map((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final priority = this.priority;
    final statement = this.statement;
    final visibilityConfig = this.visibilityConfig;
    final action = this.action;
    final captchaConfig = this.captchaConfig;
    final challengeConfig = this.challengeConfig;
    final overrideAction = this.overrideAction;
    final ruleLabels = this.ruleLabels;
    return {
      'Name': name,
      'Priority': priority,
      'Statement': statement,
      'VisibilityConfig': visibilityConfig,
      if (action != null) 'Action': action,
      if (captchaConfig != null) 'CaptchaConfig': captchaConfig,
      if (challengeConfig != null) 'ChallengeConfig': challengeConfig,
      if (overrideAction != null) 'OverrideAction': overrideAction,
      if (ruleLabels != null) 'RuleLabels': ruleLabels,
    };
  }
}

/// The processing guidance for a <a>Rule</a>, used by WAF to determine whether
/// a web request matches the rule.
///
/// For example specifications, see the examples section of <a>CreateWebACL</a>.
///
/// @nodoc
class Statement {
  /// A logical rule statement used to combine other rule statements with AND
  /// logic. You provide more than one <a>Statement</a> within the
  /// <code>AndStatement</code>.
  final AndStatement? andStatement;

  /// A rule statement that inspects web traffic based on the Autonomous System
  /// Number (ASN) associated with the request's IP address.
  ///
  /// For additional details, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-asn-match.html">ASN
  /// match rule statement</a> in the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">WAF
  /// Developer Guide</a>.
  final AsnMatchStatement? asnMatchStatement;

  /// A rule statement that defines a string match search for WAF to apply to web
  /// requests. The byte match statement provides the bytes to search for, the
  /// location in requests that you want WAF to search, and other settings. The
  /// bytes to search for are typically a string that corresponds with ASCII
  /// characters. In the WAF console and the developer guide, this is called a
  /// string match statement.
  final ByteMatchStatement? byteMatchStatement;

  /// A rule statement that labels web requests by country and region and that
  /// matches against web requests based on country code. A geo match rule labels
  /// every request that it inspects regardless of whether it finds a match.
  ///
  /// <ul>
  /// <li>
  /// To manage requests only by country, you can use this statement by itself and
  /// specify the countries that you want to match against in the
  /// <code>CountryCodes</code> array.
  /// </li>
  /// <li>
  /// Otherwise, configure your geo match rule with Count action so that it only
  /// labels requests. Then, add one or more label match rules to run after the
  /// geo match rule and configure them to match against the geographic labels and
  /// handle the requests as needed.
  /// </li>
  /// </ul>
  /// WAF labels requests using the alpha-2 country and region codes from the
  /// International Organization for Standardization (ISO) 3166 standard. WAF
  /// determines the codes using either the IP address in the web request origin
  /// or, if you specify it, the address in the geo match
  /// <code>ForwardedIPConfig</code>.
  ///
  /// If you use the web request origin, the label formats are
  /// <code>awswaf:clientip:geo:region:<ISO country code>-<ISO region code></code>
  /// and <code>awswaf:clientip:geo:country:<ISO country code></code>.
  ///
  /// If you use a forwarded IP address, the label formats are
  /// <code>awswaf:forwardedip:geo:region:<ISO country code>-<ISO region
  /// code></code> and <code>awswaf:forwardedip:geo:country:<ISO country
  /// code></code>.
  ///
  /// For additional details, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-geo-match.html">Geographic
  /// match rule statement</a> in the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">WAF
  /// Developer Guide</a>.
  final GeoMatchStatement? geoMatchStatement;

  /// A rule statement used to detect web requests coming from particular IP
  /// addresses or address ranges. To use this, create an <a>IPSet</a> that
  /// specifies the addresses you want to detect, then use the ARN of that set in
  /// this statement. To create an IP set, see <a>CreateIPSet</a>.
  ///
  /// Each IP set rule statement references an IP set. You create and maintain the
  /// set independent of your rules. This allows you to use the single set in
  /// multiple rules. When you update the referenced set, WAF automatically
  /// updates all rules that reference it.
  final IPSetReferenceStatement? iPSetReferenceStatement;

  /// A rule statement to match against labels that have been added to the web
  /// request by rules that have already run in the web ACL.
  ///
  /// The label match statement provides the label or namespace string to search
  /// for. The label string can represent a part or all of the fully qualified
  /// label name that had been added to the web request. Fully qualified labels
  /// have a prefix, optional namespaces, and label name. The prefix identifies
  /// the rule group or web ACL context of the rule that added the label. If you
  /// do not provide the fully qualified name in your label match string, WAF
  /// performs the search for labels that were added in the same context as the
  /// label match statement.
  final LabelMatchStatement? labelMatchStatement;

  /// A rule statement used to run the rules that are defined in a managed rule
  /// group. To use this, provide the vendor name and the name of the rule group
  /// in this statement. You can retrieve the required names by calling
  /// <a>ListAvailableManagedRuleGroups</a>.
  ///
  /// You cannot nest a <code>ManagedRuleGroupStatement</code>, for example for
  /// use inside a <code>NotStatement</code> or <code>OrStatement</code>. You
  /// cannot use a managed rule group inside another rule group. You can only
  /// reference a managed rule group as a top-level statement within a rule that
  /// you define in a web ACL.
  /// <note>
  /// You are charged additional fees when you use the WAF Bot Control managed
  /// rule group <code>AWSManagedRulesBotControlRuleSet</code>, the WAF Fraud
  /// Control account takeover prevention (ATP) managed rule group
  /// <code>AWSManagedRulesATPRuleSet</code>, or the WAF Fraud Control account
  /// creation fraud prevention (ACFP) managed rule group
  /// <code>AWSManagedRulesACFPRuleSet</code>. For more information, see <a
  /// href="http://aws.amazon.com/waf/pricing/">WAF Pricing</a>.
  /// </note>
  final ManagedRuleGroupStatement? managedRuleGroupStatement;

  /// A logical rule statement used to negate the results of another rule
  /// statement. You provide one <a>Statement</a> within the
  /// <code>NotStatement</code>.
  final NotStatement? notStatement;

  /// A logical rule statement used to combine other rule statements with OR
  /// logic. You provide more than one <a>Statement</a> within the
  /// <code>OrStatement</code>.
  final OrStatement? orStatement;

  /// A rate-based rule counts incoming requests and rate limits requests when
  /// they are coming at too fast a rate. The rule categorizes requests according
  /// to your aggregation criteria, collects them into aggregation instances, and
  /// counts and rate limits the requests for each instance.
  /// <note>
  /// If you change any of these settings in a rule that's currently in use, the
  /// change resets the rule's rate limiting counts. This can pause the rule's
  /// rate limiting activities for up to a minute.
  /// </note>
  /// You can specify individual aggregation keys, like IP address or HTTP method.
  /// You can also specify aggregation key combinations, like IP address and HTTP
  /// method, or HTTP method, query argument, and cookie.
  ///
  /// Each unique set of values for the aggregation keys that you specify is a
  /// separate aggregation instance, with the value from each key contributing to
  /// the aggregation instance definition.
  ///
  /// For example, assume the rule evaluates web requests with the following IP
  /// address and HTTP method values:
  ///
  /// <ul>
  /// <li>
  /// IP address 10.1.1.1, HTTP method POST
  /// </li>
  /// <li>
  /// IP address 10.1.1.1, HTTP method GET
  /// </li>
  /// <li>
  /// IP address 127.0.0.0, HTTP method POST
  /// </li>
  /// <li>
  /// IP address 10.1.1.1, HTTP method GET
  /// </li>
  /// </ul>
  /// The rule would create different aggregation instances according to your
  /// aggregation criteria, for example:
  ///
  /// <ul>
  /// <li>
  /// If the aggregation criteria is just the IP address, then each individual
  /// address is an aggregation instance, and WAF counts requests separately for
  /// each. The aggregation instances and request counts for our example would be
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// IP address 10.1.1.1: count 3
  /// </li>
  /// <li>
  /// IP address 127.0.0.0: count 1
  /// </li>
  /// </ul> </li>
  /// <li>
  /// If the aggregation criteria is HTTP method, then each individual HTTP method
  /// is an aggregation instance. The aggregation instances and request counts for
  /// our example would be the following:
  ///
  /// <ul>
  /// <li>
  /// HTTP method POST: count 2
  /// </li>
  /// <li>
  /// HTTP method GET: count 2
  /// </li>
  /// </ul> </li>
  /// <li>
  /// If the aggregation criteria is IP address and HTTP method, then each IP
  /// address and each HTTP method would contribute to the combined aggregation
  /// instance. The aggregation instances and request counts for our example would
  /// be the following:
  ///
  /// <ul>
  /// <li>
  /// IP address 10.1.1.1, HTTP method POST: count 1
  /// </li>
  /// <li>
  /// IP address 10.1.1.1, HTTP method GET: count 2
  /// </li>
  /// <li>
  /// IP address 127.0.0.0, HTTP method POST: count 1
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// For any n-tuple of aggregation keys, each unique combination of values for
  /// the keys defines a separate aggregation instance, which WAF counts and
  /// rate-limits individually.
  ///
  /// You can optionally nest another statement inside the rate-based statement,
  /// to narrow the scope of the rule so that it only counts and rate limits
  /// requests that match the nested statement. You can use this nested scope-down
  /// statement in conjunction with your aggregation key specifications or you can
  /// just count and rate limit all requests that match the scope-down statement,
  /// without additional aggregation. When you choose to just manage all requests
  /// that match a scope-down statement, the aggregation instance is singular for
  /// the rule.
  ///
  /// You cannot nest a <code>RateBasedStatement</code> inside another statement,
  /// for example inside a <code>NotStatement</code> or <code>OrStatement</code>.
  /// You can define a <code>RateBasedStatement</code> inside a web ACL and inside
  /// a rule group.
  ///
  /// For additional information about the options, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-rate-based-rules.html">Rate
  /// limiting web requests using rate-based rules</a> in the <i>WAF Developer
  /// Guide</i>.
  ///
  /// If you only aggregate on the individual IP address or forwarded IP address,
  /// you can retrieve the list of IP addresses that WAF is currently rate
  /// limiting for a rule through the API call
  /// <code>GetRateBasedStatementManagedKeys</code>. This option is not available
  /// for other aggregation configurations.
  ///
  /// WAF tracks and manages web requests separately for each instance of a
  /// rate-based rule that you use. For example, if you provide the same
  /// rate-based rule settings in two web ACLs, each of the two rule statements
  /// represents a separate instance of the rate-based rule and gets its own
  /// tracking and management by WAF. If you define a rate-based rule inside a
  /// rule group, and then use that rule group in multiple places, each use
  /// creates a separate instance of the rate-based rule that gets its own
  /// tracking and management by WAF.
  final RateBasedStatement? rateBasedStatement;

  /// A rule statement used to search web request components for a match against a
  /// single regular expression.
  final RegexMatchStatement? regexMatchStatement;

  /// A rule statement used to search web request components for matches with
  /// regular expressions. To use this, create a <a>RegexPatternSet</a> that
  /// specifies the expressions that you want to detect, then use the ARN of that
  /// set in this statement. A web request matches the pattern set rule statement
  /// if the request component matches any of the patterns in the set. To create a
  /// regex pattern set, see <a>CreateRegexPatternSet</a>.
  ///
  /// Each regex pattern set rule statement references a regex pattern set. You
  /// create and maintain the set independent of your rules. This allows you to
  /// use the single set in multiple rules. When you update the referenced set,
  /// WAF automatically updates all rules that reference it.
  final RegexPatternSetReferenceStatement? regexPatternSetReferenceStatement;

  /// A rule statement used to run the rules that are defined in a
  /// <a>RuleGroup</a>. To use this, create a rule group with your rules, then
  /// provide the ARN of the rule group in this statement.
  ///
  /// You cannot nest a <code>RuleGroupReferenceStatement</code>, for example for
  /// use inside a <code>NotStatement</code> or <code>OrStatement</code>. You
  /// cannot use a rule group reference statement inside another rule group. You
  /// can only reference a rule group as a top-level statement within a rule that
  /// you define in a web ACL.
  final RuleGroupReferenceStatement? ruleGroupReferenceStatement;

  /// A rule statement that compares a number of bytes against the size of a
  /// request component, using a comparison operator, such as greater than (>) or
  /// less than (<). For example, you can use a size constraint statement to look
  /// for query strings that are longer than 100 bytes.
  ///
  /// If you configure WAF to inspect the request body, WAF inspects only the
  /// number of bytes in the body up to the limit for the web ACL and protected
  /// resource type. If you know that the request body for your web requests
  /// should never exceed the inspection limit, you can use a size constraint
  /// statement to block requests that have a larger request body size. For more
  /// information about the inspection limits, see <code>Body</code> and
  /// <code>JsonBody</code> settings for the <code>FieldToMatch</code> data type.
  ///
  /// If you choose URI for the value of Part of the request to filter on, the
  /// slash (/) in the URI counts as one character. For example, the URI
  /// <code>/logo.jpg</code> is nine characters long.
  final SizeConstraintStatement? sizeConstraintStatement;

  /// A rule statement that inspects for malicious SQL code. Attackers insert
  /// malicious SQL code into web requests to do things like modify your database
  /// or extract data from it.
  final SqliMatchStatement? sqliMatchStatement;

  /// A rule statement that inspects for cross-site scripting (XSS) attacks. In
  /// XSS attacks, the attacker uses vulnerabilities in a benign website as a
  /// vehicle to inject malicious client-site scripts into other legitimate web
  /// browsers.
  final XssMatchStatement? xssMatchStatement;

  Statement({
    this.andStatement,
    this.asnMatchStatement,
    this.byteMatchStatement,
    this.geoMatchStatement,
    this.iPSetReferenceStatement,
    this.labelMatchStatement,
    this.managedRuleGroupStatement,
    this.notStatement,
    this.orStatement,
    this.rateBasedStatement,
    this.regexMatchStatement,
    this.regexPatternSetReferenceStatement,
    this.ruleGroupReferenceStatement,
    this.sizeConstraintStatement,
    this.sqliMatchStatement,
    this.xssMatchStatement,
  });

  factory Statement.fromJson(Map<String, dynamic> json) {
    return Statement(
      andStatement: json['AndStatement'] != null
          ? AndStatement.fromJson(json['AndStatement'] as Map<String, dynamic>)
          : null,
      asnMatchStatement: json['AsnMatchStatement'] != null
          ? AsnMatchStatement.fromJson(
              json['AsnMatchStatement'] as Map<String, dynamic>)
          : null,
      byteMatchStatement: json['ByteMatchStatement'] != null
          ? ByteMatchStatement.fromJson(
              json['ByteMatchStatement'] as Map<String, dynamic>)
          : null,
      geoMatchStatement: json['GeoMatchStatement'] != null
          ? GeoMatchStatement.fromJson(
              json['GeoMatchStatement'] as Map<String, dynamic>)
          : null,
      iPSetReferenceStatement: json['IPSetReferenceStatement'] != null
          ? IPSetReferenceStatement.fromJson(
              json['IPSetReferenceStatement'] as Map<String, dynamic>)
          : null,
      labelMatchStatement: json['LabelMatchStatement'] != null
          ? LabelMatchStatement.fromJson(
              json['LabelMatchStatement'] as Map<String, dynamic>)
          : null,
      managedRuleGroupStatement: json['ManagedRuleGroupStatement'] != null
          ? ManagedRuleGroupStatement.fromJson(
              json['ManagedRuleGroupStatement'] as Map<String, dynamic>)
          : null,
      notStatement: json['NotStatement'] != null
          ? NotStatement.fromJson(json['NotStatement'] as Map<String, dynamic>)
          : null,
      orStatement: json['OrStatement'] != null
          ? OrStatement.fromJson(json['OrStatement'] as Map<String, dynamic>)
          : null,
      rateBasedStatement: json['RateBasedStatement'] != null
          ? RateBasedStatement.fromJson(
              json['RateBasedStatement'] as Map<String, dynamic>)
          : null,
      regexMatchStatement: json['RegexMatchStatement'] != null
          ? RegexMatchStatement.fromJson(
              json['RegexMatchStatement'] as Map<String, dynamic>)
          : null,
      regexPatternSetReferenceStatement:
          json['RegexPatternSetReferenceStatement'] != null
              ? RegexPatternSetReferenceStatement.fromJson(
                  json['RegexPatternSetReferenceStatement']
                      as Map<String, dynamic>)
              : null,
      ruleGroupReferenceStatement: json['RuleGroupReferenceStatement'] != null
          ? RuleGroupReferenceStatement.fromJson(
              json['RuleGroupReferenceStatement'] as Map<String, dynamic>)
          : null,
      sizeConstraintStatement: json['SizeConstraintStatement'] != null
          ? SizeConstraintStatement.fromJson(
              json['SizeConstraintStatement'] as Map<String, dynamic>)
          : null,
      sqliMatchStatement: json['SqliMatchStatement'] != null
          ? SqliMatchStatement.fromJson(
              json['SqliMatchStatement'] as Map<String, dynamic>)
          : null,
      xssMatchStatement: json['XssMatchStatement'] != null
          ? XssMatchStatement.fromJson(
              json['XssMatchStatement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final andStatement = this.andStatement;
    final asnMatchStatement = this.asnMatchStatement;
    final byteMatchStatement = this.byteMatchStatement;
    final geoMatchStatement = this.geoMatchStatement;
    final iPSetReferenceStatement = this.iPSetReferenceStatement;
    final labelMatchStatement = this.labelMatchStatement;
    final managedRuleGroupStatement = this.managedRuleGroupStatement;
    final notStatement = this.notStatement;
    final orStatement = this.orStatement;
    final rateBasedStatement = this.rateBasedStatement;
    final regexMatchStatement = this.regexMatchStatement;
    final regexPatternSetReferenceStatement =
        this.regexPatternSetReferenceStatement;
    final ruleGroupReferenceStatement = this.ruleGroupReferenceStatement;
    final sizeConstraintStatement = this.sizeConstraintStatement;
    final sqliMatchStatement = this.sqliMatchStatement;
    final xssMatchStatement = this.xssMatchStatement;
    return {
      if (andStatement != null) 'AndStatement': andStatement,
      if (asnMatchStatement != null) 'AsnMatchStatement': asnMatchStatement,
      if (byteMatchStatement != null) 'ByteMatchStatement': byteMatchStatement,
      if (geoMatchStatement != null) 'GeoMatchStatement': geoMatchStatement,
      if (iPSetReferenceStatement != null)
        'IPSetReferenceStatement': iPSetReferenceStatement,
      if (labelMatchStatement != null)
        'LabelMatchStatement': labelMatchStatement,
      if (managedRuleGroupStatement != null)
        'ManagedRuleGroupStatement': managedRuleGroupStatement,
      if (notStatement != null) 'NotStatement': notStatement,
      if (orStatement != null) 'OrStatement': orStatement,
      if (rateBasedStatement != null) 'RateBasedStatement': rateBasedStatement,
      if (regexMatchStatement != null)
        'RegexMatchStatement': regexMatchStatement,
      if (regexPatternSetReferenceStatement != null)
        'RegexPatternSetReferenceStatement': regexPatternSetReferenceStatement,
      if (ruleGroupReferenceStatement != null)
        'RuleGroupReferenceStatement': ruleGroupReferenceStatement,
      if (sizeConstraintStatement != null)
        'SizeConstraintStatement': sizeConstraintStatement,
      if (sqliMatchStatement != null) 'SqliMatchStatement': sqliMatchStatement,
      if (xssMatchStatement != null) 'XssMatchStatement': xssMatchStatement,
    };
  }
}

/// The action that WAF should take on a web request when it matches a rule's
/// statement. Settings at the web ACL level can override the rule action
/// setting.
///
/// @nodoc
class RuleAction {
  /// Instructs WAF to allow the web request.
  final AllowAction? allow;

  /// Instructs WAF to block the web request.
  final BlockAction? block;

  /// Instructs WAF to run a <code>CAPTCHA</code> check against the web request.
  final CaptchaAction? captcha;

  /// Instructs WAF to run a <code>Challenge</code> check against the web request.
  final ChallengeAction? challenge;

  /// Instructs WAF to count the web request and then continue evaluating the
  /// request using the remaining rules in the web ACL.
  final CountAction? count;

  RuleAction({
    this.allow,
    this.block,
    this.captcha,
    this.challenge,
    this.count,
  });

  factory RuleAction.fromJson(Map<String, dynamic> json) {
    return RuleAction(
      allow: json['Allow'] != null
          ? AllowAction.fromJson(json['Allow'] as Map<String, dynamic>)
          : null,
      block: json['Block'] != null
          ? BlockAction.fromJson(json['Block'] as Map<String, dynamic>)
          : null,
      captcha: json['Captcha'] != null
          ? CaptchaAction.fromJson(json['Captcha'] as Map<String, dynamic>)
          : null,
      challenge: json['Challenge'] != null
          ? ChallengeAction.fromJson(json['Challenge'] as Map<String, dynamic>)
          : null,
      count: json['Count'] != null
          ? CountAction.fromJson(json['Count'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final allow = this.allow;
    final block = this.block;
    final captcha = this.captcha;
    final challenge = this.challenge;
    final count = this.count;
    return {
      if (allow != null) 'Allow': allow,
      if (block != null) 'Block': block,
      if (captcha != null) 'Captcha': captcha,
      if (challenge != null) 'Challenge': challenge,
      if (count != null) 'Count': count,
    };
  }
}

/// The action to use in the place of the action that results from the rule
/// group evaluation. Set the override action to none to leave the result of the
/// rule group alone. Set it to count to override the result to count only.
///
/// You can only use this for rule statements that reference a rule group, like
/// <code>RuleGroupReferenceStatement</code> and
/// <code>ManagedRuleGroupStatement</code>.
/// <note>
/// This option is usually set to none. It does not affect how the rules in the
/// rule group are evaluated. If you want the rules in the rule group to only
/// count matches, do not use this and instead use the rule action override
/// option, with <code>Count</code> action, in your rule group reference
/// statement settings.
/// </note>
///
/// @nodoc
class OverrideAction {
  /// Override the rule group evaluation result to count only.
  /// <note>
  /// This option is usually set to none. It does not affect how the rules in the
  /// rule group are evaluated. If you want the rules in the rule group to only
  /// count matches, do not use this and instead use the rule action override
  /// option, with <code>Count</code> action, in your rule group reference
  /// statement settings.
  /// </note>
  final CountAction? count;

  /// Don't override the rule group evaluation result. This is the most common
  /// setting.
  final NoneAction? none;

  OverrideAction({
    this.count,
    this.none,
  });

  factory OverrideAction.fromJson(Map<String, dynamic> json) {
    return OverrideAction(
      count: json['Count'] != null
          ? CountAction.fromJson(json['Count'] as Map<String, dynamic>)
          : null,
      none: json['None'] != null
          ? NoneAction.fromJson(json['None'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final none = this.none;
    return {
      if (count != null) 'Count': count,
      if (none != null) 'None': none,
    };
  }
}

/// A single label container. This is used as an element of a label array in
/// multiple contexts, for example, in <code>RuleLabels</code> inside a
/// <a>Rule</a> and in <code>Labels</code> inside a <a>SampledHTTPRequest</a>.
///
/// @nodoc
class Label {
  /// The label string.
  final String name;

  Label({
    required this.name,
  });

  factory Label.fromJson(Map<String, dynamic> json) {
    return Label(
      name: (json['Name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

/// Specifies that WAF should count the request. Optionally defines additional
/// custom handling for the request.
///
/// This is used in the context of other settings, for example to specify values
/// for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
///
/// @nodoc
class CountAction {
  /// Defines custom handling for the web request.
  ///
  /// For information about customizing web requests and responses, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html">Customizing
  /// web requests and responses in WAF</a> in the <i>WAF Developer Guide</i>.
  final CustomRequestHandling? customRequestHandling;

  CountAction({
    this.customRequestHandling,
  });

  factory CountAction.fromJson(Map<String, dynamic> json) {
    return CountAction(
      customRequestHandling: json['CustomRequestHandling'] != null
          ? CustomRequestHandling.fromJson(
              json['CustomRequestHandling'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customRequestHandling = this.customRequestHandling;
    return {
      if (customRequestHandling != null)
        'CustomRequestHandling': customRequestHandling,
    };
  }
}

/// Specifies that WAF should do nothing. This is used for the
/// <code>OverrideAction</code> setting on a <a>Rule</a> when the rule uses a
/// rule group reference statement.
///
/// This is used in the context of other settings, for example to specify values
/// for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
///
/// JSON specification: <code>"None": {}</code>
///
/// @nodoc
class NoneAction {
  NoneAction();

  factory NoneAction.fromJson(Map<String, dynamic> _) {
    return NoneAction();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Custom request handling behavior that inserts custom headers into a web
/// request. You can add custom request handling for WAF to use when the rule
/// action doesn't block the request. For example, <code>CaptchaAction</code>
/// for requests with valid t okens, and <code>AllowAction</code>.
///
/// For information about customizing web requests and responses, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html">Customizing
/// web requests and responses in WAF</a> in the <i>WAF Developer Guide</i>.
///
/// @nodoc
class CustomRequestHandling {
  /// The HTTP headers to insert into the request. Duplicate header names are not
  /// allowed.
  ///
  /// For information about the limits on count and size for custom request and
  /// response settings, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/limits.html">WAF
  /// quotas</a> in the <i>WAF Developer Guide</i>.
  final List<CustomHTTPHeader> insertHeaders;

  CustomRequestHandling({
    required this.insertHeaders,
  });

  factory CustomRequestHandling.fromJson(Map<String, dynamic> json) {
    return CustomRequestHandling(
      insertHeaders: ((json['InsertHeaders'] as List?) ?? const [])
          .nonNulls
          .map((e) => CustomHTTPHeader.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final insertHeaders = this.insertHeaders;
    return {
      'InsertHeaders': insertHeaders,
    };
  }
}

/// A custom header for custom request and response handling. This is used in
/// <a>CustomResponse</a> and <a>CustomRequestHandling</a>.
///
/// @nodoc
class CustomHTTPHeader {
  /// The name of the custom header.
  ///
  /// For custom request header insertion, when WAF inserts the header into the
  /// request, it prefixes this name <code>x-amzn-waf-</code>, to avoid confusion
  /// with the headers that are already in the request. For example, for the
  /// header name <code>sample</code>, WAF inserts the header
  /// <code>x-amzn-waf-sample</code>.
  final String name;

  /// The value of the custom header.
  final String value;

  CustomHTTPHeader({
    required this.name,
    required this.value,
  });

  factory CustomHTTPHeader.fromJson(Map<String, dynamic> json) {
    return CustomHTTPHeader(
      name: (json['Name'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

/// Specifies that WAF should block the request and optionally defines
/// additional custom handling for the response to the web request.
///
/// This is used in the context of other settings, for example to specify values
/// for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
///
/// @nodoc
class BlockAction {
  /// Defines a custom response for the web request.
  ///
  /// For information about customizing web requests and responses, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html">Customizing
  /// web requests and responses in WAF</a> in the <i>WAF Developer Guide</i>.
  final CustomResponse? customResponse;

  BlockAction({
    this.customResponse,
  });

  factory BlockAction.fromJson(Map<String, dynamic> json) {
    return BlockAction(
      customResponse: json['CustomResponse'] != null
          ? CustomResponse.fromJson(
              json['CustomResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customResponse = this.customResponse;
    return {
      if (customResponse != null) 'CustomResponse': customResponse,
    };
  }
}

/// Specifies that WAF should allow the request and optionally defines
/// additional custom handling for the request.
///
/// This is used in the context of other settings, for example to specify values
/// for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
///
/// @nodoc
class AllowAction {
  /// Defines custom handling for the web request.
  ///
  /// For information about customizing web requests and responses, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html">Customizing
  /// web requests and responses in WAF</a> in the <i>WAF Developer Guide</i>.
  final CustomRequestHandling? customRequestHandling;

  AllowAction({
    this.customRequestHandling,
  });

  factory AllowAction.fromJson(Map<String, dynamic> json) {
    return AllowAction(
      customRequestHandling: json['CustomRequestHandling'] != null
          ? CustomRequestHandling.fromJson(
              json['CustomRequestHandling'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customRequestHandling = this.customRequestHandling;
    return {
      if (customRequestHandling != null)
        'CustomRequestHandling': customRequestHandling,
    };
  }
}

/// Specifies that WAF should run a <code>CAPTCHA</code> check against the
/// request:
///
/// <ul>
/// <li>
/// If the request includes a valid, unexpired <code>CAPTCHA</code> token, WAF
/// applies any custom request handling and labels that you've configured and
/// then allows the web request inspection to proceed to the next rule, similar
/// to a <code>CountAction</code>.
/// </li>
/// <li>
/// If the request doesn't include a valid, unexpired token, WAF discontinues
/// the web ACL evaluation of the request and blocks it from going to its
/// intended destination.
///
/// WAF generates a response that it sends back to the client, which includes
/// the following:
///
/// <ul>
/// <li>
/// The header <code>x-amzn-waf-action</code> with a value of
/// <code>captcha</code>.
/// </li>
/// <li>
/// The HTTP status code <code>405 Method Not Allowed</code>.
/// </li>
/// <li>
/// If the request contains an <code>Accept</code> header with a value of
/// <code>text/html</code>, the response includes a <code>CAPTCHA</code>
/// JavaScript page interstitial.
/// </li>
/// </ul> </li>
/// </ul>
/// You can configure the expiration time in the <code>CaptchaConfig</code>
/// <code>ImmunityTimeProperty</code> setting at the rule and web ACL level. The
/// rule setting overrides the web ACL setting.
///
/// This action option is available for rules. It isn't available for web ACL
/// default actions.
///
/// @nodoc
class CaptchaAction {
  /// Defines custom handling for the web request, used when the
  /// <code>CAPTCHA</code> inspection determines that the request's token is valid
  /// and unexpired.
  ///
  /// For information about customizing web requests and responses, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html">Customizing
  /// web requests and responses in WAF</a> in the <i>WAF Developer Guide</i>.
  final CustomRequestHandling? customRequestHandling;

  CaptchaAction({
    this.customRequestHandling,
  });

  factory CaptchaAction.fromJson(Map<String, dynamic> json) {
    return CaptchaAction(
      customRequestHandling: json['CustomRequestHandling'] != null
          ? CustomRequestHandling.fromJson(
              json['CustomRequestHandling'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customRequestHandling = this.customRequestHandling;
    return {
      if (customRequestHandling != null)
        'CustomRequestHandling': customRequestHandling,
    };
  }
}

/// Specifies that WAF should run a <code>Challenge</code> check against the
/// request to verify that the request is coming from a legitimate client
/// session:
///
/// <ul>
/// <li>
/// If the request includes a valid, unexpired challenge token, WAF applies any
/// custom request handling and labels that you've configured and then allows
/// the web request inspection to proceed to the next rule, similar to a
/// <code>CountAction</code>.
/// </li>
/// <li>
/// If the request doesn't include a valid, unexpired challenge token, WAF
/// discontinues the web ACL evaluation of the request and blocks it from going
/// to its intended destination.
///
/// WAF then generates a challenge response that it sends back to the client,
/// which includes the following:
///
/// <ul>
/// <li>
/// The header <code>x-amzn-waf-action</code> with a value of
/// <code>challenge</code>.
/// </li>
/// <li>
/// The HTTP status code <code>202 Request Accepted</code>.
/// </li>
/// <li>
/// If the request contains an <code>Accept</code> header with a value of
/// <code>text/html</code>, the response includes a JavaScript page interstitial
/// with a challenge script.
/// </li>
/// </ul>
/// Challenges run silent browser interrogations in the background, and don't
/// generally affect the end user experience.
///
/// A challenge enforces token acquisition using an interstitial JavaScript
/// challenge that inspects the client session for legitimate behavior. The
/// challenge blocks bots or at least increases the cost of operating
/// sophisticated bots.
///
/// After the client session successfully responds to the challenge, it receives
/// a new token from WAF, which the challenge script uses to resubmit the
/// original request.
/// </li>
/// </ul>
/// You can configure the expiration time in the <code>ChallengeConfig</code>
/// <code>ImmunityTimeProperty</code> setting at the rule and web ACL level. The
/// rule setting overrides the web ACL setting.
///
/// This action option is available for rules. It isn't available for web ACL
/// default actions.
///
/// @nodoc
class ChallengeAction {
  /// Defines custom handling for the web request, used when the challenge
  /// inspection determines that the request's token is valid and unexpired.
  ///
  /// For information about customizing web requests and responses, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html">Customizing
  /// web requests and responses in WAF</a> in the <i>WAF Developer Guide</i>.
  final CustomRequestHandling? customRequestHandling;

  ChallengeAction({
    this.customRequestHandling,
  });

  factory ChallengeAction.fromJson(Map<String, dynamic> json) {
    return ChallengeAction(
      customRequestHandling: json['CustomRequestHandling'] != null
          ? CustomRequestHandling.fromJson(
              json['CustomRequestHandling'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customRequestHandling = this.customRequestHandling;
    return {
      if (customRequestHandling != null)
        'CustomRequestHandling': customRequestHandling,
    };
  }
}

/// A custom response to send to the client. You can define a custom response
/// for rule actions and default web ACL actions that are set to
/// <a>BlockAction</a>.
///
/// For information about customizing web requests and responses, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html">Customizing
/// web requests and responses in WAF</a> in the <i>WAF Developer Guide</i>.
///
/// @nodoc
class CustomResponse {
  /// The HTTP status code to return to the client.
  ///
  /// For a list of status codes that you can use in your custom responses, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/customizing-the-response-status-codes.html">Supported
  /// status codes for custom response</a> in the <i>WAF Developer Guide</i>.
  final int responseCode;

  /// References the response body that you want WAF to return to the web request
  /// client. You can define a custom response for a rule action or a default web
  /// ACL action that is set to block. To do this, you first define the response
  /// body key and value in the <code>CustomResponseBodies</code> setting for the
  /// <a>WebACL</a> or <a>RuleGroup</a> where you want to use it. Then, in the
  /// rule action or web ACL default action <code>BlockAction</code> setting, you
  /// reference the response body using this key.
  final String? customResponseBodyKey;

  /// The HTTP headers to use in the response. You can specify any header name
  /// except for <code>content-type</code>. Duplicate header names are not
  /// allowed.
  ///
  /// For information about the limits on count and size for custom request and
  /// response settings, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/limits.html">WAF
  /// quotas</a> in the <i>WAF Developer Guide</i>.
  final List<CustomHTTPHeader>? responseHeaders;

  CustomResponse({
    required this.responseCode,
    this.customResponseBodyKey,
    this.responseHeaders,
  });

  factory CustomResponse.fromJson(Map<String, dynamic> json) {
    return CustomResponse(
      responseCode: (json['ResponseCode'] as int?) ?? 0,
      customResponseBodyKey: json['CustomResponseBodyKey'] as String?,
      responseHeaders: (json['ResponseHeaders'] as List?)
          ?.nonNulls
          .map((e) => CustomHTTPHeader.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final responseCode = this.responseCode;
    final customResponseBodyKey = this.customResponseBodyKey;
    final responseHeaders = this.responseHeaders;
    return {
      'ResponseCode': responseCode,
      if (customResponseBodyKey != null)
        'CustomResponseBodyKey': customResponseBodyKey,
      if (responseHeaders != null) 'ResponseHeaders': responseHeaders,
    };
  }
}

/// A rule statement that defines a string match search for WAF to apply to web
/// requests. The byte match statement provides the bytes to search for, the
/// location in requests that you want WAF to search, and other settings. The
/// bytes to search for are typically a string that corresponds with ASCII
/// characters. In the WAF console and the developer guide, this is called a
/// string match statement.
///
/// @nodoc
class ByteMatchStatement {
  /// The part of the web request that you want WAF to inspect.
  final FieldToMatch fieldToMatch;

  /// The area within the portion of the web request that you want WAF to search
  /// for <code>SearchString</code>. Valid values include the following:
  ///
  /// <b>CONTAINS</b>
  ///
  /// The specified part of the web request must include the value of
  /// <code>SearchString</code>, but the location doesn't matter.
  ///
  /// <b>CONTAINS_WORD</b>
  ///
  /// The specified part of the web request must include the value of
  /// <code>SearchString</code>, and <code>SearchString</code> must contain only
  /// alphanumeric characters or underscore (A-Z, a-z, 0-9, or _). In addition,
  /// <code>SearchString</code> must be a word, which means that both of the
  /// following are true:
  ///
  /// <ul>
  /// <li>
  /// <code>SearchString</code> is at the beginning of the specified part of the
  /// web request or is preceded by a character other than an alphanumeric
  /// character or underscore (_). Examples include the value of a header and
  /// <code>;BadBot</code>.
  /// </li>
  /// <li>
  /// <code>SearchString</code> is at the end of the specified part of the web
  /// request or is followed by a character other than an alphanumeric character
  /// or underscore (_), for example, <code>BadBot;</code> and
  /// <code>-BadBot;</code>.
  /// </li>
  /// </ul>
  /// <b>EXACTLY</b>
  ///
  /// The value of the specified part of the web request must exactly match the
  /// value of <code>SearchString</code>.
  ///
  /// <b>STARTS_WITH</b>
  ///
  /// The value of <code>SearchString</code> must appear at the beginning of the
  /// specified part of the web request.
  ///
  /// <b>ENDS_WITH</b>
  ///
  /// The value of <code>SearchString</code> must appear at the end of the
  /// specified part of the web request.
  final PositionalConstraint positionalConstraint;

  /// A string value that you want WAF to search for. WAF searches only in the
  /// part of web requests that you designate for inspection in
  /// <a>FieldToMatch</a>. The maximum length of the value is 200 bytes.
  ///
  /// Valid values depend on the component that you specify for inspection in
  /// <code>FieldToMatch</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>Method</code>: The HTTP method that you want WAF to search for. This
  /// indicates the type of operation specified in the request.
  /// </li>
  /// <li>
  /// <code>UriPath</code>: The value that you want WAF to search for in the URI
  /// path, for example, <code>/images/daily-ad.jpg</code>.
  /// </li>
  /// <li>
  /// <code>JA3Fingerprint</code>: Available for use with Amazon CloudFront
  /// distributions and Application Load Balancers. Match against the request's
  /// JA3 fingerprint. The JA3 fingerprint is a 32-character hash derived from the
  /// TLS Client Hello of an incoming request. This fingerprint serves as a unique
  /// identifier for the client's TLS configuration. You can use this choice only
  /// with a string match <code>ByteMatchStatement</code> with the
  /// <code>PositionalConstraint</code> set to <code>EXACTLY</code>.
  ///
  /// You can obtain the JA3 fingerprint for client requests from the web ACL
  /// logs. If WAF is able to calculate the fingerprint, it includes it in the
  /// logs. For information about the logging fields, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html">Log
  /// fields</a> in the <i>WAF Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>HeaderOrder</code>: The list of header names to match for. WAF creates
  /// a string that contains the ordered list of header names, from the headers in
  /// the web request, and then matches against that string.
  /// </li>
  /// </ul>
  /// If <code>SearchString</code> includes alphabetic characters A-Z and a-z,
  /// note that the value is case sensitive.
  ///
  /// <b>If you're using the WAF API</b>
  ///
  /// Specify a base64-encoded version of the value. The maximum length of the
  /// value before you base64-encode it is 200 bytes.
  ///
  /// For example, suppose the value of <code>Type</code> is <code>HEADER</code>
  /// and the value of <code>Data</code> is <code>User-Agent</code>. If you want
  /// to search the <code>User-Agent</code> header for the value
  /// <code>BadBot</code>, you base64-encode <code>BadBot</code> using MIME
  /// base64-encoding and include the resulting value, <code>QmFkQm90</code>, in
  /// the value of <code>SearchString</code>.
  ///
  /// <b>If you're using the CLI or one of the Amazon Web Services SDKs</b>
  ///
  /// The value that you want WAF to search for. The SDK automatically base64
  /// encodes the value.
  final Uint8List searchString;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. Text transformations
  /// are used in rule match statements, to transform the
  /// <code>FieldToMatch</code> request component before inspecting it, and
  /// they're used in rate-based rule statements, to transform request components
  /// before using them as custom aggregation keys. If you specify one or more
  /// transformations to apply, WAF performs all transformations on the specified
  /// content, starting from the lowest priority setting, and then uses the
  /// transformed component contents.
  final List<TextTransformation> textTransformations;

  ByteMatchStatement({
    required this.fieldToMatch,
    required this.positionalConstraint,
    required this.searchString,
    required this.textTransformations,
  });

  factory ByteMatchStatement.fromJson(Map<String, dynamic> json) {
    return ByteMatchStatement(
      fieldToMatch: FieldToMatch.fromJson(
          (json['FieldToMatch'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      positionalConstraint: PositionalConstraint.fromString(
          (json['PositionalConstraint'] as String?) ?? ''),
      searchString: _s.decodeUint8List((json['SearchString'] as String?) ?? ''),
      textTransformations: ((json['TextTransformations'] as List?) ?? const [])
          .nonNulls
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldToMatch = this.fieldToMatch;
    final positionalConstraint = this.positionalConstraint;
    final searchString = this.searchString;
    final textTransformations = this.textTransformations;
    return {
      'FieldToMatch': fieldToMatch,
      'PositionalConstraint': positionalConstraint.value,
      'SearchString': base64Encode(searchString),
      'TextTransformations': textTransformations,
    };
  }
}

/// A rule statement that inspects for malicious SQL code. Attackers insert
/// malicious SQL code into web requests to do things like modify your database
/// or extract data from it.
///
/// @nodoc
class SqliMatchStatement {
  /// The part of the web request that you want WAF to inspect.
  final FieldToMatch fieldToMatch;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. Text transformations
  /// are used in rule match statements, to transform the
  /// <code>FieldToMatch</code> request component before inspecting it, and
  /// they're used in rate-based rule statements, to transform request components
  /// before using them as custom aggregation keys. If you specify one or more
  /// transformations to apply, WAF performs all transformations on the specified
  /// content, starting from the lowest priority setting, and then uses the
  /// transformed component contents.
  final List<TextTransformation> textTransformations;

  /// The sensitivity that you want WAF to use to inspect for SQL injection
  /// attacks.
  ///
  /// <code>HIGH</code> detects more attacks, but might generate more false
  /// positives, especially if your web requests frequently contain unusual
  /// strings. For information about identifying and mitigating false positives,
  /// see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/web-acl-testing.html">Testing
  /// and tuning</a> in the <i>WAF Developer Guide</i>.
  ///
  /// <code>LOW</code> is generally a better choice for resources that already
  /// have other protections against SQL injection attacks or that have a low
  /// tolerance for false positives.
  ///
  /// Default: <code>LOW</code>
  final SensitivityLevel? sensitivityLevel;

  SqliMatchStatement({
    required this.fieldToMatch,
    required this.textTransformations,
    this.sensitivityLevel,
  });

  factory SqliMatchStatement.fromJson(Map<String, dynamic> json) {
    return SqliMatchStatement(
      fieldToMatch: FieldToMatch.fromJson(
          (json['FieldToMatch'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      textTransformations: ((json['TextTransformations'] as List?) ?? const [])
          .nonNulls
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      sensitivityLevel: (json['SensitivityLevel'] as String?)
          ?.let(SensitivityLevel.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldToMatch = this.fieldToMatch;
    final textTransformations = this.textTransformations;
    final sensitivityLevel = this.sensitivityLevel;
    return {
      'FieldToMatch': fieldToMatch,
      'TextTransformations': textTransformations,
      if (sensitivityLevel != null) 'SensitivityLevel': sensitivityLevel.value,
    };
  }
}

/// A rule statement that inspects for cross-site scripting (XSS) attacks. In
/// XSS attacks, the attacker uses vulnerabilities in a benign website as a
/// vehicle to inject malicious client-site scripts into other legitimate web
/// browsers.
///
/// @nodoc
class XssMatchStatement {
  /// The part of the web request that you want WAF to inspect.
  final FieldToMatch fieldToMatch;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. Text transformations
  /// are used in rule match statements, to transform the
  /// <code>FieldToMatch</code> request component before inspecting it, and
  /// they're used in rate-based rule statements, to transform request components
  /// before using them as custom aggregation keys. If you specify one or more
  /// transformations to apply, WAF performs all transformations on the specified
  /// content, starting from the lowest priority setting, and then uses the
  /// transformed component contents.
  final List<TextTransformation> textTransformations;

  XssMatchStatement({
    required this.fieldToMatch,
    required this.textTransformations,
  });

  factory XssMatchStatement.fromJson(Map<String, dynamic> json) {
    return XssMatchStatement(
      fieldToMatch: FieldToMatch.fromJson(
          (json['FieldToMatch'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      textTransformations: ((json['TextTransformations'] as List?) ?? const [])
          .nonNulls
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldToMatch = this.fieldToMatch;
    final textTransformations = this.textTransformations;
    return {
      'FieldToMatch': fieldToMatch,
      'TextTransformations': textTransformations,
    };
  }
}

/// A rule statement that compares a number of bytes against the size of a
/// request component, using a comparison operator, such as greater than (>) or
/// less than (<). For example, you can use a size constraint statement to look
/// for query strings that are longer than 100 bytes.
///
/// If you configure WAF to inspect the request body, WAF inspects only the
/// number of bytes in the body up to the limit for the web ACL and protected
/// resource type. If you know that the request body for your web requests
/// should never exceed the inspection limit, you can use a size constraint
/// statement to block requests that have a larger request body size. For more
/// information about the inspection limits, see <code>Body</code> and
/// <code>JsonBody</code> settings for the <code>FieldToMatch</code> data type.
///
/// If you choose URI for the value of Part of the request to filter on, the
/// slash (/) in the URI counts as one character. For example, the URI
/// <code>/logo.jpg</code> is nine characters long.
///
/// @nodoc
class SizeConstraintStatement {
  /// The operator to use to compare the request part to the size setting.
  final ComparisonOperator comparisonOperator;

  /// The part of the web request that you want WAF to inspect.
  final FieldToMatch fieldToMatch;

  /// The size, in byte, to compare to the request part, after any
  /// transformations.
  final int size;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. Text transformations
  /// are used in rule match statements, to transform the
  /// <code>FieldToMatch</code> request component before inspecting it, and
  /// they're used in rate-based rule statements, to transform request components
  /// before using them as custom aggregation keys. If you specify one or more
  /// transformations to apply, WAF performs all transformations on the specified
  /// content, starting from the lowest priority setting, and then uses the
  /// transformed component contents.
  final List<TextTransformation> textTransformations;

  SizeConstraintStatement({
    required this.comparisonOperator,
    required this.fieldToMatch,
    required this.size,
    required this.textTransformations,
  });

  factory SizeConstraintStatement.fromJson(Map<String, dynamic> json) {
    return SizeConstraintStatement(
      comparisonOperator: ComparisonOperator.fromString(
          (json['ComparisonOperator'] as String?) ?? ''),
      fieldToMatch: FieldToMatch.fromJson(
          (json['FieldToMatch'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      size: (json['Size'] as int?) ?? 0,
      textTransformations: ((json['TextTransformations'] as List?) ?? const [])
          .nonNulls
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final fieldToMatch = this.fieldToMatch;
    final size = this.size;
    final textTransformations = this.textTransformations;
    return {
      'ComparisonOperator': comparisonOperator.value,
      'FieldToMatch': fieldToMatch,
      'Size': size,
      'TextTransformations': textTransformations,
    };
  }
}

/// A rule statement that labels web requests by country and region and that
/// matches against web requests based on country code. A geo match rule labels
/// every request that it inspects regardless of whether it finds a match.
///
/// <ul>
/// <li>
/// To manage requests only by country, you can use this statement by itself and
/// specify the countries that you want to match against in the
/// <code>CountryCodes</code> array.
/// </li>
/// <li>
/// Otherwise, configure your geo match rule with Count action so that it only
/// labels requests. Then, add one or more label match rules to run after the
/// geo match rule and configure them to match against the geographic labels and
/// handle the requests as needed.
/// </li>
/// </ul>
/// WAF labels requests using the alpha-2 country and region codes from the
/// International Organization for Standardization (ISO) 3166 standard. WAF
/// determines the codes using either the IP address in the web request origin
/// or, if you specify it, the address in the geo match
/// <code>ForwardedIPConfig</code>.
///
/// If you use the web request origin, the label formats are
/// <code>awswaf:clientip:geo:region:<ISO country code>-<ISO region code></code>
/// and <code>awswaf:clientip:geo:country:<ISO country code></code>.
///
/// If you use a forwarded IP address, the label formats are
/// <code>awswaf:forwardedip:geo:region:<ISO country code>-<ISO region
/// code></code> and <code>awswaf:forwardedip:geo:country:<ISO country
/// code></code>.
///
/// For additional details, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-geo-match.html">Geographic
/// match rule statement</a> in the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">WAF
/// Developer Guide</a>.
///
/// @nodoc
class GeoMatchStatement {
  /// An array of two-character country codes that you want to match against, for
  /// example, <code>\[ "US", "CN" \]</code>, from the alpha-2 country ISO codes
  /// of the ISO 3166 international standard.
  ///
  /// When you use a geo match statement just for the region and country labels
  /// that it adds to requests, you still have to supply a country code for the
  /// rule to evaluate. In this case, you configure the rule to only count
  /// matching requests, but it will still generate logging and count metrics for
  /// any matches. You can reduce the logging and metrics that the rule produces
  /// by specifying a country that's unlikely to be a source of traffic to your
  /// site.
  final List<CountryCode>? countryCodes;

  /// The configuration for inspecting IP addresses in an HTTP header that you
  /// specify, instead of using the IP address that's reported by the web request
  /// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
  /// specify any header name.
  /// <note>
  /// If the specified header isn't present in the request, WAF doesn't apply the
  /// rule to the web request at all.
  /// </note>
  final ForwardedIPConfig? forwardedIPConfig;

  GeoMatchStatement({
    this.countryCodes,
    this.forwardedIPConfig,
  });

  factory GeoMatchStatement.fromJson(Map<String, dynamic> json) {
    return GeoMatchStatement(
      countryCodes: (json['CountryCodes'] as List?)
          ?.nonNulls
          .map((e) => CountryCode.fromString((e as String)))
          .toList(),
      forwardedIPConfig: json['ForwardedIPConfig'] != null
          ? ForwardedIPConfig.fromJson(
              json['ForwardedIPConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final countryCodes = this.countryCodes;
    final forwardedIPConfig = this.forwardedIPConfig;
    return {
      if (countryCodes != null)
        'CountryCodes': countryCodes.map((e) => e.value).toList(),
      if (forwardedIPConfig != null) 'ForwardedIPConfig': forwardedIPConfig,
    };
  }
}

/// A rule statement used to run the rules that are defined in a
/// <a>RuleGroup</a>. To use this, create a rule group with your rules, then
/// provide the ARN of the rule group in this statement.
///
/// You cannot nest a <code>RuleGroupReferenceStatement</code>, for example for
/// use inside a <code>NotStatement</code> or <code>OrStatement</code>. You
/// cannot use a rule group reference statement inside another rule group. You
/// can only reference a rule group as a top-level statement within a rule that
/// you define in a web ACL.
///
/// @nodoc
class RuleGroupReferenceStatement {
  /// The Amazon Resource Name (ARN) of the entity.
  final String arn;

  /// Rules in the referenced rule group whose actions are set to
  /// <code>Count</code>.
  /// <note>
  /// Instead of this option, use <code>RuleActionOverrides</code>. It accepts any
  /// valid action setting, including <code>Count</code>.
  /// </note>
  final List<ExcludedRule>? excludedRules;

  /// Action settings to use in the place of the rule actions that are configured
  /// inside the rule group. You specify one override for each rule whose action
  /// you want to change.
  /// <note>
  /// Verify the rule names in your overrides carefully. With managed rule groups,
  /// WAF silently ignores any override that uses an invalid rule name. With
  /// customer-owned rule groups, invalid rule names in your overrides will cause
  /// web ACL updates to fail. An invalid rule name is any name that doesn't
  /// exactly match the case-sensitive name of an existing rule in the rule group.
  /// </note>
  /// You can use overrides for testing, for example you can override all of rule
  /// actions to <code>Count</code> and then monitor the resulting count metrics
  /// to understand how the rule group would handle your web traffic. You can also
  /// permanently override some or all actions, to modify how the rule group
  /// manages your web traffic.
  final List<RuleActionOverride>? ruleActionOverrides;

  RuleGroupReferenceStatement({
    required this.arn,
    this.excludedRules,
    this.ruleActionOverrides,
  });

  factory RuleGroupReferenceStatement.fromJson(Map<String, dynamic> json) {
    return RuleGroupReferenceStatement(
      arn: (json['ARN'] as String?) ?? '',
      excludedRules: (json['ExcludedRules'] as List?)
          ?.nonNulls
          .map((e) => ExcludedRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      ruleActionOverrides: (json['RuleActionOverrides'] as List?)
          ?.nonNulls
          .map((e) => RuleActionOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final excludedRules = this.excludedRules;
    final ruleActionOverrides = this.ruleActionOverrides;
    return {
      'ARN': arn,
      if (excludedRules != null) 'ExcludedRules': excludedRules,
      if (ruleActionOverrides != null)
        'RuleActionOverrides': ruleActionOverrides,
    };
  }
}

/// A rule statement used to detect web requests coming from particular IP
/// addresses or address ranges. To use this, create an <a>IPSet</a> that
/// specifies the addresses you want to detect, then use the ARN of that set in
/// this statement. To create an IP set, see <a>CreateIPSet</a>.
///
/// Each IP set rule statement references an IP set. You create and maintain the
/// set independent of your rules. This allows you to use the single set in
/// multiple rules. When you update the referenced set, WAF automatically
/// updates all rules that reference it.
///
/// @nodoc
class IPSetReferenceStatement {
  /// The Amazon Resource Name (ARN) of the <a>IPSet</a> that this statement
  /// references.
  final String arn;

  /// The configuration for inspecting IP addresses in an HTTP header that you
  /// specify, instead of using the IP address that's reported by the web request
  /// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
  /// specify any header name.
  /// <note>
  /// If the specified header isn't present in the request, WAF doesn't apply the
  /// rule to the web request at all.
  /// </note>
  final IPSetForwardedIPConfig? iPSetForwardedIPConfig;

  IPSetReferenceStatement({
    required this.arn,
    this.iPSetForwardedIPConfig,
  });

  factory IPSetReferenceStatement.fromJson(Map<String, dynamic> json) {
    return IPSetReferenceStatement(
      arn: (json['ARN'] as String?) ?? '',
      iPSetForwardedIPConfig: json['IPSetForwardedIPConfig'] != null
          ? IPSetForwardedIPConfig.fromJson(
              json['IPSetForwardedIPConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final iPSetForwardedIPConfig = this.iPSetForwardedIPConfig;
    return {
      'ARN': arn,
      if (iPSetForwardedIPConfig != null)
        'IPSetForwardedIPConfig': iPSetForwardedIPConfig,
    };
  }
}

/// A rule statement used to search web request components for matches with
/// regular expressions. To use this, create a <a>RegexPatternSet</a> that
/// specifies the expressions that you want to detect, then use the ARN of that
/// set in this statement. A web request matches the pattern set rule statement
/// if the request component matches any of the patterns in the set. To create a
/// regex pattern set, see <a>CreateRegexPatternSet</a>.
///
/// Each regex pattern set rule statement references a regex pattern set. You
/// create and maintain the set independent of your rules. This allows you to
/// use the single set in multiple rules. When you update the referenced set,
/// WAF automatically updates all rules that reference it.
///
/// @nodoc
class RegexPatternSetReferenceStatement {
  /// The Amazon Resource Name (ARN) of the <a>RegexPatternSet</a> that this
  /// statement references.
  final String arn;

  /// The part of the web request that you want WAF to inspect.
  final FieldToMatch fieldToMatch;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. Text transformations
  /// are used in rule match statements, to transform the
  /// <code>FieldToMatch</code> request component before inspecting it, and
  /// they're used in rate-based rule statements, to transform request components
  /// before using them as custom aggregation keys. If you specify one or more
  /// transformations to apply, WAF performs all transformations on the specified
  /// content, starting from the lowest priority setting, and then uses the
  /// transformed component contents.
  final List<TextTransformation> textTransformations;

  RegexPatternSetReferenceStatement({
    required this.arn,
    required this.fieldToMatch,
    required this.textTransformations,
  });

  factory RegexPatternSetReferenceStatement.fromJson(
      Map<String, dynamic> json) {
    return RegexPatternSetReferenceStatement(
      arn: (json['ARN'] as String?) ?? '',
      fieldToMatch: FieldToMatch.fromJson(
          (json['FieldToMatch'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      textTransformations: ((json['TextTransformations'] as List?) ?? const [])
          .nonNulls
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final fieldToMatch = this.fieldToMatch;
    final textTransformations = this.textTransformations;
    return {
      'ARN': arn,
      'FieldToMatch': fieldToMatch,
      'TextTransformations': textTransformations,
    };
  }
}

/// A rate-based rule counts incoming requests and rate limits requests when
/// they are coming at too fast a rate. The rule categorizes requests according
/// to your aggregation criteria, collects them into aggregation instances, and
/// counts and rate limits the requests for each instance.
/// <note>
/// If you change any of these settings in a rule that's currently in use, the
/// change resets the rule's rate limiting counts. This can pause the rule's
/// rate limiting activities for up to a minute.
/// </note>
/// You can specify individual aggregation keys, like IP address or HTTP method.
/// You can also specify aggregation key combinations, like IP address and HTTP
/// method, or HTTP method, query argument, and cookie.
///
/// Each unique set of values for the aggregation keys that you specify is a
/// separate aggregation instance, with the value from each key contributing to
/// the aggregation instance definition.
///
/// For example, assume the rule evaluates web requests with the following IP
/// address and HTTP method values:
///
/// <ul>
/// <li>
/// IP address 10.1.1.1, HTTP method POST
/// </li>
/// <li>
/// IP address 10.1.1.1, HTTP method GET
/// </li>
/// <li>
/// IP address 127.0.0.0, HTTP method POST
/// </li>
/// <li>
/// IP address 10.1.1.1, HTTP method GET
/// </li>
/// </ul>
/// The rule would create different aggregation instances according to your
/// aggregation criteria, for example:
///
/// <ul>
/// <li>
/// If the aggregation criteria is just the IP address, then each individual
/// address is an aggregation instance, and WAF counts requests separately for
/// each. The aggregation instances and request counts for our example would be
/// the following:
///
/// <ul>
/// <li>
/// IP address 10.1.1.1: count 3
/// </li>
/// <li>
/// IP address 127.0.0.0: count 1
/// </li>
/// </ul> </li>
/// <li>
/// If the aggregation criteria is HTTP method, then each individual HTTP method
/// is an aggregation instance. The aggregation instances and request counts for
/// our example would be the following:
///
/// <ul>
/// <li>
/// HTTP method POST: count 2
/// </li>
/// <li>
/// HTTP method GET: count 2
/// </li>
/// </ul> </li>
/// <li>
/// If the aggregation criteria is IP address and HTTP method, then each IP
/// address and each HTTP method would contribute to the combined aggregation
/// instance. The aggregation instances and request counts for our example would
/// be the following:
///
/// <ul>
/// <li>
/// IP address 10.1.1.1, HTTP method POST: count 1
/// </li>
/// <li>
/// IP address 10.1.1.1, HTTP method GET: count 2
/// </li>
/// <li>
/// IP address 127.0.0.0, HTTP method POST: count 1
/// </li>
/// </ul> </li>
/// </ul>
/// For any n-tuple of aggregation keys, each unique combination of values for
/// the keys defines a separate aggregation instance, which WAF counts and
/// rate-limits individually.
///
/// You can optionally nest another statement inside the rate-based statement,
/// to narrow the scope of the rule so that it only counts and rate limits
/// requests that match the nested statement. You can use this nested scope-down
/// statement in conjunction with your aggregation key specifications or you can
/// just count and rate limit all requests that match the scope-down statement,
/// without additional aggregation. When you choose to just manage all requests
/// that match a scope-down statement, the aggregation instance is singular for
/// the rule.
///
/// You cannot nest a <code>RateBasedStatement</code> inside another statement,
/// for example inside a <code>NotStatement</code> or <code>OrStatement</code>.
/// You can define a <code>RateBasedStatement</code> inside a web ACL and inside
/// a rule group.
///
/// For additional information about the options, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-rate-based-rules.html">Rate
/// limiting web requests using rate-based rules</a> in the <i>WAF Developer
/// Guide</i>.
///
/// If you only aggregate on the individual IP address or forwarded IP address,
/// you can retrieve the list of IP addresses that WAF is currently rate
/// limiting for a rule through the API call
/// <code>GetRateBasedStatementManagedKeys</code>. This option is not available
/// for other aggregation configurations.
///
/// WAF tracks and manages web requests separately for each instance of a
/// rate-based rule that you use. For example, if you provide the same
/// rate-based rule settings in two web ACLs, each of the two rule statements
/// represents a separate instance of the rate-based rule and gets its own
/// tracking and management by WAF. If you define a rate-based rule inside a
/// rule group, and then use that rule group in multiple places, each use
/// creates a separate instance of the rate-based rule that gets its own
/// tracking and management by WAF.
///
/// @nodoc
class RateBasedStatement {
  /// Setting that indicates how to aggregate the request counts.
  /// <note>
  /// Web requests that are missing any of the components specified in the
  /// aggregation keys are omitted from the rate-based rule evaluation and
  /// handling.
  /// </note>
  /// <ul>
  /// <li>
  /// <code>CONSTANT</code> - Count and limit the requests that match the
  /// rate-based rule's scope-down statement. With this option, the counted
  /// requests aren't further aggregated. The scope-down statement is the only
  /// specification used. When the count of all requests that satisfy the
  /// scope-down statement goes over the limit, WAF applies the rule action to all
  /// requests that satisfy the scope-down statement.
  ///
  /// With this option, you must configure the <code>ScopeDownStatement</code>
  /// property.
  /// </li>
  /// <li>
  /// <code>CUSTOM_KEYS</code> - Aggregate the request counts using one or more
  /// web request components as the aggregate keys.
  ///
  /// With this option, you must specify the aggregate keys in the
  /// <code>CustomKeys</code> property.
  ///
  /// To aggregate on only the IP address or only the forwarded IP address, don't
  /// use custom keys. Instead, set the aggregate key type to <code>IP</code> or
  /// <code>FORWARDED_IP</code>.
  /// </li>
  /// <li>
  /// <code>FORWARDED_IP</code> - Aggregate the request counts on the first IP
  /// address in an HTTP header.
  ///
  /// With this option, you must specify the header to use in the
  /// <code>ForwardedIPConfig</code> property.
  ///
  /// To aggregate on a combination of the forwarded IP address with other
  /// aggregate keys, use <code>CUSTOM_KEYS</code>.
  /// </li>
  /// <li>
  /// <code>IP</code> - Aggregate the request counts on the IP address from the
  /// web request origin.
  ///
  /// To aggregate on a combination of the IP address with other aggregate keys,
  /// use <code>CUSTOM_KEYS</code>.
  /// </li>
  /// </ul>
  final RateBasedStatementAggregateKeyType aggregateKeyType;

  /// The limit on requests during the specified evaluation window for a single
  /// aggregation instance for the rate-based rule. If the rate-based statement
  /// includes a <code>ScopeDownStatement</code>, this limit is applied only to
  /// the requests that match the statement.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// If you aggregate on just the IP address, this is the limit on requests from
  /// any single IP address.
  /// </li>
  /// <li>
  /// If you aggregate on the HTTP method and the query argument name "city", then
  /// this is the limit on requests for any single method, city pair.
  /// </li>
  /// </ul>
  final int limit;

  /// Specifies the aggregate keys to use in a rate-base rule.
  final List<RateBasedStatementCustomKey>? customKeys;

  /// The amount of time, in seconds, that WAF should include in its request
  /// counts, looking back from the current time. For example, for a setting of
  /// 120, when WAF checks the rate, it counts the requests for the 2 minutes
  /// immediately preceding the current time. Valid settings are 60, 120, 300, and
  /// 600.
  ///
  /// This setting doesn't determine how often WAF checks the rate, but how far
  /// back it looks each time it checks. WAF checks the rate about every 10
  /// seconds.
  ///
  /// Default: <code>300</code> (5 minutes)
  final int? evaluationWindowSec;

  /// The configuration for inspecting IP addresses in an HTTP header that you
  /// specify, instead of using the IP address that's reported by the web request
  /// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
  /// specify any header name.
  /// <note>
  /// If the specified header isn't present in the request, WAF doesn't apply the
  /// rule to the web request at all.
  /// </note>
  /// This is required if you specify a forwarded IP in the rule's aggregate key
  /// settings.
  final ForwardedIPConfig? forwardedIPConfig;

  /// An optional nested statement that narrows the scope of the web requests that
  /// are evaluated and managed by the rate-based statement. When you use a
  /// scope-down statement, the rate-based rule only tracks and rate limits
  /// requests that match the scope-down statement. You can use any nestable
  /// <a>Statement</a> in the scope-down statement, and you can nest statements at
  /// any level, the same as you can for a rule statement.
  final Statement? scopeDownStatement;

  RateBasedStatement({
    required this.aggregateKeyType,
    required this.limit,
    this.customKeys,
    this.evaluationWindowSec,
    this.forwardedIPConfig,
    this.scopeDownStatement,
  });

  factory RateBasedStatement.fromJson(Map<String, dynamic> json) {
    return RateBasedStatement(
      aggregateKeyType: RateBasedStatementAggregateKeyType.fromString(
          (json['AggregateKeyType'] as String?) ?? ''),
      limit: (json['Limit'] as int?) ?? 0,
      customKeys: (json['CustomKeys'] as List?)
          ?.nonNulls
          .map((e) =>
              RateBasedStatementCustomKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      evaluationWindowSec: json['EvaluationWindowSec'] as int?,
      forwardedIPConfig: json['ForwardedIPConfig'] != null
          ? ForwardedIPConfig.fromJson(
              json['ForwardedIPConfig'] as Map<String, dynamic>)
          : null,
      scopeDownStatement: json['ScopeDownStatement'] != null
          ? Statement.fromJson(
              json['ScopeDownStatement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateKeyType = this.aggregateKeyType;
    final limit = this.limit;
    final customKeys = this.customKeys;
    final evaluationWindowSec = this.evaluationWindowSec;
    final forwardedIPConfig = this.forwardedIPConfig;
    final scopeDownStatement = this.scopeDownStatement;
    return {
      'AggregateKeyType': aggregateKeyType.value,
      'Limit': limit,
      if (customKeys != null) 'CustomKeys': customKeys,
      if (evaluationWindowSec != null)
        'EvaluationWindowSec': evaluationWindowSec,
      if (forwardedIPConfig != null) 'ForwardedIPConfig': forwardedIPConfig,
      if (scopeDownStatement != null) 'ScopeDownStatement': scopeDownStatement,
    };
  }
}

/// A logical rule statement used to combine other rule statements with AND
/// logic. You provide more than one <a>Statement</a> within the
/// <code>AndStatement</code>.
///
/// @nodoc
class AndStatement {
  /// The statements to combine with AND logic. You can use any statements that
  /// can be nested.
  final List<Statement> statements;

  AndStatement({
    required this.statements,
  });

  factory AndStatement.fromJson(Map<String, dynamic> json) {
    return AndStatement(
      statements: ((json['Statements'] as List?) ?? const [])
          .nonNulls
          .map((e) => Statement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statements = this.statements;
    return {
      'Statements': statements,
    };
  }
}

/// A logical rule statement used to combine other rule statements with OR
/// logic. You provide more than one <a>Statement</a> within the
/// <code>OrStatement</code>.
///
/// @nodoc
class OrStatement {
  /// The statements to combine with OR logic. You can use any statements that can
  /// be nested.
  final List<Statement> statements;

  OrStatement({
    required this.statements,
  });

  factory OrStatement.fromJson(Map<String, dynamic> json) {
    return OrStatement(
      statements: ((json['Statements'] as List?) ?? const [])
          .nonNulls
          .map((e) => Statement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statements = this.statements;
    return {
      'Statements': statements,
    };
  }
}

/// A logical rule statement used to negate the results of another rule
/// statement. You provide one <a>Statement</a> within the
/// <code>NotStatement</code>.
///
/// @nodoc
class NotStatement {
  /// The statement to negate. You can use any statement that can be nested.
  final Statement statement;

  NotStatement({
    required this.statement,
  });

  factory NotStatement.fromJson(Map<String, dynamic> json) {
    return NotStatement(
      statement: Statement.fromJson(
          (json['Statement'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final statement = this.statement;
    return {
      'Statement': statement,
    };
  }
}

/// A rule statement used to run the rules that are defined in a managed rule
/// group. To use this, provide the vendor name and the name of the rule group
/// in this statement. You can retrieve the required names by calling
/// <a>ListAvailableManagedRuleGroups</a>.
///
/// You cannot nest a <code>ManagedRuleGroupStatement</code>, for example for
/// use inside a <code>NotStatement</code> or <code>OrStatement</code>. You
/// cannot use a managed rule group inside another rule group. You can only
/// reference a managed rule group as a top-level statement within a rule that
/// you define in a web ACL.
/// <note>
/// You are charged additional fees when you use the WAF Bot Control managed
/// rule group <code>AWSManagedRulesBotControlRuleSet</code>, the WAF Fraud
/// Control account takeover prevention (ATP) managed rule group
/// <code>AWSManagedRulesATPRuleSet</code>, or the WAF Fraud Control account
/// creation fraud prevention (ACFP) managed rule group
/// <code>AWSManagedRulesACFPRuleSet</code>. For more information, see <a
/// href="http://aws.amazon.com/waf/pricing/">WAF Pricing</a>.
/// </note>
///
/// @nodoc
class ManagedRuleGroupStatement {
  /// The name of the managed rule group. You use this, along with the vendor
  /// name, to identify the rule group.
  final String name;

  /// The name of the managed rule group vendor. You use this, along with the rule
  /// group name, to identify a rule group.
  final String vendorName;

  /// Rules in the referenced rule group whose actions are set to
  /// <code>Count</code>.
  /// <note>
  /// Instead of this option, use <code>RuleActionOverrides</code>. It accepts any
  /// valid action setting, including <code>Count</code>.
  /// </note>
  final List<ExcludedRule>? excludedRules;

  /// Additional information that's used by a managed rule group. Many managed
  /// rule groups don't require this.
  ///
  /// The rule groups used for intelligent threat mitigation require additional
  /// configuration:
  ///
  /// <ul>
  /// <li>
  /// Use the <code>AWSManagedRulesACFPRuleSet</code> configuration object to
  /// configure the account creation fraud prevention managed rule group. The
  /// configuration includes the registration and sign-up pages of your
  /// application and the locations in the account creation request payload of
  /// data, such as the user email and phone number fields.
  /// </li>
  /// <li>
  /// Use the <code>AWSManagedRulesAntiDDoSRuleSet</code> configuration object to
  /// configure the anti-DDoS managed rule group. The configuration includes the
  /// sensitivity levels to use in the rules that typically block and challenge
  /// requests that might be participating in DDoS attacks and the specification
  /// to use to indicate whether a request can handle a silent browser challenge.
  /// </li>
  /// <li>
  /// Use the <code>AWSManagedRulesATPRuleSet</code> configuration object to
  /// configure the account takeover prevention managed rule group. The
  /// configuration includes the sign-in page of your application and the
  /// locations in the login request payload of data such as the username and
  /// password.
  /// </li>
  /// <li>
  /// Use the <code>AWSManagedRulesBotControlRuleSet</code> configuration object
  /// to configure the protection level that you want the Bot Control rule group
  /// to use.
  /// </li>
  /// </ul>
  final List<ManagedRuleGroupConfig>? managedRuleGroupConfigs;

  /// Action settings to use in the place of the rule actions that are configured
  /// inside the rule group. You specify one override for each rule whose action
  /// you want to change.
  /// <note>
  /// Verify the rule names in your overrides carefully. With managed rule groups,
  /// WAF silently ignores any override that uses an invalid rule name. With
  /// customer-owned rule groups, invalid rule names in your overrides will cause
  /// web ACL updates to fail. An invalid rule name is any name that doesn't
  /// exactly match the case-sensitive name of an existing rule in the rule group.
  /// </note>
  /// You can use overrides for testing, for example you can override all of rule
  /// actions to <code>Count</code> and then monitor the resulting count metrics
  /// to understand how the rule group would handle your web traffic. You can also
  /// permanently override some or all actions, to modify how the rule group
  /// manages your web traffic.
  final List<RuleActionOverride>? ruleActionOverrides;

  /// An optional nested statement that narrows the scope of the web requests that
  /// are evaluated by the managed rule group. Requests are only evaluated by the
  /// rule group if they match the scope-down statement. You can use any nestable
  /// <a>Statement</a> in the scope-down statement, and you can nest statements at
  /// any level, the same as you can for a rule statement.
  final Statement? scopeDownStatement;

  /// The version of the managed rule group to use. If you specify this, the
  /// version setting is fixed until you change it. If you don't specify this, WAF
  /// uses the vendor's default version, and then keeps the version at the
  /// vendor's default when the vendor updates the managed rule group settings.
  final String? version;

  ManagedRuleGroupStatement({
    required this.name,
    required this.vendorName,
    this.excludedRules,
    this.managedRuleGroupConfigs,
    this.ruleActionOverrides,
    this.scopeDownStatement,
    this.version,
  });

  factory ManagedRuleGroupStatement.fromJson(Map<String, dynamic> json) {
    return ManagedRuleGroupStatement(
      name: (json['Name'] as String?) ?? '',
      vendorName: (json['VendorName'] as String?) ?? '',
      excludedRules: (json['ExcludedRules'] as List?)
          ?.nonNulls
          .map((e) => ExcludedRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      managedRuleGroupConfigs: (json['ManagedRuleGroupConfigs'] as List?)
          ?.nonNulls
          .map(
              (e) => ManagedRuleGroupConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      ruleActionOverrides: (json['RuleActionOverrides'] as List?)
          ?.nonNulls
          .map((e) => RuleActionOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
      scopeDownStatement: json['ScopeDownStatement'] != null
          ? Statement.fromJson(
              json['ScopeDownStatement'] as Map<String, dynamic>)
          : null,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final vendorName = this.vendorName;
    final excludedRules = this.excludedRules;
    final managedRuleGroupConfigs = this.managedRuleGroupConfigs;
    final ruleActionOverrides = this.ruleActionOverrides;
    final scopeDownStatement = this.scopeDownStatement;
    final version = this.version;
    return {
      'Name': name,
      'VendorName': vendorName,
      if (excludedRules != null) 'ExcludedRules': excludedRules,
      if (managedRuleGroupConfigs != null)
        'ManagedRuleGroupConfigs': managedRuleGroupConfigs,
      if (ruleActionOverrides != null)
        'RuleActionOverrides': ruleActionOverrides,
      if (scopeDownStatement != null) 'ScopeDownStatement': scopeDownStatement,
      if (version != null) 'Version': version,
    };
  }
}

/// A rule statement to match against labels that have been added to the web
/// request by rules that have already run in the web ACL.
///
/// The label match statement provides the label or namespace string to search
/// for. The label string can represent a part or all of the fully qualified
/// label name that had been added to the web request. Fully qualified labels
/// have a prefix, optional namespaces, and label name. The prefix identifies
/// the rule group or web ACL context of the rule that added the label. If you
/// do not provide the fully qualified name in your label match string, WAF
/// performs the search for labels that were added in the same context as the
/// label match statement.
///
/// @nodoc
class LabelMatchStatement {
  /// The string to match against. The setting you provide for this depends on the
  /// match statement's <code>Scope</code> setting:
  ///
  /// <ul>
  /// <li>
  /// If the <code>Scope</code> indicates <code>LABEL</code>, then this
  /// specification must include the name and can include any number of preceding
  /// namespace specifications and prefix up to providing the fully qualified
  /// label name.
  /// </li>
  /// <li>
  /// If the <code>Scope</code> indicates <code>NAMESPACE</code>, then this
  /// specification can include any number of contiguous namespace strings, and
  /// can include the entire label namespace prefix from the rule group or web ACL
  /// where the label originates.
  /// </li>
  /// </ul>
  /// Labels are case sensitive and components of a label must be separated by
  /// colon, for example <code>NS1:NS2:name</code>.
  final String key;

  /// Specify whether you want to match using the label name or just the
  /// namespace.
  final LabelMatchScope scope;

  LabelMatchStatement({
    required this.key,
    required this.scope,
  });

  factory LabelMatchStatement.fromJson(Map<String, dynamic> json) {
    return LabelMatchStatement(
      key: (json['Key'] as String?) ?? '',
      scope: LabelMatchScope.fromString((json['Scope'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final scope = this.scope;
    return {
      'Key': key,
      'Scope': scope.value,
    };
  }
}

/// A rule statement used to search web request components for a match against a
/// single regular expression.
///
/// @nodoc
class RegexMatchStatement {
  /// The part of the web request that you want WAF to inspect.
  final FieldToMatch fieldToMatch;

  /// The string representing the regular expression.
  final String regexString;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. Text transformations
  /// are used in rule match statements, to transform the
  /// <code>FieldToMatch</code> request component before inspecting it, and
  /// they're used in rate-based rule statements, to transform request components
  /// before using them as custom aggregation keys. If you specify one or more
  /// transformations to apply, WAF performs all transformations on the specified
  /// content, starting from the lowest priority setting, and then uses the
  /// transformed component contents.
  final List<TextTransformation> textTransformations;

  RegexMatchStatement({
    required this.fieldToMatch,
    required this.regexString,
    required this.textTransformations,
  });

  factory RegexMatchStatement.fromJson(Map<String, dynamic> json) {
    return RegexMatchStatement(
      fieldToMatch: FieldToMatch.fromJson(
          (json['FieldToMatch'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      regexString: (json['RegexString'] as String?) ?? '',
      textTransformations: ((json['TextTransformations'] as List?) ?? const [])
          .nonNulls
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldToMatch = this.fieldToMatch;
    final regexString = this.regexString;
    final textTransformations = this.textTransformations;
    return {
      'FieldToMatch': fieldToMatch,
      'RegexString': regexString,
      'TextTransformations': textTransformations,
    };
  }
}

/// A rule statement that inspects web traffic based on the Autonomous System
/// Number (ASN) associated with the request's IP address.
///
/// For additional details, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-asn-match.html">ASN
/// match rule statement</a> in the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">WAF
/// Developer Guide</a>.
///
/// @nodoc
class AsnMatchStatement {
  /// Contains one or more Autonomous System Numbers (ASNs). ASNs are unique
  /// identifiers assigned to large internet networks managed by organizations
  /// such as internet service providers, enterprises, universities, or government
  /// agencies.
  final List<int> asnList;

  /// The configuration for inspecting IP addresses to match against an ASN in an
  /// HTTP header that you specify, instead of using the IP address that's
  /// reported by the web request origin. Commonly, this is the X-Forwarded-For
  /// (XFF) header, but you can specify any header name.
  final ForwardedIPConfig? forwardedIPConfig;

  AsnMatchStatement({
    required this.asnList,
    this.forwardedIPConfig,
  });

  factory AsnMatchStatement.fromJson(Map<String, dynamic> json) {
    return AsnMatchStatement(
      asnList: ((json['AsnList'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as int)
          .toList(),
      forwardedIPConfig: json['ForwardedIPConfig'] != null
          ? ForwardedIPConfig.fromJson(
              json['ForwardedIPConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final asnList = this.asnList;
    final forwardedIPConfig = this.forwardedIPConfig;
    return {
      'AsnList': asnList,
      if (forwardedIPConfig != null) 'ForwardedIPConfig': forwardedIPConfig,
    };
  }
}

/// The configuration for inspecting IP addresses in an HTTP header that you
/// specify, instead of using the IP address that's reported by the web request
/// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
/// specify any header name.
/// <note>
/// If the specified header isn't present in the request, WAF doesn't apply the
/// rule to the web request at all.
/// </note>
/// This configuration is used for <a>GeoMatchStatement</a>,
/// <a>AsnMatchStatement</a>, and <a>RateBasedStatement</a>. For
/// <a>IPSetReferenceStatement</a>, use <a>IPSetForwardedIPConfig</a> instead.
///
/// WAF only evaluates the first IP address found in the specified HTTP header.
///
/// @nodoc
class ForwardedIPConfig {
  /// The match status to assign to the web request if the request doesn't have a
  /// valid IP address in the specified position.
  /// <note>
  /// If the specified header isn't present in the request, WAF doesn't apply the
  /// rule to the web request at all.
  /// </note>
  /// You can specify the following fallback behaviors:
  ///
  /// <ul>
  /// <li>
  /// <code>MATCH</code> - Treat the web request as matching the rule statement.
  /// WAF applies the rule action to the request.
  /// </li>
  /// <li>
  /// <code>NO_MATCH</code> - Treat the web request as not matching the rule
  /// statement.
  /// </li>
  /// </ul>
  final FallbackBehavior fallbackBehavior;

  /// The name of the HTTP header to use for the IP address. For example, to use
  /// the X-Forwarded-For (XFF) header, set this to <code>X-Forwarded-For</code>.
  /// <note>
  /// If the specified header isn't present in the request, WAF doesn't apply the
  /// rule to the web request at all.
  /// </note>
  final String headerName;

  ForwardedIPConfig({
    required this.fallbackBehavior,
    required this.headerName,
  });

  factory ForwardedIPConfig.fromJson(Map<String, dynamic> json) {
    return ForwardedIPConfig(
      fallbackBehavior: FallbackBehavior.fromString(
          (json['FallbackBehavior'] as String?) ?? ''),
      headerName: (json['HeaderName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackBehavior = this.fallbackBehavior;
    final headerName = this.headerName;
    return {
      'FallbackBehavior': fallbackBehavior.value,
      'HeaderName': headerName,
    };
  }
}

/// @nodoc
class FallbackBehavior {
  static const match = FallbackBehavior._('MATCH');
  static const noMatch = FallbackBehavior._('NO_MATCH');

  final String value;

  const FallbackBehavior._(this.value);

  static const values = [match, noMatch];

  static FallbackBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FallbackBehavior._(value));

  @override
  bool operator ==(other) => other is FallbackBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies a web request component to be used in a rule match statement or in
/// a logging configuration.
///
/// <ul>
/// <li>
/// In a rule statement, this is the part of the web request that you want WAF
/// to inspect. Include the single <code>FieldToMatch</code> type that you want
/// to inspect, with additional specifications as needed, according to the type.
/// You specify a single request component in <code>FieldToMatch</code> for each
/// rule statement that requires it. To inspect more than one component of the
/// web request, create a separate rule statement for each component.
///
/// Example JSON for a <code>QueryString</code> field to match:
///
/// <code> "FieldToMatch": { "QueryString": {} }</code>
///
/// Example JSON for a <code>Method</code> field to match specification:
///
/// <code> "FieldToMatch": { "Method": { "Name": "DELETE" } }</code>
/// </li>
/// <li>
/// In a logging configuration, this is used in the <code>RedactedFields</code>
/// property to specify a field to redact from the logging records. For this use
/// case, note the following:
///
/// <ul>
/// <li>
/// Even though all <code>FieldToMatch</code> settings are available, the only
/// valid settings for field redaction are <code>UriPath</code>,
/// <code>QueryString</code>, <code>SingleHeader</code>, and
/// <code>Method</code>.
/// </li>
/// <li>
/// In this documentation, the descriptions of the individual fields talk about
/// specifying the web request component to inspect, but for field redaction,
/// you are specifying the component type to redact from the logs.
/// </li>
/// <li>
/// If you have request sampling enabled, the redacted fields configuration for
/// logging has no impact on sampling. You can only exclude fields from request
/// sampling by disabling sampling in the web ACL visibility configuration or by
/// configuring data protection for the web ACL.
/// </li>
/// </ul> </li>
/// </ul>
///
/// @nodoc
class FieldToMatch {
  /// Inspect all query arguments.
  final AllQueryArguments? allQueryArguments;

  /// Inspect the request body as plain text. The request body immediately follows
  /// the request headers. This is the part of a request that contains any
  /// additional data that you want to send to your web server as the HTTP request
  /// body, such as data from a form.
  ///
  /// WAF does not support inspecting the entire contents of the web request body
  /// if the body exceeds the limit for the resource type. When a web request body
  /// is larger than the limit, the underlying host service only forwards the
  /// contents that are within the limit to WAF for inspection.
  ///
  /// <ul>
  /// <li>
  /// For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192
  /// bytes).
  /// </li>
  /// <li>
  /// For CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified
  /// Access, the default limit is 16 KB (16,384 bytes), and you can increase the
  /// limit for each resource type in the web ACL <code>AssociationConfig</code>,
  /// for additional processing fees.
  /// </li>
  /// <li>
  /// For Amplify, use the CloudFront limit.
  /// </li>
  /// </ul>
  /// For information about how to handle oversized request bodies, see the
  /// <code>Body</code> object configuration.
  final Body? body;

  /// Inspect the request cookies. You must configure scope and pattern matching
  /// filters in the <code>Cookies</code> object, to define the set of cookies and
  /// the parts of the cookies that WAF inspects.
  ///
  /// Only the first 8 KB (8192 bytes) of a request's cookies and only the first
  /// 200 cookies are forwarded to WAF for inspection by the underlying host
  /// service. You must configure how to handle any oversize cookie content in the
  /// <code>Cookies</code> object. WAF applies the pattern matching filters to the
  /// cookies that it receives from the underlying host service.
  final Cookies? cookies;

  /// Inspect a string containing the list of the request's header names, ordered
  /// as they appear in the web request that WAF receives for inspection. WAF
  /// generates the string and then uses that as the field to match component in
  /// its inspection. WAF separates the header names in the string using colons
  /// and no added spaces, for example
  /// <code>host:user-agent:accept:authorization:referer</code>.
  final HeaderOrder? headerOrder;

  /// Inspect the request headers. You must configure scope and pattern matching
  /// filters in the <code>Headers</code> object, to define the set of headers to
  /// and the parts of the headers that WAF inspects.
  ///
  /// Only the first 8 KB (8192 bytes) of a request's headers and only the first
  /// 200 headers are forwarded to WAF for inspection by the underlying host
  /// service. You must configure how to handle any oversize header content in the
  /// <code>Headers</code> object. WAF applies the pattern matching filters to the
  /// headers that it receives from the underlying host service.
  final Headers? headers;

  /// Available for use with Amazon CloudFront distributions and Application Load
  /// Balancers. Match against the request's JA3 fingerprint. The JA3 fingerprint
  /// is a 32-character hash derived from the TLS Client Hello of an incoming
  /// request. This fingerprint serves as a unique identifier for the client's TLS
  /// configuration. WAF calculates and logs this fingerprint for each request
  /// that has enough TLS Client Hello information for the calculation. Almost all
  /// web requests include this information.
  /// <note>
  /// You can use this choice only with a string match
  /// <code>ByteMatchStatement</code> with the <code>PositionalConstraint</code>
  /// set to <code>EXACTLY</code>.
  /// </note>
  /// You can obtain the JA3 fingerprint for client requests from the web ACL
  /// logs. If WAF is able to calculate the fingerprint, it includes it in the
  /// logs. For information about the logging fields, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html">Log
  /// fields</a> in the <i>WAF Developer Guide</i>.
  ///
  /// Provide the JA3 fingerprint string from the logs in your string match
  /// statement specification, to match with any future requests that have the
  /// same TLS configuration.
  final JA3Fingerprint? jA3Fingerprint;

  /// Available for use with Amazon CloudFront distributions and Application Load
  /// Balancers. Match against the request's JA4 fingerprint. The JA4 fingerprint
  /// is a 36-character hash derived from the TLS Client Hello of an incoming
  /// request. This fingerprint serves as a unique identifier for the client's TLS
  /// configuration. WAF calculates and logs this fingerprint for each request
  /// that has enough TLS Client Hello information for the calculation. Almost all
  /// web requests include this information.
  /// <note>
  /// You can use this choice only with a string match
  /// <code>ByteMatchStatement</code> with the <code>PositionalConstraint</code>
  /// set to <code>EXACTLY</code>.
  /// </note>
  /// You can obtain the JA4 fingerprint for client requests from the web ACL
  /// logs. If WAF is able to calculate the fingerprint, it includes it in the
  /// logs. For information about the logging fields, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html">Log
  /// fields</a> in the <i>WAF Developer Guide</i>.
  ///
  /// Provide the JA4 fingerprint string from the logs in your string match
  /// statement specification, to match with any future requests that have the
  /// same TLS configuration.
  final JA4Fingerprint? jA4Fingerprint;

  /// Inspect the request body as JSON. The request body immediately follows the
  /// request headers. This is the part of a request that contains any additional
  /// data that you want to send to your web server as the HTTP request body, such
  /// as data from a form.
  ///
  /// WAF does not support inspecting the entire contents of the web request body
  /// if the body exceeds the limit for the resource type. When a web request body
  /// is larger than the limit, the underlying host service only forwards the
  /// contents that are within the limit to WAF for inspection.
  ///
  /// <ul>
  /// <li>
  /// For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192
  /// bytes).
  /// </li>
  /// <li>
  /// For CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified
  /// Access, the default limit is 16 KB (16,384 bytes), and you can increase the
  /// limit for each resource type in the web ACL <code>AssociationConfig</code>,
  /// for additional processing fees.
  /// </li>
  /// <li>
  /// For Amplify, use the CloudFront limit.
  /// </li>
  /// </ul>
  /// For information about how to handle oversized request bodies, see the
  /// <code>JsonBody</code> object configuration.
  final JsonBody? jsonBody;

  /// Inspect the HTTP method. The method indicates the type of operation that the
  /// request is asking the origin to perform.
  final Method? method;

  /// Inspect the query string. This is the part of a URL that appears after a
  /// <code>?</code> character, if any.
  final QueryString? queryString;

  /// Inspect a single header. Provide the name of the header to inspect, for
  /// example, <code>User-Agent</code> or <code>Referer</code>. This setting isn't
  /// case sensitive.
  ///
  /// Example JSON: <code>"SingleHeader": { "Name": "haystack" }</code>
  ///
  /// Alternately, you can filter and inspect all headers with the
  /// <code>Headers</code> <code>FieldToMatch</code> setting.
  final SingleHeader? singleHeader;

  /// Inspect a single query argument. Provide the name of the query argument to
  /// inspect, such as <i>UserName</i> or <i>SalesRegion</i>. The name can be up
  /// to 30 characters long and isn't case sensitive.
  ///
  /// Example JSON: <code>"SingleQueryArgument": { "Name": "myArgument" }</code>
  final SingleQueryArgument? singleQueryArgument;

  /// Inspect fragments of the request URI. You must configure scope and pattern
  /// matching filters in the <code>UriFragment</code> object, to define the
  /// fragment of a URI that WAF inspects.
  ///
  /// Only the first 8 KB (8192 bytes) of a request's URI fragments and only the
  /// first 200 URI fragments are forwarded to WAF for inspection by the
  /// underlying host service. You must configure how to handle any oversize URI
  /// fragment content in the <code>UriFragment</code> object. WAF applies the
  /// pattern matching filters to the cookies that it receives from the underlying
  /// host service.
  final UriFragment? uriFragment;

  /// Inspect the request URI path. This is the part of the web request that
  /// identifies a resource, for example, <code>/images/daily-ad.jpg</code>.
  final UriPath? uriPath;

  FieldToMatch({
    this.allQueryArguments,
    this.body,
    this.cookies,
    this.headerOrder,
    this.headers,
    this.jA3Fingerprint,
    this.jA4Fingerprint,
    this.jsonBody,
    this.method,
    this.queryString,
    this.singleHeader,
    this.singleQueryArgument,
    this.uriFragment,
    this.uriPath,
  });

  factory FieldToMatch.fromJson(Map<String, dynamic> json) {
    return FieldToMatch(
      allQueryArguments: json['AllQueryArguments'] != null
          ? AllQueryArguments.fromJson(
              json['AllQueryArguments'] as Map<String, dynamic>)
          : null,
      body: json['Body'] != null
          ? Body.fromJson(json['Body'] as Map<String, dynamic>)
          : null,
      cookies: json['Cookies'] != null
          ? Cookies.fromJson(json['Cookies'] as Map<String, dynamic>)
          : null,
      headerOrder: json['HeaderOrder'] != null
          ? HeaderOrder.fromJson(json['HeaderOrder'] as Map<String, dynamic>)
          : null,
      headers: json['Headers'] != null
          ? Headers.fromJson(json['Headers'] as Map<String, dynamic>)
          : null,
      jA3Fingerprint: json['JA3Fingerprint'] != null
          ? JA3Fingerprint.fromJson(
              json['JA3Fingerprint'] as Map<String, dynamic>)
          : null,
      jA4Fingerprint: json['JA4Fingerprint'] != null
          ? JA4Fingerprint.fromJson(
              json['JA4Fingerprint'] as Map<String, dynamic>)
          : null,
      jsonBody: json['JsonBody'] != null
          ? JsonBody.fromJson(json['JsonBody'] as Map<String, dynamic>)
          : null,
      method: json['Method'] != null
          ? Method.fromJson(json['Method'] as Map<String, dynamic>)
          : null,
      queryString: json['QueryString'] != null
          ? QueryString.fromJson(json['QueryString'] as Map<String, dynamic>)
          : null,
      singleHeader: json['SingleHeader'] != null
          ? SingleHeader.fromJson(json['SingleHeader'] as Map<String, dynamic>)
          : null,
      singleQueryArgument: json['SingleQueryArgument'] != null
          ? SingleQueryArgument.fromJson(
              json['SingleQueryArgument'] as Map<String, dynamic>)
          : null,
      uriFragment: json['UriFragment'] != null
          ? UriFragment.fromJson(json['UriFragment'] as Map<String, dynamic>)
          : null,
      uriPath: json['UriPath'] != null
          ? UriPath.fromJson(json['UriPath'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final allQueryArguments = this.allQueryArguments;
    final body = this.body;
    final cookies = this.cookies;
    final headerOrder = this.headerOrder;
    final headers = this.headers;
    final jA3Fingerprint = this.jA3Fingerprint;
    final jA4Fingerprint = this.jA4Fingerprint;
    final jsonBody = this.jsonBody;
    final method = this.method;
    final queryString = this.queryString;
    final singleHeader = this.singleHeader;
    final singleQueryArgument = this.singleQueryArgument;
    final uriFragment = this.uriFragment;
    final uriPath = this.uriPath;
    return {
      if (allQueryArguments != null) 'AllQueryArguments': allQueryArguments,
      if (body != null) 'Body': body,
      if (cookies != null) 'Cookies': cookies,
      if (headerOrder != null) 'HeaderOrder': headerOrder,
      if (headers != null) 'Headers': headers,
      if (jA3Fingerprint != null) 'JA3Fingerprint': jA3Fingerprint,
      if (jA4Fingerprint != null) 'JA4Fingerprint': jA4Fingerprint,
      if (jsonBody != null) 'JsonBody': jsonBody,
      if (method != null) 'Method': method,
      if (queryString != null) 'QueryString': queryString,
      if (singleHeader != null) 'SingleHeader': singleHeader,
      if (singleQueryArgument != null)
        'SingleQueryArgument': singleQueryArgument,
      if (uriFragment != null) 'UriFragment': uriFragment,
      if (uriPath != null) 'UriPath': uriPath,
    };
  }
}

/// Text transformations eliminate some of the unusual formatting that attackers
/// use in web requests in an effort to bypass detection.
///
/// @nodoc
class TextTransformation {
  /// Sets the relative processing order for multiple transformations. WAF
  /// processes all transformations, from lowest priority to highest, before
  /// inspecting the transformed content. The priorities don't need to be
  /// consecutive, but they must all be different.
  final int priority;

  /// For detailed descriptions of each of the transformation types, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-transformation.html">Text
  /// transformations</a> in the <i>WAF Developer Guide</i>.
  final TextTransformationType type;

  TextTransformation({
    required this.priority,
    required this.type,
  });

  factory TextTransformation.fromJson(Map<String, dynamic> json) {
    return TextTransformation(
      priority: (json['Priority'] as int?) ?? 0,
      type: TextTransformationType.fromString((json['Type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final priority = this.priority;
    final type = this.type;
    return {
      'Priority': priority,
      'Type': type.value,
    };
  }
}

/// @nodoc
class TextTransformationType {
  static const none = TextTransformationType._('NONE');
  static const compressWhiteSpace =
      TextTransformationType._('COMPRESS_WHITE_SPACE');
  static const htmlEntityDecode =
      TextTransformationType._('HTML_ENTITY_DECODE');
  static const lowercase = TextTransformationType._('LOWERCASE');
  static const cmdLine = TextTransformationType._('CMD_LINE');
  static const urlDecode = TextTransformationType._('URL_DECODE');
  static const base64Decode = TextTransformationType._('BASE64_DECODE');
  static const hexDecode = TextTransformationType._('HEX_DECODE');
  static const md5 = TextTransformationType._('MD5');
  static const replaceComments = TextTransformationType._('REPLACE_COMMENTS');
  static const escapeSeqDecode = TextTransformationType._('ESCAPE_SEQ_DECODE');
  static const sqlHexDecode = TextTransformationType._('SQL_HEX_DECODE');
  static const cssDecode = TextTransformationType._('CSS_DECODE');
  static const jsDecode = TextTransformationType._('JS_DECODE');
  static const normalizePath = TextTransformationType._('NORMALIZE_PATH');
  static const normalizePathWin =
      TextTransformationType._('NORMALIZE_PATH_WIN');
  static const removeNulls = TextTransformationType._('REMOVE_NULLS');
  static const replaceNulls = TextTransformationType._('REPLACE_NULLS');
  static const base64DecodeExt = TextTransformationType._('BASE64_DECODE_EXT');
  static const urlDecodeUni = TextTransformationType._('URL_DECODE_UNI');
  static const utf8ToUnicode = TextTransformationType._('UTF8_TO_UNICODE');

  final String value;

  const TextTransformationType._(this.value);

  static const values = [
    none,
    compressWhiteSpace,
    htmlEntityDecode,
    lowercase,
    cmdLine,
    urlDecode,
    base64Decode,
    hexDecode,
    md5,
    replaceComments,
    escapeSeqDecode,
    sqlHexDecode,
    cssDecode,
    jsDecode,
    normalizePath,
    normalizePathWin,
    removeNulls,
    replaceNulls,
    base64DecodeExt,
    urlDecodeUni,
    utf8ToUnicode
  ];

  static TextTransformationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TextTransformationType._(value));

  @override
  bool operator ==(other) =>
      other is TextTransformationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Inspect one of the headers in the web request, identified by name, for
/// example, <code>User-Agent</code> or <code>Referer</code>. The name isn't
/// case sensitive.
///
/// You can filter and inspect all headers with the <code>FieldToMatch</code>
/// setting <code>Headers</code>.
///
/// This is used to indicate the web request component to inspect, in the
/// <a>FieldToMatch</a> specification.
///
/// Example JSON: <code>"SingleHeader": { "Name": "haystack" }</code>
///
/// @nodoc
class SingleHeader {
  /// The name of the query header to inspect.
  final String name;

  SingleHeader({
    required this.name,
  });

  factory SingleHeader.fromJson(Map<String, dynamic> json) {
    return SingleHeader(
      name: (json['Name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

/// Inspect one query argument in the web request, identified by name, for
/// example <i>UserName</i> or <i>SalesRegion</i>. The name isn't case
/// sensitive.
///
/// This is used to indicate the web request component to inspect, in the
/// <a>FieldToMatch</a> specification.
///
/// Example JSON: <code>"SingleQueryArgument": { "Name": "myArgument" }</code>
///
/// @nodoc
class SingleQueryArgument {
  /// The name of the query argument to inspect.
  final String name;

  SingleQueryArgument({
    required this.name,
  });

  factory SingleQueryArgument.fromJson(Map<String, dynamic> json) {
    return SingleQueryArgument(
      name: (json['Name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

/// Inspect all query arguments of the web request.
///
/// This is used in the <a>FieldToMatch</a> specification for some web request
/// component types.
///
/// JSON specification: <code>"AllQueryArguments": {}</code>
///
/// @nodoc
class AllQueryArguments {
  AllQueryArguments();

  factory AllQueryArguments.fromJson(Map<String, dynamic> _) {
    return AllQueryArguments();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inspect the path component of the URI of the web request. This is the part
/// of the web request that identifies a resource. For example,
/// <code>/images/daily-ad.jpg</code>.
///
/// This is used in the <a>FieldToMatch</a> specification for some web request
/// component types.
///
/// JSON specification: <code>"UriPath": {}</code>
///
/// @nodoc
class UriPath {
  UriPath();

  factory UriPath.fromJson(Map<String, dynamic> _) {
    return UriPath();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inspect the query string of the web request. This is the part of a URL that
/// appears after a <code>?</code> character, if any.
///
/// This is used in the <a>FieldToMatch</a> specification for some web request
/// component types.
///
/// JSON specification: <code>"QueryString": {}</code>
///
/// @nodoc
class QueryString {
  QueryString();

  factory QueryString.fromJson(Map<String, dynamic> _) {
    return QueryString();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inspect the body of the web request. The body immediately follows the
/// request headers.
///
/// This is used to indicate the web request component to inspect, in the
/// <a>FieldToMatch</a> specification.
///
/// @nodoc
class Body {
  /// What WAF should do if the body is larger than WAF can inspect.
  ///
  /// WAF does not support inspecting the entire contents of the web request body
  /// if the body exceeds the limit for the resource type. When a web request body
  /// is larger than the limit, the underlying host service only forwards the
  /// contents that are within the limit to WAF for inspection.
  ///
  /// <ul>
  /// <li>
  /// For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192
  /// bytes).
  /// </li>
  /// <li>
  /// For CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified
  /// Access, the default limit is 16 KB (16,384 bytes), and you can increase the
  /// limit for each resource type in the web ACL <code>AssociationConfig</code>,
  /// for additional processing fees.
  /// </li>
  /// <li>
  /// For Amplify, use the CloudFront limit.
  /// </li>
  /// </ul>
  /// The options for oversize handling are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CONTINUE</code> - Inspect the available body contents normally,
  /// according to the rule inspection criteria.
  /// </li>
  /// <li>
  /// <code>MATCH</code> - Treat the web request as matching the rule statement.
  /// WAF applies the rule action to the request.
  /// </li>
  /// <li>
  /// <code>NO_MATCH</code> - Treat the web request as not matching the rule
  /// statement.
  /// </li>
  /// </ul>
  /// You can combine the <code>MATCH</code> or <code>NO_MATCH</code> settings for
  /// oversize handling with your rule and web ACL action settings, so that you
  /// block any request whose body is over the limit.
  ///
  /// Default: <code>CONTINUE</code>
  final OversizeHandling? oversizeHandling;

  Body({
    this.oversizeHandling,
  });

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      oversizeHandling: (json['OversizeHandling'] as String?)
          ?.let(OversizeHandling.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final oversizeHandling = this.oversizeHandling;
    return {
      if (oversizeHandling != null) 'OversizeHandling': oversizeHandling.value,
    };
  }
}

/// Inspect the HTTP method of the web request. The method indicates the type of
/// operation that the request is asking the origin to perform.
///
/// This is used in the <a>FieldToMatch</a> specification for some web request
/// component types.
///
/// JSON specification: <code>"Method": {}</code>
///
/// @nodoc
class Method {
  Method();

  factory Method.fromJson(Map<String, dynamic> _) {
    return Method();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inspect the body of the web request as JSON. The body immediately follows
/// the request headers.
///
/// This is used to indicate the web request component to inspect, in the
/// <a>FieldToMatch</a> specification.
///
/// Use the specifications in this object to indicate which parts of the JSON
/// body to inspect using the rule's inspection criteria. WAF inspects only the
/// parts of the JSON that result from the matches that you indicate.
///
/// Example JSON: <code>"JsonBody": { "MatchPattern": { "All": {} },
/// "MatchScope": "ALL" }</code>
///
/// For additional information about this request component option, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-fields-list.html#waf-rule-statement-request-component-json-body">JSON
/// body</a> in the <i>WAF Developer Guide</i>.
///
/// @nodoc
class JsonBody {
  /// The patterns to look for in the JSON body. WAF inspects the results of these
  /// pattern matches against the rule inspection criteria.
  final JsonMatchPattern matchPattern;

  /// The parts of the JSON to match against using the <code>MatchPattern</code>.
  /// If you specify <code>ALL</code>, WAF matches against keys and values.
  ///
  /// <code>All</code> does not require a match to be found in the keys and a
  /// match to be found in the values. It requires a match to be found in the keys
  /// or the values or both. To require a match in the keys and in the values, use
  /// a logical <code>AND</code> statement to combine two match rules, one that
  /// inspects the keys and another that inspects the values.
  final JsonMatchScope matchScope;

  /// What WAF should do if it fails to completely parse the JSON body. The
  /// options are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>EVALUATE_AS_STRING</code> - Inspect the body as plain text. WAF
  /// applies the text transformations and inspection criteria that you defined
  /// for the JSON inspection to the body text string.
  /// </li>
  /// <li>
  /// <code>MATCH</code> - Treat the web request as matching the rule statement.
  /// WAF applies the rule action to the request.
  /// </li>
  /// <li>
  /// <code>NO_MATCH</code> - Treat the web request as not matching the rule
  /// statement.
  /// </li>
  /// </ul>
  /// If you don't provide this setting, WAF parses and evaluates the content only
  /// up to the first parsing failure that it encounters.
  /// <note>
  /// WAF parsing doesn't fully validate the input JSON string, so parsing can
  /// succeed even for invalid JSON. When parsing succeeds, WAF doesn't apply the
  /// fallback behavior. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-fields-list.html#waf-rule-statement-request-component-json-body">JSON
  /// body</a> in the <i>WAF Developer Guide</i>.
  /// </note>
  final BodyParsingFallbackBehavior? invalidFallbackBehavior;

  /// What WAF should do if the body is larger than WAF can inspect.
  ///
  /// WAF does not support inspecting the entire contents of the web request body
  /// if the body exceeds the limit for the resource type. When a web request body
  /// is larger than the limit, the underlying host service only forwards the
  /// contents that are within the limit to WAF for inspection.
  ///
  /// <ul>
  /// <li>
  /// For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192
  /// bytes).
  /// </li>
  /// <li>
  /// For CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified
  /// Access, the default limit is 16 KB (16,384 bytes), and you can increase the
  /// limit for each resource type in the web ACL <code>AssociationConfig</code>,
  /// for additional processing fees.
  /// </li>
  /// <li>
  /// For Amplify, use the CloudFront limit.
  /// </li>
  /// </ul>
  /// The options for oversize handling are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CONTINUE</code> - Inspect the available body contents normally,
  /// according to the rule inspection criteria.
  /// </li>
  /// <li>
  /// <code>MATCH</code> - Treat the web request as matching the rule statement.
  /// WAF applies the rule action to the request.
  /// </li>
  /// <li>
  /// <code>NO_MATCH</code> - Treat the web request as not matching the rule
  /// statement.
  /// </li>
  /// </ul>
  /// You can combine the <code>MATCH</code> or <code>NO_MATCH</code> settings for
  /// oversize handling with your rule and web ACL action settings, so that you
  /// block any request whose body is over the limit.
  ///
  /// Default: <code>CONTINUE</code>
  final OversizeHandling? oversizeHandling;

  JsonBody({
    required this.matchPattern,
    required this.matchScope,
    this.invalidFallbackBehavior,
    this.oversizeHandling,
  });

  factory JsonBody.fromJson(Map<String, dynamic> json) {
    return JsonBody(
      matchPattern: JsonMatchPattern.fromJson(
          (json['MatchPattern'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      matchScope:
          JsonMatchScope.fromString((json['MatchScope'] as String?) ?? ''),
      invalidFallbackBehavior: (json['InvalidFallbackBehavior'] as String?)
          ?.let(BodyParsingFallbackBehavior.fromString),
      oversizeHandling: (json['OversizeHandling'] as String?)
          ?.let(OversizeHandling.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final matchPattern = this.matchPattern;
    final matchScope = this.matchScope;
    final invalidFallbackBehavior = this.invalidFallbackBehavior;
    final oversizeHandling = this.oversizeHandling;
    return {
      'MatchPattern': matchPattern,
      'MatchScope': matchScope.value,
      if (invalidFallbackBehavior != null)
        'InvalidFallbackBehavior': invalidFallbackBehavior.value,
      if (oversizeHandling != null) 'OversizeHandling': oversizeHandling.value,
    };
  }
}

/// Inspect all headers in the web request. You can specify the parts of the
/// headers to inspect and you can narrow the set of headers to inspect by
/// including or excluding specific keys.
///
/// This is used to indicate the web request component to inspect, in the
/// <a>FieldToMatch</a> specification.
///
/// If you want to inspect just the value of a single header, use the
/// <code>SingleHeader</code> <code>FieldToMatch</code> setting instead.
///
/// Example JSON: <code>"Headers": { "MatchPattern": { "All": {} },
/// "MatchScope": "KEY", "OversizeHandling": "MATCH" }</code>
///
/// @nodoc
class Headers {
  /// The filter to use to identify the subset of headers to inspect in a web
  /// request.
  ///
  /// You must specify exactly one setting: either <code>All</code>,
  /// <code>IncludedHeaders</code>, or <code>ExcludedHeaders</code>.
  ///
  /// Example JSON: <code>"MatchPattern": { "ExcludedHeaders": \[ "KeyToExclude1",
  /// "KeyToExclude2" \] }</code>
  final HeaderMatchPattern matchPattern;

  /// The parts of the headers to match with the rule inspection criteria. If you
  /// specify <code>ALL</code>, WAF inspects both keys and values.
  ///
  /// <code>All</code> does not require a match to be found in the keys and a
  /// match to be found in the values. It requires a match to be found in the keys
  /// or the values or both. To require a match in the keys and in the values, use
  /// a logical <code>AND</code> statement to combine two match rules, one that
  /// inspects the keys and another that inspects the values.
  final MapMatchScope matchScope;

  /// What WAF should do if the headers determined by your match scope are more
  /// numerous or larger than WAF can inspect. WAF does not support inspecting the
  /// entire contents of request headers when they exceed 8 KB (8192 bytes) or 200
  /// total headers. The underlying host service forwards a maximum of 200 headers
  /// and at most 8 KB of header contents to WAF.
  ///
  /// The options for oversize handling are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CONTINUE</code> - Inspect the available headers normally, according to
  /// the rule inspection criteria.
  /// </li>
  /// <li>
  /// <code>MATCH</code> - Treat the web request as matching the rule statement.
  /// WAF applies the rule action to the request.
  /// </li>
  /// <li>
  /// <code>NO_MATCH</code> - Treat the web request as not matching the rule
  /// statement.
  /// </li>
  /// </ul>
  final OversizeHandling oversizeHandling;

  Headers({
    required this.matchPattern,
    required this.matchScope,
    required this.oversizeHandling,
  });

  factory Headers.fromJson(Map<String, dynamic> json) {
    return Headers(
      matchPattern: HeaderMatchPattern.fromJson(
          (json['MatchPattern'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      matchScope:
          MapMatchScope.fromString((json['MatchScope'] as String?) ?? ''),
      oversizeHandling: OversizeHandling.fromString(
          (json['OversizeHandling'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final matchPattern = this.matchPattern;
    final matchScope = this.matchScope;
    final oversizeHandling = this.oversizeHandling;
    return {
      'MatchPattern': matchPattern,
      'MatchScope': matchScope.value,
      'OversizeHandling': oversizeHandling.value,
    };
  }
}

/// Inspect the cookies in the web request. You can specify the parts of the
/// cookies to inspect and you can narrow the set of cookies to inspect by
/// including or excluding specific keys.
///
/// This is used to indicate the web request component to inspect, in the
/// <a>FieldToMatch</a> specification.
///
/// Example JSON: <code>"Cookies": { "MatchPattern": { "All": {} },
/// "MatchScope": "KEY", "OversizeHandling": "MATCH" }</code>
///
/// @nodoc
class Cookies {
  /// The filter to use to identify the subset of cookies to inspect in a web
  /// request.
  ///
  /// You must specify exactly one setting: either <code>All</code>,
  /// <code>IncludedCookies</code>, or <code>ExcludedCookies</code>.
  ///
  /// Example JSON: <code>"MatchPattern": { "IncludedCookies": \[
  /// "session-id-time", "session-id" \] }</code>
  final CookieMatchPattern matchPattern;

  /// The parts of the cookies to inspect with the rule inspection criteria. If
  /// you specify <code>ALL</code>, WAF inspects both keys and values.
  ///
  /// <code>All</code> does not require a match to be found in the keys and a
  /// match to be found in the values. It requires a match to be found in the keys
  /// or the values or both. To require a match in the keys and in the values, use
  /// a logical <code>AND</code> statement to combine two match rules, one that
  /// inspects the keys and another that inspects the values.
  final MapMatchScope matchScope;

  /// What WAF should do if the cookies of the request are more numerous or larger
  /// than WAF can inspect. WAF does not support inspecting the entire contents of
  /// request cookies when they exceed 8 KB (8192 bytes) or 200 total cookies. The
  /// underlying host service forwards a maximum of 200 cookies and at most 8 KB
  /// of cookie contents to WAF.
  ///
  /// The options for oversize handling are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CONTINUE</code> - Inspect the available cookies normally, according to
  /// the rule inspection criteria.
  /// </li>
  /// <li>
  /// <code>MATCH</code> - Treat the web request as matching the rule statement.
  /// WAF applies the rule action to the request.
  /// </li>
  /// <li>
  /// <code>NO_MATCH</code> - Treat the web request as not matching the rule
  /// statement.
  /// </li>
  /// </ul>
  final OversizeHandling oversizeHandling;

  Cookies({
    required this.matchPattern,
    required this.matchScope,
    required this.oversizeHandling,
  });

  factory Cookies.fromJson(Map<String, dynamic> json) {
    return Cookies(
      matchPattern: CookieMatchPattern.fromJson(
          (json['MatchPattern'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      matchScope:
          MapMatchScope.fromString((json['MatchScope'] as String?) ?? ''),
      oversizeHandling: OversizeHandling.fromString(
          (json['OversizeHandling'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final matchPattern = this.matchPattern;
    final matchScope = this.matchScope;
    final oversizeHandling = this.oversizeHandling;
    return {
      'MatchPattern': matchPattern,
      'MatchScope': matchScope.value,
      'OversizeHandling': oversizeHandling.value,
    };
  }
}

/// Inspect a string containing the list of the request's header names, ordered
/// as they appear in the web request that WAF receives for inspection. WAF
/// generates the string and then uses that as the field to match component in
/// its inspection. WAF separates the header names in the string using colons
/// and no added spaces, for example
/// <code>host:user-agent:accept:authorization:referer</code>.
///
/// @nodoc
class HeaderOrder {
  /// What WAF should do if the headers determined by your match scope are more
  /// numerous or larger than WAF can inspect. WAF does not support inspecting the
  /// entire contents of request headers when they exceed 8 KB (8192 bytes) or 200
  /// total headers. The underlying host service forwards a maximum of 200 headers
  /// and at most 8 KB of header contents to WAF.
  ///
  /// The options for oversize handling are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CONTINUE</code> - Inspect the available headers normally, according to
  /// the rule inspection criteria.
  /// </li>
  /// <li>
  /// <code>MATCH</code> - Treat the web request as matching the rule statement.
  /// WAF applies the rule action to the request.
  /// </li>
  /// <li>
  /// <code>NO_MATCH</code> - Treat the web request as not matching the rule
  /// statement.
  /// </li>
  /// </ul>
  final OversizeHandling oversizeHandling;

  HeaderOrder({
    required this.oversizeHandling,
  });

  factory HeaderOrder.fromJson(Map<String, dynamic> json) {
    return HeaderOrder(
      oversizeHandling: OversizeHandling.fromString(
          (json['OversizeHandling'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final oversizeHandling = this.oversizeHandling;
    return {
      'OversizeHandling': oversizeHandling.value,
    };
  }
}

/// Available for use with Amazon CloudFront distributions and Application Load
/// Balancers. Match against the request's JA3 fingerprint. The JA3 fingerprint
/// is a 32-character hash derived from the TLS Client Hello of an incoming
/// request. This fingerprint serves as a unique identifier for the client's TLS
/// configuration. WAF calculates and logs this fingerprint for each request
/// that has enough TLS Client Hello information for the calculation. Almost all
/// web requests include this information.
/// <note>
/// You can use this choice only with a string match
/// <code>ByteMatchStatement</code> with the <code>PositionalConstraint</code>
/// set to <code>EXACTLY</code>.
/// </note>
/// You can obtain the JA3 fingerprint for client requests from the web ACL
/// logs. If WAF is able to calculate the fingerprint, it includes it in the
/// logs. For information about the logging fields, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html">Log
/// fields</a> in the <i>WAF Developer Guide</i>.
///
/// Provide the JA3 fingerprint string from the logs in your string match
/// statement specification, to match with any future requests that have the
/// same TLS configuration.
///
/// @nodoc
class JA3Fingerprint {
  /// The match status to assign to the web request if the request doesn't have a
  /// JA3 fingerprint.
  ///
  /// You can specify the following fallback behaviors:
  ///
  /// <ul>
  /// <li>
  /// <code>MATCH</code> - Treat the web request as matching the rule statement.
  /// WAF applies the rule action to the request.
  /// </li>
  /// <li>
  /// <code>NO_MATCH</code> - Treat the web request as not matching the rule
  /// statement.
  /// </li>
  /// </ul>
  final FallbackBehavior fallbackBehavior;

  JA3Fingerprint({
    required this.fallbackBehavior,
  });

  factory JA3Fingerprint.fromJson(Map<String, dynamic> json) {
    return JA3Fingerprint(
      fallbackBehavior: FallbackBehavior.fromString(
          (json['FallbackBehavior'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackBehavior = this.fallbackBehavior;
    return {
      'FallbackBehavior': fallbackBehavior.value,
    };
  }
}

/// Available for use with Amazon CloudFront distributions and Application Load
/// Balancers. Match against the request's JA4 fingerprint. The JA4 fingerprint
/// is a 36-character hash derived from the TLS Client Hello of an incoming
/// request. This fingerprint serves as a unique identifier for the client's TLS
/// configuration. WAF calculates and logs this fingerprint for each request
/// that has enough TLS Client Hello information for the calculation. Almost all
/// web requests include this information.
/// <note>
/// You can use this choice only with a string match
/// <code>ByteMatchStatement</code> with the <code>PositionalConstraint</code>
/// set to <code>EXACTLY</code>.
/// </note>
/// You can obtain the JA4 fingerprint for client requests from the web ACL
/// logs. If WAF is able to calculate the fingerprint, it includes it in the
/// logs. For information about the logging fields, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html">Log
/// fields</a> in the <i>WAF Developer Guide</i>.
///
/// Provide the JA4 fingerprint string from the logs in your string match
/// statement specification, to match with any future requests that have the
/// same TLS configuration.
///
/// @nodoc
class JA4Fingerprint {
  /// The match status to assign to the web request if the request doesn't have a
  /// JA4 fingerprint.
  ///
  /// You can specify the following fallback behaviors:
  ///
  /// <ul>
  /// <li>
  /// <code>MATCH</code> - Treat the web request as matching the rule statement.
  /// WAF applies the rule action to the request.
  /// </li>
  /// <li>
  /// <code>NO_MATCH</code> - Treat the web request as not matching the rule
  /// statement.
  /// </li>
  /// </ul>
  final FallbackBehavior fallbackBehavior;

  JA4Fingerprint({
    required this.fallbackBehavior,
  });

  factory JA4Fingerprint.fromJson(Map<String, dynamic> json) {
    return JA4Fingerprint(
      fallbackBehavior: FallbackBehavior.fromString(
          (json['FallbackBehavior'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackBehavior = this.fallbackBehavior;
    return {
      'FallbackBehavior': fallbackBehavior.value,
    };
  }
}

/// Inspect fragments of the request URI. You can specify the parts of the URI
/// fragment to inspect and you can narrow the set of URI fragments to inspect
/// by including or excluding specific keys.
///
/// This is used to indicate the web request component to inspect, in the
/// <a>FieldToMatch</a> specification.
///
/// Example JSON: <code>"UriFragment": { "MatchPattern": { "All": {} },
/// "MatchScope": "KEY", "OversizeHandling": "MATCH" }</code>
///
/// @nodoc
class UriFragment {
  /// What WAF should do if it fails to completely parse the JSON body. The
  /// options are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>EVALUATE_AS_STRING</code> - Inspect the body as plain text. WAF
  /// applies the text transformations and inspection criteria that you defined
  /// for the JSON inspection to the body text string.
  /// </li>
  /// <li>
  /// <code>MATCH</code> - Treat the web request as matching the rule statement.
  /// WAF applies the rule action to the request.
  /// </li>
  /// <li>
  /// <code>NO_MATCH</code> - Treat the web request as not matching the rule
  /// statement.
  /// </li>
  /// </ul>
  /// If you don't provide this setting, WAF parses and evaluates the content only
  /// up to the first parsing failure that it encounters.
  ///
  /// Example JSON: <code>{ "UriFragment": { "FallbackBehavior": "MATCH"} }</code>
  /// <note>
  /// WAF parsing doesn't fully validate the input JSON string, so parsing can
  /// succeed even for invalid JSON. When parsing succeeds, WAF doesn't apply the
  /// fallback behavior. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-fields-list.html#waf-rule-statement-request-component-json-body">JSON
  /// body</a> in the <i>WAF Developer Guide</i>.
  /// </note>
  final FallbackBehavior? fallbackBehavior;

  UriFragment({
    this.fallbackBehavior,
  });

  factory UriFragment.fromJson(Map<String, dynamic> json) {
    return UriFragment(
      fallbackBehavior: (json['FallbackBehavior'] as String?)
          ?.let(FallbackBehavior.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackBehavior = this.fallbackBehavior;
    return {
      if (fallbackBehavior != null) 'FallbackBehavior': fallbackBehavior.value,
    };
  }
}

/// @nodoc
class OversizeHandling {
  static const $continue = OversizeHandling._('CONTINUE');
  static const match = OversizeHandling._('MATCH');
  static const noMatch = OversizeHandling._('NO_MATCH');

  final String value;

  const OversizeHandling._(this.value);

  static const values = [$continue, match, noMatch];

  static OversizeHandling fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OversizeHandling._(value));

  @override
  bool operator ==(other) => other is OversizeHandling && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The filter to use to identify the subset of cookies to inspect in a web
/// request.
///
/// You must specify exactly one setting: either <code>All</code>,
/// <code>IncludedCookies</code>, or <code>ExcludedCookies</code>.
///
/// Example JSON: <code>"MatchPattern": { "IncludedCookies": \[
/// "session-id-time", "session-id" \] }</code>
///
/// @nodoc
class CookieMatchPattern {
  /// Inspect all cookies.
  final All? all;

  /// Inspect only the cookies whose keys don't match any of the strings specified
  /// here.
  final List<String>? excludedCookies;

  /// Inspect only the cookies that have a key that matches one of the strings
  /// specified here.
  final List<String>? includedCookies;

  CookieMatchPattern({
    this.all,
    this.excludedCookies,
    this.includedCookies,
  });

  factory CookieMatchPattern.fromJson(Map<String, dynamic> json) {
    return CookieMatchPattern(
      all: json['All'] != null
          ? All.fromJson(json['All'] as Map<String, dynamic>)
          : null,
      excludedCookies: (json['ExcludedCookies'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      includedCookies: (json['IncludedCookies'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final all = this.all;
    final excludedCookies = this.excludedCookies;
    final includedCookies = this.includedCookies;
    return {
      if (all != null) 'All': all,
      if (excludedCookies != null) 'ExcludedCookies': excludedCookies,
      if (includedCookies != null) 'IncludedCookies': includedCookies,
    };
  }
}

/// @nodoc
class MapMatchScope {
  static const all = MapMatchScope._('ALL');
  static const key = MapMatchScope._('KEY');
  static const $value = MapMatchScope._('VALUE');

  final String value;

  const MapMatchScope._(this.value);

  static const values = [all, key, $value];

  static MapMatchScope fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MapMatchScope._(value));

  @override
  bool operator ==(other) => other is MapMatchScope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Inspect all of the elements that WAF has parsed and extracted from the web
/// request component that you've identified in your <a>FieldToMatch</a>
/// specifications.
///
/// This is used in the <a>FieldToMatch</a> specification for some web request
/// component types.
///
/// JSON specification: <code>"All": {}</code>
///
/// @nodoc
class All {
  All();

  factory All.fromJson(Map<String, dynamic> _) {
    return All();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The filter to use to identify the subset of headers to inspect in a web
/// request.
///
/// You must specify exactly one setting: either <code>All</code>,
/// <code>IncludedHeaders</code>, or <code>ExcludedHeaders</code>.
///
/// Example JSON: <code>"MatchPattern": { "ExcludedHeaders": \[ "KeyToExclude1",
/// "KeyToExclude2" \] }</code>
///
/// @nodoc
class HeaderMatchPattern {
  /// Inspect all headers.
  final All? all;

  /// Inspect only the headers whose keys don't match any of the strings specified
  /// here.
  final List<String>? excludedHeaders;

  /// Inspect only the headers that have a key that matches one of the strings
  /// specified here.
  final List<String>? includedHeaders;

  HeaderMatchPattern({
    this.all,
    this.excludedHeaders,
    this.includedHeaders,
  });

  factory HeaderMatchPattern.fromJson(Map<String, dynamic> json) {
    return HeaderMatchPattern(
      all: json['All'] != null
          ? All.fromJson(json['All'] as Map<String, dynamic>)
          : null,
      excludedHeaders: (json['ExcludedHeaders'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      includedHeaders: (json['IncludedHeaders'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final all = this.all;
    final excludedHeaders = this.excludedHeaders;
    final includedHeaders = this.includedHeaders;
    return {
      if (all != null) 'All': all,
      if (excludedHeaders != null) 'ExcludedHeaders': excludedHeaders,
      if (includedHeaders != null) 'IncludedHeaders': includedHeaders,
    };
  }
}

/// The patterns to look for in the JSON body. WAF inspects the results of these
/// pattern matches against the rule inspection criteria. This is used with the
/// <a>FieldToMatch</a> option <code>JsonBody</code>.
///
/// @nodoc
class JsonMatchPattern {
  /// Match all of the elements. See also <code>MatchScope</code> in
  /// <a>JsonBody</a>.
  ///
  /// You must specify either this setting or the <code>IncludedPaths</code>
  /// setting, but not both.
  final All? all;

  /// Match only the specified include paths. See also <code>MatchScope</code> in
  /// <a>JsonBody</a>.
  ///
  /// Provide the include paths using JSON Pointer syntax. For example,
  /// <code>"IncludedPaths": \["/dogs/0/name", "/dogs/1/name"\]</code>. For
  /// information about this syntax, see the Internet Engineering Task Force
  /// (IETF) documentation <a
  /// href="https://tools.ietf.org/html/rfc6901">JavaScript Object Notation (JSON)
  /// Pointer</a>.
  ///
  /// You must specify either this setting or the <code>All</code> setting, but
  /// not both.
  /// <note>
  /// Don't use this option to include all paths. Instead, use the
  /// <code>All</code> setting.
  /// </note>
  final List<String>? includedPaths;

  JsonMatchPattern({
    this.all,
    this.includedPaths,
  });

  factory JsonMatchPattern.fromJson(Map<String, dynamic> json) {
    return JsonMatchPattern(
      all: json['All'] != null
          ? All.fromJson(json['All'] as Map<String, dynamic>)
          : null,
      includedPaths: (json['IncludedPaths'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final all = this.all;
    final includedPaths = this.includedPaths;
    return {
      if (all != null) 'All': all,
      if (includedPaths != null) 'IncludedPaths': includedPaths,
    };
  }
}

/// @nodoc
class JsonMatchScope {
  static const all = JsonMatchScope._('ALL');
  static const key = JsonMatchScope._('KEY');
  static const $value = JsonMatchScope._('VALUE');

  final String value;

  const JsonMatchScope._(this.value);

  static const values = [all, key, $value];

  static JsonMatchScope fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JsonMatchScope._(value));

  @override
  bool operator ==(other) => other is JsonMatchScope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class BodyParsingFallbackBehavior {
  static const match = BodyParsingFallbackBehavior._('MATCH');
  static const noMatch = BodyParsingFallbackBehavior._('NO_MATCH');
  static const evaluateAsString =
      BodyParsingFallbackBehavior._('EVALUATE_AS_STRING');

  final String value;

  const BodyParsingFallbackBehavior._(this.value);

  static const values = [match, noMatch, evaluateAsString];

  static BodyParsingFallbackBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BodyParsingFallbackBehavior._(value));

  @override
  bool operator ==(other) =>
      other is BodyParsingFallbackBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LabelMatchScope {
  static const label = LabelMatchScope._('LABEL');
  static const namespace = LabelMatchScope._('NAMESPACE');

  final String value;

  const LabelMatchScope._(this.value);

  static const values = [label, namespace];

  static LabelMatchScope fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LabelMatchScope._(value));

  @override
  bool operator ==(other) => other is LabelMatchScope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Action setting to use in the place of a rule action that is configured
/// inside the rule group. You specify one override for each rule whose action
/// you want to change.
/// <note>
/// Verify the rule names in your overrides carefully. With managed rule groups,
/// WAF silently ignores any override that uses an invalid rule name. With
/// customer-owned rule groups, invalid rule names in your overrides will cause
/// web ACL updates to fail. An invalid rule name is any name that doesn't
/// exactly match the case-sensitive name of an existing rule in the rule group.
/// </note>
/// You can use overrides for testing, for example you can override all of rule
/// actions to <code>Count</code> and then monitor the resulting count metrics
/// to understand how the rule group would handle your web traffic. You can also
/// permanently override some or all actions, to modify how the rule group
/// manages your web traffic.
///
/// @nodoc
class RuleActionOverride {
  /// The override action to use, in place of the configured action of the rule in
  /// the rule group.
  final RuleAction actionToUse;

  /// The name of the rule to override.
  /// <note>
  /// Verify the rule names in your overrides carefully. With managed rule groups,
  /// WAF silently ignores any override that uses an invalid rule name. With
  /// customer-owned rule groups, invalid rule names in your overrides will cause
  /// web ACL updates to fail. An invalid rule name is any name that doesn't
  /// exactly match the case-sensitive name of an existing rule in the rule group.
  /// </note>
  final String name;

  RuleActionOverride({
    required this.actionToUse,
    required this.name,
  });

  factory RuleActionOverride.fromJson(Map<String, dynamic> json) {
    return RuleActionOverride(
      actionToUse: RuleAction.fromJson(
          (json['ActionToUse'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['Name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final actionToUse = this.actionToUse;
    final name = this.name;
    return {
      'ActionToUse': actionToUse,
      'Name': name,
    };
  }
}

/// Additional information that's used by a managed rule group. Many managed
/// rule groups don't require this.
///
/// The rule groups used for intelligent threat mitigation require additional
/// configuration:
///
/// <ul>
/// <li>
/// Use the <code>AWSManagedRulesACFPRuleSet</code> configuration object to
/// configure the account creation fraud prevention managed rule group. The
/// configuration includes the registration and sign-up pages of your
/// application and the locations in the account creation request payload of
/// data, such as the user email and phone number fields.
/// </li>
/// <li>
/// Use the <code>AWSManagedRulesAntiDDoSRuleSet</code> configuration object to
/// configure the anti-DDoS managed rule group. The configuration includes the
/// sensitivity levels to use in the rules that typically block and challenge
/// requests that might be participating in DDoS attacks and the specification
/// to use to indicate whether a request can handle a silent browser challenge.
/// </li>
/// <li>
/// Use the <code>AWSManagedRulesATPRuleSet</code> configuration object to
/// configure the account takeover prevention managed rule group. The
/// configuration includes the sign-in page of your application and the
/// locations in the login request payload of data such as the username and
/// password.
/// </li>
/// <li>
/// Use the <code>AWSManagedRulesBotControlRuleSet</code> configuration object
/// to configure the protection level that you want the Bot Control rule group
/// to use.
/// </li>
/// </ul>
/// For example specifications, see the examples section of <a>CreateWebACL</a>.
///
/// @nodoc
class ManagedRuleGroupConfig {
  /// Additional configuration for using the account creation fraud prevention
  /// (ACFP) managed rule group, <code>AWSManagedRulesACFPRuleSet</code>. Use this
  /// to provide account creation request information to the rule group. For web
  /// ACLs that protect CloudFront distributions, use this to also provide the
  /// information about how your distribution responds to account creation
  /// requests.
  ///
  /// For information about using the ACFP managed rule group, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-acfp.html">WAF
  /// Fraud Control account creation fraud prevention (ACFP) rule group</a> and <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-acfp.html">WAF
  /// Fraud Control account creation fraud prevention (ACFP)</a> in the <i>WAF
  /// Developer Guide</i>.
  final AWSManagedRulesACFPRuleSet? awsManagedRulesACFPRuleSet;

  /// Additional configuration for using the account takeover prevention (ATP)
  /// managed rule group, <code>AWSManagedRulesATPRuleSet</code>. Use this to
  /// provide login request information to the rule group. For web ACLs that
  /// protect CloudFront distributions, use this to also provide the information
  /// about how your distribution responds to login requests.
  ///
  /// This configuration replaces the individual configuration fields in
  /// <code>ManagedRuleGroupConfig</code> and provides additional feature
  /// configuration.
  ///
  /// For information about using the ATP managed rule group, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-atp.html">WAF
  /// Fraud Control account takeover prevention (ATP) rule group</a> and <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-atp.html">WAF
  /// Fraud Control account takeover prevention (ATP)</a> in the <i>WAF Developer
  /// Guide</i>.
  final AWSManagedRulesATPRuleSet? awsManagedRulesATPRuleSet;

  /// Additional configuration for using the anti-DDoS managed rule group,
  /// <code>AWSManagedRulesAntiDDoSRuleSet</code>. Use this to configure anti-DDoS
  /// behavior for the rule group.
  ///
  /// For information about using the anti-DDoS managed rule group, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-anti-ddos.html">WAF
  /// Anti-DDoS rule group</a> and <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-anti-ddos.html">Distributed
  /// Denial of Service (DDoS) prevention</a> in the <i>WAF Developer Guide</i>.
  final AWSManagedRulesAntiDDoSRuleSet? awsManagedRulesAntiDDoSRuleSet;

  /// Additional configuration for using the Bot Control managed rule group. Use
  /// this to specify the inspection level that you want to use. For information
  /// about using the Bot Control managed rule group, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-bot.html">WAF
  /// Bot Control rule group</a> and <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-bot-control.html">WAF
  /// Bot Control</a> in the <i>WAF Developer Guide</i>.
  final AWSManagedRulesBotControlRuleSet? awsManagedRulesBotControlRuleSet;

  /// <note>
  /// Instead of this setting, provide your configuration under
  /// <code>AWSManagedRulesATPRuleSet</code>.
  /// </note>
  final String? loginPath;

  /// <note>
  /// Instead of this setting, provide your configuration under the request
  /// inspection configuration for <code>AWSManagedRulesATPRuleSet</code> or
  /// <code>AWSManagedRulesACFPRuleSet</code>.
  /// </note>
  final PasswordField? passwordField;

  /// <note>
  /// Instead of this setting, provide your configuration under the request
  /// inspection configuration for <code>AWSManagedRulesATPRuleSet</code> or
  /// <code>AWSManagedRulesACFPRuleSet</code>.
  /// </note>
  final PayloadType? payloadType;

  /// <note>
  /// Instead of this setting, provide your configuration under the request
  /// inspection configuration for <code>AWSManagedRulesATPRuleSet</code> or
  /// <code>AWSManagedRulesACFPRuleSet</code>.
  /// </note>
  final UsernameField? usernameField;

  ManagedRuleGroupConfig({
    this.awsManagedRulesACFPRuleSet,
    this.awsManagedRulesATPRuleSet,
    this.awsManagedRulesAntiDDoSRuleSet,
    this.awsManagedRulesBotControlRuleSet,
    this.loginPath,
    this.passwordField,
    this.payloadType,
    this.usernameField,
  });

  factory ManagedRuleGroupConfig.fromJson(Map<String, dynamic> json) {
    return ManagedRuleGroupConfig(
      awsManagedRulesACFPRuleSet: json['AWSManagedRulesACFPRuleSet'] != null
          ? AWSManagedRulesACFPRuleSet.fromJson(
              json['AWSManagedRulesACFPRuleSet'] as Map<String, dynamic>)
          : null,
      awsManagedRulesATPRuleSet: json['AWSManagedRulesATPRuleSet'] != null
          ? AWSManagedRulesATPRuleSet.fromJson(
              json['AWSManagedRulesATPRuleSet'] as Map<String, dynamic>)
          : null,
      awsManagedRulesAntiDDoSRuleSet: json['AWSManagedRulesAntiDDoSRuleSet'] !=
              null
          ? AWSManagedRulesAntiDDoSRuleSet.fromJson(
              json['AWSManagedRulesAntiDDoSRuleSet'] as Map<String, dynamic>)
          : null,
      awsManagedRulesBotControlRuleSet:
          json['AWSManagedRulesBotControlRuleSet'] != null
              ? AWSManagedRulesBotControlRuleSet.fromJson(
                  json['AWSManagedRulesBotControlRuleSet']
                      as Map<String, dynamic>)
              : null,
      loginPath: json['LoginPath'] as String?,
      passwordField: json['PasswordField'] != null
          ? PasswordField.fromJson(
              json['PasswordField'] as Map<String, dynamic>)
          : null,
      payloadType:
          (json['PayloadType'] as String?)?.let(PayloadType.fromString),
      usernameField: json['UsernameField'] != null
          ? UsernameField.fromJson(
              json['UsernameField'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsManagedRulesACFPRuleSet = this.awsManagedRulesACFPRuleSet;
    final awsManagedRulesATPRuleSet = this.awsManagedRulesATPRuleSet;
    final awsManagedRulesAntiDDoSRuleSet = this.awsManagedRulesAntiDDoSRuleSet;
    final awsManagedRulesBotControlRuleSet =
        this.awsManagedRulesBotControlRuleSet;
    final loginPath = this.loginPath;
    final passwordField = this.passwordField;
    final payloadType = this.payloadType;
    final usernameField = this.usernameField;
    return {
      if (awsManagedRulesACFPRuleSet != null)
        'AWSManagedRulesACFPRuleSet': awsManagedRulesACFPRuleSet,
      if (awsManagedRulesATPRuleSet != null)
        'AWSManagedRulesATPRuleSet': awsManagedRulesATPRuleSet,
      if (awsManagedRulesAntiDDoSRuleSet != null)
        'AWSManagedRulesAntiDDoSRuleSet': awsManagedRulesAntiDDoSRuleSet,
      if (awsManagedRulesBotControlRuleSet != null)
        'AWSManagedRulesBotControlRuleSet': awsManagedRulesBotControlRuleSet,
      if (loginPath != null) 'LoginPath': loginPath,
      if (passwordField != null) 'PasswordField': passwordField,
      if (payloadType != null) 'PayloadType': payloadType.value,
      if (usernameField != null) 'UsernameField': usernameField,
    };
  }
}

/// @nodoc
class PayloadType {
  static const json = PayloadType._('JSON');
  static const formEncoded = PayloadType._('FORM_ENCODED');

  final String value;

  const PayloadType._(this.value);

  static const values = [json, formEncoded];

  static PayloadType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PayloadType._(value));

  @override
  bool operator ==(other) => other is PayloadType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The name of the field in the request payload that contains your customer's
/// username.
///
/// This data type is used in the <code>RequestInspection</code> and
/// <code>RequestInspectionACFP</code> data types.
///
/// @nodoc
class UsernameField {
  /// The name of the username field.
  ///
  /// How you specify this depends on the request inspection payload type.
  ///
  /// <ul>
  /// <li>
  /// For JSON payloads, specify the field name in JSON pointer syntax. For
  /// information about the JSON Pointer syntax, see the Internet Engineering Task
  /// Force (IETF) documentation <a
  /// href="https://tools.ietf.org/html/rfc6901">JavaScript Object Notation (JSON)
  /// Pointer</a>.
  ///
  /// For example, for the JSON payload <code>{ "form": { "username":
  /// "THE_USERNAME" } }</code>, the username field specification is
  /// <code>/form/username</code>.
  /// </li>
  /// <li>
  /// For form encoded payload types, use the HTML form names.
  ///
  /// For example, for an HTML form with the input element named
  /// <code>username1</code>, the username field specification is
  /// <code>username1</code>
  /// </li>
  /// </ul>
  final String identifier;

  UsernameField({
    required this.identifier,
  });

  factory UsernameField.fromJson(Map<String, dynamic> json) {
    return UsernameField(
      identifier: (json['Identifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      'Identifier': identifier,
    };
  }
}

/// The name of the field in the request payload that contains your customer's
/// password.
///
/// This data type is used in the <code>RequestInspection</code> and
/// <code>RequestInspectionACFP</code> data types.
///
/// @nodoc
class PasswordField {
  /// The name of the password field.
  ///
  /// How you specify this depends on the request inspection payload type.
  ///
  /// <ul>
  /// <li>
  /// For JSON payloads, specify the field name in JSON pointer syntax. For
  /// information about the JSON Pointer syntax, see the Internet Engineering Task
  /// Force (IETF) documentation <a
  /// href="https://tools.ietf.org/html/rfc6901">JavaScript Object Notation (JSON)
  /// Pointer</a>.
  ///
  /// For example, for the JSON payload <code>{ "form": { "password":
  /// "THE_PASSWORD" } }</code>, the password field specification is
  /// <code>/form/password</code>.
  /// </li>
  /// <li>
  /// For form encoded payload types, use the HTML form names.
  ///
  /// For example, for an HTML form with the input element named
  /// <code>password1</code>, the password field specification is
  /// <code>password1</code>.
  /// </li>
  /// </ul>
  final String identifier;

  PasswordField({
    required this.identifier,
  });

  factory PasswordField.fromJson(Map<String, dynamic> json) {
    return PasswordField(
      identifier: (json['Identifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      'Identifier': identifier,
    };
  }
}

/// Details for your use of the Bot Control managed rule group,
/// <code>AWSManagedRulesBotControlRuleSet</code>. This configuration is used in
/// <code>ManagedRuleGroupConfig</code>.
///
/// For additional information about this and the other intelligent threat
/// mitigation rule groups, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-managed-protections">Intelligent
/// threat mitigation in WAF</a> and <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-list">Amazon
/// Web Services Managed Rules rule groups list</a> in the <i>WAF Developer
/// Guide</i>.
///
/// @nodoc
class AWSManagedRulesBotControlRuleSet {
  /// The inspection level to use for the Bot Control rule group. The common level
  /// is the least expensive. The targeted level includes all common level rules
  /// and adds rules with more advanced inspection criteria. For details, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-bot.html">WAF
  /// Bot Control rule group</a> in the <i>WAF Developer Guide</i>.
  final InspectionLevel inspectionLevel;

  /// Applies only to the targeted inspection level.
  ///
  /// Determines whether to use machine learning (ML) to analyze your web traffic
  /// for bot-related activity. Machine learning is required for the Bot Control
  /// rules <code>TGT_ML_CoordinatedActivityLow</code> and
  /// <code>TGT_ML_CoordinatedActivityMedium</code>, which inspect for anomalous
  /// behavior that might indicate distributed, coordinated bot activity.
  ///
  /// For more information about this choice, see the listing for these rules in
  /// the table at <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-bot.html#aws-managed-rule-groups-bot-rules">Bot
  /// Control rules listing</a> in the <i>WAF Developer Guide</i>.
  ///
  /// Default: <code>TRUE</code>
  final bool? enableMachineLearning;

  AWSManagedRulesBotControlRuleSet({
    required this.inspectionLevel,
    this.enableMachineLearning,
  });

  factory AWSManagedRulesBotControlRuleSet.fromJson(Map<String, dynamic> json) {
    return AWSManagedRulesBotControlRuleSet(
      inspectionLevel: InspectionLevel.fromString(
          (json['InspectionLevel'] as String?) ?? ''),
      enableMachineLearning: json['EnableMachineLearning'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final inspectionLevel = this.inspectionLevel;
    final enableMachineLearning = this.enableMachineLearning;
    return {
      'InspectionLevel': inspectionLevel.value,
      if (enableMachineLearning != null)
        'EnableMachineLearning': enableMachineLearning,
    };
  }
}

/// Details for your use of the account takeover prevention managed rule group,
/// <code>AWSManagedRulesATPRuleSet</code>. This configuration is used in
/// <code>ManagedRuleGroupConfig</code>.
///
/// For additional information about this and the other intelligent threat
/// mitigation rule groups, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-managed-protections">Intelligent
/// threat mitigation in WAF</a> and <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-list">Amazon
/// Web Services Managed Rules rule groups list</a> in the <i>WAF Developer
/// Guide</i>.
///
/// @nodoc
class AWSManagedRulesATPRuleSet {
  /// The path of the login endpoint for your application. For example, for the
  /// URL <code>https://example.com/web/login</code>, you would provide the path
  /// <code>/web/login</code>. Login paths that start with the path that you
  /// provide are considered a match. For example <code>/web/login</code> matches
  /// the login paths <code>/web/login</code>, <code>/web/login/</code>,
  /// <code>/web/loginPage</code>, and <code>/web/login/thisPage</code>, but
  /// doesn't match the login path <code>/home/web/login</code> or
  /// <code>/website/login</code>.
  ///
  /// The rule group inspects only HTTP <code>POST</code> requests to your
  /// specified login endpoint.
  final String loginPath;

  /// Allow the use of regular expressions in the login page path.
  final bool? enableRegexInPath;

  /// The criteria for inspecting login requests, used by the ATP rule group to
  /// validate credentials usage.
  final RequestInspection? requestInspection;

  /// The criteria for inspecting responses to login requests, used by the ATP
  /// rule group to track login failure rates.
  /// <note>
  /// Response inspection is available only in web ACLs that protect Amazon
  /// CloudFront distributions.
  /// </note>
  /// The ATP rule group evaluates the responses that your protected resources
  /// send back to client login attempts, keeping count of successful and failed
  /// attempts for each IP address and client session. Using this information, the
  /// rule group labels and mitigates requests from client sessions and IP
  /// addresses that have had too many failed login attempts in a short amount of
  /// time.
  final ResponseInspection? responseInspection;

  AWSManagedRulesATPRuleSet({
    required this.loginPath,
    this.enableRegexInPath,
    this.requestInspection,
    this.responseInspection,
  });

  factory AWSManagedRulesATPRuleSet.fromJson(Map<String, dynamic> json) {
    return AWSManagedRulesATPRuleSet(
      loginPath: (json['LoginPath'] as String?) ?? '',
      enableRegexInPath: json['EnableRegexInPath'] as bool?,
      requestInspection: json['RequestInspection'] != null
          ? RequestInspection.fromJson(
              json['RequestInspection'] as Map<String, dynamic>)
          : null,
      responseInspection: json['ResponseInspection'] != null
          ? ResponseInspection.fromJson(
              json['ResponseInspection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final loginPath = this.loginPath;
    final enableRegexInPath = this.enableRegexInPath;
    final requestInspection = this.requestInspection;
    final responseInspection = this.responseInspection;
    return {
      'LoginPath': loginPath,
      if (enableRegexInPath != null) 'EnableRegexInPath': enableRegexInPath,
      if (requestInspection != null) 'RequestInspection': requestInspection,
      if (responseInspection != null) 'ResponseInspection': responseInspection,
    };
  }
}

/// Details for your use of the account creation fraud prevention managed rule
/// group, <code>AWSManagedRulesACFPRuleSet</code>. This configuration is used
/// in <code>ManagedRuleGroupConfig</code>.
///
/// For additional information about this and the other intelligent threat
/// mitigation rule groups, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-managed-protections">Intelligent
/// threat mitigation in WAF</a> and <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-list">Amazon
/// Web Services Managed Rules rule groups list</a> in the <i>WAF Developer
/// Guide</i>.
///
/// @nodoc
class AWSManagedRulesACFPRuleSet {
  /// The path of the account creation endpoint for your application. This is the
  /// page on your website that accepts the completed registration form for a new
  /// user. This page must accept <code>POST</code> requests.
  ///
  /// For example, for the URL <code>https://example.com/web/newaccount</code>,
  /// you would provide the path <code>/web/newaccount</code>. Account creation
  /// page paths that start with the path that you provide are considered a match.
  /// For example <code>/web/newaccount</code> matches the account creation paths
  /// <code>/web/newaccount</code>, <code>/web/newaccount/</code>,
  /// <code>/web/newaccountPage</code>, and <code>/web/newaccount/thisPage</code>,
  /// but doesn't match the path <code>/home/web/newaccount</code> or
  /// <code>/website/newaccount</code>.
  final String creationPath;

  /// The path of the account registration endpoint for your application. This is
  /// the page on your website that presents the registration form to new users.
  /// <note>
  /// This page must accept <code>GET</code> text/html requests.
  /// </note>
  /// For example, for the URL <code>https://example.com/web/registration</code>,
  /// you would provide the path <code>/web/registration</code>. Registration page
  /// paths that start with the path that you provide are considered a match. For
  /// example <code>/web/registration</code> matches the registration paths
  /// <code>/web/registration</code>, <code>/web/registration/</code>,
  /// <code>/web/registrationPage</code>, and
  /// <code>/web/registration/thisPage</code>, but doesn't match the path
  /// <code>/home/web/registration</code> or <code>/website/registration</code>.
  final String registrationPagePath;

  /// The criteria for inspecting account creation requests, used by the ACFP rule
  /// group to validate and track account creation attempts.
  final RequestInspectionACFP requestInspection;

  /// Allow the use of regular expressions in the registration page path and the
  /// account creation path.
  final bool? enableRegexInPath;

  /// The criteria for inspecting responses to account creation requests, used by
  /// the ACFP rule group to track account creation success rates.
  /// <note>
  /// Response inspection is available only in web ACLs that protect Amazon
  /// CloudFront distributions.
  /// </note>
  /// The ACFP rule group evaluates the responses that your protected resources
  /// send back to client account creation attempts, keeping count of successful
  /// and failed attempts from each IP address and client session. Using this
  /// information, the rule group labels and mitigates requests from client
  /// sessions and IP addresses that have had too many successful account creation
  /// attempts in a short amount of time.
  final ResponseInspection? responseInspection;

  AWSManagedRulesACFPRuleSet({
    required this.creationPath,
    required this.registrationPagePath,
    required this.requestInspection,
    this.enableRegexInPath,
    this.responseInspection,
  });

  factory AWSManagedRulesACFPRuleSet.fromJson(Map<String, dynamic> json) {
    return AWSManagedRulesACFPRuleSet(
      creationPath: (json['CreationPath'] as String?) ?? '',
      registrationPagePath: (json['RegistrationPagePath'] as String?) ?? '',
      requestInspection: RequestInspectionACFP.fromJson(
          (json['RequestInspection'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      enableRegexInPath: json['EnableRegexInPath'] as bool?,
      responseInspection: json['ResponseInspection'] != null
          ? ResponseInspection.fromJson(
              json['ResponseInspection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationPath = this.creationPath;
    final registrationPagePath = this.registrationPagePath;
    final requestInspection = this.requestInspection;
    final enableRegexInPath = this.enableRegexInPath;
    final responseInspection = this.responseInspection;
    return {
      'CreationPath': creationPath,
      'RegistrationPagePath': registrationPagePath,
      'RequestInspection': requestInspection,
      if (enableRegexInPath != null) 'EnableRegexInPath': enableRegexInPath,
      if (responseInspection != null) 'ResponseInspection': responseInspection,
    };
  }
}

/// Configures the use of the anti-DDoS managed rule group,
/// <code>AWSManagedRulesAntiDDoSRuleSet</code>. This configuration is used in
/// <code>ManagedRuleGroupConfig</code>.
///
/// The configuration that you provide here determines whether and how the rules
/// in the rule group are used.
///
/// For additional information about this and the other intelligent threat
/// mitigation rule groups, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-managed-protections">Intelligent
/// threat mitigation in WAF</a> and <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-list">Amazon
/// Web Services Managed Rules rule groups list</a> in the <i>WAF Developer
/// Guide</i>.
///
/// @nodoc
class AWSManagedRulesAntiDDoSRuleSet {
  /// Configures the request handling that's applied by the managed rule group
  /// rules <code>ChallengeAllDuringEvent</code> and
  /// <code>ChallengeDDoSRequests</code> during a distributed denial of service
  /// (DDoS) attack.
  final ClientSideActionConfig clientSideActionConfig;

  /// The sensitivity that the rule group rule <code>DDoSRequests</code> uses when
  /// matching against the DDoS suspicion labeling on a request. The managed rule
  /// group adds the labeling during DDoS events, before the
  /// <code>DDoSRequests</code> rule runs.
  ///
  /// The higher the sensitivity, the more levels of labeling that the rule
  /// matches:
  ///
  /// <ul>
  /// <li>
  /// Low sensitivity is less sensitive, causing the rule to match only on the
  /// most likely participants in an attack, which are the requests with the high
  /// suspicion label
  /// <code>awswaf:managed:aws:anti-ddos:high-suspicion-ddos-request</code>.
  /// </li>
  /// <li>
  /// Medium sensitivity causes the rule to match on the medium and high suspicion
  /// labels.
  /// </li>
  /// <li>
  /// High sensitivity causes the rule to match on all of the suspicion labels:
  /// low, medium, and high.
  /// </li>
  /// </ul>
  /// Default: <code>LOW</code>
  final SensitivityToAct? sensitivityToBlock;

  AWSManagedRulesAntiDDoSRuleSet({
    required this.clientSideActionConfig,
    this.sensitivityToBlock,
  });

  factory AWSManagedRulesAntiDDoSRuleSet.fromJson(Map<String, dynamic> json) {
    return AWSManagedRulesAntiDDoSRuleSet(
      clientSideActionConfig: ClientSideActionConfig.fromJson(
          (json['ClientSideActionConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sensitivityToBlock: (json['SensitivityToBlock'] as String?)
          ?.let(SensitivityToAct.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final clientSideActionConfig = this.clientSideActionConfig;
    final sensitivityToBlock = this.sensitivityToBlock;
    return {
      'ClientSideActionConfig': clientSideActionConfig,
      if (sensitivityToBlock != null)
        'SensitivityToBlock': sensitivityToBlock.value,
    };
  }
}

/// This is part of the configuration for the managed rules
/// <code>AWSManagedRulesAntiDDoSRuleSet</code> in
/// <code>ManagedRuleGroupConfig</code>.
///
/// @nodoc
class ClientSideActionConfig {
  /// Configuration for the use of the <code>AWSManagedRulesAntiDDoSRuleSet</code>
  /// rules <code>ChallengeAllDuringEvent</code> and
  /// <code>ChallengeDDoSRequests</code>.
  /// <note>
  /// This setting isn't related to the configuration of the
  /// <code>Challenge</code> action itself. It only configures the use of the two
  /// anti-DDoS rules named here.
  /// </note>
  /// You can enable or disable the use of these rules, and you can configure how
  /// to use them when they are enabled.
  final ClientSideAction challenge;

  ClientSideActionConfig({
    required this.challenge,
  });

  factory ClientSideActionConfig.fromJson(Map<String, dynamic> json) {
    return ClientSideActionConfig(
      challenge: ClientSideAction.fromJson(
          (json['Challenge'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final challenge = this.challenge;
    return {
      'Challenge': challenge,
    };
  }
}

/// @nodoc
class SensitivityToAct {
  static const low = SensitivityToAct._('LOW');
  static const medium = SensitivityToAct._('MEDIUM');
  static const high = SensitivityToAct._('HIGH');

  final String value;

  const SensitivityToAct._(this.value);

  static const values = [low, medium, high];

  static SensitivityToAct fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SensitivityToAct._(value));

  @override
  bool operator ==(other) => other is SensitivityToAct && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This is part of the <code>AWSManagedRulesAntiDDoSRuleSet</code>
/// <code>ClientSideActionConfig</code> configuration in
/// <code>ManagedRuleGroupConfig</code>.
///
/// @nodoc
class ClientSideAction {
  /// Determines whether to use the <code>AWSManagedRulesAntiDDoSRuleSet</code>
  /// rules <code>ChallengeAllDuringEvent</code> and
  /// <code>ChallengeDDoSRequests</code> in the rule group evaluation and the
  /// related label
  /// <code>awswaf:managed:aws:anti-ddos:challengeable-request</code>.
  ///
  /// <ul>
  /// <li>
  /// If usage is enabled:
  ///
  /// <ul>
  /// <li>
  /// The managed rule group adds the label
  /// <code>awswaf:managed:aws:anti-ddos:challengeable-request</code> to any web
  /// request whose URL does <i>NOT</i> match the regular expressions provided in
  /// the <code>ClientSideAction</code> setting
  /// <code>ExemptUriRegularExpressions</code>.
  /// </li>
  /// <li>
  /// The two rules are evaluated against web requests for protected resources
  /// that are experiencing a DDoS attack. The two rules only apply their action
  /// to matching requests that have the label
  /// <code>awswaf:managed:aws:anti-ddos:challengeable-request</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// If usage is disabled:
  ///
  /// <ul>
  /// <li>
  /// The managed rule group doesn't add the label
  /// <code>awswaf:managed:aws:anti-ddos:challengeable-request</code> to any web
  /// requests.
  /// </li>
  /// <li>
  /// The two rules are not evaluated.
  /// </li>
  /// <li>
  /// None of the other <code>ClientSideAction</code> settings have any effect.
  /// </li>
  /// </ul> </li>
  /// </ul> <note>
  /// This setting only enables or disables the use of the two anti-DDOS rules
  /// <code>ChallengeAllDuringEvent</code> and <code>ChallengeDDoSRequests</code>
  /// in the anti-DDoS managed rule group.
  ///
  /// This setting doesn't alter the action setting in the two rules. To override
  /// the actions used by the rules <code>ChallengeAllDuringEvent</code> and
  /// <code>ChallengeDDoSRequests</code>, enable this setting, and then override
  /// the rule actions in the usual way, in your managed rule group configuration.
  /// </note>
  final UsageOfAction usageOfAction;

  /// The regular expression to match against the web request URI, used to
  /// identify requests that can't handle a silent browser challenge. When the
  /// <code>ClientSideAction</code> setting <code>UsageOfAction</code> is enabled,
  /// the managed rule group uses this setting to determine which requests to
  /// label with <code>awswaf:managed:aws:anti-ddos:challengeable-request</code>.
  /// If <code>UsageOfAction</code> is disabled, this setting has no effect and
  /// the managed rule group doesn't add the label to any requests.
  ///
  /// The anti-DDoS managed rule group doesn't evaluate the rules
  /// <code>ChallengeDDoSRequests</code> or <code>ChallengeAllDuringEvent</code>
  /// for web requests whose URIs match this regex. This is true regardless of
  /// whether you override the rule action for either of the rules in your web ACL
  /// configuration.
  ///
  /// Amazon Web Services recommends using a regular expression.
  ///
  /// This setting is required if <code>UsageOfAction</code> is set to
  /// <code>ENABLED</code>. If required, you can provide between 1 and 5 regex
  /// objects in the array of settings.
  ///
  /// Amazon Web Services recommends starting with the following setting. Review
  /// and update it for your application's needs:
  ///
  /// <code>\/api\/|\.(acc|avi|css|gif|jpe?g|js|mp\[34\]|ogg|otf|pdf|png|tiff?|ttf|webm|webp|woff2?)$</code>
  final List<Regex>? exemptUriRegularExpressions;

  /// The sensitivity that the rule group rule <code>ChallengeDDoSRequests</code>
  /// uses when matching against the DDoS suspicion labeling on a request. The
  /// managed rule group adds the labeling during DDoS events, before the
  /// <code>ChallengeDDoSRequests</code> rule runs.
  ///
  /// The higher the sensitivity, the more levels of labeling that the rule
  /// matches:
  ///
  /// <ul>
  /// <li>
  /// Low sensitivity is less sensitive, causing the rule to match only on the
  /// most likely participants in an attack, which are the requests with the high
  /// suspicion label
  /// <code>awswaf:managed:aws:anti-ddos:high-suspicion-ddos-request</code>.
  /// </li>
  /// <li>
  /// Medium sensitivity causes the rule to match on the medium and high suspicion
  /// labels.
  /// </li>
  /// <li>
  /// High sensitivity causes the rule to match on all of the suspicion labels:
  /// low, medium, and high.
  /// </li>
  /// </ul>
  /// Default: <code>HIGH</code>
  final SensitivityToAct? sensitivity;

  ClientSideAction({
    required this.usageOfAction,
    this.exemptUriRegularExpressions,
    this.sensitivity,
  });

  factory ClientSideAction.fromJson(Map<String, dynamic> json) {
    return ClientSideAction(
      usageOfAction:
          UsageOfAction.fromString((json['UsageOfAction'] as String?) ?? ''),
      exemptUriRegularExpressions:
          (json['ExemptUriRegularExpressions'] as List?)
              ?.nonNulls
              .map((e) => Regex.fromJson(e as Map<String, dynamic>))
              .toList(),
      sensitivity:
          (json['Sensitivity'] as String?)?.let(SensitivityToAct.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final usageOfAction = this.usageOfAction;
    final exemptUriRegularExpressions = this.exemptUriRegularExpressions;
    final sensitivity = this.sensitivity;
    return {
      'UsageOfAction': usageOfAction.value,
      if (exemptUriRegularExpressions != null)
        'ExemptUriRegularExpressions': exemptUriRegularExpressions,
      if (sensitivity != null) 'Sensitivity': sensitivity.value,
    };
  }
}

/// @nodoc
class UsageOfAction {
  static const enabled = UsageOfAction._('ENABLED');
  static const disabled = UsageOfAction._('DISABLED');

  final String value;

  const UsageOfAction._(this.value);

  static const values = [enabled, disabled];

  static UsageOfAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UsageOfAction._(value));

  @override
  bool operator ==(other) => other is UsageOfAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A single regular expression. This is used in a <a>RegexPatternSet</a> and
/// also in the configuration for the Amazon Web Services Managed Rules rule
/// group <code>AWSManagedRulesAntiDDoSRuleSet</code>.
///
/// @nodoc
class Regex {
  /// The string representing the regular expression.
  final String? regexString;

  Regex({
    this.regexString,
  });

  factory Regex.fromJson(Map<String, dynamic> json) {
    return Regex(
      regexString: json['RegexString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final regexString = this.regexString;
    return {
      if (regexString != null) 'RegexString': regexString,
    };
  }
}

/// The criteria for inspecting account creation requests, used by the ACFP rule
/// group to validate and track account creation attempts.
///
/// This is part of the <code>AWSManagedRulesACFPRuleSet</code> configuration in
/// <code>ManagedRuleGroupConfig</code>.
///
/// In these settings, you specify how your application accepts account creation
/// attempts by providing the request payload type and the names of the fields
/// within the request body where the username, password, email, and primary
/// address and phone number fields are provided.
///
/// @nodoc
class RequestInspectionACFP {
  /// The payload type for your account creation endpoint, either JSON or form
  /// encoded.
  final PayloadType payloadType;

  /// The names of the fields in the request payload that contain your customer's
  /// primary physical address.
  ///
  /// Order the address fields in the array exactly as they are ordered in the
  /// request payload.
  ///
  /// How you specify the address fields depends on the request inspection payload
  /// type.
  ///
  /// <ul>
  /// <li>
  /// For JSON payloads, specify the field identifiers in JSON pointer syntax. For
  /// information about the JSON Pointer syntax, see the Internet Engineering Task
  /// Force (IETF) documentation <a
  /// href="https://tools.ietf.org/html/rfc6901">JavaScript Object Notation (JSON)
  /// Pointer</a>.
  ///
  /// For example, for the JSON payload <code>{ "form": { "primaryaddressline1":
  /// "THE_ADDRESS1", "primaryaddressline2": "THE_ADDRESS2",
  /// "primaryaddressline3": "THE_ADDRESS3" } }</code>, the address field
  /// idenfiers are <code>/form/primaryaddressline1</code>,
  /// <code>/form/primaryaddressline2</code>, and
  /// <code>/form/primaryaddressline3</code>.
  /// </li>
  /// <li>
  /// For form encoded payload types, use the HTML form names.
  ///
  /// For example, for an HTML form with input elements named
  /// <code>primaryaddressline1</code>, <code>primaryaddressline2</code>, and
  /// <code>primaryaddressline3</code>, the address fields identifiers are
  /// <code>primaryaddressline1</code>, <code>primaryaddressline2</code>, and
  /// <code>primaryaddressline3</code>.
  /// </li>
  /// </ul>
  final List<AddressField>? addressFields;

  /// The name of the field in the request payload that contains your customer's
  /// email.
  ///
  /// How you specify this depends on the request inspection payload type.
  ///
  /// <ul>
  /// <li>
  /// For JSON payloads, specify the field name in JSON pointer syntax. For
  /// information about the JSON Pointer syntax, see the Internet Engineering Task
  /// Force (IETF) documentation <a
  /// href="https://tools.ietf.org/html/rfc6901">JavaScript Object Notation (JSON)
  /// Pointer</a>.
  ///
  /// For example, for the JSON payload <code>{ "form": { "email": "THE_EMAIL" }
  /// }</code>, the email field specification is <code>/form/email</code>.
  /// </li>
  /// <li>
  /// For form encoded payload types, use the HTML form names.
  ///
  /// For example, for an HTML form with the input element named
  /// <code>email1</code>, the email field specification is <code>email1</code>.
  /// </li>
  /// </ul>
  final EmailField? emailField;

  /// The name of the field in the request payload that contains your customer's
  /// password.
  ///
  /// How you specify this depends on the request inspection payload type.
  ///
  /// <ul>
  /// <li>
  /// For JSON payloads, specify the field name in JSON pointer syntax. For
  /// information about the JSON Pointer syntax, see the Internet Engineering Task
  /// Force (IETF) documentation <a
  /// href="https://tools.ietf.org/html/rfc6901">JavaScript Object Notation (JSON)
  /// Pointer</a>.
  ///
  /// For example, for the JSON payload <code>{ "form": { "password":
  /// "THE_PASSWORD" } }</code>, the password field specification is
  /// <code>/form/password</code>.
  /// </li>
  /// <li>
  /// For form encoded payload types, use the HTML form names.
  ///
  /// For example, for an HTML form with the input element named
  /// <code>password1</code>, the password field specification is
  /// <code>password1</code>.
  /// </li>
  /// </ul>
  final PasswordField? passwordField;

  /// The names of the fields in the request payload that contain your customer's
  /// primary phone number.
  ///
  /// Order the phone number fields in the array exactly as they are ordered in
  /// the request payload.
  ///
  /// How you specify the phone number fields depends on the request inspection
  /// payload type.
  ///
  /// <ul>
  /// <li>
  /// For JSON payloads, specify the field identifiers in JSON pointer syntax. For
  /// information about the JSON Pointer syntax, see the Internet Engineering Task
  /// Force (IETF) documentation <a
  /// href="https://tools.ietf.org/html/rfc6901">JavaScript Object Notation (JSON)
  /// Pointer</a>.
  ///
  /// For example, for the JSON payload <code>{ "form": { "primaryphoneline1":
  /// "THE_PHONE1", "primaryphoneline2": "THE_PHONE2", "primaryphoneline3":
  /// "THE_PHONE3" } }</code>, the phone number field identifiers are
  /// <code>/form/primaryphoneline1</code>, <code>/form/primaryphoneline2</code>,
  /// and <code>/form/primaryphoneline3</code>.
  /// </li>
  /// <li>
  /// For form encoded payload types, use the HTML form names.
  ///
  /// For example, for an HTML form with input elements named
  /// <code>primaryphoneline1</code>, <code>primaryphoneline2</code>, and
  /// <code>primaryphoneline3</code>, the phone number field identifiers are
  /// <code>primaryphoneline1</code>, <code>primaryphoneline2</code>, and
  /// <code>primaryphoneline3</code>.
  /// </li>
  /// </ul>
  final List<PhoneNumberField>? phoneNumberFields;

  /// The name of the field in the request payload that contains your customer's
  /// username.
  ///
  /// How you specify this depends on the request inspection payload type.
  ///
  /// <ul>
  /// <li>
  /// For JSON payloads, specify the field name in JSON pointer syntax. For
  /// information about the JSON Pointer syntax, see the Internet Engineering Task
  /// Force (IETF) documentation <a
  /// href="https://tools.ietf.org/html/rfc6901">JavaScript Object Notation (JSON)
  /// Pointer</a>.
  ///
  /// For example, for the JSON payload <code>{ "form": { "username":
  /// "THE_USERNAME" } }</code>, the username field specification is
  /// <code>/form/username</code>.
  /// </li>
  /// <li>
  /// For form encoded payload types, use the HTML form names.
  ///
  /// For example, for an HTML form with the input element named
  /// <code>username1</code>, the username field specification is
  /// <code>username1</code>
  /// </li>
  /// </ul>
  final UsernameField? usernameField;

  RequestInspectionACFP({
    required this.payloadType,
    this.addressFields,
    this.emailField,
    this.passwordField,
    this.phoneNumberFields,
    this.usernameField,
  });

  factory RequestInspectionACFP.fromJson(Map<String, dynamic> json) {
    return RequestInspectionACFP(
      payloadType:
          PayloadType.fromString((json['PayloadType'] as String?) ?? ''),
      addressFields: (json['AddressFields'] as List?)
          ?.nonNulls
          .map((e) => AddressField.fromJson(e as Map<String, dynamic>))
          .toList(),
      emailField: json['EmailField'] != null
          ? EmailField.fromJson(json['EmailField'] as Map<String, dynamic>)
          : null,
      passwordField: json['PasswordField'] != null
          ? PasswordField.fromJson(
              json['PasswordField'] as Map<String, dynamic>)
          : null,
      phoneNumberFields: (json['PhoneNumberFields'] as List?)
          ?.nonNulls
          .map((e) => PhoneNumberField.fromJson(e as Map<String, dynamic>))
          .toList(),
      usernameField: json['UsernameField'] != null
          ? UsernameField.fromJson(
              json['UsernameField'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final payloadType = this.payloadType;
    final addressFields = this.addressFields;
    final emailField = this.emailField;
    final passwordField = this.passwordField;
    final phoneNumberFields = this.phoneNumberFields;
    final usernameField = this.usernameField;
    return {
      'PayloadType': payloadType.value,
      if (addressFields != null) 'AddressFields': addressFields,
      if (emailField != null) 'EmailField': emailField,
      if (passwordField != null) 'PasswordField': passwordField,
      if (phoneNumberFields != null) 'PhoneNumberFields': phoneNumberFields,
      if (usernameField != null) 'UsernameField': usernameField,
    };
  }
}

/// The criteria for inspecting responses to login requests and account creation
/// requests, used by the ATP and ACFP rule groups to track login and account
/// creation success and failure rates.
/// <note>
/// Response inspection is available only in web ACLs that protect Amazon
/// CloudFront distributions.
/// </note>
/// The rule groups evaluates the responses that your protected resources send
/// back to client login and account creation attempts, keeping count of
/// successful and failed attempts from each IP address and client session.
/// Using this information, the rule group labels and mitigates requests from
/// client sessions and IP addresses with too much suspicious activity in a
/// short amount of time.
///
/// This is part of the <code>AWSManagedRulesATPRuleSet</code> and
/// <code>AWSManagedRulesACFPRuleSet</code> configurations in
/// <code>ManagedRuleGroupConfig</code>.
///
/// Enable response inspection by configuring exactly one component of the
/// response to inspect, for example, <code>Header</code> or
/// <code>StatusCode</code>. You can't configure more than one component for
/// inspection. If you don't configure any of the response inspection options,
/// response inspection is disabled.
///
/// @nodoc
class ResponseInspection {
  /// Configures inspection of the response body for success and failure
  /// indicators. WAF can inspect the first 65,536 bytes (64 KB) of the response
  /// body.
  final ResponseInspectionBodyContains? bodyContains;

  /// Configures inspection of the response header for success and failure
  /// indicators.
  final ResponseInspectionHeader? header;

  /// Configures inspection of the response JSON for success and failure
  /// indicators. WAF can inspect the first 65,536 bytes (64 KB) of the response
  /// JSON.
  final ResponseInspectionJson? json;

  /// Configures inspection of the response status code for success and failure
  /// indicators.
  final ResponseInspectionStatusCode? statusCode;

  ResponseInspection({
    this.bodyContains,
    this.header,
    this.json,
    this.statusCode,
  });

  factory ResponseInspection.fromJson(Map<String, dynamic> json) {
    return ResponseInspection(
      bodyContains: json['BodyContains'] != null
          ? ResponseInspectionBodyContains.fromJson(
              json['BodyContains'] as Map<String, dynamic>)
          : null,
      header: json['Header'] != null
          ? ResponseInspectionHeader.fromJson(
              json['Header'] as Map<String, dynamic>)
          : null,
      json: json['Json'] != null
          ? ResponseInspectionJson.fromJson(
              json['Json'] as Map<String, dynamic>)
          : null,
      statusCode: json['StatusCode'] != null
          ? ResponseInspectionStatusCode.fromJson(
              json['StatusCode'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bodyContains = this.bodyContains;
    final header = this.header;
    final json = this.json;
    final statusCode = this.statusCode;
    return {
      if (bodyContains != null) 'BodyContains': bodyContains,
      if (header != null) 'Header': header,
      if (json != null) 'Json': json,
      if (statusCode != null) 'StatusCode': statusCode,
    };
  }
}

/// Configures inspection of the response status code. This is part of the
/// <code>ResponseInspection</code> configuration for
/// <code>AWSManagedRulesATPRuleSet</code> and
/// <code>AWSManagedRulesACFPRuleSet</code>.
/// <note>
/// Response inspection is available only in web ACLs that protect Amazon
/// CloudFront distributions.
/// </note>
///
/// @nodoc
class ResponseInspectionStatusCode {
  /// Status codes in the response that indicate a failed login or account
  /// creation attempt. To be counted as a failure, the response status code must
  /// match one of these. Each code must be unique among the success and failure
  /// status codes.
  ///
  /// JSON example: <code>"FailureCodes": \[ 400, 404 \]</code>
  final List<int> failureCodes;

  /// Status codes in the response that indicate a successful login or account
  /// creation attempt. To be counted as a success, the response status code must
  /// match one of these. Each code must be unique among the success and failure
  /// status codes.
  ///
  /// JSON example: <code>"SuccessCodes": \[ 200, 201 \]</code>
  final List<int> successCodes;

  ResponseInspectionStatusCode({
    required this.failureCodes,
    required this.successCodes,
  });

  factory ResponseInspectionStatusCode.fromJson(Map<String, dynamic> json) {
    return ResponseInspectionStatusCode(
      failureCodes: ((json['FailureCodes'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as int)
          .toList(),
      successCodes: ((json['SuccessCodes'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failureCodes = this.failureCodes;
    final successCodes = this.successCodes;
    return {
      'FailureCodes': failureCodes,
      'SuccessCodes': successCodes,
    };
  }
}

/// Configures inspection of the response header. This is part of the
/// <code>ResponseInspection</code> configuration for
/// <code>AWSManagedRulesATPRuleSet</code> and
/// <code>AWSManagedRulesACFPRuleSet</code>.
/// <note>
/// Response inspection is available only in web ACLs that protect Amazon
/// CloudFront distributions.
/// </note>
///
/// @nodoc
class ResponseInspectionHeader {
  /// Values in the response header with the specified name that indicate a failed
  /// login or account creation attempt. To be counted as a failure, the value
  /// must be an exact match, including case. Each value must be unique among the
  /// success and failure values.
  ///
  /// JSON examples: <code>"FailureValues": \[ "LoginFailed", "Failed login"
  /// \]</code> and <code>"FailureValues": \[ "AccountCreationFailed" \]</code>
  final List<String> failureValues;

  /// The name of the header to match against. The name must be an exact match,
  /// including case.
  ///
  /// JSON example: <code>"Name": \[ "RequestResult" \]</code>
  final String name;

  /// Values in the response header with the specified name that indicate a
  /// successful login or account creation attempt. To be counted as a success,
  /// the value must be an exact match, including case. Each value must be unique
  /// among the success and failure values.
  ///
  /// JSON examples: <code>"SuccessValues": \[ "LoginPassed", "Successful login"
  /// \]</code> and <code>"SuccessValues": \[ "AccountCreated", "Successful
  /// account creation" \]</code>
  final List<String> successValues;

  ResponseInspectionHeader({
    required this.failureValues,
    required this.name,
    required this.successValues,
  });

  factory ResponseInspectionHeader.fromJson(Map<String, dynamic> json) {
    return ResponseInspectionHeader(
      failureValues: ((json['FailureValues'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      name: (json['Name'] as String?) ?? '',
      successValues: ((json['SuccessValues'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failureValues = this.failureValues;
    final name = this.name;
    final successValues = this.successValues;
    return {
      'FailureValues': failureValues,
      'Name': name,
      'SuccessValues': successValues,
    };
  }
}

/// Configures inspection of the response body. WAF can inspect the first 65,536
/// bytes (64 KB) of the response body. This is part of the
/// <code>ResponseInspection</code> configuration for
/// <code>AWSManagedRulesATPRuleSet</code> and
/// <code>AWSManagedRulesACFPRuleSet</code>.
/// <note>
/// Response inspection is available only in web ACLs that protect Amazon
/// CloudFront distributions.
/// </note>
///
/// @nodoc
class ResponseInspectionBodyContains {
  /// Strings in the body of the response that indicate a failed login or account
  /// creation attempt. To be counted as a failure, the string can be anywhere in
  /// the body and must be an exact match, including case. Each string must be
  /// unique among the success and failure strings.
  ///
  /// JSON example: <code>"FailureStrings": \[ "Request failed" \]</code>
  final List<String> failureStrings;

  /// Strings in the body of the response that indicate a successful login or
  /// account creation attempt. To be counted as a success, the string can be
  /// anywhere in the body and must be an exact match, including case. Each string
  /// must be unique among the success and failure strings.
  ///
  /// JSON examples: <code>"SuccessStrings": \[ "Login successful" \]</code> and
  /// <code>"SuccessStrings": \[ "Account creation successful", "Welcome to our
  /// site!" \]</code>
  final List<String> successStrings;

  ResponseInspectionBodyContains({
    required this.failureStrings,
    required this.successStrings,
  });

  factory ResponseInspectionBodyContains.fromJson(Map<String, dynamic> json) {
    return ResponseInspectionBodyContains(
      failureStrings: ((json['FailureStrings'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      successStrings: ((json['SuccessStrings'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failureStrings = this.failureStrings;
    final successStrings = this.successStrings;
    return {
      'FailureStrings': failureStrings,
      'SuccessStrings': successStrings,
    };
  }
}

/// Configures inspection of the response JSON. WAF can inspect the first 65,536
/// bytes (64 KB) of the response JSON. This is part of the
/// <code>ResponseInspection</code> configuration for
/// <code>AWSManagedRulesATPRuleSet</code> and
/// <code>AWSManagedRulesACFPRuleSet</code>.
/// <note>
/// Response inspection is available only in web ACLs that protect Amazon
/// CloudFront distributions.
/// </note>
///
/// @nodoc
class ResponseInspectionJson {
  /// Values for the specified identifier in the response JSON that indicate a
  /// failed login or account creation attempt. To be counted as a failure, the
  /// value must be an exact match, including case. Each value must be unique
  /// among the success and failure values.
  ///
  /// JSON example: <code>"FailureValues": \[ "False", "Failed" \]</code>
  final List<String> failureValues;

  /// The identifier for the value to match against in the JSON. The identifier
  /// must be an exact match, including case.
  ///
  /// JSON examples: <code>"Identifier": \[ "/login/success" \]</code> and
  /// <code>"Identifier": \[ "/sign-up/success" \]</code>
  final String identifier;

  /// Values for the specified identifier in the response JSON that indicate a
  /// successful login or account creation attempt. To be counted as a success,
  /// the value must be an exact match, including case. Each value must be unique
  /// among the success and failure values.
  ///
  /// JSON example: <code>"SuccessValues": \[ "True", "Succeeded" \]</code>
  final List<String> successValues;

  ResponseInspectionJson({
    required this.failureValues,
    required this.identifier,
    required this.successValues,
  });

  factory ResponseInspectionJson.fromJson(Map<String, dynamic> json) {
    return ResponseInspectionJson(
      failureValues: ((json['FailureValues'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      identifier: (json['Identifier'] as String?) ?? '',
      successValues: ((json['SuccessValues'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failureValues = this.failureValues;
    final identifier = this.identifier;
    final successValues = this.successValues;
    return {
      'FailureValues': failureValues,
      'Identifier': identifier,
      'SuccessValues': successValues,
    };
  }
}

/// The name of the field in the request payload that contains your customer's
/// email.
///
/// This data type is used in the <code>RequestInspectionACFP</code> data type.
///
/// @nodoc
class EmailField {
  /// The name of the email field.
  ///
  /// How you specify this depends on the request inspection payload type.
  ///
  /// <ul>
  /// <li>
  /// For JSON payloads, specify the field name in JSON pointer syntax. For
  /// information about the JSON Pointer syntax, see the Internet Engineering Task
  /// Force (IETF) documentation <a
  /// href="https://tools.ietf.org/html/rfc6901">JavaScript Object Notation (JSON)
  /// Pointer</a>.
  ///
  /// For example, for the JSON payload <code>{ "form": { "email": "THE_EMAIL" }
  /// }</code>, the email field specification is <code>/form/email</code>.
  /// </li>
  /// <li>
  /// For form encoded payload types, use the HTML form names.
  ///
  /// For example, for an HTML form with the input element named
  /// <code>email1</code>, the email field specification is <code>email1</code>.
  /// </li>
  /// </ul>
  final String identifier;

  EmailField({
    required this.identifier,
  });

  factory EmailField.fromJson(Map<String, dynamic> json) {
    return EmailField(
      identifier: (json['Identifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      'Identifier': identifier,
    };
  }
}

/// The name of a field in the request payload that contains part or all of your
/// customer's primary physical address.
///
/// This data type is used in the <code>RequestInspectionACFP</code> data type.
///
/// @nodoc
class AddressField {
  /// The name of a single primary address field.
  ///
  /// How you specify the address fields depends on the request inspection payload
  /// type.
  ///
  /// <ul>
  /// <li>
  /// For JSON payloads, specify the field identifiers in JSON pointer syntax. For
  /// information about the JSON Pointer syntax, see the Internet Engineering Task
  /// Force (IETF) documentation <a
  /// href="https://tools.ietf.org/html/rfc6901">JavaScript Object Notation (JSON)
  /// Pointer</a>.
  ///
  /// For example, for the JSON payload <code>{ "form": { "primaryaddressline1":
  /// "THE_ADDRESS1", "primaryaddressline2": "THE_ADDRESS2",
  /// "primaryaddressline3": "THE_ADDRESS3" } }</code>, the address field
  /// idenfiers are <code>/form/primaryaddressline1</code>,
  /// <code>/form/primaryaddressline2</code>, and
  /// <code>/form/primaryaddressline3</code>.
  /// </li>
  /// <li>
  /// For form encoded payload types, use the HTML form names.
  ///
  /// For example, for an HTML form with input elements named
  /// <code>primaryaddressline1</code>, <code>primaryaddressline2</code>, and
  /// <code>primaryaddressline3</code>, the address fields identifiers are
  /// <code>primaryaddressline1</code>, <code>primaryaddressline2</code>, and
  /// <code>primaryaddressline3</code>.
  /// </li>
  /// </ul>
  final String identifier;

  AddressField({
    required this.identifier,
  });

  factory AddressField.fromJson(Map<String, dynamic> json) {
    return AddressField(
      identifier: (json['Identifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      'Identifier': identifier,
    };
  }
}

/// The name of a field in the request payload that contains part or all of your
/// customer's primary phone number.
///
/// This data type is used in the <code>RequestInspectionACFP</code> data type.
///
/// @nodoc
class PhoneNumberField {
  /// The name of a single primary phone number field.
  ///
  /// How you specify the phone number fields depends on the request inspection
  /// payload type.
  ///
  /// <ul>
  /// <li>
  /// For JSON payloads, specify the field identifiers in JSON pointer syntax. For
  /// information about the JSON Pointer syntax, see the Internet Engineering Task
  /// Force (IETF) documentation <a
  /// href="https://tools.ietf.org/html/rfc6901">JavaScript Object Notation (JSON)
  /// Pointer</a>.
  ///
  /// For example, for the JSON payload <code>{ "form": { "primaryphoneline1":
  /// "THE_PHONE1", "primaryphoneline2": "THE_PHONE2", "primaryphoneline3":
  /// "THE_PHONE3" } }</code>, the phone number field identifiers are
  /// <code>/form/primaryphoneline1</code>, <code>/form/primaryphoneline2</code>,
  /// and <code>/form/primaryphoneline3</code>.
  /// </li>
  /// <li>
  /// For form encoded payload types, use the HTML form names.
  ///
  /// For example, for an HTML form with input elements named
  /// <code>primaryphoneline1</code>, <code>primaryphoneline2</code>, and
  /// <code>primaryphoneline3</code>, the phone number field identifiers are
  /// <code>primaryphoneline1</code>, <code>primaryphoneline2</code>, and
  /// <code>primaryphoneline3</code>.
  /// </li>
  /// </ul>
  final String identifier;

  PhoneNumberField({
    required this.identifier,
  });

  factory PhoneNumberField.fromJson(Map<String, dynamic> json) {
    return PhoneNumberField(
      identifier: (json['Identifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      'Identifier': identifier,
    };
  }
}

/// The criteria for inspecting login requests, used by the ATP rule group to
/// validate credentials usage.
///
/// This is part of the <code>AWSManagedRulesATPRuleSet</code> configuration in
/// <code>ManagedRuleGroupConfig</code>.
///
/// In these settings, you specify how your application accepts login attempts
/// by providing the request payload type and the names of the fields within the
/// request body where the username and password are provided.
///
/// @nodoc
class RequestInspection {
  /// The name of the field in the request payload that contains your customer's
  /// password.
  ///
  /// How you specify this depends on the request inspection payload type.
  ///
  /// <ul>
  /// <li>
  /// For JSON payloads, specify the field name in JSON pointer syntax. For
  /// information about the JSON Pointer syntax, see the Internet Engineering Task
  /// Force (IETF) documentation <a
  /// href="https://tools.ietf.org/html/rfc6901">JavaScript Object Notation (JSON)
  /// Pointer</a>.
  ///
  /// For example, for the JSON payload <code>{ "form": { "password":
  /// "THE_PASSWORD" } }</code>, the password field specification is
  /// <code>/form/password</code>.
  /// </li>
  /// <li>
  /// For form encoded payload types, use the HTML form names.
  ///
  /// For example, for an HTML form with the input element named
  /// <code>password1</code>, the password field specification is
  /// <code>password1</code>.
  /// </li>
  /// </ul>
  final PasswordField passwordField;

  /// The payload type for your login endpoint, either JSON or form encoded.
  final PayloadType payloadType;

  /// The name of the field in the request payload that contains your customer's
  /// username.
  ///
  /// How you specify this depends on the request inspection payload type.
  ///
  /// <ul>
  /// <li>
  /// For JSON payloads, specify the field name in JSON pointer syntax. For
  /// information about the JSON Pointer syntax, see the Internet Engineering Task
  /// Force (IETF) documentation <a
  /// href="https://tools.ietf.org/html/rfc6901">JavaScript Object Notation (JSON)
  /// Pointer</a>.
  ///
  /// For example, for the JSON payload <code>{ "form": { "username":
  /// "THE_USERNAME" } }</code>, the username field specification is
  /// <code>/form/username</code>.
  /// </li>
  /// <li>
  /// For form encoded payload types, use the HTML form names.
  ///
  /// For example, for an HTML form with the input element named
  /// <code>username1</code>, the username field specification is
  /// <code>username1</code>
  /// </li>
  /// </ul>
  final UsernameField usernameField;

  RequestInspection({
    required this.passwordField,
    required this.payloadType,
    required this.usernameField,
  });

  factory RequestInspection.fromJson(Map<String, dynamic> json) {
    return RequestInspection(
      passwordField: PasswordField.fromJson(
          (json['PasswordField'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      payloadType:
          PayloadType.fromString((json['PayloadType'] as String?) ?? ''),
      usernameField: UsernameField.fromJson(
          (json['UsernameField'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final passwordField = this.passwordField;
    final payloadType = this.payloadType;
    final usernameField = this.usernameField;
    return {
      'PasswordField': passwordField,
      'PayloadType': payloadType.value,
      'UsernameField': usernameField,
    };
  }
}

/// @nodoc
class InspectionLevel {
  static const common = InspectionLevel._('COMMON');
  static const targeted = InspectionLevel._('TARGETED');

  final String value;

  const InspectionLevel._(this.value);

  static const values = [common, targeted];

  static InspectionLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InspectionLevel._(value));

  @override
  bool operator ==(other) => other is InspectionLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies a single rule in a rule group whose action you want to override to
/// <code>Count</code>.
/// <note>
/// Instead of this option, use <code>RuleActionOverrides</code>. It accepts any
/// valid action setting, including <code>Count</code>.
/// </note>
///
/// @nodoc
class ExcludedRule {
  /// The name of the rule whose action you want to override to
  /// <code>Count</code>.
  final String name;

  ExcludedRule({
    required this.name,
  });

  factory ExcludedRule.fromJson(Map<String, dynamic> json) {
    return ExcludedRule(
      name: (json['Name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

/// @nodoc
class RateBasedStatementAggregateKeyType {
  static const ip = RateBasedStatementAggregateKeyType._('IP');
  static const forwardedIp =
      RateBasedStatementAggregateKeyType._('FORWARDED_IP');
  static const customKeys = RateBasedStatementAggregateKeyType._('CUSTOM_KEYS');
  static const constant = RateBasedStatementAggregateKeyType._('CONSTANT');

  final String value;

  const RateBasedStatementAggregateKeyType._(this.value);

  static const values = [ip, forwardedIp, customKeys, constant];

  static RateBasedStatementAggregateKeyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RateBasedStatementAggregateKeyType._(value));

  @override
  bool operator ==(other) =>
      other is RateBasedStatementAggregateKeyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies a single custom aggregate key for a rate-base rule.
/// <note>
/// Web requests that are missing any of the components specified in the
/// aggregation keys are omitted from the rate-based rule evaluation and
/// handling.
/// </note>
///
/// @nodoc
class RateBasedStatementCustomKey {
  /// Use an Autonomous System Number (ASN) derived from the request's originating
  /// or forwarded IP address as an aggregate key. Each distinct ASN contributes
  /// to the aggregation instance.
  final RateLimitAsn? asn;

  /// Use the value of a cookie in the request as an aggregate key. Each distinct
  /// value in the cookie contributes to the aggregation instance. If you use a
  /// single cookie as your custom key, then each value fully defines an
  /// aggregation instance.
  final RateLimitCookie? cookie;

  /// Use the first IP address in an HTTP header as an aggregate key. Each
  /// distinct forwarded IP address contributes to the aggregation instance.
  ///
  /// When you specify an IP or forwarded IP in the custom key settings, you must
  /// also specify at least one other key to use. You can aggregate on only the
  /// forwarded IP address by specifying <code>FORWARDED_IP</code> in your
  /// rate-based statement's <code>AggregateKeyType</code>.
  ///
  /// With this option, you must specify the header to use in the rate-based
  /// rule's <code>ForwardedIPConfig</code> property.
  final RateLimitForwardedIP? forwardedIP;

  /// Use the request's HTTP method as an aggregate key. Each distinct HTTP method
  /// contributes to the aggregation instance. If you use just the HTTP method as
  /// your custom key, then each method fully defines an aggregation instance.
  final RateLimitHTTPMethod? hTTPMethod;

  /// Use the value of a header in the request as an aggregate key. Each distinct
  /// value in the header contributes to the aggregation instance. If you use a
  /// single header as your custom key, then each value fully defines an
  /// aggregation instance.
  final RateLimitHeader? header;

  /// Use the request's originating IP address as an aggregate key. Each distinct
  /// IP address contributes to the aggregation instance.
  ///
  /// When you specify an IP or forwarded IP in the custom key settings, you must
  /// also specify at least one other key to use. You can aggregate on only the IP
  /// address by specifying <code>IP</code> in your rate-based statement's
  /// <code>AggregateKeyType</code>.
  final RateLimitIP? ip;

  /// Use the request's JA3 fingerprint as an aggregate key. If you use a single
  /// JA3 fingerprint as your custom key, then each value fully defines an
  /// aggregation instance.
  final RateLimitJA3Fingerprint? jA3Fingerprint;

  /// Use the request's JA4 fingerprint as an aggregate key. If you use a single
  /// JA4 fingerprint as your custom key, then each value fully defines an
  /// aggregation instance.
  final RateLimitJA4Fingerprint? jA4Fingerprint;

  /// Use the specified label namespace as an aggregate key. Each distinct fully
  /// qualified label name that has the specified label namespace contributes to
  /// the aggregation instance. If you use just one label namespace as your custom
  /// key, then each label name fully defines an aggregation instance.
  ///
  /// This uses only labels that have been added to the request by rules that are
  /// evaluated before this rate-based rule in the web ACL.
  ///
  /// For information about label namespaces and names, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-label-requirements.html">Label
  /// syntax and naming requirements</a> in the <i>WAF Developer Guide</i>.
  final RateLimitLabelNamespace? labelNamespace;

  /// Use the specified query argument as an aggregate key. Each distinct value
  /// for the named query argument contributes to the aggregation instance. If you
  /// use a single query argument as your custom key, then each value fully
  /// defines an aggregation instance.
  final RateLimitQueryArgument? queryArgument;

  /// Use the request's query string as an aggregate key. Each distinct string
  /// contributes to the aggregation instance. If you use just the query string as
  /// your custom key, then each string fully defines an aggregation instance.
  final RateLimitQueryString? queryString;

  /// Use the request's URI path as an aggregate key. Each distinct URI path
  /// contributes to the aggregation instance. If you use just the URI path as
  /// your custom key, then each URI path fully defines an aggregation instance.
  final RateLimitUriPath? uriPath;

  RateBasedStatementCustomKey({
    this.asn,
    this.cookie,
    this.forwardedIP,
    this.hTTPMethod,
    this.header,
    this.ip,
    this.jA3Fingerprint,
    this.jA4Fingerprint,
    this.labelNamespace,
    this.queryArgument,
    this.queryString,
    this.uriPath,
  });

  factory RateBasedStatementCustomKey.fromJson(Map<String, dynamic> json) {
    return RateBasedStatementCustomKey(
      asn: json['ASN'] != null
          ? RateLimitAsn.fromJson(json['ASN'] as Map<String, dynamic>)
          : null,
      cookie: json['Cookie'] != null
          ? RateLimitCookie.fromJson(json['Cookie'] as Map<String, dynamic>)
          : null,
      forwardedIP: json['ForwardedIP'] != null
          ? RateLimitForwardedIP.fromJson(
              json['ForwardedIP'] as Map<String, dynamic>)
          : null,
      hTTPMethod: json['HTTPMethod'] != null
          ? RateLimitHTTPMethod.fromJson(
              json['HTTPMethod'] as Map<String, dynamic>)
          : null,
      header: json['Header'] != null
          ? RateLimitHeader.fromJson(json['Header'] as Map<String, dynamic>)
          : null,
      ip: json['IP'] != null
          ? RateLimitIP.fromJson(json['IP'] as Map<String, dynamic>)
          : null,
      jA3Fingerprint: json['JA3Fingerprint'] != null
          ? RateLimitJA3Fingerprint.fromJson(
              json['JA3Fingerprint'] as Map<String, dynamic>)
          : null,
      jA4Fingerprint: json['JA4Fingerprint'] != null
          ? RateLimitJA4Fingerprint.fromJson(
              json['JA4Fingerprint'] as Map<String, dynamic>)
          : null,
      labelNamespace: json['LabelNamespace'] != null
          ? RateLimitLabelNamespace.fromJson(
              json['LabelNamespace'] as Map<String, dynamic>)
          : null,
      queryArgument: json['QueryArgument'] != null
          ? RateLimitQueryArgument.fromJson(
              json['QueryArgument'] as Map<String, dynamic>)
          : null,
      queryString: json['QueryString'] != null
          ? RateLimitQueryString.fromJson(
              json['QueryString'] as Map<String, dynamic>)
          : null,
      uriPath: json['UriPath'] != null
          ? RateLimitUriPath.fromJson(json['UriPath'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final asn = this.asn;
    final cookie = this.cookie;
    final forwardedIP = this.forwardedIP;
    final hTTPMethod = this.hTTPMethod;
    final header = this.header;
    final ip = this.ip;
    final jA3Fingerprint = this.jA3Fingerprint;
    final jA4Fingerprint = this.jA4Fingerprint;
    final labelNamespace = this.labelNamespace;
    final queryArgument = this.queryArgument;
    final queryString = this.queryString;
    final uriPath = this.uriPath;
    return {
      if (asn != null) 'ASN': asn,
      if (cookie != null) 'Cookie': cookie,
      if (forwardedIP != null) 'ForwardedIP': forwardedIP,
      if (hTTPMethod != null) 'HTTPMethod': hTTPMethod,
      if (header != null) 'Header': header,
      if (ip != null) 'IP': ip,
      if (jA3Fingerprint != null) 'JA3Fingerprint': jA3Fingerprint,
      if (jA4Fingerprint != null) 'JA4Fingerprint': jA4Fingerprint,
      if (labelNamespace != null) 'LabelNamespace': labelNamespace,
      if (queryArgument != null) 'QueryArgument': queryArgument,
      if (queryString != null) 'QueryString': queryString,
      if (uriPath != null) 'UriPath': uriPath,
    };
  }
}

/// Specifies a header as an aggregate key for a rate-based rule. Each distinct
/// value in the header contributes to the aggregation instance. If you use a
/// single header as your custom key, then each value fully defines an
/// aggregation instance.
///
/// @nodoc
class RateLimitHeader {
  /// The name of the header to use.
  final String name;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. Text transformations
  /// are used in rule match statements, to transform the
  /// <code>FieldToMatch</code> request component before inspecting it, and
  /// they're used in rate-based rule statements, to transform request components
  /// before using them as custom aggregation keys. If you specify one or more
  /// transformations to apply, WAF performs all transformations on the specified
  /// content, starting from the lowest priority setting, and then uses the
  /// transformed component contents.
  final List<TextTransformation> textTransformations;

  RateLimitHeader({
    required this.name,
    required this.textTransformations,
  });

  factory RateLimitHeader.fromJson(Map<String, dynamic> json) {
    return RateLimitHeader(
      name: (json['Name'] as String?) ?? '',
      textTransformations: ((json['TextTransformations'] as List?) ?? const [])
          .nonNulls
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final textTransformations = this.textTransformations;
    return {
      'Name': name,
      'TextTransformations': textTransformations,
    };
  }
}

/// Specifies a cookie as an aggregate key for a rate-based rule. Each distinct
/// value in the cookie contributes to the aggregation instance. If you use a
/// single cookie as your custom key, then each value fully defines an
/// aggregation instance.
///
/// @nodoc
class RateLimitCookie {
  /// The name of the cookie to use.
  final String name;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. Text transformations
  /// are used in rule match statements, to transform the
  /// <code>FieldToMatch</code> request component before inspecting it, and
  /// they're used in rate-based rule statements, to transform request components
  /// before using them as custom aggregation keys. If you specify one or more
  /// transformations to apply, WAF performs all transformations on the specified
  /// content, starting from the lowest priority setting, and then uses the
  /// transformed component contents.
  final List<TextTransformation> textTransformations;

  RateLimitCookie({
    required this.name,
    required this.textTransformations,
  });

  factory RateLimitCookie.fromJson(Map<String, dynamic> json) {
    return RateLimitCookie(
      name: (json['Name'] as String?) ?? '',
      textTransformations: ((json['TextTransformations'] as List?) ?? const [])
          .nonNulls
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final textTransformations = this.textTransformations;
    return {
      'Name': name,
      'TextTransformations': textTransformations,
    };
  }
}

/// Specifies a query argument in the request as an aggregate key for a
/// rate-based rule. Each distinct value for the named query argument
/// contributes to the aggregation instance. If you use a single query argument
/// as your custom key, then each value fully defines an aggregation instance.
///
/// @nodoc
class RateLimitQueryArgument {
  /// The name of the query argument to use.
  final String name;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. Text transformations
  /// are used in rule match statements, to transform the
  /// <code>FieldToMatch</code> request component before inspecting it, and
  /// they're used in rate-based rule statements, to transform request components
  /// before using them as custom aggregation keys. If you specify one or more
  /// transformations to apply, WAF performs all transformations on the specified
  /// content, starting from the lowest priority setting, and then uses the
  /// transformed component contents.
  final List<TextTransformation> textTransformations;

  RateLimitQueryArgument({
    required this.name,
    required this.textTransformations,
  });

  factory RateLimitQueryArgument.fromJson(Map<String, dynamic> json) {
    return RateLimitQueryArgument(
      name: (json['Name'] as String?) ?? '',
      textTransformations: ((json['TextTransformations'] as List?) ?? const [])
          .nonNulls
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final textTransformations = this.textTransformations;
    return {
      'Name': name,
      'TextTransformations': textTransformations,
    };
  }
}

/// Specifies the request's query string as an aggregate key for a rate-based
/// rule. Each distinct string contributes to the aggregation instance. If you
/// use just the query string as your custom key, then each string fully defines
/// an aggregation instance.
///
/// @nodoc
class RateLimitQueryString {
  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. Text transformations
  /// are used in rule match statements, to transform the
  /// <code>FieldToMatch</code> request component before inspecting it, and
  /// they're used in rate-based rule statements, to transform request components
  /// before using them as custom aggregation keys. If you specify one or more
  /// transformations to apply, WAF performs all transformations on the specified
  /// content, starting from the lowest priority setting, and then uses the
  /// transformed component contents.
  final List<TextTransformation> textTransformations;

  RateLimitQueryString({
    required this.textTransformations,
  });

  factory RateLimitQueryString.fromJson(Map<String, dynamic> json) {
    return RateLimitQueryString(
      textTransformations: ((json['TextTransformations'] as List?) ?? const [])
          .nonNulls
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final textTransformations = this.textTransformations;
    return {
      'TextTransformations': textTransformations,
    };
  }
}

/// Specifies the request's HTTP method as an aggregate key for a rate-based
/// rule. Each distinct HTTP method contributes to the aggregation instance. If
/// you use just the HTTP method as your custom key, then each method fully
/// defines an aggregation instance.
///
/// JSON specification: <code>"RateLimitHTTPMethod": {}</code>
///
/// @nodoc
class RateLimitHTTPMethod {
  RateLimitHTTPMethod();

  factory RateLimitHTTPMethod.fromJson(Map<String, dynamic> _) {
    return RateLimitHTTPMethod();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies the first IP address in an HTTP header as an aggregate key for a
/// rate-based rule. Each distinct forwarded IP address contributes to the
/// aggregation instance.
///
/// This setting is used only in the <code>RateBasedStatementCustomKey</code>
/// specification of a rate-based rule statement. When you specify an IP or
/// forwarded IP in the custom key settings, you must also specify at least one
/// other key to use. You can aggregate on only the forwarded IP address by
/// specifying <code>FORWARDED_IP</code> in your rate-based statement's
/// <code>AggregateKeyType</code>.
///
/// This data type supports using the forwarded IP address in the web request
/// aggregation for a rate-based rule, in
/// <code>RateBasedStatementCustomKey</code>. The JSON specification for using
/// the forwarded IP address doesn't explicitly use this data type.
///
/// JSON specification: <code>"ForwardedIP": {}</code>
///
/// When you use this specification, you must also configure the forwarded IP
/// address in the rate-based statement's <code>ForwardedIPConfig</code>.
///
/// @nodoc
class RateLimitForwardedIP {
  RateLimitForwardedIP();

  factory RateLimitForwardedIP.fromJson(Map<String, dynamic> _) {
    return RateLimitForwardedIP();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies the IP address in the web request as an aggregate key for a
/// rate-based rule. Each distinct IP address contributes to the aggregation
/// instance.
///
/// This setting is used only in the <code>RateBasedStatementCustomKey</code>
/// specification of a rate-based rule statement. To use this in the custom key
/// settings, you must specify at least one other key to use, along with the IP
/// address. To aggregate on only the IP address, in your rate-based statement's
/// <code>AggregateKeyType</code>, specify <code>IP</code>.
///
/// JSON specification: <code>"RateLimitIP": {}</code>
///
/// @nodoc
class RateLimitIP {
  RateLimitIP();

  factory RateLimitIP.fromJson(Map<String, dynamic> _) {
    return RateLimitIP();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies a label namespace to use as an aggregate key for a rate-based
/// rule. Each distinct fully qualified label name that has the specified label
/// namespace contributes to the aggregation instance. If you use just one label
/// namespace as your custom key, then each label name fully defines an
/// aggregation instance.
///
/// This uses only labels that have been added to the request by rules that are
/// evaluated before this rate-based rule in the web ACL.
///
/// For information about label namespaces and names, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-label-requirements.html">Label
/// syntax and naming requirements</a> in the <i>WAF Developer Guide</i>.
///
/// @nodoc
class RateLimitLabelNamespace {
  /// The namespace to use for aggregation.
  final String namespace;

  RateLimitLabelNamespace({
    required this.namespace,
  });

  factory RateLimitLabelNamespace.fromJson(Map<String, dynamic> json) {
    return RateLimitLabelNamespace(
      namespace: (json['Namespace'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    return {
      'Namespace': namespace,
    };
  }
}

/// Specifies the request's URI path as an aggregate key for a rate-based rule.
/// Each distinct URI path contributes to the aggregation instance. If you use
/// just the URI path as your custom key, then each URI path fully defines an
/// aggregation instance.
///
/// @nodoc
class RateLimitUriPath {
  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. Text transformations
  /// are used in rule match statements, to transform the
  /// <code>FieldToMatch</code> request component before inspecting it, and
  /// they're used in rate-based rule statements, to transform request components
  /// before using them as custom aggregation keys. If you specify one or more
  /// transformations to apply, WAF performs all transformations on the specified
  /// content, starting from the lowest priority setting, and then uses the
  /// transformed component contents.
  final List<TextTransformation> textTransformations;

  RateLimitUriPath({
    required this.textTransformations,
  });

  factory RateLimitUriPath.fromJson(Map<String, dynamic> json) {
    return RateLimitUriPath(
      textTransformations: ((json['TextTransformations'] as List?) ?? const [])
          .nonNulls
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final textTransformations = this.textTransformations;
    return {
      'TextTransformations': textTransformations,
    };
  }
}

/// Use the request's JA3 fingerprint derived from the TLS Client Hello of an
/// incoming request as an aggregate key. If you use a single JA3 fingerprint as
/// your custom key, then each value fully defines an aggregation instance.
///
/// @nodoc
class RateLimitJA3Fingerprint {
  /// The match status to assign to the web request if there is insufficient TSL
  /// Client Hello information to compute the JA3 fingerprint.
  ///
  /// You can specify the following fallback behaviors:
  ///
  /// <ul>
  /// <li>
  /// <code>MATCH</code> - Treat the web request as matching the rule statement.
  /// WAF applies the rule action to the request.
  /// </li>
  /// <li>
  /// <code>NO_MATCH</code> - Treat the web request as not matching the rule
  /// statement.
  /// </li>
  /// </ul>
  final FallbackBehavior fallbackBehavior;

  RateLimitJA3Fingerprint({
    required this.fallbackBehavior,
  });

  factory RateLimitJA3Fingerprint.fromJson(Map<String, dynamic> json) {
    return RateLimitJA3Fingerprint(
      fallbackBehavior: FallbackBehavior.fromString(
          (json['FallbackBehavior'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackBehavior = this.fallbackBehavior;
    return {
      'FallbackBehavior': fallbackBehavior.value,
    };
  }
}

/// Use the request's JA4 fingerprint derived from the TLS Client Hello of an
/// incoming request as an aggregate key. If you use a single JA4 fingerprint as
/// your custom key, then each value fully defines an aggregation instance.
///
/// @nodoc
class RateLimitJA4Fingerprint {
  /// The match status to assign to the web request if there is insufficient TSL
  /// Client Hello information to compute the JA4 fingerprint.
  ///
  /// You can specify the following fallback behaviors:
  ///
  /// <ul>
  /// <li>
  /// <code>MATCH</code> - Treat the web request as matching the rule statement.
  /// WAF applies the rule action to the request.
  /// </li>
  /// <li>
  /// <code>NO_MATCH</code> - Treat the web request as not matching the rule
  /// statement.
  /// </li>
  /// </ul>
  final FallbackBehavior fallbackBehavior;

  RateLimitJA4Fingerprint({
    required this.fallbackBehavior,
  });

  factory RateLimitJA4Fingerprint.fromJson(Map<String, dynamic> json) {
    return RateLimitJA4Fingerprint(
      fallbackBehavior: FallbackBehavior.fromString(
          (json['FallbackBehavior'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackBehavior = this.fallbackBehavior;
    return {
      'FallbackBehavior': fallbackBehavior.value,
    };
  }
}

/// Specifies an Autonomous System Number (ASN) derived from the request's
/// originating or forwarded IP address as an aggregate key for a rate-based
/// rule. Each distinct ASN contributes to the aggregation instance. If you use
/// a single ASN as your custom key, then each ASN fully defines an aggregation
/// instance.
///
/// @nodoc
class RateLimitAsn {
  RateLimitAsn();

  factory RateLimitAsn.fromJson(Map<String, dynamic> _) {
    return RateLimitAsn();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The configuration for inspecting IP addresses in an HTTP header that you
/// specify, instead of using the IP address that's reported by the web request
/// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
/// specify any header name.
/// <note>
/// If the specified header isn't present in the request, WAF doesn't apply the
/// rule to the web request at all.
/// </note>
/// This configuration is used only for <a>IPSetReferenceStatement</a>. For
/// <a>GeoMatchStatement</a> and <a>RateBasedStatement</a>, use
/// <a>ForwardedIPConfig</a> instead.
///
/// @nodoc
class IPSetForwardedIPConfig {
  /// The match status to assign to the web request if the request doesn't have a
  /// valid IP address in the specified position.
  /// <note>
  /// If the specified header isn't present in the request, WAF doesn't apply the
  /// rule to the web request at all.
  /// </note>
  /// You can specify the following fallback behaviors:
  ///
  /// <ul>
  /// <li>
  /// <code>MATCH</code> - Treat the web request as matching the rule statement.
  /// WAF applies the rule action to the request.
  /// </li>
  /// <li>
  /// <code>NO_MATCH</code> - Treat the web request as not matching the rule
  /// statement.
  /// </li>
  /// </ul>
  final FallbackBehavior fallbackBehavior;

  /// The name of the HTTP header to use for the IP address. For example, to use
  /// the X-Forwarded-For (XFF) header, set this to <code>X-Forwarded-For</code>.
  /// <note>
  /// If the specified header isn't present in the request, WAF doesn't apply the
  /// rule to the web request at all.
  /// </note>
  final String headerName;

  /// The position in the header to search for the IP address. The header can
  /// contain IP addresses of the original client and also of proxies. For
  /// example, the header value could be <code>10.1.1.1, 127.0.0.0,
  /// 10.10.10.10</code> where the first IP address identifies the original client
  /// and the rest identify proxies that the request went through.
  ///
  /// The options for this setting are the following:
  ///
  /// <ul>
  /// <li>
  /// FIRST - Inspect the first IP address in the list of IP addresses in the
  /// header. This is usually the client's original IP.
  /// </li>
  /// <li>
  /// LAST - Inspect the last IP address in the list of IP addresses in the
  /// header.
  /// </li>
  /// <li>
  /// ANY - Inspect all IP addresses in the header for a match. If the header
  /// contains more than 10 IP addresses, WAF inspects the last 10.
  /// </li>
  /// </ul>
  final ForwardedIPPosition position;

  IPSetForwardedIPConfig({
    required this.fallbackBehavior,
    required this.headerName,
    required this.position,
  });

  factory IPSetForwardedIPConfig.fromJson(Map<String, dynamic> json) {
    return IPSetForwardedIPConfig(
      fallbackBehavior: FallbackBehavior.fromString(
          (json['FallbackBehavior'] as String?) ?? ''),
      headerName: (json['HeaderName'] as String?) ?? '',
      position:
          ForwardedIPPosition.fromString((json['Position'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackBehavior = this.fallbackBehavior;
    final headerName = this.headerName;
    final position = this.position;
    return {
      'FallbackBehavior': fallbackBehavior.value,
      'HeaderName': headerName,
      'Position': position.value,
    };
  }
}

/// @nodoc
class ForwardedIPPosition {
  static const first = ForwardedIPPosition._('FIRST');
  static const last = ForwardedIPPosition._('LAST');
  static const any = ForwardedIPPosition._('ANY');

  final String value;

  const ForwardedIPPosition._(this.value);

  static const values = [first, last, any];

  static ForwardedIPPosition fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ForwardedIPPosition._(value));

  @override
  bool operator ==(other) =>
      other is ForwardedIPPosition && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CountryCode {
  static const af = CountryCode._('AF');
  static const ax = CountryCode._('AX');
  static const al = CountryCode._('AL');
  static const dz = CountryCode._('DZ');
  static const as = CountryCode._('AS');
  static const ad = CountryCode._('AD');
  static const ao = CountryCode._('AO');
  static const ai = CountryCode._('AI');
  static const aq = CountryCode._('AQ');
  static const ag = CountryCode._('AG');
  static const ar = CountryCode._('AR');
  static const am = CountryCode._('AM');
  static const aw = CountryCode._('AW');
  static const au = CountryCode._('AU');
  static const at = CountryCode._('AT');
  static const az = CountryCode._('AZ');
  static const bs = CountryCode._('BS');
  static const bh = CountryCode._('BH');
  static const bd = CountryCode._('BD');
  static const bb = CountryCode._('BB');
  static const by = CountryCode._('BY');
  static const be = CountryCode._('BE');
  static const bz = CountryCode._('BZ');
  static const bj = CountryCode._('BJ');
  static const bm = CountryCode._('BM');
  static const bt = CountryCode._('BT');
  static const bo = CountryCode._('BO');
  static const bq = CountryCode._('BQ');
  static const ba = CountryCode._('BA');
  static const bw = CountryCode._('BW');
  static const bv = CountryCode._('BV');
  static const br = CountryCode._('BR');
  static const io = CountryCode._('IO');
  static const bn = CountryCode._('BN');
  static const bg = CountryCode._('BG');
  static const bf = CountryCode._('BF');
  static const bi = CountryCode._('BI');
  static const kh = CountryCode._('KH');
  static const cm = CountryCode._('CM');
  static const ca = CountryCode._('CA');
  static const cv = CountryCode._('CV');
  static const ky = CountryCode._('KY');
  static const cf = CountryCode._('CF');
  static const td = CountryCode._('TD');
  static const cl = CountryCode._('CL');
  static const cn = CountryCode._('CN');
  static const cx = CountryCode._('CX');
  static const cc = CountryCode._('CC');
  static const co = CountryCode._('CO');
  static const km = CountryCode._('KM');
  static const cg = CountryCode._('CG');
  static const cd = CountryCode._('CD');
  static const ck = CountryCode._('CK');
  static const cr = CountryCode._('CR');
  static const ci = CountryCode._('CI');
  static const hr = CountryCode._('HR');
  static const cu = CountryCode._('CU');
  static const cw = CountryCode._('CW');
  static const cy = CountryCode._('CY');
  static const cz = CountryCode._('CZ');
  static const dk = CountryCode._('DK');
  static const dj = CountryCode._('DJ');
  static const dm = CountryCode._('DM');
  static const $do = CountryCode._('DO');
  static const ec = CountryCode._('EC');
  static const eg = CountryCode._('EG');
  static const sv = CountryCode._('SV');
  static const gq = CountryCode._('GQ');
  static const er = CountryCode._('ER');
  static const ee = CountryCode._('EE');
  static const et = CountryCode._('ET');
  static const fk = CountryCode._('FK');
  static const fo = CountryCode._('FO');
  static const fj = CountryCode._('FJ');
  static const fi = CountryCode._('FI');
  static const fr = CountryCode._('FR');
  static const gf = CountryCode._('GF');
  static const pf = CountryCode._('PF');
  static const tf = CountryCode._('TF');
  static const ga = CountryCode._('GA');
  static const gm = CountryCode._('GM');
  static const ge = CountryCode._('GE');
  static const de = CountryCode._('DE');
  static const gh = CountryCode._('GH');
  static const gi = CountryCode._('GI');
  static const gr = CountryCode._('GR');
  static const gl = CountryCode._('GL');
  static const gd = CountryCode._('GD');
  static const gp = CountryCode._('GP');
  static const gu = CountryCode._('GU');
  static const gt = CountryCode._('GT');
  static const gg = CountryCode._('GG');
  static const gn = CountryCode._('GN');
  static const gw = CountryCode._('GW');
  static const gy = CountryCode._('GY');
  static const ht = CountryCode._('HT');
  static const hm = CountryCode._('HM');
  static const va = CountryCode._('VA');
  static const hn = CountryCode._('HN');
  static const hk = CountryCode._('HK');
  static const hu = CountryCode._('HU');
  static const $is = CountryCode._('IS');
  static const $in = CountryCode._('IN');
  static const id = CountryCode._('ID');
  static const ir = CountryCode._('IR');
  static const iq = CountryCode._('IQ');
  static const ie = CountryCode._('IE');
  static const im = CountryCode._('IM');
  static const il = CountryCode._('IL');
  static const it = CountryCode._('IT');
  static const jm = CountryCode._('JM');
  static const jp = CountryCode._('JP');
  static const je = CountryCode._('JE');
  static const jo = CountryCode._('JO');
  static const kz = CountryCode._('KZ');
  static const ke = CountryCode._('KE');
  static const ki = CountryCode._('KI');
  static const kp = CountryCode._('KP');
  static const kr = CountryCode._('KR');
  static const kw = CountryCode._('KW');
  static const kg = CountryCode._('KG');
  static const la = CountryCode._('LA');
  static const lv = CountryCode._('LV');
  static const lb = CountryCode._('LB');
  static const ls = CountryCode._('LS');
  static const lr = CountryCode._('LR');
  static const ly = CountryCode._('LY');
  static const li = CountryCode._('LI');
  static const lt = CountryCode._('LT');
  static const lu = CountryCode._('LU');
  static const mo = CountryCode._('MO');
  static const mk = CountryCode._('MK');
  static const mg = CountryCode._('MG');
  static const mw = CountryCode._('MW');
  static const my = CountryCode._('MY');
  static const mv = CountryCode._('MV');
  static const ml = CountryCode._('ML');
  static const mt = CountryCode._('MT');
  static const mh = CountryCode._('MH');
  static const mq = CountryCode._('MQ');
  static const mr = CountryCode._('MR');
  static const mu = CountryCode._('MU');
  static const yt = CountryCode._('YT');
  static const mx = CountryCode._('MX');
  static const fm = CountryCode._('FM');
  static const md = CountryCode._('MD');
  static const mc = CountryCode._('MC');
  static const mn = CountryCode._('MN');
  static const me = CountryCode._('ME');
  static const ms = CountryCode._('MS');
  static const ma = CountryCode._('MA');
  static const mz = CountryCode._('MZ');
  static const mm = CountryCode._('MM');
  static const na = CountryCode._('NA');
  static const nr = CountryCode._('NR');
  static const np = CountryCode._('NP');
  static const nl = CountryCode._('NL');
  static const nc = CountryCode._('NC');
  static const nz = CountryCode._('NZ');
  static const ni = CountryCode._('NI');
  static const ne = CountryCode._('NE');
  static const ng = CountryCode._('NG');
  static const nu = CountryCode._('NU');
  static const nf = CountryCode._('NF');
  static const mp = CountryCode._('MP');
  static const no = CountryCode._('NO');
  static const om = CountryCode._('OM');
  static const pk = CountryCode._('PK');
  static const pw = CountryCode._('PW');
  static const ps = CountryCode._('PS');
  static const pa = CountryCode._('PA');
  static const pg = CountryCode._('PG');
  static const py = CountryCode._('PY');
  static const pe = CountryCode._('PE');
  static const ph = CountryCode._('PH');
  static const pn = CountryCode._('PN');
  static const pl = CountryCode._('PL');
  static const pt = CountryCode._('PT');
  static const pr = CountryCode._('PR');
  static const qa = CountryCode._('QA');
  static const re = CountryCode._('RE');
  static const ro = CountryCode._('RO');
  static const ru = CountryCode._('RU');
  static const rw = CountryCode._('RW');
  static const bl = CountryCode._('BL');
  static const sh = CountryCode._('SH');
  static const kn = CountryCode._('KN');
  static const lc = CountryCode._('LC');
  static const mf = CountryCode._('MF');
  static const pm = CountryCode._('PM');
  static const vc = CountryCode._('VC');
  static const ws = CountryCode._('WS');
  static const sm = CountryCode._('SM');
  static const st = CountryCode._('ST');
  static const sa = CountryCode._('SA');
  static const sn = CountryCode._('SN');
  static const rs = CountryCode._('RS');
  static const sc = CountryCode._('SC');
  static const sl = CountryCode._('SL');
  static const sg = CountryCode._('SG');
  static const sx = CountryCode._('SX');
  static const sk = CountryCode._('SK');
  static const si = CountryCode._('SI');
  static const sb = CountryCode._('SB');
  static const so = CountryCode._('SO');
  static const za = CountryCode._('ZA');
  static const gs = CountryCode._('GS');
  static const ss = CountryCode._('SS');
  static const es = CountryCode._('ES');
  static const lk = CountryCode._('LK');
  static const sd = CountryCode._('SD');
  static const sr = CountryCode._('SR');
  static const sj = CountryCode._('SJ');
  static const sz = CountryCode._('SZ');
  static const se = CountryCode._('SE');
  static const ch = CountryCode._('CH');
  static const sy = CountryCode._('SY');
  static const tw = CountryCode._('TW');
  static const tj = CountryCode._('TJ');
  static const tz = CountryCode._('TZ');
  static const th = CountryCode._('TH');
  static const tl = CountryCode._('TL');
  static const tg = CountryCode._('TG');
  static const tk = CountryCode._('TK');
  static const to = CountryCode._('TO');
  static const tt = CountryCode._('TT');
  static const tn = CountryCode._('TN');
  static const tr = CountryCode._('TR');
  static const tm = CountryCode._('TM');
  static const tc = CountryCode._('TC');
  static const tv = CountryCode._('TV');
  static const ug = CountryCode._('UG');
  static const ua = CountryCode._('UA');
  static const ae = CountryCode._('AE');
  static const gb = CountryCode._('GB');
  static const us = CountryCode._('US');
  static const um = CountryCode._('UM');
  static const uy = CountryCode._('UY');
  static const uz = CountryCode._('UZ');
  static const vu = CountryCode._('VU');
  static const ve = CountryCode._('VE');
  static const vn = CountryCode._('VN');
  static const vg = CountryCode._('VG');
  static const vi = CountryCode._('VI');
  static const wf = CountryCode._('WF');
  static const eh = CountryCode._('EH');
  static const ye = CountryCode._('YE');
  static const zm = CountryCode._('ZM');
  static const zw = CountryCode._('ZW');
  static const xk = CountryCode._('XK');

  final String value;

  const CountryCode._(this.value);

  static const values = [
    af,
    ax,
    al,
    dz,
    as,
    ad,
    ao,
    ai,
    aq,
    ag,
    ar,
    am,
    aw,
    au,
    at,
    az,
    bs,
    bh,
    bd,
    bb,
    by,
    be,
    bz,
    bj,
    bm,
    bt,
    bo,
    bq,
    ba,
    bw,
    bv,
    br,
    io,
    bn,
    bg,
    bf,
    bi,
    kh,
    cm,
    ca,
    cv,
    ky,
    cf,
    td,
    cl,
    cn,
    cx,
    cc,
    co,
    km,
    cg,
    cd,
    ck,
    cr,
    ci,
    hr,
    cu,
    cw,
    cy,
    cz,
    dk,
    dj,
    dm,
    $do,
    ec,
    eg,
    sv,
    gq,
    er,
    ee,
    et,
    fk,
    fo,
    fj,
    fi,
    fr,
    gf,
    pf,
    tf,
    ga,
    gm,
    ge,
    de,
    gh,
    gi,
    gr,
    gl,
    gd,
    gp,
    gu,
    gt,
    gg,
    gn,
    gw,
    gy,
    ht,
    hm,
    va,
    hn,
    hk,
    hu,
    $is,
    $in,
    id,
    ir,
    iq,
    ie,
    im,
    il,
    it,
    jm,
    jp,
    je,
    jo,
    kz,
    ke,
    ki,
    kp,
    kr,
    kw,
    kg,
    la,
    lv,
    lb,
    ls,
    lr,
    ly,
    li,
    lt,
    lu,
    mo,
    mk,
    mg,
    mw,
    my,
    mv,
    ml,
    mt,
    mh,
    mq,
    mr,
    mu,
    yt,
    mx,
    fm,
    md,
    mc,
    mn,
    me,
    ms,
    ma,
    mz,
    mm,
    na,
    nr,
    np,
    nl,
    nc,
    nz,
    ni,
    ne,
    ng,
    nu,
    nf,
    mp,
    no,
    om,
    pk,
    pw,
    ps,
    pa,
    pg,
    py,
    pe,
    ph,
    pn,
    pl,
    pt,
    pr,
    qa,
    re,
    ro,
    ru,
    rw,
    bl,
    sh,
    kn,
    lc,
    mf,
    pm,
    vc,
    ws,
    sm,
    st,
    sa,
    sn,
    rs,
    sc,
    sl,
    sg,
    sx,
    sk,
    si,
    sb,
    so,
    za,
    gs,
    ss,
    es,
    lk,
    sd,
    sr,
    sj,
    sz,
    se,
    ch,
    sy,
    tw,
    tj,
    tz,
    th,
    tl,
    tg,
    tk,
    to,
    tt,
    tn,
    tr,
    tm,
    tc,
    tv,
    ug,
    ua,
    ae,
    gb,
    us,
    um,
    uy,
    uz,
    vu,
    ve,
    vn,
    vg,
    vi,
    wf,
    eh,
    ye,
    zm,
    zw,
    xk
  ];

  static CountryCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CountryCode._(value));

  @override
  bool operator ==(other) => other is CountryCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ComparisonOperator {
  static const eq = ComparisonOperator._('EQ');
  static const ne = ComparisonOperator._('NE');
  static const le = ComparisonOperator._('LE');
  static const lt = ComparisonOperator._('LT');
  static const ge = ComparisonOperator._('GE');
  static const gt = ComparisonOperator._('GT');

  final String value;

  const ComparisonOperator._(this.value);

  static const values = [eq, ne, le, lt, ge, gt];

  static ComparisonOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ComparisonOperator._(value));

  @override
  bool operator ==(other) =>
      other is ComparisonOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SensitivityLevel {
  static const low = SensitivityLevel._('LOW');
  static const high = SensitivityLevel._('HIGH');

  final String value;

  const SensitivityLevel._(this.value);

  static const values = [low, high];

  static SensitivityLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SensitivityLevel._(value));

  @override
  bool operator ==(other) => other is SensitivityLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PositionalConstraint {
  static const exactly = PositionalConstraint._('EXACTLY');
  static const startsWith = PositionalConstraint._('STARTS_WITH');
  static const endsWith = PositionalConstraint._('ENDS_WITH');
  static const contains = PositionalConstraint._('CONTAINS');
  static const containsWord = PositionalConstraint._('CONTAINS_WORD');

  final String value;

  const PositionalConstraint._(this.value);

  static const values = [exactly, startsWith, endsWith, contains, containsWord];

  static PositionalConstraint fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PositionalConstraint._(value));

  @override
  bool operator ==(other) =>
      other is PositionalConstraint && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A tag associated with an Amazon Web Services resource. Tags are key:value
/// pairs that you can use to categorize and manage your resources, for purposes
/// like billing or other management. Typically, the tag key represents a
/// category, such as "environment", and the tag value represents a specific
/// value within that category, such as "test," "development," or "production".
/// Or you might set the tag key to "customer" and the value to the customer
/// name or ID. You can specify one or more tags to add to each Amazon Web
/// Services resource, up to 50 tags for a resource.
///
/// You can tag the Amazon Web Services resources that you manage through WAF:
/// web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage or
/// view tags through the WAF console.
///
/// @nodoc
class Tag {
  /// Part of the key:value pair that defines a tag. You can use a tag key to
  /// describe a category of information, such as "customer." Tag keys are
  /// case-sensitive.
  final String key;

  /// Part of the key:value pair that defines a tag. You can use a tag value to
  /// describe a specific value within a category, such as "companyA" or
  /// "companyB." Tag values are case-sensitive.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
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

/// A version of the named managed rule group, that the rule group's vendor
/// publishes for use by customers.
/// <note>
/// This is intended for use only by vendors of managed rule sets. Vendors are
/// Amazon Web Services and Amazon Web Services Marketplace sellers.
///
/// Vendors, you can use the managed rule set APIs to provide controlled rollout
/// of your versioned managed rule group offerings for your customers. The APIs
/// are <code>ListManagedRuleSets</code>, <code>GetManagedRuleSet</code>,
/// <code>PutManagedRuleSetVersions</code>, and
/// <code>UpdateManagedRuleSetVersionExpiryDate</code>.
/// </note>
///
/// @nodoc
class VersionToPublish {
  /// The Amazon Resource Name (ARN) of the vendor's rule group that's used in the
  /// published managed rule group version.
  final String? associatedRuleGroupArn;

  /// The amount of time the vendor expects this version of the managed rule group
  /// to last, in days.
  final int? forecastedLifetime;

  VersionToPublish({
    this.associatedRuleGroupArn,
    this.forecastedLifetime,
  });

  Map<String, dynamic> toJson() {
    final associatedRuleGroupArn = this.associatedRuleGroupArn;
    final forecastedLifetime = this.forecastedLifetime;
    return {
      if (associatedRuleGroupArn != null)
        'AssociatedRuleGroupArn': associatedRuleGroupArn,
      if (forecastedLifetime != null) 'ForecastedLifetime': forecastedLifetime,
    };
  }
}

/// Defines an association between logging destinations and a web ACL resource,
/// for logging from WAF. As part of the association, you can specify parts of
/// the standard logging fields to keep out of the logs and you can specify
/// filters so that you log only a subset of the logging records.
///
/// If you configure data protection for the web ACL, the protection applies to
/// the data that WAF sends to the logs.
/// <note>
/// You can define one logging destination per web ACL.
/// </note>
/// You can access information about the traffic that WAF inspects using the
/// following steps:
/// <ol>
/// <li>
/// Create your logging destination. You can use an Amazon CloudWatch Logs log
/// group, an Amazon Simple Storage Service (Amazon S3) bucket, or an Amazon
/// Kinesis Data Firehose.
///
/// The name that you give the destination must start with
/// <code>aws-waf-logs-</code>. Depending on the type of destination, you might
/// need to configure additional settings or permissions.
///
/// For configuration requirements and pricing information for each destination
/// type, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/logging.html">Logging
/// web ACL traffic</a> in the <i>WAF Developer Guide</i>.
/// </li>
/// <li>
/// Associate your logging destination to your web ACL using a
/// <code>PutLoggingConfiguration</code> request.
/// </li> </ol>
/// When you successfully enable logging using a
/// <code>PutLoggingConfiguration</code> request, WAF creates an additional role
/// or policy that is required to write logs to the logging destination. For an
/// Amazon CloudWatch Logs log group, WAF creates a resource policy on the log
/// group. For an Amazon S3 bucket, WAF creates a bucket policy. For an Amazon
/// Kinesis Data Firehose, WAF creates a service-linked role.
///
/// For additional information about web ACL logging, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/logging.html">Logging
/// web ACL traffic information</a> in the <i>WAF Developer Guide</i>.
///
/// @nodoc
class LoggingConfiguration {
  /// The logging destination configuration that you want to associate with the
  /// web ACL.
  /// <note>
  /// You can associate one logging destination to a web ACL.
  /// </note>
  final List<String> logDestinationConfigs;

  /// The Amazon Resource Name (ARN) of the web ACL that you want to associate
  /// with <code>LogDestinationConfigs</code>.
  final String resourceArn;

  /// The owner of the logging configuration, which must be set to
  /// <code>CUSTOMER</code> for the configurations that you manage.
  ///
  /// The log scope <code>SECURITY_LAKE</code> indicates a configuration that is
  /// managed through Amazon Security Lake. You can use Security Lake to collect
  /// log and event data from various sources for normalization, analysis, and
  /// management. For information, see <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html">Collecting
  /// data from Amazon Web Services services</a> in the <i>Amazon Security Lake
  /// user guide</i>.
  ///
  /// The log scope <code>CLOUDWATCH_TELEMETRY_RULE_MANAGED</code> indicates a
  /// configuration that is managed through Amazon CloudWatch Logs for telemetry
  /// data collection and analysis. For information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html">What
  /// is Amazon CloudWatch Logs ?</a> in the <i>Amazon CloudWatch Logs user
  /// guide</i>.
  ///
  /// Default: <code>CUSTOMER</code>
  final LogScope? logScope;

  /// Used to distinguish between various logging options. Currently, there is one
  /// option.
  ///
  /// Default: <code>WAF_LOGS</code>
  final LogType? logType;

  /// Filtering that specifies which web requests are kept in the logs and which
  /// are dropped. You can filter on the rule action and on the web request labels
  /// that were applied by matching rules during web ACL evaluation.
  final LoggingFilter? loggingFilter;

  /// Indicates whether the logging configuration was created by Firewall Manager,
  /// as part of an WAF policy configuration. If true, only Firewall Manager can
  /// modify or delete the configuration.
  ///
  /// The logging configuration can be created by Firewall Manager for use with
  /// any web ACL that Firewall Manager is using for an WAF policy. Web ACLs that
  /// Firewall Manager creates and uses have their
  /// <code>ManagedByFirewallManager</code> property set to true. Web ACLs that
  /// were created by a customer account and then retrofitted by Firewall Manager
  /// for use by a policy have their <code>RetrofittedByFirewallManager</code>
  /// property set to true. For either case, any corresponding logging
  /// configuration will indicate <code>ManagedByFirewallManager</code>.
  final bool? managedByFirewallManager;

  /// The parts of the request that you want to keep out of the logs.
  ///
  /// For example, if you redact the <code>SingleHeader</code> field, the
  /// <code>HEADER</code> field in the logs will be <code>REDACTED</code> for all
  /// rules that use the <code>SingleHeader</code> <code>FieldToMatch</code>
  /// setting.
  ///
  /// If you configure data protection for the web ACL, the protection applies to
  /// the data that WAF sends to the logs.
  ///
  /// Redaction applies only to the component that's specified in the rule's
  /// <code>FieldToMatch</code> setting, so the <code>SingleHeader</code>
  /// redaction doesn't apply to rules that use the <code>Headers</code>
  /// <code>FieldToMatch</code>.
  /// <note>
  /// You can specify only the following fields for redaction:
  /// <code>UriPath</code>, <code>QueryString</code>, <code>SingleHeader</code>,
  /// and <code>Method</code>.
  /// </note> <note>
  /// This setting has no impact on request sampling. You can only exclude fields
  /// from request sampling by disabling sampling in the web ACL visibility
  /// configuration or by configuring data protection for the web ACL.
  /// </note>
  final List<FieldToMatch>? redactedFields;

  LoggingConfiguration({
    required this.logDestinationConfigs,
    required this.resourceArn,
    this.logScope,
    this.logType,
    this.loggingFilter,
    this.managedByFirewallManager,
    this.redactedFields,
  });

  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return LoggingConfiguration(
      logDestinationConfigs:
          ((json['LogDestinationConfigs'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
      resourceArn: (json['ResourceArn'] as String?) ?? '',
      logScope: (json['LogScope'] as String?)?.let(LogScope.fromString),
      logType: (json['LogType'] as String?)?.let(LogType.fromString),
      loggingFilter: json['LoggingFilter'] != null
          ? LoggingFilter.fromJson(
              json['LoggingFilter'] as Map<String, dynamic>)
          : null,
      managedByFirewallManager: json['ManagedByFirewallManager'] as bool?,
      redactedFields: (json['RedactedFields'] as List?)
          ?.nonNulls
          .map((e) => FieldToMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logDestinationConfigs = this.logDestinationConfigs;
    final resourceArn = this.resourceArn;
    final logScope = this.logScope;
    final logType = this.logType;
    final loggingFilter = this.loggingFilter;
    final managedByFirewallManager = this.managedByFirewallManager;
    final redactedFields = this.redactedFields;
    return {
      'LogDestinationConfigs': logDestinationConfigs,
      'ResourceArn': resourceArn,
      if (logScope != null) 'LogScope': logScope.value,
      if (logType != null) 'LogType': logType.value,
      if (loggingFilter != null) 'LoggingFilter': loggingFilter,
      if (managedByFirewallManager != null)
        'ManagedByFirewallManager': managedByFirewallManager,
      if (redactedFields != null) 'RedactedFields': redactedFields,
    };
  }
}

/// Filtering that specifies which web requests are kept in the logs and which
/// are dropped, defined for a web ACL's <a>LoggingConfiguration</a>.
///
/// You can filter on the rule action and on the web request labels that were
/// applied by matching rules during web ACL evaluation.
///
/// @nodoc
class LoggingFilter {
  /// Default handling for logs that don't match any of the specified filtering
  /// conditions.
  final FilterBehavior defaultBehavior;

  /// The filters that you want to apply to the logs.
  final List<Filter> filters;

  LoggingFilter({
    required this.defaultBehavior,
    required this.filters,
  });

  factory LoggingFilter.fromJson(Map<String, dynamic> json) {
    return LoggingFilter(
      defaultBehavior:
          FilterBehavior.fromString((json['DefaultBehavior'] as String?) ?? ''),
      filters: ((json['Filters'] as List?) ?? const [])
          .nonNulls
          .map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultBehavior = this.defaultBehavior;
    final filters = this.filters;
    return {
      'DefaultBehavior': defaultBehavior.value,
      'Filters': filters,
    };
  }
}

/// @nodoc
class LogType {
  static const wafLogs = LogType._('WAF_LOGS');

  final String value;

  const LogType._(this.value);

  static const values = [wafLogs];

  static LogType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogType._(value));

  @override
  bool operator ==(other) => other is LogType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LogScope {
  static const customer = LogScope._('CUSTOMER');
  static const securityLake = LogScope._('SECURITY_LAKE');
  static const cloudwatchTelemetryRuleManaged =
      LogScope._('CLOUDWATCH_TELEMETRY_RULE_MANAGED');

  final String value;

  const LogScope._(this.value);

  static const values = [
    customer,
    securityLake,
    cloudwatchTelemetryRuleManaged
  ];

  static LogScope fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogScope._(value));

  @override
  bool operator ==(other) => other is LogScope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FilterBehavior {
  static const keep = FilterBehavior._('KEEP');
  static const drop = FilterBehavior._('DROP');

  final String value;

  const FilterBehavior._(this.value);

  static const values = [keep, drop];

  static FilterBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FilterBehavior._(value));

  @override
  bool operator ==(other) => other is FilterBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A single logging filter, used in <a>LoggingFilter</a>.
///
/// @nodoc
class Filter {
  /// How to handle logs that satisfy the filter's conditions and requirement.
  final FilterBehavior behavior;

  /// Match conditions for the filter.
  final List<Condition> conditions;

  /// Logic to apply to the filtering conditions. You can specify that, in order
  /// to satisfy the filter, a log must match all conditions or must match at
  /// least one condition.
  final FilterRequirement requirement;

  Filter({
    required this.behavior,
    required this.conditions,
    required this.requirement,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      behavior: FilterBehavior.fromString((json['Behavior'] as String?) ?? ''),
      conditions: ((json['Conditions'] as List?) ?? const [])
          .nonNulls
          .map((e) => Condition.fromJson(e as Map<String, dynamic>))
          .toList(),
      requirement:
          FilterRequirement.fromString((json['Requirement'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final behavior = this.behavior;
    final conditions = this.conditions;
    final requirement = this.requirement;
    return {
      'Behavior': behavior.value,
      'Conditions': conditions,
      'Requirement': requirement.value,
    };
  }
}

/// @nodoc
class FilterRequirement {
  static const meetsAll = FilterRequirement._('MEETS_ALL');
  static const meetsAny = FilterRequirement._('MEETS_ANY');

  final String value;

  const FilterRequirement._(this.value);

  static const values = [meetsAll, meetsAny];

  static FilterRequirement fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FilterRequirement._(value));

  @override
  bool operator ==(other) => other is FilterRequirement && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A single match condition for a <a>Filter</a>.
///
/// @nodoc
class Condition {
  /// A single action condition. This is the action setting that a log record must
  /// contain in order to meet the condition.
  final ActionCondition? actionCondition;

  /// A single label name condition. This is the fully qualified label name that a
  /// log record must contain in order to meet the condition. Fully qualified
  /// labels have a prefix, optional namespaces, and label name. The prefix
  /// identifies the rule group or web ACL context of the rule that added the
  /// label.
  final LabelNameCondition? labelNameCondition;

  Condition({
    this.actionCondition,
    this.labelNameCondition,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      actionCondition: json['ActionCondition'] != null
          ? ActionCondition.fromJson(
              json['ActionCondition'] as Map<String, dynamic>)
          : null,
      labelNameCondition: json['LabelNameCondition'] != null
          ? LabelNameCondition.fromJson(
              json['LabelNameCondition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionCondition = this.actionCondition;
    final labelNameCondition = this.labelNameCondition;
    return {
      if (actionCondition != null) 'ActionCondition': actionCondition,
      if (labelNameCondition != null) 'LabelNameCondition': labelNameCondition,
    };
  }
}

/// A single action condition for a <a>Condition</a> in a logging filter.
///
/// @nodoc
class ActionCondition {
  /// The action setting that a log record must contain in order to meet the
  /// condition. This is the action that WAF applied to the web request.
  ///
  /// For rule groups, this is either the configured rule action setting, or if
  /// you've applied a rule action override to the rule, it's the override action.
  /// The value <code>EXCLUDED_AS_COUNT</code> matches on excluded rules and also
  /// on rules that have a rule action override of Count.
  final ActionValue action;

  ActionCondition({
    required this.action,
  });

  factory ActionCondition.fromJson(Map<String, dynamic> json) {
    return ActionCondition(
      action: ActionValue.fromString((json['Action'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    return {
      'Action': action.value,
    };
  }
}

/// A single label name condition for a <a>Condition</a> in a logging filter.
///
/// @nodoc
class LabelNameCondition {
  /// The label name that a log record must contain in order to meet the
  /// condition. This must be a fully qualified label name. Fully qualified labels
  /// have a prefix, optional namespaces, and label name. The prefix identifies
  /// the rule group or web ACL context of the rule that added the label.
  final String labelName;

  LabelNameCondition({
    required this.labelName,
  });

  factory LabelNameCondition.fromJson(Map<String, dynamic> json) {
    return LabelNameCondition(
      labelName: (json['LabelName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final labelName = this.labelName;
    return {
      'LabelName': labelName,
    };
  }
}

/// @nodoc
class ActionValue {
  static const allow = ActionValue._('ALLOW');
  static const block = ActionValue._('BLOCK');
  static const count = ActionValue._('COUNT');
  static const captcha = ActionValue._('CAPTCHA');
  static const challenge = ActionValue._('CHALLENGE');
  static const excludedAsCount = ActionValue._('EXCLUDED_AS_COUNT');

  final String value;

  const ActionValue._(this.value);

  static const values = [
    allow,
    block,
    count,
    captcha,
    challenge,
    excludedAsCount
  ];

  static ActionValue fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ActionValue._(value));

  @override
  bool operator ==(other) => other is ActionValue && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// High-level information about a <a>WebACL</a>, returned by operations like
/// create and list. This provides information like the ID, that you can use to
/// retrieve and manage a <code>WebACL</code>, and the ARN, that you provide to
/// operations like <a>AssociateWebACL</a>.
///
/// @nodoc
class WebACLSummary {
  /// The Amazon Resource Name (ARN) of the entity.
  final String? arn;

  /// A description of the web ACL that helps with identification.
  final String? description;

  /// The unique identifier for the web ACL. This ID is returned in the responses
  /// to create and list commands. You provide it to operations like update and
  /// delete.
  final String? id;

  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity associated
  /// with the token, you provide the token to operations like <code>update</code>
  /// and <code>delete</code>. WAF uses the token to ensure that no changes have
  /// been made to the entity since you last retrieved it. If a change has been
  /// made, the update fails with a <code>WAFOptimisticLockException</code>. If
  /// this happens, perform another <code>get</code>, and use the new token
  /// returned by that operation.
  final String? lockToken;

  /// The name of the web ACL. You cannot change the name of a web ACL after you
  /// create it.
  final String? name;

  WebACLSummary({
    this.arn,
    this.description,
    this.id,
    this.lockToken,
    this.name,
  });

  factory WebACLSummary.fromJson(Map<String, dynamic> json) {
    return WebACLSummary(
      arn: json['ARN'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lockToken: json['LockToken'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final lockToken = this.lockToken;
    final name = this.name;
    return {
      if (arn != null) 'ARN': arn,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (lockToken != null) 'LockToken': lockToken,
      if (name != null) 'Name': name,
    };
  }
}

/// The collection of tagging definitions for an Amazon Web Services resource.
/// Tags are key:value pairs that you can use to categorize and manage your
/// resources, for purposes like billing or other management. Typically, the tag
/// key represents a category, such as "environment", and the tag value
/// represents a specific value within that category, such as "test,"
/// "development," or "production". Or you might set the tag key to "customer"
/// and the value to the customer name or ID. You can specify one or more tags
/// to add to each Amazon Web Services resource, up to 50 tags for a resource.
///
/// You can tag the Amazon Web Services resources that you manage through WAF:
/// web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage or
/// view tags through the WAF console.
///
/// @nodoc
class TagInfoForResource {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? resourceARN;

  /// The array of <a>Tag</a> objects defined for the resource.
  final List<Tag>? tagList;

  TagInfoForResource({
    this.resourceARN,
    this.tagList,
  });

  factory TagInfoForResource.fromJson(Map<String, dynamic> json) {
    return TagInfoForResource(
      resourceARN: json['ResourceARN'] as String?,
      tagList: (json['TagList'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final tagList = this.tagList;
    return {
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (tagList != null) 'TagList': tagList,
    };
  }
}

/// High-level information about a <a>RuleGroup</a>, returned by operations like
/// create and list. This provides information like the ID, that you can use to
/// retrieve and manage a <code>RuleGroup</code>, and the ARN, that you provide
/// to the <a>RuleGroupReferenceStatement</a> to use the rule group in a
/// <a>Rule</a>.
///
/// @nodoc
class RuleGroupSummary {
  /// The Amazon Resource Name (ARN) of the entity.
  final String? arn;

  /// A description of the rule group that helps with identification.
  final String? description;

  /// A unique identifier for the rule group. This ID is returned in the responses
  /// to create and list commands. You provide it to operations like update and
  /// delete.
  final String? id;

  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity associated
  /// with the token, you provide the token to operations like <code>update</code>
  /// and <code>delete</code>. WAF uses the token to ensure that no changes have
  /// been made to the entity since you last retrieved it. If a change has been
  /// made, the update fails with a <code>WAFOptimisticLockException</code>. If
  /// this happens, perform another <code>get</code>, and use the new token
  /// returned by that operation.
  final String? lockToken;

  /// The name of the data type instance. You cannot change the name after you
  /// create the instance.
  final String? name;

  RuleGroupSummary({
    this.arn,
    this.description,
    this.id,
    this.lockToken,
    this.name,
  });

  factory RuleGroupSummary.fromJson(Map<String, dynamic> json) {
    return RuleGroupSummary(
      arn: json['ARN'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lockToken: json['LockToken'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final lockToken = this.lockToken;
    final name = this.name;
    return {
      if (arn != null) 'ARN': arn,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (lockToken != null) 'LockToken': lockToken,
      if (name != null) 'Name': name,
    };
  }
}

/// @nodoc
class ResourceType {
  static const applicationLoadBalancer =
      ResourceType._('APPLICATION_LOAD_BALANCER');
  static const apiGateway = ResourceType._('API_GATEWAY');
  static const appsync = ResourceType._('APPSYNC');
  static const cognitoUserPool = ResourceType._('COGNITO_USER_POOL');
  static const appRunnerService = ResourceType._('APP_RUNNER_SERVICE');
  static const verifiedAccessInstance =
      ResourceType._('VERIFIED_ACCESS_INSTANCE');
  static const amplify = ResourceType._('AMPLIFY');

  final String value;

  const ResourceType._(this.value);

  static const values = [
    applicationLoadBalancer,
    apiGateway,
    appsync,
    cognitoUserPool,
    appRunnerService,
    verifiedAccessInstance,
    amplify
  ];

  static ResourceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResourceType._(value));

  @override
  bool operator ==(other) => other is ResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// High-level information about a <a>RegexPatternSet</a>, returned by
/// operations like create and list. This provides information like the ID, that
/// you can use to retrieve and manage a <code>RegexPatternSet</code>, and the
/// ARN, that you provide to the <a>RegexPatternSetReferenceStatement</a> to use
/// the pattern set in a <a>Rule</a>.
///
/// @nodoc
class RegexPatternSetSummary {
  /// The Amazon Resource Name (ARN) of the entity.
  final String? arn;

  /// A description of the set that helps with identification.
  final String? description;

  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  final String? id;

  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity associated
  /// with the token, you provide the token to operations like <code>update</code>
  /// and <code>delete</code>. WAF uses the token to ensure that no changes have
  /// been made to the entity since you last retrieved it. If a change has been
  /// made, the update fails with a <code>WAFOptimisticLockException</code>. If
  /// this happens, perform another <code>get</code>, and use the new token
  /// returned by that operation.
  final String? lockToken;

  /// The name of the data type instance. You cannot change the name after you
  /// create the instance.
  final String? name;

  RegexPatternSetSummary({
    this.arn,
    this.description,
    this.id,
    this.lockToken,
    this.name,
  });

  factory RegexPatternSetSummary.fromJson(Map<String, dynamic> json) {
    return RegexPatternSetSummary(
      arn: json['ARN'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lockToken: json['LockToken'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final lockToken = this.lockToken;
    final name = this.name;
    return {
      if (arn != null) 'ARN': arn,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (lockToken != null) 'LockToken': lockToken,
      if (name != null) 'Name': name,
    };
  }
}

/// High level information for an SDK release.
///
/// @nodoc
class ReleaseSummary {
  /// The release version.
  final String? releaseVersion;

  /// The timestamp of the release.
  final DateTime? timestamp;

  ReleaseSummary({
    this.releaseVersion,
    this.timestamp,
  });

  factory ReleaseSummary.fromJson(Map<String, dynamic> json) {
    return ReleaseSummary(
      releaseVersion: json['ReleaseVersion'] as String?,
      timestamp: timeStampFromJson(json['Timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final releaseVersion = this.releaseVersion;
    final timestamp = this.timestamp;
    return {
      if (releaseVersion != null) 'ReleaseVersion': releaseVersion,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// @nodoc
class Platform {
  static const ios = Platform._('IOS');
  static const android = Platform._('ANDROID');

  final String value;

  const Platform._(this.value);

  static const values = [ios, android];

  static Platform fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Platform._(value));

  @override
  bool operator ==(other) => other is Platform && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// High-level information for a managed rule set.
/// <note>
/// This is intended for use only by vendors of managed rule sets. Vendors are
/// Amazon Web Services and Amazon Web Services Marketplace sellers.
///
/// Vendors, you can use the managed rule set APIs to provide controlled rollout
/// of your versioned managed rule group offerings for your customers. The APIs
/// are <code>ListManagedRuleSets</code>, <code>GetManagedRuleSet</code>,
/// <code>PutManagedRuleSetVersions</code>, and
/// <code>UpdateManagedRuleSetVersionExpiryDate</code>.
/// </note>
///
/// @nodoc
class ManagedRuleSetSummary {
  /// The Amazon Resource Name (ARN) of the entity.
  final String? arn;

  /// A description of the set that helps with identification.
  final String? description;

  /// A unique identifier for the managed rule set. The ID is returned in the
  /// responses to commands like <code>list</code>. You provide it to operations
  /// like <code>get</code> and <code>update</code>.
  final String? id;

  /// The label namespace prefix for the managed rule groups that are offered to
  /// customers from this managed rule set. All labels that are added by rules in
  /// the managed rule group have this prefix.
  ///
  /// <ul>
  /// <li>
  /// The syntax for the label namespace prefix for a managed rule group is the
  /// following:
  ///
  /// <code>awswaf:managed:<vendor>:<rule group name></code>:
  /// </li>
  /// <li>
  /// When a rule with a label matches a web request, WAF adds the fully qualified
  /// label to the request. A fully qualified label is made up of the label
  /// namespace from the rule group or web ACL where the rule is defined and the
  /// label from the rule, separated by a colon:
  ///
  /// <code><label namespace>:<label from rule></code>
  /// </li>
  /// </ul>
  final String? labelNamespace;

  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity associated
  /// with the token, you provide the token to operations like <code>update</code>
  /// and <code>delete</code>. WAF uses the token to ensure that no changes have
  /// been made to the entity since you last retrieved it. If a change has been
  /// made, the update fails with a <code>WAFOptimisticLockException</code>. If
  /// this happens, perform another <code>get</code>, and use the new token
  /// returned by that operation.
  final String? lockToken;

  /// The name of the managed rule set. You use this, along with the rule set ID,
  /// to identify the rule set.
  ///
  /// This name is assigned to the corresponding managed rule group, which your
  /// customers can access and use.
  final String? name;

  ManagedRuleSetSummary({
    this.arn,
    this.description,
    this.id,
    this.labelNamespace,
    this.lockToken,
    this.name,
  });

  factory ManagedRuleSetSummary.fromJson(Map<String, dynamic> json) {
    return ManagedRuleSetSummary(
      arn: json['ARN'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      labelNamespace: json['LabelNamespace'] as String?,
      lockToken: json['LockToken'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final labelNamespace = this.labelNamespace;
    final lockToken = this.lockToken;
    final name = this.name;
    return {
      if (arn != null) 'ARN': arn,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (labelNamespace != null) 'LabelNamespace': labelNamespace,
      if (lockToken != null) 'LockToken': lockToken,
      if (name != null) 'Name': name,
    };
  }
}

/// High-level information about an <a>IPSet</a>, returned by operations like
/// create and list. This provides information like the ID, that you can use to
/// retrieve and manage an <code>IPSet</code>, and the ARN, that you provide to
/// the <a>IPSetReferenceStatement</a> to use the address set in a <a>Rule</a>.
///
/// @nodoc
class IPSetSummary {
  /// The Amazon Resource Name (ARN) of the entity.
  final String? arn;

  /// A description of the IP set that helps with identification.
  final String? description;

  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  final String? id;

  /// A token used for optimistic locking. WAF returns a token to your
  /// <code>get</code> and <code>list</code> requests, to mark the state of the
  /// entity at the time of the request. To make changes to the entity associated
  /// with the token, you provide the token to operations like <code>update</code>
  /// and <code>delete</code>. WAF uses the token to ensure that no changes have
  /// been made to the entity since you last retrieved it. If a change has been
  /// made, the update fails with a <code>WAFOptimisticLockException</code>. If
  /// this happens, perform another <code>get</code>, and use the new token
  /// returned by that operation.
  final String? lockToken;

  /// The name of the IP set. You cannot change the name of an <code>IPSet</code>
  /// after you create it.
  final String? name;

  IPSetSummary({
    this.arn,
    this.description,
    this.id,
    this.lockToken,
    this.name,
  });

  factory IPSetSummary.fromJson(Map<String, dynamic> json) {
    return IPSetSummary(
      arn: json['ARN'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lockToken: json['LockToken'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final lockToken = this.lockToken;
    final name = this.name;
    return {
      if (arn != null) 'ARN': arn,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (lockToken != null) 'LockToken': lockToken,
      if (name != null) 'Name': name,
    };
  }
}

/// Describes a single version of a managed rule group.
///
/// @nodoc
class ManagedRuleGroupVersion {
  /// The date and time that the managed rule group owner updated the rule group
  /// version information.
  final DateTime? lastUpdateTimestamp;

  /// The version name.
  final String? name;

  ManagedRuleGroupVersion({
    this.lastUpdateTimestamp,
    this.name,
  });

  factory ManagedRuleGroupVersion.fromJson(Map<String, dynamic> json) {
    return ManagedRuleGroupVersion(
      lastUpdateTimestamp: timeStampFromJson(json['LastUpdateTimestamp']),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdateTimestamp = this.lastUpdateTimestamp;
    final name = this.name;
    return {
      if (lastUpdateTimestamp != null)
        'LastUpdateTimestamp': unixTimestampToJson(lastUpdateTimestamp),
      if (name != null) 'Name': name,
    };
  }
}

/// High-level information about a managed rule group, returned by
/// <a>ListAvailableManagedRuleGroups</a>. This provides information like the
/// name and vendor name, that you provide when you add a
/// <a>ManagedRuleGroupStatement</a> to a web ACL. Managed rule groups include
/// Amazon Web Services Managed Rules rule groups and Amazon Web Services
/// Marketplace managed rule groups. To use any Amazon Web Services Marketplace
/// managed rule group, first subscribe to the rule group through Amazon Web
/// Services Marketplace.
///
/// @nodoc
class ManagedRuleGroupSummary {
  /// The description of the managed rule group, provided by Amazon Web Services
  /// Managed Rules or the Amazon Web Services Marketplace seller who manages it.
  final String? description;

  /// The name of the managed rule group. You use this, along with the vendor
  /// name, to identify the rule group.
  final String? name;

  /// The name of the managed rule group vendor. You use this, along with the rule
  /// group name, to identify a rule group.
  final String? vendorName;

  /// Indicates whether the managed rule group is versioned. If it is, you can
  /// retrieve the versions list by calling
  /// <a>ListAvailableManagedRuleGroupVersions</a>.
  final bool? versioningSupported;

  ManagedRuleGroupSummary({
    this.description,
    this.name,
    this.vendorName,
    this.versioningSupported,
  });

  factory ManagedRuleGroupSummary.fromJson(Map<String, dynamic> json) {
    return ManagedRuleGroupSummary(
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      vendorName: json['VendorName'] as String?,
      versioningSupported: json['VersioningSupported'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    final vendorName = this.vendorName;
    final versioningSupported = this.versioningSupported;
    return {
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (vendorName != null) 'VendorName': vendorName,
      if (versioningSupported != null)
        'VersioningSupported': versioningSupported,
    };
  }
}

/// Information for a single API key.
///
/// API keys are required for the integration of the CAPTCHA API in your
/// JavaScript client applications. The API lets you customize the placement and
/// characteristics of the CAPTCHA puzzle for your end users. For more
/// information about the CAPTCHA JavaScript integration, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html">WAF
/// client application integration</a> in the <i>WAF Developer Guide</i>.
///
/// @nodoc
class APIKeySummary {
  /// The generated, encrypted API key. You can copy this for use in your
  /// JavaScript CAPTCHA integration.
  final String? aPIKey;

  /// The date and time that the key was created.
  final DateTime? creationTimestamp;

  /// The token domains that are defined in this API key.
  final List<String>? tokenDomains;

  /// Internal value used by WAF to manage the key.
  final int? version;

  APIKeySummary({
    this.aPIKey,
    this.creationTimestamp,
    this.tokenDomains,
    this.version,
  });

  factory APIKeySummary.fromJson(Map<String, dynamic> json) {
    return APIKeySummary(
      aPIKey: json['APIKey'] as String?,
      creationTimestamp: timeStampFromJson(json['CreationTimestamp']),
      tokenDomains: (json['TokenDomains'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aPIKey = this.aPIKey;
    final creationTimestamp = this.creationTimestamp;
    final tokenDomains = this.tokenDomains;
    final version = this.version;
    return {
      if (aPIKey != null) 'APIKey': aPIKey,
      if (creationTimestamp != null)
        'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      if (tokenDomains != null) 'TokenDomains': tokenDomains,
      if (version != null) 'Version': version,
    };
  }
}

/// A web ACL defines a collection of rules to use to inspect and control web
/// requests. Each rule has a statement that defines what to look for in web
/// requests and an action that WAF applies to requests that match the
/// statement. In the web ACL, you assign a default action to take (allow,
/// block) for any request that does not match any of the rules. The rules in a
/// web ACL can be a combination of the types <a>Rule</a>, <a>RuleGroup</a>, and
/// managed rule group. You can associate a web ACL with one or more Amazon Web
/// Services resources to protect. The resource types include Amazon CloudFront
/// distribution, Amazon API Gateway REST API, Application Load Balancer,
/// AppSync GraphQL API, Amazon Cognito user pool, App Runner service, Amplify
/// application, and Amazon Web Services Verified Access instance.
///
/// @nodoc
class WebACL {
  /// The Amazon Resource Name (ARN) of the web ACL that you want to associate
  /// with the resource.
  final String arn;

  /// The action to perform if none of the <code>Rules</code> contained in the
  /// <code>WebACL</code> match.
  final DefaultAction defaultAction;

  /// A unique identifier for the <code>WebACL</code>. This ID is returned in the
  /// responses to create and list commands. You use this ID to do things like
  /// get, update, and delete a <code>WebACL</code>.
  final String id;

  /// The name of the web ACL. You cannot change the name of a web ACL after you
  /// create it.
  final String name;

  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  final VisibilityConfig visibilityConfig;

  /// Returns a list of <code>ApplicationAttribute</code>s.
  final ApplicationConfig? applicationConfig;

  /// Specifies custom configurations for the associations between the web ACL and
  /// protected resources.
  ///
  /// Use this to customize the maximum size of the request body that your
  /// protected resources forward to WAF for inspection. You can customize this
  /// setting for CloudFront, API Gateway, Amazon Cognito, App Runner, or Verified
  /// Access resources. The default setting is 16 KB (16,384 bytes).
  /// <note>
  /// You are charged additional fees when your protected resources forward body
  /// sizes that are larger than the default. For more information, see <a
  /// href="http://aws.amazon.com/waf/pricing/">WAF Pricing</a>.
  /// </note>
  /// For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192
  /// bytes).
  final AssociationConfig? associationConfig;

  /// The web ACL capacity units (WCUs) currently being used by this web ACL.
  ///
  /// WAF uses WCUs to calculate and control the operating resources that are used
  /// to run your rules, rule groups, and web ACLs. WAF calculates capacity
  /// differently for each rule type, to reflect the relative cost of each rule.
  /// Simple rules that cost little to run use fewer WCUs than more complex rules
  /// that use more processing power. Rule group capacity is fixed at creation,
  /// which helps users plan their web ACL WCU usage when they use a rule group.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html">WAF
  /// web ACL capacity units (WCU)</a> in the <i>WAF Developer Guide</i>.
  final int? capacity;

  /// Specifies how WAF should handle <code>CAPTCHA</code> evaluations for rules
  /// that don't have their own <code>CaptchaConfig</code> settings. If you don't
  /// specify this, WAF uses its default settings for <code>CaptchaConfig</code>.
  final CaptchaConfig? captchaConfig;

  /// Specifies how WAF should handle challenge evaluations for rules that don't
  /// have their own <code>ChallengeConfig</code> settings. If you don't specify
  /// this, WAF uses its default settings for <code>ChallengeConfig</code>.
  final ChallengeConfig? challengeConfig;

  /// A map of custom response keys and content bodies. When you create a rule
  /// with a block action, you can send a custom response to the web request. You
  /// define these for the web ACL, and then use them in the rules and default
  /// actions that you define in the web ACL.
  ///
  /// For information about customizing web requests and responses, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html">Customizing
  /// web requests and responses in WAF</a> in the <i>WAF Developer Guide</i>.
  ///
  /// For information about the limits on count and size for custom request and
  /// response settings, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/limits.html">WAF
  /// quotas</a> in the <i>WAF Developer Guide</i>.
  final Map<String, CustomResponseBody>? customResponseBodies;

  /// Specifies data protection to apply to the web request data for the web ACL.
  /// This is a web ACL level data protection option.
  ///
  /// The data protection that you configure for the web ACL alters the data
  /// that's available for any other data collection activity, including your WAF
  /// logging destinations, web ACL request sampling, and Amazon Security Lake
  /// data collection and management. Your other option for data protection is in
  /// the logging configuration, which only affects logging.
  final DataProtectionConfig? dataProtectionConfig;

  /// A description of the web ACL that helps with identification.
  final String? description;

  /// The label namespace prefix for this web ACL. All labels added by rules in
  /// this web ACL have this prefix.
  ///
  /// <ul>
  /// <li>
  /// The syntax for the label namespace prefix for a web ACL is the following:
  ///
  /// <code>awswaf:<account ID>:webacl:<web ACL name>:</code>
  /// </li>
  /// <li>
  /// When a rule with a label matches a web request, WAF adds the fully qualified
  /// label to the request. A fully qualified label is made up of the label
  /// namespace from the rule group or web ACL where the rule is defined and the
  /// label from the rule, separated by a colon:
  ///
  /// <code><label namespace>:<label from rule></code>
  /// </li>
  /// </ul>
  final String? labelNamespace;

  /// Indicates whether this web ACL was created by Firewall Manager and is being
  /// managed by Firewall Manager. If true, then only Firewall Manager can delete
  /// the web ACL or any Firewall Manager rule groups in the web ACL. See also the
  /// properties <code>RetrofittedByFirewallManager</code>,
  /// <code>PreProcessFirewallManagerRuleGroups</code>, and
  /// <code>PostProcessFirewallManagerRuleGroups</code>.
  final bool? managedByFirewallManager;

  /// Configures the level of DDoS protection that applies to web ACLs associated
  /// with Application Load Balancers.
  final OnSourceDDoSProtectionConfig? onSourceDDoSProtectionConfig;

  /// The last set of rules for WAF to process in the web ACL. This is defined in
  /// an Firewall Manager WAF policy and contains only rule group references. You
  /// can't alter these. Any rules and rule groups that you define for the web ACL
  /// are prioritized before these.
  ///
  /// In the Firewall Manager WAF policy, the Firewall Manager administrator can
  /// define a set of rule groups to run first in the web ACL and a set of rule
  /// groups to run last. Within each set, the administrator prioritizes the rule
  /// groups, to determine their relative processing order.
  final List<FirewallManagerRuleGroup>? postProcessFirewallManagerRuleGroups;

  /// The first set of rules for WAF to process in the web ACL. This is defined in
  /// an Firewall Manager WAF policy and contains only rule group references. You
  /// can't alter these. Any rules and rule groups that you define for the web ACL
  /// are prioritized after these.
  ///
  /// In the Firewall Manager WAF policy, the Firewall Manager administrator can
  /// define a set of rule groups to run first in the web ACL and a set of rule
  /// groups to run last. Within each set, the administrator prioritizes the rule
  /// groups, to determine their relative processing order.
  final List<FirewallManagerRuleGroup>? preProcessFirewallManagerRuleGroups;

  /// Indicates whether this web ACL was created by a customer account and then
  /// retrofitted by Firewall Manager. If true, then the web ACL is currently
  /// being managed by a Firewall Manager WAF policy, and only Firewall Manager
  /// can manage any Firewall Manager rule groups in the web ACL. See also the
  /// properties <code>ManagedByFirewallManager</code>,
  /// <code>PreProcessFirewallManagerRuleGroups</code>, and
  /// <code>PostProcessFirewallManagerRuleGroups</code>.
  final bool? retrofittedByFirewallManager;

  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to manage. Each rule includes one top-level statement that WAF uses to
  /// identify matching web requests, and parameters that govern how WAF handles
  /// them.
  final List<Rule>? rules;

  /// Specifies the domains that WAF should accept in a web request token. This
  /// enables the use of tokens across multiple protected websites. When WAF
  /// provides a token, it uses the domain of the Amazon Web Services resource
  /// that the web ACL is protecting. If you don't specify a list of token
  /// domains, WAF accepts tokens only for the domain of the protected resource.
  /// With a token domain list, WAF accepts the resource's host domain plus all
  /// domains in the token domain list, including their prefixed subdomains.
  final List<String>? tokenDomains;

  WebACL({
    required this.arn,
    required this.defaultAction,
    required this.id,
    required this.name,
    required this.visibilityConfig,
    this.applicationConfig,
    this.associationConfig,
    this.capacity,
    this.captchaConfig,
    this.challengeConfig,
    this.customResponseBodies,
    this.dataProtectionConfig,
    this.description,
    this.labelNamespace,
    this.managedByFirewallManager,
    this.onSourceDDoSProtectionConfig,
    this.postProcessFirewallManagerRuleGroups,
    this.preProcessFirewallManagerRuleGroups,
    this.retrofittedByFirewallManager,
    this.rules,
    this.tokenDomains,
  });

  factory WebACL.fromJson(Map<String, dynamic> json) {
    return WebACL(
      arn: (json['ARN'] as String?) ?? '',
      defaultAction: DefaultAction.fromJson(
          (json['DefaultAction'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      visibilityConfig: VisibilityConfig.fromJson(
          (json['VisibilityConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      applicationConfig: json['ApplicationConfig'] != null
          ? ApplicationConfig.fromJson(
              json['ApplicationConfig'] as Map<String, dynamic>)
          : null,
      associationConfig: json['AssociationConfig'] != null
          ? AssociationConfig.fromJson(
              json['AssociationConfig'] as Map<String, dynamic>)
          : null,
      capacity: json['Capacity'] as int?,
      captchaConfig: json['CaptchaConfig'] != null
          ? CaptchaConfig.fromJson(
              json['CaptchaConfig'] as Map<String, dynamic>)
          : null,
      challengeConfig: json['ChallengeConfig'] != null
          ? ChallengeConfig.fromJson(
              json['ChallengeConfig'] as Map<String, dynamic>)
          : null,
      customResponseBodies:
          (json['CustomResponseBodies'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k, CustomResponseBody.fromJson(e as Map<String, dynamic>))),
      dataProtectionConfig: json['DataProtectionConfig'] != null
          ? DataProtectionConfig.fromJson(
              json['DataProtectionConfig'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      labelNamespace: json['LabelNamespace'] as String?,
      managedByFirewallManager: json['ManagedByFirewallManager'] as bool?,
      onSourceDDoSProtectionConfig: json['OnSourceDDoSProtectionConfig'] != null
          ? OnSourceDDoSProtectionConfig.fromJson(
              json['OnSourceDDoSProtectionConfig'] as Map<String, dynamic>)
          : null,
      postProcessFirewallManagerRuleGroups:
          (json['PostProcessFirewallManagerRuleGroups'] as List?)
              ?.nonNulls
              .map((e) =>
                  FirewallManagerRuleGroup.fromJson(e as Map<String, dynamic>))
              .toList(),
      preProcessFirewallManagerRuleGroups:
          (json['PreProcessFirewallManagerRuleGroups'] as List?)
              ?.nonNulls
              .map((e) =>
                  FirewallManagerRuleGroup.fromJson(e as Map<String, dynamic>))
              .toList(),
      retrofittedByFirewallManager:
          json['RetrofittedByFirewallManager'] as bool?,
      rules: (json['Rules'] as List?)
          ?.nonNulls
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
      tokenDomains: (json['TokenDomains'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final defaultAction = this.defaultAction;
    final id = this.id;
    final name = this.name;
    final visibilityConfig = this.visibilityConfig;
    final applicationConfig = this.applicationConfig;
    final associationConfig = this.associationConfig;
    final capacity = this.capacity;
    final captchaConfig = this.captchaConfig;
    final challengeConfig = this.challengeConfig;
    final customResponseBodies = this.customResponseBodies;
    final dataProtectionConfig = this.dataProtectionConfig;
    final description = this.description;
    final labelNamespace = this.labelNamespace;
    final managedByFirewallManager = this.managedByFirewallManager;
    final onSourceDDoSProtectionConfig = this.onSourceDDoSProtectionConfig;
    final postProcessFirewallManagerRuleGroups =
        this.postProcessFirewallManagerRuleGroups;
    final preProcessFirewallManagerRuleGroups =
        this.preProcessFirewallManagerRuleGroups;
    final retrofittedByFirewallManager = this.retrofittedByFirewallManager;
    final rules = this.rules;
    final tokenDomains = this.tokenDomains;
    return {
      'ARN': arn,
      'DefaultAction': defaultAction,
      'Id': id,
      'Name': name,
      'VisibilityConfig': visibilityConfig,
      if (applicationConfig != null) 'ApplicationConfig': applicationConfig,
      if (associationConfig != null) 'AssociationConfig': associationConfig,
      if (capacity != null) 'Capacity': capacity,
      if (captchaConfig != null) 'CaptchaConfig': captchaConfig,
      if (challengeConfig != null) 'ChallengeConfig': challengeConfig,
      if (customResponseBodies != null)
        'CustomResponseBodies': customResponseBodies,
      if (dataProtectionConfig != null)
        'DataProtectionConfig': dataProtectionConfig,
      if (description != null) 'Description': description,
      if (labelNamespace != null) 'LabelNamespace': labelNamespace,
      if (managedByFirewallManager != null)
        'ManagedByFirewallManager': managedByFirewallManager,
      if (onSourceDDoSProtectionConfig != null)
        'OnSourceDDoSProtectionConfig': onSourceDDoSProtectionConfig,
      if (postProcessFirewallManagerRuleGroups != null)
        'PostProcessFirewallManagerRuleGroups':
            postProcessFirewallManagerRuleGroups,
      if (preProcessFirewallManagerRuleGroups != null)
        'PreProcessFirewallManagerRuleGroups':
            preProcessFirewallManagerRuleGroups,
      if (retrofittedByFirewallManager != null)
        'RetrofittedByFirewallManager': retrofittedByFirewallManager,
      if (rules != null) 'Rules': rules,
      if (tokenDomains != null) 'TokenDomains': tokenDomains,
    };
  }
}

/// A rule group that's defined for an Firewall Manager WAF policy.
///
/// @nodoc
class FirewallManagerRuleGroup {
  /// The processing guidance for an Firewall Manager rule. This is like a regular
  /// rule <a>Statement</a>, but it can only contain a rule group reference.
  final FirewallManagerStatement firewallManagerStatement;

  /// The name of the rule group. You cannot change the name of a rule group after
  /// you create it.
  final String name;

  /// The action to use in the place of the action that results from the rule
  /// group evaluation. Set the override action to none to leave the result of the
  /// rule group alone. Set it to count to override the result to count only.
  ///
  /// You can only use this for rule statements that reference a rule group, like
  /// <code>RuleGroupReferenceStatement</code> and
  /// <code>ManagedRuleGroupStatement</code>.
  /// <note>
  /// This option is usually set to none. It does not affect how the rules in the
  /// rule group are evaluated. If you want the rules in the rule group to only
  /// count matches, do not use this and instead use the rule action override
  /// option, with <code>Count</code> action, in your rule group reference
  /// statement settings.
  /// </note>
  final OverrideAction overrideAction;

  /// If you define more than one rule group in the first or last Firewall Manager
  /// rule groups, WAF evaluates each request against the rule groups in order,
  /// starting from the lowest priority setting. The priorities don't need to be
  /// consecutive, but they must all be different.
  final int priority;

  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  final VisibilityConfig visibilityConfig;

  FirewallManagerRuleGroup({
    required this.firewallManagerStatement,
    required this.name,
    required this.overrideAction,
    required this.priority,
    required this.visibilityConfig,
  });

  factory FirewallManagerRuleGroup.fromJson(Map<String, dynamic> json) {
    return FirewallManagerRuleGroup(
      firewallManagerStatement: FirewallManagerStatement.fromJson(
          (json['FirewallManagerStatement'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['Name'] as String?) ?? '',
      overrideAction: OverrideAction.fromJson(
          (json['OverrideAction'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      priority: (json['Priority'] as int?) ?? 0,
      visibilityConfig: VisibilityConfig.fromJson(
          (json['VisibilityConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final firewallManagerStatement = this.firewallManagerStatement;
    final name = this.name;
    final overrideAction = this.overrideAction;
    final priority = this.priority;
    final visibilityConfig = this.visibilityConfig;
    return {
      'FirewallManagerStatement': firewallManagerStatement,
      'Name': name,
      'OverrideAction': overrideAction,
      'Priority': priority,
      'VisibilityConfig': visibilityConfig,
    };
  }
}

/// The processing guidance for an Firewall Manager rule. This is like a regular
/// rule <a>Statement</a>, but it can only contain a single rule group
/// reference.
///
/// @nodoc
class FirewallManagerStatement {
  /// A statement used by Firewall Manager to run the rules that are defined in a
  /// managed rule group. This is managed by Firewall Manager for an Firewall
  /// Manager WAF policy.
  final ManagedRuleGroupStatement? managedRuleGroupStatement;

  /// A statement used by Firewall Manager to run the rules that are defined in a
  /// rule group. This is managed by Firewall Manager for an Firewall Manager WAF
  /// policy.
  final RuleGroupReferenceStatement? ruleGroupReferenceStatement;

  FirewallManagerStatement({
    this.managedRuleGroupStatement,
    this.ruleGroupReferenceStatement,
  });

  factory FirewallManagerStatement.fromJson(Map<String, dynamic> json) {
    return FirewallManagerStatement(
      managedRuleGroupStatement: json['ManagedRuleGroupStatement'] != null
          ? ManagedRuleGroupStatement.fromJson(
              json['ManagedRuleGroupStatement'] as Map<String, dynamic>)
          : null,
      ruleGroupReferenceStatement: json['RuleGroupReferenceStatement'] != null
          ? RuleGroupReferenceStatement.fromJson(
              json['RuleGroupReferenceStatement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final managedRuleGroupStatement = this.managedRuleGroupStatement;
    final ruleGroupReferenceStatement = this.ruleGroupReferenceStatement;
    return {
      if (managedRuleGroupStatement != null)
        'ManagedRuleGroupStatement': managedRuleGroupStatement,
      if (ruleGroupReferenceStatement != null)
        'RuleGroupReferenceStatement': ruleGroupReferenceStatement,
    };
  }
}

/// Statistics about bot traffic to a specific URI path, including the path,
/// request count, percentage of total traffic, and the top bots accessing that
/// path.
///
/// @nodoc
class PathStatistics {
  /// The URI path. For example, <code>/api/</code> or <code>/api/v1/users</code>.
  final String path;

  /// The percentage of total requests that were made to this path.
  final double percentage;

  /// The number of requests to this path within the specified time window.
  final int requestCount;

  /// Information about the bot filter that was applied to generate these
  /// statistics. This field is only populated when you filter by bot category,
  /// organization, or name.
  final FilterSource? source;

  /// The list of top bots accessing this path, ordered by request count. The
  /// number of bots included is determined by the
  /// <code>NumberOfTopTrafficBotsPerPath</code> parameter in the request.
  final List<BotStatistics>? topBots;

  PathStatistics({
    required this.path,
    required this.percentage,
    required this.requestCount,
    this.source,
    this.topBots,
  });

  factory PathStatistics.fromJson(Map<String, dynamic> json) {
    return PathStatistics(
      path: (json['Path'] as String?) ?? '',
      percentage: (json['Percentage'] as double?) ?? 0,
      requestCount: (json['RequestCount'] as int?) ?? 0,
      source: json['Source'] != null
          ? FilterSource.fromJson(json['Source'] as Map<String, dynamic>)
          : null,
      topBots: (json['TopBots'] as List?)
          ?.nonNulls
          .map((e) => BotStatistics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    final percentage = this.percentage;
    final requestCount = this.requestCount;
    final source = this.source;
    final topBots = this.topBots;
    return {
      'Path': path,
      'Percentage': percentage,
      'RequestCount': requestCount,
      if (source != null) 'Source': source,
      if (topBots != null) 'TopBots': topBots,
    };
  }
}

/// Information about the bot filter that was applied to the request. This
/// structure is populated in the response when you filter by bot category,
/// organization, or name.
///
/// @nodoc
class FilterSource {
  /// The bot category that was used to filter the results. For example,
  /// <code>ai</code> or <code>search_engine</code>.
  final String? botCategory;

  /// The bot name that was used to filter the results. For example,
  /// <code>gptbot</code> or <code>googlebot</code>.
  final String? botName;

  /// The bot organization that was used to filter the results. For example,
  /// <code>OpenAI</code> or <code>Google</code>.
  final String? botOrganization;

  FilterSource({
    this.botCategory,
    this.botName,
    this.botOrganization,
  });

  factory FilterSource.fromJson(Map<String, dynamic> json) {
    return FilterSource(
      botCategory: json['BotCategory'] as String?,
      botName: json['BotName'] as String?,
      botOrganization: json['BotOrganization'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botCategory = this.botCategory;
    final botName = this.botName;
    final botOrganization = this.botOrganization;
    return {
      if (botCategory != null) 'BotCategory': botCategory,
      if (botName != null) 'BotName': botName,
      if (botOrganization != null) 'BotOrganization': botOrganization,
    };
  }
}

/// Statistics about a specific bot's traffic to a path, including the bot name,
/// request count, and percentage of traffic.
///
/// @nodoc
class BotStatistics {
  /// The name of the bot. For example, <code>gptbot</code> or
  /// <code>googlebot</code>.
  final String botName;

  /// The percentage of total requests to the associated path that came from this
  /// bot.
  final double percentage;

  /// The number of requests from this bot to the associated path within the
  /// specified time window.
  final int requestCount;

  BotStatistics({
    required this.botName,
    required this.percentage,
    required this.requestCount,
  });

  factory BotStatistics.fromJson(Map<String, dynamic> json) {
    return BotStatistics(
      botName: (json['BotName'] as String?) ?? '',
      percentage: (json['Percentage'] as double?) ?? 0,
      requestCount: (json['RequestCount'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final botName = this.botName;
    final percentage = this.percentage;
    final requestCount = this.requestCount;
    return {
      'BotName': botName,
      'Percentage': percentage,
      'RequestCount': requestCount,
    };
  }
}

/// In a <a>GetSampledRequests</a> request, the <code>StartTime</code> and
/// <code>EndTime</code> objects specify the time range for which you want WAF
/// to return a sample of web requests.
///
/// You must specify the times in Coordinated Universal Time (UTC) format. UTC
/// format includes the special designator, <code>Z</code>. For example,
/// <code>"2016-09-27T14:50Z"</code>. You can specify any time range in the
/// previous three hours.
///
/// In a <a>GetSampledRequests</a> response, the <code>StartTime</code> and
/// <code>EndTime</code> objects specify the time range for which WAF actually
/// returned a sample of web requests. WAF gets the specified number of requests
/// from among the first 5,000 requests that your Amazon Web Services resource
/// receives during the specified time period. If your resource receives more
/// than 5,000 requests during that period, WAF stops sampling after the 5,000th
/// request. In that case, <code>EndTime</code> is the time that WAF received
/// the 5,000th request.
///
/// @nodoc
class TimeWindow {
  /// The end of the time range from which you want
  /// <code>GetSampledRequests</code> to return a sample of the requests that your
  /// Amazon Web Services resource received. You must specify the times in
  /// Coordinated Universal Time (UTC) format. UTC format includes the special
  /// designator, <code>Z</code>. For example, <code>"2016-09-27T14:50Z"</code>.
  /// You can specify any time range in the previous three hours.
  final DateTime endTime;

  /// The beginning of the time range from which you want
  /// <code>GetSampledRequests</code> to return a sample of the requests that your
  /// Amazon Web Services resource received. You must specify the times in
  /// Coordinated Universal Time (UTC) format. UTC format includes the special
  /// designator, <code>Z</code>. For example, <code>"2016-09-27T14:50Z"</code>.
  /// You can specify any time range in the previous three hours.
  final DateTime startTime;

  TimeWindow({
    required this.endTime,
    required this.startTime,
  });

  factory TimeWindow.fromJson(Map<String, dynamic> json) {
    return TimeWindow(
      endTime: nonNullableTimeStampFromJson(json['EndTime'] ?? 0),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'EndTime': unixTimestampToJson(endTime),
      'StartTime': unixTimestampToJson(startTime),
    };
  }
}

/// Represents a single sampled web request. The response from
/// <a>GetSampledRequests</a> includes a <code>SampledHTTPRequests</code>
/// complex type that appears as <code>SampledRequests</code> in the response
/// syntax. <code>SampledHTTPRequests</code> contains an array of
/// <code>SampledHTTPRequest</code> objects.
///
/// @nodoc
class SampledHTTPRequest {
  /// A complex type that contains detailed information about the request.
  final HTTPRequest request;

  /// A value that indicates how one result in the response relates proportionally
  /// to other results in the response. For example, a result that has a weight of
  /// <code>2</code> represents roughly twice as many web requests as a result
  /// that has a weight of <code>1</code>.
  final int weight;

  /// The action that WAF applied to the request.
  final String? action;

  /// The <code>CAPTCHA</code> response for the request.
  final CaptchaResponse? captchaResponse;

  /// The <code>Challenge</code> response for the request.
  final ChallengeResponse? challengeResponse;

  /// Labels applied to the web request by matching rules. WAF applies fully
  /// qualified labels to matching web requests. A fully qualified label is the
  /// concatenation of a label namespace and a rule label. The rule's rule group
  /// or web ACL defines the label namespace.
  ///
  /// For example,
  /// <code>awswaf:111122223333:myRuleGroup:testRules:testNS1:testNS2:labelNameA</code>
  /// or <code>awswaf:managed:aws:managed-rule-set:header:encoding:utf8</code>.
  final List<Label>? labels;

  /// Used only for rule group rules that have a rule action override in place in
  /// the web ACL. This is the action that the rule group rule is configured for,
  /// and not the action that was applied to the request. The action that WAF
  /// applied is the <code>Action</code> value.
  final String? overriddenAction;

  /// Custom request headers inserted by WAF into the request, according to the
  /// custom request configuration for the matching rule action.
  final List<HTTPHeader>? requestHeadersInserted;

  /// The response code that was sent for the request.
  final int? responseCodeSent;

  /// The name of the <code>Rule</code> that the request matched. For managed rule
  /// groups, the format for this name is <code><vendor name>#<managed rule group
  /// name>#<rule name></code>. For your own rule groups, the format for this name
  /// is <code><rule group name>#<rule name></code>. If the rule is not in a rule
  /// group, this field is absent.
  final String? ruleNameWithinRuleGroup;

  /// The time at which WAF received the request from your Amazon Web Services
  /// resource, in Unix time format (in seconds).
  final DateTime? timestamp;

  SampledHTTPRequest({
    required this.request,
    required this.weight,
    this.action,
    this.captchaResponse,
    this.challengeResponse,
    this.labels,
    this.overriddenAction,
    this.requestHeadersInserted,
    this.responseCodeSent,
    this.ruleNameWithinRuleGroup,
    this.timestamp,
  });

  factory SampledHTTPRequest.fromJson(Map<String, dynamic> json) {
    return SampledHTTPRequest(
      request: HTTPRequest.fromJson(
          (json['Request'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      weight: (json['Weight'] as int?) ?? 0,
      action: json['Action'] as String?,
      captchaResponse: json['CaptchaResponse'] != null
          ? CaptchaResponse.fromJson(
              json['CaptchaResponse'] as Map<String, dynamic>)
          : null,
      challengeResponse: json['ChallengeResponse'] != null
          ? ChallengeResponse.fromJson(
              json['ChallengeResponse'] as Map<String, dynamic>)
          : null,
      labels: (json['Labels'] as List?)
          ?.nonNulls
          .map((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList(),
      overriddenAction: json['OverriddenAction'] as String?,
      requestHeadersInserted: (json['RequestHeadersInserted'] as List?)
          ?.nonNulls
          .map((e) => HTTPHeader.fromJson(e as Map<String, dynamic>))
          .toList(),
      responseCodeSent: json['ResponseCodeSent'] as int?,
      ruleNameWithinRuleGroup: json['RuleNameWithinRuleGroup'] as String?,
      timestamp: timeStampFromJson(json['Timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final request = this.request;
    final weight = this.weight;
    final action = this.action;
    final captchaResponse = this.captchaResponse;
    final challengeResponse = this.challengeResponse;
    final labels = this.labels;
    final overriddenAction = this.overriddenAction;
    final requestHeadersInserted = this.requestHeadersInserted;
    final responseCodeSent = this.responseCodeSent;
    final ruleNameWithinRuleGroup = this.ruleNameWithinRuleGroup;
    final timestamp = this.timestamp;
    return {
      'Request': request,
      'Weight': weight,
      if (action != null) 'Action': action,
      if (captchaResponse != null) 'CaptchaResponse': captchaResponse,
      if (challengeResponse != null) 'ChallengeResponse': challengeResponse,
      if (labels != null) 'Labels': labels,
      if (overriddenAction != null) 'OverriddenAction': overriddenAction,
      if (requestHeadersInserted != null)
        'RequestHeadersInserted': requestHeadersInserted,
      if (responseCodeSent != null) 'ResponseCodeSent': responseCodeSent,
      if (ruleNameWithinRuleGroup != null)
        'RuleNameWithinRuleGroup': ruleNameWithinRuleGroup,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// Part of the response from <a>GetSampledRequests</a>. This is a complex type
/// that appears as <code>Request</code> in the response syntax.
/// <code>HTTPRequest</code> contains information about one of the web requests.
///
/// @nodoc
class HTTPRequest {
  /// The IP address that the request originated from. If the web ACL is
  /// associated with a CloudFront distribution, this is the value of one of the
  /// following fields in CloudFront access logs:
  ///
  /// <ul>
  /// <li>
  /// <code>c-ip</code>, if the viewer did not use an HTTP proxy or a load
  /// balancer to send the request
  /// </li>
  /// <li>
  /// <code>x-forwarded-for</code>, if the viewer did use an HTTP proxy or a load
  /// balancer to send the request
  /// </li>
  /// </ul>
  final String? clientIP;

  /// The two-letter country code for the country that the request originated
  /// from. For a current list of country codes, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166-1
  /// alpha-2</a>.
  final String? country;

  /// The HTTP version specified in the sampled web request, for example,
  /// <code>HTTP/1.1</code>.
  final String? hTTPVersion;

  /// A complex type that contains the name and value for each header in the
  /// sampled web request.
  final List<HTTPHeader>? headers;

  /// The HTTP method specified in the sampled web request.
  final String? method;

  /// The URI path of the request, which identifies the resource, for example,
  /// <code>/images/daily-ad.jpg</code>.
  final String? uri;

  HTTPRequest({
    this.clientIP,
    this.country,
    this.hTTPVersion,
    this.headers,
    this.method,
    this.uri,
  });

  factory HTTPRequest.fromJson(Map<String, dynamic> json) {
    return HTTPRequest(
      clientIP: json['ClientIP'] as String?,
      country: json['Country'] as String?,
      hTTPVersion: json['HTTPVersion'] as String?,
      headers: (json['Headers'] as List?)
          ?.nonNulls
          .map((e) => HTTPHeader.fromJson(e as Map<String, dynamic>))
          .toList(),
      method: json['Method'] as String?,
      uri: json['URI'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientIP = this.clientIP;
    final country = this.country;
    final hTTPVersion = this.hTTPVersion;
    final headers = this.headers;
    final method = this.method;
    final uri = this.uri;
    return {
      if (clientIP != null) 'ClientIP': clientIP,
      if (country != null) 'Country': country,
      if (hTTPVersion != null) 'HTTPVersion': hTTPVersion,
      if (headers != null) 'Headers': headers,
      if (method != null) 'Method': method,
      if (uri != null) 'URI': uri,
    };
  }
}

/// The result from the inspection of the web request for a valid
/// <code>CAPTCHA</code> token.
///
/// @nodoc
class CaptchaResponse {
  /// The reason for failure, populated when the evaluation of the token fails.
  final FailureReason? failureReason;

  /// The HTTP response code indicating the status of the <code>CAPTCHA</code>
  /// token in the web request. If the token is missing, invalid, or expired, this
  /// code is <code>405 Method Not Allowed</code>.
  final int? responseCode;

  /// The time that the <code>CAPTCHA</code> was last solved for the supplied
  /// token.
  final int? solveTimestamp;

  CaptchaResponse({
    this.failureReason,
    this.responseCode,
    this.solveTimestamp,
  });

  factory CaptchaResponse.fromJson(Map<String, dynamic> json) {
    return CaptchaResponse(
      failureReason:
          (json['FailureReason'] as String?)?.let(FailureReason.fromString),
      responseCode: json['ResponseCode'] as int?,
      solveTimestamp: json['SolveTimestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureReason = this.failureReason;
    final responseCode = this.responseCode;
    final solveTimestamp = this.solveTimestamp;
    return {
      if (failureReason != null) 'FailureReason': failureReason.value,
      if (responseCode != null) 'ResponseCode': responseCode,
      if (solveTimestamp != null) 'SolveTimestamp': solveTimestamp,
    };
  }
}

/// The result from the inspection of the web request for a valid challenge
/// token.
///
/// @nodoc
class ChallengeResponse {
  /// The reason for failure, populated when the evaluation of the token fails.
  final FailureReason? failureReason;

  /// The HTTP response code indicating the status of the challenge token in the
  /// web request. If the token is missing, invalid, or expired, this code is
  /// <code>202 Request Accepted</code>.
  final int? responseCode;

  /// The time that the challenge was last solved for the supplied token.
  final int? solveTimestamp;

  ChallengeResponse({
    this.failureReason,
    this.responseCode,
    this.solveTimestamp,
  });

  factory ChallengeResponse.fromJson(Map<String, dynamic> json) {
    return ChallengeResponse(
      failureReason:
          (json['FailureReason'] as String?)?.let(FailureReason.fromString),
      responseCode: json['ResponseCode'] as int?,
      solveTimestamp: json['SolveTimestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureReason = this.failureReason;
    final responseCode = this.responseCode;
    final solveTimestamp = this.solveTimestamp;
    return {
      if (failureReason != null) 'FailureReason': failureReason.value,
      if (responseCode != null) 'ResponseCode': responseCode,
      if (solveTimestamp != null) 'SolveTimestamp': solveTimestamp,
    };
  }
}

/// @nodoc
class FailureReason {
  static const tokenMissing = FailureReason._('TOKEN_MISSING');
  static const tokenExpired = FailureReason._('TOKEN_EXPIRED');
  static const tokenInvalid = FailureReason._('TOKEN_INVALID');
  static const tokenDomainMismatch = FailureReason._('TOKEN_DOMAIN_MISMATCH');

  final String value;

  const FailureReason._(this.value);

  static const values = [
    tokenMissing,
    tokenExpired,
    tokenInvalid,
    tokenDomainMismatch
  ];

  static FailureReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FailureReason._(value));

  @override
  bool operator ==(other) => other is FailureReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Part of the response from <a>GetSampledRequests</a>. This is a complex type
/// that appears as <code>Headers</code> in the response syntax.
/// <code>HTTPHeader</code> contains the names and values of all of the headers
/// that appear in one of the web requests.
///
/// @nodoc
class HTTPHeader {
  /// The name of the HTTP header.
  final String? name;

  /// The value of the HTTP header.
  final String? value;

  HTTPHeader({
    this.name,
    this.value,
  });

  factory HTTPHeader.fromJson(Map<String, dynamic> json) {
    return HTTPHeader(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

/// A rule group defines a collection of rules to inspect and control web
/// requests that you can use in a <a>WebACL</a>. When you create a rule group,
/// you define an immutable capacity limit. If you update a rule group, you must
/// stay within the capacity. This allows others to reuse the rule group with
/// confidence in its capacity requirements.
///
/// @nodoc
class RuleGroup {
  /// The Amazon Resource Name (ARN) of the entity.
  final String arn;

  /// The web ACL capacity units (WCUs) required for this rule group.
  ///
  /// When you create your own rule group, you define this, and you cannot change
  /// it after creation. When you add or modify the rules in a rule group, WAF
  /// enforces this limit. You can check the capacity for a set of rules using
  /// <a>CheckCapacity</a>.
  ///
  /// WAF uses WCUs to calculate and control the operating resources that are used
  /// to run your rules, rule groups, and web ACLs. WAF calculates capacity
  /// differently for each rule type, to reflect the relative cost of each rule.
  /// Simple rules that cost little to run use fewer WCUs than more complex rules
  /// that use more processing power. Rule group capacity is fixed at creation,
  /// which helps users plan their web ACL WCU usage when they use a rule group.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html">WAF
  /// web ACL capacity units (WCU)</a> in the <i>WAF Developer Guide</i>.
  final int capacity;

  /// A unique identifier for the rule group. This ID is returned in the responses
  /// to create and list commands. You provide it to operations like update and
  /// delete.
  final String id;

  /// The name of the rule group. You cannot change the name of a rule group after
  /// you create it.
  final String name;

  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  final VisibilityConfig visibilityConfig;

  /// The labels that one or more rules in this rule group add to matching web
  /// requests. These labels are defined in the <code>RuleLabels</code> for a
  /// <a>Rule</a>.
  final List<LabelSummary>? availableLabels;

  /// The labels that one or more rules in this rule group match against in label
  /// match statements. These labels are defined in a
  /// <code>LabelMatchStatement</code> specification, in the <a>Statement</a>
  /// definition of a rule.
  final List<LabelSummary>? consumedLabels;

  /// A map of custom response keys and content bodies. When you create a rule
  /// with a block action, you can send a custom response to the web request. You
  /// define these for the rule group, and then use them in the rules that you
  /// define in the rule group.
  ///
  /// For information about customizing web requests and responses, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html">Customizing
  /// web requests and responses in WAF</a> in the <i>WAF Developer Guide</i>.
  ///
  /// For information about the limits on count and size for custom request and
  /// response settings, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/limits.html">WAF
  /// quotas</a> in the <i>WAF Developer Guide</i>.
  final Map<String, CustomResponseBody>? customResponseBodies;

  /// A description of the rule group that helps with identification.
  final String? description;

  /// The label namespace prefix for this rule group. All labels added by rules in
  /// this rule group have this prefix.
  ///
  /// <ul>
  /// <li>
  /// The syntax for the label namespace prefix for your rule groups is the
  /// following:
  ///
  /// <code>awswaf:<account ID>:rulegroup:<rule group name>:</code>
  /// </li>
  /// <li>
  /// When a rule with a label matches a web request, WAF adds the fully qualified
  /// label to the request. A fully qualified label is made up of the label
  /// namespace from the rule group or web ACL where the rule is defined and the
  /// label from the rule, separated by a colon:
  ///
  /// <code><label namespace>:<label from rule></code>
  /// </li>
  /// </ul>
  final String? labelNamespace;

  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to manage. Each rule includes one top-level statement that WAF uses to
  /// identify matching web requests, and parameters that govern how WAF handles
  /// them.
  final List<Rule>? rules;

  RuleGroup({
    required this.arn,
    required this.capacity,
    required this.id,
    required this.name,
    required this.visibilityConfig,
    this.availableLabels,
    this.consumedLabels,
    this.customResponseBodies,
    this.description,
    this.labelNamespace,
    this.rules,
  });

  factory RuleGroup.fromJson(Map<String, dynamic> json) {
    return RuleGroup(
      arn: (json['ARN'] as String?) ?? '',
      capacity: (json['Capacity'] as int?) ?? 0,
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      visibilityConfig: VisibilityConfig.fromJson(
          (json['VisibilityConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      availableLabels: (json['AvailableLabels'] as List?)
          ?.nonNulls
          .map((e) => LabelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      consumedLabels: (json['ConsumedLabels'] as List?)
          ?.nonNulls
          .map((e) => LabelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      customResponseBodies:
          (json['CustomResponseBodies'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k, CustomResponseBody.fromJson(e as Map<String, dynamic>))),
      description: json['Description'] as String?,
      labelNamespace: json['LabelNamespace'] as String?,
      rules: (json['Rules'] as List?)
          ?.nonNulls
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final capacity = this.capacity;
    final id = this.id;
    final name = this.name;
    final visibilityConfig = this.visibilityConfig;
    final availableLabels = this.availableLabels;
    final consumedLabels = this.consumedLabels;
    final customResponseBodies = this.customResponseBodies;
    final description = this.description;
    final labelNamespace = this.labelNamespace;
    final rules = this.rules;
    return {
      'ARN': arn,
      'Capacity': capacity,
      'Id': id,
      'Name': name,
      'VisibilityConfig': visibilityConfig,
      if (availableLabels != null) 'AvailableLabels': availableLabels,
      if (consumedLabels != null) 'ConsumedLabels': consumedLabels,
      if (customResponseBodies != null)
        'CustomResponseBodies': customResponseBodies,
      if (description != null) 'Description': description,
      if (labelNamespace != null) 'LabelNamespace': labelNamespace,
      if (rules != null) 'Rules': rules,
    };
  }
}

/// List of labels used by one or more of the rules of a <a>RuleGroup</a>. This
/// summary object is used for the following rule group lists:
///
/// <ul>
/// <li>
/// <code>AvailableLabels</code> - Labels that rules add to matching requests.
/// These labels are defined in the <code>RuleLabels</code> for a <a>Rule</a>.
/// </li>
/// <li>
/// <code>ConsumedLabels</code> - Labels that rules match against. These labels
/// are defined in a <code>LabelMatchStatement</code> specification, in the
/// <a>Statement</a> definition of a rule.
/// </li>
/// </ul>
///
/// @nodoc
class LabelSummary {
  /// An individual label specification.
  final String? name;

  LabelSummary({
    this.name,
  });

  factory LabelSummary.fromJson(Map<String, dynamic> json) {
    return LabelSummary(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// Contains one or more regular expressions.
///
/// WAF assigns an ARN to each <code>RegexPatternSet</code> that you create. To
/// use a set in a rule, you provide the ARN to the <a>Rule</a> statement
/// <a>RegexPatternSetReferenceStatement</a>.
///
/// @nodoc
class RegexPatternSet {
  /// The Amazon Resource Name (ARN) of the entity.
  final String? arn;

  /// A description of the set that helps with identification.
  final String? description;

  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  final String? id;

  /// The name of the set. You cannot change the name after you create the set.
  final String? name;

  /// The regular expression patterns in the set.
  final List<Regex>? regularExpressionList;

  RegexPatternSet({
    this.arn,
    this.description,
    this.id,
    this.name,
    this.regularExpressionList,
  });

  factory RegexPatternSet.fromJson(Map<String, dynamic> json) {
    return RegexPatternSet(
      arn: json['ARN'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      regularExpressionList: (json['RegularExpressionList'] as List?)
          ?.nonNulls
          .map((e) => Regex.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final regularExpressionList = this.regularExpressionList;
    return {
      if (arn != null) 'ARN': arn,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (regularExpressionList != null)
        'RegularExpressionList': regularExpressionList,
    };
  }
}

/// The set of IP addresses that are currently blocked for a
/// <a>RateBasedStatement</a>. This is only available for rate-based rules that
/// aggregate on just the IP address, with the <code>AggregateKeyType</code> set
/// to <code>IP</code> or <code>FORWARDED_IP</code>.
///
/// A rate-based rule applies its rule action to requests from IP addresses that
/// are in the rule's managed keys list and that match the rule's scope-down
/// statement. When a rule has no scope-down statement, it applies the action to
/// all requests from the IP addresses that are in the list. The rule applies
/// its rule action to rate limit the matching requests. The action is usually
/// Block but it can be any valid rule action except for Allow.
///
/// The maximum number of IP addresses that can be rate limited by a single
/// rate-based rule instance is 10,000. If more than 10,000 addresses exceed the
/// rate limit, WAF limits those with the highest rates.
///
/// @nodoc
class RateBasedStatementManagedKeysIPSet {
  /// The IP addresses that are currently blocked.
  final List<String>? addresses;

  /// The version of the IP addresses, either <code>IPV4</code> or
  /// <code>IPV6</code>.
  final IPAddressVersion? iPAddressVersion;

  RateBasedStatementManagedKeysIPSet({
    this.addresses,
    this.iPAddressVersion,
  });

  factory RateBasedStatementManagedKeysIPSet.fromJson(
      Map<String, dynamic> json) {
    return RateBasedStatementManagedKeysIPSet(
      addresses: (json['Addresses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      iPAddressVersion: (json['IPAddressVersion'] as String?)
          ?.let(IPAddressVersion.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final addresses = this.addresses;
    final iPAddressVersion = this.iPAddressVersion;
    return {
      if (addresses != null) 'Addresses': addresses,
      if (iPAddressVersion != null) 'IPAddressVersion': iPAddressVersion.value,
    };
  }
}

/// @nodoc
class IPAddressVersion {
  static const ipv4 = IPAddressVersion._('IPV4');
  static const ipv6 = IPAddressVersion._('IPV6');

  final String value;

  const IPAddressVersion._(this.value);

  static const values = [ipv4, ipv6];

  static IPAddressVersion fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IPAddressVersion._(value));

  @override
  bool operator ==(other) => other is IPAddressVersion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information for a release of the mobile SDK, including release notes and
/// tags.
///
/// The mobile SDK is not generally available. Customers who have access to the
/// mobile SDK can use it to establish and manage WAF tokens for use in HTTP(S)
/// requests from a mobile device to WAF. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html">WAF
/// client application integration</a> in the <i>WAF Developer Guide</i>.
///
/// @nodoc
class MobileSdkRelease {
  /// Notes describing the release.
  final String? releaseNotes;

  /// The release version.
  final String? releaseVersion;

  /// Tags that are associated with the release.
  final List<Tag>? tags;

  /// The timestamp of the release.
  final DateTime? timestamp;

  MobileSdkRelease({
    this.releaseNotes,
    this.releaseVersion,
    this.tags,
    this.timestamp,
  });

  factory MobileSdkRelease.fromJson(Map<String, dynamic> json) {
    return MobileSdkRelease(
      releaseNotes: json['ReleaseNotes'] as String?,
      releaseVersion: json['ReleaseVersion'] as String?,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: timeStampFromJson(json['Timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final releaseNotes = this.releaseNotes;
    final releaseVersion = this.releaseVersion;
    final tags = this.tags;
    final timestamp = this.timestamp;
    return {
      if (releaseNotes != null) 'ReleaseNotes': releaseNotes,
      if (releaseVersion != null) 'ReleaseVersion': releaseVersion,
      if (tags != null) 'Tags': tags,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// A set of rules that is managed by Amazon Web Services and Amazon Web
/// Services Marketplace sellers to provide versioned managed rule groups for
/// customers of WAF.
/// <note>
/// This is intended for use only by vendors of managed rule sets. Vendors are
/// Amazon Web Services and Amazon Web Services Marketplace sellers.
///
/// Vendors, you can use the managed rule set APIs to provide controlled rollout
/// of your versioned managed rule group offerings for your customers. The APIs
/// are <code>ListManagedRuleSets</code>, <code>GetManagedRuleSet</code>,
/// <code>PutManagedRuleSetVersions</code>, and
/// <code>UpdateManagedRuleSetVersionExpiryDate</code>.
/// </note>
///
/// @nodoc
class ManagedRuleSet {
  /// The Amazon Resource Name (ARN) of the entity.
  final String arn;

  /// A unique identifier for the managed rule set. The ID is returned in the
  /// responses to commands like <code>list</code>. You provide it to operations
  /// like <code>get</code> and <code>update</code>.
  final String id;

  /// The name of the managed rule set. You use this, along with the rule set ID,
  /// to identify the rule set.
  ///
  /// This name is assigned to the corresponding managed rule group, which your
  /// customers can access and use.
  final String name;

  /// A description of the set that helps with identification.
  final String? description;

  /// The label namespace prefix for the managed rule groups that are offered to
  /// customers from this managed rule set. All labels that are added by rules in
  /// the managed rule group have this prefix.
  ///
  /// <ul>
  /// <li>
  /// The syntax for the label namespace prefix for a managed rule group is the
  /// following:
  ///
  /// <code>awswaf:managed:<vendor>:<rule group name></code>:
  /// </li>
  /// <li>
  /// When a rule with a label matches a web request, WAF adds the fully qualified
  /// label to the request. A fully qualified label is made up of the label
  /// namespace from the rule group or web ACL where the rule is defined and the
  /// label from the rule, separated by a colon:
  ///
  /// <code><label namespace>:<label from rule></code>
  /// </li>
  /// </ul>
  final String? labelNamespace;

  /// The versions of this managed rule set that are available for use by
  /// customers.
  final Map<String, ManagedRuleSetVersion>? publishedVersions;

  /// The version that you would like your customers to use.
  final String? recommendedVersion;

  ManagedRuleSet({
    required this.arn,
    required this.id,
    required this.name,
    this.description,
    this.labelNamespace,
    this.publishedVersions,
    this.recommendedVersion,
  });

  factory ManagedRuleSet.fromJson(Map<String, dynamic> json) {
    return ManagedRuleSet(
      arn: (json['ARN'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      description: json['Description'] as String?,
      labelNamespace: json['LabelNamespace'] as String?,
      publishedVersions: (json['PublishedVersions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, ManagedRuleSetVersion.fromJson(e as Map<String, dynamic>))),
      recommendedVersion: json['RecommendedVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final description = this.description;
    final labelNamespace = this.labelNamespace;
    final publishedVersions = this.publishedVersions;
    final recommendedVersion = this.recommendedVersion;
    return {
      'ARN': arn,
      'Id': id,
      'Name': name,
      if (description != null) 'Description': description,
      if (labelNamespace != null) 'LabelNamespace': labelNamespace,
      if (publishedVersions != null) 'PublishedVersions': publishedVersions,
      if (recommendedVersion != null) 'RecommendedVersion': recommendedVersion,
    };
  }
}

/// Information for a single version of a managed rule set.
/// <note>
/// This is intended for use only by vendors of managed rule sets. Vendors are
/// Amazon Web Services and Amazon Web Services Marketplace sellers.
///
/// Vendors, you can use the managed rule set APIs to provide controlled rollout
/// of your versioned managed rule group offerings for your customers. The APIs
/// are <code>ListManagedRuleSets</code>, <code>GetManagedRuleSet</code>,
/// <code>PutManagedRuleSetVersions</code>, and
/// <code>UpdateManagedRuleSetVersionExpiryDate</code>.
/// </note>
///
/// @nodoc
class ManagedRuleSetVersion {
  /// The Amazon Resource Name (ARN) of the vendor rule group that's used to
  /// define the published version of your managed rule group.
  final String? associatedRuleGroupArn;

  /// The web ACL capacity units (WCUs) required for this rule group.
  ///
  /// WAF uses WCUs to calculate and control the operating resources that are used
  /// to run your rules, rule groups, and web ACLs. WAF calculates capacity
  /// differently for each rule type, to reflect the relative cost of each rule.
  /// Simple rules that cost little to run use fewer WCUs than more complex rules
  /// that use more processing power. Rule group capacity is fixed at creation,
  /// which helps users plan their web ACL WCU usage when they use a rule group.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html">WAF
  /// web ACL capacity units (WCU)</a> in the <i>WAF Developer Guide</i>.
  final int? capacity;

  /// The time that this version is set to expire.
  ///
  /// Times are in Coordinated Universal Time (UTC) format. UTC format includes
  /// the special designator, Z. For example, "2016-09-27T14:50Z".
  final DateTime? expiryTimestamp;

  /// The amount of time you expect this version of your managed rule group to
  /// last, in days.
  final int? forecastedLifetime;

  /// The last time that you updated this version.
  ///
  /// Times are in Coordinated Universal Time (UTC) format. UTC format includes
  /// the special designator, Z. For example, "2016-09-27T14:50Z".
  final DateTime? lastUpdateTimestamp;

  /// The time that you first published this version.
  ///
  /// Times are in Coordinated Universal Time (UTC) format. UTC format includes
  /// the special designator, Z. For example, "2016-09-27T14:50Z".
  final DateTime? publishTimestamp;

  ManagedRuleSetVersion({
    this.associatedRuleGroupArn,
    this.capacity,
    this.expiryTimestamp,
    this.forecastedLifetime,
    this.lastUpdateTimestamp,
    this.publishTimestamp,
  });

  factory ManagedRuleSetVersion.fromJson(Map<String, dynamic> json) {
    return ManagedRuleSetVersion(
      associatedRuleGroupArn: json['AssociatedRuleGroupArn'] as String?,
      capacity: json['Capacity'] as int?,
      expiryTimestamp: timeStampFromJson(json['ExpiryTimestamp']),
      forecastedLifetime: json['ForecastedLifetime'] as int?,
      lastUpdateTimestamp: timeStampFromJson(json['LastUpdateTimestamp']),
      publishTimestamp: timeStampFromJson(json['PublishTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final associatedRuleGroupArn = this.associatedRuleGroupArn;
    final capacity = this.capacity;
    final expiryTimestamp = this.expiryTimestamp;
    final forecastedLifetime = this.forecastedLifetime;
    final lastUpdateTimestamp = this.lastUpdateTimestamp;
    final publishTimestamp = this.publishTimestamp;
    return {
      if (associatedRuleGroupArn != null)
        'AssociatedRuleGroupArn': associatedRuleGroupArn,
      if (capacity != null) 'Capacity': capacity,
      if (expiryTimestamp != null)
        'ExpiryTimestamp': unixTimestampToJson(expiryTimestamp),
      if (forecastedLifetime != null) 'ForecastedLifetime': forecastedLifetime,
      if (lastUpdateTimestamp != null)
        'LastUpdateTimestamp': unixTimestampToJson(lastUpdateTimestamp),
      if (publishTimestamp != null)
        'PublishTimestamp': unixTimestampToJson(publishTimestamp),
    };
  }
}

/// Contains zero or more IP addresses or blocks of IP addresses specified in
/// Classless Inter-Domain Routing (CIDR) notation. WAF supports all IPv4 and
/// IPv6 CIDR ranges except for /0. For information about CIDR notation, see the
/// Wikipedia entry <a
/// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
/// Inter-Domain Routing</a>.
///
/// WAF assigns an ARN to each <code>IPSet</code> that you create. To use an IP
/// set in a rule, you provide the ARN to the <a>Rule</a> statement
/// <a>IPSetReferenceStatement</a>.
///
/// @nodoc
class IPSet {
  /// The Amazon Resource Name (ARN) of the entity.
  final String arn;

  /// Contains an array of strings that specifies zero or more IP addresses or
  /// blocks of IP addresses that you want WAF to inspect for in incoming
  /// requests. All addresses must be specified using Classless Inter-Domain
  /// Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except
  /// for <code>/0</code>.
  ///
  /// Example address strings:
  ///
  /// <ul>
  /// <li>
  /// For requests that originated from the IP address 192.0.2.44, specify
  /// <code>192.0.2.44/32</code>.
  /// </li>
  /// <li>
  /// For requests that originated from IP addresses from 192.0.2.0 to
  /// 192.0.2.255, specify <code>192.0.2.0/24</code>.
  /// </li>
  /// <li>
  /// For requests that originated from the IP address
  /// 1111:0000:0000:0000:0000:0000:0000:0111, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0111/128</code>.
  /// </li>
  /// <li>
  /// For requests that originated from IP addresses
  /// 1111:0000:0000:0000:0000:0000:0000:0000 to
  /// 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0000/64</code>.
  /// </li>
  /// </ul>
  /// For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  ///
  /// Example JSON <code>Addresses</code> specifications:
  ///
  /// <ul>
  /// <li>
  /// Empty array: <code>"Addresses": \[\]</code>
  /// </li>
  /// <li>
  /// Array with one address: <code>"Addresses": \["192.0.2.44/32"\]</code>
  /// </li>
  /// <li>
  /// Array with three addresses: <code>"Addresses": \["192.0.2.44/32",
  /// "192.0.2.0/24", "192.0.0.0/16"\]</code>
  /// </li>
  /// <li>
  /// INVALID specification: <code>"Addresses": \[""\]</code> INVALID
  /// </li>
  /// </ul>
  final List<String> addresses;

  /// The version of the IP addresses, either <code>IPV4</code> or
  /// <code>IPV6</code>.
  final IPAddressVersion iPAddressVersion;

  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  final String id;

  /// The name of the IP set. You cannot change the name of an <code>IPSet</code>
  /// after you create it.
  final String name;

  /// A description of the IP set that helps with identification.
  final String? description;

  IPSet({
    required this.arn,
    required this.addresses,
    required this.iPAddressVersion,
    required this.id,
    required this.name,
    this.description,
  });

  factory IPSet.fromJson(Map<String, dynamic> json) {
    return IPSet(
      arn: (json['ARN'] as String?) ?? '',
      addresses: ((json['Addresses'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      iPAddressVersion: IPAddressVersion.fromString(
          (json['IPAddressVersion'] as String?) ?? ''),
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final addresses = this.addresses;
    final iPAddressVersion = this.iPAddressVersion;
    final id = this.id;
    final name = this.name;
    final description = this.description;
    return {
      'ARN': arn,
      'Addresses': addresses,
      'IPAddressVersion': iPAddressVersion.value,
      'Id': id,
      'Name': name,
      if (description != null) 'Description': description,
    };
  }
}

/// High-level information about a <a>Rule</a>, returned by operations like
/// <a>DescribeManagedRuleGroup</a>. This provides information like the ID, that
/// you can use to retrieve and manage a <code>RuleGroup</code>, and the ARN,
/// that you provide to the <a>RuleGroupReferenceStatement</a> to use the rule
/// group in a <a>Rule</a>.
///
/// @nodoc
class RuleSummary {
  /// The action that WAF should take on a web request when it matches a rule's
  /// statement. Settings at the web ACL level can override the rule action
  /// setting.
  final RuleAction? action;

  /// The name of the rule.
  final String? name;

  RuleSummary({
    this.action,
    this.name,
  });

  factory RuleSummary.fromJson(Map<String, dynamic> json) {
    return RuleSummary(
      action: json['Action'] != null
          ? RuleAction.fromJson(json['Action'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final name = this.name;
    return {
      if (action != null) 'Action': action,
      if (name != null) 'Name': name,
    };
  }
}

/// The properties of a managed product, such as an Amazon Web Services Managed
/// Rules rule group or an Amazon Web Services Marketplace managed rule group.
///
/// @nodoc
class ManagedProductDescriptor {
  /// Indicates whether the rule group provides an advanced set of protections,
  /// such as the the Amazon Web Services Managed Rules rule groups that are used
  /// for WAF intelligent threat mitigation.
  final bool? isAdvancedManagedRuleSet;

  /// Indicates whether the rule group is versioned.
  final bool? isVersioningSupported;

  /// The name of the managed rule group. For example,
  /// <code>AWSManagedRulesAnonymousIpList</code> or
  /// <code>AWSManagedRulesATPRuleSet</code>.
  final String? managedRuleSetName;

  /// A short description of the managed rule group.
  final String? productDescription;

  /// A unique identifier for the rule group. This ID is returned in the responses
  /// to create and list commands. You provide it to operations like update and
  /// delete.
  final String? productId;

  /// For Amazon Web Services Marketplace managed rule groups only, the link to
  /// the rule group product page.
  final String? productLink;

  /// The display name for the managed rule group. For example, <code>Anonymous IP
  /// list</code> or <code>Account takeover prevention</code>.
  final String? productTitle;

  /// The Amazon resource name (ARN) of the Amazon Simple Notification Service SNS
  /// topic that's used to provide notification of changes to the managed rule
  /// group. You can subscribe to the SNS topic to receive notifications when the
  /// managed rule group is modified, such as for new versions and for version
  /// expiration. For more information, see the <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/welcome.html">Amazon Simple
  /// Notification Service Developer Guide</a>.
  final String? snsTopicArn;

  /// The name of the managed rule group vendor. You use this, along with the rule
  /// group name, to identify a rule group.
  final String? vendorName;

  ManagedProductDescriptor({
    this.isAdvancedManagedRuleSet,
    this.isVersioningSupported,
    this.managedRuleSetName,
    this.productDescription,
    this.productId,
    this.productLink,
    this.productTitle,
    this.snsTopicArn,
    this.vendorName,
  });

  factory ManagedProductDescriptor.fromJson(Map<String, dynamic> json) {
    return ManagedProductDescriptor(
      isAdvancedManagedRuleSet: json['IsAdvancedManagedRuleSet'] as bool?,
      isVersioningSupported: json['IsVersioningSupported'] as bool?,
      managedRuleSetName: json['ManagedRuleSetName'] as String?,
      productDescription: json['ProductDescription'] as String?,
      productId: json['ProductId'] as String?,
      productLink: json['ProductLink'] as String?,
      productTitle: json['ProductTitle'] as String?,
      snsTopicArn: json['SnsTopicArn'] as String?,
      vendorName: json['VendorName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isAdvancedManagedRuleSet = this.isAdvancedManagedRuleSet;
    final isVersioningSupported = this.isVersioningSupported;
    final managedRuleSetName = this.managedRuleSetName;
    final productDescription = this.productDescription;
    final productId = this.productId;
    final productLink = this.productLink;
    final productTitle = this.productTitle;
    final snsTopicArn = this.snsTopicArn;
    final vendorName = this.vendorName;
    return {
      if (isAdvancedManagedRuleSet != null)
        'IsAdvancedManagedRuleSet': isAdvancedManagedRuleSet,
      if (isVersioningSupported != null)
        'IsVersioningSupported': isVersioningSupported,
      if (managedRuleSetName != null) 'ManagedRuleSetName': managedRuleSetName,
      if (productDescription != null) 'ProductDescription': productDescription,
      if (productId != null) 'ProductId': productId,
      if (productLink != null) 'ProductLink': productLink,
      if (productTitle != null) 'ProductTitle': productTitle,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (vendorName != null) 'VendorName': vendorName,
    };
  }
}

/// @nodoc
class WAFAssociatedItemException extends _s.GenericAwsException {
  WAFAssociatedItemException({String? type, String? message})
      : super(type: type, code: 'WAFAssociatedItemException', message: message);
}

/// @nodoc
class WAFConfigurationWarningException extends _s.GenericAwsException {
  WAFConfigurationWarningException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFConfigurationWarningException',
            message: message);
}

/// @nodoc
class WAFDuplicateItemException extends _s.GenericAwsException {
  WAFDuplicateItemException({String? type, String? message})
      : super(type: type, code: 'WAFDuplicateItemException', message: message);
}

/// @nodoc
class WAFExpiredManagedRuleGroupVersionException
    extends _s.GenericAwsException {
  WAFExpiredManagedRuleGroupVersionException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFExpiredManagedRuleGroupVersionException',
            message: message);
}

/// @nodoc
class WAFFeatureNotIncludedInPricingPlanException
    extends _s.GenericAwsException {
  WAFFeatureNotIncludedInPricingPlanException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFFeatureNotIncludedInPricingPlanException',
            message: message);
}

/// @nodoc
class WAFInternalErrorException extends _s.GenericAwsException {
  WAFInternalErrorException({String? type, String? message})
      : super(type: type, code: 'WAFInternalErrorException', message: message);
}

/// @nodoc
class WAFInvalidOperationException extends _s.GenericAwsException {
  WAFInvalidOperationException({String? type, String? message})
      : super(
            type: type, code: 'WAFInvalidOperationException', message: message);
}

/// @nodoc
class WAFInvalidParameterException extends _s.GenericAwsException {
  WAFInvalidParameterException({String? type, String? message})
      : super(
            type: type, code: 'WAFInvalidParameterException', message: message);
}

/// @nodoc
class WAFInvalidPermissionPolicyException extends _s.GenericAwsException {
  WAFInvalidPermissionPolicyException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFInvalidPermissionPolicyException',
            message: message);
}

/// @nodoc
class WAFInvalidResourceException extends _s.GenericAwsException {
  WAFInvalidResourceException({String? type, String? message})
      : super(
            type: type, code: 'WAFInvalidResourceException', message: message);
}

/// @nodoc
class WAFLimitsExceededException extends _s.GenericAwsException {
  WAFLimitsExceededException({String? type, String? message})
      : super(type: type, code: 'WAFLimitsExceededException', message: message);
}

/// @nodoc
class WAFLogDestinationPermissionIssueException extends _s.GenericAwsException {
  WAFLogDestinationPermissionIssueException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFLogDestinationPermissionIssueException',
            message: message);
}

/// @nodoc
class WAFNonexistentItemException extends _s.GenericAwsException {
  WAFNonexistentItemException({String? type, String? message})
      : super(
            type: type, code: 'WAFNonexistentItemException', message: message);
}

/// @nodoc
class WAFOptimisticLockException extends _s.GenericAwsException {
  WAFOptimisticLockException({String? type, String? message})
      : super(type: type, code: 'WAFOptimisticLockException', message: message);
}

/// @nodoc
class WAFServiceLinkedRoleErrorException extends _s.GenericAwsException {
  WAFServiceLinkedRoleErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFServiceLinkedRoleErrorException',
            message: message);
}

/// @nodoc
class WAFSubscriptionNotFoundException extends _s.GenericAwsException {
  WAFSubscriptionNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFSubscriptionNotFoundException',
            message: message);
}

/// @nodoc
class WAFTagOperationException extends _s.GenericAwsException {
  WAFTagOperationException({String? type, String? message})
      : super(type: type, code: 'WAFTagOperationException', message: message);
}

/// @nodoc
class WAFTagOperationInternalErrorException extends _s.GenericAwsException {
  WAFTagOperationInternalErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFTagOperationInternalErrorException',
            message: message);
}

/// @nodoc
class WAFUnavailableEntityException extends _s.GenericAwsException {
  WAFUnavailableEntityException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFUnavailableEntityException',
            message: message);
}

/// @nodoc
class WAFUnsupportedAggregateKeyTypeException extends _s.GenericAwsException {
  WAFUnsupportedAggregateKeyTypeException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFUnsupportedAggregateKeyTypeException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'WAFAssociatedItemException': (type, message) =>
      WAFAssociatedItemException(type: type, message: message),
  'WAFConfigurationWarningException': (type, message) =>
      WAFConfigurationWarningException(type: type, message: message),
  'WAFDuplicateItemException': (type, message) =>
      WAFDuplicateItemException(type: type, message: message),
  'WAFExpiredManagedRuleGroupVersionException': (type, message) =>
      WAFExpiredManagedRuleGroupVersionException(type: type, message: message),
  'WAFFeatureNotIncludedInPricingPlanException': (type, message) =>
      WAFFeatureNotIncludedInPricingPlanException(type: type, message: message),
  'WAFInternalErrorException': (type, message) =>
      WAFInternalErrorException(type: type, message: message),
  'WAFInvalidOperationException': (type, message) =>
      WAFInvalidOperationException(type: type, message: message),
  'WAFInvalidParameterException': (type, message) =>
      WAFInvalidParameterException(type: type, message: message),
  'WAFInvalidPermissionPolicyException': (type, message) =>
      WAFInvalidPermissionPolicyException(type: type, message: message),
  'WAFInvalidResourceException': (type, message) =>
      WAFInvalidResourceException(type: type, message: message),
  'WAFLimitsExceededException': (type, message) =>
      WAFLimitsExceededException(type: type, message: message),
  'WAFLogDestinationPermissionIssueException': (type, message) =>
      WAFLogDestinationPermissionIssueException(type: type, message: message),
  'WAFNonexistentItemException': (type, message) =>
      WAFNonexistentItemException(type: type, message: message),
  'WAFOptimisticLockException': (type, message) =>
      WAFOptimisticLockException(type: type, message: message),
  'WAFServiceLinkedRoleErrorException': (type, message) =>
      WAFServiceLinkedRoleErrorException(type: type, message: message),
  'WAFSubscriptionNotFoundException': (type, message) =>
      WAFSubscriptionNotFoundException(type: type, message: message),
  'WAFTagOperationException': (type, message) =>
      WAFTagOperationException(type: type, message: message),
  'WAFTagOperationInternalErrorException': (type, message) =>
      WAFTagOperationInternalErrorException(type: type, message: message),
  'WAFUnavailableEntityException': (type, message) =>
      WAFUnavailableEntityException(type: type, message: message),
  'WAFUnsupportedAggregateKeyTypeException': (type, message) =>
      WAFUnsupportedAggregateKeyTypeException(type: type, message: message),
};
