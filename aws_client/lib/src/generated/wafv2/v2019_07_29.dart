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

/// This is the latest version of the <b>WAF</b> API, released in November,
/// 2019. The names of the entities that you use to access this API, like
/// endpoints and namespaces, all have the versioning information added, like
/// "V2" or "v2", to distinguish from the prior version. We recommend migrating
/// your resources to this version, because it has a number of significant
/// improvements.
class Wafv2 {
  final _s.JsonProtocol _protocol;
  Wafv2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'wafv2',
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

  /// Associates a web ACL with a regional application resource, to protect the
  /// resource. A regional application can be an Application Load Balancer
  /// (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon
  /// Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
  ///
  /// For Amazon CloudFront, don't use this call. Instead, use your CloudFront
  /// distribution configuration. To associate a web ACL, in the CloudFront call
  /// <code>UpdateDistribution</code>, set the web ACL ID to the Amazon Resource
  /// Name (ARN) of the web ACL. For information, see <a
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
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFInvalidOperationException].
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
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFInvalidResourceException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFSubscriptionNotFoundException].
  /// May throw [WAFExpiredManagedRuleGroupVersionException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [rules] :
  /// An array of <a>Rule</a> that you're configuring to use in a rule group or
  /// web ACL.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
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
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
  /// Example JSON: <code>"TokenDomains": ["abc.com", "store.abc.com"]</code>
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
        'Scope': scope.toValue(),
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
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
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
  /// Empty array: <code>"Addresses": []</code>
  /// </li>
  /// <li>
  /// Array with one address: <code>"Addresses": ["192.0.2.44/32"]</code>
  /// </li>
  /// <li>
  /// Array with three addresses: <code>"Addresses": ["192.0.2.44/32",
  /// "192.0.2.0/24", "192.0.0.0/16"]</code>
  /// </li>
  /// <li>
  /// INVALID specification: <code>"Addresses": [""]</code> INVALID
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'IPAddressVersion': iPAddressVersion.toValue(),
        'Name': name,
        'Scope': scope.toValue(),
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
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [name] :
  /// The name of the set. You cannot change the name after you create the set.
  ///
  /// Parameter [regularExpressionList] :
  /// Array of regular expression strings.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
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
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFSubscriptionNotFoundException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
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
  /// Amazon Web Services resources to protect. The resources can be an Amazon
  /// CloudFront distribution, an Amazon API Gateway REST API, an Application
  /// Load Balancer, an AppSync GraphQL API, an Amazon Cognito user pool, an App
  /// Runner service, or an Amazon Web Services Verified Access instance.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFInvalidResourceException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFSubscriptionNotFoundException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFConfigurationWarningException].
  /// May throw [WAFExpiredManagedRuleGroupVersionException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
  /// Parameter [description] :
  /// A description of the web ACL that helps with identification.
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
    AssociationConfig? associationConfig,
    CaptchaConfig? captchaConfig,
    ChallengeConfig? challengeConfig,
    Map<String, CustomResponseBody>? customResponseBodies,
    String? description,
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
        'Scope': scope.toValue(),
        'VisibilityConfig': visibilityConfig,
        if (associationConfig != null) 'AssociationConfig': associationConfig,
        if (captchaConfig != null) 'CaptchaConfig': captchaConfig,
        if (challengeConfig != null) 'ChallengeConfig': challengeConfig,
        if (customResponseBodies != null)
          'CustomResponseBodies': customResponseBodies,
        if (description != null) 'Description': description,
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
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [aPIKey] :
  /// The encrypted API key that you want to delete.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
      },
    );
  }

  /// Deletes all rule groups that are managed by Firewall Manager for the
  /// specified web ACL.
  ///
  /// You can only use this if <code>ManagedByFirewallManager</code> is false in
  /// the specified <a>WebACL</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFInvalidOperationException].
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
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFAssociatedItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
      },
    );
  }

  /// Deletes the <a>LoggingConfiguration</a> from the specified web ACL.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
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
        if (logScope != null) 'LogScope': logScope.toValue(),
        if (logType != null) 'LogType': logType.toValue(),
      },
    );
  }

  /// Permanently deletes an IAM policy from the specified rule group.
  ///
  /// You must be the owner of the rule group to perform this operation.
  ///
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
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
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFAssociatedItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
      },
    );
  }

  /// Deletes the specified <a>RuleGroup</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFAssociatedItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
      },
    );
  }

  /// Deletes the specified <a>WebACL</a>.
  ///
  /// You can only use this if <code>ManagedByFirewallManager</code> is false in
  /// the specified <a>WebACL</a>.
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
  /// For regional resources, call <a>ListResourcesForWebACL</a>.
  /// </li>
  /// <li>
  /// For Amazon CloudFront distributions, use the CloudFront call
  /// <code>ListDistributionsByWebACLId</code>. For information, see <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_ListDistributionsByWebACLId.html">ListDistributionsByWebACLId</a>
  /// in the <i>Amazon CloudFront API Reference</i>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// To disassociate a resource from a web ACL, use the following calls:
  ///
  /// <ul>
  /// <li>
  /// For regional resources, call <a>DisassociateWebACL</a>.
  /// </li>
  /// <li>
  /// For Amazon CloudFront distributions, provide an empty web ACL ID in the
  /// CloudFront call <code>UpdateDistribution</code>. For information, see <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html">UpdateDistribution</a>
  /// in the <i>Amazon CloudFront API Reference</i>.
  /// </li>
  /// </ul> </li>
  /// </ul> </note>
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFAssociatedItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
      },
    );
  }

  /// Provides high-level information for the Amazon Web Services Managed Rules
  /// rule groups and Amazon Web Services Marketplace managed rule groups.
  ///
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
      },
    );

    return DescribeAllManagedProductsResponse.fromJson(jsonResponse.body);
  }

  /// Provides high-level information for the managed rule groups owned by a
  /// specific vendor.
  ///
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
        'VendorName': vendorName,
      },
    );

    return DescribeManagedProductsByVendorResponse.fromJson(jsonResponse.body);
  }

  /// Provides high-level information for a managed rule group, including
  /// descriptions of the rules.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidResourceException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFExpiredManagedRuleGroupVersionException].
  ///
  /// Parameter [name] :
  /// The name of the managed rule group. You use this, along with the vendor
  /// name, to identify the rule group.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
        'VendorName': vendorName,
        if (versionName != null) 'VersionName': versionName,
      },
    );

    return DescribeManagedRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// Disassociates the specified regional application resource from any
  /// existing web ACL association. A resource can have at most one web ACL
  /// association. A regional application can be an Application Load Balancer
  /// (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon
  /// Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
  ///
  /// For Amazon CloudFront, don't use this call. Instead, use your CloudFront
  /// distribution configuration. To disassociate a web ACL, provide an empty
  /// web ACL ID in the CloudFront call <code>UpdateDistribution</code>. For
  /// information, see <a
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
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
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
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
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
        'Platform': platform.toValue(),
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
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidResourceException].
  ///
  /// Parameter [aPIKey] :
  /// The encrypted API key.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
      },
    );

    return GetDecryptedAPIKeyResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the specified <a>IPSet</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
      },
    );

    return GetIPSetResponse.fromJson(jsonResponse.body);
  }

  /// Returns the <a>LoggingConfiguration</a> for the specified web ACL.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
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
        if (logScope != null) 'LogScope': logScope.toValue(),
        if (logType != null) 'LogType': logType.toValue(),
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
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
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
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
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
        'Platform': platform.toValue(),
        'ReleaseVersion': releaseVersion,
      },
    );

    return GetMobileSdkReleaseResponse.fromJson(jsonResponse.body);
  }

  /// Returns the IAM policy that is attached to the specified rule group.
  ///
  /// You must be the owner of the rule group to perform this operation.
  ///
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
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
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFUnsupportedAggregateKeyTypeException].
  ///
  /// Parameter [ruleName] :
  /// The name of the rate-based rule to get the keys for. If you have the rule
  /// defined inside a rule group that you're using in your web ACL, also
  /// provide the name of the rule group reference statement in the request
  /// parameter <code>RuleGroupRuleName</code>.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
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
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
      },
    );

    return GetRegexPatternSetResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the specified <a>RuleGroup</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        if (scope != null) 'Scope': scope.toValue(),
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
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
        'TimeWindow': timeWindow,
        'WebAclArn': webAclArn,
      },
    );

    return GetSampledRequestsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the specified <a>WebACL</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
    required String id,
    required String name,
    required Scope scope,
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
        'Id': id,
        'Name': name,
        'Scope': scope.toValue(),
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
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFInvalidOperationException].
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
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidResourceException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListAPIKeysResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of the available versions for the specified managed rule
  /// group.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [name] :
  /// The name of the managed rule group. You use this, along with the vendor
  /// name, to identify the rule group.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
        'VendorName': vendorName,
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListAvailableManagedRuleGroupVersionsResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves an array of managed rule groups that are available for you to
  /// use. This list includes all Amazon Web Services Managed Rules rule groups
  /// and all of the Amazon Web Services Marketplace managed rule groups that
  /// you're subscribed to.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListAvailableManagedRuleGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves an array of <a>IPSetSummary</a> objects for the IP sets that you
  /// manage.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListIPSetsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves an array of your <a>LoggingConfiguration</a> objects.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
        if (limit != null) 'Limit': limit,
        if (logScope != null) 'LogScope': logScope.toValue(),
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
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
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
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
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
        'Platform': platform.toValue(),
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
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListRegexPatternSetsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves an array of the Amazon Resource Names (ARNs) for the regional
  /// resources that are associated with the specified web ACL.
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
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [webACLArn] :
  /// The Amazon Resource Name (ARN) of the web ACL.
  ///
  /// Parameter [resourceType] :
  /// Used for web ACLs that are scoped for regional applications. A regional
  /// application can be an Application Load Balancer (ALB), an Amazon API
  /// Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an
  /// App Runner service, or an Amazon Web Services Verified Access instance.
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
        if (resourceType != null) 'ResourceType': resourceType.toValue(),
      },
    );

    return ListResourcesForWebACLResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves an array of <a>RuleGroupSummary</a> objects for the rule groups
  /// that you manage.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
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
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
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
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListWebACLsResponse.fromJson(jsonResponse.body);
  }

  /// Enables the specified <a>LoggingConfiguration</a>, to start logging from a
  /// web ACL, according to the configuration provided.
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
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFServiceLinkedRoleErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFLogDestinationPermissionIssueException].
  ///
  /// Parameter [loggingConfiguration] :
  /// <p/>
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
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFInvalidOperationException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
        if (recommendedVersion != null)
          'RecommendedVersion': recommendedVersion,
        if (versionsToPublish != null) 'VersionsToPublish': versionsToPublish,
      },
    );

    return PutManagedRuleSetVersionsResponse.fromJson(jsonResponse.body);
  }

  /// Attaches an IAM policy to the specified resource. Use this to share a rule
  /// group across accounts.
  ///
  /// You must be the owner of the rule group to perform this operation.
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
  ///
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidPermissionPolicyException].
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
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
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
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFInvalidOperationException].
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
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFInvalidOperationException].
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
  /// Empty array: <code>"Addresses": []</code>
  /// </li>
  /// <li>
  /// Array with one address: <code>"Addresses": ["192.0.2.44/32"]</code>
  /// </li>
  /// <li>
  /// Array with three addresses: <code>"Addresses": ["192.0.2.44/32",
  /// "192.0.2.0/24", "192.0.0.0/16"]</code>
  /// </li>
  /// <li>
  /// INVALID specification: <code>"Addresses": [""]</code> INVALID
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
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
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFInvalidOperationException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
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
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFInvalidOperationException].
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
  /// <p/>
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
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
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFSubscriptionNotFoundException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFConfigurationWarningException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
        'Scope': scope.toValue(),
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
  /// Amazon Web Services resources to protect. The resources can be an Amazon
  /// CloudFront distribution, an Amazon API Gateway REST API, an Application
  /// Load Balancer, an AppSync GraphQL API, an Amazon Cognito user pool, an App
  /// Runner service, or an Amazon Web Services Verified Access instance.
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
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFDuplicateItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFInvalidResourceException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFSubscriptionNotFoundException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFExpiredManagedRuleGroupVersionException].
  /// May throw [WAFConfigurationWarningException].
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
  /// Specifies whether this is for an Amazon CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an
  /// Amazon Cognito user pool, an App Runner service, or an Amazon Web Services
  /// Verified Access instance.
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
  /// Parameter [description] :
  /// A description of the web ACL that helps with identification.
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
    AssociationConfig? associationConfig,
    CaptchaConfig? captchaConfig,
    ChallengeConfig? challengeConfig,
    Map<String, CustomResponseBody>? customResponseBodies,
    String? description,
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
        'Scope': scope.toValue(),
        'VisibilityConfig': visibilityConfig,
        if (associationConfig != null) 'AssociationConfig': associationConfig,
        if (captchaConfig != null) 'CaptchaConfig': captchaConfig,
        if (challengeConfig != null) 'ChallengeConfig': challengeConfig,
        if (customResponseBodies != null)
          'CustomResponseBodies': customResponseBodies,
        if (description != null) 'Description': description,
        if (rules != null) 'Rules': rules,
        if (tokenDomains != null) 'TokenDomains': tokenDomains,
      },
    );

    return UpdateWebACLResponse.fromJson(jsonResponse.body);
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
          ?.whereNotNull()
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

/// Details for your use of the account creation fraud prevention managed rule
/// group, <code>AWSManagedRulesACFPRuleSet</code>. This configuration is used
/// in <code>ManagedRuleGroupConfig</code>.
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
      creationPath: json['CreationPath'] as String,
      registrationPagePath: json['RegistrationPagePath'] as String,
      requestInspection: RequestInspectionACFP.fromJson(
          json['RequestInspection'] as Map<String, dynamic>),
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

/// Details for your use of the account takeover prevention managed rule group,
/// <code>AWSManagedRulesATPRuleSet</code>. This configuration is used in
/// <code>ManagedRuleGroupConfig</code>.
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
      loginPath: json['LoginPath'] as String,
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

/// Details for your use of the Bot Control managed rule group,
/// <code>AWSManagedRulesBotControlRuleSet</code>. This configuration is used in
/// <code>ManagedRuleGroupConfig</code>.
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
      inspectionLevel: (json['InspectionLevel'] as String).toInspectionLevel(),
      enableMachineLearning: json['EnableMachineLearning'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final inspectionLevel = this.inspectionLevel;
    final enableMachineLearning = this.enableMachineLearning;
    return {
      'InspectionLevel': inspectionLevel.toValue(),
      if (enableMachineLearning != null)
        'EnableMachineLearning': enableMachineLearning,
    };
  }
}

/// A single action condition for a <a>Condition</a> in a logging filter.
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
      action: (json['Action'] as String).toActionValue(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    return {
      'Action': action.toValue(),
    };
  }
}

enum ActionValue {
  allow,
  block,
  count,
  captcha,
  challenge,
  excludedAsCount,
}

extension ActionValueValueExtension on ActionValue {
  String toValue() {
    switch (this) {
      case ActionValue.allow:
        return 'ALLOW';
      case ActionValue.block:
        return 'BLOCK';
      case ActionValue.count:
        return 'COUNT';
      case ActionValue.captcha:
        return 'CAPTCHA';
      case ActionValue.challenge:
        return 'CHALLENGE';
      case ActionValue.excludedAsCount:
        return 'EXCLUDED_AS_COUNT';
    }
  }
}

extension ActionValueFromString on String {
  ActionValue toActionValue() {
    switch (this) {
      case 'ALLOW':
        return ActionValue.allow;
      case 'BLOCK':
        return ActionValue.block;
      case 'COUNT':
        return ActionValue.count;
      case 'CAPTCHA':
        return ActionValue.captcha;
      case 'CHALLENGE':
        return ActionValue.challenge;
      case 'EXCLUDED_AS_COUNT':
        return ActionValue.excludedAsCount;
    }
    throw Exception('$this is not known in enum ActionValue');
  }
}

/// The name of a field in the request payload that contains part or all of your
/// customer's primary physical address.
///
/// This data type is used in the <code>RequestInspectionACFP</code> data type.
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
      identifier: json['Identifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      'Identifier': identifier,
    };
  }
}

