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

part '2019-07-29.g.dart';

/// <note>
/// This is the latest version of the <b>AWS WAF</b> API, released in November,
/// 2019. The names of the entities that you use to access this API, like
/// endpoints and namespaces, all have the versioning information added, like
/// "V2" or "v2", to distinguish from the prior version. We recommend migrating
/// your resources to this version, because it has a number of significant
/// improvements.
///
/// If you used AWS WAF prior to this release, you can't use this AWS WAFV2 API
/// to access any AWS WAF resources that you created before. You can access your
/// old rules, web ACLs, and other AWS WAF resources only through the AWS WAF
/// Classic APIs. The AWS WAF Classic APIs have retained the prior names,
/// endpoints, and namespaces.
///
/// For information, including how to migrate your AWS WAF resources to this
/// version, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// AWS WAF is a web application firewall that lets you monitor the HTTP and
/// HTTPS requests that are forwarded to Amazon CloudFront, an Amazon API
/// Gateway REST API, an Application Load Balancer, or an AWS AppSync GraphQL
/// API. AWS WAF also lets you control access to your content. Based on
/// conditions that you specify, such as the IP addresses that requests
/// originate from or the values of query strings, the API Gateway REST API,
/// CloudFront distribution, the Application Load Balancer, or the AWS AppSync
/// GraphQL API responds to requests either with the requested content or with
/// an HTTP 403 status code (Forbidden). You also can configure CloudFront to
/// return a custom error page when a request is blocked.
///
/// This API guide is for developers who need detailed information about AWS WAF
/// API actions, data types, and errors. For detailed information about AWS WAF
/// features and an overview of how to use AWS WAF, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
/// Developer Guide</a>.
///
/// You can make calls using the endpoints listed in <a
/// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#waf_region">AWS
/// Service Endpoints for AWS WAF</a>.
///
/// <ul>
/// <li>
/// For regional applications, you can use any of the endpoints in the list. A
/// regional application can be an Application Load Balancer (ALB), an API
/// Gateway REST API, or an AppSync GraphQL API.
/// </li>
/// <li>
/// For AWS CloudFront applications, you must use the API endpoint listed for US
/// East (N. Virginia): us-east-1.
/// </li>
/// </ul>
/// Alternatively, you can use one of the AWS SDKs to access an API that's
/// tailored to the programming language or platform that you're using. For more
/// information, see <a href="http://aws.amazon.com/tools/#SDKs">AWS SDKs</a>.
///
/// We currently provide two versions of the AWS WAF API: this API and the prior
/// versions, the classic AWS WAF APIs. This new API provides the same
/// functionality as the older versions, with the following major improvements:
///
/// <ul>
/// <li>
/// You use one API for both global and regional applications. Where you need to
/// distinguish the scope, you specify a <code>Scope</code> parameter and set it
/// to <code>CLOUDFRONT</code> or <code>REGIONAL</code>.
/// </li>
/// <li>
/// You can define a Web ACL or rule group with a single call, and update it
/// with a single call. You define all rule specifications in JSON format, and
/// pass them to your rule group or Web ACL calls.
/// </li>
/// <li>
/// The limits AWS WAF places on the use of rules more closely reflects the cost
/// of running each type of rule. Rule groups include capacity settings, so you
/// know the maximum cost of a rule group when you use it.
/// </li>
/// </ul>
class Wafv2 {
  final _s.JsonProtocol _protocol;
  Wafv2({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'wafv2',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Associates a Web ACL with a regional application resource, to protect the
  /// resource. A regional application can be an Application Load Balancer
  /// (ALB), an API Gateway REST API, or an AppSync GraphQL API.
  ///
  /// For AWS CloudFront, don't use this call. Instead, use your CloudFront
  /// distribution configuration. To associate a Web ACL, in the CloudFront call
  /// <code>UpdateDistribution</code>, set the web ACL ID to the Amazon Resource
  /// Name (ARN) of the Web ACL. For information, see <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html">UpdateDistribution</a>.
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
  /// <code>arn:aws:elasticloadbalancing:<i>region</i>:<i>account-id</i>:loadbalancer/app/<i>load-balancer-name</i>/<i>load-balancer-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an API Gateway REST API:
  /// <code>arn:aws:apigateway:<i>region</i>::/restapis/<i>api-id</i>/stages/<i>stage-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an AppSync GraphQL API:
  /// <code>arn:aws:appsync:<i>region</i>:<i>account-id</i>:apis/<i>GraphQLApiId</i>
  /// </code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [webACLArn] :
  /// The Amazon Resource Name (ARN) of the Web ACL that you want to associate
  /// with the resource.
  Future<void> associateWebACL({
    @_s.required String resourceArn,
    @_s.required String webACLArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(webACLArn, 'webACLArn');
    _s.validateStringLength(
      'webACLArn',
      webACLArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'webACLArn',
      webACLArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.AssociateWebACL'
    };
    final jsonResponse = await _protocol.send(
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

    return AssociateWebACLResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Returns the web ACL capacity unit (WCU) requirements for a specified scope
  /// and set of rules. You can use this to check the capacity requirements for
  /// the rules you want to use in a <a>RuleGroup</a> or <a>WebACL</a>.
  ///
  /// AWS WAF uses WCUs to calculate and control the operating resources that
  /// are used to run your rules, rule groups, and web ACLs. AWS WAF calculates
  /// capacity differently for each rule type, to reflect the relative cost of
  /// each rule. Simple rules that cost little to run use fewer WCUs than more
  /// complex rules that use more processing power. Rule group capacity is fixed
  /// at creation, which helps users plan their web ACL WCU usage when they use
  /// a rule group. The WCU limit for web ACLs is 1,500.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFInvalidResourceException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFSubscriptionNotFoundException].
  ///
  /// Parameter [rules] :
  /// An array of <a>Rule</a> that you're configuring to use in a rule group or
  /// web ACL.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
    @_s.required List<Rule> rules,
    @_s.required Scope scope,
  }) async {
    ArgumentError.checkNotNull(rules, 'rules');
    ArgumentError.checkNotNull(scope, 'scope');
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
        'Scope': scope?.toValue() ?? '',
      },
    );

    return CheckCapacityResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Creates an <a>IPSet</a>, which you use to identify web requests that
  /// originate from specific IP addresses or ranges of IP addresses. For
  /// example, if you're receiving a lot of requests from a ranges of IP
  /// addresses, you can configure AWS WAF to block them using an IPSet that
  /// lists those IP addresses.
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
  /// Contains an array of strings that specify one or more IP addresses or
  /// blocks of IP addresses in Classless Inter-Domain Routing (CIDR) notation.
  /// AWS WAF supports all address ranges for IP versions IPv4 and IPv6.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from the IP address 192.0.2.44, specify <code>192.0.2.44/32</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from IP addresses from 192.0.2.0 to 192.0.2.255, specify
  /// <code>192.0.2.0/24</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from the IP address 1111:0000:0000:0000:0000:0000:0000:0111, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0111/128</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to
  /// 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0000/64</code>.
  /// </li>
  /// </ul>
  /// For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  ///
  /// Parameter [iPAddressVersion] :
  /// Specify IPV4 or IPV6.
  ///
  /// Parameter [name] :
  /// The name of the IP set. You cannot change the name of an
  /// <code>IPSet</code> after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// A description of the IP set that helps with identification. You cannot
  /// change the description of an IP set after you create it.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs to associate with the resource.
  Future<CreateIPSetResponse> createIPSet({
    @_s.required List<String> addresses,
    @_s.required IPAddressVersion iPAddressVersion,
    @_s.required String name,
    @_s.required Scope scope,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(addresses, 'addresses');
    ArgumentError.checkNotNull(iPAddressVersion, 'iPAddressVersion');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^[\w+=:#@/\-,\.][\w+=:#@/\-,\.\s]+[\w+=:#@/\-,\.]$''',
    );
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
        'IPAddressVersion': iPAddressVersion?.toValue() ?? '',
        'Name': name,
        'Scope': scope?.toValue() ?? '',
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateIPSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Creates a <a>RegexPatternSet</a>, which you reference in a
  /// <a>RegexPatternSetReferenceStatement</a>, to have AWS WAF inspect a web
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
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// A description of the set that helps with identification. You cannot change
  /// the description of a set after you create it.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs to associate with the resource.
  Future<CreateRegexPatternSetResponse> createRegexPatternSet({
    @_s.required String name,
    @_s.required List<Regex> regularExpressionList,
    @_s.required Scope scope,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(regularExpressionList, 'regularExpressionList');
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^[\w+=:#@/\-,\.][\w+=:#@/\-,\.\s]+[\w+=:#@/\-,\.]$''',
    );
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
        'Scope': scope?.toValue() ?? '',
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRegexPatternSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
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
  /// group, AWS WAF enforces this limit. You can check the capacity for a set
  /// of rules using <a>CheckCapacity</a>.
  ///
  /// AWS WAF uses WCUs to calculate and control the operating resources that
  /// are used to run your rules, rule groups, and web ACLs. AWS WAF calculates
  /// capacity differently for each rule type, to reflect the relative cost of
  /// each rule. Simple rules that cost little to run use fewer WCUs than more
  /// complex rules that use more processing power. Rule group capacity is fixed
  /// at creation, which helps users plan their web ACL WCU usage when they use
  /// a rule group. The WCU limit for web ACLs is 1,500.
  ///
  /// Parameter [name] :
  /// The name of the rule group. You cannot change the name of a rule group
  /// after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// Parameter [description] :
  /// A description of the rule group that helps with identification. You cannot
  /// change the description of a rule group after you create it.
  ///
  /// Parameter [rules] :
  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to allow, block, or count. Each rule includes one top-level statement that
  /// AWS WAF uses to identify matching web requests, and parameters that govern
  /// how AWS WAF handles them.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs to associate with the resource.
  Future<CreateRuleGroupResponse> createRuleGroup({
    @_s.required int capacity,
    @_s.required String name,
    @_s.required Scope scope,
    @_s.required VisibilityConfig visibilityConfig,
    String description,
    List<Rule> rules,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(capacity, 'capacity');
    _s.validateNumRange(
      'capacity',
      capacity,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    ArgumentError.checkNotNull(visibilityConfig, 'visibilityConfig');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^[\w+=:#@/\-,\.][\w+=:#@/\-,\.\s]+[\w+=:#@/\-,\.]$''',
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
        'Scope': scope?.toValue() ?? '',
        'VisibilityConfig': visibilityConfig,
        if (description != null) 'Description': description,
        if (rules != null) 'Rules': rules,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Creates a <a>WebACL</a> per the specifications provided.
  ///
  /// A Web ACL defines a collection of rules to use to inspect and control web
  /// requests. Each rule has an action defined (allow, block, or count) for
  /// requests that match the statement of the rule. In the Web ACL, you assign
  /// a default action to take (allow, block) for any request that does not
  /// match any of the rules. The rules in a Web ACL can be a combination of the
  /// types <a>Rule</a>, <a>RuleGroup</a>, and managed rule group. You can
  /// associate a Web ACL with one or more AWS resources to protect. The
  /// resources can be Amazon CloudFront, an Amazon API Gateway REST API, an
  /// Application Load Balancer, or an AWS AppSync GraphQL API.
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
  ///
  /// Parameter [defaultAction] :
  /// The action to perform if none of the <code>Rules</code> contained in the
  /// <code>WebACL</code> match.
  ///
  /// Parameter [name] :
  /// The name of the Web ACL. You cannot change the name of a Web ACL after you
  /// create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// Parameter [description] :
  /// A description of the Web ACL that helps with identification. You cannot
  /// change the description of a Web ACL after you create it.
  ///
  /// Parameter [rules] :
  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to allow, block, or count. Each rule includes one top-level statement that
  /// AWS WAF uses to identify matching web requests, and parameters that govern
  /// how AWS WAF handles them.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs to associate with the resource.
  Future<CreateWebACLResponse> createWebACL({
    @_s.required DefaultAction defaultAction,
    @_s.required String name,
    @_s.required Scope scope,
    @_s.required VisibilityConfig visibilityConfig,
    String description,
    List<Rule> rules,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(defaultAction, 'defaultAction');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    ArgumentError.checkNotNull(visibilityConfig, 'visibilityConfig');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^[\w+=:#@/\-,\.][\w+=:#@/\-,\.\s]+[\w+=:#@/\-,\.]$''',
    );
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
        'Scope': scope?.toValue() ?? '',
        'VisibilityConfig': visibilityConfig,
        if (description != null) 'Description': description,
        if (rules != null) 'Rules': rules,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateWebACLResponse.fromJson(jsonResponse.body);
  }

  /// Deletes all rule groups that are managed by AWS Firewall Manager for the
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
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  Future<DeleteFirewallManagerRuleGroupsResponse>
      deleteFirewallManagerRuleGroups({
    @_s.required String webACLArn,
    @_s.required String webACLLockToken,
  }) async {
    ArgumentError.checkNotNull(webACLArn, 'webACLArn');
    _s.validateStringLength(
      'webACLArn',
      webACLArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'webACLArn',
      webACLArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(webACLLockToken, 'webACLLockToken');
    _s.validateStringLength(
      'webACLLockToken',
      webACLLockToken,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'webACLLockToken',
      webACLLockToken,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
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

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
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
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the IP set. You cannot change the name of an
  /// <code>IPSet</code> after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
    @_s.required String id,
    @_s.required String lockToken,
    @_s.required String name,
    @_s.required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'lockToken',
      lockToken,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteIPSet'
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
        'Scope': scope?.toValue() ?? '',
      },
    );

    return DeleteIPSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
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
  Future<void> deleteLoggingConfiguration({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteLoggingConfiguration'
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

    return DeleteLoggingConfigurationResponse.fromJson(jsonResponse.body);
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeletePermissionPolicy'
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

    return DeletePermissionPolicyResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
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
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the set. You cannot change the name after you create the set.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
    @_s.required String id,
    @_s.required String lockToken,
    @_s.required String name,
    @_s.required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'lockToken',
      lockToken,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteRegexPatternSet'
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
        'Scope': scope?.toValue() ?? '',
      },
    );

    return DeleteRegexPatternSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
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
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the rule group. You cannot change the name of a rule group
  /// after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
    @_s.required String id,
    @_s.required String lockToken,
    @_s.required String name,
    @_s.required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'lockToken',
      lockToken,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteRuleGroup'
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
        'Scope': scope?.toValue() ?? '',
      },
    );

    return DeleteRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Deletes the specified <a>WebACL</a>.
  ///
  /// You can only use this if <code>ManagedByFirewallManager</code> is false in
  /// the specified <a>WebACL</a>.
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
  /// The unique identifier for the Web ACL. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the Web ACL. You cannot change the name of a Web ACL after you
  /// create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
    @_s.required String id,
    @_s.required String lockToken,
    @_s.required String name,
    @_s.required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'lockToken',
      lockToken,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DeleteWebACL'
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
        'Scope': scope?.toValue() ?? '',
      },
    );

    return DeleteWebACLResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Provides high-level information for a managed rule group, including
  /// descriptions of the rules.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidResourceException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [name] :
  /// The name of the managed rule group. You use this, along with the vendor
  /// name, to identify the rule group.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// rule group name, to identify the rule group.
  Future<DescribeManagedRuleGroupResponse> describeManagedRuleGroup({
    @_s.required String name,
    @_s.required Scope scope,
    @_s.required String vendorName,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    ArgumentError.checkNotNull(vendorName, 'vendorName');
    _s.validateStringLength(
      'vendorName',
      vendorName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'vendorName',
      vendorName,
      r'''.*\S.*''',
      isRequired: true,
    );
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
        'Scope': scope?.toValue() ?? '',
        'VendorName': vendorName,
      },
    );

    return DescribeManagedRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Disassociates a Web ACL from a regional application resource. A regional
  /// application can be an Application Load Balancer (ALB), an API Gateway REST
  /// API, or an AppSync GraphQL API.
  ///
  /// For AWS CloudFront, don't use this call. Instead, use your CloudFront
  /// distribution configuration. To disassociate a Web ACL, provide an empty
  /// web ACL ID in the CloudFront call <code>UpdateDistribution</code>. For
  /// information, see <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html">UpdateDistribution</a>.
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
  /// <code>arn:aws:elasticloadbalancing:<i>region</i>:<i>account-id</i>:loadbalancer/app/<i>load-balancer-name</i>/<i>load-balancer-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an API Gateway REST API:
  /// <code>arn:aws:apigateway:<i>region</i>::/restapis/<i>api-id</i>/stages/<i>stage-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an AppSync GraphQL API:
  /// <code>arn:aws:appsync:<i>region</i>:<i>account-id</i>:apis/<i>GraphQLApiId</i>
  /// </code>
  /// </li>
  /// </ul>
  Future<void> disassociateWebACL({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.DisassociateWebACL'
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

    return DisassociateWebACLResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
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
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
    @_s.required String id,
    @_s.required String name,
    @_s.required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
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
        'Scope': scope?.toValue() ?? '',
      },
    );

    return GetIPSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
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
  Future<GetLoggingConfigurationResponse> getLoggingConfiguration({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''.*\S.*''',
      isRequired: true,
    );
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
      },
    );

    return GetLoggingConfigurationResponse.fromJson(jsonResponse.body);
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''.*\S.*''',
      isRequired: true,
    );
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

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves the keys that are currently blocked by a rate-based rule. The
  /// maximum number of managed keys that can be blocked for a single rate-based
  /// rule is 10,000. If more than 10,000 addresses exceed the rate limit, those
  /// with the highest rates are blocked.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [ruleName] :
  /// The name of the rate-based rule to get the keys for.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// The unique identifier for the Web ACL. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [webACLName] :
  /// The name of the Web ACL. You cannot change the name of a Web ACL after you
  /// create it.
  Future<GetRateBasedStatementManagedKeysResponse>
      getRateBasedStatementManagedKeys({
    @_s.required String ruleName,
    @_s.required Scope scope,
    @_s.required String webACLId,
    @_s.required String webACLName,
  }) async {
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    _s.validateStringLength(
      'ruleName',
      ruleName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ruleName',
      ruleName,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    ArgumentError.checkNotNull(webACLId, 'webACLId');
    _s.validateStringLength(
      'webACLId',
      webACLId,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'webACLId',
      webACLId,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(webACLName, 'webACLName');
    _s.validateStringLength(
      'webACLName',
      webACLName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'webACLName',
      webACLName,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
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
        'Scope': scope?.toValue() ?? '',
        'WebACLId': webACLId,
        'WebACLName': webACLName,
      },
    );

    return GetRateBasedStatementManagedKeysResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
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
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
    @_s.required String id,
    @_s.required String name,
    @_s.required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
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
        'Scope': scope?.toValue() ?? '',
      },
    );

    return GetRegexPatternSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves the specified <a>RuleGroup</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
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
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
    @_s.required String id,
    @_s.required String name,
    @_s.required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
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
        'Id': id,
        'Name': name,
        'Scope': scope?.toValue() ?? '',
      },
    );

    return GetRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Gets detailed information about a specified number of requests--a
  /// sample--that AWS WAF randomly selects from among the first 5,000 requests
  /// that your AWS resource received during a time range that you choose. You
  /// can specify a sample size of up to 500 requests, and you can specify any
  /// time range in the previous three hours.
  ///
  /// <code>GetSampledRequests</code> returns a time range, which is usually the
  /// time range that you specified. However, if your resource (such as a
  /// CloudFront distribution) received 5,000 requests before the specified time
  /// range elapsed, <code>GetSampledRequests</code> returns an updated time
  /// range. This new time range indicates the actual period during which AWS
  /// WAF selected the requests in the sample.
  ///
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [maxItems] :
  /// The number of requests that you want AWS WAF to return from among the
  /// first 5,000 requests that your AWS resource received during the time
  /// range. If your resource received fewer requests than the value of
  /// <code>MaxItems</code>, <code>GetSampledRequests</code> returns information
  /// about all of them.
  ///
  /// Parameter [ruleMetricName] :
  /// The metric name assigned to the <code>Rule</code> or
  /// <code>RuleGroup</code> for which you want a sample of requests.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// previous three hours.
  ///
  /// Parameter [webAclArn] :
  /// The Amazon resource name (ARN) of the <code>WebACL</code> for which you
  /// want a sample of requests.
  Future<GetSampledRequestsResponse> getSampledRequests({
    @_s.required int maxItems,
    @_s.required String ruleMetricName,
    @_s.required Scope scope,
    @_s.required TimeWindow timeWindow,
    @_s.required String webAclArn,
  }) async {
    ArgumentError.checkNotNull(maxItems, 'maxItems');
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(ruleMetricName, 'ruleMetricName');
    _s.validateStringLength(
      'ruleMetricName',
      ruleMetricName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ruleMetricName',
      ruleMetricName,
      r'''^[\w#:\.\-/]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    ArgumentError.checkNotNull(timeWindow, 'timeWindow');
    ArgumentError.checkNotNull(webAclArn, 'webAclArn');
    _s.validateStringLength(
      'webAclArn',
      webAclArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'webAclArn',
      webAclArn,
      r'''.*\S.*''',
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
        'Scope': scope?.toValue() ?? '',
        'TimeWindow': timeWindow,
        'WebAclArn': webAclArn,
      },
    );

    return GetSampledRequestsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves the specified <a>WebACL</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Web ACL. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [name] :
  /// The name of the Web ACL. You cannot change the name of a Web ACL after you
  /// create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
    @_s.required String id,
    @_s.required String name,
    @_s.required Scope scope,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
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
        'Scope': scope?.toValue() ?? '',
      },
    );

    return GetWebACLResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves the <a>WebACL</a> for the specified resource.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFUnavailableEntityException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN (Amazon Resource Name) of the resource.
  Future<GetWebACLForResourceResponse> getWebACLForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''.*\S.*''',
      isRequired: true,
    );
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

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves an array of managed rule groups that are available for you to
  /// use. This list includes all AWS Managed Rules rule groups and the AWS
  /// Marketplace managed rule groups that you're subscribed to.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// The maximum number of objects that you want AWS WAF to return for this
  /// request. If more objects are available, in the response, AWS WAF provides
  /// a <code>NextMarker</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, AWS WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListAvailableManagedRuleGroupsResponse>
      listAvailableManagedRuleGroups({
    @_s.required Scope scope,
    int limit,
    String nextMarker,
  }) async {
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextMarker',
      nextMarker,
      1,
      256,
    );
    _s.validateStringPattern(
      'nextMarker',
      nextMarker,
      r'''.*\S.*''',
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
        'Scope': scope?.toValue() ?? '',
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListAvailableManagedRuleGroupsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves an array of <a>IPSetSummary</a> objects for the IP sets that you
  /// manage.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// The maximum number of objects that you want AWS WAF to return for this
  /// request. If more objects are available, in the response, AWS WAF provides
  /// a <code>NextMarker</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, AWS WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListIPSetsResponse> listIPSets({
    @_s.required Scope scope,
    int limit,
    String nextMarker,
  }) async {
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextMarker',
      nextMarker,
      1,
      256,
    );
    _s.validateStringPattern(
      'nextMarker',
      nextMarker,
      r'''.*\S.*''',
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
        'Scope': scope?.toValue() ?? '',
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListIPSetsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves an array of your <a>LoggingConfiguration</a> objects.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [limit] :
  /// The maximum number of objects that you want AWS WAF to return for this
  /// request. If more objects are available, in the response, AWS WAF provides
  /// a <code>NextMarker</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, AWS WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  Future<ListLoggingConfigurationsResponse> listLoggingConfigurations({
    int limit,
    String nextMarker,
    Scope scope,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextMarker',
      nextMarker,
      1,
      256,
    );
    _s.validateStringPattern(
      'nextMarker',
      nextMarker,
      r'''.*\S.*''',
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
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
        if (scope != null) 'Scope': scope.toValue(),
      },
    );

    return ListLoggingConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves an array of <a>RegexPatternSetSummary</a> objects for the regex
  /// pattern sets that you manage.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// The maximum number of objects that you want AWS WAF to return for this
  /// request. If more objects are available, in the response, AWS WAF provides
  /// a <code>NextMarker</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, AWS WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListRegexPatternSetsResponse> listRegexPatternSets({
    @_s.required Scope scope,
    int limit,
    String nextMarker,
  }) async {
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextMarker',
      nextMarker,
      1,
      256,
    );
    _s.validateStringPattern(
      'nextMarker',
      nextMarker,
      r'''.*\S.*''',
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
        'Scope': scope?.toValue() ?? '',
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListRegexPatternSetsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves an array of the Amazon Resource Names (ARNs) for the regional
  /// resources that are associated with the specified web ACL. If you want the
  /// list of AWS CloudFront resources, use the AWS CloudFront call
  /// <code>ListDistributionsByWebACLId</code>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [webACLArn] :
  /// The Amazon Resource Name (ARN) of the Web ACL.
  ///
  /// Parameter [resourceType] :
  /// Used for web ACLs that are scoped for regional applications. A regional
  /// application can be an Application Load Balancer (ALB), an API Gateway REST
  /// API, or an AppSync GraphQL API.
  Future<ListResourcesForWebACLResponse> listResourcesForWebACL({
    @_s.required String webACLArn,
    ResourceType resourceType,
  }) async {
    ArgumentError.checkNotNull(webACLArn, 'webACLArn');
    _s.validateStringLength(
      'webACLArn',
      webACLArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'webACLArn',
      webACLArn,
      r'''.*\S.*''',
      isRequired: true,
    );
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

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves an array of <a>RuleGroupSummary</a> objects for the rule groups
  /// that you manage.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// The maximum number of objects that you want AWS WAF to return for this
  /// request. If more objects are available, in the response, AWS WAF provides
  /// a <code>NextMarker</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, AWS WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListRuleGroupsResponse> listRuleGroups({
    @_s.required Scope scope,
    int limit,
    String nextMarker,
  }) async {
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextMarker',
      nextMarker,
      1,
      256,
    );
    _s.validateStringPattern(
      'nextMarker',
      nextMarker,
      r'''.*\S.*''',
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
        'Scope': scope?.toValue() ?? '',
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListRuleGroupsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves the <a>TagInfoForResource</a> for the specified resource. Tags
  /// are key:value pairs that you can use to categorize and manage your
  /// resources, for purposes like billing. For example, you might set the tag
  /// key to "customer" and the value to the customer name or ID. You can
  /// specify one or more tags to add to each AWS resource, up to 50 tags for a
  /// resource.
  ///
  /// You can tag the AWS resources that you manage through AWS WAF: web ACLs,
  /// rule groups, IP sets, and regex pattern sets. You can't manage or view
  /// tags through the AWS WAF console.
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
  /// The maximum number of objects that you want AWS WAF to return for this
  /// request. If more objects are available, in the response, AWS WAF provides
  /// a <code>NextMarker</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, AWS WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceARN,
    int limit,
    String nextMarker,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextMarker',
      nextMarker,
      1,
      256,
    );
    _s.validateStringPattern(
      'nextMarker',
      nextMarker,
      r'''.*\S.*''',
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

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Retrieves an array of <a>WebACLSummary</a> objects for the web ACLs that
  /// you manage.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// The maximum number of objects that you want AWS WAF to return for this
  /// request. If more objects are available, in the response, AWS WAF provides
  /// a <code>NextMarker</code> value that you can use in a subsequent call to
  /// get the next batch of objects.
  ///
  /// Parameter [nextMarker] :
  /// When you request a list of objects with a <code>Limit</code> setting, if
  /// the number of objects that are still available for retrieval exceeds the
  /// limit, AWS WAF returns a <code>NextMarker</code> value in the response. To
  /// retrieve the next batch of objects, provide the marker from the prior call
  /// in your next request.
  Future<ListWebACLsResponse> listWebACLs({
    @_s.required Scope scope,
    int limit,
    String nextMarker,
  }) async {
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextMarker',
      nextMarker,
      1,
      256,
    );
    _s.validateStringPattern(
      'nextMarker',
      nextMarker,
      r'''.*\S.*''',
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
        'Scope': scope?.toValue() ?? '',
        if (limit != null) 'Limit': limit,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return ListWebACLsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Enables the specified <a>LoggingConfiguration</a>, to start logging from a
  /// web ACL, according to the configuration provided.
  ///
  /// You can access information about all traffic that AWS WAF inspects using
  /// the following steps:
  /// <ol>
  /// <li>
  /// Create an Amazon Kinesis Data Firehose.
  ///
  /// Create the data firehose with a PUT source and in the Region that you are
  /// operating. If you are capturing logs for Amazon CloudFront, always create
  /// the firehose in US East (N. Virginia).
  ///
  /// Give the data firehose a name that starts with the prefix
  /// <code>aws-waf-logs-</code>. For example,
  /// <code>aws-waf-logs-us-east-2-analytics</code>.
  /// <note>
  /// Do not create the data firehose using a <code>Kinesis stream</code> as
  /// your source.
  /// </note> </li>
  /// <li>
  /// Associate that firehose to your web ACL using a
  /// <code>PutLoggingConfiguration</code> request.
  /// </li> </ol>
  /// When you successfully enable logging using a
  /// <code>PutLoggingConfiguration</code> request, AWS WAF will create a
  /// service linked role with the necessary permissions to write logs to the
  /// Amazon Kinesis Data Firehose. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/logging.html">Logging
  /// Web ACL Traffic Information</a> in the <i>AWS WAF Developer Guide</i>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFOptimisticLockException].
  /// May throw [WAFServiceLinkedRoleErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [loggingConfiguration] :
  /// <p/>
  Future<PutLoggingConfigurationResponse> putLoggingConfiguration({
    @_s.required LoggingConfiguration loggingConfiguration,
  }) async {
    ArgumentError.checkNotNull(loggingConfiguration, 'loggingConfiguration');
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
  /// rule group must exist in the same region.
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
  /// The policy must be composed using IAM Policy version 2012-10-17 or version
  /// 2015-01-01.
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
  /// <code>wafv2:PutFirewallManagerRuleGroups</code>. AWS WAF rejects any extra
  /// actions or wildcard actions in the policy.
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
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.PutPermissionPolicy'
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

    return PutPermissionPolicyResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Associates tags with the specified AWS resource. Tags are key:value pairs
  /// that you can use to categorize and manage your resources, for purposes
  /// like billing. For example, you might set the tag key to "customer" and the
  /// value to the customer name or ID. You can specify one or more tags to add
  /// to each AWS resource, up to 50 tags for a resource.
  ///
  /// You can tag the AWS resources that you manage through AWS WAF: web ACLs,
  /// rule groups, IP sets, and regex pattern sets. You can't manage or view
  /// tags through the AWS WAF console.
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
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.TagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Disassociates tags from an AWS resource. Tags are key:value pairs that you
  /// can associate with AWS resources. For example, the tag key might be
  /// "customer" and the tag value might be "companyA." You can specify one or
  /// more tags to add to each container. You can add up to 50 tags to each AWS
  /// resource.
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
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20190729.UntagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Updates the specified <a>IPSet</a>.
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
  /// Contains an array of strings that specify one or more IP addresses or
  /// blocks of IP addresses in Classless Inter-Domain Routing (CIDR) notation.
  /// AWS WAF supports all address ranges for IP versions IPv4 and IPv6.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from the IP address 192.0.2.44, specify <code>192.0.2.44/32</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from IP addresses from 192.0.2.0 to 192.0.2.255, specify
  /// <code>192.0.2.0/24</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from the IP address 1111:0000:0000:0000:0000:0000:0000:0111, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0111/128</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated
  /// from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to
  /// 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0000/64</code>.
  /// </li>
  /// </ul>
  /// For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  ///
  /// Parameter [id] :
  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the IP set. You cannot change the name of an
  /// <code>IPSet</code> after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// A description of the IP set that helps with identification. You cannot
  /// change the description of an IP set after you create it.
  Future<UpdateIPSetResponse> updateIPSet({
    @_s.required List<String> addresses,
    @_s.required String id,
    @_s.required String lockToken,
    @_s.required String name,
    @_s.required Scope scope,
    String description,
  }) async {
    ArgumentError.checkNotNull(addresses, 'addresses');
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'lockToken',
      lockToken,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^[\w+=:#@/\-,\.][\w+=:#@/\-,\.\s]+[\w+=:#@/\-,\.]$''',
    );
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
        'Scope': scope?.toValue() ?? '',
        if (description != null) 'Description': description,
      },
    );

    return UpdateIPSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Updates the specified <a>RegexPatternSet</a>.
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
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the set. You cannot change the name after you create the set.
  ///
  /// Parameter [regularExpressionList] :
  /// <p/>
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// A description of the set that helps with identification. You cannot change
  /// the description of a set after you create it.
  Future<UpdateRegexPatternSetResponse> updateRegexPatternSet({
    @_s.required String id,
    @_s.required String lockToken,
    @_s.required String name,
    @_s.required List<Regex> regularExpressionList,
    @_s.required Scope scope,
    String description,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'lockToken',
      lockToken,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(regularExpressionList, 'regularExpressionList');
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^[\w+=:#@/\-,\.][\w+=:#@/\-,\.\s]+[\w+=:#@/\-,\.]$''',
    );
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
        'Scope': scope?.toValue() ?? '',
        if (description != null) 'Description': description,
      },
    );

    return UpdateRegexPatternSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Updates the specified <a>RuleGroup</a>.
  ///
  /// A rule group defines a collection of rules to inspect and control web
  /// requests that you can use in a <a>WebACL</a>. When you create a rule
  /// group, you define an immutable capacity limit. If you update a rule group,
  /// you must stay within the capacity. This allows others to reuse the rule
  /// group with confidence in its capacity requirements.
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
  ///
  /// Parameter [id] :
  /// A unique identifier for the rule group. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the rule group. You cannot change the name of a rule group
  /// after you create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// Parameter [description] :
  /// A description of the rule group that helps with identification. You cannot
  /// change the description of a rule group after you create it.
  ///
  /// Parameter [rules] :
  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to allow, block, or count. Each rule includes one top-level statement that
  /// AWS WAF uses to identify matching web requests, and parameters that govern
  /// how AWS WAF handles them.
  Future<UpdateRuleGroupResponse> updateRuleGroup({
    @_s.required String id,
    @_s.required String lockToken,
    @_s.required String name,
    @_s.required Scope scope,
    @_s.required VisibilityConfig visibilityConfig,
    String description,
    List<Rule> rules,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'lockToken',
      lockToken,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    ArgumentError.checkNotNull(visibilityConfig, 'visibilityConfig');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^[\w+=:#@/\-,\.][\w+=:#@/\-,\.\s]+[\w+=:#@/\-,\.]$''',
    );
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
        'Scope': scope?.toValue() ?? '',
        'VisibilityConfig': visibilityConfig,
        if (description != null) 'Description': description,
        if (rules != null) 'Rules': rules,
      },
    );

    return UpdateRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
  /// November, 2019. For information, including how to migrate your AWS WAF
  /// resources from the prior release, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  /// </note>
  /// Updates the specified <a>WebACL</a>.
  ///
  /// A Web ACL defines a collection of rules to use to inspect and control web
  /// requests. Each rule has an action defined (allow, block, or count) for
  /// requests that match the statement of the rule. In the Web ACL, you assign
  /// a default action to take (allow, block) for any request that does not
  /// match any of the rules. The rules in a Web ACL can be a combination of the
  /// types <a>Rule</a>, <a>RuleGroup</a>, and managed rule group. You can
  /// associate a Web ACL with one or more AWS resources to protect. The
  /// resources can be Amazon CloudFront, an Amazon API Gateway REST API, an
  /// Application Load Balancer, or an AWS AppSync GraphQL API.
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
  ///
  /// Parameter [defaultAction] :
  /// The action to perform if none of the <code>Rules</code> contained in the
  /// <code>WebACL</code> match.
  ///
  /// Parameter [id] :
  /// The unique identifier for the Web ACL. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  ///
  /// Parameter [lockToken] :
  /// A token used for optimistic locking. AWS WAF returns a token to your get
  /// and list requests, to mark the state of the entity at the time of the
  /// request. To make changes to the entity associated with the token, you
  /// provide the token to operations like update and delete. AWS WAF uses the
  /// token to ensure that no changes have been made to the entity since you
  /// last retrieved it. If a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  ///
  /// Parameter [name] :
  /// The name of the Web ACL. You cannot change the name of a Web ACL after you
  /// create it.
  ///
  /// Parameter [scope] :
  /// Specifies whether this is for an AWS CloudFront distribution or for a
  /// regional application. A regional application can be an Application Load
  /// Balancer (ALB), an API Gateway REST API, or an AppSync GraphQL API.
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
  /// Parameter [description] :
  /// A description of the Web ACL that helps with identification. You cannot
  /// change the description of a Web ACL after you create it.
  ///
  /// Parameter [rules] :
  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to allow, block, or count. Each rule includes one top-level statement that
  /// AWS WAF uses to identify matching web requests, and parameters that govern
  /// how AWS WAF handles them.
  Future<UpdateWebACLResponse> updateWebACL({
    @_s.required DefaultAction defaultAction,
    @_s.required String id,
    @_s.required String lockToken,
    @_s.required String name,
    @_s.required Scope scope,
    @_s.required VisibilityConfig visibilityConfig,
    String description,
    List<Rule> rules,
  }) async {
    ArgumentError.checkNotNull(defaultAction, 'defaultAction');
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(lockToken, 'lockToken');
    _s.validateStringLength(
      'lockToken',
      lockToken,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'lockToken',
      lockToken,
      r'''^[0-9a-f]{8}-(?:[0-9a-f]{4}-){3}[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    ArgumentError.checkNotNull(visibilityConfig, 'visibilityConfig');
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^[\w+=:#@/\-,\.][\w+=:#@/\-,\.\s]+[\w+=:#@/\-,\.]$''',
    );
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
        'Scope': scope?.toValue() ?? '',
        'VisibilityConfig': visibilityConfig,
        if (description != null) 'Description': description,
        if (rules != null) 'Rules': rules,
      },
    );

    return UpdateWebACLResponse.fromJson(jsonResponse.body);
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// All query arguments of a web request.
///
/// This is used only to indicate the web request component for AWS WAF to
/// inspect, in the <a>FieldToMatch</a> specification.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AllQueryArguments {
  AllQueryArguments();
  factory AllQueryArguments.fromJson(Map<String, dynamic> json) =>
      _$AllQueryArgumentsFromJson(json);

  Map<String, dynamic> toJson() => _$AllQueryArgumentsToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Specifies that AWS WAF should allow requests.
///
/// This is used only in the context of other settings, for example to specify
/// values for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AllowAction {
  AllowAction();
  factory AllowAction.fromJson(Map<String, dynamic> json) =>
      _$AllowActionFromJson(json);

  Map<String, dynamic> toJson() => _$AllowActionToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A logical rule statement used to combine other rule statements with AND
/// logic. You provide more than one <a>Statement</a> within the
/// <code>AndStatement</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AndStatement {
  /// The statements to combine with AND logic. You can use any statements that
  /// can be nested.
  @_s.JsonKey(name: 'Statements')
  final List<Statement> statements;

  AndStatement({
    @_s.required this.statements,
  });
  factory AndStatement.fromJson(Map<String, dynamic> json) =>
      _$AndStatementFromJson(json);

  Map<String, dynamic> toJson() => _$AndStatementToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateWebACLResponse {
  AssociateWebACLResponse();
  factory AssociateWebACLResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateWebACLResponseFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Specifies that AWS WAF should block requests.
///
/// This is used only in the context of other settings, for example to specify
/// values for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BlockAction {
  BlockAction();
  factory BlockAction.fromJson(Map<String, dynamic> json) =>
      _$BlockActionFromJson(json);

  Map<String, dynamic> toJson() => _$BlockActionToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The body of a web request. This immediately follows the request headers.
///
/// This is used only to indicate the web request component for AWS WAF to
/// inspect, in the <a>FieldToMatch</a> specification.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Body {
  Body();
  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);

  Map<String, dynamic> toJson() => _$BodyToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule statement that defines a string match search for AWS WAF to apply to
/// web requests. The byte match statement provides the bytes to search for, the
/// location in requests that you want AWS WAF to search, and other settings.
/// The bytes to search for are typically a string that corresponds with ASCII
/// characters. In the AWS WAF console and the developer guide, this is refered
/// to as a string match statement.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ByteMatchStatement {
  /// The part of a web request that you want AWS WAF to inspect. For more
  /// information, see <a>FieldToMatch</a>.
  @_s.JsonKey(name: 'FieldToMatch')
  final FieldToMatch fieldToMatch;

  /// The area within the portion of a web request that you want AWS WAF to search
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
  @_s.JsonKey(name: 'PositionalConstraint')
  final PositionalConstraint positionalConstraint;

  /// A string value that you want AWS WAF to search for. AWS WAF searches only in
  /// the part of web requests that you designate for inspection in
  /// <a>FieldToMatch</a>. The maximum length of the value is 50 bytes.
  ///
  /// Valid values depend on the component that you specify for inspection in
  /// <code>FieldToMatch</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>Method</code>: The HTTP method that you want AWS WAF to search for.
  /// This indicates the type of operation specified in the request.
  /// </li>
  /// <li>
  /// <code>UriPath</code>: The value that you want AWS WAF to search for in the
  /// URI path, for example, <code>/images/daily-ad.jpg</code>.
  /// </li>
  /// </ul>
  /// If <code>SearchString</code> includes alphabetic characters A-Z and a-z,
  /// note that the value is case sensitive.
  ///
  /// <b>If you're using the AWS WAF API</b>
  ///
  /// Specify a base64-encoded version of the value. The maximum length of the
  /// value before you base64-encode it is 50 bytes.
  ///
  /// For example, suppose the value of <code>Type</code> is <code>HEADER</code>
  /// and the value of <code>Data</code> is <code>User-Agent</code>. If you want
  /// to search the <code>User-Agent</code> header for the value
  /// <code>BadBot</code>, you base64-encode <code>BadBot</code> using MIME
  /// base64-encoding and include the resulting value, <code>QmFkQm90</code>, in
  /// the value of <code>SearchString</code>.
  ///
  /// <b>If you're using the AWS CLI or one of the AWS SDKs</b>
  ///
  /// The value that you want AWS WAF to search for. The SDK automatically base64
  /// encodes the value.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'SearchString')
  final Uint8List searchString;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. If you specify one or
  /// more transformations in a rule statement, AWS WAF performs all
  /// transformations on the content of the request component identified by
  /// <code>FieldToMatch</code>, starting from the lowest priority setting, before
  /// inspecting the content for a match.
  @_s.JsonKey(name: 'TextTransformations')
  final List<TextTransformation> textTransformations;

  ByteMatchStatement({
    @_s.required this.fieldToMatch,
    @_s.required this.positionalConstraint,
    @_s.required this.searchString,
    @_s.required this.textTransformations,
  });
  factory ByteMatchStatement.fromJson(Map<String, dynamic> json) =>
      _$ByteMatchStatementFromJson(json);

  Map<String, dynamic> toJson() => _$ByteMatchStatementToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CheckCapacityResponse {
  /// The capacity required by the rules and scope.
  @_s.JsonKey(name: 'Capacity')
  final int capacity;

  CheckCapacityResponse({
    this.capacity,
  });
  factory CheckCapacityResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckCapacityResponseFromJson(json);
}

enum ComparisonOperator {
  @_s.JsonValue('EQ')
  eq,
  @_s.JsonValue('NE')
  ne,
  @_s.JsonValue('LE')
  le,
  @_s.JsonValue('LT')
  lt,
  @_s.JsonValue('GE')
  ge,
  @_s.JsonValue('GT')
  gt,
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Specifies that AWS WAF should count requests.
///
/// This is used only in the context of other settings, for example to specify
/// values for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CountAction {
  CountAction();
  factory CountAction.fromJson(Map<String, dynamic> json) =>
      _$CountActionFromJson(json);

  Map<String, dynamic> toJson() => _$CountActionToJson(this);
}

enum CountryCode {
  @_s.JsonValue('AF')
  af,
  @_s.JsonValue('AX')
  ax,
  @_s.JsonValue('AL')
  al,
  @_s.JsonValue('DZ')
  dz,
  @_s.JsonValue('AS')
  as,
  @_s.JsonValue('AD')
  ad,
  @_s.JsonValue('AO')
  ao,
  @_s.JsonValue('AI')
  ai,
  @_s.JsonValue('AQ')
  aq,
  @_s.JsonValue('AG')
  ag,
  @_s.JsonValue('AR')
  ar,
  @_s.JsonValue('AM')
  am,
  @_s.JsonValue('AW')
  aw,
  @_s.JsonValue('AU')
  au,
  @_s.JsonValue('AT')
  at,
  @_s.JsonValue('AZ')
  az,
  @_s.JsonValue('BS')
  bs,
  @_s.JsonValue('BH')
  bh,
  @_s.JsonValue('BD')
  bd,
  @_s.JsonValue('BB')
  bb,
  @_s.JsonValue('BY')
  by,
  @_s.JsonValue('BE')
  be,
  @_s.JsonValue('BZ')
  bz,
  @_s.JsonValue('BJ')
  bj,
  @_s.JsonValue('BM')
  bm,
  @_s.JsonValue('BT')
  bt,
  @_s.JsonValue('BO')
  bo,
  @_s.JsonValue('BQ')
  bq,
  @_s.JsonValue('BA')
  ba,
  @_s.JsonValue('BW')
  bw,
  @_s.JsonValue('BV')
  bv,
  @_s.JsonValue('BR')
  br,
  @_s.JsonValue('IO')
  io,
  @_s.JsonValue('BN')
  bn,
  @_s.JsonValue('BG')
  bg,
  @_s.JsonValue('BF')
  bf,
  @_s.JsonValue('BI')
  bi,
  @_s.JsonValue('KH')
  kh,
  @_s.JsonValue('CM')
  cm,
  @_s.JsonValue('CA')
  ca,
  @_s.JsonValue('CV')
  cv,
  @_s.JsonValue('KY')
  ky,
  @_s.JsonValue('CF')
  cf,
  @_s.JsonValue('TD')
  td,
  @_s.JsonValue('CL')
  cl,
  @_s.JsonValue('CN')
  cn,
  @_s.JsonValue('CX')
  cx,
  @_s.JsonValue('CC')
  cc,
  @_s.JsonValue('CO')
  co,
  @_s.JsonValue('KM')
  km,
  @_s.JsonValue('CG')
  cg,
  @_s.JsonValue('CD')
  cd,
  @_s.JsonValue('CK')
  ck,
  @_s.JsonValue('CR')
  cr,
  @_s.JsonValue('CI')
  ci,
  @_s.JsonValue('HR')
  hr,
  @_s.JsonValue('CU')
  cu,
  @_s.JsonValue('CW')
  cw,
  @_s.JsonValue('CY')
  cy,
  @_s.JsonValue('CZ')
  cz,
  @_s.JsonValue('DK')
  dk,
  @_s.JsonValue('DJ')
  dj,
  @_s.JsonValue('DM')
  dm,
  @_s.JsonValue('DO')
  $do,
  @_s.JsonValue('EC')
  ec,
  @_s.JsonValue('EG')
  eg,
  @_s.JsonValue('SV')
  sv,
  @_s.JsonValue('GQ')
  gq,
  @_s.JsonValue('ER')
  er,
  @_s.JsonValue('EE')
  ee,
  @_s.JsonValue('ET')
  et,
  @_s.JsonValue('FK')
  fk,
  @_s.JsonValue('FO')
  fo,
  @_s.JsonValue('FJ')
  fj,
  @_s.JsonValue('FI')
  fi,
  @_s.JsonValue('FR')
  fr,
  @_s.JsonValue('GF')
  gf,
  @_s.JsonValue('PF')
  pf,
  @_s.JsonValue('TF')
  tf,
  @_s.JsonValue('GA')
  ga,
  @_s.JsonValue('GM')
  gm,
  @_s.JsonValue('GE')
  ge,
  @_s.JsonValue('DE')
  de,
  @_s.JsonValue('GH')
  gh,
  @_s.JsonValue('GI')
  gi,
  @_s.JsonValue('GR')
  gr,
  @_s.JsonValue('GL')
  gl,
  @_s.JsonValue('GD')
  gd,
  @_s.JsonValue('GP')
  gp,
  @_s.JsonValue('GU')
  gu,
  @_s.JsonValue('GT')
  gt,
  @_s.JsonValue('GG')
  gg,
  @_s.JsonValue('GN')
  gn,
  @_s.JsonValue('GW')
  gw,
  @_s.JsonValue('GY')
  gy,
  @_s.JsonValue('HT')
  ht,
  @_s.JsonValue('HM')
  hm,
  @_s.JsonValue('VA')
  va,
  @_s.JsonValue('HN')
  hn,
  @_s.JsonValue('HK')
  hk,
  @_s.JsonValue('HU')
  hu,
  @_s.JsonValue('IS')
  $is,
  @_s.JsonValue('IN')
  $in,
  @_s.JsonValue('ID')
  id,
  @_s.JsonValue('IR')
  ir,
  @_s.JsonValue('IQ')
  iq,
  @_s.JsonValue('IE')
  ie,
  @_s.JsonValue('IM')
  im,
  @_s.JsonValue('IL')
  il,
  @_s.JsonValue('IT')
  it,
  @_s.JsonValue('JM')
  jm,
  @_s.JsonValue('JP')
  jp,
  @_s.JsonValue('JE')
  je,
  @_s.JsonValue('JO')
  jo,
  @_s.JsonValue('KZ')
  kz,
  @_s.JsonValue('KE')
  ke,
  @_s.JsonValue('KI')
  ki,
  @_s.JsonValue('KP')
  kp,
  @_s.JsonValue('KR')
  kr,
  @_s.JsonValue('KW')
  kw,
  @_s.JsonValue('KG')
  kg,
  @_s.JsonValue('LA')
  la,
  @_s.JsonValue('LV')
  lv,
  @_s.JsonValue('LB')
  lb,
  @_s.JsonValue('LS')
  ls,
  @_s.JsonValue('LR')
  lr,
  @_s.JsonValue('LY')
  ly,
  @_s.JsonValue('LI')
  li,
  @_s.JsonValue('LT')
  lt,
  @_s.JsonValue('LU')
  lu,
  @_s.JsonValue('MO')
  mo,
  @_s.JsonValue('MK')
  mk,
  @_s.JsonValue('MG')
  mg,
  @_s.JsonValue('MW')
  mw,
  @_s.JsonValue('MY')
  my,
  @_s.JsonValue('MV')
  mv,
  @_s.JsonValue('ML')
  ml,
  @_s.JsonValue('MT')
  mt,
  @_s.JsonValue('MH')
  mh,
  @_s.JsonValue('MQ')
  mq,
  @_s.JsonValue('MR')
  mr,
  @_s.JsonValue('MU')
  mu,
  @_s.JsonValue('YT')
  yt,
  @_s.JsonValue('MX')
  mx,
  @_s.JsonValue('FM')
  fm,
  @_s.JsonValue('MD')
  md,
  @_s.JsonValue('MC')
  mc,
  @_s.JsonValue('MN')
  mn,
  @_s.JsonValue('ME')
  me,
  @_s.JsonValue('MS')
  ms,
  @_s.JsonValue('MA')
  ma,
  @_s.JsonValue('MZ')
  mz,
  @_s.JsonValue('MM')
  mm,
  @_s.JsonValue('NA')
  na,
  @_s.JsonValue('NR')
  nr,
  @_s.JsonValue('NP')
  np,
  @_s.JsonValue('NL')
  nl,
  @_s.JsonValue('NC')
  nc,
  @_s.JsonValue('NZ')
  nz,
  @_s.JsonValue('NI')
  ni,
  @_s.JsonValue('NE')
  ne,
  @_s.JsonValue('NG')
  ng,
  @_s.JsonValue('NU')
  nu,
  @_s.JsonValue('NF')
  nf,
  @_s.JsonValue('MP')
  mp,
  @_s.JsonValue('NO')
  no,
  @_s.JsonValue('OM')
  om,
  @_s.JsonValue('PK')
  pk,
  @_s.JsonValue('PW')
  pw,
  @_s.JsonValue('PS')
  ps,
  @_s.JsonValue('PA')
  pa,
  @_s.JsonValue('PG')
  pg,
  @_s.JsonValue('PY')
  py,
  @_s.JsonValue('PE')
  pe,
  @_s.JsonValue('PH')
  ph,
  @_s.JsonValue('PN')
  pn,
  @_s.JsonValue('PL')
  pl,
  @_s.JsonValue('PT')
  pt,
  @_s.JsonValue('PR')
  pr,
  @_s.JsonValue('QA')
  qa,
  @_s.JsonValue('RE')
  re,
  @_s.JsonValue('RO')
  ro,
  @_s.JsonValue('RU')
  ru,
  @_s.JsonValue('RW')
  rw,
  @_s.JsonValue('BL')
  bl,
  @_s.JsonValue('SH')
  sh,
  @_s.JsonValue('KN')
  kn,
  @_s.JsonValue('LC')
  lc,
  @_s.JsonValue('MF')
  mf,
  @_s.JsonValue('PM')
  pm,
  @_s.JsonValue('VC')
  vc,
  @_s.JsonValue('WS')
  ws,
  @_s.JsonValue('SM')
  sm,
  @_s.JsonValue('ST')
  st,
  @_s.JsonValue('SA')
  sa,
  @_s.JsonValue('SN')
  sn,
  @_s.JsonValue('RS')
  rs,
  @_s.JsonValue('SC')
  sc,
  @_s.JsonValue('SL')
  sl,
  @_s.JsonValue('SG')
  sg,
  @_s.JsonValue('SX')
  sx,
  @_s.JsonValue('SK')
  sk,
  @_s.JsonValue('SI')
  si,
  @_s.JsonValue('SB')
  sb,
  @_s.JsonValue('SO')
  so,
  @_s.JsonValue('ZA')
  za,
  @_s.JsonValue('GS')
  gs,
  @_s.JsonValue('SS')
  ss,
  @_s.JsonValue('ES')
  es,
  @_s.JsonValue('LK')
  lk,
  @_s.JsonValue('SD')
  sd,
  @_s.JsonValue('SR')
  sr,
  @_s.JsonValue('SJ')
  sj,
  @_s.JsonValue('SZ')
  sz,
  @_s.JsonValue('SE')
  se,
  @_s.JsonValue('CH')
  ch,
  @_s.JsonValue('SY')
  sy,
  @_s.JsonValue('TW')
  tw,
  @_s.JsonValue('TJ')
  tj,
  @_s.JsonValue('TZ')
  tz,
  @_s.JsonValue('TH')
  th,
  @_s.JsonValue('TL')
  tl,
  @_s.JsonValue('TG')
  tg,
  @_s.JsonValue('TK')
  tk,
  @_s.JsonValue('TO')
  to,
  @_s.JsonValue('TT')
  tt,
  @_s.JsonValue('TN')
  tn,
  @_s.JsonValue('TR')
  tr,
  @_s.JsonValue('TM')
  tm,
  @_s.JsonValue('TC')
  tc,
  @_s.JsonValue('TV')
  tv,
  @_s.JsonValue('UG')
  ug,
  @_s.JsonValue('UA')
  ua,
  @_s.JsonValue('AE')
  ae,
  @_s.JsonValue('GB')
  gb,
  @_s.JsonValue('US')
  us,
  @_s.JsonValue('UM')
  um,
  @_s.JsonValue('UY')
  uy,
  @_s.JsonValue('UZ')
  uz,
  @_s.JsonValue('VU')
  vu,
  @_s.JsonValue('VE')
  ve,
  @_s.JsonValue('VN')
  vn,
  @_s.JsonValue('VG')
  vg,
  @_s.JsonValue('VI')
  vi,
  @_s.JsonValue('WF')
  wf,
  @_s.JsonValue('EH')
  eh,
  @_s.JsonValue('YE')
  ye,
  @_s.JsonValue('ZM')
  zm,
  @_s.JsonValue('ZW')
  zw,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateIPSetResponse {
  /// High-level information about an <a>IPSet</a>, returned by operations like
  /// create and list. This provides information like the ID, that you can use to
  /// retrieve and manage an <code>IPSet</code>, and the ARN, that you provide to
  /// the <a>IPSetReferenceStatement</a> to use the address set in a <a>Rule</a>.
  @_s.JsonKey(name: 'Summary')
  final IPSetSummary summary;

  CreateIPSetResponse({
    this.summary,
  });
  factory CreateIPSetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateIPSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRegexPatternSetResponse {
  /// High-level information about a <a>RegexPatternSet</a>, returned by
  /// operations like create and list. This provides information like the ID, that
  /// you can use to retrieve and manage a <code>RegexPatternSet</code>, and the
  /// ARN, that you provide to the <a>RegexPatternSetReferenceStatement</a> to use
  /// the pattern set in a <a>Rule</a>.
  @_s.JsonKey(name: 'Summary')
  final RegexPatternSetSummary summary;

  CreateRegexPatternSetResponse({
    this.summary,
  });
  factory CreateRegexPatternSetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRegexPatternSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRuleGroupResponse {
  /// High-level information about a <a>RuleGroup</a>, returned by operations like
  /// create and list. This provides information like the ID, that you can use to
  /// retrieve and manage a <code>RuleGroup</code>, and the ARN, that you provide
  /// to the <a>RuleGroupReferenceStatement</a> to use the rule group in a
  /// <a>Rule</a>.
  @_s.JsonKey(name: 'Summary')
  final RuleGroupSummary summary;

  CreateRuleGroupResponse({
    this.summary,
  });
  factory CreateRuleGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRuleGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWebACLResponse {
  /// High-level information about a <a>WebACL</a>, returned by operations like
  /// create and list. This provides information like the ID, that you can use to
  /// retrieve and manage a <code>WebACL</code>, and the ARN, that you provide to
  /// operations like <a>AssociateWebACL</a>.
  @_s.JsonKey(name: 'Summary')
  final WebACLSummary summary;

  CreateWebACLResponse({
    this.summary,
  });
  factory CreateWebACLResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateWebACLResponseFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// In a <a>WebACL</a>, this is the action that you want AWS WAF to perform when
/// a web request doesn't match any of the rules in the <code>WebACL</code>. The
/// default action must be a terminating action, so count is not allowed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DefaultAction {
  /// Specifies that AWS WAF should allow requests by default.
  @_s.JsonKey(name: 'Allow')
  final AllowAction allow;

  /// Specifies that AWS WAF should block requests by default.
  @_s.JsonKey(name: 'Block')
  final BlockAction block;

  DefaultAction({
    this.allow,
    this.block,
  });
  factory DefaultAction.fromJson(Map<String, dynamic> json) =>
      _$DefaultActionFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultActionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFirewallManagerRuleGroupsResponse {
  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  @_s.JsonKey(name: 'NextWebACLLockToken')
  final String nextWebACLLockToken;

  DeleteFirewallManagerRuleGroupsResponse({
    this.nextWebACLLockToken,
  });
  factory DeleteFirewallManagerRuleGroupsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteFirewallManagerRuleGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteIPSetResponse {
  DeleteIPSetResponse();
  factory DeleteIPSetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteIPSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLoggingConfigurationResponse {
  DeleteLoggingConfigurationResponse();
  factory DeleteLoggingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteLoggingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePermissionPolicyResponse {
  DeletePermissionPolicyResponse();
  factory DeletePermissionPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePermissionPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRegexPatternSetResponse {
  DeleteRegexPatternSetResponse();
  factory DeleteRegexPatternSetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteRegexPatternSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRuleGroupResponse {
  DeleteRuleGroupResponse();
  factory DeleteRuleGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteRuleGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteWebACLResponse {
  DeleteWebACLResponse();
  factory DeleteWebACLResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteWebACLResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeManagedRuleGroupResponse {
  /// The web ACL capacity units (WCUs) required for this rule group. AWS WAF uses
  /// web ACL capacity units (WCU) to calculate and control the operating
  /// resources that are used to run your rules, rule groups, and web ACLs. AWS
  /// WAF calculates capacity differently for each rule type, to reflect each
  /// rule's relative cost. Rule group capacity is fixed at creation, so users can
  /// plan their web ACL WCU usage when they use a rule group. The WCU limit for
  /// web ACLs is 1,500.
  @_s.JsonKey(name: 'Capacity')
  final int capacity;

  /// <p/>
  @_s.JsonKey(name: 'Rules')
  final List<RuleSummary> rules;

  DescribeManagedRuleGroupResponse({
    this.capacity,
    this.rules,
  });
  factory DescribeManagedRuleGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeManagedRuleGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateWebACLResponse {
  DisassociateWebACLResponse();
  factory DisassociateWebACLResponse.fromJson(Map<String, dynamic> json) =>
      _$DisassociateWebACLResponseFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Specifies a single rule to exclude from the rule group. Excluding a rule
/// overrides its action setting for the rule group in the web ACL, setting it
/// to <code>COUNT</code>. This effectively excludes the rule from acting on web
/// requests.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ExcludedRule {
  /// The name of the rule to exclude.
  @_s.JsonKey(name: 'Name')
  final String name;

  ExcludedRule({
    @_s.required this.name,
  });
  factory ExcludedRule.fromJson(Map<String, dynamic> json) =>
      _$ExcludedRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ExcludedRuleToJson(this);
}

enum FallbackBehavior {
  @_s.JsonValue('MATCH')
  match,
  @_s.JsonValue('NO_MATCH')
  noMatch,
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The part of a web request that you want AWS WAF to inspect. Include the
/// single <code>FieldToMatch</code> type that you want to inspect, with
/// additional specifications as needed, according to the type. You specify a
/// single request component in <code>FieldToMatch</code> for each rule
/// statement that requires it. To inspect more than one component of a web
/// request, create a separate rule statement for each component.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FieldToMatch {
  /// Inspect all query arguments.
  @_s.JsonKey(name: 'AllQueryArguments')
  final AllQueryArguments allQueryArguments;

  /// Inspect the request body, which immediately follows the request headers.
  /// This is the part of a request that contains any additional data that you
  /// want to send to your web server as the HTTP request body, such as data from
  /// a form.
  ///
  /// Note that only the first 8 KB (8192 bytes) of the request body are forwarded
  /// to AWS WAF for inspection by the underlying host service. If you don't need
  /// to inspect more than 8 KB, you can guarantee that you don't allow additional
  /// bytes in by combining a statement that inspects the body of the web request,
  /// such as <a>ByteMatchStatement</a> or
  /// <a>RegexPatternSetReferenceStatement</a>, with a
  /// <a>SizeConstraintStatement</a> that enforces an 8 KB size limit on the body
  /// of the request. AWS WAF doesn't support inspecting the entire contents of
  /// web requests whose bodies exceed the 8 KB limit.
  @_s.JsonKey(name: 'Body')
  final Body body;

  /// Inspect the HTTP method. The method indicates the type of operation that the
  /// request is asking the origin to perform.
  @_s.JsonKey(name: 'Method')
  final Method method;

  /// Inspect the query string. This is the part of a URL that appears after a
  /// <code>?</code> character, if any.
  @_s.JsonKey(name: 'QueryString')
  final QueryString queryString;

  /// Inspect a single header. Provide the name of the header to inspect, for
  /// example, <code>User-Agent</code> or <code>Referer</code>. This setting isn't
  /// case sensitive.
  @_s.JsonKey(name: 'SingleHeader')
  final SingleHeader singleHeader;

  /// Inspect a single query argument. Provide the name of the query argument to
  /// inspect, such as <i>UserName</i> or <i>SalesRegion</i>. The name can be up
  /// to 30 characters long and isn't case sensitive.
  ///
  /// This is used only to indicate the web request component for AWS WAF to
  /// inspect, in the <a>FieldToMatch</a> specification.
  @_s.JsonKey(name: 'SingleQueryArgument')
  final SingleQueryArgument singleQueryArgument;

  /// Inspect the request URI path. This is the part of a web request that
  /// identifies a resource, for example, <code>/images/daily-ad.jpg</code>.
  @_s.JsonKey(name: 'UriPath')
  final UriPath uriPath;

  FieldToMatch({
    this.allQueryArguments,
    this.body,
    this.method,
    this.queryString,
    this.singleHeader,
    this.singleQueryArgument,
    this.uriPath,
  });
  factory FieldToMatch.fromJson(Map<String, dynamic> json) =>
      _$FieldToMatchFromJson(json);

  Map<String, dynamic> toJson() => _$FieldToMatchToJson(this);
}

/// A rule group that's defined for an AWS Firewall Manager WAF policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FirewallManagerRuleGroup {
  /// The processing guidance for an AWS Firewall Manager rule. This is like a
  /// regular rule <a>Statement</a>, but it can only contain a rule group
  /// reference.
  @_s.JsonKey(name: 'FirewallManagerStatement')
  final FirewallManagerStatement firewallManagerStatement;

  /// The name of the rule group. You cannot change the name of a rule group after
  /// you create it.
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'OverrideAction')
  final OverrideAction overrideAction;

  /// If you define more than one rule group in the first or last Firewall Manager
  /// rule groups, AWS WAF evaluates each request against the rule groups in
  /// order, starting from the lowest priority setting. The priorities don't need
  /// to be consecutive, but they must all be different.
  @_s.JsonKey(name: 'Priority')
  final int priority;
  @_s.JsonKey(name: 'VisibilityConfig')
  final VisibilityConfig visibilityConfig;

  FirewallManagerRuleGroup({
    @_s.required this.firewallManagerStatement,
    @_s.required this.name,
    @_s.required this.overrideAction,
    @_s.required this.priority,
    @_s.required this.visibilityConfig,
  });
  factory FirewallManagerRuleGroup.fromJson(Map<String, dynamic> json) =>
      _$FirewallManagerRuleGroupFromJson(json);
}

/// The processing guidance for an AWS Firewall Manager rule. This is like a
/// regular rule <a>Statement</a>, but it can only contain a rule group
/// reference.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FirewallManagerStatement {
  @_s.JsonKey(name: 'ManagedRuleGroupStatement')
  final ManagedRuleGroupStatement managedRuleGroupStatement;
  @_s.JsonKey(name: 'RuleGroupReferenceStatement')
  final RuleGroupReferenceStatement ruleGroupReferenceStatement;

  FirewallManagerStatement({
    this.managedRuleGroupStatement,
    this.ruleGroupReferenceStatement,
  });
  factory FirewallManagerStatement.fromJson(Map<String, dynamic> json) =>
      _$FirewallManagerStatementFromJson(json);
}

/// The configuration for inspecting IP addresses in an HTTP header that you
/// specify, instead of using the IP address that's reported by the web request
/// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
/// specify any header name.
/// <note>
/// If the specified header isn't present in the request, AWS WAF doesn't apply
/// the rule to the web request at all.
/// </note>
/// This configuration is used for <a>GeoMatchStatement</a> and
/// <a>RateBasedStatement</a>. For <a>IPSetReferenceStatement</a>, use
/// <a>IPSetForwardedIPConfig</a> instead.
///
/// AWS WAF only evaluates the first IP address found in the specified HTTP
/// header.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ForwardedIPConfig {
  /// The match status to assign to the web request if the request doesn't have a
  /// valid IP address in the specified position.
  /// <note>
  /// If the specified header isn't present in the request, AWS WAF doesn't apply
  /// the rule to the web request at all.
  /// </note>
  /// You can specify the following fallback behaviors:
  ///
  /// <ul>
  /// <li>
  /// MATCH - Treat the web request as matching the rule statement. AWS WAF
  /// applies the rule action to the request.
  /// </li>
  /// <li>
  /// NO_MATCH - Treat the web request as not matching the rule statement.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'FallbackBehavior')
  final FallbackBehavior fallbackBehavior;

  /// The name of the HTTP header to use for the IP address. For example, to use
  /// the X-Forwarded-For (XFF) header, set this to <code>X-Forwarded-For</code>.
  /// <note>
  /// If the specified header isn't present in the request, AWS WAF doesn't apply
  /// the rule to the web request at all.
  /// </note>
  @_s.JsonKey(name: 'HeaderName')
  final String headerName;

  ForwardedIPConfig({
    @_s.required this.fallbackBehavior,
    @_s.required this.headerName,
  });
  factory ForwardedIPConfig.fromJson(Map<String, dynamic> json) =>
      _$ForwardedIPConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ForwardedIPConfigToJson(this);
}

enum ForwardedIPPosition {
  @_s.JsonValue('FIRST')
  first,
  @_s.JsonValue('LAST')
  last,
  @_s.JsonValue('ANY')
  any,
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule statement used to identify web requests based on country of origin.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GeoMatchStatement {
  /// An array of two-character country codes, for example, <code>[ "US", "CN"
  /// ]</code>, from the alpha-2 country ISO codes of the ISO 3166 international
  /// standard.
  @_s.JsonKey(name: 'CountryCodes')
  final List<CountryCode> countryCodes;

  /// The configuration for inspecting IP addresses in an HTTP header that you
  /// specify, instead of using the IP address that's reported by the web request
  /// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
  /// specify any header name.
  /// <note>
  /// If the specified header isn't present in the request, AWS WAF doesn't apply
  /// the rule to the web request at all.
  /// </note>
  @_s.JsonKey(name: 'ForwardedIPConfig')
  final ForwardedIPConfig forwardedIPConfig;

  GeoMatchStatement({
    this.countryCodes,
    this.forwardedIPConfig,
  });
  factory GeoMatchStatement.fromJson(Map<String, dynamic> json) =>
      _$GeoMatchStatementFromJson(json);

  Map<String, dynamic> toJson() => _$GeoMatchStatementToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIPSetResponse {
  /// <p/>
  @_s.JsonKey(name: 'IPSet')
  final IPSet iPSet;

  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  @_s.JsonKey(name: 'LockToken')
  final String lockToken;

  GetIPSetResponse({
    this.iPSet,
    this.lockToken,
  });
  factory GetIPSetResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIPSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLoggingConfigurationResponse {
  /// The <a>LoggingConfiguration</a> for the specified web ACL.
  @_s.JsonKey(name: 'LoggingConfiguration')
  final LoggingConfiguration loggingConfiguration;

  GetLoggingConfigurationResponse({
    this.loggingConfiguration,
  });
  factory GetLoggingConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLoggingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPermissionPolicyResponse {
  /// The IAM policy that is attached to the specified rule group.
  @_s.JsonKey(name: 'Policy')
  final String policy;

  GetPermissionPolicyResponse({
    this.policy,
  });
  factory GetPermissionPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPermissionPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRateBasedStatementManagedKeysResponse {
  /// The keys that are of Internet Protocol version 4 (IPv4).
  @_s.JsonKey(name: 'ManagedKeysIPV4')
  final RateBasedStatementManagedKeysIPSet managedKeysIPV4;

  /// The keys that are of Internet Protocol version 6 (IPv6).
  @_s.JsonKey(name: 'ManagedKeysIPV6')
  final RateBasedStatementManagedKeysIPSet managedKeysIPV6;

  GetRateBasedStatementManagedKeysResponse({
    this.managedKeysIPV4,
    this.managedKeysIPV6,
  });
  factory GetRateBasedStatementManagedKeysResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetRateBasedStatementManagedKeysResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRegexPatternSetResponse {
  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  @_s.JsonKey(name: 'LockToken')
  final String lockToken;

  /// <p/>
  @_s.JsonKey(name: 'RegexPatternSet')
  final RegexPatternSet regexPatternSet;

  GetRegexPatternSetResponse({
    this.lockToken,
    this.regexPatternSet,
  });
  factory GetRegexPatternSetResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRegexPatternSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRuleGroupResponse {
  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  @_s.JsonKey(name: 'LockToken')
  final String lockToken;

  /// <p/>
  @_s.JsonKey(name: 'RuleGroup')
  final RuleGroup ruleGroup;

  GetRuleGroupResponse({
    this.lockToken,
    this.ruleGroup,
  });
  factory GetRuleGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRuleGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSampledRequestsResponse {
  /// The total number of requests from which <code>GetSampledRequests</code> got
  /// a sample of <code>MaxItems</code> requests. If <code>PopulationSize</code>
  /// is less than <code>MaxItems</code>, the sample includes every request that
  /// your AWS resource received during the specified time range.
  @_s.JsonKey(name: 'PopulationSize')
  final int populationSize;

  /// A complex type that contains detailed information about each of the requests
  /// in the sample.
  @_s.JsonKey(name: 'SampledRequests')
  final List<SampledHTTPRequest> sampledRequests;

  /// Usually, <code>TimeWindow</code> is the time range that you specified in the
  /// <code>GetSampledRequests</code> request. However, if your AWS resource
  /// received more than 5,000 requests during the time range that you specified
  /// in the request, <code>GetSampledRequests</code> returns the time range for
  /// the first 5,000 requests. Times are in Coordinated Universal Time (UTC)
  /// format.
  @_s.JsonKey(name: 'TimeWindow')
  final TimeWindow timeWindow;

  GetSampledRequestsResponse({
    this.populationSize,
    this.sampledRequests,
    this.timeWindow,
  });
  factory GetSampledRequestsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSampledRequestsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWebACLForResourceResponse {
  /// The Web ACL that is associated with the resource. If there is no associated
  /// resource, AWS WAF returns a null Web ACL.
  @_s.JsonKey(name: 'WebACL')
  final WebACL webACL;

  GetWebACLForResourceResponse({
    this.webACL,
  });
  factory GetWebACLForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWebACLForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWebACLResponse {
  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  @_s.JsonKey(name: 'LockToken')
  final String lockToken;

  /// The Web ACL specification. You can modify the settings in this Web ACL and
  /// use it to update this Web ACL or create a new one.
  @_s.JsonKey(name: 'WebACL')
  final WebACL webACL;

  GetWebACLResponse({
    this.lockToken,
    this.webACL,
  });
  factory GetWebACLResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWebACLResponseFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Part of the response from <a>GetSampledRequests</a>. This is a complex type
/// that appears as <code>Headers</code> in the response syntax.
/// <code>HTTPHeader</code> contains the names and values of all of the headers
/// that appear in one of the web requests.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HTTPHeader {
  /// The name of the HTTP header.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The value of the HTTP header.
  @_s.JsonKey(name: 'Value')
  final String value;

  HTTPHeader({
    this.name,
    this.value,
  });
  factory HTTPHeader.fromJson(Map<String, dynamic> json) =>
      _$HTTPHeaderFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Part of the response from <a>GetSampledRequests</a>. This is a complex type
/// that appears as <code>Request</code> in the response syntax.
/// <code>HTTPRequest</code> contains information about one of the web requests.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'ClientIP')
  final String clientIP;

  /// The two-letter country code for the country that the request originated
  /// from. For a current list of country codes, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166-1
  /// alpha-2</a>.
  @_s.JsonKey(name: 'Country')
  final String country;

  /// The HTTP version specified in the sampled web request, for example,
  /// <code>HTTP/1.1</code>.
  @_s.JsonKey(name: 'HTTPVersion')
  final String hTTPVersion;

  /// A complex type that contains the name and value for each header in the
  /// sampled web request.
  @_s.JsonKey(name: 'Headers')
  final List<HTTPHeader> headers;

  /// The HTTP method specified in the sampled web request.
  @_s.JsonKey(name: 'Method')
  final String method;

  /// The URI path of the request, which identifies the resource, for example,
  /// <code>/images/daily-ad.jpg</code>.
  @_s.JsonKey(name: 'URI')
  final String uri;

  HTTPRequest({
    this.clientIP,
    this.country,
    this.hTTPVersion,
    this.headers,
    this.method,
    this.uri,
  });
  factory HTTPRequest.fromJson(Map<String, dynamic> json) =>
      _$HTTPRequestFromJson(json);
}

enum IPAddressVersion {
  @_s.JsonValue('IPV4')
  ipv4,
  @_s.JsonValue('IPV6')
  ipv6,
}

extension on IPAddressVersion {
  String toValue() {
    switch (this) {
      case IPAddressVersion.ipv4:
        return 'IPV4';
      case IPAddressVersion.ipv6:
        return 'IPV6';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Contains one or more IP addresses or blocks of IP addresses specified in
/// Classless Inter-Domain Routing (CIDR) notation. AWS WAF supports any CIDR
/// range. For information about CIDR notation, see the Wikipedia entry <a
/// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
/// Inter-Domain Routing</a>.
///
/// AWS WAF assigns an ARN to each <code>IPSet</code> that you create. To use an
/// IP set in a rule, you provide the ARN to the <a>Rule</a> statement
/// <a>IPSetReferenceStatement</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IPSet {
  /// The Amazon Resource Name (ARN) of the entity.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// Contains an array of strings that specify one or more IP addresses or blocks
  /// of IP addresses in Classless Inter-Domain Routing (CIDR) notation. AWS WAF
  /// supports all address ranges for IP versions IPv4 and IPv6.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated from
  /// the IP address 192.0.2.44, specify <code>192.0.2.44/32</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated from
  /// IP addresses from 192.0.2.0 to 192.0.2.255, specify
  /// <code>192.0.2.0/24</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated from
  /// the IP address 1111:0000:0000:0000:0000:0000:0000:0111, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0111/128</code>.
  /// </li>
  /// <li>
  /// To configure AWS WAF to allow, block, or count requests that originated from
  /// IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to
  /// 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify
  /// <code>1111:0000:0000:0000:0000:0000:0000:0000/64</code>.
  /// </li>
  /// </ul>
  /// For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  @_s.JsonKey(name: 'Addresses')
  final List<String> addresses;

  /// Specify IPV4 or IPV6.
  @_s.JsonKey(name: 'IPAddressVersion')
  final IPAddressVersion iPAddressVersion;

  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the IP set. You cannot change the name of an <code>IPSet</code>
  /// after you create it.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A description of the IP set that helps with identification. You cannot
  /// change the description of an IP set after you create it.
  @_s.JsonKey(name: 'Description')
  final String description;

  IPSet({
    @_s.required this.arn,
    @_s.required this.addresses,
    @_s.required this.iPAddressVersion,
    @_s.required this.id,
    @_s.required this.name,
    this.description,
  });
  factory IPSet.fromJson(Map<String, dynamic> json) => _$IPSetFromJson(json);
}

/// The configuration for inspecting IP addresses in an HTTP header that you
/// specify, instead of using the IP address that's reported by the web request
/// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
/// specify any header name.
/// <note>
/// If the specified header isn't present in the request, AWS WAF doesn't apply
/// the rule to the web request at all.
/// </note>
/// This configuration is used only for <a>IPSetReferenceStatement</a>. For
/// <a>GeoMatchStatement</a> and <a>RateBasedStatement</a>, use
/// <a>ForwardedIPConfig</a> instead.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IPSetForwardedIPConfig {
  /// The match status to assign to the web request if the request doesn't have a
  /// valid IP address in the specified position.
  /// <note>
  /// If the specified header isn't present in the request, AWS WAF doesn't apply
  /// the rule to the web request at all.
  /// </note>
  /// You can specify the following fallback behaviors:
  ///
  /// <ul>
  /// <li>
  /// MATCH - Treat the web request as matching the rule statement. AWS WAF
  /// applies the rule action to the request.
  /// </li>
  /// <li>
  /// NO_MATCH - Treat the web request as not matching the rule statement.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'FallbackBehavior')
  final FallbackBehavior fallbackBehavior;

  /// The name of the HTTP header to use for the IP address. For example, to use
  /// the X-Forwarded-For (XFF) header, set this to <code>X-Forwarded-For</code>.
  /// <note>
  /// If the specified header isn't present in the request, AWS WAF doesn't apply
  /// the rule to the web request at all.
  /// </note>
  @_s.JsonKey(name: 'HeaderName')
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
  /// contains more than 10 IP addresses, AWS WAF inspects the last 10.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Position')
  final ForwardedIPPosition position;

  IPSetForwardedIPConfig({
    @_s.required this.fallbackBehavior,
    @_s.required this.headerName,
    @_s.required this.position,
  });
  factory IPSetForwardedIPConfig.fromJson(Map<String, dynamic> json) =>
      _$IPSetForwardedIPConfigFromJson(json);

  Map<String, dynamic> toJson() => _$IPSetForwardedIPConfigToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule statement used to detect web requests coming from particular IP
/// addresses or address ranges. To use this, create an <a>IPSet</a> that
/// specifies the addresses you want to detect, then use the ARN of that set in
/// this statement. To create an IP set, see <a>CreateIPSet</a>.
///
/// Each IP set rule statement references an IP set. You create and maintain the
/// set independent of your rules. This allows you to use the single set in
/// multiple rules. When you update the referenced set, AWS WAF automatically
/// updates all rules that reference it.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IPSetReferenceStatement {
  /// The Amazon Resource Name (ARN) of the <a>IPSet</a> that this statement
  /// references.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The configuration for inspecting IP addresses in an HTTP header that you
  /// specify, instead of using the IP address that's reported by the web request
  /// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
  /// specify any header name.
  /// <note>
  /// If the specified header isn't present in the request, AWS WAF doesn't apply
  /// the rule to the web request at all.
  /// </note>
  @_s.JsonKey(name: 'IPSetForwardedIPConfig')
  final IPSetForwardedIPConfig iPSetForwardedIPConfig;

  IPSetReferenceStatement({
    @_s.required this.arn,
    this.iPSetForwardedIPConfig,
  });
  factory IPSetReferenceStatement.fromJson(Map<String, dynamic> json) =>
      _$IPSetReferenceStatementFromJson(json);

  Map<String, dynamic> toJson() => _$IPSetReferenceStatementToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// High-level information about an <a>IPSet</a>, returned by operations like
/// create and list. This provides information like the ID, that you can use to
/// retrieve and manage an <code>IPSet</code>, and the ARN, that you provide to
/// the <a>IPSetReferenceStatement</a> to use the address set in a <a>Rule</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IPSetSummary {
  /// The Amazon Resource Name (ARN) of the entity.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// A description of the IP set that helps with identification. You cannot
  /// change the description of an IP set after you create it.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  @_s.JsonKey(name: 'LockToken')
  final String lockToken;

  /// The name of the IP set. You cannot change the name of an <code>IPSet</code>
  /// after you create it.
  @_s.JsonKey(name: 'Name')
  final String name;

  IPSetSummary({
    this.arn,
    this.description,
    this.id,
    this.lockToken,
    this.name,
  });
  factory IPSetSummary.fromJson(Map<String, dynamic> json) =>
      _$IPSetSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAvailableManagedRuleGroupsResponse {
  /// <p/>
  @_s.JsonKey(name: 'ManagedRuleGroups')
  final List<ManagedRuleGroupSummary> managedRuleGroups;

  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// AWS WAF returns a <code>NextMarker</code> value in the response. To retrieve
  /// the next batch of objects, provide the marker from the prior call in your
  /// next request.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  ListAvailableManagedRuleGroupsResponse({
    this.managedRuleGroups,
    this.nextMarker,
  });
  factory ListAvailableManagedRuleGroupsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListAvailableManagedRuleGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIPSetsResponse {
  /// Array of IPSets. This may not be the full list of IPSets that you have
  /// defined. See the <code>Limit</code> specification for this request.
  @_s.JsonKey(name: 'IPSets')
  final List<IPSetSummary> iPSets;

  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// AWS WAF returns a <code>NextMarker</code> value in the response. To retrieve
  /// the next batch of objects, provide the marker from the prior call in your
  /// next request.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  ListIPSetsResponse({
    this.iPSets,
    this.nextMarker,
  });
  factory ListIPSetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListIPSetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLoggingConfigurationsResponse {
  /// <p/>
  @_s.JsonKey(name: 'LoggingConfigurations')
  final List<LoggingConfiguration> loggingConfigurations;

  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// AWS WAF returns a <code>NextMarker</code> value in the response. To retrieve
  /// the next batch of objects, provide the marker from the prior call in your
  /// next request.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  ListLoggingConfigurationsResponse({
    this.loggingConfigurations,
    this.nextMarker,
  });
  factory ListLoggingConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListLoggingConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRegexPatternSetsResponse {
  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// AWS WAF returns a <code>NextMarker</code> value in the response. To retrieve
  /// the next batch of objects, provide the marker from the prior call in your
  /// next request.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// <p/>
  @_s.JsonKey(name: 'RegexPatternSets')
  final List<RegexPatternSetSummary> regexPatternSets;

  ListRegexPatternSetsResponse({
    this.nextMarker,
    this.regexPatternSets,
  });
  factory ListRegexPatternSetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRegexPatternSetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourcesForWebACLResponse {
  /// The array of Amazon Resource Names (ARNs) of the associated resources.
  @_s.JsonKey(name: 'ResourceArns')
  final List<String> resourceArns;

  ListResourcesForWebACLResponse({
    this.resourceArns,
  });
  factory ListResourcesForWebACLResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResourcesForWebACLResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRuleGroupsResponse {
  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// AWS WAF returns a <code>NextMarker</code> value in the response. To retrieve
  /// the next batch of objects, provide the marker from the prior call in your
  /// next request.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// <p/>
  @_s.JsonKey(name: 'RuleGroups')
  final List<RuleGroupSummary> ruleGroups;

  ListRuleGroupsResponse({
    this.nextMarker,
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
  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// AWS WAF returns a <code>NextMarker</code> value in the response. To retrieve
  /// the next batch of objects, provide the marker from the prior call in your
  /// next request.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// The collection of tagging definitions for the resource.
  @_s.JsonKey(name: 'TagInfoForResource')
  final TagInfoForResource tagInfoForResource;

  ListTagsForResourceResponse({
    this.nextMarker,
    this.tagInfoForResource,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWebACLsResponse {
  /// When you request a list of objects with a <code>Limit</code> setting, if the
  /// number of objects that are still available for retrieval exceeds the limit,
  /// AWS WAF returns a <code>NextMarker</code> value in the response. To retrieve
  /// the next batch of objects, provide the marker from the prior call in your
  /// next request.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// <p/>
  @_s.JsonKey(name: 'WebACLs')
  final List<WebACLSummary> webACLs;

  ListWebACLsResponse({
    this.nextMarker,
    this.webACLs,
  });
  factory ListWebACLsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListWebACLsResponseFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Defines an association between Amazon Kinesis Data Firehose destinations and
/// a web ACL resource, for logging from AWS WAF. As part of the association,
/// you can specify parts of the standard logging fields to keep out of the
/// logs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoggingConfiguration {
  /// The Amazon Kinesis Data Firehose Amazon Resource Name (ARNs) that you want
  /// to associate with the web ACL.
  @_s.JsonKey(name: 'LogDestinationConfigs')
  final List<String> logDestinationConfigs;

  /// The Amazon Resource Name (ARN) of the web ACL that you want to associate
  /// with <code>LogDestinationConfigs</code>.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// Indicates whether the logging configuration was created by AWS Firewall
  /// Manager, as part of an AWS WAF policy configuration. If true, only Firewall
  /// Manager can modify or delete the configuration.
  @_s.JsonKey(name: 'ManagedByFirewallManager')
  final bool managedByFirewallManager;

  /// The parts of the request that you want to keep out of the logs. For example,
  /// if you redact the <code>HEADER</code> field, the <code>HEADER</code> field
  /// in the firehose will be <code>xxx</code>.
  /// <note>
  /// You must use one of the following values: <code>URI</code>,
  /// <code>QUERY_STRING</code>, <code>HEADER</code>, or <code>METHOD</code>.
  /// </note>
  @_s.JsonKey(name: 'RedactedFields')
  final List<FieldToMatch> redactedFields;

  LoggingConfiguration({
    @_s.required this.logDestinationConfigs,
    @_s.required this.resourceArn,
    this.managedByFirewallManager,
    this.redactedFields,
  });
  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$LoggingConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$LoggingConfigurationToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule statement used to run the rules that are defined in a managed rule
/// group. To use this, provide the vendor name and the name of the rule group
/// in this statement. You can retrieve the required names by calling
/// <a>ListAvailableManagedRuleGroups</a>.
///
/// You can't nest a <code>ManagedRuleGroupStatement</code>, for example for use
/// inside a <code>NotStatement</code> or <code>OrStatement</code>. It can only
/// be referenced as a top-level statement within a rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ManagedRuleGroupStatement {
  /// The name of the managed rule group. You use this, along with the vendor
  /// name, to identify the rule group.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The name of the managed rule group vendor. You use this, along with the rule
  /// group name, to identify the rule group.
  @_s.JsonKey(name: 'VendorName')
  final String vendorName;

  /// The rules whose actions are set to <code>COUNT</code> by the web ACL,
  /// regardless of the action that is set on the rule. This effectively excludes
  /// the rule from acting on web requests.
  @_s.JsonKey(name: 'ExcludedRules')
  final List<ExcludedRule> excludedRules;

  ManagedRuleGroupStatement({
    @_s.required this.name,
    @_s.required this.vendorName,
    this.excludedRules,
  });
  factory ManagedRuleGroupStatement.fromJson(Map<String, dynamic> json) =>
      _$ManagedRuleGroupStatementFromJson(json);

  Map<String, dynamic> toJson() => _$ManagedRuleGroupStatementToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// High-level information about a managed rule group, returned by
/// <a>ListAvailableManagedRuleGroups</a>. This provides information like the
/// name and vendor name, that you provide when you add a
/// <a>ManagedRuleGroupStatement</a> to a web ACL. Managed rule groups include
/// AWS Managed Rules rule groups, which are free of charge to AWS WAF
/// customers, and AWS Marketplace managed rule groups, which you can subscribe
/// to through AWS Marketplace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ManagedRuleGroupSummary {
  /// The description of the managed rule group, provided by AWS Managed Rules or
  /// the AWS Marketplace seller who manages it.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the managed rule group. You use this, along with the vendor
  /// name, to identify the rule group.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The name of the managed rule group vendor. You use this, along with the rule
  /// group name, to identify the rule group.
  @_s.JsonKey(name: 'VendorName')
  final String vendorName;

  ManagedRuleGroupSummary({
    this.description,
    this.name,
    this.vendorName,
  });
  factory ManagedRuleGroupSummary.fromJson(Map<String, dynamic> json) =>
      _$ManagedRuleGroupSummaryFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The HTTP method of a web request. The method indicates the type of operation
/// that the request is asking the origin to perform.
///
/// This is used only to indicate the web request component for AWS WAF to
/// inspect, in the <a>FieldToMatch</a> specification.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Method {
  Method();
  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);

  Map<String, dynamic> toJson() => _$MethodToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Specifies that AWS WAF should do nothing. This is generally used to try out
/// a rule without performing any actions. You set the
/// <code>OverrideAction</code> on the <a>Rule</a>.
///
/// This is used only in the context of other settings, for example to specify
/// values for <a>RuleAction</a> and web ACL <a>DefaultAction</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NoneAction {
  NoneAction();
  factory NoneAction.fromJson(Map<String, dynamic> json) =>
      _$NoneActionFromJson(json);

  Map<String, dynamic> toJson() => _$NoneActionToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A logical rule statement used to negate the results of another rule
/// statement. You provide one <a>Statement</a> within the
/// <code>NotStatement</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NotStatement {
  /// The statement to negate. You can use any statement that can be nested.
  @_s.JsonKey(name: 'Statement')
  final Statement statement;

  NotStatement({
    @_s.required this.statement,
  });
  factory NotStatement.fromJson(Map<String, dynamic> json) =>
      _$NotStatementFromJson(json);

  Map<String, dynamic> toJson() => _$NotStatementToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A logical rule statement used to combine other rule statements with OR
/// logic. You provide more than one <a>Statement</a> within the
/// <code>OrStatement</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OrStatement {
  /// The statements to combine with OR logic. You can use any statements that can
  /// be nested.
  @_s.JsonKey(name: 'Statements')
  final List<Statement> statements;

  OrStatement({
    @_s.required this.statements,
  });
  factory OrStatement.fromJson(Map<String, dynamic> json) =>
      _$OrStatementFromJson(json);

  Map<String, dynamic> toJson() => _$OrStatementToJson(this);
}

/// The override action to apply to the rules in a rule group. Used only for
/// rule statements that reference a rule group, like
/// <code>RuleGroupReferenceStatement</code> and
/// <code>ManagedRuleGroupStatement</code>.
///
/// Set the override action to none to leave the rule actions in effect. Set it
/// to count to only count matches, regardless of the rule action settings.
///
/// In a <a>Rule</a>, you must specify either this <code>OverrideAction</code>
/// setting or the rule <code>Action</code> setting, but not both:
///
/// <ul>
/// <li>
/// If the rule statement references a rule group, use this override action
/// setting and not the action setting.
/// </li>
/// <li>
/// If the rule statement does not reference a rule group, use the rule action
/// setting and not this rule override action setting.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OverrideAction {
  /// Override the rule action setting to count.
  @_s.JsonKey(name: 'Count')
  final CountAction count;

  /// Don't override the rule action setting.
  @_s.JsonKey(name: 'None')
  final NoneAction none;

  OverrideAction({
    this.count,
    this.none,
  });
  factory OverrideAction.fromJson(Map<String, dynamic> json) =>
      _$OverrideActionFromJson(json);

  Map<String, dynamic> toJson() => _$OverrideActionToJson(this);
}

enum PositionalConstraint {
  @_s.JsonValue('EXACTLY')
  exactly,
  @_s.JsonValue('STARTS_WITH')
  startsWith,
  @_s.JsonValue('ENDS_WITH')
  endsWith,
  @_s.JsonValue('CONTAINS')
  contains,
  @_s.JsonValue('CONTAINS_WORD')
  containsWord,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutLoggingConfigurationResponse {
  /// <p/>
  @_s.JsonKey(name: 'LoggingConfiguration')
  final LoggingConfiguration loggingConfiguration;

  PutLoggingConfigurationResponse({
    this.loggingConfiguration,
  });
  factory PutLoggingConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$PutLoggingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutPermissionPolicyResponse {
  PutPermissionPolicyResponse();
  factory PutPermissionPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutPermissionPolicyResponseFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The query string of a web request. This is the part of a URL that appears
/// after a <code>?</code> character, if any.
///
/// This is used only to indicate the web request component for AWS WAF to
/// inspect, in the <a>FieldToMatch</a> specification.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class QueryString {
  QueryString();
  factory QueryString.fromJson(Map<String, dynamic> json) =>
      _$QueryStringFromJson(json);

  Map<String, dynamic> toJson() => _$QueryStringToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rate-based rule tracks the rate of requests for each originating IP
/// address, and triggers the rule action when the rate exceeds a limit that you
/// specify on the number of requests in any 5-minute time span. You can use
/// this to put a temporary block on requests from an IP address that is sending
/// excessive requests.
///
/// When the rule action triggers, AWS WAF blocks additional requests from the
/// IP address until the request rate falls below the limit.
///
/// You can optionally nest another statement inside the rate-based statement,
/// to narrow the scope of the rule so that it only counts requests that match
/// the nested statement. For example, based on recent requests that you have
/// seen from an attacker, you might create a rate-based rule with a nested AND
/// rule statement that contains the following nested statements:
///
/// <ul>
/// <li>
/// An IP match statement with an IP set that specified the address 192.0.2.44.
/// </li>
/// <li>
/// A string match statement that searches in the User-Agent header for the
/// string BadBot.
/// </li>
/// </ul>
/// In this rate-based rule, you also define a rate limit. For this example, the
/// rate limit is 1,000. Requests that meet both of the conditions in the
/// statements are counted. If the count exceeds 1,000 requests per five
/// minutes, the rule action triggers. Requests that do not meet both conditions
/// are not counted towards the rate limit and are not affected by this rule.
///
/// You cannot nest a <code>RateBasedStatement</code>, for example for use
/// inside a <code>NotStatement</code> or <code>OrStatement</code>. It can only
/// be referenced as a top-level statement within a rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RateBasedStatement {
  /// Setting that indicates how to aggregate the request counts. The options are
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// IP - Aggregate the request counts on the IP address from the web request
  /// origin.
  /// </li>
  /// <li>
  /// FORWARDED_IP - Aggregate the request counts on the first IP address in an
  /// HTTP header. If you use this, configure the <code>ForwardedIPConfig</code>,
  /// to specify the header to use.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'AggregateKeyType')
  final RateBasedStatementAggregateKeyType aggregateKeyType;

  /// The limit on requests per 5-minute period for a single originating IP
  /// address. If the statement includes a <code>ScopeDownStatement</code>, this
  /// limit is applied only to the requests that match the statement.
  @_s.JsonKey(name: 'Limit')
  final int limit;

  /// The configuration for inspecting IP addresses in an HTTP header that you
  /// specify, instead of using the IP address that's reported by the web request
  /// origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can
  /// specify any header name.
  /// <note>
  /// If the specified header isn't present in the request, AWS WAF doesn't apply
  /// the rule to the web request at all.
  /// </note>
  /// This is required if <code>AggregateKeyType</code> is set to
  /// <code>FORWARDED_IP</code>.
  @_s.JsonKey(name: 'ForwardedIPConfig')
  final ForwardedIPConfig forwardedIPConfig;

  /// An optional nested statement that narrows the scope of the rate-based
  /// statement to matching web requests. This can be any nestable statement, and
  /// you can nest statements at any level below this scope-down statement.
  @_s.JsonKey(name: 'ScopeDownStatement')
  final Statement scopeDownStatement;

  RateBasedStatement({
    @_s.required this.aggregateKeyType,
    @_s.required this.limit,
    this.forwardedIPConfig,
    this.scopeDownStatement,
  });
  factory RateBasedStatement.fromJson(Map<String, dynamic> json) =>
      _$RateBasedStatementFromJson(json);

  Map<String, dynamic> toJson() => _$RateBasedStatementToJson(this);
}

enum RateBasedStatementAggregateKeyType {
  @_s.JsonValue('IP')
  ip,
  @_s.JsonValue('FORWARDED_IP')
  forwardedIp,
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The set of IP addresses that are currently blocked for a rate-based
/// statement.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RateBasedStatementManagedKeysIPSet {
  /// The IP addresses that are currently blocked.
  @_s.JsonKey(name: 'Addresses')
  final List<String> addresses;
  @_s.JsonKey(name: 'IPAddressVersion')
  final IPAddressVersion iPAddressVersion;

  RateBasedStatementManagedKeysIPSet({
    this.addresses,
    this.iPAddressVersion,
  });
  factory RateBasedStatementManagedKeysIPSet.fromJson(
          Map<String, dynamic> json) =>
      _$RateBasedStatementManagedKeysIPSetFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A single regular expression. This is used in a <a>RegexPatternSet</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Regex {
  /// The string representing the regular expression.
  @_s.JsonKey(name: 'RegexString')
  final String regexString;

  Regex({
    this.regexString,
  });
  factory Regex.fromJson(Map<String, dynamic> json) => _$RegexFromJson(json);

  Map<String, dynamic> toJson() => _$RegexToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Contains one or more regular expressions.
///
/// AWS WAF assigns an ARN to each <code>RegexPatternSet</code> that you create.
/// To use a set in a rule, you provide the ARN to the <a>Rule</a> statement
/// <a>RegexPatternSetReferenceStatement</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegexPatternSet {
  /// The Amazon Resource Name (ARN) of the entity.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// A description of the set that helps with identification. You cannot change
  /// the description of a set after you create it.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the set. You cannot change the name after you create the set.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The regular expression patterns in the set.
  @_s.JsonKey(name: 'RegularExpressionList')
  final List<Regex> regularExpressionList;

  RegexPatternSet({
    this.arn,
    this.description,
    this.id,
    this.name,
    this.regularExpressionList,
  });
  factory RegexPatternSet.fromJson(Map<String, dynamic> json) =>
      _$RegexPatternSetFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
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
/// AWS WAF automatically updates all rules that reference it.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RegexPatternSetReferenceStatement {
  /// The Amazon Resource Name (ARN) of the <a>RegexPatternSet</a> that this
  /// statement references.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The part of a web request that you want AWS WAF to inspect. For more
  /// information, see <a>FieldToMatch</a>.
  @_s.JsonKey(name: 'FieldToMatch')
  final FieldToMatch fieldToMatch;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. If you specify one or
  /// more transformations in a rule statement, AWS WAF performs all
  /// transformations on the content of the request component identified by
  /// <code>FieldToMatch</code>, starting from the lowest priority setting, before
  /// inspecting the content for a match.
  @_s.JsonKey(name: 'TextTransformations')
  final List<TextTransformation> textTransformations;

  RegexPatternSetReferenceStatement({
    @_s.required this.arn,
    @_s.required this.fieldToMatch,
    @_s.required this.textTransformations,
  });
  factory RegexPatternSetReferenceStatement.fromJson(
          Map<String, dynamic> json) =>
      _$RegexPatternSetReferenceStatementFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RegexPatternSetReferenceStatementToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// High-level information about a <a>RegexPatternSet</a>, returned by
/// operations like create and list. This provides information like the ID, that
/// you can use to retrieve and manage a <code>RegexPatternSet</code>, and the
/// ARN, that you provide to the <a>RegexPatternSetReferenceStatement</a> to use
/// the pattern set in a <a>Rule</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegexPatternSetSummary {
  /// The Amazon Resource Name (ARN) of the entity.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// A description of the set that helps with identification. You cannot change
  /// the description of a set after you create it.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A unique identifier for the set. This ID is returned in the responses to
  /// create and list commands. You provide it to operations like update and
  /// delete.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  @_s.JsonKey(name: 'LockToken')
  final String lockToken;

  /// The name of the data type instance. You cannot change the name after you
  /// create the instance.
  @_s.JsonKey(name: 'Name')
  final String name;

  RegexPatternSetSummary({
    this.arn,
    this.description,
    this.id,
    this.lockToken,
    this.name,
  });
  factory RegexPatternSetSummary.fromJson(Map<String, dynamic> json) =>
      _$RegexPatternSetSummaryFromJson(json);
}

enum ResourceType {
  @_s.JsonValue('APPLICATION_LOAD_BALANCER')
  applicationLoadBalancer,
  @_s.JsonValue('API_GATEWAY')
  apiGateway,
  @_s.JsonValue('APPSYNC')
  appsync,
}

extension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.applicationLoadBalancer:
        return 'APPLICATION_LOAD_BALANCER';
      case ResourceType.apiGateway:
        return 'API_GATEWAY';
      case ResourceType.appsync:
        return 'APPSYNC';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A single rule, which you can use in a <a>WebACL</a> or <a>RuleGroup</a> to
/// identify web requests that you want to allow, block, or count. Each rule
/// includes one top-level <a>Statement</a> that AWS WAF uses to identify
/// matching web requests, and parameters that govern how AWS WAF handles them.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Rule {
  /// The name of the rule. You can't change the name of a <code>Rule</code> after
  /// you create it.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// If you define more than one <code>Rule</code> in a <code>WebACL</code>, AWS
  /// WAF evaluates each request against the <code>Rules</code> in order based on
  /// the value of <code>Priority</code>. AWS WAF processes rules with lower
  /// priority first. The priorities don't need to be consecutive, but they must
  /// all be different.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// The AWS WAF processing statement for the rule, for example
  /// <a>ByteMatchStatement</a> or <a>SizeConstraintStatement</a>.
  @_s.JsonKey(name: 'Statement')
  final Statement statement;

  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  @_s.JsonKey(name: 'VisibilityConfig')
  final VisibilityConfig visibilityConfig;

  /// The action that AWS WAF should take on a web request when it matches the
  /// rule statement. Settings at the web ACL level can override the rule action
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
  @_s.JsonKey(name: 'Action')
  final RuleAction action;

  /// The override action to apply to the rules in a rule group. Used only for
  /// rule statements that reference a rule group, like
  /// <code>RuleGroupReferenceStatement</code> and
  /// <code>ManagedRuleGroupStatement</code>.
  ///
  /// Set the override action to none to leave the rule actions in effect. Set it
  /// to count to only count matches, regardless of the rule action settings.
  ///
  /// In a <a>Rule</a>, you must specify either this <code>OverrideAction</code>
  /// setting or the rule <code>Action</code> setting, but not both:
  ///
  /// <ul>
  /// <li>
  /// If the rule statement references a rule group, use this override action
  /// setting and not the action setting.
  /// </li>
  /// <li>
  /// If the rule statement does not reference a rule group, use the rule action
  /// setting and not this rule override action setting.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'OverrideAction')
  final OverrideAction overrideAction;

  Rule({
    @_s.required this.name,
    @_s.required this.priority,
    @_s.required this.statement,
    @_s.required this.visibilityConfig,
    this.action,
    this.overrideAction,
  });
  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  Map<String, dynamic> toJson() => _$RuleToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The action that AWS WAF should take on a web request when it matches a
/// rule's statement. Settings at the web ACL level can override the rule action
/// setting.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RuleAction {
  /// Instructs AWS WAF to allow the web request.
  @_s.JsonKey(name: 'Allow')
  final AllowAction allow;

  /// Instructs AWS WAF to block the web request.
  @_s.JsonKey(name: 'Block')
  final BlockAction block;

  /// Instructs AWS WAF to count the web request and allow it.
  @_s.JsonKey(name: 'Count')
  final CountAction count;

  RuleAction({
    this.allow,
    this.block,
    this.count,
  });
  factory RuleAction.fromJson(Map<String, dynamic> json) =>
      _$RuleActionFromJson(json);

  Map<String, dynamic> toJson() => _$RuleActionToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule group defines a collection of rules to inspect and control web
/// requests that you can use in a <a>WebACL</a>. When you create a rule group,
/// you define an immutable capacity limit. If you update a rule group, you must
/// stay within the capacity. This allows others to reuse the rule group with
/// confidence in its capacity requirements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RuleGroup {
  /// The Amazon Resource Name (ARN) of the entity.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The web ACL capacity units (WCUs) required for this rule group.
  ///
  /// When you create your own rule group, you define this, and you cannot change
  /// it after creation. When you add or modify the rules in a rule group, AWS WAF
  /// enforces this limit. You can check the capacity for a set of rules using
  /// <a>CheckCapacity</a>.
  ///
  /// AWS WAF uses WCUs to calculate and control the operating resources that are
  /// used to run your rules, rule groups, and web ACLs. AWS WAF calculates
  /// capacity differently for each rule type, to reflect the relative cost of
  /// each rule. Simple rules that cost little to run use fewer WCUs than more
  /// complex rules that use more processing power. Rule group capacity is fixed
  /// at creation, which helps users plan their web ACL WCU usage when they use a
  /// rule group. The WCU limit for web ACLs is 1,500.
  @_s.JsonKey(name: 'Capacity')
  final int capacity;

  /// A unique identifier for the rule group. This ID is returned in the responses
  /// to create and list commands. You provide it to operations like update and
  /// delete.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the rule group. You cannot change the name of a rule group after
  /// you create it.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  @_s.JsonKey(name: 'VisibilityConfig')
  final VisibilityConfig visibilityConfig;

  /// A description of the rule group that helps with identification. You cannot
  /// change the description of a rule group after you create it.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to allow, block, or count. Each rule includes one top-level statement that
  /// AWS WAF uses to identify matching web requests, and parameters that govern
  /// how AWS WAF handles them.
  @_s.JsonKey(name: 'Rules')
  final List<Rule> rules;

  RuleGroup({
    @_s.required this.arn,
    @_s.required this.capacity,
    @_s.required this.id,
    @_s.required this.name,
    @_s.required this.visibilityConfig,
    this.description,
    this.rules,
  });
  factory RuleGroup.fromJson(Map<String, dynamic> json) =>
      _$RuleGroupFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule statement used to run the rules that are defined in a
/// <a>RuleGroup</a>. To use this, create a rule group with your rules, then
/// provide the ARN of the rule group in this statement.
///
/// You cannot nest a <code>RuleGroupReferenceStatement</code>, for example for
/// use inside a <code>NotStatement</code> or <code>OrStatement</code>. It can
/// only be referenced as a top-level statement within a rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RuleGroupReferenceStatement {
  /// The Amazon Resource Name (ARN) of the entity.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The names of rules that are in the referenced rule group, but that you want
  /// AWS WAF to exclude from processing for this rule statement.
  @_s.JsonKey(name: 'ExcludedRules')
  final List<ExcludedRule> excludedRules;

  RuleGroupReferenceStatement({
    @_s.required this.arn,
    this.excludedRules,
  });
  factory RuleGroupReferenceStatement.fromJson(Map<String, dynamic> json) =>
      _$RuleGroupReferenceStatementFromJson(json);

  Map<String, dynamic> toJson() => _$RuleGroupReferenceStatementToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// High-level information about a <a>RuleGroup</a>, returned by operations like
/// create and list. This provides information like the ID, that you can use to
/// retrieve and manage a <code>RuleGroup</code>, and the ARN, that you provide
/// to the <a>RuleGroupReferenceStatement</a> to use the rule group in a
/// <a>Rule</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RuleGroupSummary {
  /// The Amazon Resource Name (ARN) of the entity.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// A description of the rule group that helps with identification. You cannot
  /// change the description of a rule group after you create it.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A unique identifier for the rule group. This ID is returned in the responses
  /// to create and list commands. You provide it to operations like update and
  /// delete.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  @_s.JsonKey(name: 'LockToken')
  final String lockToken;

  /// The name of the data type instance. You cannot change the name after you
  /// create the instance.
  @_s.JsonKey(name: 'Name')
  final String name;

  RuleGroupSummary({
    this.arn,
    this.description,
    this.id,
    this.lockToken,
    this.name,
  });
  factory RuleGroupSummary.fromJson(Map<String, dynamic> json) =>
      _$RuleGroupSummaryFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// High-level information about a <a>Rule</a>, returned by operations like
/// <a>DescribeManagedRuleGroup</a>. This provides information like the ID, that
/// you can use to retrieve and manage a <code>RuleGroup</code>, and the ARN,
/// that you provide to the <a>RuleGroupReferenceStatement</a> to use the rule
/// group in a <a>Rule</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RuleSummary {
  @_s.JsonKey(name: 'Action')
  final RuleAction action;

  /// The name of the rule.
  @_s.JsonKey(name: 'Name')
  final String name;

  RuleSummary({
    this.action,
    this.name,
  });
  factory RuleSummary.fromJson(Map<String, dynamic> json) =>
      _$RuleSummaryFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Represents a single sampled web request. The response from
/// <a>GetSampledRequests</a> includes a <code>SampledHTTPRequests</code>
/// complex type that appears as <code>SampledRequests</code> in the response
/// syntax. <code>SampledHTTPRequests</code> contains an array of
/// <code>SampledHTTPRequest</code> objects.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SampledHTTPRequest {
  /// A complex type that contains detailed information about the request.
  @_s.JsonKey(name: 'Request')
  final HTTPRequest request;

  /// A value that indicates how one result in the response relates proportionally
  /// to other results in the response. For example, a result that has a weight of
  /// <code>2</code> represents roughly twice as many web requests as a result
  /// that has a weight of <code>1</code>.
  @_s.JsonKey(name: 'Weight')
  final int weight;

  /// The action for the <code>Rule</code> that the request matched:
  /// <code>ALLOW</code>, <code>BLOCK</code>, or <code>COUNT</code>.
  @_s.JsonKey(name: 'Action')
  final String action;

  /// The name of the <code>Rule</code> that the request matched. For managed rule
  /// groups, the format for this name is <code>&lt;vendor name&gt;#&lt;managed
  /// rule group name&gt;#&lt;rule name&gt;</code>. For your own rule groups, the
  /// format for this name is <code>&lt;rule group name&gt;#&lt;rule
  /// name&gt;</code>. If the rule is not in a rule group, this field is absent.
  @_s.JsonKey(name: 'RuleNameWithinRuleGroup')
  final String ruleNameWithinRuleGroup;

  /// The time at which AWS WAF received the request from your AWS resource, in
  /// Unix time format (in seconds).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Timestamp')
  final DateTime timestamp;

  SampledHTTPRequest({
    @_s.required this.request,
    @_s.required this.weight,
    this.action,
    this.ruleNameWithinRuleGroup,
    this.timestamp,
  });
  factory SampledHTTPRequest.fromJson(Map<String, dynamic> json) =>
      _$SampledHTTPRequestFromJson(json);
}

enum Scope {
  @_s.JsonValue('CLOUDFRONT')
  cloudfront,
  @_s.JsonValue('REGIONAL')
  regional,
}

extension on Scope {
  String toValue() {
    switch (this) {
      case Scope.cloudfront:
        return 'CLOUDFRONT';
      case Scope.regional:
        return 'REGIONAL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// One of the headers in a web request, identified by name, for example,
/// <code>User-Agent</code> or <code>Referer</code>. This setting isn't case
/// sensitive.
///
/// This is used only to indicate the web request component for AWS WAF to
/// inspect, in the <a>FieldToMatch</a> specification.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SingleHeader {
  /// The name of the query header to inspect.
  @_s.JsonKey(name: 'Name')
  final String name;

  SingleHeader({
    @_s.required this.name,
  });
  factory SingleHeader.fromJson(Map<String, dynamic> json) =>
      _$SingleHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$SingleHeaderToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// One query argument in a web request, identified by name, for example
/// <i>UserName</i> or <i>SalesRegion</i>. The name can be up to 30 characters
/// long and isn't case sensitive.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SingleQueryArgument {
  /// The name of the query argument to inspect.
  @_s.JsonKey(name: 'Name')
  final String name;

  SingleQueryArgument({
    @_s.required this.name,
  });
  factory SingleQueryArgument.fromJson(Map<String, dynamic> json) =>
      _$SingleQueryArgumentFromJson(json);

  Map<String, dynamic> toJson() => _$SingleQueryArgumentToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule statement that compares a number of bytes against the size of a
/// request component, using a comparison operator, such as greater than (&gt;)
/// or less than (&lt;). For example, you can use a size constraint statement to
/// look for query strings that are longer than 100 bytes.
///
/// If you configure AWS WAF to inspect the request body, AWS WAF inspects only
/// the first 8192 bytes (8 KB). If the request body for your web requests never
/// exceeds 8192 bytes, you can create a size constraint condition and block
/// requests that have a request body greater than 8192 bytes.
///
/// If you choose URI for the value of Part of the request to filter on, the
/// slash (/) in the URI counts as one character. For example, the URI
/// <code>/logo.jpg</code> is nine characters long.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SizeConstraintStatement {
  /// The operator to use to compare the request part to the size setting.
  @_s.JsonKey(name: 'ComparisonOperator')
  final ComparisonOperator comparisonOperator;

  /// The part of a web request that you want AWS WAF to inspect. For more
  /// information, see <a>FieldToMatch</a>.
  @_s.JsonKey(name: 'FieldToMatch')
  final FieldToMatch fieldToMatch;

  /// The size, in byte, to compare to the request part, after any
  /// transformations.
  @_s.JsonKey(name: 'Size')
  final int size;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. If you specify one or
  /// more transformations in a rule statement, AWS WAF performs all
  /// transformations on the content of the request component identified by
  /// <code>FieldToMatch</code>, starting from the lowest priority setting, before
  /// inspecting the content for a match.
  @_s.JsonKey(name: 'TextTransformations')
  final List<TextTransformation> textTransformations;

  SizeConstraintStatement({
    @_s.required this.comparisonOperator,
    @_s.required this.fieldToMatch,
    @_s.required this.size,
    @_s.required this.textTransformations,
  });
  factory SizeConstraintStatement.fromJson(Map<String, dynamic> json) =>
      _$SizeConstraintStatementFromJson(json);

  Map<String, dynamic> toJson() => _$SizeConstraintStatementToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Attackers sometimes insert malicious SQL code into web requests in an effort
/// to extract data from your database. To allow or block web requests that
/// appear to contain malicious SQL code, create one or more SQL injection match
/// conditions. An SQL injection match condition identifies the part of web
/// requests, such as the URI or the query string, that you want AWS WAF to
/// inspect. Later in the process, when you create a web ACL, you specify
/// whether to allow or block requests that appear to contain malicious SQL
/// code.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SqliMatchStatement {
  /// The part of a web request that you want AWS WAF to inspect. For more
  /// information, see <a>FieldToMatch</a>.
  @_s.JsonKey(name: 'FieldToMatch')
  final FieldToMatch fieldToMatch;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. If you specify one or
  /// more transformations in a rule statement, AWS WAF performs all
  /// transformations on the content of the request component identified by
  /// <code>FieldToMatch</code>, starting from the lowest priority setting, before
  /// inspecting the content for a match.
  @_s.JsonKey(name: 'TextTransformations')
  final List<TextTransformation> textTransformations;

  SqliMatchStatement({
    @_s.required this.fieldToMatch,
    @_s.required this.textTransformations,
  });
  factory SqliMatchStatement.fromJson(Map<String, dynamic> json) =>
      _$SqliMatchStatementFromJson(json);

  Map<String, dynamic> toJson() => _$SqliMatchStatementToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The processing guidance for a <a>Rule</a>, used by AWS WAF to determine
/// whether a web request matches the rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Statement {
  /// A logical rule statement used to combine other rule statements with AND
  /// logic. You provide more than one <a>Statement</a> within the
  /// <code>AndStatement</code>.
  @_s.JsonKey(name: 'AndStatement')
  final AndStatement andStatement;

  /// A rule statement that defines a string match search for AWS WAF to apply to
  /// web requests. The byte match statement provides the bytes to search for, the
  /// location in requests that you want AWS WAF to search, and other settings.
  /// The bytes to search for are typically a string that corresponds with ASCII
  /// characters. In the AWS WAF console and the developer guide, this is refered
  /// to as a string match statement.
  @_s.JsonKey(name: 'ByteMatchStatement')
  final ByteMatchStatement byteMatchStatement;

  /// A rule statement used to identify web requests based on country of origin.
  @_s.JsonKey(name: 'GeoMatchStatement')
  final GeoMatchStatement geoMatchStatement;

  /// A rule statement used to detect web requests coming from particular IP
  /// addresses or address ranges. To use this, create an <a>IPSet</a> that
  /// specifies the addresses you want to detect, then use the ARN of that set in
  /// this statement. To create an IP set, see <a>CreateIPSet</a>.
  ///
  /// Each IP set rule statement references an IP set. You create and maintain the
  /// set independent of your rules. This allows you to use the single set in
  /// multiple rules. When you update the referenced set, AWS WAF automatically
  /// updates all rules that reference it.
  @_s.JsonKey(name: 'IPSetReferenceStatement')
  final IPSetReferenceStatement iPSetReferenceStatement;

  /// A rule statement used to run the rules that are defined in a managed rule
  /// group. To use this, provide the vendor name and the name of the rule group
  /// in this statement. You can retrieve the required names by calling
  /// <a>ListAvailableManagedRuleGroups</a>.
  ///
  /// You can't nest a <code>ManagedRuleGroupStatement</code>, for example for use
  /// inside a <code>NotStatement</code> or <code>OrStatement</code>. It can only
  /// be referenced as a top-level statement within a rule.
  @_s.JsonKey(name: 'ManagedRuleGroupStatement')
  final ManagedRuleGroupStatement managedRuleGroupStatement;

  /// A logical rule statement used to negate the results of another rule
  /// statement. You provide one <a>Statement</a> within the
  /// <code>NotStatement</code>.
  @_s.JsonKey(name: 'NotStatement')
  final NotStatement notStatement;

  /// A logical rule statement used to combine other rule statements with OR
  /// logic. You provide more than one <a>Statement</a> within the
  /// <code>OrStatement</code>.
  @_s.JsonKey(name: 'OrStatement')
  final OrStatement orStatement;

  /// A rate-based rule tracks the rate of requests for each originating IP
  /// address, and triggers the rule action when the rate exceeds a limit that you
  /// specify on the number of requests in any 5-minute time span. You can use
  /// this to put a temporary block on requests from an IP address that is sending
  /// excessive requests.
  ///
  /// When the rule action triggers, AWS WAF blocks additional requests from the
  /// IP address until the request rate falls below the limit.
  ///
  /// You can optionally nest another statement inside the rate-based statement,
  /// to narrow the scope of the rule so that it only counts requests that match
  /// the nested statement. For example, based on recent requests that you have
  /// seen from an attacker, you might create a rate-based rule with a nested AND
  /// rule statement that contains the following nested statements:
  ///
  /// <ul>
  /// <li>
  /// An IP match statement with an IP set that specified the address 192.0.2.44.
  /// </li>
  /// <li>
  /// A string match statement that searches in the User-Agent header for the
  /// string BadBot.
  /// </li>
  /// </ul>
  /// In this rate-based rule, you also define a rate limit. For this example, the
  /// rate limit is 1,000. Requests that meet both of the conditions in the
  /// statements are counted. If the count exceeds 1,000 requests per five
  /// minutes, the rule action triggers. Requests that do not meet both conditions
  /// are not counted towards the rate limit and are not affected by this rule.
  ///
  /// You cannot nest a <code>RateBasedStatement</code>, for example for use
  /// inside a <code>NotStatement</code> or <code>OrStatement</code>. It can only
  /// be referenced as a top-level statement within a rule.
  @_s.JsonKey(name: 'RateBasedStatement')
  final RateBasedStatement rateBasedStatement;

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
  /// AWS WAF automatically updates all rules that reference it.
  @_s.JsonKey(name: 'RegexPatternSetReferenceStatement')
  final RegexPatternSetReferenceStatement regexPatternSetReferenceStatement;

  /// A rule statement used to run the rules that are defined in a
  /// <a>RuleGroup</a>. To use this, create a rule group with your rules, then
  /// provide the ARN of the rule group in this statement.
  ///
  /// You cannot nest a <code>RuleGroupReferenceStatement</code>, for example for
  /// use inside a <code>NotStatement</code> or <code>OrStatement</code>. It can
  /// only be referenced as a top-level statement within a rule.
  @_s.JsonKey(name: 'RuleGroupReferenceStatement')
  final RuleGroupReferenceStatement ruleGroupReferenceStatement;

  /// A rule statement that compares a number of bytes against the size of a
  /// request component, using a comparison operator, such as greater than (&gt;)
  /// or less than (&lt;). For example, you can use a size constraint statement to
  /// look for query strings that are longer than 100 bytes.
  ///
  /// If you configure AWS WAF to inspect the request body, AWS WAF inspects only
  /// the first 8192 bytes (8 KB). If the request body for your web requests never
  /// exceeds 8192 bytes, you can create a size constraint condition and block
  /// requests that have a request body greater than 8192 bytes.
  ///
  /// If you choose URI for the value of Part of the request to filter on, the
  /// slash (/) in the URI counts as one character. For example, the URI
  /// <code>/logo.jpg</code> is nine characters long.
  @_s.JsonKey(name: 'SizeConstraintStatement')
  final SizeConstraintStatement sizeConstraintStatement;

  /// Attackers sometimes insert malicious SQL code into web requests in an effort
  /// to extract data from your database. To allow or block web requests that
  /// appear to contain malicious SQL code, create one or more SQL injection match
  /// conditions. An SQL injection match condition identifies the part of web
  /// requests, such as the URI or the query string, that you want AWS WAF to
  /// inspect. Later in the process, when you create a web ACL, you specify
  /// whether to allow or block requests that appear to contain malicious SQL
  /// code.
  @_s.JsonKey(name: 'SqliMatchStatement')
  final SqliMatchStatement sqliMatchStatement;

  /// A rule statement that defines a cross-site scripting (XSS) match search for
  /// AWS WAF to apply to web requests. XSS attacks are those where the attacker
  /// uses vulnerabilities in a benign website as a vehicle to inject malicious
  /// client-site scripts into other legitimate web browsers. The XSS match
  /// statement provides the location in requests that you want AWS WAF to search
  /// and text transformations to use on the search area before AWS WAF searches
  /// for character sequences that are likely to be malicious strings.
  @_s.JsonKey(name: 'XssMatchStatement')
  final XssMatchStatement xssMatchStatement;

  Statement({
    this.andStatement,
    this.byteMatchStatement,
    this.geoMatchStatement,
    this.iPSetReferenceStatement,
    this.managedRuleGroupStatement,
    this.notStatement,
    this.orStatement,
    this.rateBasedStatement,
    this.regexPatternSetReferenceStatement,
    this.ruleGroupReferenceStatement,
    this.sizeConstraintStatement,
    this.sqliMatchStatement,
    this.xssMatchStatement,
  });
  factory Statement.fromJson(Map<String, dynamic> json) =>
      _$StatementFromJson(json);

  Map<String, dynamic> toJson() => _$StatementToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A tag associated with an AWS resource. Tags are key:value pairs that you can
/// use to categorize and manage your resources, for purposes like billing or
/// other management. Typically, the tag key represents a category, such as
/// "environment", and the tag value represents a specific value within that
/// category, such as "test," "development," or "production". Or you might set
/// the tag key to "customer" and the value to the customer name or ID. You can
/// specify one or more tags to add to each AWS resource, up to 50 tags for a
/// resource.
///
/// You can tag the AWS resources that you manage through AWS WAF: web ACLs,
/// rule groups, IP sets, and regex pattern sets. You can't manage or view tags
/// through the AWS WAF console.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// Part of the key:value pair that defines a tag. You can use a tag key to
  /// describe a category of information, such as "customer." Tag keys are
  /// case-sensitive.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// Part of the key:value pair that defines a tag. You can use a tag value to
  /// describe a specific value within a category, such as "companyA" or
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

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The collection of tagging definitions for an AWS resource. Tags are
/// key:value pairs that you can use to categorize and manage your resources,
/// for purposes like billing or other management. Typically, the tag key
/// represents a category, such as "environment", and the tag value represents a
/// specific value within that category, such as "test," "development," or
/// "production". Or you might set the tag key to "customer" and the value to
/// the customer name or ID. You can specify one or more tags to add to each AWS
/// resource, up to 50 tags for a resource.
///
/// You can tag the AWS resources that you manage through AWS WAF: web ACLs,
/// rule groups, IP sets, and regex pattern sets. You can't manage or view tags
/// through the AWS WAF console.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagInfoForResource {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// The array of <a>Tag</a> objects defined for the resource.
  @_s.JsonKey(name: 'TagList')
  final List<Tag> tagList;

  TagInfoForResource({
    this.resourceARN,
    this.tagList,
  });
  factory TagInfoForResource.fromJson(Map<String, dynamic> json) =>
      _$TagInfoForResourceFromJson(json);
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

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Text transformations eliminate some of the unusual formatting that attackers
/// use in web requests in an effort to bypass detection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TextTransformation {
  /// Sets the relative processing order for multiple transformations that are
  /// defined for a rule statement. AWS WAF processes all transformations, from
  /// lowest priority to highest, before inspecting the transformed content. The
  /// priorities don't need to be consecutive, but they must all be different.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// You can specify the following transformation types:
  ///
  /// <b>CMD_LINE</b>
  ///
  /// When you're concerned that attackers are injecting an operating system
  /// command line command and using unusual formatting to disguise some or all of
  /// the command, use this option to perform the following transformations:
  ///
  /// <ul>
  /// <li>
  /// Delete the following characters: \ " ' ^
  /// </li>
  /// <li>
  /// Delete spaces before the following characters: / (
  /// </li>
  /// <li>
  /// Replace the following characters with a space: , ;
  /// </li>
  /// <li>
  /// Replace multiple spaces with one space
  /// </li>
  /// <li>
  /// Convert uppercase letters (A-Z) to lowercase (a-z)
  /// </li>
  /// </ul>
  /// <b>COMPRESS_WHITE_SPACE</b>
  ///
  /// Use this option to replace the following characters with a space character
  /// (decimal 32):
  ///
  /// <ul>
  /// <li>
  /// \f, formfeed, decimal 12
  /// </li>
  /// <li>
  /// \t, tab, decimal 9
  /// </li>
  /// <li>
  /// \n, newline, decimal 10
  /// </li>
  /// <li>
  /// \r, carriage return, decimal 13
  /// </li>
  /// <li>
  /// \v, vertical tab, decimal 11
  /// </li>
  /// <li>
  /// non-breaking space, decimal 160
  /// </li>
  /// </ul>
  /// <code>COMPRESS_WHITE_SPACE</code> also replaces multiple spaces with one
  /// space.
  ///
  /// <b>HTML_ENTITY_DECODE</b>
  ///
  /// Use this option to replace HTML-encoded characters with unencoded
  /// characters. <code>HTML_ENTITY_DECODE</code> performs the following
  /// operations:
  ///
  /// <ul>
  /// <li>
  /// Replaces <code>(ampersand)quot;</code> with <code>"</code>
  /// </li>
  /// <li>
  /// Replaces <code>(ampersand)nbsp;</code> with a non-breaking space, decimal
  /// 160
  /// </li>
  /// <li>
  /// Replaces <code>(ampersand)lt;</code> with a "less than" symbol
  /// </li>
  /// <li>
  /// Replaces <code>(ampersand)gt;</code> with <code>&gt;</code>
  /// </li>
  /// <li>
  /// Replaces characters that are represented in hexadecimal format,
  /// <code>(ampersand)#xhhhh;</code>, with the corresponding characters
  /// </li>
  /// <li>
  /// Replaces characters that are represented in decimal format,
  /// <code>(ampersand)#nnnn;</code>, with the corresponding characters
  /// </li>
  /// </ul>
  /// <b>LOWERCASE</b>
  ///
  /// Use this option to convert uppercase letters (A-Z) to lowercase (a-z).
  ///
  /// <b>URL_DECODE</b>
  ///
  /// Use this option to decode a URL-encoded value.
  ///
  /// <b>NONE</b>
  ///
  /// Specify <code>NONE</code> if you don't want any text transformations.
  @_s.JsonKey(name: 'Type')
  final TextTransformationType type;

  TextTransformation({
    @_s.required this.priority,
    @_s.required this.type,
  });
  factory TextTransformation.fromJson(Map<String, dynamic> json) =>
      _$TextTransformationFromJson(json);

  Map<String, dynamic> toJson() => _$TextTransformationToJson(this);
}

enum TextTransformationType {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('COMPRESS_WHITE_SPACE')
  compressWhiteSpace,
  @_s.JsonValue('HTML_ENTITY_DECODE')
  htmlEntityDecode,
  @_s.JsonValue('LOWERCASE')
  lowercase,
  @_s.JsonValue('CMD_LINE')
  cmdLine,
  @_s.JsonValue('URL_DECODE')
  urlDecode,
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// In a <a>GetSampledRequests</a> request, the <code>StartTime</code> and
/// <code>EndTime</code> objects specify the time range for which you want AWS
/// WAF to return a sample of web requests.
///
/// You must specify the times in Coordinated Universal Time (UTC) format. UTC
/// format includes the special designator, <code>Z</code>. For example,
/// <code>"2016-09-27T14:50Z"</code>. You can specify any time range in the
/// previous three hours.
///
/// In a <a>GetSampledRequests</a> response, the <code>StartTime</code> and
/// <code>EndTime</code> objects specify the time range for which AWS WAF
/// actually returned a sample of web requests. AWS WAF gets the specified
/// number of requests from among the first 5,000 requests that your AWS
/// resource receives during the specified time period. If your resource
/// receives more than 5,000 requests during that period, AWS WAF stops sampling
/// after the 5,000th request. In that case, <code>EndTime</code> is the time
/// that AWS WAF received the 5,000th request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimeWindow {
  /// The end of the time range from which you want
  /// <code>GetSampledRequests</code> to return a sample of the requests that your
  /// AWS resource received. You must specify the times in Coordinated Universal
  /// Time (UTC) format. UTC format includes the special designator,
  /// <code>Z</code>. For example, <code>"2016-09-27T14:50Z"</code>. You can
  /// specify any time range in the previous three hours.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The beginning of the time range from which you want
  /// <code>GetSampledRequests</code> to return a sample of the requests that your
  /// AWS resource received. You must specify the times in Coordinated Universal
  /// Time (UTC) format. UTC format includes the special designator,
  /// <code>Z</code>. For example, <code>"2016-09-27T14:50Z"</code>. You can
  /// specify any time range in the previous three hours.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  TimeWindow({
    @_s.required this.endTime,
    @_s.required this.startTime,
  });
  factory TimeWindow.fromJson(Map<String, dynamic> json) =>
      _$TimeWindowFromJson(json);

  Map<String, dynamic> toJson() => _$TimeWindowToJson(this);
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
class UpdateIPSetResponse {
  /// A token used for optimistic locking. AWS WAF returns this token to your
  /// update requests. You use <code>NextLockToken</code> in the same manner as
  /// you use <code>LockToken</code>.
  @_s.JsonKey(name: 'NextLockToken')
  final String nextLockToken;

  UpdateIPSetResponse({
    this.nextLockToken,
  });
  factory UpdateIPSetResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateIPSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRegexPatternSetResponse {
  /// A token used for optimistic locking. AWS WAF returns this token to your
  /// update requests. You use <code>NextLockToken</code> in the same manner as
  /// you use <code>LockToken</code>.
  @_s.JsonKey(name: 'NextLockToken')
  final String nextLockToken;

  UpdateRegexPatternSetResponse({
    this.nextLockToken,
  });
  factory UpdateRegexPatternSetResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRegexPatternSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRuleGroupResponse {
  /// A token used for optimistic locking. AWS WAF returns this token to your
  /// update requests. You use <code>NextLockToken</code> in the same manner as
  /// you use <code>LockToken</code>.
  @_s.JsonKey(name: 'NextLockToken')
  final String nextLockToken;

  UpdateRuleGroupResponse({
    this.nextLockToken,
  });
  factory UpdateRuleGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRuleGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateWebACLResponse {
  /// A token used for optimistic locking. AWS WAF returns this token to your
  /// update requests. You use <code>NextLockToken</code> in the same manner as
  /// you use <code>LockToken</code>.
  @_s.JsonKey(name: 'NextLockToken')
  final String nextLockToken;

  UpdateWebACLResponse({
    this.nextLockToken,
  });
  factory UpdateWebACLResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateWebACLResponseFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// The path component of the URI of a web request. This is the part of a web
/// request that identifies a resource, for example,
/// <code>/images/daily-ad.jpg</code>.
///
/// This is used only to indicate the web request component for AWS WAF to
/// inspect, in the <a>FieldToMatch</a> specification.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UriPath {
  UriPath();
  factory UriPath.fromJson(Map<String, dynamic> json) =>
      _$UriPathFromJson(json);

  Map<String, dynamic> toJson() => _$UriPathToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// Defines and enables Amazon CloudWatch metrics and web request sample
/// collection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VisibilityConfig {
  /// A boolean indicating whether the associated resource sends metrics to
  /// CloudWatch. For the list of available metrics, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/monitoring-cloudwatch.html#waf-metrics">AWS
  /// WAF Metrics</a>.
  @_s.JsonKey(name: 'CloudWatchMetricsEnabled')
  final bool cloudWatchMetricsEnabled;

  /// A name of the CloudWatch metric. The name can contain only the characters:
  /// A-Z, a-z, 0-9, - (hyphen), and _ (underscore). The name can be from one to
  /// 128 characters long. It can't contain whitespace or metric names reserved
  /// for AWS WAF, for example "All" and "Default_Action."
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// A boolean indicating whether AWS WAF should store a sampling of the web
  /// requests that match the rules. You can view the sampled requests through the
  /// AWS WAF console.
  @_s.JsonKey(name: 'SampledRequestsEnabled')
  final bool sampledRequestsEnabled;

  VisibilityConfig({
    @_s.required this.cloudWatchMetricsEnabled,
    @_s.required this.metricName,
    @_s.required this.sampledRequestsEnabled,
  });
  factory VisibilityConfig.fromJson(Map<String, dynamic> json) =>
      _$VisibilityConfigFromJson(json);

  Map<String, dynamic> toJson() => _$VisibilityConfigToJson(this);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A Web ACL defines a collection of rules to use to inspect and control web
/// requests. Each rule has an action defined (allow, block, or count) for
/// requests that match the statement of the rule. In the Web ACL, you assign a
/// default action to take (allow, block) for any request that does not match
/// any of the rules. The rules in a Web ACL can be a combination of the types
/// <a>Rule</a>, <a>RuleGroup</a>, and managed rule group. You can associate a
/// Web ACL with one or more AWS resources to protect. The resources can be
/// Amazon CloudFront, an Amazon API Gateway REST API, an Application Load
/// Balancer, or an AWS AppSync GraphQL API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WebACL {
  /// The Amazon Resource Name (ARN) of the Web ACL that you want to associate
  /// with the resource.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The action to perform if none of the <code>Rules</code> contained in the
  /// <code>WebACL</code> match.
  @_s.JsonKey(name: 'DefaultAction')
  final DefaultAction defaultAction;

  /// A unique identifier for the <code>WebACL</code>. This ID is returned in the
  /// responses to create and list commands. You use this ID to do things like
  /// get, update, and delete a <code>WebACL</code>.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the Web ACL. You cannot change the name of a Web ACL after you
  /// create it.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Defines and enables Amazon CloudWatch metrics and web request sample
  /// collection.
  @_s.JsonKey(name: 'VisibilityConfig')
  final VisibilityConfig visibilityConfig;

  /// The web ACL capacity units (WCUs) currently being used by this web ACL.
  ///
  /// AWS WAF uses WCUs to calculate and control the operating resources that are
  /// used to run your rules, rule groups, and web ACLs. AWS WAF calculates
  /// capacity differently for each rule type, to reflect the relative cost of
  /// each rule. Simple rules that cost little to run use fewer WCUs than more
  /// complex rules that use more processing power. Rule group capacity is fixed
  /// at creation, which helps users plan their web ACL WCU usage when they use a
  /// rule group. The WCU limit for web ACLs is 1,500.
  @_s.JsonKey(name: 'Capacity')
  final int capacity;

  /// A description of the Web ACL that helps with identification. You cannot
  /// change the description of a Web ACL after you create it.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Indicates whether this web ACL is managed by AWS Firewall Manager. If true,
  /// then only AWS Firewall Manager can delete the web ACL or any Firewall
  /// Manager rule groups in the web ACL.
  @_s.JsonKey(name: 'ManagedByFirewallManager')
  final bool managedByFirewallManager;

  /// The last set of rules for AWS WAF to process in the web ACL. This is defined
  /// in an AWS Firewall Manager WAF policy and contains only rule group
  /// references. You can't alter these. Any rules and rule groups that you define
  /// for the web ACL are prioritized before these.
  ///
  /// In the Firewall Manager WAF policy, the Firewall Manager administrator can
  /// define a set of rule groups to run first in the web ACL and a set of rule
  /// groups to run last. Within each set, the administrator prioritizes the rule
  /// groups, to determine their relative processing order.
  @_s.JsonKey(name: 'PostProcessFirewallManagerRuleGroups')
  final List<FirewallManagerRuleGroup> postProcessFirewallManagerRuleGroups;

  /// The first set of rules for AWS WAF to process in the web ACL. This is
  /// defined in an AWS Firewall Manager WAF policy and contains only rule group
  /// references. You can't alter these. Any rules and rule groups that you define
  /// for the web ACL are prioritized after these.
  ///
  /// In the Firewall Manager WAF policy, the Firewall Manager administrator can
  /// define a set of rule groups to run first in the web ACL and a set of rule
  /// groups to run last. Within each set, the administrator prioritizes the rule
  /// groups, to determine their relative processing order.
  @_s.JsonKey(name: 'PreProcessFirewallManagerRuleGroups')
  final List<FirewallManagerRuleGroup> preProcessFirewallManagerRuleGroups;

  /// The <a>Rule</a> statements used to identify the web requests that you want
  /// to allow, block, or count. Each rule includes one top-level statement that
  /// AWS WAF uses to identify matching web requests, and parameters that govern
  /// how AWS WAF handles them.
  @_s.JsonKey(name: 'Rules')
  final List<Rule> rules;

  WebACL({
    @_s.required this.arn,
    @_s.required this.defaultAction,
    @_s.required this.id,
    @_s.required this.name,
    @_s.required this.visibilityConfig,
    this.capacity,
    this.description,
    this.managedByFirewallManager,
    this.postProcessFirewallManagerRuleGroups,
    this.preProcessFirewallManagerRuleGroups,
    this.rules,
  });
  factory WebACL.fromJson(Map<String, dynamic> json) => _$WebACLFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// High-level information about a <a>WebACL</a>, returned by operations like
/// create and list. This provides information like the ID, that you can use to
/// retrieve and manage a <code>WebACL</code>, and the ARN, that you provide to
/// operations like <a>AssociateWebACL</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WebACLSummary {
  /// The Amazon Resource Name (ARN) of the entity.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// A description of the Web ACL that helps with identification. You cannot
  /// change the description of a Web ACL after you create it.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The unique identifier for the Web ACL. This ID is returned in the responses
  /// to create and list commands. You provide it to operations like update and
  /// delete.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// A token used for optimistic locking. AWS WAF returns a token to your get and
  /// list requests, to mark the state of the entity at the time of the request.
  /// To make changes to the entity associated with the token, you provide the
  /// token to operations like update and delete. AWS WAF uses the token to ensure
  /// that no changes have been made to the entity since you last retrieved it. If
  /// a change has been made, the update fails with a
  /// <code>WAFOptimisticLockException</code>. If this happens, perform another
  /// get, and use the new token returned by that operation.
  @_s.JsonKey(name: 'LockToken')
  final String lockToken;

  /// The name of the Web ACL. You cannot change the name of a Web ACL after you
  /// create it.
  @_s.JsonKey(name: 'Name')
  final String name;

  WebACLSummary({
    this.arn,
    this.description,
    this.id,
    this.lockToken,
    this.name,
  });
  factory WebACLSummary.fromJson(Map<String, dynamic> json) =>
      _$WebACLSummaryFromJson(json);
}

/// <note>
/// This is the latest version of <b>AWS WAF</b>, named AWS WAFV2, released in
/// November, 2019. For information, including how to migrate your AWS WAF
/// resources from the prior release, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>.
/// </note>
/// A rule statement that defines a cross-site scripting (XSS) match search for
/// AWS WAF to apply to web requests. XSS attacks are those where the attacker
/// uses vulnerabilities in a benign website as a vehicle to inject malicious
/// client-site scripts into other legitimate web browsers. The XSS match
/// statement provides the location in requests that you want AWS WAF to search
/// and text transformations to use on the search area before AWS WAF searches
/// for character sequences that are likely to be malicious strings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class XssMatchStatement {
  /// The part of a web request that you want AWS WAF to inspect. For more
  /// information, see <a>FieldToMatch</a>.
  @_s.JsonKey(name: 'FieldToMatch')
  final FieldToMatch fieldToMatch;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass detection. If you specify one or
  /// more transformations in a rule statement, AWS WAF performs all
  /// transformations on the content of the request component identified by
  /// <code>FieldToMatch</code>, starting from the lowest priority setting, before
  /// inspecting the content for a match.
  @_s.JsonKey(name: 'TextTransformations')
  final List<TextTransformation> textTransformations;

  XssMatchStatement({
    @_s.required this.fieldToMatch,
    @_s.required this.textTransformations,
  });
  factory XssMatchStatement.fromJson(Map<String, dynamic> json) =>
      _$XssMatchStatementFromJson(json);

  Map<String, dynamic> toJson() => _$XssMatchStatementToJson(this);
}

class WAFAssociatedItemException extends _s.GenericAwsException {
  WAFAssociatedItemException({String type, String message})
      : super(type: type, code: 'WAFAssociatedItemException', message: message);
}

class WAFDuplicateItemException extends _s.GenericAwsException {
  WAFDuplicateItemException({String type, String message})
      : super(type: type, code: 'WAFDuplicateItemException', message: message);
}

class WAFInternalErrorException extends _s.GenericAwsException {
  WAFInternalErrorException({String type, String message})
      : super(type: type, code: 'WAFInternalErrorException', message: message);
}

class WAFInvalidOperationException extends _s.GenericAwsException {
  WAFInvalidOperationException({String type, String message})
      : super(
            type: type, code: 'WAFInvalidOperationException', message: message);
}

class WAFInvalidParameterException extends _s.GenericAwsException {
  WAFInvalidParameterException({String type, String message})
      : super(
            type: type, code: 'WAFInvalidParameterException', message: message);
}

class WAFInvalidPermissionPolicyException extends _s.GenericAwsException {
  WAFInvalidPermissionPolicyException({String type, String message})
      : super(
            type: type,
            code: 'WAFInvalidPermissionPolicyException',
            message: message);
}

class WAFInvalidResourceException extends _s.GenericAwsException {
  WAFInvalidResourceException({String type, String message})
      : super(
            type: type, code: 'WAFInvalidResourceException', message: message);
}

class WAFLimitsExceededException extends _s.GenericAwsException {
  WAFLimitsExceededException({String type, String message})
      : super(type: type, code: 'WAFLimitsExceededException', message: message);
}

class WAFNonexistentItemException extends _s.GenericAwsException {
  WAFNonexistentItemException({String type, String message})
      : super(
            type: type, code: 'WAFNonexistentItemException', message: message);
}

class WAFOptimisticLockException extends _s.GenericAwsException {
  WAFOptimisticLockException({String type, String message})
      : super(type: type, code: 'WAFOptimisticLockException', message: message);
}

class WAFServiceLinkedRoleErrorException extends _s.GenericAwsException {
  WAFServiceLinkedRoleErrorException({String type, String message})
      : super(
            type: type,
            code: 'WAFServiceLinkedRoleErrorException',
            message: message);
}

class WAFSubscriptionNotFoundException extends _s.GenericAwsException {
  WAFSubscriptionNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'WAFSubscriptionNotFoundException',
            message: message);
}

class WAFTagOperationException extends _s.GenericAwsException {
  WAFTagOperationException({String type, String message})
      : super(type: type, code: 'WAFTagOperationException', message: message);
}

class WAFTagOperationInternalErrorException extends _s.GenericAwsException {
  WAFTagOperationInternalErrorException({String type, String message})
      : super(
            type: type,
            code: 'WAFTagOperationInternalErrorException',
            message: message);
}

class WAFUnavailableEntityException extends _s.GenericAwsException {
  WAFUnavailableEntityException({String type, String message})
      : super(
            type: type,
            code: 'WAFUnavailableEntityException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'WAFAssociatedItemException': (type, message) =>
      WAFAssociatedItemException(type: type, message: message),
  'WAFDuplicateItemException': (type, message) =>
      WAFDuplicateItemException(type: type, message: message),
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
};
