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

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// This is the <i>AWS WAF Classic API Reference</i> for using AWS WAF Classic
/// with Amazon CloudFront. The AWS WAF Classic actions and data types listed in
/// the reference are available for protecting Amazon CloudFront distributions.
/// You can use these actions and data types via the endpoint
/// <i>waf.amazonaws.com</i>. This guide is for developers who need detailed
/// information about the AWS WAF Classic API actions, data types, and errors.
/// For detailed information about AWS WAF Classic features and an overview of
/// how to use the AWS WAF Classic API, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
class Waf {
  final _s.JsonProtocol _protocol;
  Waf({
    String? region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'waf',
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

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Creates a <code>ByteMatchSet</code>. You then use
  /// <a>UpdateByteMatchSet</a> to identify the part of a web request that you
  /// want AWS WAF to inspect, such as the values of the <code>User-Agent</code>
  /// header or the query string. For example, you can create a
  /// <code>ByteMatchSet</code> that matches any requests with
  /// <code>User-Agent</code> headers that contain the string
  /// <code>BadBot</code>. You can then configure AWS WAF to reject those
  /// requests.
  ///
  /// To create and configure a <code>ByteMatchSet</code>, perform the following
  /// steps:
  /// <ol>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>CreateByteMatchSet</code>
  /// request.
  /// </li>
  /// <li>
  /// Submit a <code>CreateByteMatchSet</code> request.
  /// </li>
  /// <li>
  /// Use <code>GetChangeToken</code> to get the change token that you provide
  /// in the <code>ChangeToken</code> parameter of an
  /// <code>UpdateByteMatchSet</code> request.
  /// </li>
  /// <li>
  /// Submit an <a>UpdateByteMatchSet</a> request to specify the part of the
  /// request that you want AWS WAF to inspect (for example, the header or the
  /// URI) and the value that you want AWS WAF to watch for.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFDisallowedNameException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFStaleDataException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [name] :
  /// A friendly name or description of the <a>ByteMatchSet</a>. You can't
  /// change <code>Name</code> after you create a <code>ByteMatchSet</code>.
  Future<CreateByteMatchSetResponse> createByteMatchSet({
    required String changeToken,
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.CreateByteMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'Name': name,
      },
    );

    return CreateByteMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Creates an <a>GeoMatchSet</a>, which you use to specify which web requests
  /// you want to allow or block based on the country that the requests
  /// originate from. For example, if you're receiving a lot of requests from
  /// one or more countries and you want to block the requests, you can create
  /// an <code>GeoMatchSet</code> that contains those countries and then
  /// configure AWS WAF to block the requests.
  ///
  /// To create and configure a <code>GeoMatchSet</code>, perform the following
  /// steps:
  /// <ol>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>CreateGeoMatchSet</code>
  /// request.
  /// </li>
  /// <li>
  /// Submit a <code>CreateGeoMatchSet</code> request.
  /// </li>
  /// <li>
  /// Use <code>GetChangeToken</code> to get the change token that you provide
  /// in the <code>ChangeToken</code> parameter of an <a>UpdateGeoMatchSet</a>
  /// request.
  /// </li>
  /// <li>
  /// Submit an <code>UpdateGeoMatchSetSet</code> request to specify the
  /// countries that you want AWS WAF to watch for.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFDisallowedNameException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [name] :
  /// A friendly name or description of the <a>GeoMatchSet</a>. You can't change
  /// <code>Name</code> after you create the <code>GeoMatchSet</code>.
  Future<CreateGeoMatchSetResponse> createGeoMatchSet({
    required String changeToken,
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.CreateGeoMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'Name': name,
      },
    );

    return CreateGeoMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Creates an <a>IPSet</a>, which you use to specify which web requests that
  /// you want to allow or block based on the IP addresses that the requests
  /// originate from. For example, if you're receiving a lot of requests from
  /// one or more individual IP addresses or one or more ranges of IP addresses
  /// and you want to block the requests, you can create an <code>IPSet</code>
  /// that contains those IP addresses and then configure AWS WAF to block the
  /// requests.
  ///
  /// To create and configure an <code>IPSet</code>, perform the following
  /// steps:
  /// <ol>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>CreateIPSet</code> request.
  /// </li>
  /// <li>
  /// Submit a <code>CreateIPSet</code> request.
  /// </li>
  /// <li>
  /// Use <code>GetChangeToken</code> to get the change token that you provide
  /// in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a>
  /// request.
  /// </li>
  /// <li>
  /// Submit an <code>UpdateIPSet</code> request to specify the IP addresses
  /// that you want AWS WAF to watch for.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFDisallowedNameException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [name] :
  /// A friendly name or description of the <a>IPSet</a>. You can't change
  /// <code>Name</code> after you create the <code>IPSet</code>.
  Future<CreateIPSetResponse> createIPSet({
    required String changeToken,
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.CreateIPSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'Name': name,
      },
    );

    return CreateIPSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Creates a <a>RateBasedRule</a>. The <code>RateBasedRule</code> contains a
  /// <code>RateLimit</code>, which specifies the maximum number of requests
  /// that AWS WAF allows from a specified IP address in a five-minute period.
  /// The <code>RateBasedRule</code> also contains the <code>IPSet</code>
  /// objects, <code>ByteMatchSet</code> objects, and other predicates that
  /// identify the requests that you want to count or block if these requests
  /// exceed the <code>RateLimit</code>.
  ///
  /// If you add more than one predicate to a <code>RateBasedRule</code>, a
  /// request not only must exceed the <code>RateLimit</code>, but it also must
  /// match all the conditions to be counted or blocked. For example, suppose
  /// you add the following to a <code>RateBasedRule</code>:
  ///
  /// <ul>
  /// <li>
  /// An <code>IPSet</code> that matches the IP address
  /// <code>192.0.2.44/32</code>
  /// </li>
  /// <li>
  /// A <code>ByteMatchSet</code> that matches <code>BadBot</code> in the
  /// <code>User-Agent</code> header
  /// </li>
  /// </ul>
  /// Further, you specify a <code>RateLimit</code> of 1,000.
  ///
  /// You then add the <code>RateBasedRule</code> to a <code>WebACL</code> and
  /// specify that you want to block requests that meet the conditions in the
  /// rule. For a request to be blocked, it must come from the IP address
  /// 192.0.2.44 <i>and</i> the <code>User-Agent</code> header in the request
  /// must contain the value <code>BadBot</code>. Further, requests that match
  /// these two conditions must be received at a rate of more than 1,000
  /// requests every five minutes. If both conditions are met and the rate is
  /// exceeded, AWS WAF blocks the requests. If the rate drops below 1,000 for a
  /// five-minute period, AWS WAF no longer blocks the requests.
  ///
  /// As a second example, suppose you want to limit requests to a particular
  /// page on your site. To do this, you could add the following to a
  /// <code>RateBasedRule</code>:
  ///
  /// <ul>
  /// <li>
  /// A <code>ByteMatchSet</code> with <code>FieldToMatch</code> of
  /// <code>URI</code>
  /// </li>
  /// <li>
  /// A <code>PositionalConstraint</code> of <code>STARTS_WITH</code>
  /// </li>
  /// <li>
  /// A <code>TargetString</code> of <code>login</code>
  /// </li>
  /// </ul>
  /// Further, you specify a <code>RateLimit</code> of 1,000.
  ///
  /// By adding this <code>RateBasedRule</code> to a <code>WebACL</code>, you
  /// could limit requests to your login page without affecting the rest of your
  /// site.
  ///
  /// To create and configure a <code>RateBasedRule</code>, perform the
  /// following steps:
  /// <ol>
  /// <li>
  /// Create and update the predicates that you want to include in the rule. For
  /// more information, see <a>CreateByteMatchSet</a>, <a>CreateIPSet</a>, and
  /// <a>CreateSqlInjectionMatchSet</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>CreateRule</code> request.
  /// </li>
  /// <li>
  /// Submit a <code>CreateRateBasedRule</code> request.
  /// </li>
  /// <li>
  /// Use <code>GetChangeToken</code> to get the change token that you provide
  /// in the <code>ChangeToken</code> parameter of an <a>UpdateRule</a> request.
  /// </li>
  /// <li>
  /// Submit an <code>UpdateRateBasedRule</code> request to specify the
  /// predicates that you want to include in the rule.
  /// </li>
  /// <li>
  /// Create and update a <code>WebACL</code> that contains the
  /// <code>RateBasedRule</code>. For more information, see <a>CreateWebACL</a>.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFDisallowedNameException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFBadRequestException].
  ///
  /// Parameter [changeToken] :
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>CreateRateBasedRule</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  ///
  /// Parameter [metricName] :
  /// A friendly name or description for the metrics for this
  /// <code>RateBasedRule</code>. The name can contain only alphanumeric
  /// characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length
  /// one. It can't contain whitespace or metric names reserved for AWS WAF,
  /// including "All" and "Default_Action." You can't change the name of the
  /// metric after you create the <code>RateBasedRule</code>.
  ///
  /// Parameter [name] :
  /// A friendly name or description of the <a>RateBasedRule</a>. You can't
  /// change the name of a <code>RateBasedRule</code> after you create it.
  ///
  /// Parameter [rateKey] :
  /// The field that AWS WAF uses to determine if requests are likely arriving
  /// from a single source and thus subject to rate monitoring. The only valid
  /// value for <code>RateKey</code> is <code>IP</code>. <code>IP</code>
  /// indicates that requests that arrive from the same IP address are subject
  /// to the <code>RateLimit</code> that is specified in the
  /// <code>RateBasedRule</code>.
  ///
  /// Parameter [rateLimit] :
  /// The maximum number of requests, which have an identical value in the field
  /// that is specified by <code>RateKey</code>, allowed in a five-minute
  /// period. If the number of requests exceeds the <code>RateLimit</code> and
  /// the other predicates specified in the rule are also met, AWS WAF triggers
  /// the action that is specified for this rule.
  ///
  /// Parameter [tags] :
  /// <p/>
  Future<CreateRateBasedRuleResponse> createRateBasedRule({
    required String changeToken,
    required String metricName,
    required String name,
    required RateKey rateKey,
    required int rateLimit,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'rateLimit',
      rateLimit,
      100,
      2000000000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.CreateRateBasedRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'MetricName': metricName,
        'Name': name,
        'RateKey': rateKey.toValue(),
        'RateLimit': rateLimit,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRateBasedRuleResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Creates a <a>RegexMatchSet</a>. You then use <a>UpdateRegexMatchSet</a> to
  /// identify the part of a web request that you want AWS WAF to inspect, such
  /// as the values of the <code>User-Agent</code> header or the query string.
  /// For example, you can create a <code>RegexMatchSet</code> that contains a
  /// <code>RegexMatchTuple</code> that looks for any requests with
  /// <code>User-Agent</code> headers that match a <code>RegexPatternSet</code>
  /// with pattern <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to
  /// reject those requests.
  ///
  /// To create and configure a <code>RegexMatchSet</code>, perform the
  /// following steps:
  /// <ol>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>CreateRegexMatchSet</code>
  /// request.
  /// </li>
  /// <li>
  /// Submit a <code>CreateRegexMatchSet</code> request.
  /// </li>
  /// <li>
  /// Use <code>GetChangeToken</code> to get the change token that you provide
  /// in the <code>ChangeToken</code> parameter of an
  /// <code>UpdateRegexMatchSet</code> request.
  /// </li>
  /// <li>
  /// Submit an <a>UpdateRegexMatchSet</a> request to specify the part of the
  /// request that you want AWS WAF to inspect (for example, the header or the
  /// URI) and the value, using a <code>RegexPatternSet</code>, that you want
  /// AWS WAF to watch for.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFDisallowedNameException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [name] :
  /// A friendly name or description of the <a>RegexMatchSet</a>. You can't
  /// change <code>Name</code> after you create a <code>RegexMatchSet</code>.
  Future<CreateRegexMatchSetResponse> createRegexMatchSet({
    required String changeToken,
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.CreateRegexMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'Name': name,
      },
    );

    return CreateRegexMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Creates a <code>RegexPatternSet</code>. You then use
  /// <a>UpdateRegexPatternSet</a> to specify the regular expression (regex)
  /// pattern that you want AWS WAF to search for, such as
  /// <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those
  /// requests.
  ///
  /// To create and configure a <code>RegexPatternSet</code>, perform the
  /// following steps:
  /// <ol>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>CreateRegexPatternSet</code>
  /// request.
  /// </li>
  /// <li>
  /// Submit a <code>CreateRegexPatternSet</code> request.
  /// </li>
  /// <li>
  /// Use <code>GetChangeToken</code> to get the change token that you provide
  /// in the <code>ChangeToken</code> parameter of an
  /// <code>UpdateRegexPatternSet</code> request.
  /// </li>
  /// <li>
  /// Submit an <a>UpdateRegexPatternSet</a> request to specify the string that
  /// you want AWS WAF to watch for.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFDisallowedNameException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [name] :
  /// A friendly name or description of the <a>RegexPatternSet</a>. You can't
  /// change <code>Name</code> after you create a <code>RegexPatternSet</code>.
  Future<CreateRegexPatternSetResponse> createRegexPatternSet({
    required String changeToken,
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.CreateRegexPatternSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'Name': name,
      },
    );

    return CreateRegexPatternSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Creates a <code>Rule</code>, which contains the <code>IPSet</code>
  /// objects, <code>ByteMatchSet</code> objects, and other predicates that
  /// identify the requests that you want to block. If you add more than one
  /// predicate to a <code>Rule</code>, a request must match all of the
  /// specifications to be allowed or blocked. For example, suppose that you add
  /// the following to a <code>Rule</code>:
  ///
  /// <ul>
  /// <li>
  /// An <code>IPSet</code> that matches the IP address
  /// <code>192.0.2.44/32</code>
  /// </li>
  /// <li>
  /// A <code>ByteMatchSet</code> that matches <code>BadBot</code> in the
  /// <code>User-Agent</code> header
  /// </li>
  /// </ul>
  /// You then add the <code>Rule</code> to a <code>WebACL</code> and specify
  /// that you want to blocks requests that satisfy the <code>Rule</code>. For a
  /// request to be blocked, it must come from the IP address 192.0.2.44
  /// <i>and</i> the <code>User-Agent</code> header in the request must contain
  /// the value <code>BadBot</code>.
  ///
  /// To create and configure a <code>Rule</code>, perform the following steps:
  /// <ol>
  /// <li>
  /// Create and update the predicates that you want to include in the
  /// <code>Rule</code>. For more information, see <a>CreateByteMatchSet</a>,
  /// <a>CreateIPSet</a>, and <a>CreateSqlInjectionMatchSet</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>CreateRule</code> request.
  /// </li>
  /// <li>
  /// Submit a <code>CreateRule</code> request.
  /// </li>
  /// <li>
  /// Use <code>GetChangeToken</code> to get the change token that you provide
  /// in the <code>ChangeToken</code> parameter of an <a>UpdateRule</a> request.
  /// </li>
  /// <li>
  /// Submit an <code>UpdateRule</code> request to specify the predicates that
  /// you want to include in the <code>Rule</code>.
  /// </li>
  /// <li>
  /// Create and update a <code>WebACL</code> that contains the
  /// <code>Rule</code>. For more information, see <a>CreateWebACL</a>.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFDisallowedNameException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFBadRequestException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [metricName] :
  /// A friendly name or description for the metrics for this <code>Rule</code>.
  /// The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with
  /// maximum length 128 and minimum length one. It can't contain whitespace or
  /// metric names reserved for AWS WAF, including "All" and "Default_Action."
  /// You can't change the name of the metric after you create the
  /// <code>Rule</code>.
  ///
  /// Parameter [name] :
  /// A friendly name or description of the <a>Rule</a>. You can't change the
  /// name of a <code>Rule</code> after you create it.
  ///
  /// Parameter [tags] :
  /// <p/>
  Future<CreateRuleResponse> createRule({
    required String changeToken,
    required String metricName,
    required String name,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.CreateRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'MetricName': metricName,
        'Name': name,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRuleResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Creates a <code>RuleGroup</code>. A rule group is a collection of
  /// predefined rules that you add to a web ACL. You use <a>UpdateRuleGroup</a>
  /// to add rules to the rule group.
  ///
  /// Rule groups are subject to the following limits:
  ///
  /// <ul>
  /// <li>
  /// Three rule groups per account. You can request an increase to this limit
  /// by contacting customer support.
  /// </li>
  /// <li>
  /// One rule group per web ACL.
  /// </li>
  /// <li>
  /// Ten rules per rule group.
  /// </li>
  /// </ul>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFDisallowedNameException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFBadRequestException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [metricName] :
  /// A friendly name or description for the metrics for this
  /// <code>RuleGroup</code>. The name can contain only alphanumeric characters
  /// (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't
  /// contain whitespace or metric names reserved for AWS WAF, including "All"
  /// and "Default_Action." You can't change the name of the metric after you
  /// create the <code>RuleGroup</code>.
  ///
  /// Parameter [name] :
  /// A friendly name or description of the <a>RuleGroup</a>. You can't change
  /// <code>Name</code> after you create a <code>RuleGroup</code>.
  ///
  /// Parameter [tags] :
  /// <p/>
  Future<CreateRuleGroupResponse> createRuleGroup({
    required String changeToken,
    required String metricName,
    required String name,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.CreateRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'MetricName': metricName,
        'Name': name,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Creates a <code>SizeConstraintSet</code>. You then use
  /// <a>UpdateSizeConstraintSet</a> to identify the part of a web request that
  /// you want AWS WAF to check for length, such as the length of the
  /// <code>User-Agent</code> header or the length of the query string. For
  /// example, you can create a <code>SizeConstraintSet</code> that matches any
  /// requests that have a query string that is longer than 100 bytes. You can
  /// then configure AWS WAF to reject those requests.
  ///
  /// To create and configure a <code>SizeConstraintSet</code>, perform the
  /// following steps:
  /// <ol>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a
  /// <code>CreateSizeConstraintSet</code> request.
  /// </li>
  /// <li>
  /// Submit a <code>CreateSizeConstraintSet</code> request.
  /// </li>
  /// <li>
  /// Use <code>GetChangeToken</code> to get the change token that you provide
  /// in the <code>ChangeToken</code> parameter of an
  /// <code>UpdateSizeConstraintSet</code> request.
  /// </li>
  /// <li>
  /// Submit an <a>UpdateSizeConstraintSet</a> request to specify the part of
  /// the request that you want AWS WAF to inspect (for example, the header or
  /// the URI) and the value that you want AWS WAF to watch for.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFDisallowedNameException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [name] :
  /// A friendly name or description of the <a>SizeConstraintSet</a>. You can't
  /// change <code>Name</code> after you create a
  /// <code>SizeConstraintSet</code>.
  Future<CreateSizeConstraintSetResponse> createSizeConstraintSet({
    required String changeToken,
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.CreateSizeConstraintSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'Name': name,
      },
    );

    return CreateSizeConstraintSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Creates a <a>SqlInjectionMatchSet</a>, which you use to allow, block, or
  /// count requests that contain snippets of SQL code in a specified part of
  /// web requests. AWS WAF searches for character sequences that are likely to
  /// be malicious strings.
  ///
  /// To create and configure a <code>SqlInjectionMatchSet</code>, perform the
  /// following steps:
  /// <ol>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a
  /// <code>CreateSqlInjectionMatchSet</code> request.
  /// </li>
  /// <li>
  /// Submit a <code>CreateSqlInjectionMatchSet</code> request.
  /// </li>
  /// <li>
  /// Use <code>GetChangeToken</code> to get the change token that you provide
  /// in the <code>ChangeToken</code> parameter of an
  /// <a>UpdateSqlInjectionMatchSet</a> request.
  /// </li>
  /// <li>
  /// Submit an <a>UpdateSqlInjectionMatchSet</a> request to specify the parts
  /// of web requests in which you want to allow, block, or count malicious SQL
  /// code.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFDisallowedNameException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFStaleDataException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [name] :
  /// A friendly name or description for the <a>SqlInjectionMatchSet</a> that
  /// you're creating. You can't change <code>Name</code> after you create the
  /// <code>SqlInjectionMatchSet</code>.
  Future<CreateSqlInjectionMatchSetResponse> createSqlInjectionMatchSet({
    required String changeToken,
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.CreateSqlInjectionMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'Name': name,
      },
    );

    return CreateSqlInjectionMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Creates a <code>WebACL</code>, which contains the <code>Rules</code> that
  /// identify the CloudFront web requests that you want to allow, block, or
  /// count. AWS WAF evaluates <code>Rules</code> in order based on the value of
  /// <code>Priority</code> for each <code>Rule</code>.
  ///
  /// You also specify a default action, either <code>ALLOW</code> or
  /// <code>BLOCK</code>. If a web request doesn't match any of the
  /// <code>Rules</code> in a <code>WebACL</code>, AWS WAF responds to the
  /// request with the default action.
  ///
  /// To create and configure a <code>WebACL</code>, perform the following
  /// steps:
  /// <ol>
  /// <li>
  /// Create and update the <code>ByteMatchSet</code> objects and other
  /// predicates that you want to include in <code>Rules</code>. For more
  /// information, see <a>CreateByteMatchSet</a>, <a>UpdateByteMatchSet</a>,
  /// <a>CreateIPSet</a>, <a>UpdateIPSet</a>, <a>CreateSqlInjectionMatchSet</a>,
  /// and <a>UpdateSqlInjectionMatchSet</a>.
  /// </li>
  /// <li>
  /// Create and update the <code>Rules</code> that you want to include in the
  /// <code>WebACL</code>. For more information, see <a>CreateRule</a> and
  /// <a>UpdateRule</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>CreateWebACL</code> request.
  /// </li>
  /// <li>
  /// Submit a <code>CreateWebACL</code> request.
  /// </li>
  /// <li>
  /// Use <code>GetChangeToken</code> to get the change token that you provide
  /// in the <code>ChangeToken</code> parameter of an <a>UpdateWebACL</a>
  /// request.
  /// </li>
  /// <li>
  /// Submit an <a>UpdateWebACL</a> request to specify the <code>Rules</code>
  /// that you want to include in the <code>WebACL</code>, to specify the
  /// default action, and to associate the <code>WebACL</code> with a CloudFront
  /// distribution.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFDisallowedNameException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  /// May throw [WAFBadRequestException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [defaultAction] :
  /// The action that you want AWS WAF to take when a request doesn't match the
  /// criteria specified in any of the <code>Rule</code> objects that are
  /// associated with the <code>WebACL</code>.
  ///
  /// Parameter [metricName] :
  /// A friendly name or description for the metrics for this
  /// <code>WebACL</code>.The name can contain only alphanumeric characters
  /// (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't
  /// contain whitespace or metric names reserved for AWS WAF, including "All"
  /// and "Default_Action." You can't change <code>MetricName</code> after you
  /// create the <code>WebACL</code>.
  ///
  /// Parameter [name] :
  /// A friendly name or description of the <a>WebACL</a>. You can't change
  /// <code>Name</code> after you create the <code>WebACL</code>.
  ///
  /// Parameter [tags] :
  /// <p/>
  Future<CreateWebACLResponse> createWebACL({
    required String changeToken,
    required WafAction defaultAction,
    required String metricName,
    required String name,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.CreateWebACL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'DefaultAction': defaultAction,
        'MetricName': metricName,
        'Name': name,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateWebACLResponse.fromJson(jsonResponse.body);
  }

  /// Creates an AWS CloudFormation WAFV2 template for the specified web ACL in
  /// the specified Amazon S3 bucket. Then, in CloudFormation, you create a
  /// stack from the template, to create the web ACL and its resources in AWS
  /// WAFV2. Use this to migrate your AWS WAF Classic web ACL to the latest
  /// version of AWS WAF.
  ///
  /// This is part of a larger migration procedure for web ACLs from AWS WAF
  /// Classic to the latest version of AWS WAF. For the full procedure,
  /// including caveats and manual steps to complete the migration and switch
  /// over to the new web ACL, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-migrating-from-classic.html">Migrating
  /// your AWS WAF Classic resources to AWS WAF</a> in the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFEntityMigrationException].
  ///
  /// Parameter [ignoreUnsupportedType] :
  /// Indicates whether to exclude entities that can't be migrated or to stop
  /// the migration. Set this to true to ignore unsupported entities in the web
  /// ACL during the migration. Otherwise, if AWS WAF encounters unsupported
  /// entities, it stops the process and throws an exception.
  ///
  /// Parameter [s3BucketName] :
  /// The name of the Amazon S3 bucket to store the CloudFormation template in.
  /// The S3 bucket must be configured as follows for the migration:
  ///
  /// <ul>
  /// <li>
  /// The bucket name must start with <code>aws-waf-migration-</code>. For
  /// example, <code>aws-waf-migration-my-web-acl</code>.
  /// </li>
  /// <li>
  /// The bucket must be in the Region where you are deploying the template. For
  /// example, for a web ACL in us-west-2, you must use an Amazon S3 bucket in
  /// us-west-2 and you must deploy the template stack to us-west-2.
  /// </li>
  /// <li>
  /// The bucket policies must permit the migration process to write data. For
  /// listings of the bucket policies, see the Examples section.
  /// </li>
  /// </ul>
  ///
  /// Parameter [webACLId] :
  /// The UUID of the WAF Classic web ACL that you want to migrate to WAF v2.
  Future<CreateWebACLMigrationStackResponse> createWebACLMigrationStack({
    required bool ignoreUnsupportedType,
    required String s3BucketName,
    required String webACLId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.CreateWebACLMigrationStack'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IgnoreUnsupportedType': ignoreUnsupportedType,
        'S3BucketName': s3BucketName,
        'WebACLId': webACLId,
      },
    );

    return CreateWebACLMigrationStackResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Creates an <a>XssMatchSet</a>, which you use to allow, block, or count
  /// requests that contain cross-site scripting attacks in the specified part
  /// of web requests. AWS WAF searches for character sequences that are likely
  /// to be malicious strings.
  ///
  /// To create and configure an <code>XssMatchSet</code>, perform the following
  /// steps:
  /// <ol>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>CreateXssMatchSet</code>
  /// request.
  /// </li>
  /// <li>
  /// Submit a <code>CreateXssMatchSet</code> request.
  /// </li>
  /// <li>
  /// Use <code>GetChangeToken</code> to get the change token that you provide
  /// in the <code>ChangeToken</code> parameter of an <a>UpdateXssMatchSet</a>
  /// request.
  /// </li>
  /// <li>
  /// Submit an <a>UpdateXssMatchSet</a> request to specify the parts of web
  /// requests in which you want to allow, block, or count cross-site scripting
  /// attacks.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFDisallowedNameException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFStaleDataException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [name] :
  /// A friendly name or description for the <a>XssMatchSet</a> that you're
  /// creating. You can't change <code>Name</code> after you create the
  /// <code>XssMatchSet</code>.
  Future<CreateXssMatchSetResponse> createXssMatchSet({
    required String changeToken,
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.CreateXssMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'Name': name,
      },
    );

    return CreateXssMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Permanently deletes a <a>ByteMatchSet</a>. You can't delete a
  /// <code>ByteMatchSet</code> if it's still used in any <code>Rules</code> or
  /// if it still includes any <a>ByteMatchTuple</a> objects (any filters).
  ///
  /// If you just want to remove a <code>ByteMatchSet</code> from a
  /// <code>Rule</code>, use <a>UpdateRule</a>.
  ///
  /// To permanently delete a <code>ByteMatchSet</code>, perform the following
  /// steps:
  /// <ol>
  /// <li>
  /// Update the <code>ByteMatchSet</code> to remove filters, if any. For more
  /// information, see <a>UpdateByteMatchSet</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>DeleteByteMatchSet</code>
  /// request.
  /// </li>
  /// <li>
  /// Submit a <code>DeleteByteMatchSet</code> request.
  /// </li> </ol>
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFStaleDataException].
  /// May throw [WAFNonEmptyEntityException].
  ///
  /// Parameter [byteMatchSetId] :
  /// The <code>ByteMatchSetId</code> of the <a>ByteMatchSet</a> that you want
  /// to delete. <code>ByteMatchSetId</code> is returned by
  /// <a>CreateByteMatchSet</a> and by <a>ListByteMatchSets</a>.
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  Future<DeleteByteMatchSetResponse> deleteByteMatchSet({
    required String byteMatchSetId,
    required String changeToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.DeleteByteMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ByteMatchSetId': byteMatchSetId,
        'ChangeToken': changeToken,
      },
    );

    return DeleteByteMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Permanently deletes a <a>GeoMatchSet</a>. You can't delete a
  /// <code>GeoMatchSet</code> if it's still used in any <code>Rules</code> or
  /// if it still includes any countries.
  ///
  /// If you just want to remove a <code>GeoMatchSet</code> from a
  /// <code>Rule</code>, use <a>UpdateRule</a>.
  ///
  /// To permanently delete a <code>GeoMatchSet</code> from AWS WAF, perform the
  /// following steps:
  /// <ol>
  /// <li>
  /// Update the <code>GeoMatchSet</code> to remove any countries. For more
  /// information, see <a>UpdateGeoMatchSet</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>DeleteGeoMatchSet</code>
  /// request.
  /// </li>
  /// <li>
  /// Submit a <code>DeleteGeoMatchSet</code> request.
  /// </li> </ol>
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFNonEmptyEntityException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [geoMatchSetId] :
  /// The <code>GeoMatchSetID</code> of the <a>GeoMatchSet</a> that you want to
  /// delete. <code>GeoMatchSetId</code> is returned by <a>CreateGeoMatchSet</a>
  /// and by <a>ListGeoMatchSets</a>.
  Future<DeleteGeoMatchSetResponse> deleteGeoMatchSet({
    required String changeToken,
    required String geoMatchSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.DeleteGeoMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'GeoMatchSetId': geoMatchSetId,
      },
    );

    return DeleteGeoMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Permanently deletes an <a>IPSet</a>. You can't delete an
  /// <code>IPSet</code> if it's still used in any <code>Rules</code> or if it
  /// still includes any IP addresses.
  ///
  /// If you just want to remove an <code>IPSet</code> from a <code>Rule</code>,
  /// use <a>UpdateRule</a>.
  ///
  /// To permanently delete an <code>IPSet</code> from AWS WAF, perform the
  /// following steps:
  /// <ol>
  /// <li>
  /// Update the <code>IPSet</code> to remove IP address ranges, if any. For
  /// more information, see <a>UpdateIPSet</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>DeleteIPSet</code> request.
  /// </li>
  /// <li>
  /// Submit a <code>DeleteIPSet</code> request.
  /// </li> </ol>
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFNonEmptyEntityException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [iPSetId] :
  /// The <code>IPSetId</code> of the <a>IPSet</a> that you want to delete.
  /// <code>IPSetId</code> is returned by <a>CreateIPSet</a> and by
  /// <a>ListIPSets</a>.
  Future<DeleteIPSetResponse> deleteIPSet({
    required String changeToken,
    required String iPSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.DeleteIPSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'IPSetId': iPSetId,
      },
    );

    return DeleteIPSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Permanently deletes the <a>LoggingConfiguration</a> from the specified web
  /// ACL.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFStaleDataException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the web ACL from which you want to
  /// delete the <a>LoggingConfiguration</a>.
  Future<void> deleteLoggingConfiguration({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.DeleteLoggingConfiguration'
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

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Permanently deletes an IAM policy from the specified RuleGroup.
  ///
  /// The user making the request must be the owner of the RuleGroup.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFStaleDataException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the RuleGroup from which you want to
  /// delete the policy.
  ///
  /// The user making the request must be the owner of the RuleGroup.
  Future<void> deletePermissionPolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.DeletePermissionPolicy'
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

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Permanently deletes a <a>RateBasedRule</a>. You can't delete a rule if
  /// it's still used in any <code>WebACL</code> objects or if it still includes
  /// any predicates, such as <code>ByteMatchSet</code> objects.
  ///
  /// If you just want to remove a rule from a <code>WebACL</code>, use
  /// <a>UpdateWebACL</a>.
  ///
  /// To permanently delete a <code>RateBasedRule</code> from AWS WAF, perform
  /// the following steps:
  /// <ol>
  /// <li>
  /// Update the <code>RateBasedRule</code> to remove predicates, if any. For
  /// more information, see <a>UpdateRateBasedRule</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>DeleteRateBasedRule</code>
  /// request.
  /// </li>
  /// <li>
  /// Submit a <code>DeleteRateBasedRule</code> request.
  /// </li> </ol>
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFNonEmptyEntityException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [ruleId] :
  /// The <code>RuleId</code> of the <a>RateBasedRule</a> that you want to
  /// delete. <code>RuleId</code> is returned by <a>CreateRateBasedRule</a> and
  /// by <a>ListRateBasedRules</a>.
  Future<DeleteRateBasedRuleResponse> deleteRateBasedRule({
    required String changeToken,
    required String ruleId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.DeleteRateBasedRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'RuleId': ruleId,
      },
    );

    return DeleteRateBasedRuleResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Permanently deletes a <a>RegexMatchSet</a>. You can't delete a
  /// <code>RegexMatchSet</code> if it's still used in any <code>Rules</code> or
  /// if it still includes any <code>RegexMatchTuples</code> objects (any
  /// filters).
  ///
  /// If you just want to remove a <code>RegexMatchSet</code> from a
  /// <code>Rule</code>, use <a>UpdateRule</a>.
  ///
  /// To permanently delete a <code>RegexMatchSet</code>, perform the following
  /// steps:
  /// <ol>
  /// <li>
  /// Update the <code>RegexMatchSet</code> to remove filters, if any. For more
  /// information, see <a>UpdateRegexMatchSet</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>DeleteRegexMatchSet</code>
  /// request.
  /// </li>
  /// <li>
  /// Submit a <code>DeleteRegexMatchSet</code> request.
  /// </li> </ol>
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFStaleDataException].
  /// May throw [WAFNonEmptyEntityException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [regexMatchSetId] :
  /// The <code>RegexMatchSetId</code> of the <a>RegexMatchSet</a> that you want
  /// to delete. <code>RegexMatchSetId</code> is returned by
  /// <a>CreateRegexMatchSet</a> and by <a>ListRegexMatchSets</a>.
  Future<DeleteRegexMatchSetResponse> deleteRegexMatchSet({
    required String changeToken,
    required String regexMatchSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.DeleteRegexMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'RegexMatchSetId': regexMatchSetId,
      },
    );

    return DeleteRegexMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Permanently deletes a <a>RegexPatternSet</a>. You can't delete a
  /// <code>RegexPatternSet</code> if it's still used in any
  /// <code>RegexMatchSet</code> or if the <code>RegexPatternSet</code> is not
  /// empty.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFStaleDataException].
  /// May throw [WAFNonEmptyEntityException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [regexPatternSetId] :
  /// The <code>RegexPatternSetId</code> of the <a>RegexPatternSet</a> that you
  /// want to delete. <code>RegexPatternSetId</code> is returned by
  /// <a>CreateRegexPatternSet</a> and by <a>ListRegexPatternSets</a>.
  Future<DeleteRegexPatternSetResponse> deleteRegexPatternSet({
    required String changeToken,
    required String regexPatternSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.DeleteRegexPatternSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'RegexPatternSetId': regexPatternSetId,
      },
    );

    return DeleteRegexPatternSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Permanently deletes a <a>Rule</a>. You can't delete a <code>Rule</code> if
  /// it's still used in any <code>WebACL</code> objects or if it still includes
  /// any predicates, such as <code>ByteMatchSet</code> objects.
  ///
  /// If you just want to remove a <code>Rule</code> from a <code>WebACL</code>,
  /// use <a>UpdateWebACL</a>.
  ///
  /// To permanently delete a <code>Rule</code> from AWS WAF, perform the
  /// following steps:
  /// <ol>
  /// <li>
  /// Update the <code>Rule</code> to remove predicates, if any. For more
  /// information, see <a>UpdateRule</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>DeleteRule</code> request.
  /// </li>
  /// <li>
  /// Submit a <code>DeleteRule</code> request.
  /// </li> </ol>
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFNonEmptyEntityException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [ruleId] :
  /// The <code>RuleId</code> of the <a>Rule</a> that you want to delete.
  /// <code>RuleId</code> is returned by <a>CreateRule</a> and by
  /// <a>ListRules</a>.
  Future<DeleteRuleResponse> deleteRule({
    required String changeToken,
    required String ruleId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.DeleteRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'RuleId': ruleId,
      },
    );

    return DeleteRuleResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Permanently deletes a <a>RuleGroup</a>. You can't delete a
  /// <code>RuleGroup</code> if it's still used in any <code>WebACL</code>
  /// objects or if it still includes any rules.
  ///
  /// If you just want to remove a <code>RuleGroup</code> from a
  /// <code>WebACL</code>, use <a>UpdateWebACL</a>.
  ///
  /// To permanently delete a <code>RuleGroup</code> from AWS WAF, perform the
  /// following steps:
  /// <ol>
  /// <li>
  /// Update the <code>RuleGroup</code> to remove rules, if any. For more
  /// information, see <a>UpdateRuleGroup</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>DeleteRuleGroup</code>
  /// request.
  /// </li>
  /// <li>
  /// Submit a <code>DeleteRuleGroup</code> request.
  /// </li> </ol>
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFNonEmptyEntityException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [ruleGroupId] :
  /// The <code>RuleGroupId</code> of the <a>RuleGroup</a> that you want to
  /// delete. <code>RuleGroupId</code> is returned by <a>CreateRuleGroup</a> and
  /// by <a>ListRuleGroups</a>.
  Future<DeleteRuleGroupResponse> deleteRuleGroup({
    required String changeToken,
    required String ruleGroupId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.DeleteRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'RuleGroupId': ruleGroupId,
      },
    );

    return DeleteRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Permanently deletes a <a>SizeConstraintSet</a>. You can't delete a
  /// <code>SizeConstraintSet</code> if it's still used in any
  /// <code>Rules</code> or if it still includes any <a>SizeConstraint</a>
  /// objects (any filters).
  ///
  /// If you just want to remove a <code>SizeConstraintSet</code> from a
  /// <code>Rule</code>, use <a>UpdateRule</a>.
  ///
  /// To permanently delete a <code>SizeConstraintSet</code>, perform the
  /// following steps:
  /// <ol>
  /// <li>
  /// Update the <code>SizeConstraintSet</code> to remove filters, if any. For
  /// more information, see <a>UpdateSizeConstraintSet</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a
  /// <code>DeleteSizeConstraintSet</code> request.
  /// </li>
  /// <li>
  /// Submit a <code>DeleteSizeConstraintSet</code> request.
  /// </li> </ol>
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFNonEmptyEntityException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [sizeConstraintSetId] :
  /// The <code>SizeConstraintSetId</code> of the <a>SizeConstraintSet</a> that
  /// you want to delete. <code>SizeConstraintSetId</code> is returned by
  /// <a>CreateSizeConstraintSet</a> and by <a>ListSizeConstraintSets</a>.
  Future<DeleteSizeConstraintSetResponse> deleteSizeConstraintSet({
    required String changeToken,
    required String sizeConstraintSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.DeleteSizeConstraintSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'SizeConstraintSetId': sizeConstraintSetId,
      },
    );

    return DeleteSizeConstraintSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Permanently deletes a <a>SqlInjectionMatchSet</a>. You can't delete a
  /// <code>SqlInjectionMatchSet</code> if it's still used in any
  /// <code>Rules</code> or if it still contains any
  /// <a>SqlInjectionMatchTuple</a> objects.
  ///
  /// If you just want to remove a <code>SqlInjectionMatchSet</code> from a
  /// <code>Rule</code>, use <a>UpdateRule</a>.
  ///
  /// To permanently delete a <code>SqlInjectionMatchSet</code> from AWS WAF,
  /// perform the following steps:
  /// <ol>
  /// <li>
  /// Update the <code>SqlInjectionMatchSet</code> to remove filters, if any.
  /// For more information, see <a>UpdateSqlInjectionMatchSet</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a
  /// <code>DeleteSqlInjectionMatchSet</code> request.
  /// </li>
  /// <li>
  /// Submit a <code>DeleteSqlInjectionMatchSet</code> request.
  /// </li> </ol>
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFStaleDataException].
  /// May throw [WAFNonEmptyEntityException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [sqlInjectionMatchSetId] :
  /// The <code>SqlInjectionMatchSetId</code> of the <a>SqlInjectionMatchSet</a>
  /// that you want to delete. <code>SqlInjectionMatchSetId</code> is returned
  /// by <a>CreateSqlInjectionMatchSet</a> and by
  /// <a>ListSqlInjectionMatchSets</a>.
  Future<DeleteSqlInjectionMatchSetResponse> deleteSqlInjectionMatchSet({
    required String changeToken,
    required String sqlInjectionMatchSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.DeleteSqlInjectionMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'SqlInjectionMatchSetId': sqlInjectionMatchSetId,
      },
    );

    return DeleteSqlInjectionMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Permanently deletes a <a>WebACL</a>. You can't delete a
  /// <code>WebACL</code> if it still contains any <code>Rules</code>.
  ///
  /// To delete a <code>WebACL</code>, perform the following steps:
  /// <ol>
  /// <li>
  /// Update the <code>WebACL</code> to remove <code>Rules</code>, if any. For
  /// more information, see <a>UpdateWebACL</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>DeleteWebACL</code> request.
  /// </li>
  /// <li>
  /// Submit a <code>DeleteWebACL</code> request.
  /// </li> </ol>
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFNonEmptyEntityException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [webACLId] :
  /// The <code>WebACLId</code> of the <a>WebACL</a> that you want to delete.
  /// <code>WebACLId</code> is returned by <a>CreateWebACL</a> and by
  /// <a>ListWebACLs</a>.
  Future<DeleteWebACLResponse> deleteWebACL({
    required String changeToken,
    required String webACLId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.DeleteWebACL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'WebACLId': webACLId,
      },
    );

    return DeleteWebACLResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Permanently deletes an <a>XssMatchSet</a>. You can't delete an
  /// <code>XssMatchSet</code> if it's still used in any <code>Rules</code> or
  /// if it still contains any <a>XssMatchTuple</a> objects.
  ///
  /// If you just want to remove an <code>XssMatchSet</code> from a
  /// <code>Rule</code>, use <a>UpdateRule</a>.
  ///
  /// To permanently delete an <code>XssMatchSet</code> from AWS WAF, perform
  /// the following steps:
  /// <ol>
  /// <li>
  /// Update the <code>XssMatchSet</code> to remove filters, if any. For more
  /// information, see <a>UpdateXssMatchSet</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of a <code>DeleteXssMatchSet</code>
  /// request.
  /// </li>
  /// <li>
  /// Submit a <code>DeleteXssMatchSet</code> request.
  /// </li> </ol>
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFStaleDataException].
  /// May throw [WAFNonEmptyEntityException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [xssMatchSetId] :
  /// The <code>XssMatchSetId</code> of the <a>XssMatchSet</a> that you want to
  /// delete. <code>XssMatchSetId</code> is returned by <a>CreateXssMatchSet</a>
  /// and by <a>ListXssMatchSets</a>.
  Future<DeleteXssMatchSetResponse> deleteXssMatchSet({
    required String changeToken,
    required String xssMatchSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.DeleteXssMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'XssMatchSetId': xssMatchSetId,
      },
    );

    return DeleteXssMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns the <a>ByteMatchSet</a> specified by <code>ByteMatchSetId</code>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [byteMatchSetId] :
  /// The <code>ByteMatchSetId</code> of the <a>ByteMatchSet</a> that you want
  /// to get. <code>ByteMatchSetId</code> is returned by
  /// <a>CreateByteMatchSet</a> and by <a>ListByteMatchSets</a>.
  Future<GetByteMatchSetResponse> getByteMatchSet({
    required String byteMatchSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetByteMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ByteMatchSetId': byteMatchSetId,
      },
    );

    return GetByteMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// When you want to create, update, or delete AWS WAF objects, get a change
  /// token and include the change token in the create, update, or delete
  /// request. Change tokens ensure that your application doesn't submit
  /// conflicting requests to AWS WAF.
  ///
  /// Each create, update, or delete request must use a unique change token. If
  /// your application submits a <code>GetChangeToken</code> request and then
  /// submits a second <code>GetChangeToken</code> request before submitting a
  /// create, update, or delete request, the second <code>GetChangeToken</code>
  /// request returns the same value as the first <code>GetChangeToken</code>
  /// request.
  ///
  /// When you use a change token in a create, update, or delete request, the
  /// status of the change token changes to <code>PENDING</code>, which
  /// indicates that AWS WAF is propagating the change to all AWS WAF servers.
  /// Use <code>GetChangeTokenStatus</code> to determine the status of your
  /// change token.
  ///
  /// May throw [WAFInternalErrorException].
  Future<GetChangeTokenResponse> getChangeToken() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetChangeToken'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetChangeTokenResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns the status of a <code>ChangeToken</code> that you got by calling
  /// <a>GetChangeToken</a>. <code>ChangeTokenStatus</code> is one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>PROVISIONED</code>: You requested the change token by calling
  /// <code>GetChangeToken</code>, but you haven't used it yet in a call to
  /// create, update, or delete an AWS WAF object.
  /// </li>
  /// <li>
  /// <code>PENDING</code>: AWS WAF is propagating the create, update, or delete
  /// request to all AWS WAF servers.
  /// </li>
  /// <li>
  /// <code>INSYNC</code>: Propagation is complete.
  /// </li>
  /// </ul>
  ///
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInternalErrorException].
  ///
  /// Parameter [changeToken] :
  /// The change token for which you want to get the status. This change token
  /// was previously returned in the <code>GetChangeToken</code> response.
  Future<GetChangeTokenStatusResponse> getChangeTokenStatus({
    required String changeToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetChangeTokenStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
      },
    );

    return GetChangeTokenStatusResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns the <a>GeoMatchSet</a> that is specified by
  /// <code>GeoMatchSetId</code>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [geoMatchSetId] :
  /// The <code>GeoMatchSetId</code> of the <a>GeoMatchSet</a> that you want to
  /// get. <code>GeoMatchSetId</code> is returned by <a>CreateGeoMatchSet</a>
  /// and by <a>ListGeoMatchSets</a>.
  Future<GetGeoMatchSetResponse> getGeoMatchSet({
    required String geoMatchSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetGeoMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GeoMatchSetId': geoMatchSetId,
      },
    );

    return GetGeoMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns the <a>IPSet</a> that is specified by <code>IPSetId</code>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [iPSetId] :
  /// The <code>IPSetId</code> of the <a>IPSet</a> that you want to get.
  /// <code>IPSetId</code> is returned by <a>CreateIPSet</a> and by
  /// <a>ListIPSets</a>.
  Future<GetIPSetResponse> getIPSet({
    required String iPSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetIPSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IPSetId': iPSetId,
      },
    );

    return GetIPSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns the <a>LoggingConfiguration</a> for the specified web ACL.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the web ACL for which you want to get
  /// the <a>LoggingConfiguration</a>.
  Future<GetLoggingConfigurationResponse> getLoggingConfiguration({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetLoggingConfiguration'
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

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns the IAM policy attached to the RuleGroup.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the RuleGroup for which you want to get
  /// the policy.
  Future<GetPermissionPolicyResponse> getPermissionPolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetPermissionPolicy'
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
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns the <a>RateBasedRule</a> that is specified by the
  /// <code>RuleId</code> that you included in the <code>GetRateBasedRule</code>
  /// request.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [ruleId] :
  /// The <code>RuleId</code> of the <a>RateBasedRule</a> that you want to get.
  /// <code>RuleId</code> is returned by <a>CreateRateBasedRule</a> and by
  /// <a>ListRateBasedRules</a>.
  Future<GetRateBasedRuleResponse> getRateBasedRule({
    required String ruleId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetRateBasedRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RuleId': ruleId,
      },
    );

    return GetRateBasedRuleResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of IP addresses currently being blocked by the
  /// <a>RateBasedRule</a> that is specified by the <code>RuleId</code>. The
  /// maximum number of managed keys that will be blocked is 10,000. If more
  /// than 10,000 addresses exceed the rate limit, the 10,000 addresses with the
  /// highest rates will be blocked.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [ruleId] :
  /// The <code>RuleId</code> of the <a>RateBasedRule</a> for which you want to
  /// get a list of <code>ManagedKeys</code>. <code>RuleId</code> is returned by
  /// <a>CreateRateBasedRule</a> and by <a>ListRateBasedRules</a>.
  ///
  /// Parameter [nextMarker] :
  /// A null value and not currently used. Do not include this in your request.
  Future<GetRateBasedRuleManagedKeysResponse> getRateBasedRuleManagedKeys({
    required String ruleId,
    String? nextMarker,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetRateBasedRuleManagedKeys'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RuleId': ruleId,
        if (nextMarker != null) 'NextMarker': nextMarker,
      },
    );

    return GetRateBasedRuleManagedKeysResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns the <a>RegexMatchSet</a> specified by
  /// <code>RegexMatchSetId</code>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [regexMatchSetId] :
  /// The <code>RegexMatchSetId</code> of the <a>RegexMatchSet</a> that you want
  /// to get. <code>RegexMatchSetId</code> is returned by
  /// <a>CreateRegexMatchSet</a> and by <a>ListRegexMatchSets</a>.
  Future<GetRegexMatchSetResponse> getRegexMatchSet({
    required String regexMatchSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetRegexMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegexMatchSetId': regexMatchSetId,
      },
    );

    return GetRegexMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns the <a>RegexPatternSet</a> specified by
  /// <code>RegexPatternSetId</code>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [regexPatternSetId] :
  /// The <code>RegexPatternSetId</code> of the <a>RegexPatternSet</a> that you
  /// want to get. <code>RegexPatternSetId</code> is returned by
  /// <a>CreateRegexPatternSet</a> and by <a>ListRegexPatternSets</a>.
  Future<GetRegexPatternSetResponse> getRegexPatternSet({
    required String regexPatternSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetRegexPatternSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegexPatternSetId': regexPatternSetId,
      },
    );

    return GetRegexPatternSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns the <a>Rule</a> that is specified by the <code>RuleId</code> that
  /// you included in the <code>GetRule</code> request.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [ruleId] :
  /// The <code>RuleId</code> of the <a>Rule</a> that you want to get.
  /// <code>RuleId</code> is returned by <a>CreateRule</a> and by
  /// <a>ListRules</a>.
  Future<GetRuleResponse> getRule({
    required String ruleId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RuleId': ruleId,
      },
    );

    return GetRuleResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns the <a>RuleGroup</a> that is specified by the
  /// <code>RuleGroupId</code> that you included in the
  /// <code>GetRuleGroup</code> request.
  ///
  /// To view the rules in a rule group, use
  /// <a>ListActivatedRulesInRuleGroup</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [ruleGroupId] :
  /// The <code>RuleGroupId</code> of the <a>RuleGroup</a> that you want to get.
  /// <code>RuleGroupId</code> is returned by <a>CreateRuleGroup</a> and by
  /// <a>ListRuleGroups</a>.
  Future<GetRuleGroupResponse> getRuleGroup({
    required String ruleGroupId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RuleGroupId': ruleGroupId,
      },
    );

    return GetRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
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
  ///
  /// Parameter [maxItems] :
  /// The number of requests that you want AWS WAF to return from among the
  /// first 5,000 requests that your AWS resource received during the time
  /// range. If your resource received fewer requests than the value of
  /// <code>MaxItems</code>, <code>GetSampledRequests</code> returns information
  /// about all of them.
  ///
  /// Parameter [ruleId] :
  /// <code>RuleId</code> is one of three values:
  ///
  /// <ul>
  /// <li>
  /// The <code>RuleId</code> of the <code>Rule</code> or the
  /// <code>RuleGroupId</code> of the <code>RuleGroup</code> for which you want
  /// <code>GetSampledRequests</code> to return a sample of requests.
  /// </li>
  /// <li>
  /// <code>Default_Action</code>, which causes <code>GetSampledRequests</code>
  /// to return a sample of the requests that didn't match any of the rules in
  /// the specified <code>WebACL</code>.
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
  /// Parameter [webAclId] :
  /// The <code>WebACLId</code> of the <code>WebACL</code> for which you want
  /// <code>GetSampledRequests</code> to return a sample of requests.
  Future<GetSampledRequestsResponse> getSampledRequests({
    required int maxItems,
    required String ruleId,
    required TimeWindow timeWindow,
    required String webAclId,
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
      'X-Amz-Target': 'AWSWAF_20150824.GetSampledRequests'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxItems': maxItems,
        'RuleId': ruleId,
        'TimeWindow': timeWindow,
        'WebAclId': webAclId,
      },
    );

    return GetSampledRequestsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns the <a>SizeConstraintSet</a> specified by
  /// <code>SizeConstraintSetId</code>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [sizeConstraintSetId] :
  /// The <code>SizeConstraintSetId</code> of the <a>SizeConstraintSet</a> that
  /// you want to get. <code>SizeConstraintSetId</code> is returned by
  /// <a>CreateSizeConstraintSet</a> and by <a>ListSizeConstraintSets</a>.
  Future<GetSizeConstraintSetResponse> getSizeConstraintSet({
    required String sizeConstraintSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetSizeConstraintSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SizeConstraintSetId': sizeConstraintSetId,
      },
    );

    return GetSizeConstraintSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns the <a>SqlInjectionMatchSet</a> that is specified by
  /// <code>SqlInjectionMatchSetId</code>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [sqlInjectionMatchSetId] :
  /// The <code>SqlInjectionMatchSetId</code> of the <a>SqlInjectionMatchSet</a>
  /// that you want to get. <code>SqlInjectionMatchSetId</code> is returned by
  /// <a>CreateSqlInjectionMatchSet</a> and by <a>ListSqlInjectionMatchSets</a>.
  Future<GetSqlInjectionMatchSetResponse> getSqlInjectionMatchSet({
    required String sqlInjectionMatchSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetSqlInjectionMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SqlInjectionMatchSetId': sqlInjectionMatchSetId,
      },
    );

    return GetSqlInjectionMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns the <a>WebACL</a> that is specified by <code>WebACLId</code>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [webACLId] :
  /// The <code>WebACLId</code> of the <a>WebACL</a> that you want to get.
  /// <code>WebACLId</code> is returned by <a>CreateWebACL</a> and by
  /// <a>ListWebACLs</a>.
  Future<GetWebACLResponse> getWebACL({
    required String webACLId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetWebACL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WebACLId': webACLId,
      },
    );

    return GetWebACLResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns the <a>XssMatchSet</a> that is specified by
  /// <code>XssMatchSetId</code>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFNonexistentItemException].
  ///
  /// Parameter [xssMatchSetId] :
  /// The <code>XssMatchSetId</code> of the <a>XssMatchSet</a> that you want to
  /// get. <code>XssMatchSetId</code> is returned by <a>CreateXssMatchSet</a>
  /// and by <a>ListXssMatchSets</a>.
  Future<GetXssMatchSetResponse> getXssMatchSet({
    required String xssMatchSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.GetXssMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'XssMatchSetId': xssMatchSetId,
      },
    );

    return GetXssMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of <a>ActivatedRule</a> objects.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [limit] :
  /// Specifies the number of <code>ActivatedRules</code> that you want AWS WAF
  /// to return for this request. If you have more <code>ActivatedRules</code>
  /// than the number that you specify for <code>Limit</code>, the response
  /// includes a <code>NextMarker</code> value that you can use to get another
  /// batch of <code>ActivatedRules</code>.
  ///
  /// Parameter [nextMarker] :
  /// If you specify a value for <code>Limit</code> and you have more
  /// <code>ActivatedRules</code> than the value of <code>Limit</code>, AWS WAF
  /// returns a <code>NextMarker</code> value in the response that allows you to
  /// list another group of <code>ActivatedRules</code>. For the second and
  /// subsequent <code>ListActivatedRulesInRuleGroup</code> requests, specify
  /// the value of <code>NextMarker</code> from the previous response to get
  /// information about another batch of <code>ActivatedRules</code>.
  ///
  /// Parameter [ruleGroupId] :
  /// The <code>RuleGroupId</code> of the <a>RuleGroup</a> for which you want to
  /// get a list of <a>ActivatedRule</a> objects.
  Future<ListActivatedRulesInRuleGroupResponse> listActivatedRulesInRuleGroup({
    int? limit,
    String? nextMarker,
    String? ruleGroupId,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListActivatedRulesInRuleGroup'
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
        if (ruleGroupId != null) 'RuleGroupId': ruleGroupId,
      },
    );

    return ListActivatedRulesInRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of <a>ByteMatchSetSummary</a> objects.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  ///
  /// Parameter [limit] :
  /// Specifies the number of <code>ByteMatchSet</code> objects that you want
  /// AWS WAF to return for this request. If you have more
  /// <code>ByteMatchSets</code> objects than the number you specify for
  /// <code>Limit</code>, the response includes a <code>NextMarker</code> value
  /// that you can use to get another batch of <code>ByteMatchSet</code>
  /// objects.
  ///
  /// Parameter [nextMarker] :
  /// If you specify a value for <code>Limit</code> and you have more
  /// <code>ByteMatchSets</code> than the value of <code>Limit</code>, AWS WAF
  /// returns a <code>NextMarker</code> value in the response that allows you to
  /// list another group of <code>ByteMatchSets</code>. For the second and
  /// subsequent <code>ListByteMatchSets</code> requests, specify the value of
  /// <code>NextMarker</code> from the previous response to get information
  /// about another batch of <code>ByteMatchSets</code>.
  Future<ListByteMatchSetsResponse> listByteMatchSets({
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListByteMatchSets'
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
      },
    );

    return ListByteMatchSetsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of <a>GeoMatchSetSummary</a> objects in the response.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  ///
  /// Parameter [limit] :
  /// Specifies the number of <code>GeoMatchSet</code> objects that you want AWS
  /// WAF to return for this request. If you have more <code>GeoMatchSet</code>
  /// objects than the number you specify for <code>Limit</code>, the response
  /// includes a <code>NextMarker</code> value that you can use to get another
  /// batch of <code>GeoMatchSet</code> objects.
  ///
  /// Parameter [nextMarker] :
  /// If you specify a value for <code>Limit</code> and you have more
  /// <code>GeoMatchSet</code>s than the value of <code>Limit</code>, AWS WAF
  /// returns a <code>NextMarker</code> value in the response that allows you to
  /// list another group of <code>GeoMatchSet</code> objects. For the second and
  /// subsequent <code>ListGeoMatchSets</code> requests, specify the value of
  /// <code>NextMarker</code> from the previous response to get information
  /// about another batch of <code>GeoMatchSet</code> objects.
  Future<ListGeoMatchSetsResponse> listGeoMatchSets({
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListGeoMatchSets'
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
      },
    );

    return ListGeoMatchSetsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of <a>IPSetSummary</a> objects in the response.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  ///
  /// Parameter [limit] :
  /// Specifies the number of <code>IPSet</code> objects that you want AWS WAF
  /// to return for this request. If you have more <code>IPSet</code> objects
  /// than the number you specify for <code>Limit</code>, the response includes
  /// a <code>NextMarker</code> value that you can use to get another batch of
  /// <code>IPSet</code> objects.
  ///
  /// Parameter [nextMarker] :
  /// AWS WAF returns a <code>NextMarker</code> value in the response that
  /// allows you to list another group of <code>IPSets</code>. For the second
  /// and subsequent <code>ListIPSets</code> requests, specify the value of
  /// <code>NextMarker</code> from the previous response to get information
  /// about another batch of <code>IPSets</code>.
  Future<ListIPSetsResponse> listIPSets({
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListIPSets'
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
      },
    );

    return ListIPSetsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of <a>LoggingConfiguration</a> objects.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [limit] :
  /// Specifies the number of <code>LoggingConfigurations</code> that you want
  /// AWS WAF to return for this request. If you have more
  /// <code>LoggingConfigurations</code> than the number that you specify for
  /// <code>Limit</code>, the response includes a <code>NextMarker</code> value
  /// that you can use to get another batch of
  /// <code>LoggingConfigurations</code>.
  ///
  /// Parameter [nextMarker] :
  /// If you specify a value for <code>Limit</code> and you have more
  /// <code>LoggingConfigurations</code> than the value of <code>Limit</code>,
  /// AWS WAF returns a <code>NextMarker</code> value in the response that
  /// allows you to list another group of <code>LoggingConfigurations</code>.
  /// For the second and subsequent <code>ListLoggingConfigurations</code>
  /// requests, specify the value of <code>NextMarker</code> from the previous
  /// response to get information about another batch of
  /// <code>ListLoggingConfigurations</code>.
  Future<ListLoggingConfigurationsResponse> listLoggingConfigurations({
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListLoggingConfigurations'
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
      },
    );

    return ListLoggingConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of <a>RuleSummary</a> objects.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  ///
  /// Parameter [limit] :
  /// Specifies the number of <code>Rules</code> that you want AWS WAF to return
  /// for this request. If you have more <code>Rules</code> than the number that
  /// you specify for <code>Limit</code>, the response includes a
  /// <code>NextMarker</code> value that you can use to get another batch of
  /// <code>Rules</code>.
  ///
  /// Parameter [nextMarker] :
  /// If you specify a value for <code>Limit</code> and you have more
  /// <code>Rules</code> than the value of <code>Limit</code>, AWS WAF returns a
  /// <code>NextMarker</code> value in the response that allows you to list
  /// another group of <code>Rules</code>. For the second and subsequent
  /// <code>ListRateBasedRules</code> requests, specify the value of
  /// <code>NextMarker</code> from the previous response to get information
  /// about another batch of <code>Rules</code>.
  Future<ListRateBasedRulesResponse> listRateBasedRules({
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListRateBasedRules'
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
      },
    );

    return ListRateBasedRulesResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of <a>RegexMatchSetSummary</a> objects.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  ///
  /// Parameter [limit] :
  /// Specifies the number of <code>RegexMatchSet</code> objects that you want
  /// AWS WAF to return for this request. If you have more
  /// <code>RegexMatchSet</code> objects than the number you specify for
  /// <code>Limit</code>, the response includes a <code>NextMarker</code> value
  /// that you can use to get another batch of <code>RegexMatchSet</code>
  /// objects.
  ///
  /// Parameter [nextMarker] :
  /// If you specify a value for <code>Limit</code> and you have more
  /// <code>RegexMatchSet</code> objects than the value of <code>Limit</code>,
  /// AWS WAF returns a <code>NextMarker</code> value in the response that
  /// allows you to list another group of <code>ByteMatchSets</code>. For the
  /// second and subsequent <code>ListRegexMatchSets</code> requests, specify
  /// the value of <code>NextMarker</code> from the previous response to get
  /// information about another batch of <code>RegexMatchSet</code> objects.
  Future<ListRegexMatchSetsResponse> listRegexMatchSets({
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListRegexMatchSets'
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
      },
    );

    return ListRegexMatchSetsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of <a>RegexPatternSetSummary</a> objects.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  ///
  /// Parameter [limit] :
  /// Specifies the number of <code>RegexPatternSet</code> objects that you want
  /// AWS WAF to return for this request. If you have more
  /// <code>RegexPatternSet</code> objects than the number you specify for
  /// <code>Limit</code>, the response includes a <code>NextMarker</code> value
  /// that you can use to get another batch of <code>RegexPatternSet</code>
  /// objects.
  ///
  /// Parameter [nextMarker] :
  /// If you specify a value for <code>Limit</code> and you have more
  /// <code>RegexPatternSet</code> objects than the value of <code>Limit</code>,
  /// AWS WAF returns a <code>NextMarker</code> value in the response that
  /// allows you to list another group of <code>RegexPatternSet</code> objects.
  /// For the second and subsequent <code>ListRegexPatternSets</code> requests,
  /// specify the value of <code>NextMarker</code> from the previous response to
  /// get information about another batch of <code>RegexPatternSet</code>
  /// objects.
  Future<ListRegexPatternSetsResponse> listRegexPatternSets({
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListRegexPatternSets'
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
      },
    );

    return ListRegexPatternSetsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of <a>RuleGroup</a> objects.
  ///
  /// May throw [WAFInternalErrorException].
  ///
  /// Parameter [limit] :
  /// Specifies the number of <code>RuleGroups</code> that you want AWS WAF to
  /// return for this request. If you have more <code>RuleGroups</code> than the
  /// number that you specify for <code>Limit</code>, the response includes a
  /// <code>NextMarker</code> value that you can use to get another batch of
  /// <code>RuleGroups</code>.
  ///
  /// Parameter [nextMarker] :
  /// If you specify a value for <code>Limit</code> and you have more
  /// <code>RuleGroups</code> than the value of <code>Limit</code>, AWS WAF
  /// returns a <code>NextMarker</code> value in the response that allows you to
  /// list another group of <code>RuleGroups</code>. For the second and
  /// subsequent <code>ListRuleGroups</code> requests, specify the value of
  /// <code>NextMarker</code> from the previous response to get information
  /// about another batch of <code>RuleGroups</code>.
  Future<ListRuleGroupsResponse> listRuleGroups({
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListRuleGroups'
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
      },
    );

    return ListRuleGroupsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of <a>RuleSummary</a> objects.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  ///
  /// Parameter [limit] :
  /// Specifies the number of <code>Rules</code> that you want AWS WAF to return
  /// for this request. If you have more <code>Rules</code> than the number that
  /// you specify for <code>Limit</code>, the response includes a
  /// <code>NextMarker</code> value that you can use to get another batch of
  /// <code>Rules</code>.
  ///
  /// Parameter [nextMarker] :
  /// If you specify a value for <code>Limit</code> and you have more
  /// <code>Rules</code> than the value of <code>Limit</code>, AWS WAF returns a
  /// <code>NextMarker</code> value in the response that allows you to list
  /// another group of <code>Rules</code>. For the second and subsequent
  /// <code>ListRules</code> requests, specify the value of
  /// <code>NextMarker</code> from the previous response to get information
  /// about another batch of <code>Rules</code>.
  Future<ListRulesResponse> listRules({
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListRules'
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
      },
    );

    return ListRulesResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of <a>SizeConstraintSetSummary</a> objects.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  ///
  /// Parameter [limit] :
  /// Specifies the number of <code>SizeConstraintSet</code> objects that you
  /// want AWS WAF to return for this request. If you have more
  /// <code>SizeConstraintSets</code> objects than the number you specify for
  /// <code>Limit</code>, the response includes a <code>NextMarker</code> value
  /// that you can use to get another batch of <code>SizeConstraintSet</code>
  /// objects.
  ///
  /// Parameter [nextMarker] :
  /// If you specify a value for <code>Limit</code> and you have more
  /// <code>SizeConstraintSets</code> than the value of <code>Limit</code>, AWS
  /// WAF returns a <code>NextMarker</code> value in the response that allows
  /// you to list another group of <code>SizeConstraintSets</code>. For the
  /// second and subsequent <code>ListSizeConstraintSets</code> requests,
  /// specify the value of <code>NextMarker</code> from the previous response to
  /// get information about another batch of <code>SizeConstraintSets</code>.
  Future<ListSizeConstraintSetsResponse> listSizeConstraintSets({
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListSizeConstraintSets'
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
      },
    );

    return ListSizeConstraintSetsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of <a>SqlInjectionMatchSet</a> objects.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  ///
  /// Parameter [limit] :
  /// Specifies the number of <a>SqlInjectionMatchSet</a> objects that you want
  /// AWS WAF to return for this request. If you have more
  /// <code>SqlInjectionMatchSet</code> objects than the number you specify for
  /// <code>Limit</code>, the response includes a <code>NextMarker</code> value
  /// that you can use to get another batch of <code>Rules</code>.
  ///
  /// Parameter [nextMarker] :
  /// If you specify a value for <code>Limit</code> and you have more
  /// <a>SqlInjectionMatchSet</a> objects than the value of <code>Limit</code>,
  /// AWS WAF returns a <code>NextMarker</code> value in the response that
  /// allows you to list another group of <code>SqlInjectionMatchSets</code>.
  /// For the second and subsequent <code>ListSqlInjectionMatchSets</code>
  /// requests, specify the value of <code>NextMarker</code> from the previous
  /// response to get information about another batch of
  /// <code>SqlInjectionMatchSets</code>.
  Future<ListSqlInjectionMatchSetsResponse> listSqlInjectionMatchSets({
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListSqlInjectionMatchSets'
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
      },
    );

    return ListSqlInjectionMatchSetsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of <a>RuleGroup</a> objects that you are subscribed to.
  ///
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInternalErrorException].
  ///
  /// Parameter [limit] :
  /// Specifies the number of subscribed rule groups that you want AWS WAF to
  /// return for this request. If you have more objects than the number you
  /// specify for <code>Limit</code>, the response includes a
  /// <code>NextMarker</code> value that you can use to get another batch of
  /// objects.
  ///
  /// Parameter [nextMarker] :
  /// If you specify a value for <code>Limit</code> and you have more
  /// <code>ByteMatchSets</code>subscribed rule groups than the value of
  /// <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the
  /// response that allows you to list another group of subscribed rule groups.
  /// For the second and subsequent <code>ListSubscribedRuleGroupsRequest</code>
  /// requests, specify the value of <code>NextMarker</code> from the previous
  /// response to get information about another batch of subscribed rule groups.
  Future<ListSubscribedRuleGroupsResponse> listSubscribedRuleGroups({
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListSubscribedRuleGroups'
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
      },
    );

    return ListSubscribedRuleGroupsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Retrieves the tags associated with the specified AWS resource. Tags are
  /// key:value pairs that you can use to categorize and manage your resources,
  /// for purposes like billing. For example, you might set the tag key to
  /// "customer" and the value to the customer name or ID. You can specify one
  /// or more tags to add to each AWS resource, up to 50 tags for a resource.
  ///
  /// Tagging is only available through the API, SDKs, and CLI. You can't manage
  /// or view tags through the AWS WAF Classic console. You can tag the AWS
  /// resources that you manage through AWS WAF Classic: web ACLs, rule groups,
  /// and rules.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFBadRequestException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [resourceARN] :
  /// <p/>
  ///
  /// Parameter [limit] :
  /// <p/>
  ///
  /// Parameter [nextMarker] :
  /// <p/>
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListTagsForResource'
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
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of <a>WebACLSummary</a> objects in the response.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  ///
  /// Parameter [limit] :
  /// Specifies the number of <code>WebACL</code> objects that you want AWS WAF
  /// to return for this request. If you have more <code>WebACL</code> objects
  /// than the number that you specify for <code>Limit</code>, the response
  /// includes a <code>NextMarker</code> value that you can use to get another
  /// batch of <code>WebACL</code> objects.
  ///
  /// Parameter [nextMarker] :
  /// If you specify a value for <code>Limit</code> and you have more
  /// <code>WebACL</code> objects than the number that you specify for
  /// <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the
  /// response that allows you to list another group of <code>WebACL</code>
  /// objects. For the second and subsequent <code>ListWebACLs</code> requests,
  /// specify the value of <code>NextMarker</code> from the previous response to
  /// get information about another batch of <code>WebACL</code> objects.
  Future<ListWebACLsResponse> listWebACLs({
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListWebACLs'
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
      },
    );

    return ListWebACLsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Returns an array of <a>XssMatchSet</a> objects.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  ///
  /// Parameter [limit] :
  /// Specifies the number of <a>XssMatchSet</a> objects that you want AWS WAF
  /// to return for this request. If you have more <code>XssMatchSet</code>
  /// objects than the number you specify for <code>Limit</code>, the response
  /// includes a <code>NextMarker</code> value that you can use to get another
  /// batch of <code>Rules</code>.
  ///
  /// Parameter [nextMarker] :
  /// If you specify a value for <code>Limit</code> and you have more
  /// <a>XssMatchSet</a> objects than the value of <code>Limit</code>, AWS WAF
  /// returns a <code>NextMarker</code> value in the response that allows you to
  /// list another group of <code>XssMatchSets</code>. For the second and
  /// subsequent <code>ListXssMatchSets</code> requests, specify the value of
  /// <code>NextMarker</code> from the previous response to get information
  /// about another batch of <code>XssMatchSets</code>.
  Future<ListXssMatchSetsResponse> listXssMatchSets({
    int? limit,
    String? nextMarker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.ListXssMatchSets'
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
      },
    );

    return ListXssMatchSetsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Associates a <a>LoggingConfiguration</a> with a specified web ACL.
  ///
  /// You can access information about all traffic that AWS WAF inspects using
  /// the following steps:
  /// <ol>
  /// <li>
  /// Create an Amazon Kinesis Data Firehose.
  ///
  /// Create the data firehose with a PUT source and in the region that you are
  /// operating. However, if you are capturing logs for Amazon CloudFront,
  /// always create the firehose in US East (N. Virginia).
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
  /// May throw [WAFStaleDataException].
  /// May throw [WAFServiceLinkedRoleErrorException].
  ///
  /// Parameter [loggingConfiguration] :
  /// The Amazon Kinesis Data Firehose that contains the inspected traffic
  /// information, the redacted fields details, and the Amazon Resource Name
  /// (ARN) of the web ACL to monitor.
  /// <note>
  /// When specifying <code>Type</code> in <code>RedactedFields</code>, you must
  /// use one of the following values: <code>URI</code>,
  /// <code>QUERY_STRING</code>, <code>HEADER</code>, or <code>METHOD</code>.
  /// </note>
  Future<PutLoggingConfigurationResponse> putLoggingConfiguration({
    required LoggingConfiguration loggingConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.PutLoggingConfiguration'
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

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Attaches an IAM policy to the specified resource. The only supported use
  /// for this action is to share a RuleGroup across accounts.
  ///
  /// The <code>PutPermissionPolicy</code> is subject to the following
  /// restrictions:
  ///
  /// <ul>
  /// <li>
  /// You can attach only one policy with each <code>PutPermissionPolicy</code>
  /// request.
  /// </li>
  /// <li>
  /// The policy must include an <code>Effect</code>, <code>Action</code> and
  /// <code>Principal</code>.
  /// </li>
  /// <li>
  /// <code>Effect</code> must specify <code>Allow</code>.
  /// </li>
  /// <li>
  /// The <code>Action</code> in the policy must be
  /// <code>waf:UpdateWebACL</code>, <code>waf-regional:UpdateWebACL</code>,
  /// <code>waf:GetRuleGroup</code> and <code>waf-regional:GetRuleGroup</code> .
  /// Any extra or wildcard actions in the policy will be rejected.
  /// </li>
  /// <li>
  /// The policy cannot include a <code>Resource</code> parameter.
  /// </li>
  /// <li>
  /// The ARN in the request must be a valid WAF RuleGroup ARN and the RuleGroup
  /// must exist in the same region.
  /// </li>
  /// <li>
  /// The user making the request must be the owner of the RuleGroup.
  /// </li>
  /// <li>
  /// Your policy must be composed using IAM Policy version 2012-10-17.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html">IAM
  /// Policies</a>.
  ///
  /// An example of a valid policy parameter is shown in the Examples section
  /// below.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFStaleDataException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidPermissionPolicyException].
  ///
  /// Parameter [policy] :
  /// The policy to attach to the specified RuleGroup.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the RuleGroup to which you want to
  /// attach the policy.
  Future<void> putPermissionPolicy({
    required String policy,
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.PutPermissionPolicy'
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

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Associates tags with the specified AWS resource. Tags are key:value pairs
  /// that you can use to categorize and manage your resources, for purposes
  /// like billing. For example, you might set the tag key to "customer" and the
  /// value to the customer name or ID. You can specify one or more tags to add
  /// to each AWS resource, up to 50 tags for a resource.
  ///
  /// Tagging is only available through the API, SDKs, and CLI. You can't manage
  /// or view tags through the AWS WAF Classic console. You can use this action
  /// to tag the AWS resources that you manage through AWS WAF Classic: web
  /// ACLs, rule groups, and rules.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFBadRequestException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [resourceARN] :
  /// <p/>
  ///
  /// Parameter [tags] :
  /// <p/>
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.TagResource'
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

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note> <p/>
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFBadRequestException].
  /// May throw [WAFTagOperationException].
  /// May throw [WAFTagOperationInternalErrorException].
  ///
  /// Parameter [resourceARN] :
  /// <p/>
  ///
  /// Parameter [tagKeys] :
  /// <p/>
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.UntagResource'
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

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Inserts or deletes <a>ByteMatchTuple</a> objects (filters) in a
  /// <a>ByteMatchSet</a>. For each <code>ByteMatchTuple</code> object, you
  /// specify the following values:
  ///
  /// <ul>
  /// <li>
  /// Whether to insert or delete the object from the array. If you want to
  /// change a <code>ByteMatchSetUpdate</code> object, you delete the existing
  /// object and add a new one.
  /// </li>
  /// <li>
  /// The part of a web request that you want AWS WAF to inspect, such as a
  /// query string or the value of the <code>User-Agent</code> header.
  /// </li>
  /// <li>
  /// The bytes (typically a string that corresponds with ASCII characters) that
  /// you want AWS WAF to look for. For more information, including how you
  /// specify the values for the AWS WAF API and the AWS CLI or SDKs, see
  /// <code>TargetString</code> in the <a>ByteMatchTuple</a> data type.
  /// </li>
  /// <li>
  /// Where to look, such as at the beginning or the end of a query string.
  /// </li>
  /// <li>
  /// Whether to perform any conversions on the request, such as converting it
  /// to lowercase, before inspecting it for the specified string.
  /// </li>
  /// </ul>
  /// For example, you can add a <code>ByteMatchSetUpdate</code> object that
  /// matches web requests in which <code>User-Agent</code> headers contain the
  /// string <code>BadBot</code>. You can then configure AWS WAF to block those
  /// requests.
  ///
  /// To create and configure a <code>ByteMatchSet</code>, perform the following
  /// steps:
  /// <ol>
  /// <li>
  /// Create a <code>ByteMatchSet.</code> For more information, see
  /// <a>CreateByteMatchSet</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of an <code>UpdateByteMatchSet</code>
  /// request.
  /// </li>
  /// <li>
  /// Submit an <code>UpdateByteMatchSet</code> request to specify the part of
  /// the request that you want AWS WAF to inspect (for example, the header or
  /// the URI) and the value that you want AWS WAF to watch for.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentContainerException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFStaleDataException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [byteMatchSetId] :
  /// The <code>ByteMatchSetId</code> of the <a>ByteMatchSet</a> that you want
  /// to update. <code>ByteMatchSetId</code> is returned by
  /// <a>CreateByteMatchSet</a> and by <a>ListByteMatchSets</a>.
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [updates] :
  /// An array of <code>ByteMatchSetUpdate</code> objects that you want to
  /// insert into or delete from a <a>ByteMatchSet</a>. For more information,
  /// see the applicable data types:
  ///
  /// <ul>
  /// <li>
  /// <a>ByteMatchSetUpdate</a>: Contains <code>Action</code> and
  /// <code>ByteMatchTuple</code>
  /// </li>
  /// <li>
  /// <a>ByteMatchTuple</a>: Contains <code>FieldToMatch</code>,
  /// <code>PositionalConstraint</code>, <code>TargetString</code>, and
  /// <code>TextTransformation</code>
  /// </li>
  /// <li>
  /// <a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code>
  /// </li>
  /// </ul>
  Future<UpdateByteMatchSetResponse> updateByteMatchSet({
    required String byteMatchSetId,
    required String changeToken,
    required List<ByteMatchSetUpdate> updates,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.UpdateByteMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ByteMatchSetId': byteMatchSetId,
        'ChangeToken': changeToken,
        'Updates': updates,
      },
    );

    return UpdateByteMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Inserts or deletes <a>GeoMatchConstraint</a> objects in an
  /// <code>GeoMatchSet</code>. For each <code>GeoMatchConstraint</code> object,
  /// you specify the following values:
  ///
  /// <ul>
  /// <li>
  /// Whether to insert or delete the object from the array. If you want to
  /// change an <code>GeoMatchConstraint</code> object, you delete the existing
  /// object and add a new one.
  /// </li>
  /// <li>
  /// The <code>Type</code>. The only valid value for <code>Type</code> is
  /// <code>Country</code>.
  /// </li>
  /// <li>
  /// The <code>Value</code>, which is a two character code for the country to
  /// add to the <code>GeoMatchConstraint</code> object. Valid codes are listed
  /// in <a>GeoMatchConstraint$Value</a>.
  /// </li>
  /// </ul>
  /// To create and configure an <code>GeoMatchSet</code>, perform the following
  /// steps:
  /// <ol>
  /// <li>
  /// Submit a <a>CreateGeoMatchSet</a> request.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of an <a>UpdateGeoMatchSet</a> request.
  /// </li>
  /// <li>
  /// Submit an <code>UpdateGeoMatchSet</code> request to specify the country
  /// that you want AWS WAF to watch for.
  /// </li> </ol>
  /// When you update an <code>GeoMatchSet</code>, you specify the country that
  /// you want to add and/or the country that you want to delete. If you want to
  /// change a country, you delete the existing country and add the new one.
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentContainerException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [geoMatchSetId] :
  /// The <code>GeoMatchSetId</code> of the <a>GeoMatchSet</a> that you want to
  /// update. <code>GeoMatchSetId</code> is returned by <a>CreateGeoMatchSet</a>
  /// and by <a>ListGeoMatchSets</a>.
  ///
  /// Parameter [updates] :
  /// An array of <code>GeoMatchSetUpdate</code> objects that you want to insert
  /// into or delete from an <a>GeoMatchSet</a>. For more information, see the
  /// applicable data types:
  ///
  /// <ul>
  /// <li>
  /// <a>GeoMatchSetUpdate</a>: Contains <code>Action</code> and
  /// <code>GeoMatchConstraint</code>
  /// </li>
  /// <li>
  /// <a>GeoMatchConstraint</a>: Contains <code>Type</code> and
  /// <code>Value</code>
  ///
  /// You can have only one <code>Type</code> and <code>Value</code> per
  /// <code>GeoMatchConstraint</code>. To add multiple countries, include
  /// multiple <code>GeoMatchSetUpdate</code> objects in your request.
  /// </li>
  /// </ul>
  Future<UpdateGeoMatchSetResponse> updateGeoMatchSet({
    required String changeToken,
    required String geoMatchSetId,
    required List<GeoMatchSetUpdate> updates,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.UpdateGeoMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'GeoMatchSetId': geoMatchSetId,
        'Updates': updates,
      },
    );

    return UpdateGeoMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Inserts or deletes <a>IPSetDescriptor</a> objects in an
  /// <code>IPSet</code>. For each <code>IPSetDescriptor</code> object, you
  /// specify the following values:
  ///
  /// <ul>
  /// <li>
  /// Whether to insert or delete the object from the array. If you want to
  /// change an <code>IPSetDescriptor</code> object, you delete the existing
  /// object and add a new one.
  /// </li>
  /// <li>
  /// The IP address version, <code>IPv4</code> or <code>IPv6</code>.
  /// </li>
  /// <li>
  /// The IP address in CIDR notation, for example, <code>192.0.2.0/24</code>
  /// (for the range of IP addresses from <code>192.0.2.0</code> to
  /// <code>192.0.2.255</code>) or <code>192.0.2.44/32</code> (for the
  /// individual IP address <code>192.0.2.44</code>).
  /// </li>
  /// </ul>
  /// AWS WAF supports IPv4 address ranges: /8 and any range between /16 through
  /// /32. AWS WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and
  /// /128. For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  ///
  /// IPv6 addresses can be represented using any of the following formats:
  ///
  /// <ul>
  /// <li>
  /// 1111:0000:0000:0000:0000:0000:0000:0111/128
  /// </li>
  /// <li>
  /// 1111:0:0:0:0:0:0:0111/128
  /// </li>
  /// <li>
  /// 1111::0111/128
  /// </li>
  /// <li>
  /// 1111::111/128
  /// </li>
  /// </ul>
  /// You use an <code>IPSet</code> to specify which web requests you want to
  /// allow or block based on the IP addresses that the requests originated
  /// from. For example, if you're receiving a lot of requests from one or a
  /// small number of IP addresses and you want to block the requests, you can
  /// create an <code>IPSet</code> that specifies those IP addresses, and then
  /// configure AWS WAF to block the requests.
  ///
  /// To create and configure an <code>IPSet</code>, perform the following
  /// steps:
  /// <ol>
  /// <li>
  /// Submit a <a>CreateIPSet</a> request.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.
  /// </li>
  /// <li>
  /// Submit an <code>UpdateIPSet</code> request to specify the IP addresses
  /// that you want AWS WAF to watch for.
  /// </li> </ol>
  /// When you update an <code>IPSet</code>, you specify the IP addresses that
  /// you want to add and/or the IP addresses that you want to delete. If you
  /// want to change an IP address, you delete the existing IP address and add
  /// the new one.
  ///
  /// You can insert a maximum of 1000 addresses in a single request.
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentContainerException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [iPSetId] :
  /// The <code>IPSetId</code> of the <a>IPSet</a> that you want to update.
  /// <code>IPSetId</code> is returned by <a>CreateIPSet</a> and by
  /// <a>ListIPSets</a>.
  ///
  /// Parameter [updates] :
  /// An array of <code>IPSetUpdate</code> objects that you want to insert into
  /// or delete from an <a>IPSet</a>. For more information, see the applicable
  /// data types:
  ///
  /// <ul>
  /// <li>
  /// <a>IPSetUpdate</a>: Contains <code>Action</code> and
  /// <code>IPSetDescriptor</code>
  /// </li>
  /// <li>
  /// <a>IPSetDescriptor</a>: Contains <code>Type</code> and <code>Value</code>
  /// </li>
  /// </ul>
  /// You can insert a maximum of 1000 addresses in a single request.
  Future<UpdateIPSetResponse> updateIPSet({
    required String changeToken,
    required String iPSetId,
    required List<IPSetUpdate> updates,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.UpdateIPSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'IPSetId': iPSetId,
        'Updates': updates,
      },
    );

    return UpdateIPSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Inserts or deletes <a>Predicate</a> objects in a rule and updates the
  /// <code>RateLimit</code> in the rule.
  ///
  /// Each <code>Predicate</code> object identifies a predicate, such as a
  /// <a>ByteMatchSet</a> or an <a>IPSet</a>, that specifies the web requests
  /// that you want to block or count. The <code>RateLimit</code> specifies the
  /// number of requests every five minutes that triggers the rule.
  ///
  /// If you add more than one predicate to a <code>RateBasedRule</code>, a
  /// request must match all the predicates and exceed the
  /// <code>RateLimit</code> to be counted or blocked. For example, suppose you
  /// add the following to a <code>RateBasedRule</code>:
  ///
  /// <ul>
  /// <li>
  /// An <code>IPSet</code> that matches the IP address
  /// <code>192.0.2.44/32</code>
  /// </li>
  /// <li>
  /// A <code>ByteMatchSet</code> that matches <code>BadBot</code> in the
  /// <code>User-Agent</code> header
  /// </li>
  /// </ul>
  /// Further, you specify a <code>RateLimit</code> of 1,000.
  ///
  /// You then add the <code>RateBasedRule</code> to a <code>WebACL</code> and
  /// specify that you want to block requests that satisfy the rule. For a
  /// request to be blocked, it must come from the IP address 192.0.2.44
  /// <i>and</i> the <code>User-Agent</code> header in the request must contain
  /// the value <code>BadBot</code>. Further, requests that match these two
  /// conditions much be received at a rate of more than 1,000 every five
  /// minutes. If the rate drops below this limit, AWS WAF no longer blocks the
  /// requests.
  ///
  /// As a second example, suppose you want to limit requests to a particular
  /// page on your site. To do this, you could add the following to a
  /// <code>RateBasedRule</code>:
  ///
  /// <ul>
  /// <li>
  /// A <code>ByteMatchSet</code> with <code>FieldToMatch</code> of
  /// <code>URI</code>
  /// </li>
  /// <li>
  /// A <code>PositionalConstraint</code> of <code>STARTS_WITH</code>
  /// </li>
  /// <li>
  /// A <code>TargetString</code> of <code>login</code>
  /// </li>
  /// </ul>
  /// Further, you specify a <code>RateLimit</code> of 1,000.
  ///
  /// By adding this <code>RateBasedRule</code> to a <code>WebACL</code>, you
  /// could limit requests to your login page without affecting the rest of your
  /// site.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentContainerException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [rateLimit] :
  /// The maximum number of requests, which have an identical value in the field
  /// specified by the <code>RateKey</code>, allowed in a five-minute period. If
  /// the number of requests exceeds the <code>RateLimit</code> and the other
  /// predicates specified in the rule are also met, AWS WAF triggers the action
  /// that is specified for this rule.
  ///
  /// Parameter [ruleId] :
  /// The <code>RuleId</code> of the <code>RateBasedRule</code> that you want to
  /// update. <code>RuleId</code> is returned by
  /// <code>CreateRateBasedRule</code> and by <a>ListRateBasedRules</a>.
  ///
  /// Parameter [updates] :
  /// An array of <code>RuleUpdate</code> objects that you want to insert into
  /// or delete from a <a>RateBasedRule</a>.
  Future<UpdateRateBasedRuleResponse> updateRateBasedRule({
    required String changeToken,
    required int rateLimit,
    required String ruleId,
    required List<RuleUpdate> updates,
  }) async {
    _s.validateNumRange(
      'rateLimit',
      rateLimit,
      100,
      2000000000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.UpdateRateBasedRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'RateLimit': rateLimit,
        'RuleId': ruleId,
        'Updates': updates,
      },
    );

    return UpdateRateBasedRuleResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Inserts or deletes <a>RegexMatchTuple</a> objects (filters) in a
  /// <a>RegexMatchSet</a>. For each <code>RegexMatchSetUpdate</code> object,
  /// you specify the following values:
  ///
  /// <ul>
  /// <li>
  /// Whether to insert or delete the object from the array. If you want to
  /// change a <code>RegexMatchSetUpdate</code> object, you delete the existing
  /// object and add a new one.
  /// </li>
  /// <li>
  /// The part of a web request that you want AWS WAF to inspectupdate, such as
  /// a query string or the value of the <code>User-Agent</code> header.
  /// </li>
  /// <li>
  /// The identifier of the pattern (a regular expression) that you want AWS WAF
  /// to look for. For more information, see <a>RegexPatternSet</a>.
  /// </li>
  /// <li>
  /// Whether to perform any conversions on the request, such as converting it
  /// to lowercase, before inspecting it for the specified string.
  /// </li>
  /// </ul>
  /// For example, you can create a <code>RegexPatternSet</code> that matches
  /// any requests with <code>User-Agent</code> headers that contain the string
  /// <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those
  /// requests.
  ///
  /// To create and configure a <code>RegexMatchSet</code>, perform the
  /// following steps:
  /// <ol>
  /// <li>
  /// Create a <code>RegexMatchSet.</code> For more information, see
  /// <a>CreateRegexMatchSet</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of an <code>UpdateRegexMatchSet</code>
  /// request.
  /// </li>
  /// <li>
  /// Submit an <code>UpdateRegexMatchSet</code> request to specify the part of
  /// the request that you want AWS WAF to inspect (for example, the header or
  /// the URI) and the identifier of the <code>RegexPatternSet</code> that
  /// contain the regular expression patters you want AWS WAF to watch for.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFDisallowedNameException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFNonexistentContainerException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidAccountException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [regexMatchSetId] :
  /// The <code>RegexMatchSetId</code> of the <a>RegexMatchSet</a> that you want
  /// to update. <code>RegexMatchSetId</code> is returned by
  /// <a>CreateRegexMatchSet</a> and by <a>ListRegexMatchSets</a>.
  ///
  /// Parameter [updates] :
  /// An array of <code>RegexMatchSetUpdate</code> objects that you want to
  /// insert into or delete from a <a>RegexMatchSet</a>. For more information,
  /// see <a>RegexMatchTuple</a>.
  Future<UpdateRegexMatchSetResponse> updateRegexMatchSet({
    required String changeToken,
    required String regexMatchSetId,
    required List<RegexMatchSetUpdate> updates,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.UpdateRegexMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'RegexMatchSetId': regexMatchSetId,
        'Updates': updates,
      },
    );

    return UpdateRegexMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Inserts or deletes <code>RegexPatternString</code> objects in a
  /// <a>RegexPatternSet</a>. For each <code>RegexPatternString</code> object,
  /// you specify the following values:
  ///
  /// <ul>
  /// <li>
  /// Whether to insert or delete the <code>RegexPatternString</code>.
  /// </li>
  /// <li>
  /// The regular expression pattern that you want to insert or delete. For more
  /// information, see <a>RegexPatternSet</a>.
  /// </li>
  /// </ul>
  /// For example, you can create a <code>RegexPatternString</code> such as
  /// <code>B[a@]dB[o0]t</code>. AWS WAF will match this
  /// <code>RegexPatternString</code> to:
  ///
  /// <ul>
  /// <li>
  /// BadBot
  /// </li>
  /// <li>
  /// BadB0t
  /// </li>
  /// <li>
  /// B@dBot
  /// </li>
  /// <li>
  /// B@dB0t
  /// </li>
  /// </ul>
  /// To create and configure a <code>RegexPatternSet</code>, perform the
  /// following steps:
  /// <ol>
  /// <li>
  /// Create a <code>RegexPatternSet.</code> For more information, see
  /// <a>CreateRegexPatternSet</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of an
  /// <code>UpdateRegexPatternSet</code> request.
  /// </li>
  /// <li>
  /// Submit an <code>UpdateRegexPatternSet</code> request to specify the
  /// regular expression pattern that you want AWS WAF to watch for.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFNonexistentContainerException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFInvalidRegexPatternException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [regexPatternSetId] :
  /// The <code>RegexPatternSetId</code> of the <a>RegexPatternSet</a> that you
  /// want to update. <code>RegexPatternSetId</code> is returned by
  /// <a>CreateRegexPatternSet</a> and by <a>ListRegexPatternSets</a>.
  ///
  /// Parameter [updates] :
  /// An array of <code>RegexPatternSetUpdate</code> objects that you want to
  /// insert into or delete from a <a>RegexPatternSet</a>.
  Future<UpdateRegexPatternSetResponse> updateRegexPatternSet({
    required String changeToken,
    required String regexPatternSetId,
    required List<RegexPatternSetUpdate> updates,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.UpdateRegexPatternSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'RegexPatternSetId': regexPatternSetId,
        'Updates': updates,
      },
    );

    return UpdateRegexPatternSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Inserts or deletes <a>Predicate</a> objects in a <code>Rule</code>. Each
  /// <code>Predicate</code> object identifies a predicate, such as a
  /// <a>ByteMatchSet</a> or an <a>IPSet</a>, that specifies the web requests
  /// that you want to allow, block, or count. If you add more than one
  /// predicate to a <code>Rule</code>, a request must match all of the
  /// specifications to be allowed, blocked, or counted. For example, suppose
  /// that you add the following to a <code>Rule</code>:
  ///
  /// <ul>
  /// <li>
  /// A <code>ByteMatchSet</code> that matches the value <code>BadBot</code> in
  /// the <code>User-Agent</code> header
  /// </li>
  /// <li>
  /// An <code>IPSet</code> that matches the IP address <code>192.0.2.44</code>
  /// </li>
  /// </ul>
  /// You then add the <code>Rule</code> to a <code>WebACL</code> and specify
  /// that you want to block requests that satisfy the <code>Rule</code>. For a
  /// request to be blocked, the <code>User-Agent</code> header in the request
  /// must contain the value <code>BadBot</code> <i>and</i> the request must
  /// originate from the IP address 192.0.2.44.
  ///
  /// To create and configure a <code>Rule</code>, perform the following steps:
  /// <ol>
  /// <li>
  /// Create and update the predicates that you want to include in the
  /// <code>Rule</code>.
  /// </li>
  /// <li>
  /// Create the <code>Rule</code>. See <a>CreateRule</a>.
  /// </li>
  /// <li>
  /// Use <code>GetChangeToken</code> to get the change token that you provide
  /// in the <code>ChangeToken</code> parameter of an <a>UpdateRule</a> request.
  /// </li>
  /// <li>
  /// Submit an <code>UpdateRule</code> request to add predicates to the
  /// <code>Rule</code>.
  /// </li>
  /// <li>
  /// Create and update a <code>WebACL</code> that contains the
  /// <code>Rule</code>. See <a>CreateWebACL</a>.
  /// </li> </ol>
  /// If you want to replace one <code>ByteMatchSet</code> or <code>IPSet</code>
  /// with another, you delete the existing one and add the new one.
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentContainerException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [ruleId] :
  /// The <code>RuleId</code> of the <code>Rule</code> that you want to update.
  /// <code>RuleId</code> is returned by <code>CreateRule</code> and by
  /// <a>ListRules</a>.
  ///
  /// Parameter [updates] :
  /// An array of <code>RuleUpdate</code> objects that you want to insert into
  /// or delete from a <a>Rule</a>. For more information, see the applicable
  /// data types:
  ///
  /// <ul>
  /// <li>
  /// <a>RuleUpdate</a>: Contains <code>Action</code> and <code>Predicate</code>
  /// </li>
  /// <li>
  /// <a>Predicate</a>: Contains <code>DataId</code>, <code>Negated</code>, and
  /// <code>Type</code>
  /// </li>
  /// <li>
  /// <a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code>
  /// </li>
  /// </ul>
  Future<UpdateRuleResponse> updateRule({
    required String changeToken,
    required String ruleId,
    required List<RuleUpdate> updates,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.UpdateRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'RuleId': ruleId,
        'Updates': updates,
      },
    );

    return UpdateRuleResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Inserts or deletes <a>ActivatedRule</a> objects in a
  /// <code>RuleGroup</code>.
  ///
  /// You can only insert <code>REGULAR</code> rules into a rule group.
  ///
  /// You can have a maximum of ten rules per rule group.
  ///
  /// To create and configure a <code>RuleGroup</code>, perform the following
  /// steps:
  /// <ol>
  /// <li>
  /// Create and update the <code>Rules</code> that you want to include in the
  /// <code>RuleGroup</code>. See <a>CreateRule</a>.
  /// </li>
  /// <li>
  /// Use <code>GetChangeToken</code> to get the change token that you provide
  /// in the <code>ChangeToken</code> parameter of an <a>UpdateRuleGroup</a>
  /// request.
  /// </li>
  /// <li>
  /// Submit an <code>UpdateRuleGroup</code> request to add <code>Rules</code>
  /// to the <code>RuleGroup</code>.
  /// </li>
  /// <li>
  /// Create and update a <code>WebACL</code> that contains the
  /// <code>RuleGroup</code>. See <a>CreateWebACL</a>.
  /// </li> </ol>
  /// If you want to replace one <code>Rule</code> with another, you delete the
  /// existing one and add the new one.
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFNonexistentContainerException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFInvalidParameterException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [ruleGroupId] :
  /// The <code>RuleGroupId</code> of the <a>RuleGroup</a> that you want to
  /// update. <code>RuleGroupId</code> is returned by <a>CreateRuleGroup</a> and
  /// by <a>ListRuleGroups</a>.
  ///
  /// Parameter [updates] :
  /// An array of <code>RuleGroupUpdate</code> objects that you want to insert
  /// into or delete from a <a>RuleGroup</a>.
  ///
  /// You can only insert <code>REGULAR</code> rules into a rule group.
  ///
  /// <code>ActivatedRule|OverrideAction</code> applies only when updating or
  /// adding a <code>RuleGroup</code> to a <code>WebACL</code>. In this case you
  /// do not use <code>ActivatedRule|Action</code>. For all other update
  /// requests, <code>ActivatedRule|Action</code> is used instead of
  /// <code>ActivatedRule|OverrideAction</code>.
  Future<UpdateRuleGroupResponse> updateRuleGroup({
    required String changeToken,
    required String ruleGroupId,
    required List<RuleGroupUpdate> updates,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.UpdateRuleGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'RuleGroupId': ruleGroupId,
        'Updates': updates,
      },
    );

    return UpdateRuleGroupResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Inserts or deletes <a>SizeConstraint</a> objects (filters) in a
  /// <a>SizeConstraintSet</a>. For each <code>SizeConstraint</code> object, you
  /// specify the following values:
  ///
  /// <ul>
  /// <li>
  /// Whether to insert or delete the object from the array. If you want to
  /// change a <code>SizeConstraintSetUpdate</code> object, you delete the
  /// existing object and add a new one.
  /// </li>
  /// <li>
  /// The part of a web request that you want AWS WAF to evaluate, such as the
  /// length of a query string or the length of the <code>User-Agent</code>
  /// header.
  /// </li>
  /// <li>
  /// Whether to perform any transformations on the request, such as converting
  /// it to lowercase, before checking its length. Note that transformations of
  /// the request body are not supported because the AWS resource forwards only
  /// the first <code>8192</code> bytes of your request to AWS WAF.
  ///
  /// You can only specify a single type of TextTransformation.
  /// </li>
  /// <li>
  /// A <code>ComparisonOperator</code> used for evaluating the selected part of
  /// the request against the specified <code>Size</code>, such as equals,
  /// greater than, less than, and so on.
  /// </li>
  /// <li>
  /// The length, in bytes, that you want AWS WAF to watch for in selected part
  /// of the request. The length is computed after applying the transformation.
  /// </li>
  /// </ul>
  /// For example, you can add a <code>SizeConstraintSetUpdate</code> object
  /// that matches web requests in which the length of the
  /// <code>User-Agent</code> header is greater than 100 bytes. You can then
  /// configure AWS WAF to block those requests.
  ///
  /// To create and configure a <code>SizeConstraintSet</code>, perform the
  /// following steps:
  /// <ol>
  /// <li>
  /// Create a <code>SizeConstraintSet.</code> For more information, see
  /// <a>CreateSizeConstraintSet</a>.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of an
  /// <code>UpdateSizeConstraintSet</code> request.
  /// </li>
  /// <li>
  /// Submit an <code>UpdateSizeConstraintSet</code> request to specify the part
  /// of the request that you want AWS WAF to inspect (for example, the header
  /// or the URI) and the value that you want AWS WAF to watch for.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentContainerException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [sizeConstraintSetId] :
  /// The <code>SizeConstraintSetId</code> of the <a>SizeConstraintSet</a> that
  /// you want to update. <code>SizeConstraintSetId</code> is returned by
  /// <a>CreateSizeConstraintSet</a> and by <a>ListSizeConstraintSets</a>.
  ///
  /// Parameter [updates] :
  /// An array of <code>SizeConstraintSetUpdate</code> objects that you want to
  /// insert into or delete from a <a>SizeConstraintSet</a>. For more
  /// information, see the applicable data types:
  ///
  /// <ul>
  /// <li>
  /// <a>SizeConstraintSetUpdate</a>: Contains <code>Action</code> and
  /// <code>SizeConstraint</code>
  /// </li>
  /// <li>
  /// <a>SizeConstraint</a>: Contains <code>FieldToMatch</code>,
  /// <code>TextTransformation</code>, <code>ComparisonOperator</code>, and
  /// <code>Size</code>
  /// </li>
  /// <li>
  /// <a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code>
  /// </li>
  /// </ul>
  Future<UpdateSizeConstraintSetResponse> updateSizeConstraintSet({
    required String changeToken,
    required String sizeConstraintSetId,
    required List<SizeConstraintSetUpdate> updates,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.UpdateSizeConstraintSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'SizeConstraintSetId': sizeConstraintSetId,
        'Updates': updates,
      },
    );

    return UpdateSizeConstraintSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Inserts or deletes <a>SqlInjectionMatchTuple</a> objects (filters) in a
  /// <a>SqlInjectionMatchSet</a>. For each <code>SqlInjectionMatchTuple</code>
  /// object, you specify the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>Action</code>: Whether to insert the object into or delete the
  /// object from the array. To change a <code>SqlInjectionMatchTuple</code>,
  /// you delete the existing object and add a new one.
  /// </li>
  /// <li>
  /// <code>FieldToMatch</code>: The part of web requests that you want AWS WAF
  /// to inspect and, if you want AWS WAF to inspect a header or custom query
  /// parameter, the name of the header or parameter.
  /// </li>
  /// <li>
  /// <code>TextTransformation</code>: Which text transformation, if any, to
  /// perform on the web request before inspecting the request for snippets of
  /// malicious SQL code.
  ///
  /// You can only specify a single type of TextTransformation.
  /// </li>
  /// </ul>
  /// You use <code>SqlInjectionMatchSet</code> objects to specify which
  /// CloudFront requests that you want to allow, block, or count. For example,
  /// if you're receiving requests that contain snippets of SQL code in the
  /// query string and you want to block the requests, you can create a
  /// <code>SqlInjectionMatchSet</code> with the applicable settings, and then
  /// configure AWS WAF to block the requests.
  ///
  /// To create and configure a <code>SqlInjectionMatchSet</code>, perform the
  /// following steps:
  /// <ol>
  /// <li>
  /// Submit a <a>CreateSqlInjectionMatchSet</a> request.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.
  /// </li>
  /// <li>
  /// Submit an <code>UpdateSqlInjectionMatchSet</code> request to specify the
  /// parts of web requests that you want AWS WAF to inspect for snippets of SQL
  /// code.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentContainerException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFStaleDataException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [sqlInjectionMatchSetId] :
  /// The <code>SqlInjectionMatchSetId</code> of the
  /// <code>SqlInjectionMatchSet</code> that you want to update.
  /// <code>SqlInjectionMatchSetId</code> is returned by
  /// <a>CreateSqlInjectionMatchSet</a> and by <a>ListSqlInjectionMatchSets</a>.
  ///
  /// Parameter [updates] :
  /// An array of <code>SqlInjectionMatchSetUpdate</code> objects that you want
  /// to insert into or delete from a <a>SqlInjectionMatchSet</a>. For more
  /// information, see the applicable data types:
  ///
  /// <ul>
  /// <li>
  /// <a>SqlInjectionMatchSetUpdate</a>: Contains <code>Action</code> and
  /// <code>SqlInjectionMatchTuple</code>
  /// </li>
  /// <li>
  /// <a>SqlInjectionMatchTuple</a>: Contains <code>FieldToMatch</code> and
  /// <code>TextTransformation</code>
  /// </li>
  /// <li>
  /// <a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code>
  /// </li>
  /// </ul>
  Future<UpdateSqlInjectionMatchSetResponse> updateSqlInjectionMatchSet({
    required String changeToken,
    required String sqlInjectionMatchSetId,
    required List<SqlInjectionMatchSetUpdate> updates,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.UpdateSqlInjectionMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'SqlInjectionMatchSetId': sqlInjectionMatchSetId,
        'Updates': updates,
      },
    );

    return UpdateSqlInjectionMatchSetResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Inserts or deletes <a>ActivatedRule</a> objects in a <code>WebACL</code>.
  /// Each <code>Rule</code> identifies web requests that you want to allow,
  /// block, or count. When you update a <code>WebACL</code>, you specify the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// A default action for the <code>WebACL</code>, either <code>ALLOW</code> or
  /// <code>BLOCK</code>. AWS WAF performs the default action if a request
  /// doesn't match the criteria in any of the <code>Rules</code> in a
  /// <code>WebACL</code>.
  /// </li>
  /// <li>
  /// The <code>Rules</code> that you want to add or delete. If you want to
  /// replace one <code>Rule</code> with another, you delete the existing
  /// <code>Rule</code> and add the new one.
  /// </li>
  /// <li>
  /// For each <code>Rule</code>, whether you want AWS WAF to allow requests,
  /// block requests, or count requests that match the conditions in the
  /// <code>Rule</code>.
  /// </li>
  /// <li>
  /// The order in which you want AWS WAF to evaluate the <code>Rules</code> in
  /// a <code>WebACL</code>. If you add more than one <code>Rule</code> to a
  /// <code>WebACL</code>, AWS WAF evaluates each request against the
  /// <code>Rules</code> in order based on the value of <code>Priority</code>.
  /// (The <code>Rule</code> that has the lowest value for <code>Priority</code>
  /// is evaluated first.) When a web request matches all the predicates (such
  /// as <code>ByteMatchSets</code> and <code>IPSets</code>) in a
  /// <code>Rule</code>, AWS WAF immediately takes the corresponding action,
  /// allow or block, and doesn't evaluate the request against the remaining
  /// <code>Rules</code> in the <code>WebACL</code>, if any.
  /// </li>
  /// </ul>
  /// To create and configure a <code>WebACL</code>, perform the following
  /// steps:
  /// <ol>
  /// <li>
  /// Create and update the predicates that you want to include in
  /// <code>Rules</code>. For more information, see <a>CreateByteMatchSet</a>,
  /// <a>UpdateByteMatchSet</a>, <a>CreateIPSet</a>, <a>UpdateIPSet</a>,
  /// <a>CreateSqlInjectionMatchSet</a>, and <a>UpdateSqlInjectionMatchSet</a>.
  /// </li>
  /// <li>
  /// Create and update the <code>Rules</code> that you want to include in the
  /// <code>WebACL</code>. For more information, see <a>CreateRule</a> and
  /// <a>UpdateRule</a>.
  /// </li>
  /// <li>
  /// Create a <code>WebACL</code>. See <a>CreateWebACL</a>.
  /// </li>
  /// <li>
  /// Use <code>GetChangeToken</code> to get the change token that you provide
  /// in the <code>ChangeToken</code> parameter of an <a>UpdateWebACL</a>
  /// request.
  /// </li>
  /// <li>
  /// Submit an <code>UpdateWebACL</code> request to specify the
  /// <code>Rules</code> that you want to include in the <code>WebACL</code>, to
  /// specify the default action, and to associate the <code>WebACL</code> with
  /// a CloudFront distribution.
  ///
  /// The <code>ActivatedRule</code> can be a rule group. If you specify a rule
  /// group as your <code>ActivatedRule</code> , you can exclude specific rules
  /// from that rule group.
  ///
  /// If you already have a rule group associated with a web ACL and want to
  /// submit an <code>UpdateWebACL</code> request to exclude certain rules from
  /// that rule group, you must first remove the rule group from the web ACL,
  /// the re-insert it again, specifying the excluded rules. For details, see
  /// <a>ActivatedRule$ExcludedRules</a> .
  /// </li> </ol>
  /// Be aware that if you try to add a RATE_BASED rule to a web ACL without
  /// setting the rule type when first creating the rule, the
  /// <a>UpdateWebACL</a> request will fail because the request tries to add a
  /// REGULAR rule (the default rule type) with the specified ID, which does not
  /// exist.
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFStaleDataException].
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentContainerException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFReferencedItemException].
  /// May throw [WAFLimitsExceededException].
  /// May throw [WAFSubscriptionNotFoundException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [webACLId] :
  /// The <code>WebACLId</code> of the <a>WebACL</a> that you want to update.
  /// <code>WebACLId</code> is returned by <a>CreateWebACL</a> and by
  /// <a>ListWebACLs</a>.
  ///
  /// Parameter [defaultAction] :
  /// A default action for the web ACL, either ALLOW or BLOCK. AWS WAF performs
  /// the default action if a request doesn't match the criteria in any of the
  /// rules in a web ACL.
  ///
  /// Parameter [updates] :
  /// An array of updates to make to the <a>WebACL</a>.
  ///
  /// An array of <code>WebACLUpdate</code> objects that you want to insert into
  /// or delete from a <a>WebACL</a>. For more information, see the applicable
  /// data types:
  ///
  /// <ul>
  /// <li>
  /// <a>WebACLUpdate</a>: Contains <code>Action</code> and
  /// <code>ActivatedRule</code>
  /// </li>
  /// <li>
  /// <a>ActivatedRule</a>: Contains <code>Action</code>,
  /// <code>OverrideAction</code>, <code>Priority</code>, <code>RuleId</code>,
  /// and <code>Type</code>. <code>ActivatedRule|OverrideAction</code> applies
  /// only when updating or adding a <code>RuleGroup</code> to a
  /// <code>WebACL</code>. In this case, you do not use
  /// <code>ActivatedRule|Action</code>. For all other update requests,
  /// <code>ActivatedRule|Action</code> is used instead of
  /// <code>ActivatedRule|OverrideAction</code>.
  /// </li>
  /// <li>
  /// <a>WafAction</a>: Contains <code>Type</code>
  /// </li>
  /// </ul>
  Future<UpdateWebACLResponse> updateWebACL({
    required String changeToken,
    required String webACLId,
    WafAction? defaultAction,
    List<WebACLUpdate>? updates,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.UpdateWebACL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'WebACLId': webACLId,
        if (defaultAction != null) 'DefaultAction': defaultAction,
        if (updates != null) 'Updates': updates,
      },
    );

    return UpdateWebACLResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
  /// WAF Classic</a> in the developer guide.
  ///
  /// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see
  /// the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
  /// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
  /// of endpoints for regional and global use.
  /// </note>
  /// Inserts or deletes <a>XssMatchTuple</a> objects (filters) in an
  /// <a>XssMatchSet</a>. For each <code>XssMatchTuple</code> object, you
  /// specify the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>Action</code>: Whether to insert the object into or delete the
  /// object from the array. To change an <code>XssMatchTuple</code>, you delete
  /// the existing object and add a new one.
  /// </li>
  /// <li>
  /// <code>FieldToMatch</code>: The part of web requests that you want AWS WAF
  /// to inspect and, if you want AWS WAF to inspect a header or custom query
  /// parameter, the name of the header or parameter.
  /// </li>
  /// <li>
  /// <code>TextTransformation</code>: Which text transformation, if any, to
  /// perform on the web request before inspecting the request for cross-site
  /// scripting attacks.
  ///
  /// You can only specify a single type of TextTransformation.
  /// </li>
  /// </ul>
  /// You use <code>XssMatchSet</code> objects to specify which CloudFront
  /// requests that you want to allow, block, or count. For example, if you're
  /// receiving requests that contain cross-site scripting attacks in the
  /// request body and you want to block the requests, you can create an
  /// <code>XssMatchSet</code> with the applicable settings, and then configure
  /// AWS WAF to block the requests.
  ///
  /// To create and configure an <code>XssMatchSet</code>, perform the following
  /// steps:
  /// <ol>
  /// <li>
  /// Submit a <a>CreateXssMatchSet</a> request.
  /// </li>
  /// <li>
  /// Use <a>GetChangeToken</a> to get the change token that you provide in the
  /// <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.
  /// </li>
  /// <li>
  /// Submit an <code>UpdateXssMatchSet</code> request to specify the parts of
  /// web requests that you want AWS WAF to inspect for cross-site scripting
  /// attacks.
  /// </li> </ol>
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF
  /// Developer Guide</a>.
  ///
  /// May throw [WAFInternalErrorException].
  /// May throw [WAFInvalidAccountException].
  /// May throw [WAFInvalidOperationException].
  /// May throw [WAFInvalidParameterException].
  /// May throw [WAFNonexistentContainerException].
  /// May throw [WAFNonexistentItemException].
  /// May throw [WAFStaleDataException].
  /// May throw [WAFLimitsExceededException].
  ///
  /// Parameter [changeToken] :
  /// The value returned by the most recent call to <a>GetChangeToken</a>.
  ///
  /// Parameter [updates] :
  /// An array of <code>XssMatchSetUpdate</code> objects that you want to insert
  /// into or delete from an <a>XssMatchSet</a>. For more information, see the
  /// applicable data types:
  ///
  /// <ul>
  /// <li>
  /// <a>XssMatchSetUpdate</a>: Contains <code>Action</code> and
  /// <code>XssMatchTuple</code>
  /// </li>
  /// <li>
  /// <a>XssMatchTuple</a>: Contains <code>FieldToMatch</code> and
  /// <code>TextTransformation</code>
  /// </li>
  /// <li>
  /// <a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [xssMatchSetId] :
  /// The <code>XssMatchSetId</code> of the <code>XssMatchSet</code> that you
  /// want to update. <code>XssMatchSetId</code> is returned by
  /// <a>CreateXssMatchSet</a> and by <a>ListXssMatchSets</a>.
  Future<UpdateXssMatchSetResponse> updateXssMatchSet({
    required String changeToken,
    required List<XssMatchSetUpdate> updates,
    required String xssMatchSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSWAF_20150824.UpdateXssMatchSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChangeToken': changeToken,
        'Updates': updates,
        'XssMatchSetId': xssMatchSetId,
      },
    );

    return UpdateXssMatchSetResponse.fromJson(jsonResponse.body);
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// The <code>ActivatedRule</code> object in an <a>UpdateWebACL</a> request
/// specifies a <code>Rule</code> that you want to insert or delete, the
/// priority of the <code>Rule</code> in the <code>WebACL</code>, and the action
/// that you want AWS WAF to take when a web request matches the
/// <code>Rule</code> (<code>ALLOW</code>, <code>BLOCK</code>, or
/// <code>COUNT</code>).
///
/// To specify whether to insert or delete a <code>Rule</code>, use the
/// <code>Action</code> parameter in the <a>WebACLUpdate</a> data type.
class ActivatedRule {
  /// Specifies the order in which the <code>Rules</code> in a <code>WebACL</code>
  /// are evaluated. Rules with a lower value for <code>Priority</code> are
  /// evaluated before <code>Rules</code> with a higher value. The value must be a
  /// unique integer. If you add multiple <code>Rules</code> to a
  /// <code>WebACL</code>, the values don't need to be consecutive.
  final int priority;

  /// The <code>RuleId</code> for a <code>Rule</code>. You use <code>RuleId</code>
  /// to get more information about a <code>Rule</code> (see <a>GetRule</a>),
  /// update a <code>Rule</code> (see <a>UpdateRule</a>), insert a
  /// <code>Rule</code> into a <code>WebACL</code> or delete a one from a
  /// <code>WebACL</code> (see <a>UpdateWebACL</a>), or delete a <code>Rule</code>
  /// from AWS WAF (see <a>DeleteRule</a>).
  ///
  /// <code>RuleId</code> is returned by <a>CreateRule</a> and by
  /// <a>ListRules</a>.
  final String ruleId;

  /// Specifies the action that CloudFront or AWS WAF takes when a web request
  /// matches the conditions in the <code>Rule</code>. Valid values for
  /// <code>Action</code> include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ALLOW</code>: CloudFront responds with the requested object.
  /// </li>
  /// <li>
  /// <code>BLOCK</code>: CloudFront responds with an HTTP 403 (Forbidden) status
  /// code.
  /// </li>
  /// <li>
  /// <code>COUNT</code>: AWS WAF increments a counter of requests that match the
  /// conditions in the rule and then continues to inspect the web request based
  /// on the remaining rules in the web ACL.
  /// </li>
  /// </ul>
  /// <code>ActivatedRule|OverrideAction</code> applies only when updating or
  /// adding a <code>RuleGroup</code> to a <code>WebACL</code>. In this case, you
  /// do not use <code>ActivatedRule|Action</code>. For all other update requests,
  /// <code>ActivatedRule|Action</code> is used instead of
  /// <code>ActivatedRule|OverrideAction</code>.
  final WafAction? action;

  /// An array of rules to exclude from a rule group. This is applicable only when
  /// the <code>ActivatedRule</code> refers to a <code>RuleGroup</code>.
  ///
  /// Sometimes it is necessary to troubleshoot rule groups that are blocking
  /// traffic unexpectedly (false positives). One troubleshooting technique is to
  /// identify the specific rule within the rule group that is blocking the
  /// legitimate traffic and then disable (exclude) that particular rule. You can
  /// exclude rules from both your own rule groups and AWS Marketplace rule groups
  /// that have been associated with a web ACL.
  ///
  /// Specifying <code>ExcludedRules</code> does not remove those rules from the
  /// rule group. Rather, it changes the action for the rules to
  /// <code>COUNT</code>. Therefore, requests that match an
  /// <code>ExcludedRule</code> are counted but not blocked. The
  /// <code>RuleGroup</code> owner will receive COUNT metrics for each
  /// <code>ExcludedRule</code>.
  ///
  /// If you want to exclude rules from a rule group that is already associated
  /// with a web ACL, perform the following steps:
  /// <ol>
  /// <li>
  /// Use the AWS WAF logs to identify the IDs of the rules that you want to
  /// exclude. For more information about the logs, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/logging.html">Logging
  /// Web ACL Traffic Information</a>.
  /// </li>
  /// <li>
  /// Submit an <a>UpdateWebACL</a> request that has two actions:
  ///
  /// <ul>
  /// <li>
  /// The first action deletes the existing rule group from the web ACL. That is,
  /// in the <a>UpdateWebACL</a> request, the first <code>Updates:Action</code>
  /// should be <code>DELETE</code> and <code>Updates:ActivatedRule:RuleId</code>
  /// should be the rule group that contains the rules that you want to exclude.
  /// </li>
  /// <li>
  /// The second action inserts the same rule group back in, but specifying the
  /// rules to exclude. That is, the second <code>Updates:Action</code> should be
  /// <code>INSERT</code>, <code>Updates:ActivatedRule:RuleId</code> should be the
  /// rule group that you just removed, and <code>ExcludedRules</code> should
  /// contain the rules that you want to exclude.
  /// </li>
  /// </ul> </li> </ol>
  final List<ExcludedRule>? excludedRules;

  /// Use the <code>OverrideAction</code> to test your <code>RuleGroup</code>.
  ///
  /// Any rule in a <code>RuleGroup</code> can potentially block a request. If you
  /// set the <code>OverrideAction</code> to <code>None</code>, the
  /// <code>RuleGroup</code> will block a request if any individual rule in the
  /// <code>RuleGroup</code> matches the request and is configured to block that
  /// request. However if you first want to test the <code>RuleGroup</code>, set
  /// the <code>OverrideAction</code> to <code>Count</code>. The
  /// <code>RuleGroup</code> will then override any block action specified by
  /// individual rules contained within the group. Instead of blocking matching
  /// requests, those requests will be counted. You can view a record of counted
  /// requests using <a>GetSampledRequests</a>.
  ///
  /// <code>ActivatedRule|OverrideAction</code> applies only when updating or
  /// adding a <code>RuleGroup</code> to a <code>WebACL</code>. In this case you
  /// do not use <code>ActivatedRule|Action</code>. For all other update requests,
  /// <code>ActivatedRule|Action</code> is used instead of
  /// <code>ActivatedRule|OverrideAction</code>.
  final WafOverrideAction? overrideAction;

  /// The rule type, either <code>REGULAR</code>, as defined by <a>Rule</a>,
  /// <code>RATE_BASED</code>, as defined by <a>RateBasedRule</a>, or
  /// <code>GROUP</code>, as defined by <a>RuleGroup</a>. The default is REGULAR.
  /// Although this field is optional, be aware that if you try to add a
  /// RATE_BASED rule to a web ACL without setting the type, the
  /// <a>UpdateWebACL</a> request will fail because the request tries to add a
  /// REGULAR rule with the specified ID, which does not exist.
  final WafRuleType? type;

  ActivatedRule({
    required this.priority,
    required this.ruleId,
    this.action,
    this.excludedRules,
    this.overrideAction,
    this.type,
  });

  factory ActivatedRule.fromJson(Map<String, dynamic> json) {
    return ActivatedRule(
      priority: json['Priority'] as int,
      ruleId: json['RuleId'] as String,
      action: json['Action'] != null
          ? WafAction.fromJson(json['Action'] as Map<String, dynamic>)
          : null,
      excludedRules: (json['ExcludedRules'] as List?)
          ?.whereNotNull()
          .map((e) => ExcludedRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      overrideAction: json['OverrideAction'] != null
          ? WafOverrideAction.fromJson(
              json['OverrideAction'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toWafRuleType(),
    );
  }

  Map<String, dynamic> toJson() {
    final priority = this.priority;
    final ruleId = this.ruleId;
    final action = this.action;
    final excludedRules = this.excludedRules;
    final overrideAction = this.overrideAction;
    final type = this.type;
    return {
      'Priority': priority,
      'RuleId': ruleId,
      if (action != null) 'Action': action,
      if (excludedRules != null) 'ExcludedRules': excludedRules,
      if (overrideAction != null) 'OverrideAction': overrideAction,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// In a <a>GetByteMatchSet</a> request, <code>ByteMatchSet</code> is a complex
/// type that contains the <code>ByteMatchSetId</code> and <code>Name</code> of
/// a <code>ByteMatchSet</code>, and the values that you specified when you
/// updated the <code>ByteMatchSet</code>.
///
/// A complex type that contains <code>ByteMatchTuple</code> objects, which
/// specify the parts of web requests that you want AWS WAF to inspect and the
/// values that you want AWS WAF to search for. If a <code>ByteMatchSet</code>
/// contains more than one <code>ByteMatchTuple</code> object, a request needs
/// to match the settings in only one <code>ByteMatchTuple</code> to be
/// considered a match.
class ByteMatchSet {
  /// The <code>ByteMatchSetId</code> for a <code>ByteMatchSet</code>. You use
  /// <code>ByteMatchSetId</code> to get information about a
  /// <code>ByteMatchSet</code> (see <a>GetByteMatchSet</a>), update a
  /// <code>ByteMatchSet</code> (see <a>UpdateByteMatchSet</a>), insert a
  /// <code>ByteMatchSet</code> into a <code>Rule</code> or delete one from a
  /// <code>Rule</code> (see <a>UpdateRule</a>), and delete a
  /// <code>ByteMatchSet</code> from AWS WAF (see <a>DeleteByteMatchSet</a>).
  ///
  /// <code>ByteMatchSetId</code> is returned by <a>CreateByteMatchSet</a> and by
  /// <a>ListByteMatchSets</a>.
  final String byteMatchSetId;

  /// Specifies the bytes (typically a string that corresponds with ASCII
  /// characters) that you want AWS WAF to search for in web requests, the
  /// location in requests that you want AWS WAF to search, and other settings.
  final List<ByteMatchTuple> byteMatchTuples;

  /// A friendly name or description of the <a>ByteMatchSet</a>. You can't change
  /// <code>Name</code> after you create a <code>ByteMatchSet</code>.
  final String? name;

  ByteMatchSet({
    required this.byteMatchSetId,
    required this.byteMatchTuples,
    this.name,
  });

  factory ByteMatchSet.fromJson(Map<String, dynamic> json) {
    return ByteMatchSet(
      byteMatchSetId: json['ByteMatchSetId'] as String,
      byteMatchTuples: (json['ByteMatchTuples'] as List)
          .whereNotNull()
          .map((e) => ByteMatchTuple.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final byteMatchSetId = this.byteMatchSetId;
    final byteMatchTuples = this.byteMatchTuples;
    final name = this.name;
    return {
      'ByteMatchSetId': byteMatchSetId,
      'ByteMatchTuples': byteMatchTuples,
      if (name != null) 'Name': name,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Returned by <a>ListByteMatchSets</a>. Each <code>ByteMatchSetSummary</code>
/// object includes the <code>Name</code> and <code>ByteMatchSetId</code> for
/// one <a>ByteMatchSet</a>.
class ByteMatchSetSummary {
  /// The <code>ByteMatchSetId</code> for a <code>ByteMatchSet</code>. You use
  /// <code>ByteMatchSetId</code> to get information about a
  /// <code>ByteMatchSet</code>, update a <code>ByteMatchSet</code>, remove a
  /// <code>ByteMatchSet</code> from a <code>Rule</code>, and delete a
  /// <code>ByteMatchSet</code> from AWS WAF.
  ///
  /// <code>ByteMatchSetId</code> is returned by <a>CreateByteMatchSet</a> and by
  /// <a>ListByteMatchSets</a>.
  final String byteMatchSetId;

  /// A friendly name or description of the <a>ByteMatchSet</a>. You can't change
  /// <code>Name</code> after you create a <code>ByteMatchSet</code>.
  final String name;

  ByteMatchSetSummary({
    required this.byteMatchSetId,
    required this.name,
  });

  factory ByteMatchSetSummary.fromJson(Map<String, dynamic> json) {
    return ByteMatchSetSummary(
      byteMatchSetId: json['ByteMatchSetId'] as String,
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final byteMatchSetId = this.byteMatchSetId;
    final name = this.name;
    return {
      'ByteMatchSetId': byteMatchSetId,
      'Name': name,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// In an <a>UpdateByteMatchSet</a> request, <code>ByteMatchSetUpdate</code>
/// specifies whether to insert or delete a <a>ByteMatchTuple</a> and includes
/// the settings for the <code>ByteMatchTuple</code>.
class ByteMatchSetUpdate {
  /// Specifies whether to insert or delete a <a>ByteMatchTuple</a>.
  final ChangeAction action;

  /// Information about the part of a web request that you want AWS WAF to inspect
  /// and the value that you want AWS WAF to search for. If you specify
  /// <code>DELETE</code> for the value of <code>Action</code>, the
  /// <code>ByteMatchTuple</code> values must exactly match the values in the
  /// <code>ByteMatchTuple</code> that you want to delete from the
  /// <code>ByteMatchSet</code>.
  final ByteMatchTuple byteMatchTuple;

  ByteMatchSetUpdate({
    required this.action,
    required this.byteMatchTuple,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final byteMatchTuple = this.byteMatchTuple;
    return {
      'Action': action.toValue(),
      'ByteMatchTuple': byteMatchTuple,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// The bytes (typically a string that corresponds with ASCII characters) that
/// you want AWS WAF to search for in web requests, the location in requests
/// that you want AWS WAF to search, and other settings.
class ByteMatchTuple {
  /// The part of a web request that you want AWS WAF to search, such as a
  /// specified header or a query string. For more information, see
  /// <a>FieldToMatch</a>.
  final FieldToMatch fieldToMatch;

  /// Within the portion of a web request that you want to search (for example, in
  /// the query string, if any), specify where you want AWS WAF to search. Valid
  /// values include the following:
  ///
  /// <b>CONTAINS</b>
  ///
  /// The specified part of the web request must include the value of
  /// <code>TargetString</code>, but the location doesn't matter.
  ///
  /// <b>CONTAINS_WORD</b>
  ///
  /// The specified part of the web request must include the value of
  /// <code>TargetString</code>, and <code>TargetString</code> must contain only
  /// alphanumeric characters or underscore (A-Z, a-z, 0-9, or _). In addition,
  /// <code>TargetString</code> must be a word, which means one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>TargetString</code> exactly matches the value of the specified part of
  /// the web request, such as the value of a header.
  /// </li>
  /// <li>
  /// <code>TargetString</code> is at the beginning of the specified part of the
  /// web request and is followed by a character other than an alphanumeric
  /// character or underscore (_), for example, <code>BadBot;</code>.
  /// </li>
  /// <li>
  /// <code>TargetString</code> is at the end of the specified part of the web
  /// request and is preceded by a character other than an alphanumeric character
  /// or underscore (_), for example, <code>;BadBot</code>.
  /// </li>
  /// <li>
  /// <code>TargetString</code> is in the middle of the specified part of the web
  /// request and is preceded and followed by characters other than alphanumeric
  /// characters or underscore (_), for example, <code>-BadBot;</code>.
  /// </li>
  /// </ul>
  /// <b>EXACTLY</b>
  ///
  /// The value of the specified part of the web request must exactly match the
  /// value of <code>TargetString</code>.
  ///
  /// <b>STARTS_WITH</b>
  ///
  /// The value of <code>TargetString</code> must appear at the beginning of the
  /// specified part of the web request.
  ///
  /// <b>ENDS_WITH</b>
  ///
  /// The value of <code>TargetString</code> must appear at the end of the
  /// specified part of the web request.
  final PositionalConstraint positionalConstraint;

  /// The value that you want AWS WAF to search for. AWS WAF searches for the
  /// specified string in the part of web requests that you specified in
  /// <code>FieldToMatch</code>. The maximum length of the value is 50 bytes.
  ///
  /// Valid values depend on the values that you specified for
  /// <code>FieldToMatch</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>HEADER</code>: The value that you want AWS WAF to search for in the
  /// request header that you specified in <a>FieldToMatch</a>, for example, the
  /// value of the <code>User-Agent</code> or <code>Referer</code> header.
  /// </li>
  /// <li>
  /// <code>METHOD</code>: The HTTP method, which indicates the type of operation
  /// specified in the request. CloudFront supports the following methods:
  /// <code>DELETE</code>, <code>GET</code>, <code>HEAD</code>,
  /// <code>OPTIONS</code>, <code>PATCH</code>, <code>POST</code>, and
  /// <code>PUT</code>.
  /// </li>
  /// <li>
  /// <code>QUERY_STRING</code>: The value that you want AWS WAF to search for in
  /// the query string, which is the part of a URL that appears after a
  /// <code>?</code> character.
  /// </li>
  /// <li>
  /// <code>URI</code>: The value that you want AWS WAF to search for in the part
  /// of a URL that identifies a resource, for example,
  /// <code>/images/daily-ad.jpg</code>.
  /// </li>
  /// <li>
  /// <code>BODY</code>: The part of a request that contains any additional data
  /// that you want to send to your web server as the HTTP request body, such as
  /// data from a form. The request body immediately follows the request headers.
  /// Note that only the first <code>8192</code> bytes of the request body are
  /// forwarded to AWS WAF for inspection. To allow or block requests based on the
  /// length of the body, you can create a size constraint set. For more
  /// information, see <a>CreateSizeConstraintSet</a>.
  /// </li>
  /// <li>
  /// <code>SINGLE_QUERY_ARG</code>: The parameter in the query string that you
  /// will inspect, such as <i>UserName</i> or <i>SalesRegion</i>. The maximum
  /// length for <code>SINGLE_QUERY_ARG</code> is 30 characters.
  /// </li>
  /// <li>
  /// <code>ALL_QUERY_ARGS</code>: Similar to <code>SINGLE_QUERY_ARG</code>, but
  /// instead of inspecting a single parameter, AWS WAF inspects all parameters
  /// within the query string for the value or regex pattern that you specify in
  /// <code>TargetString</code>.
  /// </li>
  /// </ul>
  /// If <code>TargetString</code> includes alphabetic characters A-Z and a-z,
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
  /// the value of <code>TargetString</code>.
  ///
  /// <b>If you're using the AWS CLI or one of the AWS SDKs</b>
  ///
  /// The value that you want AWS WAF to search for. The SDK automatically base64
  /// encodes the value.
  final Uint8List targetString;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass AWS WAF. If you specify a
  /// transformation, AWS WAF performs the transformation on
  /// <code>FieldToMatch</code> before inspecting it for a match.
  ///
  /// You can only specify a single type of TextTransformation.
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
  /// Specify <code>NONE</code> if you don't want to perform any text
  /// transformations.
  final TextTransformation textTransformation;

  ByteMatchTuple({
    required this.fieldToMatch,
    required this.positionalConstraint,
    required this.targetString,
    required this.textTransformation,
  });

  factory ByteMatchTuple.fromJson(Map<String, dynamic> json) {
    return ByteMatchTuple(
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      positionalConstraint:
          (json['PositionalConstraint'] as String).toPositionalConstraint(),
      targetString: _s.decodeUint8List(json['TargetString']! as String),
      textTransformation:
          (json['TextTransformation'] as String).toTextTransformation(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldToMatch = this.fieldToMatch;
    final positionalConstraint = this.positionalConstraint;
    final targetString = this.targetString;
    final textTransformation = this.textTransformation;
    return {
      'FieldToMatch': fieldToMatch,
      'PositionalConstraint': positionalConstraint.toValue(),
      'TargetString': base64Encode(targetString),
      'TextTransformation': textTransformation.toValue(),
    };
  }
}

enum ChangeAction {
  insert,
  delete,
}

extension ChangeActionValueExtension on ChangeAction {
  String toValue() {
    switch (this) {
      case ChangeAction.insert:
        return 'INSERT';
      case ChangeAction.delete:
        return 'DELETE';
    }
  }
}

extension ChangeActionFromString on String {
  ChangeAction toChangeAction() {
    switch (this) {
      case 'INSERT':
        return ChangeAction.insert;
      case 'DELETE':
        return ChangeAction.delete;
    }
    throw Exception('$this is not known in enum ChangeAction');
  }
}

enum ChangeTokenStatus {
  provisioned,
  pending,
  insync,
}

extension ChangeTokenStatusValueExtension on ChangeTokenStatus {
  String toValue() {
    switch (this) {
      case ChangeTokenStatus.provisioned:
        return 'PROVISIONED';
      case ChangeTokenStatus.pending:
        return 'PENDING';
      case ChangeTokenStatus.insync:
        return 'INSYNC';
    }
  }
}

extension ChangeTokenStatusFromString on String {
  ChangeTokenStatus toChangeTokenStatus() {
    switch (this) {
      case 'PROVISIONED':
        return ChangeTokenStatus.provisioned;
      case 'PENDING':
        return ChangeTokenStatus.pending;
      case 'INSYNC':
        return ChangeTokenStatus.insync;
    }
    throw Exception('$this is not known in enum ChangeTokenStatus');
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

class CreateByteMatchSetResponse {
  /// A <a>ByteMatchSet</a> that contains no <code>ByteMatchTuple</code> objects.
  final ByteMatchSet? byteMatchSet;

  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>CreateByteMatchSet</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  CreateByteMatchSetResponse({
    this.byteMatchSet,
    this.changeToken,
  });

  factory CreateByteMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateByteMatchSetResponse(
      byteMatchSet: json['ByteMatchSet'] != null
          ? ByteMatchSet.fromJson(json['ByteMatchSet'] as Map<String, dynamic>)
          : null,
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final byteMatchSet = this.byteMatchSet;
    final changeToken = this.changeToken;
    return {
      if (byteMatchSet != null) 'ByteMatchSet': byteMatchSet,
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class CreateGeoMatchSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>CreateGeoMatchSet</code> request. You can also use this value to query
  /// the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  /// The <a>GeoMatchSet</a> returned in the <code>CreateGeoMatchSet</code>
  /// response. The <code>GeoMatchSet</code> contains no
  /// <code>GeoMatchConstraints</code>.
  final GeoMatchSet? geoMatchSet;

  CreateGeoMatchSetResponse({
    this.changeToken,
    this.geoMatchSet,
  });

  factory CreateGeoMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateGeoMatchSetResponse(
      changeToken: json['ChangeToken'] as String?,
      geoMatchSet: json['GeoMatchSet'] != null
          ? GeoMatchSet.fromJson(json['GeoMatchSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    final geoMatchSet = this.geoMatchSet;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
      if (geoMatchSet != null) 'GeoMatchSet': geoMatchSet,
    };
  }
}

class CreateIPSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>CreateIPSet</code> request. You can also use this value to query the
  /// status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  /// The <a>IPSet</a> returned in the <code>CreateIPSet</code> response.
  final IPSet? iPSet;

  CreateIPSetResponse({
    this.changeToken,
    this.iPSet,
  });

  factory CreateIPSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateIPSetResponse(
      changeToken: json['ChangeToken'] as String?,
      iPSet: json['IPSet'] != null
          ? IPSet.fromJson(json['IPSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    final iPSet = this.iPSet;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
      if (iPSet != null) 'IPSet': iPSet,
    };
  }
}

class CreateRateBasedRuleResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>CreateRateBasedRule</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  /// The <a>RateBasedRule</a> that is returned in the
  /// <code>CreateRateBasedRule</code> response.
  final RateBasedRule? rule;

  CreateRateBasedRuleResponse({
    this.changeToken,
    this.rule,
  });

  factory CreateRateBasedRuleResponse.fromJson(Map<String, dynamic> json) {
    return CreateRateBasedRuleResponse(
      changeToken: json['ChangeToken'] as String?,
      rule: json['Rule'] != null
          ? RateBasedRule.fromJson(json['Rule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    final rule = this.rule;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
      if (rule != null) 'Rule': rule,
    };
  }
}

class CreateRegexMatchSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>CreateRegexMatchSet</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  /// A <a>RegexMatchSet</a> that contains no <code>RegexMatchTuple</code>
  /// objects.
  final RegexMatchSet? regexMatchSet;

  CreateRegexMatchSetResponse({
    this.changeToken,
    this.regexMatchSet,
  });

  factory CreateRegexMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateRegexMatchSetResponse(
      changeToken: json['ChangeToken'] as String?,
      regexMatchSet: json['RegexMatchSet'] != null
          ? RegexMatchSet.fromJson(
              json['RegexMatchSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    final regexMatchSet = this.regexMatchSet;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
      if (regexMatchSet != null) 'RegexMatchSet': regexMatchSet,
    };
  }
}

class CreateRegexPatternSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>CreateRegexPatternSet</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  /// A <a>RegexPatternSet</a> that contains no objects.
  final RegexPatternSet? regexPatternSet;

  CreateRegexPatternSetResponse({
    this.changeToken,
    this.regexPatternSet,
  });

  factory CreateRegexPatternSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateRegexPatternSetResponse(
      changeToken: json['ChangeToken'] as String?,
      regexPatternSet: json['RegexPatternSet'] != null
          ? RegexPatternSet.fromJson(
              json['RegexPatternSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    final regexPatternSet = this.regexPatternSet;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
      if (regexPatternSet != null) 'RegexPatternSet': regexPatternSet,
    };
  }
}

class CreateRuleGroupResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>CreateRuleGroup</code> request. You can also use this value to query
  /// the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  /// An empty <a>RuleGroup</a>.
  final RuleGroup? ruleGroup;

  CreateRuleGroupResponse({
    this.changeToken,
    this.ruleGroup,
  });

  factory CreateRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateRuleGroupResponse(
      changeToken: json['ChangeToken'] as String?,
      ruleGroup: json['RuleGroup'] != null
          ? RuleGroup.fromJson(json['RuleGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    final ruleGroup = this.ruleGroup;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
      if (ruleGroup != null) 'RuleGroup': ruleGroup,
    };
  }
}

class CreateRuleResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>CreateRule</code> request. You can also use this value to query the
  /// status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  /// The <a>Rule</a> returned in the <code>CreateRule</code> response.
  final Rule? rule;

  CreateRuleResponse({
    this.changeToken,
    this.rule,
  });

  factory CreateRuleResponse.fromJson(Map<String, dynamic> json) {
    return CreateRuleResponse(
      changeToken: json['ChangeToken'] as String?,
      rule: json['Rule'] != null
          ? Rule.fromJson(json['Rule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    final rule = this.rule;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
      if (rule != null) 'Rule': rule,
    };
  }
}

class CreateSizeConstraintSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>CreateSizeConstraintSet</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  /// A <a>SizeConstraintSet</a> that contains no <code>SizeConstraint</code>
  /// objects.
  final SizeConstraintSet? sizeConstraintSet;

  CreateSizeConstraintSetResponse({
    this.changeToken,
    this.sizeConstraintSet,
  });

  factory CreateSizeConstraintSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateSizeConstraintSetResponse(
      changeToken: json['ChangeToken'] as String?,
      sizeConstraintSet: json['SizeConstraintSet'] != null
          ? SizeConstraintSet.fromJson(
              json['SizeConstraintSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    final sizeConstraintSet = this.sizeConstraintSet;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
      if (sizeConstraintSet != null) 'SizeConstraintSet': sizeConstraintSet,
    };
  }
}

/// The response to a <code>CreateSqlInjectionMatchSet</code> request.
class CreateSqlInjectionMatchSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>CreateSqlInjectionMatchSet</code> request. You can also use this value
  /// to query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  /// A <a>SqlInjectionMatchSet</a>.
  final SqlInjectionMatchSet? sqlInjectionMatchSet;

  CreateSqlInjectionMatchSetResponse({
    this.changeToken,
    this.sqlInjectionMatchSet,
  });

  factory CreateSqlInjectionMatchSetResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSqlInjectionMatchSetResponse(
      changeToken: json['ChangeToken'] as String?,
      sqlInjectionMatchSet: json['SqlInjectionMatchSet'] != null
          ? SqlInjectionMatchSet.fromJson(
              json['SqlInjectionMatchSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    final sqlInjectionMatchSet = this.sqlInjectionMatchSet;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
      if (sqlInjectionMatchSet != null)
        'SqlInjectionMatchSet': sqlInjectionMatchSet,
    };
  }
}

class CreateWebACLMigrationStackResponse {
  /// The URL of the template created in Amazon S3.
  final String s3ObjectUrl;

  CreateWebACLMigrationStackResponse({
    required this.s3ObjectUrl,
  });

  factory CreateWebACLMigrationStackResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateWebACLMigrationStackResponse(
      s3ObjectUrl: json['S3ObjectUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final s3ObjectUrl = this.s3ObjectUrl;
    return {
      'S3ObjectUrl': s3ObjectUrl,
    };
  }
}

class CreateWebACLResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>CreateWebACL</code> request. You can also use this value to query the
  /// status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  /// The <a>WebACL</a> returned in the <code>CreateWebACL</code> response.
  final WebACL? webACL;

  CreateWebACLResponse({
    this.changeToken,
    this.webACL,
  });

  factory CreateWebACLResponse.fromJson(Map<String, dynamic> json) {
    return CreateWebACLResponse(
      changeToken: json['ChangeToken'] as String?,
      webACL: json['WebACL'] != null
          ? WebACL.fromJson(json['WebACL'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    final webACL = this.webACL;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
      if (webACL != null) 'WebACL': webACL,
    };
  }
}

/// The response to a <code>CreateXssMatchSet</code> request.
class CreateXssMatchSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>CreateXssMatchSet</code> request. You can also use this value to query
  /// the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  /// An <a>XssMatchSet</a>.
  final XssMatchSet? xssMatchSet;

  CreateXssMatchSetResponse({
    this.changeToken,
    this.xssMatchSet,
  });

  factory CreateXssMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateXssMatchSetResponse(
      changeToken: json['ChangeToken'] as String?,
      xssMatchSet: json['XssMatchSet'] != null
          ? XssMatchSet.fromJson(json['XssMatchSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    final xssMatchSet = this.xssMatchSet;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
      if (xssMatchSet != null) 'XssMatchSet': xssMatchSet,
    };
  }
}

class DeleteByteMatchSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>DeleteByteMatchSet</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  DeleteByteMatchSetResponse({
    this.changeToken,
  });

  factory DeleteByteMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteByteMatchSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class DeleteGeoMatchSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>DeleteGeoMatchSet</code> request. You can also use this value to query
  /// the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  DeleteGeoMatchSetResponse({
    this.changeToken,
  });

  factory DeleteGeoMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteGeoMatchSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class DeleteIPSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>DeleteIPSet</code> request. You can also use this value to query the
  /// status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  DeleteIPSetResponse({
    this.changeToken,
  });

  factory DeleteIPSetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteIPSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
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

class DeleteRateBasedRuleResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>DeleteRateBasedRule</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  DeleteRateBasedRuleResponse({
    this.changeToken,
  });

  factory DeleteRateBasedRuleResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRateBasedRuleResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class DeleteRegexMatchSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>DeleteRegexMatchSet</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  DeleteRegexMatchSetResponse({
    this.changeToken,
  });

  factory DeleteRegexMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRegexMatchSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class DeleteRegexPatternSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>DeleteRegexPatternSet</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  DeleteRegexPatternSetResponse({
    this.changeToken,
  });

  factory DeleteRegexPatternSetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRegexPatternSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class DeleteRuleGroupResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>DeleteRuleGroup</code> request. You can also use this value to query
  /// the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  DeleteRuleGroupResponse({
    this.changeToken,
  });

  factory DeleteRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRuleGroupResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class DeleteRuleResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>DeleteRule</code> request. You can also use this value to query the
  /// status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  DeleteRuleResponse({
    this.changeToken,
  });

  factory DeleteRuleResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRuleResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class DeleteSizeConstraintSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>DeleteSizeConstraintSet</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  DeleteSizeConstraintSetResponse({
    this.changeToken,
  });

  factory DeleteSizeConstraintSetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSizeConstraintSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

/// The response to a request to delete a <a>SqlInjectionMatchSet</a> from AWS
/// WAF.
class DeleteSqlInjectionMatchSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>DeleteSqlInjectionMatchSet</code> request. You can also use this value
  /// to query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  DeleteSqlInjectionMatchSetResponse({
    this.changeToken,
  });

  factory DeleteSqlInjectionMatchSetResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteSqlInjectionMatchSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class DeleteWebACLResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>DeleteWebACL</code> request. You can also use this value to query the
  /// status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  DeleteWebACLResponse({
    this.changeToken,
  });

  factory DeleteWebACLResponse.fromJson(Map<String, dynamic> json) {
    return DeleteWebACLResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

/// The response to a request to delete an <a>XssMatchSet</a> from AWS WAF.
class DeleteXssMatchSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>DeleteXssMatchSet</code> request. You can also use this value to query
  /// the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  DeleteXssMatchSetResponse({
    this.changeToken,
  });

  factory DeleteXssMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteXssMatchSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// The rule to exclude from a rule group. This is applicable only when the
/// <code>ActivatedRule</code> refers to a <code>RuleGroup</code>. The rule must
/// belong to the <code>RuleGroup</code> that is specified by the
/// <code>ActivatedRule</code>.
class ExcludedRule {
  /// The unique identifier for the rule to exclude from the rule group.
  final String ruleId;

  ExcludedRule({
    required this.ruleId,
  });

  factory ExcludedRule.fromJson(Map<String, dynamic> json) {
    return ExcludedRule(
      ruleId: json['RuleId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleId = this.ruleId;
    return {
      'RuleId': ruleId,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Specifies where in a web request to look for <code>TargetString</code>.
class FieldToMatch {
  /// The part of the web request that you want AWS WAF to search for a specified
  /// string. Parts of a request that you can search include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>HEADER</code>: A specified request header, for example, the value of
  /// the <code>User-Agent</code> or <code>Referer</code> header. If you choose
  /// <code>HEADER</code> for the type, specify the name of the header in
  /// <code>Data</code>.
  /// </li>
  /// <li>
  /// <code>METHOD</code>: The HTTP method, which indicated the type of operation
  /// that the request is asking the origin to perform. Amazon CloudFront supports
  /// the following methods: <code>DELETE</code>, <code>GET</code>,
  /// <code>HEAD</code>, <code>OPTIONS</code>, <code>PATCH</code>,
  /// <code>POST</code>, and <code>PUT</code>.
  /// </li>
  /// <li>
  /// <code>QUERY_STRING</code>: A query string, which is the part of a URL that
  /// appears after a <code>?</code> character, if any.
  /// </li>
  /// <li>
  /// <code>URI</code>: The part of a web request that identifies a resource, for
  /// example, <code>/images/daily-ad.jpg</code>.
  /// </li>
  /// <li>
  /// <code>BODY</code>: The part of a request that contains any additional data
  /// that you want to send to your web server as the HTTP request body, such as
  /// data from a form. The request body immediately follows the request headers.
  /// Note that only the first <code>8192</code> bytes of the request body are
  /// forwarded to AWS WAF for inspection. To allow or block requests based on the
  /// length of the body, you can create a size constraint set. For more
  /// information, see <a>CreateSizeConstraintSet</a>.
  /// </li>
  /// <li>
  /// <code>SINGLE_QUERY_ARG</code>: The parameter in the query string that you
  /// will inspect, such as <i>UserName</i> or <i>SalesRegion</i>. The maximum
  /// length for <code>SINGLE_QUERY_ARG</code> is 30 characters.
  /// </li>
  /// <li>
  /// <code>ALL_QUERY_ARGS</code>: Similar to <code>SINGLE_QUERY_ARG</code>, but
  /// rather than inspecting a single parameter, AWS WAF will inspect all
  /// parameters within the query for the value or regex pattern that you specify
  /// in <code>TargetString</code>.
  /// </li>
  /// </ul>
  final MatchFieldType type;

  /// When the value of <code>Type</code> is <code>HEADER</code>, enter the name
  /// of the header that you want AWS WAF to search, for example,
  /// <code>User-Agent</code> or <code>Referer</code>. The name of the header is
  /// not case sensitive.
  ///
  /// When the value of <code>Type</code> is <code>SINGLE_QUERY_ARG</code>, enter
  /// the name of the parameter that you want AWS WAF to search, for example,
  /// <code>UserName</code> or <code>SalesRegion</code>. The parameter name is not
  /// case sensitive.
  ///
  /// If the value of <code>Type</code> is any other value, omit
  /// <code>Data</code>.
  final String? data;

  FieldToMatch({
    required this.type,
    this.data,
  });

  factory FieldToMatch.fromJson(Map<String, dynamic> json) {
    return FieldToMatch(
      type: (json['Type'] as String).toMatchFieldType(),
      data: json['Data'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final data = this.data;
    return {
      'Type': type.toValue(),
      if (data != null) 'Data': data,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// The country from which web requests originate that you want AWS WAF to
/// search for.
class GeoMatchConstraint {
  /// The type of geographical area you want AWS WAF to search for. Currently
  /// <code>Country</code> is the only valid value.
  final GeoMatchConstraintType type;

  /// The country that you want AWS WAF to search for.
  final GeoMatchConstraintValue value;

  GeoMatchConstraint({
    required this.type,
    required this.value,
  });

  factory GeoMatchConstraint.fromJson(Map<String, dynamic> json) {
    return GeoMatchConstraint(
      type: (json['Type'] as String).toGeoMatchConstraintType(),
      value: (json['Value'] as String).toGeoMatchConstraintValue(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'Type': type.toValue(),
      'Value': value.toValue(),
    };
  }
}

enum GeoMatchConstraintType {
  country,
}

extension GeoMatchConstraintTypeValueExtension on GeoMatchConstraintType {
  String toValue() {
    switch (this) {
      case GeoMatchConstraintType.country:
        return 'Country';
    }
  }
}

extension GeoMatchConstraintTypeFromString on String {
  GeoMatchConstraintType toGeoMatchConstraintType() {
    switch (this) {
      case 'Country':
        return GeoMatchConstraintType.country;
    }
    throw Exception('$this is not known in enum GeoMatchConstraintType');
  }
}

enum GeoMatchConstraintValue {
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
}

extension GeoMatchConstraintValueValueExtension on GeoMatchConstraintValue {
  String toValue() {
    switch (this) {
      case GeoMatchConstraintValue.af:
        return 'AF';
      case GeoMatchConstraintValue.ax:
        return 'AX';
      case GeoMatchConstraintValue.al:
        return 'AL';
      case GeoMatchConstraintValue.dz:
        return 'DZ';
      case GeoMatchConstraintValue.as:
        return 'AS';
      case GeoMatchConstraintValue.ad:
        return 'AD';
      case GeoMatchConstraintValue.ao:
        return 'AO';
      case GeoMatchConstraintValue.ai:
        return 'AI';
      case GeoMatchConstraintValue.aq:
        return 'AQ';
      case GeoMatchConstraintValue.ag:
        return 'AG';
      case GeoMatchConstraintValue.ar:
        return 'AR';
      case GeoMatchConstraintValue.am:
        return 'AM';
      case GeoMatchConstraintValue.aw:
        return 'AW';
      case GeoMatchConstraintValue.au:
        return 'AU';
      case GeoMatchConstraintValue.at:
        return 'AT';
      case GeoMatchConstraintValue.az:
        return 'AZ';
      case GeoMatchConstraintValue.bs:
        return 'BS';
      case GeoMatchConstraintValue.bh:
        return 'BH';
      case GeoMatchConstraintValue.bd:
        return 'BD';
      case GeoMatchConstraintValue.bb:
        return 'BB';
      case GeoMatchConstraintValue.by:
        return 'BY';
      case GeoMatchConstraintValue.be:
        return 'BE';
      case GeoMatchConstraintValue.bz:
        return 'BZ';
      case GeoMatchConstraintValue.bj:
        return 'BJ';
      case GeoMatchConstraintValue.bm:
        return 'BM';
      case GeoMatchConstraintValue.bt:
        return 'BT';
      case GeoMatchConstraintValue.bo:
        return 'BO';
      case GeoMatchConstraintValue.bq:
        return 'BQ';
      case GeoMatchConstraintValue.ba:
        return 'BA';
      case GeoMatchConstraintValue.bw:
        return 'BW';
      case GeoMatchConstraintValue.bv:
        return 'BV';
      case GeoMatchConstraintValue.br:
        return 'BR';
      case GeoMatchConstraintValue.io:
        return 'IO';
      case GeoMatchConstraintValue.bn:
        return 'BN';
      case GeoMatchConstraintValue.bg:
        return 'BG';
      case GeoMatchConstraintValue.bf:
        return 'BF';
      case GeoMatchConstraintValue.bi:
        return 'BI';
      case GeoMatchConstraintValue.kh:
        return 'KH';
      case GeoMatchConstraintValue.cm:
        return 'CM';
      case GeoMatchConstraintValue.ca:
        return 'CA';
      case GeoMatchConstraintValue.cv:
        return 'CV';
      case GeoMatchConstraintValue.ky:
        return 'KY';
      case GeoMatchConstraintValue.cf:
        return 'CF';
      case GeoMatchConstraintValue.td:
        return 'TD';
      case GeoMatchConstraintValue.cl:
        return 'CL';
      case GeoMatchConstraintValue.cn:
        return 'CN';
      case GeoMatchConstraintValue.cx:
        return 'CX';
      case GeoMatchConstraintValue.cc:
        return 'CC';
      case GeoMatchConstraintValue.co:
        return 'CO';
      case GeoMatchConstraintValue.km:
        return 'KM';
      case GeoMatchConstraintValue.cg:
        return 'CG';
      case GeoMatchConstraintValue.cd:
        return 'CD';
      case GeoMatchConstraintValue.ck:
        return 'CK';
      case GeoMatchConstraintValue.cr:
        return 'CR';
      case GeoMatchConstraintValue.ci:
        return 'CI';
      case GeoMatchConstraintValue.hr:
        return 'HR';
      case GeoMatchConstraintValue.cu:
        return 'CU';
      case GeoMatchConstraintValue.cw:
        return 'CW';
      case GeoMatchConstraintValue.cy:
        return 'CY';
      case GeoMatchConstraintValue.cz:
        return 'CZ';
      case GeoMatchConstraintValue.dk:
        return 'DK';
      case GeoMatchConstraintValue.dj:
        return 'DJ';
      case GeoMatchConstraintValue.dm:
        return 'DM';
      case GeoMatchConstraintValue.$do:
        return 'DO';
      case GeoMatchConstraintValue.ec:
        return 'EC';
      case GeoMatchConstraintValue.eg:
        return 'EG';
      case GeoMatchConstraintValue.sv:
        return 'SV';
      case GeoMatchConstraintValue.gq:
        return 'GQ';
      case GeoMatchConstraintValue.er:
        return 'ER';
      case GeoMatchConstraintValue.ee:
        return 'EE';
      case GeoMatchConstraintValue.et:
        return 'ET';
      case GeoMatchConstraintValue.fk:
        return 'FK';
      case GeoMatchConstraintValue.fo:
        return 'FO';
      case GeoMatchConstraintValue.fj:
        return 'FJ';
      case GeoMatchConstraintValue.fi:
        return 'FI';
      case GeoMatchConstraintValue.fr:
        return 'FR';
      case GeoMatchConstraintValue.gf:
        return 'GF';
      case GeoMatchConstraintValue.pf:
        return 'PF';
      case GeoMatchConstraintValue.tf:
        return 'TF';
      case GeoMatchConstraintValue.ga:
        return 'GA';
      case GeoMatchConstraintValue.gm:
        return 'GM';
      case GeoMatchConstraintValue.ge:
        return 'GE';
      case GeoMatchConstraintValue.de:
        return 'DE';
      case GeoMatchConstraintValue.gh:
        return 'GH';
      case GeoMatchConstraintValue.gi:
        return 'GI';
      case GeoMatchConstraintValue.gr:
        return 'GR';
      case GeoMatchConstraintValue.gl:
        return 'GL';
      case GeoMatchConstraintValue.gd:
        return 'GD';
      case GeoMatchConstraintValue.gp:
        return 'GP';
      case GeoMatchConstraintValue.gu:
        return 'GU';
      case GeoMatchConstraintValue.gt:
        return 'GT';
      case GeoMatchConstraintValue.gg:
        return 'GG';
      case GeoMatchConstraintValue.gn:
        return 'GN';
      case GeoMatchConstraintValue.gw:
        return 'GW';
      case GeoMatchConstraintValue.gy:
        return 'GY';
      case GeoMatchConstraintValue.ht:
        return 'HT';
      case GeoMatchConstraintValue.hm:
        return 'HM';
      case GeoMatchConstraintValue.va:
        return 'VA';
      case GeoMatchConstraintValue.hn:
        return 'HN';
      case GeoMatchConstraintValue.hk:
        return 'HK';
      case GeoMatchConstraintValue.hu:
        return 'HU';
      case GeoMatchConstraintValue.$is:
        return 'IS';
      case GeoMatchConstraintValue.$in:
        return 'IN';
      case GeoMatchConstraintValue.id:
        return 'ID';
      case GeoMatchConstraintValue.ir:
        return 'IR';
      case GeoMatchConstraintValue.iq:
        return 'IQ';
      case GeoMatchConstraintValue.ie:
        return 'IE';
      case GeoMatchConstraintValue.im:
        return 'IM';
      case GeoMatchConstraintValue.il:
        return 'IL';
      case GeoMatchConstraintValue.it:
        return 'IT';
      case GeoMatchConstraintValue.jm:
        return 'JM';
      case GeoMatchConstraintValue.jp:
        return 'JP';
      case GeoMatchConstraintValue.je:
        return 'JE';
      case GeoMatchConstraintValue.jo:
        return 'JO';
      case GeoMatchConstraintValue.kz:
        return 'KZ';
      case GeoMatchConstraintValue.ke:
        return 'KE';
      case GeoMatchConstraintValue.ki:
        return 'KI';
      case GeoMatchConstraintValue.kp:
        return 'KP';
      case GeoMatchConstraintValue.kr:
        return 'KR';
      case GeoMatchConstraintValue.kw:
        return 'KW';
      case GeoMatchConstraintValue.kg:
        return 'KG';
      case GeoMatchConstraintValue.la:
        return 'LA';
      case GeoMatchConstraintValue.lv:
        return 'LV';
      case GeoMatchConstraintValue.lb:
        return 'LB';
      case GeoMatchConstraintValue.ls:
        return 'LS';
      case GeoMatchConstraintValue.lr:
        return 'LR';
      case GeoMatchConstraintValue.ly:
        return 'LY';
      case GeoMatchConstraintValue.li:
        return 'LI';
      case GeoMatchConstraintValue.lt:
        return 'LT';
      case GeoMatchConstraintValue.lu:
        return 'LU';
      case GeoMatchConstraintValue.mo:
        return 'MO';
      case GeoMatchConstraintValue.mk:
        return 'MK';
      case GeoMatchConstraintValue.mg:
        return 'MG';
      case GeoMatchConstraintValue.mw:
        return 'MW';
      case GeoMatchConstraintValue.my:
        return 'MY';
      case GeoMatchConstraintValue.mv:
        return 'MV';
      case GeoMatchConstraintValue.ml:
        return 'ML';
      case GeoMatchConstraintValue.mt:
        return 'MT';
      case GeoMatchConstraintValue.mh:
        return 'MH';
      case GeoMatchConstraintValue.mq:
        return 'MQ';
      case GeoMatchConstraintValue.mr:
        return 'MR';
      case GeoMatchConstraintValue.mu:
        return 'MU';
      case GeoMatchConstraintValue.yt:
        return 'YT';
      case GeoMatchConstraintValue.mx:
        return 'MX';
      case GeoMatchConstraintValue.fm:
        return 'FM';
      case GeoMatchConstraintValue.md:
        return 'MD';
      case GeoMatchConstraintValue.mc:
        return 'MC';
      case GeoMatchConstraintValue.mn:
        return 'MN';
      case GeoMatchConstraintValue.me:
        return 'ME';
      case GeoMatchConstraintValue.ms:
        return 'MS';
      case GeoMatchConstraintValue.ma:
        return 'MA';
      case GeoMatchConstraintValue.mz:
        return 'MZ';
      case GeoMatchConstraintValue.mm:
        return 'MM';
      case GeoMatchConstraintValue.na:
        return 'NA';
      case GeoMatchConstraintValue.nr:
        return 'NR';
      case GeoMatchConstraintValue.np:
        return 'NP';
      case GeoMatchConstraintValue.nl:
        return 'NL';
      case GeoMatchConstraintValue.nc:
        return 'NC';
      case GeoMatchConstraintValue.nz:
        return 'NZ';
      case GeoMatchConstraintValue.ni:
        return 'NI';
      case GeoMatchConstraintValue.ne:
        return 'NE';
      case GeoMatchConstraintValue.ng:
        return 'NG';
      case GeoMatchConstraintValue.nu:
        return 'NU';
      case GeoMatchConstraintValue.nf:
        return 'NF';
      case GeoMatchConstraintValue.mp:
        return 'MP';
      case GeoMatchConstraintValue.no:
        return 'NO';
      case GeoMatchConstraintValue.om:
        return 'OM';
      case GeoMatchConstraintValue.pk:
        return 'PK';
      case GeoMatchConstraintValue.pw:
        return 'PW';
      case GeoMatchConstraintValue.ps:
        return 'PS';
      case GeoMatchConstraintValue.pa:
        return 'PA';
      case GeoMatchConstraintValue.pg:
        return 'PG';
      case GeoMatchConstraintValue.py:
        return 'PY';
      case GeoMatchConstraintValue.pe:
        return 'PE';
      case GeoMatchConstraintValue.ph:
        return 'PH';
      case GeoMatchConstraintValue.pn:
        return 'PN';
      case GeoMatchConstraintValue.pl:
        return 'PL';
      case GeoMatchConstraintValue.pt:
        return 'PT';
      case GeoMatchConstraintValue.pr:
        return 'PR';
      case GeoMatchConstraintValue.qa:
        return 'QA';
      case GeoMatchConstraintValue.re:
        return 'RE';
      case GeoMatchConstraintValue.ro:
        return 'RO';
      case GeoMatchConstraintValue.ru:
        return 'RU';
      case GeoMatchConstraintValue.rw:
        return 'RW';
      case GeoMatchConstraintValue.bl:
        return 'BL';
      case GeoMatchConstraintValue.sh:
        return 'SH';
      case GeoMatchConstraintValue.kn:
        return 'KN';
      case GeoMatchConstraintValue.lc:
        return 'LC';
      case GeoMatchConstraintValue.mf:
        return 'MF';
      case GeoMatchConstraintValue.pm:
        return 'PM';
      case GeoMatchConstraintValue.vc:
        return 'VC';
      case GeoMatchConstraintValue.ws:
        return 'WS';
      case GeoMatchConstraintValue.sm:
        return 'SM';
      case GeoMatchConstraintValue.st:
        return 'ST';
      case GeoMatchConstraintValue.sa:
        return 'SA';
      case GeoMatchConstraintValue.sn:
        return 'SN';
      case GeoMatchConstraintValue.rs:
        return 'RS';
      case GeoMatchConstraintValue.sc:
        return 'SC';
      case GeoMatchConstraintValue.sl:
        return 'SL';
      case GeoMatchConstraintValue.sg:
        return 'SG';
      case GeoMatchConstraintValue.sx:
        return 'SX';
      case GeoMatchConstraintValue.sk:
        return 'SK';
      case GeoMatchConstraintValue.si:
        return 'SI';
      case GeoMatchConstraintValue.sb:
        return 'SB';
      case GeoMatchConstraintValue.so:
        return 'SO';
      case GeoMatchConstraintValue.za:
        return 'ZA';
      case GeoMatchConstraintValue.gs:
        return 'GS';
      case GeoMatchConstraintValue.ss:
        return 'SS';
      case GeoMatchConstraintValue.es:
        return 'ES';
      case GeoMatchConstraintValue.lk:
        return 'LK';
      case GeoMatchConstraintValue.sd:
        return 'SD';
      case GeoMatchConstraintValue.sr:
        return 'SR';
      case GeoMatchConstraintValue.sj:
        return 'SJ';
      case GeoMatchConstraintValue.sz:
        return 'SZ';
      case GeoMatchConstraintValue.se:
        return 'SE';
      case GeoMatchConstraintValue.ch:
        return 'CH';
      case GeoMatchConstraintValue.sy:
        return 'SY';
      case GeoMatchConstraintValue.tw:
        return 'TW';
      case GeoMatchConstraintValue.tj:
        return 'TJ';
      case GeoMatchConstraintValue.tz:
        return 'TZ';
      case GeoMatchConstraintValue.th:
        return 'TH';
      case GeoMatchConstraintValue.tl:
        return 'TL';
      case GeoMatchConstraintValue.tg:
        return 'TG';
      case GeoMatchConstraintValue.tk:
        return 'TK';
      case GeoMatchConstraintValue.to:
        return 'TO';
      case GeoMatchConstraintValue.tt:
        return 'TT';
      case GeoMatchConstraintValue.tn:
        return 'TN';
      case GeoMatchConstraintValue.tr:
        return 'TR';
      case GeoMatchConstraintValue.tm:
        return 'TM';
      case GeoMatchConstraintValue.tc:
        return 'TC';
      case GeoMatchConstraintValue.tv:
        return 'TV';
      case GeoMatchConstraintValue.ug:
        return 'UG';
      case GeoMatchConstraintValue.ua:
        return 'UA';
      case GeoMatchConstraintValue.ae:
        return 'AE';
      case GeoMatchConstraintValue.gb:
        return 'GB';
      case GeoMatchConstraintValue.us:
        return 'US';
      case GeoMatchConstraintValue.um:
        return 'UM';
      case GeoMatchConstraintValue.uy:
        return 'UY';
      case GeoMatchConstraintValue.uz:
        return 'UZ';
      case GeoMatchConstraintValue.vu:
        return 'VU';
      case GeoMatchConstraintValue.ve:
        return 'VE';
      case GeoMatchConstraintValue.vn:
        return 'VN';
      case GeoMatchConstraintValue.vg:
        return 'VG';
      case GeoMatchConstraintValue.vi:
        return 'VI';
      case GeoMatchConstraintValue.wf:
        return 'WF';
      case GeoMatchConstraintValue.eh:
        return 'EH';
      case GeoMatchConstraintValue.ye:
        return 'YE';
      case GeoMatchConstraintValue.zm:
        return 'ZM';
      case GeoMatchConstraintValue.zw:
        return 'ZW';
    }
  }
}

extension GeoMatchConstraintValueFromString on String {
  GeoMatchConstraintValue toGeoMatchConstraintValue() {
    switch (this) {
      case 'AF':
        return GeoMatchConstraintValue.af;
      case 'AX':
        return GeoMatchConstraintValue.ax;
      case 'AL':
        return GeoMatchConstraintValue.al;
      case 'DZ':
        return GeoMatchConstraintValue.dz;
      case 'AS':
        return GeoMatchConstraintValue.as;
      case 'AD':
        return GeoMatchConstraintValue.ad;
      case 'AO':
        return GeoMatchConstraintValue.ao;
      case 'AI':
        return GeoMatchConstraintValue.ai;
      case 'AQ':
        return GeoMatchConstraintValue.aq;
      case 'AG':
        return GeoMatchConstraintValue.ag;
      case 'AR':
        return GeoMatchConstraintValue.ar;
      case 'AM':
        return GeoMatchConstraintValue.am;
      case 'AW':
        return GeoMatchConstraintValue.aw;
      case 'AU':
        return GeoMatchConstraintValue.au;
      case 'AT':
        return GeoMatchConstraintValue.at;
      case 'AZ':
        return GeoMatchConstraintValue.az;
      case 'BS':
        return GeoMatchConstraintValue.bs;
      case 'BH':
        return GeoMatchConstraintValue.bh;
      case 'BD':
        return GeoMatchConstraintValue.bd;
      case 'BB':
        return GeoMatchConstraintValue.bb;
      case 'BY':
        return GeoMatchConstraintValue.by;
      case 'BE':
        return GeoMatchConstraintValue.be;
      case 'BZ':
        return GeoMatchConstraintValue.bz;
      case 'BJ':
        return GeoMatchConstraintValue.bj;
      case 'BM':
        return GeoMatchConstraintValue.bm;
      case 'BT':
        return GeoMatchConstraintValue.bt;
      case 'BO':
        return GeoMatchConstraintValue.bo;
      case 'BQ':
        return GeoMatchConstraintValue.bq;
      case 'BA':
        return GeoMatchConstraintValue.ba;
      case 'BW':
        return GeoMatchConstraintValue.bw;
      case 'BV':
        return GeoMatchConstraintValue.bv;
      case 'BR':
        return GeoMatchConstraintValue.br;
      case 'IO':
        return GeoMatchConstraintValue.io;
      case 'BN':
        return GeoMatchConstraintValue.bn;
      case 'BG':
        return GeoMatchConstraintValue.bg;
      case 'BF':
        return GeoMatchConstraintValue.bf;
      case 'BI':
        return GeoMatchConstraintValue.bi;
      case 'KH':
        return GeoMatchConstraintValue.kh;
      case 'CM':
        return GeoMatchConstraintValue.cm;
      case 'CA':
        return GeoMatchConstraintValue.ca;
      case 'CV':
        return GeoMatchConstraintValue.cv;
      case 'KY':
        return GeoMatchConstraintValue.ky;
      case 'CF':
        return GeoMatchConstraintValue.cf;
      case 'TD':
        return GeoMatchConstraintValue.td;
      case 'CL':
        return GeoMatchConstraintValue.cl;
      case 'CN':
        return GeoMatchConstraintValue.cn;
      case 'CX':
        return GeoMatchConstraintValue.cx;
      case 'CC':
        return GeoMatchConstraintValue.cc;
      case 'CO':
        return GeoMatchConstraintValue.co;
      case 'KM':
        return GeoMatchConstraintValue.km;
      case 'CG':
        return GeoMatchConstraintValue.cg;
      case 'CD':
        return GeoMatchConstraintValue.cd;
      case 'CK':
        return GeoMatchConstraintValue.ck;
      case 'CR':
        return GeoMatchConstraintValue.cr;
      case 'CI':
        return GeoMatchConstraintValue.ci;
      case 'HR':
        return GeoMatchConstraintValue.hr;
      case 'CU':
        return GeoMatchConstraintValue.cu;
      case 'CW':
        return GeoMatchConstraintValue.cw;
      case 'CY':
        return GeoMatchConstraintValue.cy;
      case 'CZ':
        return GeoMatchConstraintValue.cz;
      case 'DK':
        return GeoMatchConstraintValue.dk;
      case 'DJ':
        return GeoMatchConstraintValue.dj;
      case 'DM':
        return GeoMatchConstraintValue.dm;
      case 'DO':
        return GeoMatchConstraintValue.$do;
      case 'EC':
        return GeoMatchConstraintValue.ec;
      case 'EG':
        return GeoMatchConstraintValue.eg;
      case 'SV':
        return GeoMatchConstraintValue.sv;
      case 'GQ':
        return GeoMatchConstraintValue.gq;
      case 'ER':
        return GeoMatchConstraintValue.er;
      case 'EE':
        return GeoMatchConstraintValue.ee;
      case 'ET':
        return GeoMatchConstraintValue.et;
      case 'FK':
        return GeoMatchConstraintValue.fk;
      case 'FO':
        return GeoMatchConstraintValue.fo;
      case 'FJ':
        return GeoMatchConstraintValue.fj;
      case 'FI':
        return GeoMatchConstraintValue.fi;
      case 'FR':
        return GeoMatchConstraintValue.fr;
      case 'GF':
        return GeoMatchConstraintValue.gf;
      case 'PF':
        return GeoMatchConstraintValue.pf;
      case 'TF':
        return GeoMatchConstraintValue.tf;
      case 'GA':
        return GeoMatchConstraintValue.ga;
      case 'GM':
        return GeoMatchConstraintValue.gm;
      case 'GE':
        return GeoMatchConstraintValue.ge;
      case 'DE':
        return GeoMatchConstraintValue.de;
      case 'GH':
        return GeoMatchConstraintValue.gh;
      case 'GI':
        return GeoMatchConstraintValue.gi;
      case 'GR':
        return GeoMatchConstraintValue.gr;
      case 'GL':
        return GeoMatchConstraintValue.gl;
      case 'GD':
        return GeoMatchConstraintValue.gd;
      case 'GP':
        return GeoMatchConstraintValue.gp;
      case 'GU':
        return GeoMatchConstraintValue.gu;
      case 'GT':
        return GeoMatchConstraintValue.gt;
      case 'GG':
        return GeoMatchConstraintValue.gg;
      case 'GN':
        return GeoMatchConstraintValue.gn;
      case 'GW':
        return GeoMatchConstraintValue.gw;
      case 'GY':
        return GeoMatchConstraintValue.gy;
      case 'HT':
        return GeoMatchConstraintValue.ht;
      case 'HM':
        return GeoMatchConstraintValue.hm;
      case 'VA':
        return GeoMatchConstraintValue.va;
      case 'HN':
        return GeoMatchConstraintValue.hn;
      case 'HK':
        return GeoMatchConstraintValue.hk;
      case 'HU':
        return GeoMatchConstraintValue.hu;
      case 'IS':
        return GeoMatchConstraintValue.$is;
      case 'IN':
        return GeoMatchConstraintValue.$in;
      case 'ID':
        return GeoMatchConstraintValue.id;
      case 'IR':
        return GeoMatchConstraintValue.ir;
      case 'IQ':
        return GeoMatchConstraintValue.iq;
      case 'IE':
        return GeoMatchConstraintValue.ie;
      case 'IM':
        return GeoMatchConstraintValue.im;
      case 'IL':
        return GeoMatchConstraintValue.il;
      case 'IT':
        return GeoMatchConstraintValue.it;
      case 'JM':
        return GeoMatchConstraintValue.jm;
      case 'JP':
        return GeoMatchConstraintValue.jp;
      case 'JE':
        return GeoMatchConstraintValue.je;
      case 'JO':
        return GeoMatchConstraintValue.jo;
      case 'KZ':
        return GeoMatchConstraintValue.kz;
      case 'KE':
        return GeoMatchConstraintValue.ke;
      case 'KI':
        return GeoMatchConstraintValue.ki;
      case 'KP':
        return GeoMatchConstraintValue.kp;
      case 'KR':
        return GeoMatchConstraintValue.kr;
      case 'KW':
        return GeoMatchConstraintValue.kw;
      case 'KG':
        return GeoMatchConstraintValue.kg;
      case 'LA':
        return GeoMatchConstraintValue.la;
      case 'LV':
        return GeoMatchConstraintValue.lv;
      case 'LB':
        return GeoMatchConstraintValue.lb;
      case 'LS':
        return GeoMatchConstraintValue.ls;
      case 'LR':
        return GeoMatchConstraintValue.lr;
      case 'LY':
        return GeoMatchConstraintValue.ly;
      case 'LI':
        return GeoMatchConstraintValue.li;
      case 'LT':
        return GeoMatchConstraintValue.lt;
      case 'LU':
        return GeoMatchConstraintValue.lu;
      case 'MO':
        return GeoMatchConstraintValue.mo;
      case 'MK':
        return GeoMatchConstraintValue.mk;
      case 'MG':
        return GeoMatchConstraintValue.mg;
      case 'MW':
        return GeoMatchConstraintValue.mw;
      case 'MY':
        return GeoMatchConstraintValue.my;
      case 'MV':
        return GeoMatchConstraintValue.mv;
      case 'ML':
        return GeoMatchConstraintValue.ml;
      case 'MT':
        return GeoMatchConstraintValue.mt;
      case 'MH':
        return GeoMatchConstraintValue.mh;
      case 'MQ':
        return GeoMatchConstraintValue.mq;
      case 'MR':
        return GeoMatchConstraintValue.mr;
      case 'MU':
        return GeoMatchConstraintValue.mu;
      case 'YT':
        return GeoMatchConstraintValue.yt;
      case 'MX':
        return GeoMatchConstraintValue.mx;
      case 'FM':
        return GeoMatchConstraintValue.fm;
      case 'MD':
        return GeoMatchConstraintValue.md;
      case 'MC':
        return GeoMatchConstraintValue.mc;
      case 'MN':
        return GeoMatchConstraintValue.mn;
      case 'ME':
        return GeoMatchConstraintValue.me;
      case 'MS':
        return GeoMatchConstraintValue.ms;
      case 'MA':
        return GeoMatchConstraintValue.ma;
      case 'MZ':
        return GeoMatchConstraintValue.mz;
      case 'MM':
        return GeoMatchConstraintValue.mm;
      case 'NA':
        return GeoMatchConstraintValue.na;
      case 'NR':
        return GeoMatchConstraintValue.nr;
      case 'NP':
        return GeoMatchConstraintValue.np;
      case 'NL':
        return GeoMatchConstraintValue.nl;
      case 'NC':
        return GeoMatchConstraintValue.nc;
      case 'NZ':
        return GeoMatchConstraintValue.nz;
      case 'NI':
        return GeoMatchConstraintValue.ni;
      case 'NE':
        return GeoMatchConstraintValue.ne;
      case 'NG':
        return GeoMatchConstraintValue.ng;
      case 'NU':
        return GeoMatchConstraintValue.nu;
      case 'NF':
        return GeoMatchConstraintValue.nf;
      case 'MP':
        return GeoMatchConstraintValue.mp;
      case 'NO':
        return GeoMatchConstraintValue.no;
      case 'OM':
        return GeoMatchConstraintValue.om;
      case 'PK':
        return GeoMatchConstraintValue.pk;
      case 'PW':
        return GeoMatchConstraintValue.pw;
      case 'PS':
        return GeoMatchConstraintValue.ps;
      case 'PA':
        return GeoMatchConstraintValue.pa;
      case 'PG':
        return GeoMatchConstraintValue.pg;
      case 'PY':
        return GeoMatchConstraintValue.py;
      case 'PE':
        return GeoMatchConstraintValue.pe;
      case 'PH':
        return GeoMatchConstraintValue.ph;
      case 'PN':
        return GeoMatchConstraintValue.pn;
      case 'PL':
        return GeoMatchConstraintValue.pl;
      case 'PT':
        return GeoMatchConstraintValue.pt;
      case 'PR':
        return GeoMatchConstraintValue.pr;
      case 'QA':
        return GeoMatchConstraintValue.qa;
      case 'RE':
        return GeoMatchConstraintValue.re;
      case 'RO':
        return GeoMatchConstraintValue.ro;
      case 'RU':
        return GeoMatchConstraintValue.ru;
      case 'RW':
        return GeoMatchConstraintValue.rw;
      case 'BL':
        return GeoMatchConstraintValue.bl;
      case 'SH':
        return GeoMatchConstraintValue.sh;
      case 'KN':
        return GeoMatchConstraintValue.kn;
      case 'LC':
        return GeoMatchConstraintValue.lc;
      case 'MF':
        return GeoMatchConstraintValue.mf;
      case 'PM':
        return GeoMatchConstraintValue.pm;
      case 'VC':
        return GeoMatchConstraintValue.vc;
      case 'WS':
        return GeoMatchConstraintValue.ws;
      case 'SM':
        return GeoMatchConstraintValue.sm;
      case 'ST':
        return GeoMatchConstraintValue.st;
      case 'SA':
        return GeoMatchConstraintValue.sa;
      case 'SN':
        return GeoMatchConstraintValue.sn;
      case 'RS':
        return GeoMatchConstraintValue.rs;
      case 'SC':
        return GeoMatchConstraintValue.sc;
      case 'SL':
        return GeoMatchConstraintValue.sl;
      case 'SG':
        return GeoMatchConstraintValue.sg;
      case 'SX':
        return GeoMatchConstraintValue.sx;
      case 'SK':
        return GeoMatchConstraintValue.sk;
      case 'SI':
        return GeoMatchConstraintValue.si;
      case 'SB':
        return GeoMatchConstraintValue.sb;
      case 'SO':
        return GeoMatchConstraintValue.so;
      case 'ZA':
        return GeoMatchConstraintValue.za;
      case 'GS':
        return GeoMatchConstraintValue.gs;
      case 'SS':
        return GeoMatchConstraintValue.ss;
      case 'ES':
        return GeoMatchConstraintValue.es;
      case 'LK':
        return GeoMatchConstraintValue.lk;
      case 'SD':
        return GeoMatchConstraintValue.sd;
      case 'SR':
        return GeoMatchConstraintValue.sr;
      case 'SJ':
        return GeoMatchConstraintValue.sj;
      case 'SZ':
        return GeoMatchConstraintValue.sz;
      case 'SE':
        return GeoMatchConstraintValue.se;
      case 'CH':
        return GeoMatchConstraintValue.ch;
      case 'SY':
        return GeoMatchConstraintValue.sy;
      case 'TW':
        return GeoMatchConstraintValue.tw;
      case 'TJ':
        return GeoMatchConstraintValue.tj;
      case 'TZ':
        return GeoMatchConstraintValue.tz;
      case 'TH':
        return GeoMatchConstraintValue.th;
      case 'TL':
        return GeoMatchConstraintValue.tl;
      case 'TG':
        return GeoMatchConstraintValue.tg;
      case 'TK':
        return GeoMatchConstraintValue.tk;
      case 'TO':
        return GeoMatchConstraintValue.to;
      case 'TT':
        return GeoMatchConstraintValue.tt;
      case 'TN':
        return GeoMatchConstraintValue.tn;
      case 'TR':
        return GeoMatchConstraintValue.tr;
      case 'TM':
        return GeoMatchConstraintValue.tm;
      case 'TC':
        return GeoMatchConstraintValue.tc;
      case 'TV':
        return GeoMatchConstraintValue.tv;
      case 'UG':
        return GeoMatchConstraintValue.ug;
      case 'UA':
        return GeoMatchConstraintValue.ua;
      case 'AE':
        return GeoMatchConstraintValue.ae;
      case 'GB':
        return GeoMatchConstraintValue.gb;
      case 'US':
        return GeoMatchConstraintValue.us;
      case 'UM':
        return GeoMatchConstraintValue.um;
      case 'UY':
        return GeoMatchConstraintValue.uy;
      case 'UZ':
        return GeoMatchConstraintValue.uz;
      case 'VU':
        return GeoMatchConstraintValue.vu;
      case 'VE':
        return GeoMatchConstraintValue.ve;
      case 'VN':
        return GeoMatchConstraintValue.vn;
      case 'VG':
        return GeoMatchConstraintValue.vg;
      case 'VI':
        return GeoMatchConstraintValue.vi;
      case 'WF':
        return GeoMatchConstraintValue.wf;
      case 'EH':
        return GeoMatchConstraintValue.eh;
      case 'YE':
        return GeoMatchConstraintValue.ye;
      case 'ZM':
        return GeoMatchConstraintValue.zm;
      case 'ZW':
        return GeoMatchConstraintValue.zw;
    }
    throw Exception('$this is not known in enum GeoMatchConstraintValue');
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Contains one or more countries that AWS WAF will search for.
class GeoMatchSet {
  /// An array of <a>GeoMatchConstraint</a> objects, which contain the country
  /// that you want AWS WAF to search for.
  final List<GeoMatchConstraint> geoMatchConstraints;

  /// The <code>GeoMatchSetId</code> for an <code>GeoMatchSet</code>. You use
  /// <code>GeoMatchSetId</code> to get information about a
  /// <code>GeoMatchSet</code> (see <a>GeoMatchSet</a>), update a
  /// <code>GeoMatchSet</code> (see <a>UpdateGeoMatchSet</a>), insert a
  /// <code>GeoMatchSet</code> into a <code>Rule</code> or delete one from a
  /// <code>Rule</code> (see <a>UpdateRule</a>), and delete a
  /// <code>GeoMatchSet</code> from AWS WAF (see <a>DeleteGeoMatchSet</a>).
  ///
  /// <code>GeoMatchSetId</code> is returned by <a>CreateGeoMatchSet</a> and by
  /// <a>ListGeoMatchSets</a>.
  final String geoMatchSetId;

  /// A friendly name or description of the <a>GeoMatchSet</a>. You can't change
  /// the name of an <code>GeoMatchSet</code> after you create it.
  final String? name;

  GeoMatchSet({
    required this.geoMatchConstraints,
    required this.geoMatchSetId,
    this.name,
  });

  factory GeoMatchSet.fromJson(Map<String, dynamic> json) {
    return GeoMatchSet(
      geoMatchConstraints: (json['GeoMatchConstraints'] as List)
          .whereNotNull()
          .map((e) => GeoMatchConstraint.fromJson(e as Map<String, dynamic>))
          .toList(),
      geoMatchSetId: json['GeoMatchSetId'] as String,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final geoMatchConstraints = this.geoMatchConstraints;
    final geoMatchSetId = this.geoMatchSetId;
    final name = this.name;
    return {
      'GeoMatchConstraints': geoMatchConstraints,
      'GeoMatchSetId': geoMatchSetId,
      if (name != null) 'Name': name,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Contains the identifier and the name of the <code>GeoMatchSet</code>.
class GeoMatchSetSummary {
  /// The <code>GeoMatchSetId</code> for an <a>GeoMatchSet</a>. You can use
  /// <code>GeoMatchSetId</code> in a <a>GetGeoMatchSet</a> request to get
  /// detailed information about an <a>GeoMatchSet</a>.
  final String geoMatchSetId;

  /// A friendly name or description of the <a>GeoMatchSet</a>. You can't change
  /// the name of an <code>GeoMatchSet</code> after you create it.
  final String name;

  GeoMatchSetSummary({
    required this.geoMatchSetId,
    required this.name,
  });

  factory GeoMatchSetSummary.fromJson(Map<String, dynamic> json) {
    return GeoMatchSetSummary(
      geoMatchSetId: json['GeoMatchSetId'] as String,
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final geoMatchSetId = this.geoMatchSetId;
    final name = this.name;
    return {
      'GeoMatchSetId': geoMatchSetId,
      'Name': name,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Specifies the type of update to perform to an <a>GeoMatchSet</a> with
/// <a>UpdateGeoMatchSet</a>.
class GeoMatchSetUpdate {
  /// Specifies whether to insert or delete a country with
  /// <a>UpdateGeoMatchSet</a>.
  final ChangeAction action;

  /// The country from which web requests originate that you want AWS WAF to
  /// search for.
  final GeoMatchConstraint geoMatchConstraint;

  GeoMatchSetUpdate({
    required this.action,
    required this.geoMatchConstraint,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final geoMatchConstraint = this.geoMatchConstraint;
    return {
      'Action': action.toValue(),
      'GeoMatchConstraint': geoMatchConstraint,
    };
  }
}

class GetByteMatchSetResponse {
  /// Information about the <a>ByteMatchSet</a> that you specified in the
  /// <code>GetByteMatchSet</code> request. For more information, see the
  /// following topics:
  ///
  /// <ul>
  /// <li>
  /// <a>ByteMatchSet</a>: Contains <code>ByteMatchSetId</code>,
  /// <code>ByteMatchTuples</code>, and <code>Name</code>
  /// </li>
  /// <li>
  /// <code>ByteMatchTuples</code>: Contains an array of <a>ByteMatchTuple</a>
  /// objects. Each <code>ByteMatchTuple</code> object contains
  /// <a>FieldToMatch</a>, <code>PositionalConstraint</code>,
  /// <code>TargetString</code>, and <code>TextTransformation</code>
  /// </li>
  /// <li>
  /// <a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code>
  /// </li>
  /// </ul>
  final ByteMatchSet? byteMatchSet;

  GetByteMatchSetResponse({
    this.byteMatchSet,
  });

  factory GetByteMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return GetByteMatchSetResponse(
      byteMatchSet: json['ByteMatchSet'] != null
          ? ByteMatchSet.fromJson(json['ByteMatchSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final byteMatchSet = this.byteMatchSet;
    return {
      if (byteMatchSet != null) 'ByteMatchSet': byteMatchSet,
    };
  }
}

class GetChangeTokenResponse {
  /// The <code>ChangeToken</code> that you used in the request. Use this value in
  /// a <code>GetChangeTokenStatus</code> request to get the current status of the
  /// request.
  final String? changeToken;

  GetChangeTokenResponse({
    this.changeToken,
  });

  factory GetChangeTokenResponse.fromJson(Map<String, dynamic> json) {
    return GetChangeTokenResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class GetChangeTokenStatusResponse {
  /// The status of the change token.
  final ChangeTokenStatus? changeTokenStatus;

  GetChangeTokenStatusResponse({
    this.changeTokenStatus,
  });

  factory GetChangeTokenStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetChangeTokenStatusResponse(
      changeTokenStatus:
          (json['ChangeTokenStatus'] as String?)?.toChangeTokenStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final changeTokenStatus = this.changeTokenStatus;
    return {
      if (changeTokenStatus != null)
        'ChangeTokenStatus': changeTokenStatus.toValue(),
    };
  }
}

class GetGeoMatchSetResponse {
  /// Information about the <a>GeoMatchSet</a> that you specified in the
  /// <code>GetGeoMatchSet</code> request. This includes the <code>Type</code>,
  /// which for a <code>GeoMatchContraint</code> is always <code>Country</code>,
  /// as well as the <code>Value</code>, which is the identifier for a specific
  /// country.
  final GeoMatchSet? geoMatchSet;

  GetGeoMatchSetResponse({
    this.geoMatchSet,
  });

  factory GetGeoMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return GetGeoMatchSetResponse(
      geoMatchSet: json['GeoMatchSet'] != null
          ? GeoMatchSet.fromJson(json['GeoMatchSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final geoMatchSet = this.geoMatchSet;
    return {
      if (geoMatchSet != null) 'GeoMatchSet': geoMatchSet,
    };
  }
}

class GetIPSetResponse {
  /// Information about the <a>IPSet</a> that you specified in the
  /// <code>GetIPSet</code> request. For more information, see the following
  /// topics:
  ///
  /// <ul>
  /// <li>
  /// <a>IPSet</a>: Contains <code>IPSetDescriptors</code>, <code>IPSetId</code>,
  /// and <code>Name</code>
  /// </li>
  /// <li>
  /// <code>IPSetDescriptors</code>: Contains an array of <a>IPSetDescriptor</a>
  /// objects. Each <code>IPSetDescriptor</code> object contains <code>Type</code>
  /// and <code>Value</code>
  /// </li>
  /// </ul>
  final IPSet? iPSet;

  GetIPSetResponse({
    this.iPSet,
  });

  factory GetIPSetResponse.fromJson(Map<String, dynamic> json) {
    return GetIPSetResponse(
      iPSet: json['IPSet'] != null
          ? IPSet.fromJson(json['IPSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iPSet = this.iPSet;
    return {
      if (iPSet != null) 'IPSet': iPSet,
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

class GetPermissionPolicyResponse {
  /// The IAM policy attached to the specified RuleGroup.
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

class GetRateBasedRuleManagedKeysResponse {
  /// An array of IP addresses that currently are blocked by the specified
  /// <a>RateBasedRule</a>.
  final List<String>? managedKeys;

  /// A null value and not currently used.
  final String? nextMarker;

  GetRateBasedRuleManagedKeysResponse({
    this.managedKeys,
    this.nextMarker,
  });

  factory GetRateBasedRuleManagedKeysResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRateBasedRuleManagedKeysResponse(
      managedKeys: (json['ManagedKeys'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final managedKeys = this.managedKeys;
    final nextMarker = this.nextMarker;
    return {
      if (managedKeys != null) 'ManagedKeys': managedKeys,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class GetRateBasedRuleResponse {
  /// Information about the <a>RateBasedRule</a> that you specified in the
  /// <code>GetRateBasedRule</code> request.
  final RateBasedRule? rule;

  GetRateBasedRuleResponse({
    this.rule,
  });

  factory GetRateBasedRuleResponse.fromJson(Map<String, dynamic> json) {
    return GetRateBasedRuleResponse(
      rule: json['Rule'] != null
          ? RateBasedRule.fromJson(json['Rule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final rule = this.rule;
    return {
      if (rule != null) 'Rule': rule,
    };
  }
}

class GetRegexMatchSetResponse {
  /// Information about the <a>RegexMatchSet</a> that you specified in the
  /// <code>GetRegexMatchSet</code> request. For more information, see
  /// <a>RegexMatchTuple</a>.
  final RegexMatchSet? regexMatchSet;

  GetRegexMatchSetResponse({
    this.regexMatchSet,
  });

  factory GetRegexMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return GetRegexMatchSetResponse(
      regexMatchSet: json['RegexMatchSet'] != null
          ? RegexMatchSet.fromJson(
              json['RegexMatchSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final regexMatchSet = this.regexMatchSet;
    return {
      if (regexMatchSet != null) 'RegexMatchSet': regexMatchSet,
    };
  }
}

class GetRegexPatternSetResponse {
  /// Information about the <a>RegexPatternSet</a> that you specified in the
  /// <code>GetRegexPatternSet</code> request, including the identifier of the
  /// pattern set and the regular expression patterns you want AWS WAF to search
  /// for.
  final RegexPatternSet? regexPatternSet;

  GetRegexPatternSetResponse({
    this.regexPatternSet,
  });

  factory GetRegexPatternSetResponse.fromJson(Map<String, dynamic> json) {
    return GetRegexPatternSetResponse(
      regexPatternSet: json['RegexPatternSet'] != null
          ? RegexPatternSet.fromJson(
              json['RegexPatternSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final regexPatternSet = this.regexPatternSet;
    return {
      if (regexPatternSet != null) 'RegexPatternSet': regexPatternSet,
    };
  }
}

class GetRuleGroupResponse {
  /// Information about the <a>RuleGroup</a> that you specified in the
  /// <code>GetRuleGroup</code> request.
  final RuleGroup? ruleGroup;

  GetRuleGroupResponse({
    this.ruleGroup,
  });

  factory GetRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetRuleGroupResponse(
      ruleGroup: json['RuleGroup'] != null
          ? RuleGroup.fromJson(json['RuleGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleGroup = this.ruleGroup;
    return {
      if (ruleGroup != null) 'RuleGroup': ruleGroup,
    };
  }
}

class GetRuleResponse {
  /// Information about the <a>Rule</a> that you specified in the
  /// <code>GetRule</code> request. For more information, see the following
  /// topics:
  ///
  /// <ul>
  /// <li>
  /// <a>Rule</a>: Contains <code>MetricName</code>, <code>Name</code>, an array
  /// of <code>Predicate</code> objects, and <code>RuleId</code>
  /// </li>
  /// <li>
  /// <a>Predicate</a>: Each <code>Predicate</code> object contains
  /// <code>DataId</code>, <code>Negated</code>, and <code>Type</code>
  /// </li>
  /// </ul>
  final Rule? rule;

  GetRuleResponse({
    this.rule,
  });

  factory GetRuleResponse.fromJson(Map<String, dynamic> json) {
    return GetRuleResponse(
      rule: json['Rule'] != null
          ? Rule.fromJson(json['Rule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final rule = this.rule;
    return {
      if (rule != null) 'Rule': rule,
    };
  }
}

class GetSampledRequestsResponse {
  /// The total number of requests from which <code>GetSampledRequests</code> got
  /// a sample of <code>MaxItems</code> requests. If <code>PopulationSize</code>
  /// is less than <code>MaxItems</code>, the sample includes every request that
  /// your AWS resource received during the specified time range.
  final int? populationSize;

  /// A complex type that contains detailed information about each of the requests
  /// in the sample.
  final List<SampledHTTPRequest>? sampledRequests;

  /// Usually, <code>TimeWindow</code> is the time range that you specified in the
  /// <code>GetSampledRequests</code> request. However, if your AWS resource
  /// received more than 5,000 requests during the time range that you specified
  /// in the request, <code>GetSampledRequests</code> returns the time range for
  /// the first 5,000 requests. Times are in Coordinated Universal Time (UTC)
  /// format.
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

class GetSizeConstraintSetResponse {
  /// Information about the <a>SizeConstraintSet</a> that you specified in the
  /// <code>GetSizeConstraintSet</code> request. For more information, see the
  /// following topics:
  ///
  /// <ul>
  /// <li>
  /// <a>SizeConstraintSet</a>: Contains <code>SizeConstraintSetId</code>,
  /// <code>SizeConstraints</code>, and <code>Name</code>
  /// </li>
  /// <li>
  /// <code>SizeConstraints</code>: Contains an array of <a>SizeConstraint</a>
  /// objects. Each <code>SizeConstraint</code> object contains
  /// <a>FieldToMatch</a>, <code>TextTransformation</code>,
  /// <code>ComparisonOperator</code>, and <code>Size</code>
  /// </li>
  /// <li>
  /// <a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code>
  /// </li>
  /// </ul>
  final SizeConstraintSet? sizeConstraintSet;

  GetSizeConstraintSetResponse({
    this.sizeConstraintSet,
  });

  factory GetSizeConstraintSetResponse.fromJson(Map<String, dynamic> json) {
    return GetSizeConstraintSetResponse(
      sizeConstraintSet: json['SizeConstraintSet'] != null
          ? SizeConstraintSet.fromJson(
              json['SizeConstraintSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sizeConstraintSet = this.sizeConstraintSet;
    return {
      if (sizeConstraintSet != null) 'SizeConstraintSet': sizeConstraintSet,
    };
  }
}

/// The response to a <a>GetSqlInjectionMatchSet</a> request.
class GetSqlInjectionMatchSetResponse {
  /// Information about the <a>SqlInjectionMatchSet</a> that you specified in the
  /// <code>GetSqlInjectionMatchSet</code> request. For more information, see the
  /// following topics:
  ///
  /// <ul>
  /// <li>
  /// <a>SqlInjectionMatchSet</a>: Contains <code>Name</code>,
  /// <code>SqlInjectionMatchSetId</code>, and an array of
  /// <code>SqlInjectionMatchTuple</code> objects
  /// </li>
  /// <li>
  /// <a>SqlInjectionMatchTuple</a>: Each <code>SqlInjectionMatchTuple</code>
  /// object contains <code>FieldToMatch</code> and
  /// <code>TextTransformation</code>
  /// </li>
  /// <li>
  /// <a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code>
  /// </li>
  /// </ul>
  final SqlInjectionMatchSet? sqlInjectionMatchSet;

  GetSqlInjectionMatchSetResponse({
    this.sqlInjectionMatchSet,
  });

  factory GetSqlInjectionMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return GetSqlInjectionMatchSetResponse(
      sqlInjectionMatchSet: json['SqlInjectionMatchSet'] != null
          ? SqlInjectionMatchSet.fromJson(
              json['SqlInjectionMatchSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sqlInjectionMatchSet = this.sqlInjectionMatchSet;
    return {
      if (sqlInjectionMatchSet != null)
        'SqlInjectionMatchSet': sqlInjectionMatchSet,
    };
  }
}

class GetWebACLResponse {
  /// Information about the <a>WebACL</a> that you specified in the
  /// <code>GetWebACL</code> request. For more information, see the following
  /// topics:
  ///
  /// <ul>
  /// <li>
  /// <a>WebACL</a>: Contains <code>DefaultAction</code>, <code>MetricName</code>,
  /// <code>Name</code>, an array of <code>Rule</code> objects, and
  /// <code>WebACLId</code>
  /// </li>
  /// <li>
  /// <code>DefaultAction</code> (Data type is <a>WafAction</a>): Contains
  /// <code>Type</code>
  /// </li>
  /// <li>
  /// <code>Rules</code>: Contains an array of <code>ActivatedRule</code> objects,
  /// which contain <code>Action</code>, <code>Priority</code>, and
  /// <code>RuleId</code>
  /// </li>
  /// <li>
  /// <code>Action</code>: Contains <code>Type</code>
  /// </li>
  /// </ul>
  final WebACL? webACL;

  GetWebACLResponse({
    this.webACL,
  });

  factory GetWebACLResponse.fromJson(Map<String, dynamic> json) {
    return GetWebACLResponse(
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

/// The response to a <a>GetXssMatchSet</a> request.
class GetXssMatchSetResponse {
  /// Information about the <a>XssMatchSet</a> that you specified in the
  /// <code>GetXssMatchSet</code> request. For more information, see the following
  /// topics:
  ///
  /// <ul>
  /// <li>
  /// <a>XssMatchSet</a>: Contains <code>Name</code>, <code>XssMatchSetId</code>,
  /// and an array of <code>XssMatchTuple</code> objects
  /// </li>
  /// <li>
  /// <a>XssMatchTuple</a>: Each <code>XssMatchTuple</code> object contains
  /// <code>FieldToMatch</code> and <code>TextTransformation</code>
  /// </li>
  /// <li>
  /// <a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code>
  /// </li>
  /// </ul>
  final XssMatchSet? xssMatchSet;

  GetXssMatchSetResponse({
    this.xssMatchSet,
  });

  factory GetXssMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return GetXssMatchSetResponse(
      xssMatchSet: json['XssMatchSet'] != null
          ? XssMatchSet.fromJson(json['XssMatchSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final xssMatchSet = this.xssMatchSet;
    return {
      if (xssMatchSet != null) 'XssMatchSet': xssMatchSet,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// The response from a <a>GetSampledRequests</a> request includes an
/// <code>HTTPHeader</code> complex type that appears as <code>Headers</code> in
/// the response syntax. <code>HTTPHeader</code> contains the names and values
/// of all of the headers that appear in one of the web requests that were
/// returned by <code>GetSampledRequests</code>.
class HTTPHeader {
  /// The name of one of the headers in the sampled web request.
  final String? name;

  /// The value of one of the headers in the sampled web request.
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

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// The response from a <a>GetSampledRequests</a> request includes an
/// <code>HTTPRequest</code> complex type that appears as <code>Request</code>
/// in the response syntax. <code>HTTPRequest</code> contains information about
/// one of the web requests that were returned by
/// <code>GetSampledRequests</code>.
class HTTPRequest {
  /// The IP address that the request originated from. If the <code>WebACL</code>
  /// is associated with a CloudFront distribution, this is the value of one of
  /// the following fields in CloudFront access logs:
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

  /// A complex type that contains two values for each header in the sampled web
  /// request: the name of the header and the value of the header.
  final List<HTTPHeader>? headers;

  /// The HTTP method specified in the sampled web request. CloudFront supports
  /// the following methods: <code>DELETE</code>, <code>GET</code>,
  /// <code>HEAD</code>, <code>OPTIONS</code>, <code>PATCH</code>,
  /// <code>POST</code>, and <code>PUT</code>.
  final String? method;

  /// The part of a web request that identifies the resource, for example,
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

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Contains one or more IP addresses or blocks of IP addresses specified in
/// Classless Inter-Domain Routing (CIDR) notation. AWS WAF supports IPv4
/// address ranges: /8 and any range between /16 through /32. AWS WAF supports
/// IPv6 address ranges: /24, /32, /48, /56, /64, and /128.
///
/// To specify an individual IP address, you specify the four-part IP address
/// followed by a <code>/32</code>, for example, 192.0.2.0/32. To block a range
/// of IP addresses, you can specify /8 or any range between /16 through /32
/// (for IPv4) or /24, /32, /48, /56, /64, or /128 (for IPv6). For more
/// information about CIDR notation, see the Wikipedia entry <a
/// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
/// Inter-Domain Routing</a>.
class IPSet {
  /// The IP address type (<code>IPV4</code> or <code>IPV6</code>) and the IP
  /// address range (in CIDR notation) that web requests originate from. If the
  /// <code>WebACL</code> is associated with a CloudFront distribution and the
  /// viewer did not use an HTTP proxy or a load balancer to send the request,
  /// this is the value of the c-ip field in the CloudFront access logs.
  final List<IPSetDescriptor> iPSetDescriptors;

  /// The <code>IPSetId</code> for an <code>IPSet</code>. You use
  /// <code>IPSetId</code> to get information about an <code>IPSet</code> (see
  /// <a>GetIPSet</a>), update an <code>IPSet</code> (see <a>UpdateIPSet</a>),
  /// insert an <code>IPSet</code> into a <code>Rule</code> or delete one from a
  /// <code>Rule</code> (see <a>UpdateRule</a>), and delete an <code>IPSet</code>
  /// from AWS WAF (see <a>DeleteIPSet</a>).
  ///
  /// <code>IPSetId</code> is returned by <a>CreateIPSet</a> and by
  /// <a>ListIPSets</a>.
  final String iPSetId;

  /// A friendly name or description of the <a>IPSet</a>. You can't change the
  /// name of an <code>IPSet</code> after you create it.
  final String? name;

  IPSet({
    required this.iPSetDescriptors,
    required this.iPSetId,
    this.name,
  });

  factory IPSet.fromJson(Map<String, dynamic> json) {
    return IPSet(
      iPSetDescriptors: (json['IPSetDescriptors'] as List)
          .whereNotNull()
          .map((e) => IPSetDescriptor.fromJson(e as Map<String, dynamic>))
          .toList(),
      iPSetId: json['IPSetId'] as String,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final iPSetDescriptors = this.iPSetDescriptors;
    final iPSetId = this.iPSetId;
    final name = this.name;
    return {
      'IPSetDescriptors': iPSetDescriptors,
      'IPSetId': iPSetId,
      if (name != null) 'Name': name,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Specifies the IP address type (<code>IPV4</code> or <code>IPV6</code>) and
/// the IP address range (in CIDR format) that web requests originate from.
class IPSetDescriptor {
  /// Specify <code>IPV4</code> or <code>IPV6</code>.
  final IPSetDescriptorType type;

  /// Specify an IPv4 address by using CIDR notation. For example:
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
  /// </ul>
  /// For more information about CIDR notation, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless
  /// Inter-Domain Routing</a>.
  ///
  /// Specify an IPv6 address by using CIDR notation. For example:
  ///
  /// <ul>
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
  final String value;

  IPSetDescriptor({
    required this.type,
    required this.value,
  });

  factory IPSetDescriptor.fromJson(Map<String, dynamic> json) {
    return IPSetDescriptor(
      type: (json['Type'] as String).toIPSetDescriptorType(),
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'Type': type.toValue(),
      'Value': value,
    };
  }
}

enum IPSetDescriptorType {
  ipv4,
  ipv6,
}

extension IPSetDescriptorTypeValueExtension on IPSetDescriptorType {
  String toValue() {
    switch (this) {
      case IPSetDescriptorType.ipv4:
        return 'IPV4';
      case IPSetDescriptorType.ipv6:
        return 'IPV6';
    }
  }
}

extension IPSetDescriptorTypeFromString on String {
  IPSetDescriptorType toIPSetDescriptorType() {
    switch (this) {
      case 'IPV4':
        return IPSetDescriptorType.ipv4;
      case 'IPV6':
        return IPSetDescriptorType.ipv6;
    }
    throw Exception('$this is not known in enum IPSetDescriptorType');
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Contains the identifier and the name of the <code>IPSet</code>.
class IPSetSummary {
  /// The <code>IPSetId</code> for an <a>IPSet</a>. You can use
  /// <code>IPSetId</code> in a <a>GetIPSet</a> request to get detailed
  /// information about an <a>IPSet</a>.
  final String iPSetId;

  /// A friendly name or description of the <a>IPSet</a>. You can't change the
  /// name of an <code>IPSet</code> after you create it.
  final String name;

  IPSetSummary({
    required this.iPSetId,
    required this.name,
  });

  factory IPSetSummary.fromJson(Map<String, dynamic> json) {
    return IPSetSummary(
      iPSetId: json['IPSetId'] as String,
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final iPSetId = this.iPSetId;
    final name = this.name;
    return {
      'IPSetId': iPSetId,
      'Name': name,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Specifies the type of update to perform to an <a>IPSet</a> with
/// <a>UpdateIPSet</a>.
class IPSetUpdate {
  /// Specifies whether to insert or delete an IP address with <a>UpdateIPSet</a>.
  final ChangeAction action;

  /// The IP address type (<code>IPV4</code> or <code>IPV6</code>) and the IP
  /// address range (in CIDR notation) that web requests originate from.
  final IPSetDescriptor iPSetDescriptor;

  IPSetUpdate({
    required this.action,
    required this.iPSetDescriptor,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final iPSetDescriptor = this.iPSetDescriptor;
    return {
      'Action': action.toValue(),
      'IPSetDescriptor': iPSetDescriptor,
    };
  }
}

class ListActivatedRulesInRuleGroupResponse {
  /// An array of <code>ActivatedRules</code> objects.
  final List<ActivatedRule>? activatedRules;

  /// If you have more <code>ActivatedRules</code> than the number that you
  /// specified for <code>Limit</code> in the request, the response includes a
  /// <code>NextMarker</code> value. To list more <code>ActivatedRules</code>,
  /// submit another <code>ListActivatedRulesInRuleGroup</code> request, and
  /// specify the <code>NextMarker</code> value from the response in the
  /// <code>NextMarker</code> value in the next request.
  final String? nextMarker;

  ListActivatedRulesInRuleGroupResponse({
    this.activatedRules,
    this.nextMarker,
  });

  factory ListActivatedRulesInRuleGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return ListActivatedRulesInRuleGroupResponse(
      activatedRules: (json['ActivatedRules'] as List?)
          ?.whereNotNull()
          .map((e) => ActivatedRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activatedRules = this.activatedRules;
    final nextMarker = this.nextMarker;
    return {
      if (activatedRules != null) 'ActivatedRules': activatedRules,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class ListByteMatchSetsResponse {
  /// An array of <a>ByteMatchSetSummary</a> objects.
  final List<ByteMatchSetSummary>? byteMatchSets;

  /// If you have more <code>ByteMatchSet</code> objects than the number that you
  /// specified for <code>Limit</code> in the request, the response includes a
  /// <code>NextMarker</code> value. To list more <code>ByteMatchSet</code>
  /// objects, submit another <code>ListByteMatchSets</code> request, and specify
  /// the <code>NextMarker</code> value from the response in the
  /// <code>NextMarker</code> value in the next request.
  final String? nextMarker;

  ListByteMatchSetsResponse({
    this.byteMatchSets,
    this.nextMarker,
  });

  factory ListByteMatchSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListByteMatchSetsResponse(
      byteMatchSets: (json['ByteMatchSets'] as List?)
          ?.whereNotNull()
          .map((e) => ByteMatchSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final byteMatchSets = this.byteMatchSets;
    final nextMarker = this.nextMarker;
    return {
      if (byteMatchSets != null) 'ByteMatchSets': byteMatchSets,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class ListGeoMatchSetsResponse {
  /// An array of <a>GeoMatchSetSummary</a> objects.
  final List<GeoMatchSetSummary>? geoMatchSets;

  /// If you have more <code>GeoMatchSet</code> objects than the number that you
  /// specified for <code>Limit</code> in the request, the response includes a
  /// <code>NextMarker</code> value. To list more <code>GeoMatchSet</code>
  /// objects, submit another <code>ListGeoMatchSets</code> request, and specify
  /// the <code>NextMarker</code> value from the response in the
  /// <code>NextMarker</code> value in the next request.
  final String? nextMarker;

  ListGeoMatchSetsResponse({
    this.geoMatchSets,
    this.nextMarker,
  });

  factory ListGeoMatchSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListGeoMatchSetsResponse(
      geoMatchSets: (json['GeoMatchSets'] as List?)
          ?.whereNotNull()
          .map((e) => GeoMatchSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final geoMatchSets = this.geoMatchSets;
    final nextMarker = this.nextMarker;
    return {
      if (geoMatchSets != null) 'GeoMatchSets': geoMatchSets,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class ListIPSetsResponse {
  /// An array of <a>IPSetSummary</a> objects.
  final List<IPSetSummary>? iPSets;

  /// To list more <code>IPSet</code> objects, submit another
  /// <code>ListIPSets</code> request, and in the next request use the
  /// <code>NextMarker</code> response value as the <code>NextMarker</code> value.
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
  /// An array of <a>LoggingConfiguration</a> objects.
  final List<LoggingConfiguration>? loggingConfigurations;

  /// If you have more <code>LoggingConfigurations</code> than the number that you
  /// specified for <code>Limit</code> in the request, the response includes a
  /// <code>NextMarker</code> value. To list more
  /// <code>LoggingConfigurations</code>, submit another
  /// <code>ListLoggingConfigurations</code> request, and specify the
  /// <code>NextMarker</code> value from the response in the
  /// <code>NextMarker</code> value in the next request.
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

class ListRateBasedRulesResponse {
  /// If you have more <code>Rules</code> than the number that you specified for
  /// <code>Limit</code> in the request, the response includes a
  /// <code>NextMarker</code> value. To list more <code>Rules</code>, submit
  /// another <code>ListRateBasedRules</code> request, and specify the
  /// <code>NextMarker</code> value from the response in the
  /// <code>NextMarker</code> value in the next request.
  final String? nextMarker;

  /// An array of <a>RuleSummary</a> objects.
  final List<RuleSummary>? rules;

  ListRateBasedRulesResponse({
    this.nextMarker,
    this.rules,
  });

  factory ListRateBasedRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListRateBasedRulesResponse(
      nextMarker: json['NextMarker'] as String?,
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => RuleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
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

class ListRegexMatchSetsResponse {
  /// If you have more <code>RegexMatchSet</code> objects than the number that you
  /// specified for <code>Limit</code> in the request, the response includes a
  /// <code>NextMarker</code> value. To list more <code>RegexMatchSet</code>
  /// objects, submit another <code>ListRegexMatchSets</code> request, and specify
  /// the <code>NextMarker</code> value from the response in the
  /// <code>NextMarker</code> value in the next request.
  final String? nextMarker;

  /// An array of <a>RegexMatchSetSummary</a> objects.
  final List<RegexMatchSetSummary>? regexMatchSets;

  ListRegexMatchSetsResponse({
    this.nextMarker,
    this.regexMatchSets,
  });

  factory ListRegexMatchSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListRegexMatchSetsResponse(
      nextMarker: json['NextMarker'] as String?,
      regexMatchSets: (json['RegexMatchSets'] as List?)
          ?.whereNotNull()
          .map((e) => RegexMatchSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final regexMatchSets = this.regexMatchSets;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (regexMatchSets != null) 'RegexMatchSets': regexMatchSets,
    };
  }
}

class ListRegexPatternSetsResponse {
  /// If you have more <code>RegexPatternSet</code> objects than the number that
  /// you specified for <code>Limit</code> in the request, the response includes a
  /// <code>NextMarker</code> value. To list more <code>RegexPatternSet</code>
  /// objects, submit another <code>ListRegexPatternSets</code> request, and
  /// specify the <code>NextMarker</code> value from the response in the
  /// <code>NextMarker</code> value in the next request.
  final String? nextMarker;

  /// An array of <a>RegexPatternSetSummary</a> objects.
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

class ListRuleGroupsResponse {
  /// If you have more <code>RuleGroups</code> than the number that you specified
  /// for <code>Limit</code> in the request, the response includes a
  /// <code>NextMarker</code> value. To list more <code>RuleGroups</code>, submit
  /// another <code>ListRuleGroups</code> request, and specify the
  /// <code>NextMarker</code> value from the response in the
  /// <code>NextMarker</code> value in the next request.
  final String? nextMarker;

  /// An array of <a>RuleGroup</a> objects.
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

class ListRulesResponse {
  /// If you have more <code>Rules</code> than the number that you specified for
  /// <code>Limit</code> in the request, the response includes a
  /// <code>NextMarker</code> value. To list more <code>Rules</code>, submit
  /// another <code>ListRules</code> request, and specify the
  /// <code>NextMarker</code> value from the response in the
  /// <code>NextMarker</code> value in the next request.
  final String? nextMarker;

  /// An array of <a>RuleSummary</a> objects.
  final List<RuleSummary>? rules;

  ListRulesResponse({
    this.nextMarker,
    this.rules,
  });

  factory ListRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListRulesResponse(
      nextMarker: json['NextMarker'] as String?,
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => RuleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
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

class ListSizeConstraintSetsResponse {
  /// If you have more <code>SizeConstraintSet</code> objects than the number that
  /// you specified for <code>Limit</code> in the request, the response includes a
  /// <code>NextMarker</code> value. To list more <code>SizeConstraintSet</code>
  /// objects, submit another <code>ListSizeConstraintSets</code> request, and
  /// specify the <code>NextMarker</code> value from the response in the
  /// <code>NextMarker</code> value in the next request.
  final String? nextMarker;

  /// An array of <a>SizeConstraintSetSummary</a> objects.
  final List<SizeConstraintSetSummary>? sizeConstraintSets;

  ListSizeConstraintSetsResponse({
    this.nextMarker,
    this.sizeConstraintSets,
  });

  factory ListSizeConstraintSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListSizeConstraintSetsResponse(
      nextMarker: json['NextMarker'] as String?,
      sizeConstraintSets: (json['SizeConstraintSets'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SizeConstraintSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final sizeConstraintSets = this.sizeConstraintSets;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (sizeConstraintSets != null) 'SizeConstraintSets': sizeConstraintSets,
    };
  }
}

/// The response to a <a>ListSqlInjectionMatchSets</a> request.
class ListSqlInjectionMatchSetsResponse {
  /// If you have more <a>SqlInjectionMatchSet</a> objects than the number that
  /// you specified for <code>Limit</code> in the request, the response includes a
  /// <code>NextMarker</code> value. To list more
  /// <code>SqlInjectionMatchSet</code> objects, submit another
  /// <code>ListSqlInjectionMatchSets</code> request, and specify the
  /// <code>NextMarker</code> value from the response in the
  /// <code>NextMarker</code> value in the next request.
  final String? nextMarker;

  /// An array of <a>SqlInjectionMatchSetSummary</a> objects.
  final List<SqlInjectionMatchSetSummary>? sqlInjectionMatchSets;

  ListSqlInjectionMatchSetsResponse({
    this.nextMarker,
    this.sqlInjectionMatchSets,
  });

  factory ListSqlInjectionMatchSetsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSqlInjectionMatchSetsResponse(
      nextMarker: json['NextMarker'] as String?,
      sqlInjectionMatchSets: (json['SqlInjectionMatchSets'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SqlInjectionMatchSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final sqlInjectionMatchSets = this.sqlInjectionMatchSets;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (sqlInjectionMatchSets != null)
        'SqlInjectionMatchSets': sqlInjectionMatchSets,
    };
  }
}

class ListSubscribedRuleGroupsResponse {
  /// If you have more objects than the number that you specified for
  /// <code>Limit</code> in the request, the response includes a
  /// <code>NextMarker</code> value. To list more objects, submit another
  /// <code>ListSubscribedRuleGroups</code> request, and specify the
  /// <code>NextMarker</code> value from the response in the
  /// <code>NextMarker</code> value in the next request.
  final String? nextMarker;

  /// An array of <a>RuleGroup</a> objects.
  final List<SubscribedRuleGroupSummary>? ruleGroups;

  ListSubscribedRuleGroupsResponse({
    this.nextMarker,
    this.ruleGroups,
  });

  factory ListSubscribedRuleGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListSubscribedRuleGroupsResponse(
      nextMarker: json['NextMarker'] as String?,
      ruleGroups: (json['RuleGroups'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SubscribedRuleGroupSummary.fromJson(e as Map<String, dynamic>))
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
  /// <p/>
  final String? nextMarker;

  /// <p/>
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
  /// If you have more <code>WebACL</code> objects than the number that you
  /// specified for <code>Limit</code> in the request, the response includes a
  /// <code>NextMarker</code> value. To list more <code>WebACL</code> objects,
  /// submit another <code>ListWebACLs</code> request, and specify the
  /// <code>NextMarker</code> value from the response in the
  /// <code>NextMarker</code> value in the next request.
  final String? nextMarker;

  /// An array of <a>WebACLSummary</a> objects.
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

/// The response to a <a>ListXssMatchSets</a> request.
class ListXssMatchSetsResponse {
  /// If you have more <a>XssMatchSet</a> objects than the number that you
  /// specified for <code>Limit</code> in the request, the response includes a
  /// <code>NextMarker</code> value. To list more <code>XssMatchSet</code>
  /// objects, submit another <code>ListXssMatchSets</code> request, and specify
  /// the <code>NextMarker</code> value from the response in the
  /// <code>NextMarker</code> value in the next request.
  final String? nextMarker;

  /// An array of <a>XssMatchSetSummary</a> objects.
  final List<XssMatchSetSummary>? xssMatchSets;

  ListXssMatchSetsResponse({
    this.nextMarker,
    this.xssMatchSets,
  });

  factory ListXssMatchSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListXssMatchSetsResponse(
      nextMarker: json['NextMarker'] as String?,
      xssMatchSets: (json['XssMatchSets'] as List?)
          ?.whereNotNull()
          .map((e) => XssMatchSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final xssMatchSets = this.xssMatchSets;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (xssMatchSets != null) 'XssMatchSets': xssMatchSets,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// The Amazon Kinesis Data Firehose, <code>RedactedFields</code> information,
/// and the web ACL Amazon Resource Name (ARN).
class LoggingConfiguration {
  /// An array of Amazon Kinesis Data Firehose ARNs.
  final List<String> logDestinationConfigs;

  /// The Amazon Resource Name (ARN) of the web ACL that you want to associate
  /// with <code>LogDestinationConfigs</code>.
  final String resourceArn;

  /// The parts of the request that you want redacted from the logs. For example,
  /// if you redact the cookie field, the cookie field in the firehose will be
  /// <code>xxx</code>.
  final List<FieldToMatch>? redactedFields;

  LoggingConfiguration({
    required this.logDestinationConfigs,
    required this.resourceArn,
    this.redactedFields,
  });

  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return LoggingConfiguration(
      logDestinationConfigs: (json['LogDestinationConfigs'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      resourceArn: json['ResourceArn'] as String,
      redactedFields: (json['RedactedFields'] as List?)
          ?.whereNotNull()
          .map((e) => FieldToMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logDestinationConfigs = this.logDestinationConfigs;
    final resourceArn = this.resourceArn;
    final redactedFields = this.redactedFields;
    return {
      'LogDestinationConfigs': logDestinationConfigs,
      'ResourceArn': resourceArn,
      if (redactedFields != null) 'RedactedFields': redactedFields,
    };
  }
}

enum MatchFieldType {
  uri,
  queryString,
  header,
  method,
  body,
  singleQueryArg,
  allQueryArgs,
}

extension MatchFieldTypeValueExtension on MatchFieldType {
  String toValue() {
    switch (this) {
      case MatchFieldType.uri:
        return 'URI';
      case MatchFieldType.queryString:
        return 'QUERY_STRING';
      case MatchFieldType.header:
        return 'HEADER';
      case MatchFieldType.method:
        return 'METHOD';
      case MatchFieldType.body:
        return 'BODY';
      case MatchFieldType.singleQueryArg:
        return 'SINGLE_QUERY_ARG';
      case MatchFieldType.allQueryArgs:
        return 'ALL_QUERY_ARGS';
    }
  }
}

extension MatchFieldTypeFromString on String {
  MatchFieldType toMatchFieldType() {
    switch (this) {
      case 'URI':
        return MatchFieldType.uri;
      case 'QUERY_STRING':
        return MatchFieldType.queryString;
      case 'HEADER':
        return MatchFieldType.header;
      case 'METHOD':
        return MatchFieldType.method;
      case 'BODY':
        return MatchFieldType.body;
      case 'SINGLE_QUERY_ARG':
        return MatchFieldType.singleQueryArg;
      case 'ALL_QUERY_ARGS':
        return MatchFieldType.allQueryArgs;
    }
    throw Exception('$this is not known in enum MatchFieldType');
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

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Specifies the <a>ByteMatchSet</a>, <a>IPSet</a>,
/// <a>SqlInjectionMatchSet</a>, <a>XssMatchSet</a>, <a>RegexMatchSet</a>,
/// <a>GeoMatchSet</a>, and <a>SizeConstraintSet</a> objects that you want to
/// add to a <code>Rule</code> and, for each object, indicates whether you want
/// to negate the settings, for example, requests that do NOT originate from the
/// IP address 192.0.2.44.
class Predicate {
  /// A unique identifier for a predicate in a <code>Rule</code>, such as
  /// <code>ByteMatchSetId</code> or <code>IPSetId</code>. The ID is returned by
  /// the corresponding <code>Create</code> or <code>List</code> command.
  final String dataId;

  /// Set <code>Negated</code> to <code>False</code> if you want AWS WAF to allow,
  /// block, or count requests based on the settings in the specified
  /// <a>ByteMatchSet</a>, <a>IPSet</a>, <a>SqlInjectionMatchSet</a>,
  /// <a>XssMatchSet</a>, <a>RegexMatchSet</a>, <a>GeoMatchSet</a>, or
  /// <a>SizeConstraintSet</a>. For example, if an <code>IPSet</code> includes the
  /// IP address <code>192.0.2.44</code>, AWS WAF will allow or block requests
  /// based on that IP address.
  ///
  /// Set <code>Negated</code> to <code>True</code> if you want AWS WAF to allow
  /// or block a request based on the negation of the settings in the
  /// <a>ByteMatchSet</a>, <a>IPSet</a>, <a>SqlInjectionMatchSet</a>,
  /// <a>XssMatchSet</a>, <a>RegexMatchSet</a>, <a>GeoMatchSet</a>, or
  /// <a>SizeConstraintSet</a>. For example, if an <code>IPSet</code> includes the
  /// IP address <code>192.0.2.44</code>, AWS WAF will allow, block, or count
  /// requests based on all IP addresses <i>except</i> <code>192.0.2.44</code>.
  final bool negated;

  /// The type of predicate in a <code>Rule</code>, such as <code>ByteMatch</code>
  /// or <code>IPSet</code>.
  final PredicateType type;

  Predicate({
    required this.dataId,
    required this.negated,
    required this.type,
  });

  factory Predicate.fromJson(Map<String, dynamic> json) {
    return Predicate(
      dataId: json['DataId'] as String,
      negated: json['Negated'] as bool,
      type: (json['Type'] as String).toPredicateType(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataId = this.dataId;
    final negated = this.negated;
    final type = this.type;
    return {
      'DataId': dataId,
      'Negated': negated,
      'Type': type.toValue(),
    };
  }
}

enum PredicateType {
  iPMatch,
  byteMatch,
  sqlInjectionMatch,
  geoMatch,
  sizeConstraint,
  xssMatch,
  regexMatch,
}

extension PredicateTypeValueExtension on PredicateType {
  String toValue() {
    switch (this) {
      case PredicateType.iPMatch:
        return 'IPMatch';
      case PredicateType.byteMatch:
        return 'ByteMatch';
      case PredicateType.sqlInjectionMatch:
        return 'SqlInjectionMatch';
      case PredicateType.geoMatch:
        return 'GeoMatch';
      case PredicateType.sizeConstraint:
        return 'SizeConstraint';
      case PredicateType.xssMatch:
        return 'XssMatch';
      case PredicateType.regexMatch:
        return 'RegexMatch';
    }
  }
}

extension PredicateTypeFromString on String {
  PredicateType toPredicateType() {
    switch (this) {
      case 'IPMatch':
        return PredicateType.iPMatch;
      case 'ByteMatch':
        return PredicateType.byteMatch;
      case 'SqlInjectionMatch':
        return PredicateType.sqlInjectionMatch;
      case 'GeoMatch':
        return PredicateType.geoMatch;
      case 'SizeConstraint':
        return PredicateType.sizeConstraint;
      case 'XssMatch':
        return PredicateType.xssMatch;
      case 'RegexMatch':
        return PredicateType.regexMatch;
    }
    throw Exception('$this is not known in enum PredicateType');
  }
}

class PutLoggingConfigurationResponse {
  /// The <a>LoggingConfiguration</a> that you submitted in the request.
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

class PutPermissionPolicyResponse {
  PutPermissionPolicyResponse();

  factory PutPermissionPolicyResponse.fromJson(Map<String, dynamic> _) {
    return PutPermissionPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// A <code>RateBasedRule</code> is identical to a regular <a>Rule</a>, with one
/// addition: a <code>RateBasedRule</code> counts the number of requests that
/// arrive from a specified IP address every five minutes. For example, based on
/// recent requests that you've seen from an attacker, you might create a
/// <code>RateBasedRule</code> that includes the following conditions:
///
/// <ul>
/// <li>
/// The requests come from 192.0.2.44.
/// </li>
/// <li>
/// They contain the value <code>BadBot</code> in the <code>User-Agent</code>
/// header.
/// </li>
/// </ul>
/// In the rule, you also define the rate limit as 1,000.
///
/// Requests that meet both of these conditions and exceed 1,000 requests every
/// five minutes trigger the rule's action (block or count), which is defined in
/// the web ACL.
class RateBasedRule {
  /// The <code>Predicates</code> object contains one <code>Predicate</code>
  /// element for each <a>ByteMatchSet</a>, <a>IPSet</a>, or
  /// <a>SqlInjectionMatchSet</a> object that you want to include in a
  /// <code>RateBasedRule</code>.
  final List<Predicate> matchPredicates;

  /// The field that AWS WAF uses to determine if requests are likely arriving
  /// from single source and thus subject to rate monitoring. The only valid value
  /// for <code>RateKey</code> is <code>IP</code>. <code>IP</code> indicates that
  /// requests arriving from the same IP address are subject to the
  /// <code>RateLimit</code> that is specified in the <code>RateBasedRule</code>.
  final RateKey rateKey;

  /// The maximum number of requests, which have an identical value in the field
  /// specified by the <code>RateKey</code>, allowed in a five-minute period. If
  /// the number of requests exceeds the <code>RateLimit</code> and the other
  /// predicates specified in the rule are also met, AWS WAF triggers the action
  /// that is specified for this rule.
  final int rateLimit;

  /// A unique identifier for a <code>RateBasedRule</code>. You use
  /// <code>RuleId</code> to get more information about a
  /// <code>RateBasedRule</code> (see <a>GetRateBasedRule</a>), update a
  /// <code>RateBasedRule</code> (see <a>UpdateRateBasedRule</a>), insert a
  /// <code>RateBasedRule</code> into a <code>WebACL</code> or delete one from a
  /// <code>WebACL</code> (see <a>UpdateWebACL</a>), or delete a
  /// <code>RateBasedRule</code> from AWS WAF (see <a>DeleteRateBasedRule</a>).
  final String ruleId;

  /// A friendly name or description for the metrics for a
  /// <code>RateBasedRule</code>. The name can contain only alphanumeric
  /// characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one.
  /// It can't contain whitespace or metric names reserved for AWS WAF, including
  /// "All" and "Default_Action." You can't change the name of the metric after
  /// you create the <code>RateBasedRule</code>.
  final String? metricName;

  /// A friendly name or description for a <code>RateBasedRule</code>. You can't
  /// change the name of a <code>RateBasedRule</code> after you create it.
  final String? name;

  RateBasedRule({
    required this.matchPredicates,
    required this.rateKey,
    required this.rateLimit,
    required this.ruleId,
    this.metricName,
    this.name,
  });

  factory RateBasedRule.fromJson(Map<String, dynamic> json) {
    return RateBasedRule(
      matchPredicates: (json['MatchPredicates'] as List)
          .whereNotNull()
          .map((e) => Predicate.fromJson(e as Map<String, dynamic>))
          .toList(),
      rateKey: (json['RateKey'] as String).toRateKey(),
      rateLimit: json['RateLimit'] as int,
      ruleId: json['RuleId'] as String,
      metricName: json['MetricName'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final matchPredicates = this.matchPredicates;
    final rateKey = this.rateKey;
    final rateLimit = this.rateLimit;
    final ruleId = this.ruleId;
    final metricName = this.metricName;
    final name = this.name;
    return {
      'MatchPredicates': matchPredicates,
      'RateKey': rateKey.toValue(),
      'RateLimit': rateLimit,
      'RuleId': ruleId,
      if (metricName != null) 'MetricName': metricName,
      if (name != null) 'Name': name,
    };
  }
}

enum RateKey {
  ip,
}

extension RateKeyValueExtension on RateKey {
  String toValue() {
    switch (this) {
      case RateKey.ip:
        return 'IP';
    }
  }
}

extension RateKeyFromString on String {
  RateKey toRateKey() {
    switch (this) {
      case 'IP':
        return RateKey.ip;
    }
    throw Exception('$this is not known in enum RateKey');
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// In a <a>GetRegexMatchSet</a> request, <code>RegexMatchSet</code> is a
/// complex type that contains the <code>RegexMatchSetId</code> and
/// <code>Name</code> of a <code>RegexMatchSet</code>, and the values that you
/// specified when you updated the <code>RegexMatchSet</code>.
///
/// The values are contained in a <code>RegexMatchTuple</code> object, which
/// specify the parts of web requests that you want AWS WAF to inspect and the
/// values that you want AWS WAF to search for. If a <code>RegexMatchSet</code>
/// contains more than one <code>RegexMatchTuple</code> object, a request needs
/// to match the settings in only one <code>ByteMatchTuple</code> to be
/// considered a match.
class RegexMatchSet {
  /// A friendly name or description of the <a>RegexMatchSet</a>. You can't change
  /// <code>Name</code> after you create a <code>RegexMatchSet</code>.
  final String? name;

  /// The <code>RegexMatchSetId</code> for a <code>RegexMatchSet</code>. You use
  /// <code>RegexMatchSetId</code> to get information about a
  /// <code>RegexMatchSet</code> (see <a>GetRegexMatchSet</a>), update a
  /// <code>RegexMatchSet</code> (see <a>UpdateRegexMatchSet</a>), insert a
  /// <code>RegexMatchSet</code> into a <code>Rule</code> or delete one from a
  /// <code>Rule</code> (see <a>UpdateRule</a>), and delete a
  /// <code>RegexMatchSet</code> from AWS WAF (see <a>DeleteRegexMatchSet</a>).
  ///
  /// <code>RegexMatchSetId</code> is returned by <a>CreateRegexMatchSet</a> and
  /// by <a>ListRegexMatchSets</a>.
  final String? regexMatchSetId;

  /// Contains an array of <a>RegexMatchTuple</a> objects. Each
  /// <code>RegexMatchTuple</code> object contains:
  ///
  /// <ul>
  /// <li>
  /// The part of a web request that you want AWS WAF to inspect, such as a query
  /// string or the value of the <code>User-Agent</code> header.
  /// </li>
  /// <li>
  /// The identifier of the pattern (a regular expression) that you want AWS WAF
  /// to look for. For more information, see <a>RegexPatternSet</a>.
  /// </li>
  /// <li>
  /// Whether to perform any conversions on the request, such as converting it to
  /// lowercase, before inspecting it for the specified string.
  /// </li>
  /// </ul>
  final List<RegexMatchTuple>? regexMatchTuples;

  RegexMatchSet({
    this.name,
    this.regexMatchSetId,
    this.regexMatchTuples,
  });

  factory RegexMatchSet.fromJson(Map<String, dynamic> json) {
    return RegexMatchSet(
      name: json['Name'] as String?,
      regexMatchSetId: json['RegexMatchSetId'] as String?,
      regexMatchTuples: (json['RegexMatchTuples'] as List?)
          ?.whereNotNull()
          .map((e) => RegexMatchTuple.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final regexMatchSetId = this.regexMatchSetId;
    final regexMatchTuples = this.regexMatchTuples;
    return {
      if (name != null) 'Name': name,
      if (regexMatchSetId != null) 'RegexMatchSetId': regexMatchSetId,
      if (regexMatchTuples != null) 'RegexMatchTuples': regexMatchTuples,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Returned by <a>ListRegexMatchSets</a>. Each
/// <code>RegexMatchSetSummary</code> object includes the <code>Name</code> and
/// <code>RegexMatchSetId</code> for one <a>RegexMatchSet</a>.
class RegexMatchSetSummary {
  /// A friendly name or description of the <a>RegexMatchSet</a>. You can't change
  /// <code>Name</code> after you create a <code>RegexMatchSet</code>.
  final String name;

  /// The <code>RegexMatchSetId</code> for a <code>RegexMatchSet</code>. You use
  /// <code>RegexMatchSetId</code> to get information about a
  /// <code>RegexMatchSet</code>, update a <code>RegexMatchSet</code>, remove a
  /// <code>RegexMatchSet</code> from a <code>Rule</code>, and delete a
  /// <code>RegexMatchSet</code> from AWS WAF.
  ///
  /// <code>RegexMatchSetId</code> is returned by <a>CreateRegexMatchSet</a> and
  /// by <a>ListRegexMatchSets</a>.
  final String regexMatchSetId;

  RegexMatchSetSummary({
    required this.name,
    required this.regexMatchSetId,
  });

  factory RegexMatchSetSummary.fromJson(Map<String, dynamic> json) {
    return RegexMatchSetSummary(
      name: json['Name'] as String,
      regexMatchSetId: json['RegexMatchSetId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final regexMatchSetId = this.regexMatchSetId;
    return {
      'Name': name,
      'RegexMatchSetId': regexMatchSetId,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// In an <a>UpdateRegexMatchSet</a> request, <code>RegexMatchSetUpdate</code>
/// specifies whether to insert or delete a <a>RegexMatchTuple</a> and includes
/// the settings for the <code>RegexMatchTuple</code>.
class RegexMatchSetUpdate {
  /// Specifies whether to insert or delete a <a>RegexMatchTuple</a>.
  final ChangeAction action;

  /// Information about the part of a web request that you want AWS WAF to inspect
  /// and the identifier of the regular expression (regex) pattern that you want
  /// AWS WAF to search for. If you specify <code>DELETE</code> for the value of
  /// <code>Action</code>, the <code>RegexMatchTuple</code> values must exactly
  /// match the values in the <code>RegexMatchTuple</code> that you want to delete
  /// from the <code>RegexMatchSet</code>.
  final RegexMatchTuple regexMatchTuple;

  RegexMatchSetUpdate({
    required this.action,
    required this.regexMatchTuple,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final regexMatchTuple = this.regexMatchTuple;
    return {
      'Action': action.toValue(),
      'RegexMatchTuple': regexMatchTuple,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// The regular expression pattern that you want AWS WAF to search for in web
/// requests, the location in requests that you want AWS WAF to search, and
/// other settings. Each <code>RegexMatchTuple</code> object contains:
///
/// <ul>
/// <li>
/// The part of a web request that you want AWS WAF to inspect, such as a query
/// string or the value of the <code>User-Agent</code> header.
/// </li>
/// <li>
/// The identifier of the pattern (a regular expression) that you want AWS WAF
/// to look for. For more information, see <a>RegexPatternSet</a>.
/// </li>
/// <li>
/// Whether to perform any conversions on the request, such as converting it to
/// lowercase, before inspecting it for the specified string.
/// </li>
/// </ul>
class RegexMatchTuple {
  /// Specifies where in a web request to look for the
  /// <code>RegexPatternSet</code>.
  final FieldToMatch fieldToMatch;

  /// The <code>RegexPatternSetId</code> for a <code>RegexPatternSet</code>. You
  /// use <code>RegexPatternSetId</code> to get information about a
  /// <code>RegexPatternSet</code> (see <a>GetRegexPatternSet</a>), update a
  /// <code>RegexPatternSet</code> (see <a>UpdateRegexPatternSet</a>), insert a
  /// <code>RegexPatternSet</code> into a <code>RegexMatchSet</code> or delete one
  /// from a <code>RegexMatchSet</code> (see <a>UpdateRegexMatchSet</a>), and
  /// delete an <code>RegexPatternSet</code> from AWS WAF (see
  /// <a>DeleteRegexPatternSet</a>).
  ///
  /// <code>RegexPatternSetId</code> is returned by <a>CreateRegexPatternSet</a>
  /// and by <a>ListRegexPatternSets</a>.
  final String regexPatternSetId;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass AWS WAF. If you specify a
  /// transformation, AWS WAF performs the transformation on
  /// <code>RegexPatternSet</code> before inspecting a request for a match.
  ///
  /// You can only specify a single type of TextTransformation.
  ///
  /// <b>CMD_LINE</b>
  ///
  /// When you're concerned that attackers are injecting an operating system
  /// commandline command and using unusual formatting to disguise some or all of
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
  /// Specify <code>NONE</code> if you don't want to perform any text
  /// transformations.
  final TextTransformation textTransformation;

  RegexMatchTuple({
    required this.fieldToMatch,
    required this.regexPatternSetId,
    required this.textTransformation,
  });

  factory RegexMatchTuple.fromJson(Map<String, dynamic> json) {
    return RegexMatchTuple(
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      regexPatternSetId: json['RegexPatternSetId'] as String,
      textTransformation:
          (json['TextTransformation'] as String).toTextTransformation(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldToMatch = this.fieldToMatch;
    final regexPatternSetId = this.regexPatternSetId;
    final textTransformation = this.textTransformation;
    return {
      'FieldToMatch': fieldToMatch,
      'RegexPatternSetId': regexPatternSetId,
      'TextTransformation': textTransformation.toValue(),
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// The <code>RegexPatternSet</code> specifies the regular expression (regex)
/// pattern that you want AWS WAF to search for, such as
/// <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those
/// requests.
class RegexPatternSet {
  /// The identifier for the <code>RegexPatternSet</code>. You use
  /// <code>RegexPatternSetId</code> to get information about a
  /// <code>RegexPatternSet</code>, update a <code>RegexPatternSet</code>, remove
  /// a <code>RegexPatternSet</code> from a <code>RegexMatchSet</code>, and delete
  /// a <code>RegexPatternSet</code> from AWS WAF.
  ///
  /// <code>RegexMatchSetId</code> is returned by <a>CreateRegexPatternSet</a> and
  /// by <a>ListRegexPatternSets</a>.
  final String regexPatternSetId;

  /// Specifies the regular expression (regex) patterns that you want AWS WAF to
  /// search for, such as <code>B[a@]dB[o0]t</code>.
  final List<String> regexPatternStrings;

  /// A friendly name or description of the <a>RegexPatternSet</a>. You can't
  /// change <code>Name</code> after you create a <code>RegexPatternSet</code>.
  final String? name;

  RegexPatternSet({
    required this.regexPatternSetId,
    required this.regexPatternStrings,
    this.name,
  });

  factory RegexPatternSet.fromJson(Map<String, dynamic> json) {
    return RegexPatternSet(
      regexPatternSetId: json['RegexPatternSetId'] as String,
      regexPatternStrings: (json['RegexPatternStrings'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final regexPatternSetId = this.regexPatternSetId;
    final regexPatternStrings = this.regexPatternStrings;
    final name = this.name;
    return {
      'RegexPatternSetId': regexPatternSetId,
      'RegexPatternStrings': regexPatternStrings,
      if (name != null) 'Name': name,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Returned by <a>ListRegexPatternSets</a>. Each
/// <code>RegexPatternSetSummary</code> object includes the <code>Name</code>
/// and <code>RegexPatternSetId</code> for one <a>RegexPatternSet</a>.
class RegexPatternSetSummary {
  /// A friendly name or description of the <a>RegexPatternSet</a>. You can't
  /// change <code>Name</code> after you create a <code>RegexPatternSet</code>.
  final String name;

  /// The <code>RegexPatternSetId</code> for a <code>RegexPatternSet</code>. You
  /// use <code>RegexPatternSetId</code> to get information about a
  /// <code>RegexPatternSet</code>, update a <code>RegexPatternSet</code>, remove
  /// a <code>RegexPatternSet</code> from a <code>RegexMatchSet</code>, and delete
  /// a <code>RegexPatternSet</code> from AWS WAF.
  ///
  /// <code>RegexPatternSetId</code> is returned by <a>CreateRegexPatternSet</a>
  /// and by <a>ListRegexPatternSets</a>.
  final String regexPatternSetId;

  RegexPatternSetSummary({
    required this.name,
    required this.regexPatternSetId,
  });

  factory RegexPatternSetSummary.fromJson(Map<String, dynamic> json) {
    return RegexPatternSetSummary(
      name: json['Name'] as String,
      regexPatternSetId: json['RegexPatternSetId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final regexPatternSetId = this.regexPatternSetId;
    return {
      'Name': name,
      'RegexPatternSetId': regexPatternSetId,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// In an <a>UpdateRegexPatternSet</a> request,
/// <code>RegexPatternSetUpdate</code> specifies whether to insert or delete a
/// <code>RegexPatternString</code> and includes the settings for the
/// <code>RegexPatternString</code>.
class RegexPatternSetUpdate {
  /// Specifies whether to insert or delete a <code>RegexPatternString</code>.
  final ChangeAction action;

  /// Specifies the regular expression (regex) pattern that you want AWS WAF to
  /// search for, such as <code>B[a@]dB[o0]t</code>.
  final String regexPatternString;

  RegexPatternSetUpdate({
    required this.action,
    required this.regexPatternString,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final regexPatternString = this.regexPatternString;
    return {
      'Action': action.toValue(),
      'RegexPatternString': regexPatternString,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// A combination of <a>ByteMatchSet</a>, <a>IPSet</a>, and/or
/// <a>SqlInjectionMatchSet</a> objects that identify the web requests that you
/// want to allow, block, or count. For example, you might create a
/// <code>Rule</code> that includes the following predicates:
///
/// <ul>
/// <li>
/// An <code>IPSet</code> that causes AWS WAF to search for web requests that
/// originate from the IP address <code>192.0.2.44</code>
/// </li>
/// <li>
/// A <code>ByteMatchSet</code> that causes AWS WAF to search for web requests
/// for which the value of the <code>User-Agent</code> header is
/// <code>BadBot</code>.
/// </li>
/// </ul>
/// To match the settings in this <code>Rule</code>, a request must originate
/// from <code>192.0.2.44</code> AND include a <code>User-Agent</code> header
/// for which the value is <code>BadBot</code>.
class Rule {
  /// The <code>Predicates</code> object contains one <code>Predicate</code>
  /// element for each <a>ByteMatchSet</a>, <a>IPSet</a>, or
  /// <a>SqlInjectionMatchSet</a> object that you want to include in a
  /// <code>Rule</code>.
  final List<Predicate> predicates;

  /// A unique identifier for a <code>Rule</code>. You use <code>RuleId</code> to
  /// get more information about a <code>Rule</code> (see <a>GetRule</a>), update
  /// a <code>Rule</code> (see <a>UpdateRule</a>), insert a <code>Rule</code> into
  /// a <code>WebACL</code> or delete a one from a <code>WebACL</code> (see
  /// <a>UpdateWebACL</a>), or delete a <code>Rule</code> from AWS WAF (see
  /// <a>DeleteRule</a>).
  ///
  /// <code>RuleId</code> is returned by <a>CreateRule</a> and by
  /// <a>ListRules</a>.
  final String ruleId;

  /// A friendly name or description for the metrics for this <code>Rule</code>.
  /// The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with
  /// maximum length 128 and minimum length one. It can't contain whitespace or
  /// metric names reserved for AWS WAF, including "All" and "Default_Action." You
  /// can't change <code>MetricName</code> after you create the <code>Rule</code>.
  final String? metricName;

  /// The friendly name or description for the <code>Rule</code>. You can't change
  /// the name of a <code>Rule</code> after you create it.
  final String? name;

  Rule({
    required this.predicates,
    required this.ruleId,
    this.metricName,
    this.name,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      predicates: (json['Predicates'] as List)
          .whereNotNull()
          .map((e) => Predicate.fromJson(e as Map<String, dynamic>))
          .toList(),
      ruleId: json['RuleId'] as String,
      metricName: json['MetricName'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final predicates = this.predicates;
    final ruleId = this.ruleId;
    final metricName = this.metricName;
    final name = this.name;
    return {
      'Predicates': predicates,
      'RuleId': ruleId,
      if (metricName != null) 'MetricName': metricName,
      if (name != null) 'Name': name,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// A collection of predefined rules that you can add to a web ACL.
///
/// Rule groups are subject to the following limits:
///
/// <ul>
/// <li>
/// Three rule groups per account. You can request an increase to this limit by
/// contacting customer support.
/// </li>
/// <li>
/// One rule group per web ACL.
/// </li>
/// <li>
/// Ten rules per rule group.
/// </li>
/// </ul>
class RuleGroup {
  /// A unique identifier for a <code>RuleGroup</code>. You use
  /// <code>RuleGroupId</code> to get more information about a
  /// <code>RuleGroup</code> (see <a>GetRuleGroup</a>), update a
  /// <code>RuleGroup</code> (see <a>UpdateRuleGroup</a>), insert a
  /// <code>RuleGroup</code> into a <code>WebACL</code> or delete a one from a
  /// <code>WebACL</code> (see <a>UpdateWebACL</a>), or delete a
  /// <code>RuleGroup</code> from AWS WAF (see <a>DeleteRuleGroup</a>).
  ///
  /// <code>RuleGroupId</code> is returned by <a>CreateRuleGroup</a> and by
  /// <a>ListRuleGroups</a>.
  final String ruleGroupId;

  /// A friendly name or description for the metrics for this
  /// <code>RuleGroup</code>. The name can contain only alphanumeric characters
  /// (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't
  /// contain whitespace or metric names reserved for AWS WAF, including "All" and
  /// "Default_Action." You can't change the name of the metric after you create
  /// the <code>RuleGroup</code>.
  final String? metricName;

  /// The friendly name or description for the <code>RuleGroup</code>. You can't
  /// change the name of a <code>RuleGroup</code> after you create it.
  final String? name;

  RuleGroup({
    required this.ruleGroupId,
    this.metricName,
    this.name,
  });

  factory RuleGroup.fromJson(Map<String, dynamic> json) {
    return RuleGroup(
      ruleGroupId: json['RuleGroupId'] as String,
      metricName: json['MetricName'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleGroupId = this.ruleGroupId;
    final metricName = this.metricName;
    final name = this.name;
    return {
      'RuleGroupId': ruleGroupId,
      if (metricName != null) 'MetricName': metricName,
      if (name != null) 'Name': name,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Contains the identifier and the friendly name or description of the
/// <code>RuleGroup</code>.
class RuleGroupSummary {
  /// A friendly name or description of the <a>RuleGroup</a>. You can't change the
  /// name of a <code>RuleGroup</code> after you create it.
  final String name;

  /// A unique identifier for a <code>RuleGroup</code>. You use
  /// <code>RuleGroupId</code> to get more information about a
  /// <code>RuleGroup</code> (see <a>GetRuleGroup</a>), update a
  /// <code>RuleGroup</code> (see <a>UpdateRuleGroup</a>), insert a
  /// <code>RuleGroup</code> into a <code>WebACL</code> or delete one from a
  /// <code>WebACL</code> (see <a>UpdateWebACL</a>), or delete a
  /// <code>RuleGroup</code> from AWS WAF (see <a>DeleteRuleGroup</a>).
  ///
  /// <code>RuleGroupId</code> is returned by <a>CreateRuleGroup</a> and by
  /// <a>ListRuleGroups</a>.
  final String ruleGroupId;

  RuleGroupSummary({
    required this.name,
    required this.ruleGroupId,
  });

  factory RuleGroupSummary.fromJson(Map<String, dynamic> json) {
    return RuleGroupSummary(
      name: json['Name'] as String,
      ruleGroupId: json['RuleGroupId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final ruleGroupId = this.ruleGroupId;
    return {
      'Name': name,
      'RuleGroupId': ruleGroupId,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Specifies an <code>ActivatedRule</code> and indicates whether you want to
/// add it to a <code>RuleGroup</code> or delete it from a
/// <code>RuleGroup</code>.
class RuleGroupUpdate {
  /// Specify <code>INSERT</code> to add an <code>ActivatedRule</code> to a
  /// <code>RuleGroup</code>. Use <code>DELETE</code> to remove an
  /// <code>ActivatedRule</code> from a <code>RuleGroup</code>.
  final ChangeAction action;

  /// The <code>ActivatedRule</code> object specifies a <code>Rule</code> that you
  /// want to insert or delete, the priority of the <code>Rule</code> in the
  /// <code>WebACL</code>, and the action that you want AWS WAF to take when a web
  /// request matches the <code>Rule</code> (<code>ALLOW</code>,
  /// <code>BLOCK</code>, or <code>COUNT</code>).
  final ActivatedRule activatedRule;

  RuleGroupUpdate({
    required this.action,
    required this.activatedRule,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final activatedRule = this.activatedRule;
    return {
      'Action': action.toValue(),
      'ActivatedRule': activatedRule,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Contains the identifier and the friendly name or description of the
/// <code>Rule</code>.
class RuleSummary {
  /// A friendly name or description of the <a>Rule</a>. You can't change the name
  /// of a <code>Rule</code> after you create it.
  final String name;

  /// A unique identifier for a <code>Rule</code>. You use <code>RuleId</code> to
  /// get more information about a <code>Rule</code> (see <a>GetRule</a>), update
  /// a <code>Rule</code> (see <a>UpdateRule</a>), insert a <code>Rule</code> into
  /// a <code>WebACL</code> or delete one from a <code>WebACL</code> (see
  /// <a>UpdateWebACL</a>), or delete a <code>Rule</code> from AWS WAF (see
  /// <a>DeleteRule</a>).
  ///
  /// <code>RuleId</code> is returned by <a>CreateRule</a> and by
  /// <a>ListRules</a>.
  final String ruleId;

  RuleSummary({
    required this.name,
    required this.ruleId,
  });

  factory RuleSummary.fromJson(Map<String, dynamic> json) {
    return RuleSummary(
      name: json['Name'] as String,
      ruleId: json['RuleId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final ruleId = this.ruleId;
    return {
      'Name': name,
      'RuleId': ruleId,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Specifies a <code>Predicate</code> (such as an <code>IPSet</code>) and
/// indicates whether you want to add it to a <code>Rule</code> or delete it
/// from a <code>Rule</code>.
class RuleUpdate {
  /// Specify <code>INSERT</code> to add a <code>Predicate</code> to a
  /// <code>Rule</code>. Use <code>DELETE</code> to remove a
  /// <code>Predicate</code> from a <code>Rule</code>.
  final ChangeAction action;

  /// The ID of the <code>Predicate</code> (such as an <code>IPSet</code>) that
  /// you want to add to a <code>Rule</code>.
  final Predicate predicate;

  RuleUpdate({
    required this.action,
    required this.predicate,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final predicate = this.predicate;
    return {
      'Action': action.toValue(),
      'Predicate': predicate,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// The response from a <a>GetSampledRequests</a> request includes a
/// <code>SampledHTTPRequests</code> complex type that appears as
/// <code>SampledRequests</code> in the response syntax.
/// <code>SampledHTTPRequests</code> contains one
/// <code>SampledHTTPRequest</code> object for each web request that is returned
/// by <code>GetSampledRequests</code>.
class SampledHTTPRequest {
  /// A complex type that contains detailed information about the request.
  final HTTPRequest request;

  /// A value that indicates how one result in the response relates proportionally
  /// to other results in the response. A result that has a weight of
  /// <code>2</code> represents roughly twice as many CloudFront web requests as a
  /// result that has a weight of <code>1</code>.
  final int weight;

  /// The action for the <code>Rule</code> that the request matched:
  /// <code>ALLOW</code>, <code>BLOCK</code>, or <code>COUNT</code>.
  final String? action;

  /// This value is returned if the <code>GetSampledRequests</code> request
  /// specifies the ID of a <code>RuleGroup</code> rather than the ID of an
  /// individual rule. <code>RuleWithinRuleGroup</code> is the rule within the
  /// specified <code>RuleGroup</code> that matched the request listed in the
  /// response.
  final String? ruleWithinRuleGroup;

  /// The time at which AWS WAF received the request from your AWS resource, in
  /// Unix time format (in seconds).
  final DateTime? timestamp;

  SampledHTTPRequest({
    required this.request,
    required this.weight,
    this.action,
    this.ruleWithinRuleGroup,
    this.timestamp,
  });

  factory SampledHTTPRequest.fromJson(Map<String, dynamic> json) {
    return SampledHTTPRequest(
      request: HTTPRequest.fromJson(json['Request'] as Map<String, dynamic>),
      weight: json['Weight'] as int,
      action: json['Action'] as String?,
      ruleWithinRuleGroup: json['RuleWithinRuleGroup'] as String?,
      timestamp: timeStampFromJson(json['Timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final request = this.request;
    final weight = this.weight;
    final action = this.action;
    final ruleWithinRuleGroup = this.ruleWithinRuleGroup;
    final timestamp = this.timestamp;
    return {
      'Request': request,
      'Weight': weight,
      if (action != null) 'Action': action,
      if (ruleWithinRuleGroup != null)
        'RuleWithinRuleGroup': ruleWithinRuleGroup,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Specifies a constraint on the size of a part of the web request. AWS WAF
/// uses the <code>Size</code>, <code>ComparisonOperator</code>, and
/// <code>FieldToMatch</code> to build an expression in the form of
/// "<code>Size</code> <code>ComparisonOperator</code> size in bytes of
/// <code>FieldToMatch</code>". If that expression is true, the
/// <code>SizeConstraint</code> is considered to match.
class SizeConstraint {
  /// The type of comparison you want AWS WAF to perform. AWS WAF uses this in
  /// combination with the provided <code>Size</code> and
  /// <code>FieldToMatch</code> to build an expression in the form of
  /// "<code>Size</code> <code>ComparisonOperator</code> size in bytes of
  /// <code>FieldToMatch</code>". If that expression is true, the
  /// <code>SizeConstraint</code> is considered to match.
  ///
  /// <b>EQ</b>: Used to test if the <code>Size</code> is equal to the size of the
  /// <code>FieldToMatch</code>
  ///
  /// <b>NE</b>: Used to test if the <code>Size</code> is not equal to the size of
  /// the <code>FieldToMatch</code>
  ///
  /// <b>LE</b>: Used to test if the <code>Size</code> is less than or equal to
  /// the size of the <code>FieldToMatch</code>
  ///
  /// <b>LT</b>: Used to test if the <code>Size</code> is strictly less than the
  /// size of the <code>FieldToMatch</code>
  ///
  /// <b>GE</b>: Used to test if the <code>Size</code> is greater than or equal to
  /// the size of the <code>FieldToMatch</code>
  ///
  /// <b>GT</b>: Used to test if the <code>Size</code> is strictly greater than
  /// the size of the <code>FieldToMatch</code>
  final ComparisonOperator comparisonOperator;

  /// Specifies where in a web request to look for the size constraint.
  final FieldToMatch fieldToMatch;

  /// The size in bytes that you want AWS WAF to compare against the size of the
  /// specified <code>FieldToMatch</code>. AWS WAF uses this in combination with
  /// <code>ComparisonOperator</code> and <code>FieldToMatch</code> to build an
  /// expression in the form of "<code>Size</code> <code>ComparisonOperator</code>
  /// size in bytes of <code>FieldToMatch</code>". If that expression is true, the
  /// <code>SizeConstraint</code> is considered to match.
  ///
  /// Valid values for size are 0 - 21474836480 bytes (0 - 20 GB).
  ///
  /// If you specify <code>URI</code> for the value of <code>Type</code>, the / in
  /// the URI counts as one character. For example, the URI <code>/logo.jpg</code>
  /// is nine characters long.
  final int size;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass AWS WAF. If you specify a
  /// transformation, AWS WAF performs the transformation on
  /// <code>FieldToMatch</code> before inspecting it for a match.
  ///
  /// You can only specify a single type of TextTransformation.
  ///
  /// Note that if you choose <code>BODY</code> for the value of
  /// <code>Type</code>, you must choose <code>NONE</code> for
  /// <code>TextTransformation</code> because CloudFront forwards only the first
  /// 8192 bytes for inspection.
  ///
  /// <b>NONE</b>
  ///
  /// Specify <code>NONE</code> if you don't want to perform any text
  /// transformations.
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
  final TextTransformation textTransformation;

  SizeConstraint({
    required this.comparisonOperator,
    required this.fieldToMatch,
    required this.size,
    required this.textTransformation,
  });

  factory SizeConstraint.fromJson(Map<String, dynamic> json) {
    return SizeConstraint(
      comparisonOperator:
          (json['ComparisonOperator'] as String).toComparisonOperator(),
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      size: json['Size'] as int,
      textTransformation:
          (json['TextTransformation'] as String).toTextTransformation(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final fieldToMatch = this.fieldToMatch;
    final size = this.size;
    final textTransformation = this.textTransformation;
    return {
      'ComparisonOperator': comparisonOperator.toValue(),
      'FieldToMatch': fieldToMatch,
      'Size': size,
      'TextTransformation': textTransformation.toValue(),
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// A complex type that contains <code>SizeConstraint</code> objects, which
/// specify the parts of web requests that you want AWS WAF to inspect the size
/// of. If a <code>SizeConstraintSet</code> contains more than one
/// <code>SizeConstraint</code> object, a request only needs to match one
/// constraint to be considered a match.
class SizeConstraintSet {
  /// A unique identifier for a <code>SizeConstraintSet</code>. You use
  /// <code>SizeConstraintSetId</code> to get information about a
  /// <code>SizeConstraintSet</code> (see <a>GetSizeConstraintSet</a>), update a
  /// <code>SizeConstraintSet</code> (see <a>UpdateSizeConstraintSet</a>), insert
  /// a <code>SizeConstraintSet</code> into a <code>Rule</code> or delete one from
  /// a <code>Rule</code> (see <a>UpdateRule</a>), and delete a
  /// <code>SizeConstraintSet</code> from AWS WAF (see
  /// <a>DeleteSizeConstraintSet</a>).
  ///
  /// <code>SizeConstraintSetId</code> is returned by
  /// <a>CreateSizeConstraintSet</a> and by <a>ListSizeConstraintSets</a>.
  final String sizeConstraintSetId;

  /// Specifies the parts of web requests that you want to inspect the size of.
  final List<SizeConstraint> sizeConstraints;

  /// The name, if any, of the <code>SizeConstraintSet</code>.
  final String? name;

  SizeConstraintSet({
    required this.sizeConstraintSetId,
    required this.sizeConstraints,
    this.name,
  });

  factory SizeConstraintSet.fromJson(Map<String, dynamic> json) {
    return SizeConstraintSet(
      sizeConstraintSetId: json['SizeConstraintSetId'] as String,
      sizeConstraints: (json['SizeConstraints'] as List)
          .whereNotNull()
          .map((e) => SizeConstraint.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sizeConstraintSetId = this.sizeConstraintSetId;
    final sizeConstraints = this.sizeConstraints;
    final name = this.name;
    return {
      'SizeConstraintSetId': sizeConstraintSetId,
      'SizeConstraints': sizeConstraints,
      if (name != null) 'Name': name,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// The <code>Id</code> and <code>Name</code> of a
/// <code>SizeConstraintSet</code>.
class SizeConstraintSetSummary {
  /// The name of the <code>SizeConstraintSet</code>, if any.
  final String name;

  /// A unique identifier for a <code>SizeConstraintSet</code>. You use
  /// <code>SizeConstraintSetId</code> to get information about a
  /// <code>SizeConstraintSet</code> (see <a>GetSizeConstraintSet</a>), update a
  /// <code>SizeConstraintSet</code> (see <a>UpdateSizeConstraintSet</a>), insert
  /// a <code>SizeConstraintSet</code> into a <code>Rule</code> or delete one from
  /// a <code>Rule</code> (see <a>UpdateRule</a>), and delete a
  /// <code>SizeConstraintSet</code> from AWS WAF (see
  /// <a>DeleteSizeConstraintSet</a>).
  ///
  /// <code>SizeConstraintSetId</code> is returned by
  /// <a>CreateSizeConstraintSet</a> and by <a>ListSizeConstraintSets</a>.
  final String sizeConstraintSetId;

  SizeConstraintSetSummary({
    required this.name,
    required this.sizeConstraintSetId,
  });

  factory SizeConstraintSetSummary.fromJson(Map<String, dynamic> json) {
    return SizeConstraintSetSummary(
      name: json['Name'] as String,
      sizeConstraintSetId: json['SizeConstraintSetId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sizeConstraintSetId = this.sizeConstraintSetId;
    return {
      'Name': name,
      'SizeConstraintSetId': sizeConstraintSetId,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Specifies the part of a web request that you want to inspect the size of and
/// indicates whether you want to add the specification to a
/// <a>SizeConstraintSet</a> or delete it from a <code>SizeConstraintSet</code>.
class SizeConstraintSetUpdate {
  /// Specify <code>INSERT</code> to add a <a>SizeConstraintSetUpdate</a> to a
  /// <a>SizeConstraintSet</a>. Use <code>DELETE</code> to remove a
  /// <code>SizeConstraintSetUpdate</code> from a <code>SizeConstraintSet</code>.
  final ChangeAction action;

  /// Specifies a constraint on the size of a part of the web request. AWS WAF
  /// uses the <code>Size</code>, <code>ComparisonOperator</code>, and
  /// <code>FieldToMatch</code> to build an expression in the form of
  /// "<code>Size</code> <code>ComparisonOperator</code> size in bytes of
  /// <code>FieldToMatch</code>". If that expression is true, the
  /// <code>SizeConstraint</code> is considered to match.
  final SizeConstraint sizeConstraint;

  SizeConstraintSetUpdate({
    required this.action,
    required this.sizeConstraint,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final sizeConstraint = this.sizeConstraint;
    return {
      'Action': action.toValue(),
      'SizeConstraint': sizeConstraint,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// A complex type that contains <code>SqlInjectionMatchTuple</code> objects,
/// which specify the parts of web requests that you want AWS WAF to inspect for
/// snippets of malicious SQL code and, if you want AWS WAF to inspect a header,
/// the name of the header. If a <code>SqlInjectionMatchSet</code> contains more
/// than one <code>SqlInjectionMatchTuple</code> object, a request needs to
/// include snippets of SQL code in only one of the specified parts of the
/// request to be considered a match.
class SqlInjectionMatchSet {
  /// A unique identifier for a <code>SqlInjectionMatchSet</code>. You use
  /// <code>SqlInjectionMatchSetId</code> to get information about a
  /// <code>SqlInjectionMatchSet</code> (see <a>GetSqlInjectionMatchSet</a>),
  /// update a <code>SqlInjectionMatchSet</code> (see
  /// <a>UpdateSqlInjectionMatchSet</a>), insert a
  /// <code>SqlInjectionMatchSet</code> into a <code>Rule</code> or delete one
  /// from a <code>Rule</code> (see <a>UpdateRule</a>), and delete a
  /// <code>SqlInjectionMatchSet</code> from AWS WAF (see
  /// <a>DeleteSqlInjectionMatchSet</a>).
  ///
  /// <code>SqlInjectionMatchSetId</code> is returned by
  /// <a>CreateSqlInjectionMatchSet</a> and by <a>ListSqlInjectionMatchSets</a>.
  final String sqlInjectionMatchSetId;

  /// Specifies the parts of web requests that you want to inspect for snippets of
  /// malicious SQL code.
  final List<SqlInjectionMatchTuple> sqlInjectionMatchTuples;

  /// The name, if any, of the <code>SqlInjectionMatchSet</code>.
  final String? name;

  SqlInjectionMatchSet({
    required this.sqlInjectionMatchSetId,
    required this.sqlInjectionMatchTuples,
    this.name,
  });

  factory SqlInjectionMatchSet.fromJson(Map<String, dynamic> json) {
    return SqlInjectionMatchSet(
      sqlInjectionMatchSetId: json['SqlInjectionMatchSetId'] as String,
      sqlInjectionMatchTuples: (json['SqlInjectionMatchTuples'] as List)
          .whereNotNull()
          .map(
              (e) => SqlInjectionMatchTuple.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sqlInjectionMatchSetId = this.sqlInjectionMatchSetId;
    final sqlInjectionMatchTuples = this.sqlInjectionMatchTuples;
    final name = this.name;
    return {
      'SqlInjectionMatchSetId': sqlInjectionMatchSetId,
      'SqlInjectionMatchTuples': sqlInjectionMatchTuples,
      if (name != null) 'Name': name,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// The <code>Id</code> and <code>Name</code> of a
/// <code>SqlInjectionMatchSet</code>.
class SqlInjectionMatchSetSummary {
  /// The name of the <code>SqlInjectionMatchSet</code>, if any, specified by
  /// <code>Id</code>.
  final String name;

  /// A unique identifier for a <code>SqlInjectionMatchSet</code>. You use
  /// <code>SqlInjectionMatchSetId</code> to get information about a
  /// <code>SqlInjectionMatchSet</code> (see <a>GetSqlInjectionMatchSet</a>),
  /// update a <code>SqlInjectionMatchSet</code> (see
  /// <a>UpdateSqlInjectionMatchSet</a>), insert a
  /// <code>SqlInjectionMatchSet</code> into a <code>Rule</code> or delete one
  /// from a <code>Rule</code> (see <a>UpdateRule</a>), and delete a
  /// <code>SqlInjectionMatchSet</code> from AWS WAF (see
  /// <a>DeleteSqlInjectionMatchSet</a>).
  ///
  /// <code>SqlInjectionMatchSetId</code> is returned by
  /// <a>CreateSqlInjectionMatchSet</a> and by <a>ListSqlInjectionMatchSets</a>.
  final String sqlInjectionMatchSetId;

  SqlInjectionMatchSetSummary({
    required this.name,
    required this.sqlInjectionMatchSetId,
  });

  factory SqlInjectionMatchSetSummary.fromJson(Map<String, dynamic> json) {
    return SqlInjectionMatchSetSummary(
      name: json['Name'] as String,
      sqlInjectionMatchSetId: json['SqlInjectionMatchSetId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sqlInjectionMatchSetId = this.sqlInjectionMatchSetId;
    return {
      'Name': name,
      'SqlInjectionMatchSetId': sqlInjectionMatchSetId,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Specifies the part of a web request that you want to inspect for snippets of
/// malicious SQL code and indicates whether you want to add the specification
/// to a <a>SqlInjectionMatchSet</a> or delete it from a
/// <code>SqlInjectionMatchSet</code>.
class SqlInjectionMatchSetUpdate {
  /// Specify <code>INSERT</code> to add a <a>SqlInjectionMatchSetUpdate</a> to a
  /// <a>SqlInjectionMatchSet</a>. Use <code>DELETE</code> to remove a
  /// <code>SqlInjectionMatchSetUpdate</code> from a
  /// <code>SqlInjectionMatchSet</code>.
  final ChangeAction action;

  /// Specifies the part of a web request that you want AWS WAF to inspect for
  /// snippets of malicious SQL code and, if you want AWS WAF to inspect a header,
  /// the name of the header.
  final SqlInjectionMatchTuple sqlInjectionMatchTuple;

  SqlInjectionMatchSetUpdate({
    required this.action,
    required this.sqlInjectionMatchTuple,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final sqlInjectionMatchTuple = this.sqlInjectionMatchTuple;
    return {
      'Action': action.toValue(),
      'SqlInjectionMatchTuple': sqlInjectionMatchTuple,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Specifies the part of a web request that you want AWS WAF to inspect for
/// snippets of malicious SQL code and, if you want AWS WAF to inspect a header,
/// the name of the header.
class SqlInjectionMatchTuple {
  /// Specifies where in a web request to look for snippets of malicious SQL code.
  final FieldToMatch fieldToMatch;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass AWS WAF. If you specify a
  /// transformation, AWS WAF performs the transformation on
  /// <code>FieldToMatch</code> before inspecting it for a match.
  ///
  /// You can only specify a single type of TextTransformation.
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
  /// Specify <code>NONE</code> if you don't want to perform any text
  /// transformations.
  final TextTransformation textTransformation;

  SqlInjectionMatchTuple({
    required this.fieldToMatch,
    required this.textTransformation,
  });

  factory SqlInjectionMatchTuple.fromJson(Map<String, dynamic> json) {
    return SqlInjectionMatchTuple(
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      textTransformation:
          (json['TextTransformation'] as String).toTextTransformation(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldToMatch = this.fieldToMatch;
    final textTransformation = this.textTransformation;
    return {
      'FieldToMatch': fieldToMatch,
      'TextTransformation': textTransformation.toValue(),
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// A summary of the rule groups you are subscribed to.
class SubscribedRuleGroupSummary {
  /// A friendly name or description for the metrics for this
  /// <code>RuleGroup</code>. The name can contain only alphanumeric characters
  /// (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't
  /// contain whitespace or metric names reserved for AWS WAF, including "All" and
  /// "Default_Action." You can't change the name of the metric after you create
  /// the <code>RuleGroup</code>.
  final String metricName;

  /// A friendly name or description of the <code>RuleGroup</code>. You can't
  /// change the name of a <code>RuleGroup</code> after you create it.
  final String name;

  /// A unique identifier for a <code>RuleGroup</code>.
  final String ruleGroupId;

  SubscribedRuleGroupSummary({
    required this.metricName,
    required this.name,
    required this.ruleGroupId,
  });

  factory SubscribedRuleGroupSummary.fromJson(Map<String, dynamic> json) {
    return SubscribedRuleGroupSummary(
      metricName: json['MetricName'] as String,
      name: json['Name'] as String,
      ruleGroupId: json['RuleGroupId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final name = this.name;
    final ruleGroupId = this.ruleGroupId;
    return {
      'MetricName': metricName,
      'Name': name,
      'RuleGroupId': ruleGroupId,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// A tag associated with an AWS resource. Tags are key:value pairs that you can
/// use to categorize and manage your resources, for purposes like billing. For
/// example, you might set the tag key to "customer" and the value to the
/// customer name or ID. You can specify one or more tags to add to each AWS
/// resource, up to 50 tags for a resource.
///
/// Tagging is only available through the API, SDKs, and CLI. You can't manage
/// or view tags through the AWS WAF Classic console. You can tag the AWS
/// resources that you manage through AWS WAF Classic: web ACLs, rule groups,
/// and rules.
class Tag {
  /// <p/>
  final String key;

  /// <p/>
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

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Information for a tag associated with an AWS resource. Tags are key:value
/// pairs that you can use to categorize and manage your resources, for purposes
/// like billing. For example, you might set the tag key to "customer" and the
/// value to the customer name or ID. You can specify one or more tags to add to
/// each AWS resource, up to 50 tags for a resource.
///
/// Tagging is only available through the API, SDKs, and CLI. You can't manage
/// or view tags through the AWS WAF Classic console. You can tag the AWS
/// resources that you manage through AWS WAF Classic: web ACLs, rule groups,
/// and rules.
class TagInfoForResource {
  /// <p/>
  final String? resourceARN;

  /// <p/>
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

enum TextTransformation {
  none,
  compressWhiteSpace,
  htmlEntityDecode,
  lowercase,
  cmdLine,
  urlDecode,
}

extension TextTransformationValueExtension on TextTransformation {
  String toValue() {
    switch (this) {
      case TextTransformation.none:
        return 'NONE';
      case TextTransformation.compressWhiteSpace:
        return 'COMPRESS_WHITE_SPACE';
      case TextTransformation.htmlEntityDecode:
        return 'HTML_ENTITY_DECODE';
      case TextTransformation.lowercase:
        return 'LOWERCASE';
      case TextTransformation.cmdLine:
        return 'CMD_LINE';
      case TextTransformation.urlDecode:
        return 'URL_DECODE';
    }
  }
}

extension TextTransformationFromString on String {
  TextTransformation toTextTransformation() {
    switch (this) {
      case 'NONE':
        return TextTransformation.none;
      case 'COMPRESS_WHITE_SPACE':
        return TextTransformation.compressWhiteSpace;
      case 'HTML_ENTITY_DECODE':
        return TextTransformation.htmlEntityDecode;
      case 'LOWERCASE':
        return TextTransformation.lowercase;
      case 'CMD_LINE':
        return TextTransformation.cmdLine;
      case 'URL_DECODE':
        return TextTransformation.urlDecode;
    }
    throw Exception('$this is not known in enum TextTransformation');
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// In a <a>GetSampledRequests</a> request, the <code>StartTime</code> and
/// <code>EndTime</code> objects specify the time range for which you want AWS
/// WAF to return a sample of web requests.
///
/// You must specify the times in Coordinated Universal Time (UTC) format. UTC
/// format includes the special designator, <code>Z</code>. For example,
/// <code>"2016-09-27T14:50Z"</code>.
///
/// In a <a>GetSampledRequests</a> response, the <code>StartTime</code> and
/// <code>EndTime</code> objects specify the time range for which AWS WAF
/// actually returned a sample of web requests. AWS WAF gets the specified
/// number of requests from among the first 5,000 requests that your AWS
/// resource receives during the specified time period. If your resource
/// receives more than 5,000 requests during that period, AWS WAF stops sampling
/// after the 5,000th request. In that case, <code>EndTime</code> is the time
/// that AWS WAF received the 5,000th request.
class TimeWindow {
  /// The end of the time range from which you want
  /// <code>GetSampledRequests</code> to return a sample of the requests that your
  /// AWS resource received. You must specify the date and time in Coordinated
  /// Universal Time (UTC) format. UTC format includes the special designator,
  /// <code>Z</code>. For example, <code>"2016-09-27T14:50Z"</code>. You can
  /// specify any time range in the previous three hours.
  final DateTime endTime;

  /// The beginning of the time range from which you want
  /// <code>GetSampledRequests</code> to return a sample of the requests that your
  /// AWS resource received. You must specify the date and time in Coordinated
  /// Universal Time (UTC) format. UTC format includes the special designator,
  /// <code>Z</code>. For example, <code>"2016-09-27T14:50Z"</code>. You can
  /// specify any time range in the previous three hours.
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

class UpdateByteMatchSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>UpdateByteMatchSet</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  UpdateByteMatchSetResponse({
    this.changeToken,
  });

  factory UpdateByteMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateByteMatchSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class UpdateGeoMatchSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>UpdateGeoMatchSet</code> request. You can also use this value to query
  /// the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  UpdateGeoMatchSetResponse({
    this.changeToken,
  });

  factory UpdateGeoMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateGeoMatchSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class UpdateIPSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>UpdateIPSet</code> request. You can also use this value to query the
  /// status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  UpdateIPSetResponse({
    this.changeToken,
  });

  factory UpdateIPSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateIPSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class UpdateRateBasedRuleResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>UpdateRateBasedRule</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  UpdateRateBasedRuleResponse({
    this.changeToken,
  });

  factory UpdateRateBasedRuleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRateBasedRuleResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class UpdateRegexMatchSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>UpdateRegexMatchSet</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  UpdateRegexMatchSetResponse({
    this.changeToken,
  });

  factory UpdateRegexMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRegexMatchSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class UpdateRegexPatternSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>UpdateRegexPatternSet</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  UpdateRegexPatternSetResponse({
    this.changeToken,
  });

  factory UpdateRegexPatternSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRegexPatternSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class UpdateRuleGroupResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>UpdateRuleGroup</code> request. You can also use this value to query
  /// the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  UpdateRuleGroupResponse({
    this.changeToken,
  });

  factory UpdateRuleGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRuleGroupResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class UpdateRuleResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>UpdateRule</code> request. You can also use this value to query the
  /// status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  UpdateRuleResponse({
    this.changeToken,
  });

  factory UpdateRuleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRuleResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class UpdateSizeConstraintSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>UpdateSizeConstraintSet</code> request. You can also use this value to
  /// query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  UpdateSizeConstraintSetResponse({
    this.changeToken,
  });

  factory UpdateSizeConstraintSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSizeConstraintSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

/// The response to an <a>UpdateSqlInjectionMatchSets</a> request.
class UpdateSqlInjectionMatchSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>UpdateSqlInjectionMatchSet</code> request. You can also use this value
  /// to query the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  UpdateSqlInjectionMatchSetResponse({
    this.changeToken,
  });

  factory UpdateSqlInjectionMatchSetResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateSqlInjectionMatchSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

class UpdateWebACLResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>UpdateWebACL</code> request. You can also use this value to query the
  /// status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  UpdateWebACLResponse({
    this.changeToken,
  });

  factory UpdateWebACLResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWebACLResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

/// The response to an <a>UpdateXssMatchSets</a> request.
class UpdateXssMatchSetResponse {
  /// The <code>ChangeToken</code> that you used to submit the
  /// <code>UpdateXssMatchSet</code> request. You can also use this value to query
  /// the status of the request. For more information, see
  /// <a>GetChangeTokenStatus</a>.
  final String? changeToken;

  UpdateXssMatchSetResponse({
    this.changeToken,
  });

  factory UpdateXssMatchSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateXssMatchSetResponse(
      changeToken: json['ChangeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeToken = this.changeToken;
    return {
      if (changeToken != null) 'ChangeToken': changeToken,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// For the action that is associated with a rule in a <code>WebACL</code>,
/// specifies the action that you want AWS WAF to perform when a web request
/// matches all of the conditions in a rule. For the default action in a
/// <code>WebACL</code>, specifies the action that you want AWS WAF to take when
/// a web request doesn't match all of the conditions in any of the rules in a
/// <code>WebACL</code>.
class WafAction {
  /// Specifies how you want AWS WAF to respond to requests that match the
  /// settings in a <code>Rule</code>. Valid settings include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ALLOW</code>: AWS WAF allows requests
  /// </li>
  /// <li>
  /// <code>BLOCK</code>: AWS WAF blocks requests
  /// </li>
  /// <li>
  /// <code>COUNT</code>: AWS WAF increments a counter of the requests that match
  /// all of the conditions in the rule. AWS WAF then continues to inspect the web
  /// request based on the remaining rules in the web ACL. You can't specify
  /// <code>COUNT</code> for the default action for a <code>WebACL</code>.
  /// </li>
  /// </ul>
  final WafActionType type;

  WafAction({
    required this.type,
  });

  factory WafAction.fromJson(Map<String, dynamic> json) {
    return WafAction(
      type: (json['Type'] as String).toWafActionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'Type': type.toValue(),
    };
  }
}

enum WafActionType {
  block,
  allow,
  count,
}

extension WafActionTypeValueExtension on WafActionType {
  String toValue() {
    switch (this) {
      case WafActionType.block:
        return 'BLOCK';
      case WafActionType.allow:
        return 'ALLOW';
      case WafActionType.count:
        return 'COUNT';
    }
  }
}

extension WafActionTypeFromString on String {
  WafActionType toWafActionType() {
    switch (this) {
      case 'BLOCK':
        return WafActionType.block;
      case 'ALLOW':
        return WafActionType.allow;
      case 'COUNT':
        return WafActionType.count;
    }
    throw Exception('$this is not known in enum WafActionType');
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// The action to take if any rule within the <code>RuleGroup</code> matches a
/// request.
class WafOverrideAction {
  /// <code>COUNT</code> overrides the action specified by the individual rule
  /// within a <code>RuleGroup</code> . If set to <code>NONE</code>, the rule's
  /// action will take place.
  final WafOverrideActionType type;

  WafOverrideAction({
    required this.type,
  });

  factory WafOverrideAction.fromJson(Map<String, dynamic> json) {
    return WafOverrideAction(
      type: (json['Type'] as String).toWafOverrideActionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'Type': type.toValue(),
    };
  }
}

enum WafOverrideActionType {
  none,
  count,
}

extension WafOverrideActionTypeValueExtension on WafOverrideActionType {
  String toValue() {
    switch (this) {
      case WafOverrideActionType.none:
        return 'NONE';
      case WafOverrideActionType.count:
        return 'COUNT';
    }
  }
}

extension WafOverrideActionTypeFromString on String {
  WafOverrideActionType toWafOverrideActionType() {
    switch (this) {
      case 'NONE':
        return WafOverrideActionType.none;
      case 'COUNT':
        return WafOverrideActionType.count;
    }
    throw Exception('$this is not known in enum WafOverrideActionType');
  }
}

enum WafRuleType {
  regular,
  rateBased,
  group,
}

extension WafRuleTypeValueExtension on WafRuleType {
  String toValue() {
    switch (this) {
      case WafRuleType.regular:
        return 'REGULAR';
      case WafRuleType.rateBased:
        return 'RATE_BASED';
      case WafRuleType.group:
        return 'GROUP';
    }
  }
}

extension WafRuleTypeFromString on String {
  WafRuleType toWafRuleType() {
    switch (this) {
      case 'REGULAR':
        return WafRuleType.regular;
      case 'RATE_BASED':
        return WafRuleType.rateBased;
      case 'GROUP':
        return WafRuleType.group;
    }
    throw Exception('$this is not known in enum WafRuleType');
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Contains the <code>Rules</code> that identify the requests that you want to
/// allow, block, or count. In a <code>WebACL</code>, you also specify a default
/// action (<code>ALLOW</code> or <code>BLOCK</code>), and the action for each
/// <code>Rule</code> that you add to a <code>WebACL</code>, for example, block
/// requests from specified IP addresses or block requests from specified
/// referrers. You also associate the <code>WebACL</code> with a CloudFront
/// distribution to identify the requests that you want AWS WAF to filter. If
/// you add more than one <code>Rule</code> to a <code>WebACL</code>, a request
/// needs to match only one of the specifications to be allowed, blocked, or
/// counted. For more information, see <a>UpdateWebACL</a>.
class WebACL {
  /// The action to perform if none of the <code>Rules</code> contained in the
  /// <code>WebACL</code> match. The action is specified by the <a>WafAction</a>
  /// object.
  final WafAction defaultAction;

  /// An array that contains the action for each <code>Rule</code> in a
  /// <code>WebACL</code>, the priority of the <code>Rule</code>, and the ID of
  /// the <code>Rule</code>.
  final List<ActivatedRule> rules;

  /// A unique identifier for a <code>WebACL</code>. You use <code>WebACLId</code>
  /// to get information about a <code>WebACL</code> (see <a>GetWebACL</a>),
  /// update a <code>WebACL</code> (see <a>UpdateWebACL</a>), and delete a
  /// <code>WebACL</code> from AWS WAF (see <a>DeleteWebACL</a>).
  ///
  /// <code>WebACLId</code> is returned by <a>CreateWebACL</a> and by
  /// <a>ListWebACLs</a>.
  final String webACLId;

  /// A friendly name or description for the metrics for this <code>WebACL</code>.
  /// The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with
  /// maximum length 128 and minimum length one. It can't contain whitespace or
  /// metric names reserved for AWS WAF, including "All" and "Default_Action." You
  /// can't change <code>MetricName</code> after you create the
  /// <code>WebACL</code>.
  final String? metricName;

  /// A friendly name or description of the <code>WebACL</code>. You can't change
  /// the name of a <code>WebACL</code> after you create it.
  final String? name;

  /// Tha Amazon Resource Name (ARN) of the web ACL.
  final String? webACLArn;

  WebACL({
    required this.defaultAction,
    required this.rules,
    required this.webACLId,
    this.metricName,
    this.name,
    this.webACLArn,
  });

  factory WebACL.fromJson(Map<String, dynamic> json) {
    return WebACL(
      defaultAction:
          WafAction.fromJson(json['DefaultAction'] as Map<String, dynamic>),
      rules: (json['Rules'] as List)
          .whereNotNull()
          .map((e) => ActivatedRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      webACLId: json['WebACLId'] as String,
      metricName: json['MetricName'] as String?,
      name: json['Name'] as String?,
      webACLArn: json['WebACLArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultAction = this.defaultAction;
    final rules = this.rules;
    final webACLId = this.webACLId;
    final metricName = this.metricName;
    final name = this.name;
    final webACLArn = this.webACLArn;
    return {
      'DefaultAction': defaultAction,
      'Rules': rules,
      'WebACLId': webACLId,
      if (metricName != null) 'MetricName': metricName,
      if (name != null) 'Name': name,
      if (webACLArn != null) 'WebACLArn': webACLArn,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Contains the identifier and the name or description of the <a>WebACL</a>.
class WebACLSummary {
  /// A friendly name or description of the <a>WebACL</a>. You can't change the
  /// name of a <code>WebACL</code> after you create it.
  final String name;

  /// A unique identifier for a <code>WebACL</code>. You use <code>WebACLId</code>
  /// to get information about a <code>WebACL</code> (see <a>GetWebACL</a>),
  /// update a <code>WebACL</code> (see <a>UpdateWebACL</a>), and delete a
  /// <code>WebACL</code> from AWS WAF (see <a>DeleteWebACL</a>).
  ///
  /// <code>WebACLId</code> is returned by <a>CreateWebACL</a> and by
  /// <a>ListWebACLs</a>.
  final String webACLId;

  WebACLSummary({
    required this.name,
    required this.webACLId,
  });

  factory WebACLSummary.fromJson(Map<String, dynamic> json) {
    return WebACLSummary(
      name: json['Name'] as String,
      webACLId: json['WebACLId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final webACLId = this.webACLId;
    return {
      'Name': name,
      'WebACLId': webACLId,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Specifies whether to insert a <code>Rule</code> into or delete a
/// <code>Rule</code> from a <code>WebACL</code>.
class WebACLUpdate {
  /// Specifies whether to insert a <code>Rule</code> into or delete a
  /// <code>Rule</code> from a <code>WebACL</code>.
  final ChangeAction action;

  /// The <code>ActivatedRule</code> object in an <a>UpdateWebACL</a> request
  /// specifies a <code>Rule</code> that you want to insert or delete, the
  /// priority of the <code>Rule</code> in the <code>WebACL</code>, and the action
  /// that you want AWS WAF to take when a web request matches the
  /// <code>Rule</code> (<code>ALLOW</code>, <code>BLOCK</code>, or
  /// <code>COUNT</code>).
  final ActivatedRule activatedRule;

  WebACLUpdate({
    required this.action,
    required this.activatedRule,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final activatedRule = this.activatedRule;
    return {
      'Action': action.toValue(),
      'ActivatedRule': activatedRule,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// A complex type that contains <code>XssMatchTuple</code> objects, which
/// specify the parts of web requests that you want AWS WAF to inspect for
/// cross-site scripting attacks and, if you want AWS WAF to inspect a header,
/// the name of the header. If a <code>XssMatchSet</code> contains more than one
/// <code>XssMatchTuple</code> object, a request needs to include cross-site
/// scripting attacks in only one of the specified parts of the request to be
/// considered a match.
class XssMatchSet {
  /// A unique identifier for an <code>XssMatchSet</code>. You use
  /// <code>XssMatchSetId</code> to get information about an
  /// <code>XssMatchSet</code> (see <a>GetXssMatchSet</a>), update an
  /// <code>XssMatchSet</code> (see <a>UpdateXssMatchSet</a>), insert an
  /// <code>XssMatchSet</code> into a <code>Rule</code> or delete one from a
  /// <code>Rule</code> (see <a>UpdateRule</a>), and delete an
  /// <code>XssMatchSet</code> from AWS WAF (see <a>DeleteXssMatchSet</a>).
  ///
  /// <code>XssMatchSetId</code> is returned by <a>CreateXssMatchSet</a> and by
  /// <a>ListXssMatchSets</a>.
  final String xssMatchSetId;

  /// Specifies the parts of web requests that you want to inspect for cross-site
  /// scripting attacks.
  final List<XssMatchTuple> xssMatchTuples;

  /// The name, if any, of the <code>XssMatchSet</code>.
  final String? name;

  XssMatchSet({
    required this.xssMatchSetId,
    required this.xssMatchTuples,
    this.name,
  });

  factory XssMatchSet.fromJson(Map<String, dynamic> json) {
    return XssMatchSet(
      xssMatchSetId: json['XssMatchSetId'] as String,
      xssMatchTuples: (json['XssMatchTuples'] as List)
          .whereNotNull()
          .map((e) => XssMatchTuple.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final xssMatchSetId = this.xssMatchSetId;
    final xssMatchTuples = this.xssMatchTuples;
    final name = this.name;
    return {
      'XssMatchSetId': xssMatchSetId,
      'XssMatchTuples': xssMatchTuples,
      if (name != null) 'Name': name,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// The <code>Id</code> and <code>Name</code> of an <code>XssMatchSet</code>.
class XssMatchSetSummary {
  /// The name of the <code>XssMatchSet</code>, if any, specified by
  /// <code>Id</code>.
  final String name;

  /// A unique identifier for an <code>XssMatchSet</code>. You use
  /// <code>XssMatchSetId</code> to get information about a
  /// <code>XssMatchSet</code> (see <a>GetXssMatchSet</a>), update an
  /// <code>XssMatchSet</code> (see <a>UpdateXssMatchSet</a>), insert an
  /// <code>XssMatchSet</code> into a <code>Rule</code> or delete one from a
  /// <code>Rule</code> (see <a>UpdateRule</a>), and delete an
  /// <code>XssMatchSet</code> from AWS WAF (see <a>DeleteXssMatchSet</a>).
  ///
  /// <code>XssMatchSetId</code> is returned by <a>CreateXssMatchSet</a> and by
  /// <a>ListXssMatchSets</a>.
  final String xssMatchSetId;

  XssMatchSetSummary({
    required this.name,
    required this.xssMatchSetId,
  });

  factory XssMatchSetSummary.fromJson(Map<String, dynamic> json) {
    return XssMatchSetSummary(
      name: json['Name'] as String,
      xssMatchSetId: json['XssMatchSetId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final xssMatchSetId = this.xssMatchSetId;
    return {
      'Name': name,
      'XssMatchSetId': xssMatchSetId,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Specifies the part of a web request that you want to inspect for cross-site
/// scripting attacks and indicates whether you want to add the specification to
/// an <a>XssMatchSet</a> or delete it from an <code>XssMatchSet</code>.
class XssMatchSetUpdate {
  /// Specify <code>INSERT</code> to add an <a>XssMatchSetUpdate</a> to an
  /// <a>XssMatchSet</a>. Use <code>DELETE</code> to remove an
  /// <code>XssMatchSetUpdate</code> from an <code>XssMatchSet</code>.
  final ChangeAction action;

  /// Specifies the part of a web request that you want AWS WAF to inspect for
  /// cross-site scripting attacks and, if you want AWS WAF to inspect a header,
  /// the name of the header.
  final XssMatchTuple xssMatchTuple;

  XssMatchSetUpdate({
    required this.action,
    required this.xssMatchTuple,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final xssMatchTuple = this.xssMatchTuple;
    return {
      'Action': action.toValue(),
      'XssMatchTuple': xssMatchTuple,
    };
  }
}

/// <note>
/// This is <b>AWS WAF Classic</b> documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS
/// WAF Classic</a> in the developer guide.
///
/// <b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the
/// <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS
/// WAF Developer Guide</a>. With the latest version, AWS WAF has a single set
/// of endpoints for regional and global use.
/// </note>
/// Specifies the part of a web request that you want AWS WAF to inspect for
/// cross-site scripting attacks and, if you want AWS WAF to inspect a header,
/// the name of the header.
class XssMatchTuple {
  /// Specifies where in a web request to look for cross-site scripting attacks.
  final FieldToMatch fieldToMatch;

  /// Text transformations eliminate some of the unusual formatting that attackers
  /// use in web requests in an effort to bypass AWS WAF. If you specify a
  /// transformation, AWS WAF performs the transformation on
  /// <code>FieldToMatch</code> before inspecting it for a match.
  ///
  /// You can only specify a single type of TextTransformation.
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
  /// Specify <code>NONE</code> if you don't want to perform any text
  /// transformations.
  final TextTransformation textTransformation;

  XssMatchTuple({
    required this.fieldToMatch,
    required this.textTransformation,
  });

  factory XssMatchTuple.fromJson(Map<String, dynamic> json) {
    return XssMatchTuple(
      fieldToMatch:
          FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
      textTransformation:
          (json['TextTransformation'] as String).toTextTransformation(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldToMatch = this.fieldToMatch;
    final textTransformation = this.textTransformation;
    return {
      'FieldToMatch': fieldToMatch,
      'TextTransformation': textTransformation.toValue(),
    };
  }
}

class WAFBadRequestException extends _s.GenericAwsException {
  WAFBadRequestException({String? type, String? message})
      : super(type: type, code: 'WAFBadRequestException', message: message);
}

class WAFDisallowedNameException extends _s.GenericAwsException {
  WAFDisallowedNameException({String? type, String? message})
      : super(type: type, code: 'WAFDisallowedNameException', message: message);
}

class WAFEntityMigrationException extends _s.GenericAwsException {
  WAFEntityMigrationException({String? type, String? message})
      : super(
            type: type, code: 'WAFEntityMigrationException', message: message);
}

class WAFInternalErrorException extends _s.GenericAwsException {
  WAFInternalErrorException({String? type, String? message})
      : super(type: type, code: 'WAFInternalErrorException', message: message);
}

class WAFInvalidAccountException extends _s.GenericAwsException {
  WAFInvalidAccountException({String? type, String? message})
      : super(type: type, code: 'WAFInvalidAccountException', message: message);
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

class WAFInvalidRegexPatternException extends _s.GenericAwsException {
  WAFInvalidRegexPatternException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFInvalidRegexPatternException',
            message: message);
}

class WAFLimitsExceededException extends _s.GenericAwsException {
  WAFLimitsExceededException({String? type, String? message})
      : super(type: type, code: 'WAFLimitsExceededException', message: message);
}

class WAFNonEmptyEntityException extends _s.GenericAwsException {
  WAFNonEmptyEntityException({String? type, String? message})
      : super(type: type, code: 'WAFNonEmptyEntityException', message: message);
}

class WAFNonexistentContainerException extends _s.GenericAwsException {
  WAFNonexistentContainerException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFNonexistentContainerException',
            message: message);
}

class WAFNonexistentItemException extends _s.GenericAwsException {
  WAFNonexistentItemException({String? type, String? message})
      : super(
            type: type, code: 'WAFNonexistentItemException', message: message);
}

class WAFReferencedItemException extends _s.GenericAwsException {
  WAFReferencedItemException({String? type, String? message})
      : super(type: type, code: 'WAFReferencedItemException', message: message);
}

class WAFServiceLinkedRoleErrorException extends _s.GenericAwsException {
  WAFServiceLinkedRoleErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'WAFServiceLinkedRoleErrorException',
            message: message);
}

class WAFStaleDataException extends _s.GenericAwsException {
  WAFStaleDataException({String? type, String? message})
      : super(type: type, code: 'WAFStaleDataException', message: message);
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

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'WAFBadRequestException': (type, message) =>
      WAFBadRequestException(type: type, message: message),
  'WAFDisallowedNameException': (type, message) =>
      WAFDisallowedNameException(type: type, message: message),
  'WAFEntityMigrationException': (type, message) =>
      WAFEntityMigrationException(type: type, message: message),
  'WAFInternalErrorException': (type, message) =>
      WAFInternalErrorException(type: type, message: message),
  'WAFInvalidAccountException': (type, message) =>
      WAFInvalidAccountException(type: type, message: message),
  'WAFInvalidOperationException': (type, message) =>
      WAFInvalidOperationException(type: type, message: message),
  'WAFInvalidParameterException': (type, message) =>
      WAFInvalidParameterException(type: type, message: message),
  'WAFInvalidPermissionPolicyException': (type, message) =>
      WAFInvalidPermissionPolicyException(type: type, message: message),
  'WAFInvalidRegexPatternException': (type, message) =>
      WAFInvalidRegexPatternException(type: type, message: message),
  'WAFLimitsExceededException': (type, message) =>
      WAFLimitsExceededException(type: type, message: message),
  'WAFNonEmptyEntityException': (type, message) =>
      WAFNonEmptyEntityException(type: type, message: message),
  'WAFNonexistentContainerException': (type, message) =>
      WAFNonexistentContainerException(type: type, message: message),
  'WAFNonexistentItemException': (type, message) =>
      WAFNonexistentItemException(type: type, message: message),
  'WAFReferencedItemException': (type, message) =>
      WAFReferencedItemException(type: type, message: message),
  'WAFServiceLinkedRoleErrorException': (type, message) =>
      WAFServiceLinkedRoleErrorException(type: type, message: message),
  'WAFStaleDataException': (type, message) =>
      WAFStaleDataException(type: type, message: message),
  'WAFSubscriptionNotFoundException': (type, message) =>
      WAFSubscriptionNotFoundException(type: type, message: message),
  'WAFTagOperationException': (type, message) =>
      WAFTagOperationException(type: type, message: message),
  'WAFTagOperationInternalErrorException': (type, message) =>
      WAFTagOperationInternalErrorException(type: type, message: message),
};