/// Inspect all of the elements that WAF has parsed and extracted from the web
/// request component that you've identified in your <a>FieldToMatch</a>
/// specifications.
///
/// This is used in the <a>FieldToMatch</a> specification for some web request
/// component types.
///
/// JSON specification: <code>"All": {}</code>
class All {
  All();

  factory All.fromJson(Map<String, dynamic> _) {
    return All();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inspect all query arguments of the web request.
///
/// This is used in the <a>FieldToMatch</a> specification for some web request
/// component types.
///
/// JSON specification: <code>"AllQueryArguments": {}</code>
class AllQueryArguments {
  AllQueryArguments();

  factory AllQueryArguments.fromJson(Map<String, dynamic> _) {
    return AllQueryArguments();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies that WAF should allow the request and optionally defines
/// additional custom handling for the request.
///
/// This is used in the context of other settings, for example to specify values
/// for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
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

/// A logical rule statement used to combine other rule statements with AND
/// logic. You provide more than one <a>Statement</a> within the
/// <code>AndStatement</code>.
class AndStatement {
  /// The statements to combine with AND logic. You can use any statements that
  /// can be nested.
  final List<Statement> statements;

  AndStatement({
    required this.statements,
  });

  factory AndStatement.fromJson(Map<String, dynamic> json) {
    return AndStatement(
      statements: (json['Statements'] as List)
          .whereNotNull()
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

class AssociateWebACLResponse {
  AssociateWebACLResponse();

  factory AssociateWebACLResponse.fromJson(Map<String, dynamic> _) {
    return AssociateWebACLResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum AssociatedResourceType {
  cloudfront,
  apiGateway,
  cognitoUserPool,
  appRunnerService,
  verifiedAccessInstance,
}

extension AssociatedResourceTypeValueExtension on AssociatedResourceType {
  String toValue() {
    switch (this) {
      case AssociatedResourceType.cloudfront:
        return 'CLOUDFRONT';
      case AssociatedResourceType.apiGateway:
        return 'API_GATEWAY';
      case AssociatedResourceType.cognitoUserPool:
        return 'COGNITO_USER_POOL';
      case AssociatedResourceType.appRunnerService:
        return 'APP_RUNNER_SERVICE';
      case AssociatedResourceType.verifiedAccessInstance:
        return 'VERIFIED_ACCESS_INSTANCE';
    }
  }
}

extension AssociatedResourceTypeFromString on String {
  AssociatedResourceType toAssociatedResourceType() {
    switch (this) {
      case 'CLOUDFRONT':
        return AssociatedResourceType.cloudfront;
      case 'API_GATEWAY':
        return AssociatedResourceType.apiGateway;
      case 'COGNITO_USER_POOL':
        return AssociatedResourceType.cognitoUserPool;
      case 'APP_RUNNER_SERVICE':
        return AssociatedResourceType.appRunnerService;
      case 'VERIFIED_ACCESS_INSTANCE':
        return AssociatedResourceType.verifiedAccessInstance;
    }
    throw Exception('$this is not known in enum AssociatedResourceType');
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
              k.toAssociatedResourceType(),
              RequestBodyAssociatedResourceTypeConfig.fromJson(
                  e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final requestBody = this.requestBody;
    return {
      if (requestBody != null)
        'RequestBody': requestBody.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// Specifies that WAF should block the request and optionally defines
/// additional custom handling for the response to the web request.
///
/// This is used in the context of other settings, for example to specify values
/// for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
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

/// Inspect the body of the web request. The body immediately follows the
/// request headers.
///
/// This is used to indicate the web request component to inspect, in the
/// <a>FieldToMatch</a> specification.
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
      oversizeHandling:
          (json['OversizeHandling'] as String?)?.toOversizeHandling(),
    );
  }

  Map<String, dynamic> toJson() {
    final oversizeHandling = this.oversizeHandling;
    return {
      if (oversizeHandling != null)
        'OversizeHandling': oversizeHandling.toValue(),
    };
  }
}

enum BodyParsingFallbackBehavior {
  match,
  noMatch,
  evaluateAsString,
}

extension BodyParsingFallbackBehaviorValueExtension
    on BodyParsingFallbackBehavior {
  String toValue() {
    switch (this) {
      case BodyParsingFallbackBehavior.match:
        return 'MATCH';
      case BodyParsingFallbackBehavior.noMatch:
        return 'NO_MATCH';
      case BodyParsingFallbackBehavior.evaluateAsString:
        return 'EVALUATE_AS_STRING';
    }
  }
}

extension BodyParsingFallbackBehaviorFromString on String {
  BodyParsingFallbackBehavior toBodyParsingFallbackBehavior() {
    switch (this) {
      case 'MATCH':
        return BodyParsingFallbackBehavior.match;
      case 'NO_MATCH':
        return BodyParsingFallbackBehavior.noMatch;
      case 'EVALUATE_AS_STRING':
        return BodyParsingFallbackBehavior.evaluateAsString;
    }
    throw Exception('$this is not known in enum BodyParsingFallbackBehavior');
  }
}

/// A rule statement that defines a string match search for WAF to apply to web
/// requests. The byte match statement provides the bytes to search for, the
/// location in requests that you want WAF to search, and other settings. The
/// bytes to search for are typically a string that corresponds with ASCII
/// characters. In the WAF console and the developer guide, this is called a
/// string match statement.
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
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      positionalConstraint:
          (json['PositionalConstraint'] as String).toPositionalConstraint(),
      searchString: _s.decodeUint8List(json['SearchString']! as String),
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
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
      'PositionalConstraint': positionalConstraint.toValue(),
      'SearchString': base64Encode(searchString),
      'TextTransformations': textTransformations,
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

/// Specifies how WAF should handle <code>CAPTCHA</code> evaluations. This is
/// available at the web ACL level and in each rule.
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

/// The result from the inspection of the web request for a valid
/// <code>CAPTCHA</code> token.
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
      failureReason: (json['FailureReason'] as String?)?.toFailureReason(),
      responseCode: json['ResponseCode'] as int?,
      solveTimestamp: json['SolveTimestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureReason = this.failureReason;
    final responseCode = this.responseCode;
    final solveTimestamp = this.solveTimestamp;
    return {
      if (failureReason != null) 'FailureReason': failureReason.toValue(),
      if (responseCode != null) 'ResponseCode': responseCode,
      if (solveTimestamp != null) 'SolveTimestamp': solveTimestamp,
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

/// Specifies how WAF should handle <code>Challenge</code> evaluations. This is
/// available at the web ACL level and in each rule.
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

/// The result from the inspection of the web request for a valid challenge
/// token.
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
      failureReason: (json['FailureReason'] as String?)?.toFailureReason(),
      responseCode: json['ResponseCode'] as int?,
      solveTimestamp: json['SolveTimestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureReason = this.failureReason;
    final responseCode = this.responseCode;
    final solveTimestamp = this.solveTimestamp;
    return {
      if (failureReason != null) 'FailureReason': failureReason.toValue(),
      if (responseCode != null) 'ResponseCode': responseCode,
      if (solveTimestamp != null) 'SolveTimestamp': solveTimestamp,
    };
  }
}

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

enum ComparisonOperator {
  eq,
  ne,
  le,
  lt,
  ge,
  gt,
}

extension ComparisonOperatorValueExtension on ComparisonOperator {
  String toValue() {
    switch (this) {
      case ComparisonOperator.eq:
        return 'EQ';
      case ComparisonOperator.ne:
        return 'NE';
      case ComparisonOperator.le:
        return 'LE';
      case ComparisonOperator.lt:
        return 'LT';
      case ComparisonOperator.ge:
        return 'GE';
      case ComparisonOperator.gt:
        return 'GT';
    }
  }
}

extension ComparisonOperatorFromString on String {
  ComparisonOperator toComparisonOperator() {
    switch (this) {
      case 'EQ':
        return ComparisonOperator.eq;
      case 'NE':
        return ComparisonOperator.ne;
      case 'LE':
        return ComparisonOperator.le;
      case 'LT':
        return ComparisonOperator.lt;
      case 'GE':
        return ComparisonOperator.ge;
      case 'GT':
        return ComparisonOperator.gt;
    }
    throw Exception('$this is not known in enum ComparisonOperator');
  }
}

/// A single match condition for a <a>Filter</a>.
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

/// The filter to use to identify the subset of cookies to inspect in a web
/// request.
///
/// You must specify exactly one setting: either <code>All</code>,
/// <code>IncludedCookies</code>, or <code>ExcludedCookies</code>.
///
/// Example JSON: <code>"MatchPattern": { "IncludedCookies": [
/// "session-id-time", "session-id" ] }</code>
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      includedCookies: (json['IncludedCookies'] as List?)
          ?.whereNotNull()
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

/// Inspect the cookies in the web request. You can specify the parts of the
/// cookies to inspect and you can narrow the set of cookies to inspect by
/// including or excluding specific keys.
///
/// This is used to indicate the web request component to inspect, in the
/// <a>FieldToMatch</a> specification.
///
/// Example JSON: <code>"Cookies": { "MatchPattern": { "All": {} },
/// "MatchScope": "KEY", "OversizeHandling": "MATCH" }</code>
class Cookies {
  /// The filter to use to identify the subset of cookies to inspect in a web
  /// request.
  ///
  /// You must specify exactly one setting: either <code>All</code>,
  /// <code>IncludedCookies</code>, or <code>ExcludedCookies</code>.
  ///
  /// Example JSON: <code>"MatchPattern": { "IncludedCookies": [
  /// "session-id-time", "session-id" ] }</code>
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
          json['MatchPattern'] as Map<String, dynamic>),
      matchScope: (json['MatchScope'] as String).toMapMatchScope(),
      oversizeHandling:
          (json['OversizeHandling'] as String).toOversizeHandling(),
    );
  }

  Map<String, dynamic> toJson() {
    final matchPattern = this.matchPattern;
    final matchScope = this.matchScope;
    final oversizeHandling = this.oversizeHandling;
    return {
      'MatchPattern': matchPattern,
      'MatchScope': matchScope.toValue(),
      'OversizeHandling': oversizeHandling.toValue(),
    };
  }
}

/// Specifies that WAF should count the request. Optionally defines additional
/// custom handling for the request.
///
/// This is used in the context of other settings, for example to specify values
/// for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
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

enum CountryCode {
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
  xk,
}

extension CountryCodeValueExtension on CountryCode {
  String toValue() {
    switch (this) {
      case CountryCode.af:
        return 'AF';
      case CountryCode.ax:
        return 'AX';
      case CountryCode.al:
        return 'AL';
      case CountryCode.dz:
        return 'DZ';
      case CountryCode.as:
        return 'AS';
      case CountryCode.ad:
        return 'AD';
      case CountryCode.ao:
        return 'AO';
      case CountryCode.ai:
        return 'AI';
      case CountryCode.aq:
        return 'AQ';
      case CountryCode.ag:
        return 'AG';
      case CountryCode.ar:
        return 'AR';
      case CountryCode.am:
        return 'AM';
      case CountryCode.aw:
        return 'AW';
      case CountryCode.au:
        return 'AU';
      case CountryCode.at:
        return 'AT';
      case CountryCode.az:
        return 'AZ';
      case CountryCode.bs:
        return 'BS';
      case CountryCode.bh:
        return 'BH';
      case CountryCode.bd:
        return 'BD';
      case CountryCode.bb:
        return 'BB';
      case CountryCode.by:
        return 'BY';
      case CountryCode.be:
        return 'BE';
      case CountryCode.bz:
        return 'BZ';
      case CountryCode.bj:
        return 'BJ';
      case CountryCode.bm:
        return 'BM';
      case CountryCode.bt:
        return 'BT';
      case CountryCode.bo:
        return 'BO';
      case CountryCode.bq:
        return 'BQ';
      case CountryCode.ba:
        return 'BA';
      case CountryCode.bw:
        return 'BW';
      case CountryCode.bv:
        return 'BV';
      case CountryCode.br:
        return 'BR';
      case CountryCode.io:
        return 'IO';
      case CountryCode.bn:
        return 'BN';
      case CountryCode.bg:
        return 'BG';
      case CountryCode.bf:
        return 'BF';
      case CountryCode.bi:
        return 'BI';
      case CountryCode.kh:
        return 'KH';
      case CountryCode.cm:
        return 'CM';
      case CountryCode.ca:
        return 'CA';
      case CountryCode.cv:
        return 'CV';
      case CountryCode.ky:
        return 'KY';
      case CountryCode.cf:
        return 'CF';
      case CountryCode.td:
        return 'TD';
      case CountryCode.cl:
        return 'CL';
      case CountryCode.cn:
        return 'CN';
      case CountryCode.cx:
        return 'CX';
      case CountryCode.cc:
        return 'CC';
      case CountryCode.co:
        return 'CO';
      case CountryCode.km:
        return 'KM';
      case CountryCode.cg:
        return 'CG';
      case CountryCode.cd:
        return 'CD';
      case CountryCode.ck:
        return 'CK';
      case CountryCode.cr:
        return 'CR';
      case CountryCode.ci:
        return 'CI';
      case CountryCode.hr:
        return 'HR';
      case CountryCode.cu:
        return 'CU';
      case CountryCode.cw:
        return 'CW';
      case CountryCode.cy:
        return 'CY';
      case CountryCode.cz:
        return 'CZ';
      case CountryCode.dk:
        return 'DK';
      case CountryCode.dj:
        return 'DJ';
      case CountryCode.dm:
        return 'DM';
      case CountryCode.$do:
        return 'DO';
      case CountryCode.ec:
        return 'EC';
      case CountryCode.eg:
        return 'EG';
      case CountryCode.sv:
        return 'SV';
      case CountryCode.gq:
        return 'GQ';
      case CountryCode.er:
        return 'ER';
      case CountryCode.ee:
        return 'EE';
      case CountryCode.et:
        return 'ET';
      case CountryCode.fk:
        return 'FK';
      case CountryCode.fo:
        return 'FO';
      case CountryCode.fj:
        return 'FJ';
      case CountryCode.fi:
        return 'FI';
      case CountryCode.fr:
        return 'FR';
      case CountryCode.gf:
        return 'GF';
      case CountryCode.pf:
        return 'PF';
      case CountryCode.tf:
        return 'TF';
      case CountryCode.ga:
        return 'GA';
      case CountryCode.gm:
        return 'GM';
      case CountryCode.ge:
        return 'GE';
      case CountryCode.de:
        return 'DE';
      case CountryCode.gh:
        return 'GH';
      case CountryCode.gi:
        return 'GI';
      case CountryCode.gr:
        return 'GR';
      case CountryCode.gl:
        return 'GL';
      case CountryCode.gd:
        return 'GD';
      case CountryCode.gp:
        return 'GP';
      case CountryCode.gu:
        return 'GU';
      case CountryCode.gt:
        return 'GT';
      case CountryCode.gg:
        return 'GG';
      case CountryCode.gn:
        return 'GN';
      case CountryCode.gw:
        return 'GW';
      case CountryCode.gy:
        return 'GY';
      case CountryCode.ht:
        return 'HT';
      case CountryCode.hm:
        return 'HM';
      case CountryCode.va:
        return 'VA';
      case CountryCode.hn:
        return 'HN';
      case CountryCode.hk:
        return 'HK';
      case CountryCode.hu:
        return 'HU';
      case CountryCode.$is:
        return 'IS';
      case CountryCode.$in:
        return 'IN';
      case CountryCode.id:
        return 'ID';
      case CountryCode.ir:
        return 'IR';
      case CountryCode.iq:
        return 'IQ';
      case CountryCode.ie:
        return 'IE';
      case CountryCode.im:
        return 'IM';
      case CountryCode.il:
        return 'IL';
      case CountryCode.it:
        return 'IT';
      case CountryCode.jm:
        return 'JM';
      case CountryCode.jp:
        return 'JP';
      case CountryCode.je:
        return 'JE';
      case CountryCode.jo:
        return 'JO';
      case CountryCode.kz:
        return 'KZ';
      case CountryCode.ke:
        return 'KE';
      case CountryCode.ki:
        return 'KI';
      case CountryCode.kp:
        return 'KP';
      case CountryCode.kr:
        return 'KR';
      case CountryCode.kw:
        return 'KW';
      case CountryCode.kg:
        return 'KG';
      case CountryCode.la:
        return 'LA';
      case CountryCode.lv:
        return 'LV';
      case CountryCode.lb:
        return 'LB';
      case CountryCode.ls:
        return 'LS';
      case CountryCode.lr:
        return 'LR';
      case CountryCode.ly:
        return 'LY';
      case CountryCode.li:
        return 'LI';
      case CountryCode.lt:
        return 'LT';
      case CountryCode.lu:
        return 'LU';
      case CountryCode.mo:
        return 'MO';
      case CountryCode.mk:
        return 'MK';
      case CountryCode.mg:
        return 'MG';
      case CountryCode.mw:
        return 'MW';
      case CountryCode.my:
        return 'MY';
      case CountryCode.mv:
        return 'MV';
      case CountryCode.ml:
        return 'ML';
      case CountryCode.mt:
        return 'MT';
      case CountryCode.mh:
        return 'MH';
      case CountryCode.mq:
        return 'MQ';
      case CountryCode.mr:
        return 'MR';
      case CountryCode.mu:
        return 'MU';
      case CountryCode.yt:
        return 'YT';
      case CountryCode.mx:
        return 'MX';
      case CountryCode.fm:
        return 'FM';
      case CountryCode.md:
        return 'MD';
      case CountryCode.mc:
        return 'MC';
      case CountryCode.mn:
        return 'MN';
      case CountryCode.me:
        return 'ME';
      case CountryCode.ms:
        return 'MS';
      case CountryCode.ma:
        return 'MA';
      case CountryCode.mz:
        return 'MZ';
      case CountryCode.mm:
        return 'MM';
      case CountryCode.na:
        return 'NA';
      case CountryCode.nr:
        return 'NR';
      case CountryCode.np:
        return 'NP';
      case CountryCode.nl:
        return 'NL';
      case CountryCode.nc:
        return 'NC';
      case CountryCode.nz:
        return 'NZ';
      case CountryCode.ni:
        return 'NI';
      case CountryCode.ne:
        return 'NE';
      case CountryCode.ng:
        return 'NG';
      case CountryCode.nu:
        return 'NU';
      case CountryCode.nf:
        return 'NF';
      case CountryCode.mp:
        return 'MP';
      case CountryCode.no:
        return 'NO';
      case CountryCode.om:
        return 'OM';
      case CountryCode.pk:
        return 'PK';
      case CountryCode.pw:
        return 'PW';
      case CountryCode.ps:
        return 'PS';
      case CountryCode.pa:
        return 'PA';
      case CountryCode.pg:
        return 'PG';
      case CountryCode.py:
        return 'PY';
      case CountryCode.pe:
        return 'PE';
      case CountryCode.ph:
        return 'PH';
      case CountryCode.pn:
        return 'PN';
      case CountryCode.pl:
        return 'PL';
      case CountryCode.pt:
        return 'PT';
      case CountryCode.pr:
        return 'PR';
      case CountryCode.qa:
        return 'QA';
      case CountryCode.re:
        return 'RE';
      case CountryCode.ro:
        return 'RO';
      case CountryCode.ru:
        return 'RU';
      case CountryCode.rw:
        return 'RW';
      case CountryCode.bl:
        return 'BL';
      case CountryCode.sh:
        return 'SH';
      case CountryCode.kn:
        return 'KN';
      case CountryCode.lc:
        return 'LC';
      case CountryCode.mf:
        return 'MF';
      case CountryCode.pm:
        return 'PM';
      case CountryCode.vc:
        return 'VC';
      case CountryCode.ws:
        return 'WS';
      case CountryCode.sm:
        return 'SM';
      case CountryCode.st:
        return 'ST';
      case CountryCode.sa:
        return 'SA';
      case CountryCode.sn:
        return 'SN';
      case CountryCode.rs:
        return 'RS';
      case CountryCode.sc:
        return 'SC';
      case CountryCode.sl:
        return 'SL';
      case CountryCode.sg:
        return 'SG';
      case CountryCode.sx:
        return 'SX';
      case CountryCode.sk:
        return 'SK';
      case CountryCode.si:
        return 'SI';
      case CountryCode.sb:
        return 'SB';
      case CountryCode.so:
        return 'SO';
      case CountryCode.za:
        return 'ZA';
      case CountryCode.gs:
        return 'GS';
      case CountryCode.ss:
        return 'SS';
      case CountryCode.es:
        return 'ES';
      case CountryCode.lk:
        return 'LK';
      case CountryCode.sd:
        return 'SD';
      case CountryCode.sr:
        return 'SR';
      case CountryCode.sj:
        return 'SJ';
      case CountryCode.sz:
        return 'SZ';
      case CountryCode.se:
        return 'SE';
      case CountryCode.ch:
        return 'CH';
      case CountryCode.sy:
        return 'SY';
      case CountryCode.tw:
        return 'TW';
      case CountryCode.tj:
        return 'TJ';
      case CountryCode.tz:
        return 'TZ';
      case CountryCode.th:
        return 'TH';
      case CountryCode.tl:
        return 'TL';
      case CountryCode.tg:
        return 'TG';
      case CountryCode.tk:
        return 'TK';
      case CountryCode.to:
        return 'TO';
      case CountryCode.tt:
        return 'TT';
      case CountryCode.tn:
        return 'TN';
      case CountryCode.tr:
        return 'TR';
      case CountryCode.tm:
        return 'TM';
      case CountryCode.tc:
        return 'TC';
      case CountryCode.tv:
        return 'TV';
      case CountryCode.ug:
        return 'UG';
      case CountryCode.ua:
        return 'UA';
      case CountryCode.ae:
        return 'AE';
      case CountryCode.gb:
        return 'GB';
      case CountryCode.us:
        return 'US';
      case CountryCode.um:
        return 'UM';
      case CountryCode.uy:
        return 'UY';
      case CountryCode.uz:
        return 'UZ';
      case CountryCode.vu:
        return 'VU';
      case CountryCode.ve:
        return 'VE';
      case CountryCode.vn:
        return 'VN';
      case CountryCode.vg:
        return 'VG';
      case CountryCode.vi:
        return 'VI';
      case CountryCode.wf:
        return 'WF';
      case CountryCode.eh:
        return 'EH';
      case CountryCode.ye:
        return 'YE';
      case CountryCode.zm:
        return 'ZM';
      case CountryCode.zw:
        return 'ZW';
      case CountryCode.xk:
        return 'XK';
    }
  }
}

extension CountryCodeFromString on String {
  CountryCode toCountryCode() {
    switch (this) {
      case 'AF':
        return CountryCode.af;
      case 'AX':
        return CountryCode.ax;
      case 'AL':
        return CountryCode.al;
      case 'DZ':
        return CountryCode.dz;
      case 'AS':
        return CountryCode.as;
      case 'AD':
        return CountryCode.ad;
      case 'AO':
        return CountryCode.ao;
      case 'AI':
        return CountryCode.ai;
      case 'AQ':
        return CountryCode.aq;
      case 'AG':
        return CountryCode.ag;
      case 'AR':
        return CountryCode.ar;
      case 'AM':
        return CountryCode.am;
      case 'AW':
        return CountryCode.aw;
      case 'AU':
        return CountryCode.au;
      case 'AT':
        return CountryCode.at;
      case 'AZ':
        return CountryCode.az;
      case 'BS':
        return CountryCode.bs;
      case 'BH':
        return CountryCode.bh;
      case 'BD':
        return CountryCode.bd;
      case 'BB':
        return CountryCode.bb;
      case 'BY':
        return CountryCode.by;
      case 'BE':
        return CountryCode.be;
      case 'BZ':
        return CountryCode.bz;
      case 'BJ':
        return CountryCode.bj;
      case 'BM':
        return CountryCode.bm;
      case 'BT':
        return CountryCode.bt;
      case 'BO':
        return CountryCode.bo;
      case 'BQ':
        return CountryCode.bq;
      case 'BA':
        return CountryCode.ba;
      case 'BW':
        return CountryCode.bw;
      case 'BV':
        return CountryCode.bv;
      case 'BR':
        return CountryCode.br;
      case 'IO':
        return CountryCode.io;
      case 'BN':
        return CountryCode.bn;
      case 'BG':
        return CountryCode.bg;
      case 'BF':
        return CountryCode.bf;
      case 'BI':
        return CountryCode.bi;
      case 'KH':
        return CountryCode.kh;
      case 'CM':
        return CountryCode.cm;
      case 'CA':
        return CountryCode.ca;
      case 'CV':
        return CountryCode.cv;
      case 'KY':
        return CountryCode.ky;
      case 'CF':
        return CountryCode.cf;
      case 'TD':
        return CountryCode.td;
      case 'CL':
        return CountryCode.cl;
      case 'CN':
        return CountryCode.cn;
      case 'CX':
        return CountryCode.cx;
      case 'CC':
        return CountryCode.cc;
      case 'CO':
        return CountryCode.co;
      case 'KM':
        return CountryCode.km;
      case 'CG':
        return CountryCode.cg;
      case 'CD':
        return CountryCode.cd;
      case 'CK':
        return CountryCode.ck;
      case 'CR':
        return CountryCode.cr;
      case 'CI':
        return CountryCode.ci;
      case 'HR':
        return CountryCode.hr;
      case 'CU':
        return CountryCode.cu;
      case 'CW':
        return CountryCode.cw;
      case 'CY':
        return CountryCode.cy;
      case 'CZ':
        return CountryCode.cz;
      case 'DK':
        return CountryCode.dk;
      case 'DJ':
        return CountryCode.dj;
      case 'DM':
        return CountryCode.dm;
      case 'DO':
        return CountryCode.$do;
      case 'EC':
        return CountryCode.ec;
      case 'EG':
        return CountryCode.eg;
      case 'SV':
        return CountryCode.sv;
      case 'GQ':
        return CountryCode.gq;
      case 'ER':
        return CountryCode.er;
      case 'EE':
        return CountryCode.ee;
      case 'ET':
        return CountryCode.et;
      case 'FK':
        return CountryCode.fk;
      case 'FO':
        return CountryCode.fo;
      case 'FJ':
        return CountryCode.fj;
      case 'FI':
        return CountryCode.fi;
      case 'FR':
        return CountryCode.fr;
      case 'GF':
        return CountryCode.gf;
      case 'PF':
        return CountryCode.pf;
      case 'TF':
        return CountryCode.tf;
      case 'GA':
        return CountryCode.ga;
      case 'GM':
        return CountryCode.gm;
      case 'GE':
        return CountryCode.ge;
      case 'DE':
        return CountryCode.de;
      case 'GH':
        return CountryCode.gh;
      case 'GI':
        return CountryCode.gi;
      case 'GR':
        return CountryCode.gr;
      case 'GL':
        return CountryCode.gl;
      case 'GD':
        return CountryCode.gd;
      case 'GP':
        return CountryCode.gp;
      case 'GU':
        return CountryCode.gu;
      case 'GT':
        return CountryCode.gt;
      case 'GG':
        return CountryCode.gg;
      case 'GN':
        return CountryCode.gn;
      case 'GW':
        return CountryCode.gw;
      case 'GY':
        return CountryCode.gy;
      case 'HT':
        return CountryCode.ht;
      case 'HM':
        return CountryCode.hm;
      case 'VA':
        return CountryCode.va;
      case 'HN':
        return CountryCode.hn;
      case 'HK':
        return CountryCode.hk;
      case 'HU':
        return CountryCode.hu;
      case 'IS':
        return CountryCode.$is;
      case 'IN':
        return CountryCode.$in;
      case 'ID':
        return CountryCode.id;
      case 'IR':
        return CountryCode.ir;
      case 'IQ':
        return CountryCode.iq;
      case 'IE':
        return CountryCode.ie;
      case 'IM':
        return CountryCode.im;
      case 'IL':
        return CountryCode.il;
      case 'IT':
        return CountryCode.it;
      case 'JM':
        return CountryCode.jm;
      case 'JP':
        return CountryCode.jp;
      case 'JE':
        return CountryCode.je;
      case 'JO':
        return CountryCode.jo;
      case 'KZ':
        return CountryCode.kz;
      case 'KE':
        return CountryCode.ke;
      case 'KI':
        return CountryCode.ki;
      case 'KP':
        return CountryCode.kp;
      case 'KR':
        return CountryCode.kr;
      case 'KW':
        return CountryCode.kw;
      case 'KG':
        return CountryCode.kg;
      case 'LA':
        return CountryCode.la;
      case 'LV':
        return CountryCode.lv;
      case 'LB':
        return CountryCode.lb;
      case 'LS':
        return CountryCode.ls;
      case 'LR':
        return CountryCode.lr;
      case 'LY':
        return CountryCode.ly;
      case 'LI':
        return CountryCode.li;
      case 'LT':
        return CountryCode.lt;
      case 'LU':
        return CountryCode.lu;
      case 'MO':
        return CountryCode.mo;
      case 'MK':
        return CountryCode.mk;
      case 'MG':
        return CountryCode.mg;
      case 'MW':
        return CountryCode.mw;
      case 'MY':
        return CountryCode.my;
      case 'MV':
        return CountryCode.mv;
      case 'ML':
        return CountryCode.ml;
      case 'MT':
        return CountryCode.mt;
      case 'MH':
        return CountryCode.mh;
      case 'MQ':
        return CountryCode.mq;
      case 'MR':
        return CountryCode.mr;
      case 'MU':
        return CountryCode.mu;
      case 'YT':
        return CountryCode.yt;
      case 'MX':
        return CountryCode.mx;
      case 'FM':
        return CountryCode.fm;
      case 'MD':
        return CountryCode.md;
      case 'MC':
        return CountryCode.mc;
      case 'MN':
        return CountryCode.mn;
      case 'ME':
        return CountryCode.me;
      case 'MS':
        return CountryCode.ms;
      case 'MA':
        return CountryCode.ma;
      case 'MZ':
        return CountryCode.mz;
      case 'MM':
        return CountryCode.mm;
      case 'NA':
        return CountryCode.na;
      case 'NR':
        return CountryCode.nr;
      case 'NP':
        return CountryCode.np;
      case 'NL':
        return CountryCode.nl;
      case 'NC':
        return CountryCode.nc;
      case 'NZ':
        return CountryCode.nz;
      case 'NI':
        return CountryCode.ni;
      case 'NE':
        return CountryCode.ne;
      case 'NG':
        return CountryCode.ng;
      case 'NU':
        return CountryCode.nu;
      case 'NF':
        return CountryCode.nf;
      case 'MP':
        return CountryCode.mp;
      case 'NO':
        return CountryCode.no;
      case 'OM':
        return CountryCode.om;
      case 'PK':
        return CountryCode.pk;
      case 'PW':
        return CountryCode.pw;
      case 'PS':
        return CountryCode.ps;
      case 'PA':
        return CountryCode.pa;
      case 'PG':
        return CountryCode.pg;
      case 'PY':
        return CountryCode.py;
      case 'PE':
        return CountryCode.pe;
      case 'PH':
        return CountryCode.ph;
      case 'PN':
        return CountryCode.pn;
      case 'PL':
        return CountryCode.pl;
      case 'PT':
        return CountryCode.pt;
      case 'PR':
        return CountryCode.pr;
      case 'QA':
        return CountryCode.qa;
      case 'RE':
        return CountryCode.re;
      case 'RO':
        return CountryCode.ro;
      case 'RU':
        return CountryCode.ru;
      case 'RW':
        return CountryCode.rw;
      case 'BL':
        return CountryCode.bl;
      case 'SH':
        return CountryCode.sh;
      case 'KN':
        return CountryCode.kn;
      case 'LC':
        return CountryCode.lc;
      case 'MF':
        return CountryCode.mf;
      case 'PM':
        return CountryCode.pm;
      case 'VC':
        return CountryCode.vc;
      case 'WS':
        return CountryCode.ws;
      case 'SM':
        return CountryCode.sm;
      case 'ST':
        return CountryCode.st;
      case 'SA':
        return CountryCode.sa;
      case 'SN':
        return CountryCode.sn;
      case 'RS':
        return CountryCode.rs;
      case 'SC':
        return CountryCode.sc;
      case 'SL':
        return CountryCode.sl;
      case 'SG':
        return CountryCode.sg;
      case 'SX':
        return CountryCode.sx;
      case 'SK':
        return CountryCode.sk;
      case 'SI':
        return CountryCode.si;
      case 'SB':
        return CountryCode.sb;
      case 'SO':
        return CountryCode.so;
      case 'ZA':
        return CountryCode.za;
      case 'GS':
        return CountryCode.gs;
      case 'SS':
        return CountryCode.ss;
      case 'ES':
        return CountryCode.es;
      case 'LK':
        return CountryCode.lk;
      case 'SD':
        return CountryCode.sd;
      case 'SR':
        return CountryCode.sr;
      case 'SJ':
        return CountryCode.sj;
      case 'SZ':
        return CountryCode.sz;
      case 'SE':
        return CountryCode.se;
      case 'CH':
        return CountryCode.ch;
      case 'SY':
        return CountryCode.sy;
      case 'TW':
        return CountryCode.tw;
      case 'TJ':
        return CountryCode.tj;
      case 'TZ':
        return CountryCode.tz;
      case 'TH':
        return CountryCode.th;
      case 'TL':
        return CountryCode.tl;
      case 'TG':
        return CountryCode.tg;
      case 'TK':
        return CountryCode.tk;
      case 'TO':
        return CountryCode.to;
      case 'TT':
        return CountryCode.tt;
      case 'TN':
        return CountryCode.tn;
      case 'TR':
        return CountryCode.tr;
      case 'TM':
        return CountryCode.tm;
      case 'TC':
        return CountryCode.tc;
      case 'TV':
        return CountryCode.tv;
      case 'UG':
        return CountryCode.ug;
      case 'UA':
        return CountryCode.ua;
      case 'AE':
        return CountryCode.ae;
      case 'GB':
        return CountryCode.gb;
      case 'US':
        return CountryCode.us;
      case 'UM':
        return CountryCode.um;
      case 'UY':
        return CountryCode.uy;
      case 'UZ':
        return CountryCode.uz;
      case 'VU':
        return CountryCode.vu;
      case 'VE':
        return CountryCode.ve;
      case 'VN':
        return CountryCode.vn;
      case 'VG':
        return CountryCode.vg;
      case 'VI':
        return CountryCode.vi;
      case 'WF':
        return CountryCode.wf;
      case 'EH':
        return CountryCode.eh;
      case 'YE':
        return CountryCode.ye;
      case 'ZM':
        return CountryCode.zm;
      case 'ZW':
        return CountryCode.zw;
      case 'XK':
        return CountryCode.xk;
    }
    throw Exception('$this is not known in enum CountryCode');
  }
}

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

/// A custom header for custom request and response handling. This is used in
/// <a>CustomResponse</a> and <a>CustomRequestHandling</a>.
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
      name: json['Name'] as String,
      value: json['Value'] as String,
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

/// Custom request handling behavior that inserts custom headers into a web
/// request. You can add custom request handling for WAF to use when the rule
/// action doesn't block the request. For example, <code>CaptchaAction</code>
/// for requests with valid t okens, and <code>AllowAction</code>.
///
/// For information about customizing web requests and responses, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html">Customizing
/// web requests and responses in WAF</a> in the <i>WAF Developer Guide</i>.
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
      insertHeaders: (json['InsertHeaders'] as List)
          .whereNotNull()
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

/// A custom response to send to the client. You can define a custom response
/// for rule actions and default web ACL actions that are set to
/// <a>BlockAction</a>.
///
/// For information about customizing web requests and responses, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html">Customizing
/// web requests and responses in WAF</a> in the <i>WAF Developer Guide</i>.
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
      responseCode: json['ResponseCode'] as int,
      customResponseBodyKey: json['CustomResponseBodyKey'] as String?,
      responseHeaders: (json['ResponseHeaders'] as List?)
          ?.whereNotNull()
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

/// The response body to use in a custom response to a web request. This is
/// referenced by key from <a>CustomResponse</a>
/// <code>CustomResponseBodyKey</code>.
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
      content: json['Content'] as String,
      contentType: (json['ContentType'] as String).toResponseContentType(),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final contentType = this.contentType;
    return {
      'Content': content,
      'ContentType': contentType.toValue(),
    };
  }
}

/// In a <a>WebACL</a>, this is the action that you want WAF to perform when a
/// web request doesn't match any of the rules in the <code>WebACL</code>. The
/// default action must be a terminating action.
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

class DeleteAPIKeyResponse {
  DeleteAPIKeyResponse();

  factory DeleteAPIKeyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAPIKeyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

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

class DeleteIPSetResponse {
  DeleteIPSetResponse();

  factory DeleteIPSetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIPSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLoggingConfigurationResponse {
  DeleteLoggingConfigurationResponse();

  factory DeleteLoggingConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLoggingConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePermissionPolicyResponse {
  DeletePermissionPolicyResponse();

  factory DeletePermissionPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeletePermissionPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRegexPatternSetResponse {
  DeleteRegexPatternSetResponse();

  factory DeleteRegexPatternSetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRegexPatternSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRuleGroupResponse {
  DeleteRuleGroupResponse();

  factory DeleteRuleGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRuleGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWebACLResponse {
  DeleteWebACLResponse();

  factory DeleteWebACLResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWebACLResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
  /// <code>awswaf:managed:&lt;vendor&gt;:&lt;rule group name&gt;</code>:
  /// </li>
  /// <li>
  /// When a rule with a label matches a web request, WAF adds the fully qualified
  /// label to the request. A fully qualified label is made up of the label
  /// namespace from the rule group or web ACL where the rule is defined and the
  /// label from the rule, separated by a colon:
  ///
  /// <code>&lt;label namespace&gt;:&lt;label from rule&gt;</code>
  /// </li>
  /// </ul>
  final String? labelNamespace;

  /// <p/>
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
          ?.whereNotNull()
          .map((e) => LabelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      capacity: json['Capacity'] as int?,
      consumedLabels: (json['ConsumedLabels'] as List?)
          ?.whereNotNull()
          .map((e) => LabelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      labelNamespace: json['LabelNamespace'] as String?,
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
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

class DisassociateWebACLResponse {
  DisassociateWebACLResponse();

  factory DisassociateWebACLResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateWebACLResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The name of the field in the request payload that contains your customer's
/// email.
///
/// This data type is used in the <code>RequestInspectionACFP</code> data type.
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
      identifier: json['Identifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      'Identifier': identifier,
    };
  }
}

/// Specifies a single rule in a rule group whose action you want to override to
/// <code>Count</code>.
/// <note>
/// Instead of this option, use <code>RuleActionOverrides</code>. It accepts any
/// valid action setting, including <code>Count</code>.
/// </note>
class ExcludedRule {
  /// The name of the rule whose action you want to override to
  /// <code>Count</code>.
  final String name;

  ExcludedRule({
    required this.name,
  });

  factory ExcludedRule.fromJson(Map<String, dynamic> json) {
    return ExcludedRule(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

enum FailureReason {
  tokenMissing,
  tokenExpired,
  tokenInvalid,
  tokenDomainMismatch,
}

extension FailureReasonValueExtension on FailureReason {
  String toValue() {
    switch (this) {
      case FailureReason.tokenMissing:
        return 'TOKEN_MISSING';
      case FailureReason.tokenExpired:
        return 'TOKEN_EXPIRED';
      case FailureReason.tokenInvalid:
        return 'TOKEN_INVALID';
      case FailureReason.tokenDomainMismatch:
        return 'TOKEN_DOMAIN_MISMATCH';
    }
  }
}

extension FailureReasonFromString on String {
  FailureReason toFailureReason() {
    switch (this) {
      case 'TOKEN_MISSING':
        return FailureReason.tokenMissing;
      case 'TOKEN_EXPIRED':
        return FailureReason.tokenExpired;
      case 'TOKEN_INVALID':
        return FailureReason.tokenInvalid;
      case 'TOKEN_DOMAIN_MISMATCH':
        return FailureReason.tokenDomainMismatch;
    }
    throw Exception('$this is not known in enum FailureReason');
  }
}

enum FallbackBehavior {
  match,
  noMatch,
}

extension FallbackBehaviorValueExtension on FallbackBehavior {
  String toValue() {
    switch (this) {
      case FallbackBehavior.match:
        return 'MATCH';
      case FallbackBehavior.noMatch:
        return 'NO_MATCH';
    }
  }
}

extension FallbackBehaviorFromString on String {
  FallbackBehavior toFallbackBehavior() {
    switch (this) {
      case 'MATCH':
        return FallbackBehavior.match;
      case 'NO_MATCH':
        return FallbackBehavior.noMatch;
    }
    throw Exception('$this is not known in enum FallbackBehavior');
  }
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
/// logging has no impact on sampling. The only way to exclude fields from
/// request sampling is by disabling sampling in the web ACL visibility
/// configuration.
/// </li>
/// </ul> </li>
/// </ul>
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
    this.jsonBody,
    this.method,
    this.queryString,
    this.singleHeader,
    this.singleQueryArgument,
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
    final jsonBody = this.jsonBody;
    final method = this.method;
    final queryString = this.queryString;
    final singleHeader = this.singleHeader;
    final singleQueryArgument = this.singleQueryArgument;
    final uriPath = this.uriPath;
    return {
      if (allQueryArguments != null) 'AllQueryArguments': allQueryArguments,
      if (body != null) 'Body': body,
      if (cookies != null) 'Cookies': cookies,
      if (headerOrder != null) 'HeaderOrder': headerOrder,
      if (headers != null) 'Headers': headers,
      if (jA3Fingerprint != null) 'JA3Fingerprint': jA3Fingerprint,
      if (jsonBody != null) 'JsonBody': jsonBody,
      if (method != null) 'Method': method,
      if (queryString != null) 'QueryString': queryString,
      if (singleHeader != null) 'SingleHeader': singleHeader,
      if (singleQueryArgument != null)
        'SingleQueryArgument': singleQueryArgument,
      if (uriPath != null) 'UriPath': uriPath,
    };
  }
}

/// A single logging filter, used in <a>LoggingFilter</a>.
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
      behavior: (json['Behavior'] as String).toFilterBehavior(),
      conditions: (json['Conditions'] as List)
          .whereNotNull()
          .map((e) => Condition.fromJson(e as Map<String, dynamic>))
          .toList(),
      requirement: (json['Requirement'] as String).toFilterRequirement(),
    );
  }

  Map<String, dynamic> toJson() {
    final behavior = this.behavior;
    final conditions = this.conditions;
    final requirement = this.requirement;
    return {
      'Behavior': behavior.toValue(),
      'Conditions': conditions,
      'Requirement': requirement.toValue(),
    };
  }
}

enum FilterBehavior {
  keep,
  drop,
}

extension FilterBehaviorValueExtension on FilterBehavior {
  String toValue() {
    switch (this) {
      case FilterBehavior.keep:
        return 'KEEP';
      case FilterBehavior.drop:
        return 'DROP';
    }
  }
}

extension FilterBehaviorFromString on String {
  FilterBehavior toFilterBehavior() {
    switch (this) {
      case 'KEEP':
        return FilterBehavior.keep;
      case 'DROP':
        return FilterBehavior.drop;
    }
    throw Exception('$this is not known in enum FilterBehavior');
  }
}

enum FilterRequirement {
  meetsAll,
  meetsAny,
}

extension FilterRequirementValueExtension on FilterRequirement {
  String toValue() {
    switch (this) {
      case FilterRequirement.meetsAll:
        return 'MEETS_ALL';
      case FilterRequirement.meetsAny:
        return 'MEETS_ANY';
    }
  }
}

extension FilterRequirementFromString on String {
  FilterRequirement toFilterRequirement() {
    switch (this) {
      case 'MEETS_ALL':
        return FilterRequirement.meetsAll;
      case 'MEETS_ANY':
        return FilterRequirement.meetsAny;
    }
    throw Exception('$this is not known in enum FilterRequirement');
  }
}

/// A rule group that's defined for an Firewall Manager WAF policy.
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
          json['FirewallManagerStatement'] as Map<String, dynamic>),
      name: json['Name'] as String,
      overrideAction: OverrideAction.fromJson(
          json['OverrideAction'] as Map<String, dynamic>),
      priority: json['Priority'] as int,
      visibilityConfig: VisibilityConfig.fromJson(
          json['VisibilityConfig'] as Map<String, dynamic>),
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

/// The configuration for inspecting IP addresses in an HTTP header that you
/// specify, instead of using the IP address that's reported by the web request
/// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
/// specify any header name.
/// <note>
/// If the specified header isn't present in the request, WAF doesn't apply the
/// rule to the web request at all.
/// </note>
/// This configuration is used for <a>GeoMatchStatement</a> and
/// <a>RateBasedStatement</a>. For <a>IPSetReferenceStatement</a>, use
/// <a>IPSetForwardedIPConfig</a> instead.
///
/// WAF only evaluates the first IP address found in the specified HTTP header.
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
      fallbackBehavior:
          (json['FallbackBehavior'] as String).toFallbackBehavior(),
      headerName: json['HeaderName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackBehavior = this.fallbackBehavior;
    final headerName = this.headerName;
    return {
      'FallbackBehavior': fallbackBehavior.toValue(),
      'HeaderName': headerName,
    };
  }
}

enum ForwardedIPPosition {
  first,
  last,
  any,
}

extension ForwardedIPPositionValueExtension on ForwardedIPPosition {
  String toValue() {
    switch (this) {
      case ForwardedIPPosition.first:
        return 'FIRST';
      case ForwardedIPPosition.last:
        return 'LAST';
      case ForwardedIPPosition.any:
        return 'ANY';
    }
  }
}

extension ForwardedIPPositionFromString on String {
  ForwardedIPPosition toForwardedIPPosition() {
    switch (this) {
      case 'FIRST':
        return ForwardedIPPosition.first;
      case 'LAST':
        return ForwardedIPPosition.last;
      case 'ANY':
        return ForwardedIPPosition.any;
    }
    throw Exception('$this is not known in enum ForwardedIPPosition');
  }
}

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
/// <code>awswaf:clientip:geo:region:&lt;ISO country code&gt;-&lt;ISO region
/// code&gt;</code> and <code>awswaf:clientip:geo:country:&lt;ISO country
/// code&gt;</code>.
///
/// If you use a forwarded IP address, the label formats are
/// <code>awswaf:forwardedip:geo:region:&lt;ISO country code&gt;-&lt;ISO region
/// code&gt;</code> and <code>awswaf:forwardedip:geo:country:&lt;ISO country
/// code&gt;</code>.
///
/// For additional details, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-geo-match.html">Geographic
/// match rule statement</a> in the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">WAF
/// Developer Guide</a>.
class GeoMatchStatement {
  /// An array of two-character country codes that you want to match against, for
  /// example, <code>[ "US", "CN" ]</code>, from the alpha-2 country ISO codes of
  /// the ISO 3166 international standard.
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
          ?.whereNotNull()
          .map((e) => (e as String).toCountryCode())
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
        'CountryCodes': countryCodes.map((e) => e.toValue()).toList(),
      if (forwardedIPConfig != null) 'ForwardedIPConfig': forwardedIPConfig,
    };
  }
}

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
          ?.whereNotNull()
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

class GetIPSetResponse {
  /// <p/>
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

  /// <p/>
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

  /// <p/>
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
          ?.whereNotNull()
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

/// Part of the response from <a>GetSampledRequests</a>. This is a complex type
/// that appears as <code>Headers</code> in the response syntax.
/// <code>HTTPHeader</code> contains the names and values of all of the headers
/// that appear in one of the web requests.
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

/// Part of the response from <a>GetSampledRequests</a>. This is a complex type
/// that appears as <code>Request</code> in the response syntax.
/// <code>HTTPRequest</code> contains information about one of the web requests.
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
          ?.whereNotNull()
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

/// The filter to use to identify the subset of headers to inspect in a web
/// request.
///
/// You must specify exactly one setting: either <code>All</code>,
/// <code>IncludedHeaders</code>, or <code>ExcludedHeaders</code>.
///
/// Example JSON: <code>"MatchPattern": { "ExcludedHeaders": [ "KeyToExclude1",
/// "KeyToExclude2" ] }</code>
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      includedHeaders: (json['IncludedHeaders'] as List?)
          ?.whereNotNull()
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

/// Inspect a string containing the list of the request's header names, ordered
/// as they appear in the web request that WAF receives for inspection. WAF
/// generates the string and then uses that as the field to match component in
/// its inspection. WAF separates the header names in the string using colons
/// and no added spaces, for example
/// <code>host:user-agent:accept:authorization:referer</code>.
class HeaderOrder {
  /// What WAF should do if the headers of the request are more numerous or larger
  /// than WAF can inspect. WAF does not support inspecting the entire contents of
  /// request headers when they exceed 8 KB (8192 bytes) or 200 total headers. The
  /// underlying host service forwards a maximum of 200 headers and at most 8 KB
  /// of header contents to WAF.
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
      oversizeHandling:
          (json['OversizeHandling'] as String).toOversizeHandling(),
    );
  }

  Map<String, dynamic> toJson() {
    final oversizeHandling = this.oversizeHandling;
    return {
      'OversizeHandling': oversizeHandling.toValue(),
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
class Headers {
  /// The filter to use to identify the subset of headers to inspect in a web
  /// request.
  ///
  /// You must specify exactly one setting: either <code>All</code>,
  /// <code>IncludedHeaders</code>, or <code>ExcludedHeaders</code>.
  ///
  /// Example JSON: <code>"MatchPattern": { "ExcludedHeaders": [ "KeyToExclude1",
  /// "KeyToExclude2" ] }</code>
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

  /// What WAF should do if the headers of the request are more numerous or larger
  /// than WAF can inspect. WAF does not support inspecting the entire contents of
  /// request headers when they exceed 8 KB (8192 bytes) or 200 total headers. The
  /// underlying host service forwards a maximum of 200 headers and at most 8 KB
  /// of header contents to WAF.
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
          json['MatchPattern'] as Map<String, dynamic>),
      matchScope: (json['MatchScope'] as String).toMapMatchScope(),
      oversizeHandling:
          (json['OversizeHandling'] as String).toOversizeHandling(),
    );
  }

  Map<String, dynamic> toJson() {
    final matchPattern = this.matchPattern;
    final matchScope = this.matchScope;
    final oversizeHandling = this.oversizeHandling;
    return {
      'MatchPattern': matchPattern,
      'MatchScope': matchScope.toValue(),
      'OversizeHandling': oversizeHandling.toValue(),
    };
  }
}

enum IPAddressVersion {
  ipv4,
  ipv6,
}

extension IPAddressVersionValueExtension on IPAddressVersion {
  String toValue() {
    switch (this) {
      case IPAddressVersion.ipv4:
        return 'IPV4';
      case IPAddressVersion.ipv6:
        return 'IPV6';
    }
  }
}

extension IPAddressVersionFromString on String {
  IPAddressVersion toIPAddressVersion() {
    switch (this) {
      case 'IPV4':
        return IPAddressVersion.ipv4;
      case 'IPV6':
        return IPAddressVersion.ipv6;
    }
    throw Exception('$this is not known in enum IPAddressVersion');
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
  /// Empty array: <code>"Addresses": []</code>
  /// </li>
  /// <li>
  /// Array with one address: <code>"Addresses": ["192.0.2.44/32"]</code>
  /// </li>
  /// <li>
  /// Array with three addresses: <code>"Addresses": ["192.0.2.44/32",
  /// "192.0.2.0/24", "192.0.0.0/16"]</code>
  /// </li>
  /// <li>
  /// INVALID specification: <code>"Addresses": [""]</code> INVALID
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
      arn: json['ARN'] as String,
      addresses: (json['Addresses'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      iPAddressVersion:
          (json['IPAddressVersion'] as String).toIPAddressVersion(),
      id: json['Id'] as String,
      name: json['Name'] as String,
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
      'IPAddressVersion': iPAddressVersion.toValue(),
      'Id': id,
      'Name': name,
      if (description != null) 'Description': description,
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
/// This configuration is used only for <a>IPSetReferenceStatement</a>. For
/// <a>GeoMatchStatement</a> and <a>RateBasedStatement</a>, use
/// <a>ForwardedIPConfig</a> instead.
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
      fallbackBehavior:
          (json['FallbackBehavior'] as String).toFallbackBehavior(),
      headerName: json['HeaderName'] as String,
      position: (json['Position'] as String).toForwardedIPPosition(),
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackBehavior = this.fallbackBehavior;
    final headerName = this.headerName;
    final position = this.position;
    return {
      'FallbackBehavior': fallbackBehavior.toValue(),
      'HeaderName': headerName,
      'Position': position.toValue(),
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
      arn: json['ARN'] as String,
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

/// High-level information about an <a>IPSet</a>, returned by operations like
/// create and list. This provides information like the ID, that you can use to
/// retrieve and manage an <code>IPSet</code>, and the ARN, that you provide to
/// the <a>IPSetReferenceStatement</a> to use the address set in a <a>Rule</a>.
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

/// Used for CAPTCHA and challenge token settings. Determines how long a
/// <code>CAPTCHA</code> or challenge timestamp remains valid after WAF updates
/// it for a successful <code>CAPTCHA</code> or challenge response.
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
      immunityTime: json['ImmunityTime'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final immunityTime = this.immunityTime;
    return {
      'ImmunityTime': immunityTime,
    };
  }
}

enum InspectionLevel {
  common,
  targeted,
}

extension InspectionLevelValueExtension on InspectionLevel {
  String toValue() {
    switch (this) {
      case InspectionLevel.common:
        return 'COMMON';
      case InspectionLevel.targeted:
        return 'TARGETED';
    }
  }
}

extension InspectionLevelFromString on String {
  InspectionLevel toInspectionLevel() {
    switch (this) {
      case 'COMMON':
        return InspectionLevel.common;
      case 'TARGETED':
        return InspectionLevel.targeted;
    }
    throw Exception('$this is not known in enum InspectionLevel');
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
      fallbackBehavior:
          (json['FallbackBehavior'] as String).toFallbackBehavior(),
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackBehavior = this.fallbackBehavior;
    return {
      'FallbackBehavior': fallbackBehavior.toValue(),
    };
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
  ///
  /// WAF does its best to parse the entire JSON body, but might be forced to stop
  /// for reasons such as invalid characters, duplicate keys, truncation, and any
  /// content whose root node isn't an object or an array.
  ///
  /// WAF parses the JSON in the following examples as two valid key, value pairs:
  ///
  /// <ul>
  /// <li>
  /// Missing comma: <code>{"key1":"value1""key2":"value2"}</code>
  /// </li>
  /// <li>
  /// Missing colon: <code>{"key1":"value1","key2""value2"}</code>
  /// </li>
  /// <li>
  /// Extra colons: <code>{"key1"::"value1","key2""value2"}</code>
  /// </li>
  /// </ul>
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
          json['MatchPattern'] as Map<String, dynamic>),
      matchScope: (json['MatchScope'] as String).toJsonMatchScope(),
      invalidFallbackBehavior: (json['InvalidFallbackBehavior'] as String?)
          ?.toBodyParsingFallbackBehavior(),
      oversizeHandling:
          (json['OversizeHandling'] as String?)?.toOversizeHandling(),
    );
  }

  Map<String, dynamic> toJson() {
    final matchPattern = this.matchPattern;
    final matchScope = this.matchScope;
    final invalidFallbackBehavior = this.invalidFallbackBehavior;
    final oversizeHandling = this.oversizeHandling;
    return {
      'MatchPattern': matchPattern,
      'MatchScope': matchScope.toValue(),
      if (invalidFallbackBehavior != null)
        'InvalidFallbackBehavior': invalidFallbackBehavior.toValue(),
      if (oversizeHandling != null)
        'OversizeHandling': oversizeHandling.toValue(),
    };
  }
}

/// The patterns to look for in the JSON body. WAF inspects the results of these
/// pattern matches against the rule inspection criteria. This is used with the
/// <a>FieldToMatch</a> option <code>JsonBody</code>.
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
  /// <code>"IncludedPaths": ["/dogs/0/name", "/dogs/1/name"]</code>. For
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
          ?.whereNotNull()
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

enum JsonMatchScope {
  all,
  key,
  value,
}

extension JsonMatchScopeValueExtension on JsonMatchScope {
  String toValue() {
    switch (this) {
      case JsonMatchScope.all:
        return 'ALL';
      case JsonMatchScope.key:
        return 'KEY';
      case JsonMatchScope.value:
        return 'VALUE';
    }
  }
}

extension JsonMatchScopeFromString on String {
  JsonMatchScope toJsonMatchScope() {
    switch (this) {
      case 'ALL':
        return JsonMatchScope.all;
      case 'KEY':
        return JsonMatchScope.key;
      case 'VALUE':
        return JsonMatchScope.value;
    }
    throw Exception('$this is not known in enum JsonMatchScope');
  }
}

/// A single label container. This is used as an element of a label array in
/// multiple contexts, for example, in <code>RuleLabels</code> inside a
/// <a>Rule</a> and in <code>Labels</code> inside a <a>SampledHTTPRequest</a>.
class Label {
  /// The label string.
  final String name;

  Label({
    required this.name,
  });

  factory Label.fromJson(Map<String, dynamic> json) {
    return Label(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

enum LabelMatchScope {
  label,
  namespace,
}

extension LabelMatchScopeValueExtension on LabelMatchScope {
  String toValue() {
    switch (this) {
      case LabelMatchScope.label:
        return 'LABEL';
      case LabelMatchScope.namespace:
        return 'NAMESPACE';
    }
  }
}

extension LabelMatchScopeFromString on String {
  LabelMatchScope toLabelMatchScope() {
    switch (this) {
      case 'LABEL':
        return LabelMatchScope.label;
      case 'NAMESPACE':
        return LabelMatchScope.namespace;
    }
    throw Exception('$this is not known in enum LabelMatchScope');
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
      key: json['Key'] as String,
      scope: (json['Scope'] as String).toLabelMatchScope(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final scope = this.scope;
    return {
      'Key': key,
      'Scope': scope.toValue(),
    };
  }
}

/// A single label name condition for a <a>Condition</a> in a logging filter.
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
      labelName: json['LabelName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final labelName = this.labelName;
    return {
      'LabelName': labelName,
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

class ListResourcesForWebACLResponse {
  /// The array of Amazon Resource Names (ARNs) of the associated resources.
  final List<String>? resourceArns;

  ListResourcesForWebACLResponse({
    this.resourceArns,
  });

  factory ListResourcesForWebACLResponse.fromJson(Map<String, dynamic> json) {
    return ListResourcesForWebACLResponse(
      resourceArns: (json['ResourceArns'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

enum LogScope {
  customer,
  securityLake,
}

extension LogScopeValueExtension on LogScope {
  String toValue() {
    switch (this) {
      case LogScope.customer:
        return 'CUSTOMER';
      case LogScope.securityLake:
        return 'SECURITY_LAKE';
    }
  }
}

extension LogScopeFromString on String {
  LogScope toLogScope() {
    switch (this) {
      case 'CUSTOMER':
        return LogScope.customer;
      case 'SECURITY_LAKE':
        return LogScope.securityLake;
    }
    throw Exception('$this is not known in enum LogScope');
  }
}

enum LogType {
  wafLogs,
}

extension LogTypeValueExtension on LogType {
  String toValue() {
    switch (this) {
      case LogType.wafLogs:
        return 'WAF_LOGS';
    }
  }
}

extension LogTypeFromString on String {
  LogType toLogType() {
    switch (this) {
      case 'WAF_LOGS':
        return LogType.wafLogs;
    }
    throw Exception('$this is not known in enum LogType');
  }
}

/// Defines an association between logging destinations and a web ACL resource,
/// for logging from WAF. As part of the association, you can specify parts of
/// the standard logging fields to keep out of the logs and you can specify
/// filters so that you log only a subset of the logging records.
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
  final bool? managedByFirewallManager;

  /// The parts of the request that you want to keep out of the logs.
  ///
  /// For example, if you redact the <code>SingleHeader</code> field, the
  /// <code>HEADER</code> field in the logs will be <code>REDACTED</code> for all
  /// rules that use the <code>SingleHeader</code> <code>FieldToMatch</code>
  /// setting.
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
  /// This setting has no impact on request sampling. With request sampling, the
  /// only way to exclude fields is by disabling sampling in the web ACL
  /// visibility configuration.
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
      logDestinationConfigs: (json['LogDestinationConfigs'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      resourceArn: json['ResourceArn'] as String,
      logScope: (json['LogScope'] as String?)?.toLogScope(),
      logType: (json['LogType'] as String?)?.toLogType(),
      loggingFilter: json['LoggingFilter'] != null
          ? LoggingFilter.fromJson(
              json['LoggingFilter'] as Map<String, dynamic>)
          : null,
      managedByFirewallManager: json['ManagedByFirewallManager'] as bool?,
      redactedFields: (json['RedactedFields'] as List?)
          ?.whereNotNull()
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
      if (logScope != null) 'LogScope': logScope.toValue(),
      if (logType != null) 'LogType': logType.toValue(),
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
      defaultBehavior: (json['DefaultBehavior'] as String).toFilterBehavior(),
      filters: (json['Filters'] as List)
          .whereNotNull()
          .map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultBehavior = this.defaultBehavior;
    final filters = this.filters;
    return {
      'DefaultBehavior': defaultBehavior.toValue(),
      'Filters': filters,
    };
  }
}

/// The properties of a managed product, such as an Amazon Web Services Managed
/// Rules rule group or an Amazon Web Services Marketplace managed rule group.
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
      payloadType: (json['PayloadType'] as String?)?.toPayloadType(),
      usernameField: json['UsernameField'] != null
          ? UsernameField.fromJson(
              json['UsernameField'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsManagedRulesACFPRuleSet = this.awsManagedRulesACFPRuleSet;
    final awsManagedRulesATPRuleSet = this.awsManagedRulesATPRuleSet;
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
      if (awsManagedRulesBotControlRuleSet != null)
        'AWSManagedRulesBotControlRuleSet': awsManagedRulesBotControlRuleSet,
      if (loginPath != null) 'LoginPath': loginPath,
      if (passwordField != null) 'PasswordField': passwordField,
      if (payloadType != null) 'PayloadType': payloadType.toValue(),
      if (usernameField != null) 'UsernameField': usernameField,
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
  ///
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
      name: json['Name'] as String,
      vendorName: json['VendorName'] as String,
      excludedRules: (json['ExcludedRules'] as List?)
          ?.whereNotNull()
          .map((e) => ExcludedRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      managedRuleGroupConfigs: (json['ManagedRuleGroupConfigs'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ManagedRuleGroupConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      ruleActionOverrides: (json['RuleActionOverrides'] as List?)
          ?.whereNotNull()
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

/// High-level information about a managed rule group, returned by
/// <a>ListAvailableManagedRuleGroups</a>. This provides information like the
/// name and vendor name, that you provide when you add a
/// <a>ManagedRuleGroupStatement</a> to a web ACL. Managed rule groups include
/// Amazon Web Services Managed Rules rule groups and Amazon Web Services
/// Marketplace managed rule groups. To use any Amazon Web Services Marketplace
/// managed rule group, first subscribe to the rule group through Amazon Web
/// Services Marketplace.
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

/// Describes a single version of a managed rule group.
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
  /// <code>awswaf:managed:&lt;vendor&gt;:&lt;rule group name&gt;</code>:
  /// </li>
  /// <li>
  /// When a rule with a label matches a web request, WAF adds the fully qualified
  /// label to the request. A fully qualified label is made up of the label
  /// namespace from the rule group or web ACL where the rule is defined and the
  /// label from the rule, separated by a colon:
  ///
  /// <code>&lt;label namespace&gt;:&lt;label from rule&gt;</code>
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
      arn: json['ARN'] as String,
      id: json['Id'] as String,
      name: json['Name'] as String,
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
  /// <code>awswaf:managed:&lt;vendor&gt;:&lt;rule group name&gt;</code>:
  /// </li>
  /// <li>
  /// When a rule with a label matches a web request, WAF adds the fully qualified
  /// label to the request. A fully qualified label is made up of the label
  /// namespace from the rule group or web ACL where the rule is defined and the
  /// label from the rule, separated by a colon:
  ///
  /// <code>&lt;label namespace&gt;:&lt;label from rule&gt;</code>
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

enum MapMatchScope {
  all,
  key,
  value,
}

extension MapMatchScopeValueExtension on MapMatchScope {
  String toValue() {
    switch (this) {
      case MapMatchScope.all:
        return 'ALL';
      case MapMatchScope.key:
        return 'KEY';
      case MapMatchScope.value:
        return 'VALUE';
    }
  }
}

extension MapMatchScopeFromString on String {
  MapMatchScope toMapMatchScope() {
    switch (this) {
      case 'ALL':
        return MapMatchScope.all;
      case 'KEY':
        return MapMatchScope.key;
      case 'VALUE':
        return MapMatchScope.value;
    }
    throw Exception('$this is not known in enum MapMatchScope');
  }
}

/// Inspect the HTTP method of the web request. The method indicates the type of
/// operation that the request is asking the origin to perform.
///
/// This is used in the <a>FieldToMatch</a> specification for some web request
/// component types.
///
/// JSON specification: <code>"Method": {}</code>
class Method {
  Method();

  factory Method.fromJson(Map<String, dynamic> _) {
    return Method();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information for a release of the mobile SDK, including release notes and
/// tags.
///
/// The mobile SDK is not generally available. Customers who have access to the
/// mobile SDK can use it to establish and manage WAF tokens for use in HTTP(S)
/// requests from a mobile device to WAF. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html">WAF
/// client application integration</a> in the <i>WAF Developer Guide</i>.
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
          ?.whereNotNull()
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

/// Specifies that WAF should do nothing. This is used for the
/// <code>OverrideAction</code> setting on a <a>Rule</a> when the rule uses a
/// rule group reference statement.
///
/// This is used in the context of other settings, for example to specify values
/// for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
///
/// JSON specification: <code>"None": {}</code>
class NoneAction {
  NoneAction();

  factory NoneAction.fromJson(Map<String, dynamic> _) {
    return NoneAction();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A logical rule statement used to negate the results of another rule
/// statement. You provide one <a>Statement</a> within the
/// <code>NotStatement</code>.
class NotStatement {
  /// The statement to negate. You can use any statement that can be nested.
  final Statement statement;

  NotStatement({
    required this.statement,
  });

  factory NotStatement.fromJson(Map<String, dynamic> json) {
    return NotStatement(
      statement: Statement.fromJson(json['Statement'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final statement = this.statement;
    return {
      'Statement': statement,
    };
  }
}

/// A logical rule statement used to combine other rule statements with OR
/// logic. You provide more than one <a>Statement</a> within the
/// <code>OrStatement</code>.
class OrStatement {
  /// The statements to combine with OR logic. You can use any statements that can
  /// be nested.
  final List<Statement> statements;

  OrStatement({
    required this.statements,
  });

  factory OrStatement.fromJson(Map<String, dynamic> json) {
    return OrStatement(
      statements: (json['Statements'] as List)
          .whereNotNull()
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

enum OversizeHandling {
  $continue,
  match,
  noMatch,
}

extension OversizeHandlingValueExtension on OversizeHandling {
  String toValue() {
    switch (this) {
      case OversizeHandling.$continue:
        return 'CONTINUE';
      case OversizeHandling.match:
        return 'MATCH';
      case OversizeHandling.noMatch:
        return 'NO_MATCH';
    }
  }
}

extension OversizeHandlingFromString on String {
  OversizeHandling toOversizeHandling() {
    switch (this) {
      case 'CONTINUE':
        return OversizeHandling.$continue;
      case 'MATCH':
        return OversizeHandling.match;
      case 'NO_MATCH':
        return OversizeHandling.noMatch;
    }
    throw Exception('$this is not known in enum OversizeHandling');
  }
}

/// The name of the field in the request payload that contains your customer's
/// password.
///
/// This data type is used in the <code>RequestInspection</code> and
/// <code>RequestInspectionACFP</code> data types.
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
      identifier: json['Identifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      'Identifier': identifier,
    };
  }
}

enum PayloadType {
  json,
  formEncoded,
}

extension PayloadTypeValueExtension on PayloadType {
  String toValue() {
    switch (this) {
      case PayloadType.json:
        return 'JSON';
      case PayloadType.formEncoded:
        return 'FORM_ENCODED';
    }
  }
}

extension PayloadTypeFromString on String {
  PayloadType toPayloadType() {
    switch (this) {
      case 'JSON':
        return PayloadType.json;
      case 'FORM_ENCODED':
        return PayloadType.formEncoded;
    }
    throw Exception('$this is not known in enum PayloadType');
  }
}

/// The name of a field in the request payload that contains part or all of your
/// customer's primary phone number.
///
/// This data type is used in the <code>RequestInspectionACFP</code> data type.
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
      identifier: json['Identifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      'Identifier': identifier,
    };
  }
}

enum Platform {
  ios,
  android,
}

extension PlatformValueExtension on Platform {
  String toValue() {
    switch (this) {
      case Platform.ios:
        return 'IOS';
      case Platform.android:
        return 'ANDROID';
    }
  }
}

extension PlatformFromString on String {
  Platform toPlatform() {
    switch (this) {
      case 'IOS':
        return Platform.ios;
      case 'ANDROID':
        return Platform.android;
    }
    throw Exception('$this is not known in enum Platform');
  }
}

enum PositionalConstraint {
  exactly,
  startsWith,
  endsWith,
  contains,
  containsWord,
}

extension PositionalConstraintValueExtension on PositionalConstraint {
  String toValue() {
    switch (this) {
      case PositionalConstraint.exactly:
        return 'EXACTLY';
      case PositionalConstraint.startsWith:
        return 'STARTS_WITH';
      case PositionalConstraint.endsWith:
        return 'ENDS_WITH';
      case PositionalConstraint.contains:
        return 'CONTAINS';
      case PositionalConstraint.containsWord:
        return 'CONTAINS_WORD';
    }
  }
}

extension PositionalConstraintFromString on String {
  PositionalConstraint toPositionalConstraint() {
    switch (this) {
      case 'EXACTLY':
        return PositionalConstraint.exactly;
      case 'STARTS_WITH':
        return PositionalConstraint.startsWith;
      case 'ENDS_WITH':
        return PositionalConstraint.endsWith;
      case 'CONTAINS':
        return PositionalConstraint.contains;
      case 'CONTAINS_WORD':
        return PositionalConstraint.containsWord;
    }
    throw Exception('$this is not known in enum PositionalConstraint');
  }
}

class PutLoggingConfigurationResponse {
  /// <p/>
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

class PutPermissionPolicyResponse {
  PutPermissionPolicyResponse();

  factory PutPermissionPolicyResponse.fromJson(Map<String, dynamic> _) {
    return PutPermissionPolicyResponse();
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
class QueryString {
  QueryString();

  factory QueryString.fromJson(Map<String, dynamic> _) {
    return QueryString();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  /// The limit on requests per 5-minute period for a single aggregation instance
  /// for the rate-based rule. If the rate-based statement includes a
  /// <code>ScopeDownStatement</code>, this limit is applied only to the requests
  /// that match the statement.
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
      aggregateKeyType: (json['AggregateKeyType'] as String)
          .toRateBasedStatementAggregateKeyType(),
      limit: json['Limit'] as int,
      customKeys: (json['CustomKeys'] as List?)
          ?.whereNotNull()
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
      'AggregateKeyType': aggregateKeyType.toValue(),
      'Limit': limit,
      if (customKeys != null) 'CustomKeys': customKeys,
      if (evaluationWindowSec != null)
        'EvaluationWindowSec': evaluationWindowSec,
      if (forwardedIPConfig != null) 'ForwardedIPConfig': forwardedIPConfig,
      if (scopeDownStatement != null) 'ScopeDownStatement': scopeDownStatement,
    };
  }
}

enum RateBasedStatementAggregateKeyType {
  ip,
  forwardedIp,
  customKeys,
  constant,
}

extension RateBasedStatementAggregateKeyTypeValueExtension
    on RateBasedStatementAggregateKeyType {
  String toValue() {
    switch (this) {
      case RateBasedStatementAggregateKeyType.ip:
        return 'IP';
      case RateBasedStatementAggregateKeyType.forwardedIp:
        return 'FORWARDED_IP';
      case RateBasedStatementAggregateKeyType.customKeys:
        return 'CUSTOM_KEYS';
      case RateBasedStatementAggregateKeyType.constant:
        return 'CONSTANT';
    }
  }
}

extension RateBasedStatementAggregateKeyTypeFromString on String {
  RateBasedStatementAggregateKeyType toRateBasedStatementAggregateKeyType() {
    switch (this) {
      case 'IP':
        return RateBasedStatementAggregateKeyType.ip;
      case 'FORWARDED_IP':
        return RateBasedStatementAggregateKeyType.forwardedIp;
      case 'CUSTOM_KEYS':
        return RateBasedStatementAggregateKeyType.customKeys;
      case 'CONSTANT':
        return RateBasedStatementAggregateKeyType.constant;
    }
    throw Exception(
        '$this is not known in enum RateBasedStatementAggregateKeyType');
  }
}

/// Specifies a single custom aggregate key for a rate-base rule.
/// <note>
/// Web requests that are missing any of the components specified in the
/// aggregation keys are omitted from the rate-based rule evaluation and
/// handling.
/// </note>
class RateBasedStatementCustomKey {
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
    this.cookie,
    this.forwardedIP,
    this.hTTPMethod,
    this.header,
    this.ip,
    this.labelNamespace,
    this.queryArgument,
    this.queryString,
    this.uriPath,
  });

  factory RateBasedStatementCustomKey.fromJson(Map<String, dynamic> json) {
    return RateBasedStatementCustomKey(
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
    final cookie = this.cookie;
    final forwardedIP = this.forwardedIP;
    final hTTPMethod = this.hTTPMethod;
    final header = this.header;
    final ip = this.ip;
    final labelNamespace = this.labelNamespace;
    final queryArgument = this.queryArgument;
    final queryString = this.queryString;
    final uriPath = this.uriPath;
    return {
      if (cookie != null) 'Cookie': cookie,
      if (forwardedIP != null) 'ForwardedIP': forwardedIP,
      if (hTTPMethod != null) 'HTTPMethod': hTTPMethod,
      if (header != null) 'Header': header,
      if (ip != null) 'IP': ip,
      if (labelNamespace != null) 'LabelNamespace': labelNamespace,
      if (queryArgument != null) 'QueryArgument': queryArgument,
      if (queryString != null) 'QueryString': queryString,
      if (uriPath != null) 'UriPath': uriPath,
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      iPAddressVersion:
          (json['IPAddressVersion'] as String?)?.toIPAddressVersion(),
    );
  }

  Map<String, dynamic> toJson() {
    final addresses = this.addresses;
    final iPAddressVersion = this.iPAddressVersion;
    return {
      if (addresses != null) 'Addresses': addresses,
      if (iPAddressVersion != null)
        'IPAddressVersion': iPAddressVersion.toValue(),
    };
  }
}

/// Specifies a cookie as an aggregate key for a rate-based rule. Each distinct
/// value in the cookie contributes to the aggregation instance. If you use a
/// single cookie as your custom key, then each value fully defines an
/// aggregation instance.
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
      name: json['Name'] as String,
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
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
class RateLimitForwardedIP {
  RateLimitForwardedIP();

  factory RateLimitForwardedIP.fromJson(Map<String, dynamic> _) {
    return RateLimitForwardedIP();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies the request's HTTP method as an aggregate key for a rate-based
/// rule. Each distinct HTTP method contributes to the aggregation instance. If
/// you use just the HTTP method as your custom key, then each method fully
/// defines an aggregation instance.
///
/// JSON specification: <code>"RateLimitHTTPMethod": {}</code>
class RateLimitHTTPMethod {
  RateLimitHTTPMethod();

  factory RateLimitHTTPMethod.fromJson(Map<String, dynamic> _) {
    return RateLimitHTTPMethod();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies a header as an aggregate key for a rate-based rule. Each distinct
/// value in the header contributes to the aggregation instance. If you use a
/// single header as your custom key, then each value fully defines an
/// aggregation instance.
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
      name: json['Name'] as String,
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
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
class RateLimitLabelNamespace {
  /// The namespace to use for aggregation.
  final String namespace;

  RateLimitLabelNamespace({
    required this.namespace,
  });

  factory RateLimitLabelNamespace.fromJson(Map<String, dynamic> json) {
    return RateLimitLabelNamespace(
      namespace: json['Namespace'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    return {
      'Namespace': namespace,
    };
  }
}

/// Specifies a query argument in the request as an aggregate key for a
/// rate-based rule. Each distinct value for the named query argument
/// contributes to the aggregation instance. If you use a single query argument
/// as your custom key, then each value fully defines an aggregation instance.
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
      name: json['Name'] as String,
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
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
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
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

/// Specifies the request's URI path as an aggregate key for a rate-based rule.
/// Each distinct URI path contributes to the aggregation instance. If you use
/// just the URI path as your custom key, then each URI path fully defines an
/// aggregation instance.
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
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
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

/// A single regular expression. This is used in a <a>RegexPatternSet</a>.
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

/// A rule statement used to search web request components for a match against a
/// single regular expression.
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
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      regexString: json['RegexString'] as String,
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
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

/// Contains one or more regular expressions.
///
/// WAF assigns an ARN to each <code>RegexPatternSet</code> that you create. To
/// use a set in a rule, you provide the ARN to the <a>Rule</a> statement
/// <a>RegexPatternSetReferenceStatement</a>.
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
          ?.whereNotNull()
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
      arn: json['ARN'] as String,
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
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

/// High-level information about a <a>RegexPatternSet</a>, returned by
/// operations like create and list. This provides information like the ID, that
/// you can use to retrieve and manage a <code>RegexPatternSet</code>, and the
/// ARN, that you provide to the <a>RegexPatternSetReferenceStatement</a> to use
/// the pattern set in a <a>Rule</a>.
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
      defaultSizeInspectionLimit: (json['DefaultSizeInspectionLimit'] as String)
          .toSizeInspectionLimit(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultSizeInspectionLimit = this.defaultSizeInspectionLimit;
    return {
      'DefaultSizeInspectionLimit': defaultSizeInspectionLimit.toValue(),
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
      passwordField:
          PasswordField.fromJson(json['PasswordField'] as Map<String, dynamic>),
      payloadType: (json['PayloadType'] as String).toPayloadType(),
      usernameField:
          UsernameField.fromJson(json['UsernameField'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final passwordField = this.passwordField;
    final payloadType = this.payloadType;
    final usernameField = this.usernameField;
    return {
      'PasswordField': passwordField,
      'PayloadType': payloadType.toValue(),
      'UsernameField': usernameField,
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
      payloadType: (json['PayloadType'] as String).toPayloadType(),
      addressFields: (json['AddressFields'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
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
      'PayloadType': payloadType.toValue(),
      if (addressFields != null) 'AddressFields': addressFields,
      if (emailField != null) 'EmailField': emailField,
      if (passwordField != null) 'PasswordField': passwordField,
      if (phoneNumberFields != null) 'PhoneNumberFields': phoneNumberFields,
      if (usernameField != null) 'UsernameField': usernameField,
    };
  }
}

enum ResourceType {
  applicationLoadBalancer,
  apiGateway,
  appsync,
  cognitoUserPool,
  appRunnerService,
  verifiedAccessInstance,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.applicationLoadBalancer:
        return 'APPLICATION_LOAD_BALANCER';
      case ResourceType.apiGateway:
        return 'API_GATEWAY';
      case ResourceType.appsync:
        return 'APPSYNC';
      case ResourceType.cognitoUserPool:
        return 'COGNITO_USER_POOL';
      case ResourceType.appRunnerService:
        return 'APP_RUNNER_SERVICE';
      case ResourceType.verifiedAccessInstance:
        return 'VERIFIED_ACCESS_INSTANCE';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'APPLICATION_LOAD_BALANCER':
        return ResourceType.applicationLoadBalancer;
      case 'API_GATEWAY':
        return ResourceType.apiGateway;
      case 'APPSYNC':
        return ResourceType.appsync;
      case 'COGNITO_USER_POOL':
        return ResourceType.cognitoUserPool;
      case 'APP_RUNNER_SERVICE':
        return ResourceType.appRunnerService;
      case 'VERIFIED_ACCESS_INSTANCE':
        return ResourceType.verifiedAccessInstance;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

enum ResponseContentType {
  textPlain,
  textHtml,
  applicationJson,
}

extension ResponseContentTypeValueExtension on ResponseContentType {
  String toValue() {
    switch (this) {
      case ResponseContentType.textPlain:
        return 'TEXT_PLAIN';
      case ResponseContentType.textHtml:
        return 'TEXT_HTML';
      case ResponseContentType.applicationJson:
        return 'APPLICATION_JSON';
    }
  }
}

extension ResponseContentTypeFromString on String {
  ResponseContentType toResponseContentType() {
    switch (this) {
      case 'TEXT_PLAIN':
        return ResponseContentType.textPlain;
      case 'TEXT_HTML':
        return ResponseContentType.textHtml;
      case 'APPLICATION_JSON':
        return ResponseContentType.applicationJson;
    }
    throw Exception('$this is not known in enum ResponseContentType');
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

/// Configures inspection of the response body. WAF can inspect the first 65,536
/// bytes (64 KB) of the response body. This is part of the
/// <code>ResponseInspection</code> configuration for
/// <code>AWSManagedRulesATPRuleSet</code> and
/// <code>AWSManagedRulesACFPRuleSet</code>.
/// <note>
/// Response inspection is available only in web ACLs that protect Amazon
/// CloudFront distributions.
/// </note>
class ResponseInspectionBodyContains {
  /// Strings in the body of the response that indicate a failed login or account
  /// creation attempt. To be counted as a failure, the string can be anywhere in
  /// the body and must be an exact match, including case. Each string must be
  /// unique among the success and failure strings.
  ///
  /// JSON example: <code>"FailureStrings": [ "Request failed" ]</code>
  final List<String> failureStrings;

  /// Strings in the body of the response that indicate a successful login or
  /// account creation attempt. To be counted as a success, the string can be
  /// anywhere in the body and must be an exact match, including case. Each string
  /// must be unique among the success and failure strings.
  ///
  /// JSON examples: <code>"SuccessStrings": [ "Login successful" ]</code> and
  /// <code>"SuccessStrings": [ "Account creation successful", "Welcome to our
  /// site!" ]</code>
  final List<String> successStrings;

  ResponseInspectionBodyContains({
    required this.failureStrings,
    required this.successStrings,
  });

  factory ResponseInspectionBodyContains.fromJson(Map<String, dynamic> json) {
    return ResponseInspectionBodyContains(
      failureStrings: (json['FailureStrings'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      successStrings: (json['SuccessStrings'] as List)
          .whereNotNull()
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

/// Configures inspection of the response header. This is part of the
/// <code>ResponseInspection</code> configuration for
/// <code>AWSManagedRulesATPRuleSet</code> and
/// <code>AWSManagedRulesACFPRuleSet</code>.
/// <note>
/// Response inspection is available only in web ACLs that protect Amazon
/// CloudFront distributions.
/// </note>
class ResponseInspectionHeader {
  /// Values in the response header with the specified name that indicate a failed
  /// login or account creation attempt. To be counted as a failure, the value
  /// must be an exact match, including case. Each value must be unique among the
  /// success and failure values.
  ///
  /// JSON examples: <code>"FailureValues": [ "LoginFailed", "Failed login"
  /// ]</code> and <code>"FailureValues": [ "AccountCreationFailed" ]</code>
  final List<String> failureValues;

  /// The name of the header to match against. The name must be an exact match,
  /// including case.
  ///
  /// JSON example: <code>"Name": [ "RequestResult" ]</code>
  final String name;

  /// Values in the response header with the specified name that indicate a
  /// successful login or account creation attempt. To be counted as a success,
  /// the value must be an exact match, including case. Each value must be unique
  /// among the success and failure values.
  ///
  /// JSON examples: <code>"SuccessValues": [ "LoginPassed", "Successful login"
  /// ]</code> and <code>"SuccessValues": [ "AccountCreated", "Successful account
  /// creation" ]</code>
  final List<String> successValues;

  ResponseInspectionHeader({
    required this.failureValues,
    required this.name,
    required this.successValues,
  });

  factory ResponseInspectionHeader.fromJson(Map<String, dynamic> json) {
    return ResponseInspectionHeader(
      failureValues: (json['FailureValues'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['Name'] as String,
      successValues: (json['SuccessValues'] as List)
          .whereNotNull()
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

/// Configures inspection of the response JSON. WAF can inspect the first 65,536
/// bytes (64 KB) of the response JSON. This is part of the
/// <code>ResponseInspection</code> configuration for
/// <code>AWSManagedRulesATPRuleSet</code> and
/// <code>AWSManagedRulesACFPRuleSet</code>.
/// <note>
/// Response inspection is available only in web ACLs that protect Amazon
/// CloudFront distributions.
/// </note>
class ResponseInspectionJson {
  /// Values for the specified identifier in the response JSON that indicate a
  /// failed login or account creation attempt. To be counted as a failure, the
  /// value must be an exact match, including case. Each value must be unique
  /// among the success and failure values.
  ///
  /// JSON example: <code>"FailureValues": [ "False", "Failed" ]</code>
  final List<String> failureValues;

  /// The identifier for the value to match against in the JSON. The identifier
  /// must be an exact match, including case.
  ///
  /// JSON examples: <code>"Identifier": [ "/login/success" ]</code> and
  /// <code>"Identifier": [ "/sign-up/success" ]</code>
  final String identifier;

  /// Values for the specified identifier in the response JSON that indicate a
  /// successful login or account creation attempt. To be counted as a success,
  /// the value must be an exact match, including case. Each value must be unique
  /// among the success and failure values.
  ///
  /// JSON example: <code>"SuccessValues": [ "True", "Succeeded" ]</code>
  final List<String> successValues;

  ResponseInspectionJson({
    required this.failureValues,
    required this.identifier,
    required this.successValues,
  });

  factory ResponseInspectionJson.fromJson(Map<String, dynamic> json) {
    return ResponseInspectionJson(
      failureValues: (json['FailureValues'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      identifier: json['Identifier'] as String,
      successValues: (json['SuccessValues'] as List)
          .whereNotNull()
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

/// Configures inspection of the response status code. This is part of the
/// <code>ResponseInspection</code> configuration for
/// <code>AWSManagedRulesATPRuleSet</code> and
/// <code>AWSManagedRulesACFPRuleSet</code>.
/// <note>
/// Response inspection is available only in web ACLs that protect Amazon
/// CloudFront distributions.
/// </note>
class ResponseInspectionStatusCode {
  /// Status codes in the response that indicate a failed login or account
  /// creation attempt. To be counted as a failure, the response status code must
  /// match one of these. Each code must be unique among the success and failure
  /// status codes.
  ///
  /// JSON example: <code>"FailureCodes": [ 400, 404 ]</code>
  final List<int> failureCodes;

  /// Status codes in the response that indicate a successful login or account
  /// creation attempt. To be counted as a success, the response status code must
  /// match one of these. Each code must be unique among the success and failure
  /// status codes.
  ///
  /// JSON example: <code>"SuccessCodes": [ 200, 201 ]</code>
  final List<int> successCodes;

  ResponseInspectionStatusCode({
    required this.failureCodes,
    required this.successCodes,
  });

  factory ResponseInspectionStatusCode.fromJson(Map<String, dynamic> json) {
    return ResponseInspectionStatusCode(
      failureCodes: (json['FailureCodes'] as List)
          .whereNotNull()
          .map((e) => e as int)
          .toList(),
      successCodes: (json['SuccessCodes'] as List)
          .whereNotNull()
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

/// A single rule, which you can use in a <a>WebACL</a> or <a>RuleGroup</a> to
/// identify web requests that you want to manage in some way. Each rule
/// includes one top-level <a>Statement</a> that WAF uses to identify matching
/// web requests, and parameters that govern how WAF handles them.
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
  ///
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
      name: json['Name'] as String,
      priority: json['Priority'] as int,
      statement: Statement.fromJson(json['Statement'] as Map<String, dynamic>),
      visibilityConfig: VisibilityConfig.fromJson(
          json['VisibilityConfig'] as Map<String, dynamic>),
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
          ?.whereNotNull()
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

/// The action that WAF should take on a web request when it matches a rule's
/// statement. Settings at the web ACL level can override the rule action
/// setting.
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

/// Action setting to use in the place of a rule action that is configured
/// inside the rule group. You specify one override for each rule whose action
/// you want to change.
///
/// You can use overrides for testing, for example you can override all of rule
/// actions to <code>Count</code> and then monitor the resulting count metrics
/// to understand how the rule group would handle your web traffic. You can also
/// permanently override some or all actions, to modify how the rule group
/// manages your web traffic.
class RuleActionOverride {
  /// The override action to use, in place of the configured action of the rule in
  /// the rule group.
  final RuleAction actionToUse;

  /// The name of the rule to override.
  final String name;

  RuleActionOverride({
    required this.actionToUse,
    required this.name,
  });

  factory RuleActionOverride.fromJson(Map<String, dynamic> json) {
    return RuleActionOverride(
      actionToUse:
          RuleAction.fromJson(json['ActionToUse'] as Map<String, dynamic>),
      name: json['Name'] as String,
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

/// A rule group defines a collection of rules to inspect and control web
/// requests that you can use in a <a>WebACL</a>. When you create a rule group,
/// you define an immutable capacity limit. If you update a rule group, you must
/// stay within the capacity. This allows others to reuse the rule group with
/// confidence in its capacity requirements.
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
  /// <code>awswaf:&lt;account ID&gt;:rulegroup:&lt;rule group name&gt;:</code>
  /// </li>
  /// <li>
  /// When a rule with a label matches a web request, WAF adds the fully qualified
  /// label to the request. A fully qualified label is made up of the label
  /// namespace from the rule group or web ACL where the rule is defined and the
  /// label from the rule, separated by a colon:
  ///
  /// <code>&lt;label namespace&gt;:&lt;label from rule&gt;</code>
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
      arn: json['ARN'] as String,
      capacity: json['Capacity'] as int,
      id: json['Id'] as String,
      name: json['Name'] as String,
      visibilityConfig: VisibilityConfig.fromJson(
          json['VisibilityConfig'] as Map<String, dynamic>),
      availableLabels: (json['AvailableLabels'] as List?)
          ?.whereNotNull()
          .map((e) => LabelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      consumedLabels: (json['ConsumedLabels'] as List?)
          ?.whereNotNull()
          .map((e) => LabelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      customResponseBodies:
          (json['CustomResponseBodies'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k, CustomResponseBody.fromJson(e as Map<String, dynamic>))),
      description: json['Description'] as String?,
      labelNamespace: json['LabelNamespace'] as String?,
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
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

/// A rule statement used to run the rules that are defined in a
/// <a>RuleGroup</a>. To use this, create a rule group with your rules, then
/// provide the ARN of the rule group in this statement.
///
/// You cannot nest a <code>RuleGroupReferenceStatement</code>, for example for
/// use inside a <code>NotStatement</code> or <code>OrStatement</code>. You
/// cannot use a rule group reference statement inside another rule group. You
/// can only reference a rule group as a top-level statement within a rule that
/// you define in a web ACL.
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
  ///
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
      arn: json['ARN'] as String,
      excludedRules: (json['ExcludedRules'] as List?)
          ?.whereNotNull()
          .map((e) => ExcludedRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      ruleActionOverrides: (json['RuleActionOverrides'] as List?)
          ?.whereNotNull()
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

/// High-level information about a <a>RuleGroup</a>, returned by operations like
/// create and list. This provides information like the ID, that you can use to
/// retrieve and manage a <code>RuleGroup</code>, and the ARN, that you provide
/// to the <a>RuleGroupReferenceStatement</a> to use the rule group in a
/// <a>Rule</a>.
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

/// High-level information about a <a>Rule</a>, returned by operations like
/// <a>DescribeManagedRuleGroup</a>. This provides information like the ID, that
/// you can use to retrieve and manage a <code>RuleGroup</code>, and the ARN,
/// that you provide to the <a>RuleGroupReferenceStatement</a> to use the rule
/// group in a <a>Rule</a>.
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

/// Represents a single sampled web request. The response from
/// <a>GetSampledRequests</a> includes a <code>SampledHTTPRequests</code>
/// complex type that appears as <code>SampledRequests</code> in the response
/// syntax. <code>SampledHTTPRequests</code> contains an array of
/// <code>SampledHTTPRequest</code> objects.
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
  /// groups, the format for this name is <code>&lt;vendor name&gt;#&lt;managed
  /// rule group name&gt;#&lt;rule name&gt;</code>. For your own rule groups, the
  /// format for this name is <code>&lt;rule group name&gt;#&lt;rule
  /// name&gt;</code>. If the rule is not in a rule group, this field is absent.
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
      request: HTTPRequest.fromJson(json['Request'] as Map<String, dynamic>),
      weight: json['Weight'] as int,
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
          ?.whereNotNull()
          .map((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList(),
      overriddenAction: json['OverriddenAction'] as String?,
      requestHeadersInserted: (json['RequestHeadersInserted'] as List?)
          ?.whereNotNull()
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

enum Scope {
  cloudfront,
  regional,
}

extension ScopeValueExtension on Scope {
  String toValue() {
    switch (this) {
      case Scope.cloudfront:
        return 'CLOUDFRONT';
      case Scope.regional:
        return 'REGIONAL';
    }
  }
}

extension ScopeFromString on String {
  Scope toScope() {
    switch (this) {
      case 'CLOUDFRONT':
        return Scope.cloudfront;
      case 'REGIONAL':
        return Scope.regional;
    }
    throw Exception('$this is not known in enum Scope');
  }
}

enum SensitivityLevel {
  low,
  high,
}

extension SensitivityLevelValueExtension on SensitivityLevel {
  String toValue() {
    switch (this) {
      case SensitivityLevel.low:
        return 'LOW';
      case SensitivityLevel.high:
        return 'HIGH';
    }
  }
}

extension SensitivityLevelFromString on String {
  SensitivityLevel toSensitivityLevel() {
    switch (this) {
      case 'LOW':
        return SensitivityLevel.low;
      case 'HIGH':
        return SensitivityLevel.high;
    }
    throw Exception('$this is not known in enum SensitivityLevel');
  }
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
class SingleHeader {
  /// The name of the query header to inspect.
  final String name;

  SingleHeader({
    required this.name,
  });

  factory SingleHeader.fromJson(Map<String, dynamic> json) {
    return SingleHeader(
      name: json['Name'] as String,
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
class SingleQueryArgument {
  /// The name of the query argument to inspect.
  final String name;

  SingleQueryArgument({
    required this.name,
  });

  factory SingleQueryArgument.fromJson(Map<String, dynamic> json) {
    return SingleQueryArgument(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

/// A rule statement that compares a number of bytes against the size of a
/// request component, using a comparison operator, such as greater than (&gt;)
/// or less than (&lt;). For example, you can use a size constraint statement to
/// look for query strings that are longer than 100 bytes.
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
      comparisonOperator:
          (json['ComparisonOperator'] as String).toComparisonOperator(),
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      size: json['Size'] as int,
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
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
      'ComparisonOperator': comparisonOperator.toValue(),
      'FieldToMatch': fieldToMatch,
      'Size': size,
      'TextTransformations': textTransformations,
    };
  }
}

enum SizeInspectionLimit {
  kb_16,
  kb_32,
  kb_48,
  kb_64,
}

extension SizeInspectionLimitValueExtension on SizeInspectionLimit {
  String toValue() {
    switch (this) {
      case SizeInspectionLimit.kb_16:
        return 'KB_16';
      case SizeInspectionLimit.kb_32:
        return 'KB_32';
      case SizeInspectionLimit.kb_48:
        return 'KB_48';
      case SizeInspectionLimit.kb_64:
        return 'KB_64';
    }
  }
}

extension SizeInspectionLimitFromString on String {
  SizeInspectionLimit toSizeInspectionLimit() {
    switch (this) {
      case 'KB_16':
        return SizeInspectionLimit.kb_16;
      case 'KB_32':
        return SizeInspectionLimit.kb_32;
      case 'KB_48':
        return SizeInspectionLimit.kb_48;
      case 'KB_64':
        return SizeInspectionLimit.kb_64;
    }
    throw Exception('$this is not known in enum SizeInspectionLimit');
  }
}

/// A rule statement that inspects for malicious SQL code. Attackers insert
/// malicious SQL code into web requests to do things like modify your database
/// or extract data from it.
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
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
          .map((e) => TextTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      sensitivityLevel:
          (json['SensitivityLevel'] as String?)?.toSensitivityLevel(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldToMatch = this.fieldToMatch;
    final textTransformations = this.textTransformations;
    final sensitivityLevel = this.sensitivityLevel;
    return {
      'FieldToMatch': fieldToMatch,
      'TextTransformations': textTransformations,
      if (sensitivityLevel != null)
        'SensitivityLevel': sensitivityLevel.toValue(),
    };
  }
}

/// The processing guidance for a <a>Rule</a>, used by WAF to determine whether
/// a web request matches the rule.
///
/// For example specifications, see the examples section of <a>CreateWebACL</a>.
class Statement {
  /// A logical rule statement used to combine other rule statements with AND
  /// logic. You provide more than one <a>Statement</a> within the
  /// <code>AndStatement</code>.
  final AndStatement? andStatement;

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
  /// <code>awswaf:clientip:geo:region:&lt;ISO country code&gt;-&lt;ISO region
  /// code&gt;</code> and <code>awswaf:clientip:geo:country:&lt;ISO country
  /// code&gt;</code>.
  ///
  /// If you use a forwarded IP address, the label formats are
  /// <code>awswaf:forwardedip:geo:region:&lt;ISO country code&gt;-&lt;ISO region
  /// code&gt;</code> and <code>awswaf:forwardedip:geo:country:&lt;ISO country
  /// code&gt;</code>.
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
  /// request component, using a comparison operator, such as greater than (&gt;)
  /// or less than (&lt;). For example, you can use a size constraint statement to
  /// look for query strings that are longer than 100 bytes.
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
          ?.whereNotNull()
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Text transformations eliminate some of the unusual formatting that attackers
/// use in web requests in an effort to bypass detection.
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
      priority: json['Priority'] as int,
      type: (json['Type'] as String).toTextTransformationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final priority = this.priority;
    final type = this.type;
    return {
      'Priority': priority,
      'Type': type.toValue(),
    };
  }
}

enum TextTransformationType {
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
  utf8ToUnicode,
}

extension TextTransformationTypeValueExtension on TextTransformationType {
  String toValue() {
    switch (this) {
      case TextTransformationType.none:
        return 'NONE';
      case TextTransformationType.compressWhiteSpace:
        return 'COMPRESS_WHITE_SPACE';
      case TextTransformationType.htmlEntityDecode:
        return 'HTML_ENTITY_DECODE';
      case TextTransformationType.lowercase:
        return 'LOWERCASE';
      case TextTransformationType.cmdLine:
        return 'CMD_LINE';
      case TextTransformationType.urlDecode:
        return 'URL_DECODE';
      case TextTransformationType.base64Decode:
        return 'BASE64_DECODE';
      case TextTransformationType.hexDecode:
        return 'HEX_DECODE';
      case TextTransformationType.md5:
        return 'MD5';
      case TextTransformationType.replaceComments:
        return 'REPLACE_COMMENTS';
      case TextTransformationType.escapeSeqDecode:
        return 'ESCAPE_SEQ_DECODE';
      case TextTransformationType.sqlHexDecode:
        return 'SQL_HEX_DECODE';
      case TextTransformationType.cssDecode:
        return 'CSS_DECODE';
      case TextTransformationType.jsDecode:
        return 'JS_DECODE';
      case TextTransformationType.normalizePath:
        return 'NORMALIZE_PATH';
      case TextTransformationType.normalizePathWin:
        return 'NORMALIZE_PATH_WIN';
      case TextTransformationType.removeNulls:
        return 'REMOVE_NULLS';
      case TextTransformationType.replaceNulls:
        return 'REPLACE_NULLS';
      case TextTransformationType.base64DecodeExt:
        return 'BASE64_DECODE_EXT';
      case TextTransformationType.urlDecodeUni:
        return 'URL_DECODE_UNI';
      case TextTransformationType.utf8ToUnicode:
        return 'UTF8_TO_UNICODE';
    }
  }
}

extension TextTransformationTypeFromString on String {
  TextTransformationType toTextTransformationType() {
    switch (this) {
      case 'NONE':
        return TextTransformationType.none;
      case 'COMPRESS_WHITE_SPACE':
        return TextTransformationType.compressWhiteSpace;
      case 'HTML_ENTITY_DECODE':
        return TextTransformationType.htmlEntityDecode;
      case 'LOWERCASE':
        return TextTransformationType.lowercase;
      case 'CMD_LINE':
        return TextTransformationType.cmdLine;
      case 'URL_DECODE':
        return TextTransformationType.urlDecode;
      case 'BASE64_DECODE':
        return TextTransformationType.base64Decode;
      case 'HEX_DECODE':
        return TextTransformationType.hexDecode;
      case 'MD5':
        return TextTransformationType.md5;
      case 'REPLACE_COMMENTS':
        return TextTransformationType.replaceComments;
      case 'ESCAPE_SEQ_DECODE':
        return TextTransformationType.escapeSeqDecode;
      case 'SQL_HEX_DECODE':
        return TextTransformationType.sqlHexDecode;
      case 'CSS_DECODE':
        return TextTransformationType.cssDecode;
      case 'JS_DECODE':
        return TextTransformationType.jsDecode;
      case 'NORMALIZE_PATH':
        return TextTransformationType.normalizePath;
      case 'NORMALIZE_PATH_WIN':
        return TextTransformationType.normalizePathWin;
      case 'REMOVE_NULLS':
        return TextTransformationType.removeNulls;
      case 'REPLACE_NULLS':
        return TextTransformationType.replaceNulls;
      case 'BASE64_DECODE_EXT':
        return TextTransformationType.base64DecodeExt;
      case 'URL_DECODE_UNI':
        return TextTransformationType.urlDecodeUni;
      case 'UTF8_TO_UNICODE':
        return TextTransformationType.utf8ToUnicode;
    }
    throw Exception('$this is not known in enum TextTransformationType');
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
      endTime: nonNullableTimeStampFromJson(json['EndTime'] as Object),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

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

/// Inspect the path component of the URI of the web request. This is the part
/// of the web request that identifies a resource. For example,
/// <code>/images/daily-ad.jpg</code>.
///
/// This is used in the <a>FieldToMatch</a> specification for some web request
/// component types.
///
/// JSON specification: <code>"UriPath": {}</code>
class UriPath {
  UriPath();

  factory UriPath.fromJson(Map<String, dynamic> _) {
    return UriPath();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The name of the field in the request payload that contains your customer's
/// username.
///
/// This data type is used in the <code>RequestInspection</code> and
/// <code>RequestInspectionACFP</code> data types.
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
      identifier: json['Identifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      'Identifier': identifier,
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

/// Defines and enables Amazon CloudWatch metrics and web request sample
/// collection.
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
  /// <note>
  /// Request sampling doesn't provide a field redaction option, and any field
  /// redaction that you specify in your logging configuration doesn't affect
  /// sampling. The only way to exclude fields from request sampling is by
  /// disabling sampling in the web ACL visibility configuration.
  /// </note>
  final bool sampledRequestsEnabled;

  VisibilityConfig({
    required this.cloudWatchMetricsEnabled,
    required this.metricName,
    required this.sampledRequestsEnabled,
  });

  factory VisibilityConfig.fromJson(Map<String, dynamic> json) {
    return VisibilityConfig(
      cloudWatchMetricsEnabled: json['CloudWatchMetricsEnabled'] as bool,
      metricName: json['MetricName'] as String,
      sampledRequestsEnabled: json['SampledRequestsEnabled'] as bool,
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

/// A web ACL defines a collection of rules to use to inspect and control web
/// requests. Each rule has a statement that defines what to look for in web
/// requests and an action that WAF applies to requests that match the
/// statement. In the web ACL, you assign a default action to take (allow,
/// block) for any request that does not match any of the rules. The rules in a
/// web ACL can be a combination of the types <a>Rule</a>, <a>RuleGroup</a>, and
/// managed rule group. You can associate a web ACL with one or more Amazon Web
/// Services resources to protect. The resources can be an Amazon CloudFront
/// distribution, an Amazon API Gateway REST API, an Application Load Balancer,
/// an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service,
/// or an Amazon Web Services Verified Access instance.
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

  /// A description of the web ACL that helps with identification.
  final String? description;

  /// The label namespace prefix for this web ACL. All labels added by rules in
  /// this web ACL have this prefix.
  ///
  /// <ul>
  /// <li>
  /// The syntax for the label namespace prefix for a web ACL is the following:
  ///
  /// <code>awswaf:&lt;account ID&gt;:webacl:&lt;web ACL name&gt;:</code>
  /// </li>
  /// <li>
  /// When a rule with a label matches a web request, WAF adds the fully qualified
  /// label to the request. A fully qualified label is made up of the label
  /// namespace from the rule group or web ACL where the rule is defined and the
  /// label from the rule, separated by a colon:
  ///
  /// <code>&lt;label namespace&gt;:&lt;label from rule&gt;</code>
  /// </li>
  /// </ul>
  final String? labelNamespace;

  /// Indicates whether this web ACL is managed by Firewall Manager. If true, then
  /// only Firewall Manager can delete the web ACL or any Firewall Manager rule
  /// groups in the web ACL.
  final bool? managedByFirewallManager;

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
    this.associationConfig,
    this.capacity,
    this.captchaConfig,
    this.challengeConfig,
    this.customResponseBodies,
    this.description,
    this.labelNamespace,
    this.managedByFirewallManager,
    this.postProcessFirewallManagerRuleGroups,
    this.preProcessFirewallManagerRuleGroups,
    this.rules,
    this.tokenDomains,
  });

  factory WebACL.fromJson(Map<String, dynamic> json) {
    return WebACL(
      arn: json['ARN'] as String,
      defaultAction:
          DefaultAction.fromJson(json['DefaultAction'] as Map<String, dynamic>),
      id: json['Id'] as String,
      name: json['Name'] as String,
      visibilityConfig: VisibilityConfig.fromJson(
          json['VisibilityConfig'] as Map<String, dynamic>),
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
      description: json['Description'] as String?,
      labelNamespace: json['LabelNamespace'] as String?,
      managedByFirewallManager: json['ManagedByFirewallManager'] as bool?,
      postProcessFirewallManagerRuleGroups:
          (json['PostProcessFirewallManagerRuleGroups'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  FirewallManagerRuleGroup.fromJson(e as Map<String, dynamic>))
              .toList(),
      preProcessFirewallManagerRuleGroups:
          (json['PreProcessFirewallManagerRuleGroups'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  FirewallManagerRuleGroup.fromJson(e as Map<String, dynamic>))
              .toList(),
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
      tokenDomains: (json['TokenDomains'] as List?)
          ?.whereNotNull()
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
    final associationConfig = this.associationConfig;
    final capacity = this.capacity;
    final captchaConfig = this.captchaConfig;
    final challengeConfig = this.challengeConfig;
    final customResponseBodies = this.customResponseBodies;
    final description = this.description;
    final labelNamespace = this.labelNamespace;
    final managedByFirewallManager = this.managedByFirewallManager;
    final postProcessFirewallManagerRuleGroups =
        this.postProcessFirewallManagerRuleGroups;
    final preProcessFirewallManagerRuleGroups =
        this.preProcessFirewallManagerRuleGroups;
    final rules = this.rules;
    final tokenDomains = this.tokenDomains;
    return {
      'ARN': arn,
      'DefaultAction': defaultAction,
      'Id': id,
      'Name': name,
      'VisibilityConfig': visibilityConfig,
      if (associationConfig != null) 'AssociationConfig': associationConfig,
      if (capacity != null) 'Capacity': capacity,
      if (captchaConfig != null) 'CaptchaConfig': captchaConfig,
      if (challengeConfig != null) 'ChallengeConfig': challengeConfig,
      if (customResponseBodies != null)
        'CustomResponseBodies': customResponseBodies,
      if (description != null) 'Description': description,
      if (labelNamespace != null) 'LabelNamespace': labelNamespace,
      if (managedByFirewallManager != null)
        'ManagedByFirewallManager': managedByFirewallManager,
      if (postProcessFirewallManagerRuleGroups != null)
        'PostProcessFirewallManagerRuleGroups':
            postProcessFirewallManagerRuleGroups,
      if (preProcessFirewallManagerRuleGroups != null)
        'PreProcessFirewallManagerRuleGroups':
            preProcessFirewallManagerRuleGroups,
      if (rules != null) 'Rules': rules,
      if (tokenDomains != null) 'TokenDomains': tokenDomains,
    };
  }
}

/// High-level information about a <a>WebACL</a>, returned by operations like
/// create and list. This provides information like the ID, that you can use to
/// retrieve and manage a <code>WebACL</code>, and the ARN, that you provide to
/// operations like <a>AssociateWebACL</a>.
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

/// A rule statement that inspects for cross-site scripting (XSS) attacks. In
/// XSS attacks, the attacker uses vulnerabilities in a benign website as a
/// vehicle to inject malicious client-site scripts into other legitimate web
/// browsers.
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
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      textTransformations: (json['TextTransformations'] as List)
          .whereNotNull()
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

class WAFAssociatedItemException extends _s.GenericAwsException {
  WAFAssociatedItemException({String? type, String? message})
      : super(type: type, code: 'WAFAssociatedItemException', message: message);
}

class WAFConfigurationWarningException extends _s.GenericAwsException {
  WAFConfigurationWarningException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFConfigurationWarningException',
            message: message);
}

class WAFDuplicateItemException extends _s.GenericAwsException {
  WAFDuplicateItemException({String? type, String? message})
      : super(type: type, code: 'WAFDuplicateItemException', message: message);
}

class WAFExpiredManagedRuleGroupVersionException
    extends _s.GenericAwsException {
  WAFExpiredManagedRuleGroupVersionException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFExpiredManagedRuleGroupVersionException',
            message: message);
}

class WAFInternalErrorException extends _s.GenericAwsException {
  WAFInternalErrorException({String? type, String? message})
      : super(type: type, code: 'WAFInternalErrorException', message: message);
}

class WAFInvalidOperationException extends _s.GenericAwsException {
  WAFInvalidOperationException({String? type, String? message})
      : super(
            type: type, code: 'WAFInvalidOperationException', message: message);
}

class WAFInvalidParameterException extends _s.GenericAwsException {
  WAFInvalidParameterException({String? type, String? message})
      : super(
            type: type, code: 'WAFInvalidParameterException', message: message);
}

class WAFInvalidPermissionPolicyException extends _s.GenericAwsException {
  WAFInvalidPermissionPolicyException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFInvalidPermissionPolicyException',
            message: message);
}

class WAFInvalidResourceException extends _s.GenericAwsException {
  WAFInvalidResourceException({String? type, String? message})
      : super(
            type: type, code: 'WAFInvalidResourceException', message: message);
}

class WAFLimitsExceededException extends _s.GenericAwsException {
  WAFLimitsExceededException({String? type, String? message})
      : super(type: type, code: 'WAFLimitsExceededException', message: message);
}

class WAFLogDestinationPermissionIssueException extends _s.GenericAwsException {
  WAFLogDestinationPermissionIssueException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFLogDestinationPermissionIssueException',
            message: message);
}

class WAFNonexistentItemException extends _s.GenericAwsException {
  WAFNonexistentItemException({String? type, String? message})
      : super(
            type: type, code: 'WAFNonexistentItemException', message: message);
}

class WAFOptimisticLockException extends _s.GenericAwsException {
  WAFOptimisticLockException({String? type, String? message})
      : super(type: type, code: 'WAFOptimisticLockException', message: message);
}

class WAFServiceLinkedRoleErrorException extends _s.GenericAwsException {
  WAFServiceLinkedRoleErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFServiceLinkedRoleErrorException',
            message: message);
}

class WAFSubscriptionNotFoundException extends _s.GenericAwsException {
  WAFSubscriptionNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFSubscriptionNotFoundException',
            message: message);
}

class WAFTagOperationException extends _s.GenericAwsException {
  WAFTagOperationException({String? type, String? message})
      : super(type: type, code: 'WAFTagOperationException', message: message);
}

class WAFTagOperationInternalErrorException extends _s.GenericAwsException {
  WAFTagOperationInternalErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFTagOperationInternalErrorException',
            message: message);
}

class WAFUnavailableEntityException extends _s.GenericAwsException {
  WAFUnavailableEntityException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFUnavailableEntityException',
            message: message);
}

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
