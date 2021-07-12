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

/// The AWS Health API provides programmatic access to the AWS Health
/// information that appears in the <a
/// href="https://phd.aws.amazon.com/phd/home#/">AWS Personal Health
/// Dashboard</a>. You can use the API operations to get information about AWS
/// Health events that affect your AWS services and resources.
/// <note>
/// <ul>
/// <li>
/// You must have a Business or Enterprise Support plan from <a
/// href="http://aws.amazon.com/premiumsupport/">AWS Support</a> to use the AWS
/// Health API. If you call the AWS Health API from an AWS account that doesn't
/// have a Business or Enterprise Support plan, you receive a
/// <code>SubscriptionRequiredException</code> error.
/// </li>
/// <li>
/// You can use the AWS Health endpoint health.us-east-1.amazonaws.com (HTTPS)
/// to call the AWS Health API operations. AWS Health supports a multi-Region
/// application architecture and has two regional endpoints in an active-passive
/// configuration. You can use the high availability endpoint example to
/// determine which AWS Region is active, so that you can get the latest
/// information from the API. For more information, see <a
/// href="https://docs.aws.amazon.com/health/latest/ug/health-api.html">Accessing
/// the AWS Health API</a> in the <i>AWS Health User Guide</i>.
/// </li>
/// </ul> </note>
/// For authentication of requests, AWS Health uses the <a
/// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
/// Version 4 Signing Process</a>.
class Health {
  final _s.JsonProtocol _protocol;
  Health({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'health',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Returns a list of accounts in the organization from AWS Organizations that
  /// are affected by the provided event. For more information about the
  /// different types of AWS Health events, see <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html">Event</a>.
  ///
  /// Before you can call this operation, you must first enable AWS Health to
  /// work with AWS Organizations. To do this, call the <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_EnableHealthServiceAccessForOrganization.html">EnableHealthServiceAccessForOrganization</a>
  /// operation from your organization's management account.
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the next request to return more results.
  /// </note>
  ///
  /// May throw [InvalidPaginationToken].
  ///
  /// Parameter [eventArn] :
  /// The unique identifier for the event. The event ARN has the
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code> format.
  ///
  /// For example, an event ARN might look like the following:
  ///
  /// <code>arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in one batch, between 10 and 100,
  /// inclusive.
  ///
  /// Parameter [nextToken] :
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search
  /// request and include the returned token. When all results have been
  /// returned, the response does not contain a pagination token value.
  Future<DescribeAffectedAccountsForOrganizationResponse>
      describeAffectedAccountsForOrganization({
    required String eventArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(eventArn, 'eventArn');
    _s.validateStringLength(
      'eventArn',
      eventArn,
      0,
      1600,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSHealth_20160804.DescribeAffectedAccountsForOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'eventArn': eventArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeAffectedAccountsForOrganizationResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns a list of entities that have been affected by the specified
  /// events, based on the specified filter criteria. Entities can refer to
  /// individual customer resources, groups of customer resources, or any other
  /// construct, depending on the AWS service. Events that have impact beyond
  /// that of the affected entities, or where the extent of impact is unknown,
  /// include at least one entity indicating this.
  ///
  /// At least one event ARN is required. Results are sorted by the
  /// <code>lastUpdatedTime</code> of the entity, starting with the most recent.
  /// <note>
  /// <ul>
  /// <li>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the next request to return more results.
  /// </li>
  /// <li>
  /// This operation supports resource-level permissions. You can use this
  /// operation to allow or deny access to specific AWS Health events. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/health/latest/ug/security_iam_id-based-policy-examples.html#resource-action-based-conditions">Resource-
  /// and action-based conditions</a> in the <i>AWS Health User Guide</i>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InvalidPaginationToken].
  /// May throw [UnsupportedLocale].
  ///
  /// Parameter [filter] :
  /// Values to narrow the results returned. At least one event ARN is required.
  ///
  /// Parameter [locale] :
  /// The locale (language) to return information in. English (en) is the
  /// default and the only supported value at this time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in one batch, between 10 and 100,
  /// inclusive.
  ///
  /// Parameter [nextToken] :
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search
  /// request and include the returned token. When all results have been
  /// returned, the response does not contain a pagination token value.
  Future<DescribeAffectedEntitiesResponse> describeAffectedEntities({
    required EntityFilter filter,
    String? locale,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(filter, 'filter');
    _s.validateStringLength(
      'locale',
      locale,
      2,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHealth_20160804.DescribeAffectedEntities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'filter': filter,
        if (locale != null) 'locale': locale,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeAffectedEntitiesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of entities that have been affected by one or more events
  /// for one or more accounts in your organization in AWS Organizations, based
  /// on the filter criteria. Entities can refer to individual customer
  /// resources, groups of customer resources, or any other construct, depending
  /// on the AWS service.
  ///
  /// At least one event Amazon Resource Name (ARN) and account ID are required.
  /// Results are sorted by the <code>lastUpdatedTime</code> of the entity,
  /// starting with the most recent.
  ///
  /// Before you can call this operation, you must first enable AWS Health to
  /// work with AWS Organizations. To do this, call the <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_EnableHealthServiceAccessForOrganization.html">EnableHealthServiceAccessForOrganization</a>
  /// operation from your organization's management account.
  /// <note>
  /// <ul>
  /// <li>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the next request to return more results.
  /// </li>
  /// <li>
  /// This operation doesn't support resource-level permissions. You can't use
  /// this operation to allow or deny access to specific AWS Health events. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/health/latest/ug/security_iam_id-based-policy-examples.html#resource-action-based-conditions">Resource-
  /// and action-based conditions</a> in the <i>AWS Health User Guide</i>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InvalidPaginationToken].
  /// May throw [UnsupportedLocale].
  ///
  /// Parameter [organizationEntityFilters] :
  /// A JSON set of elements including the <code>awsAccountId</code> and the
  /// <code>eventArn</code>.
  ///
  /// Parameter [locale] :
  /// The locale (language) to return information in. English (en) is the
  /// default and the only supported value at this time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in one batch, between 10 and 100,
  /// inclusive.
  ///
  /// Parameter [nextToken] :
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search
  /// request and include the returned token. When all results have been
  /// returned, the response does not contain a pagination token value.
  Future<DescribeAffectedEntitiesForOrganizationResponse>
      describeAffectedEntitiesForOrganization({
    required List<EventAccountFilter> organizationEntityFilters,
    String? locale,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(
        organizationEntityFilters, 'organizationEntityFilters');
    _s.validateStringLength(
      'locale',
      locale,
      2,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSHealth_20160804.DescribeAffectedEntitiesForOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'organizationEntityFilters': organizationEntityFilters,
        if (locale != null) 'locale': locale,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeAffectedEntitiesForOrganizationResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the number of entities that are affected by each of the specified
  /// events. If no events are specified, the counts of all affected entities
  /// are returned.
  ///
  /// Parameter [eventArns] :
  /// A list of event ARNs (unique identifiers). For example:
  /// <code>"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
  /// "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"</code>
  Future<DescribeEntityAggregatesResponse> describeEntityAggregates({
    List<String>? eventArns,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHealth_20160804.DescribeEntityAggregates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (eventArns != null) 'eventArns': eventArns,
      },
    );

    return DescribeEntityAggregatesResponse.fromJson(jsonResponse.body);
  }

  /// Returns the number of events of each event type (issue, scheduled change,
  /// and account notification). If no filter is specified, the counts of all
  /// events in each category are returned.
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the next request to return more results.
  /// </note>
  ///
  /// May throw [InvalidPaginationToken].
  ///
  /// Parameter [aggregateField] :
  /// The only currently supported value is <code>eventTypeCategory</code>.
  ///
  /// Parameter [filter] :
  /// Values to narrow the results returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in one batch, between 10 and 100,
  /// inclusive.
  ///
  /// Parameter [nextToken] :
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search
  /// request and include the returned token. When all results have been
  /// returned, the response does not contain a pagination token value.
  Future<DescribeEventAggregatesResponse> describeEventAggregates({
    required EventAggregateField aggregateField,
    EventFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(aggregateField, 'aggregateField');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHealth_20160804.DescribeEventAggregates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'aggregateField': aggregateField.toValue(),
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeEventAggregatesResponse.fromJson(jsonResponse.body);
  }

  /// Returns detailed information about one or more specified events.
  /// Information includes standard event data (AWS Region, service, and so on,
  /// as returned by <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEvents.html">DescribeEvents</a>),
  /// a detailed event description, and possible additional metadata that
  /// depends upon the nature of the event. Affected entities are not included.
  /// To retrieve the entities, use the <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntities.html">DescribeAffectedEntities</a>
  /// operation.
  ///
  /// If a specified event can't be retrieved, an error message is returned for
  /// that event.
  /// <note>
  /// This operation supports resource-level permissions. You can use this
  /// operation to allow or deny access to specific AWS Health events. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/health/latest/ug/security_iam_id-based-policy-examples.html#resource-action-based-conditions">Resource-
  /// and action-based conditions</a> in the <i>AWS Health User Guide</i>.
  /// </note>
  ///
  /// May throw [UnsupportedLocale].
  ///
  /// Parameter [eventArns] :
  /// A list of event ARNs (unique identifiers). For example:
  /// <code>"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
  /// "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"</code>
  ///
  /// Parameter [locale] :
  /// The locale (language) to return information in. English (en) is the
  /// default and the only supported value at this time.
  Future<DescribeEventDetailsResponse> describeEventDetails({
    required List<String> eventArns,
    String? locale,
  }) async {
    ArgumentError.checkNotNull(eventArns, 'eventArns');
    _s.validateStringLength(
      'locale',
      locale,
      2,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHealth_20160804.DescribeEventDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'eventArns': eventArns,
        if (locale != null) 'locale': locale,
      },
    );

    return DescribeEventDetailsResponse.fromJson(jsonResponse.body);
  }

  /// Returns detailed information about one or more specified events for one or
  /// more AWS accounts in your organization. This information includes standard
  /// event data (such as the AWS Region and service), an event description, and
  /// (depending on the event) possible metadata. This operation doesn't return
  /// affected entities, such as the resources related to the event. To return
  /// affected entities, use the <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntitiesForOrganization.html">DescribeAffectedEntitiesForOrganization</a>
  /// operation.
  /// <note>
  /// Before you can call this operation, you must first enable AWS Health to
  /// work with AWS Organizations. To do this, call the <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_EnableHealthServiceAccessForOrganization.html">EnableHealthServiceAccessForOrganization</a>
  /// operation from your organization's management account.
  /// </note>
  /// When you call the <code>DescribeEventDetailsForOrganization</code>
  /// operation, specify the <code>organizationEventDetailFilters</code> object
  /// in the request. Depending on the AWS Health event type, note the following
  /// differences:
  ///
  /// <ul>
  /// <li>
  /// To return event details for a public event, you must specify a null value
  /// for the <code>awsAccountId</code> parameter. If you specify an account ID
  /// for a public event, AWS Health returns an error message because public
  /// events aren't specific to an account.
  /// </li>
  /// <li>
  /// To return event details for an event that is specific to an account in
  /// your organization, you must specify the <code>awsAccountId</code>
  /// parameter in the request. If you don't specify an account ID, AWS Health
  /// returns an error message because the event is specific to an account in
  /// your organization.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html">Event</a>.
  /// <note>
  /// This operation doesn't support resource-level permissions. You can't use
  /// this operation to allow or deny access to specific AWS Health events. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/health/latest/ug/security_iam_id-based-policy-examples.html#resource-action-based-conditions">Resource-
  /// and action-based conditions</a> in the <i>AWS Health User Guide</i>.
  /// </note>
  ///
  /// May throw [UnsupportedLocale].
  ///
  /// Parameter [organizationEventDetailFilters] :
  /// A set of JSON elements that includes the <code>awsAccountId</code> and the
  /// <code>eventArn</code>.
  ///
  /// Parameter [locale] :
  /// The locale (language) to return information in. English (en) is the
  /// default and the only supported value at this time.
  Future<DescribeEventDetailsForOrganizationResponse>
      describeEventDetailsForOrganization({
    required List<EventAccountFilter> organizationEventDetailFilters,
    String? locale,
  }) async {
    ArgumentError.checkNotNull(
        organizationEventDetailFilters, 'organizationEventDetailFilters');
    _s.validateStringLength(
      'locale',
      locale,
      2,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHealth_20160804.DescribeEventDetailsForOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'organizationEventDetailFilters': organizationEventDetailFilters,
        if (locale != null) 'locale': locale,
      },
    );

    return DescribeEventDetailsForOrganizationResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the event types that meet the specified filter criteria. You can
  /// use this API operation to find information about the AWS Health event,
  /// such as the category, AWS service, and event code. The metadata for each
  /// event appears in the <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_EventType.html">EventType</a>
  /// object.
  ///
  /// If you don't specify a filter criteria, the API operation returns all
  /// event types, in no particular order.
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the next request to return more results.
  /// </note>
  ///
  /// May throw [InvalidPaginationToken].
  /// May throw [UnsupportedLocale].
  ///
  /// Parameter [filter] :
  /// Values to narrow the results returned.
  ///
  /// Parameter [locale] :
  /// The locale (language) to return information in. English (en) is the
  /// default and the only supported value at this time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in one batch, between 10 and 100,
  /// inclusive.
  ///
  /// Parameter [nextToken] :
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search
  /// request and include the returned token. When all results have been
  /// returned, the response does not contain a pagination token value.
  Future<DescribeEventTypesResponse> describeEventTypes({
    EventTypeFilter? filter,
    String? locale,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'locale',
      locale,
      2,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHealth_20160804.DescribeEventTypes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'filter': filter,
        if (locale != null) 'locale': locale,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeEventTypesResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about events that meet the specified filter criteria.
  /// Events are returned in a summary form and do not include the detailed
  /// description, any additional metadata that depends on the event type, or
  /// any affected resources. To retrieve that information, use the <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetails.html">DescribeEventDetails</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntities.html">DescribeAffectedEntities</a>
  /// operations.
  ///
  /// If no filter criteria are specified, all events are returned. Results are
  /// sorted by <code>lastModifiedTime</code>, starting with the most recent
  /// event.
  /// <note>
  /// <ul>
  /// <li>
  /// When you call the <code>DescribeEvents</code> operation and specify an
  /// entity for the <code>entityValues</code> parameter, AWS Health might
  /// return public events that aren't specific to that resource. For example,
  /// if you call <code>DescribeEvents</code> and specify an ID for an Amazon
  /// Elastic Compute Cloud (Amazon EC2) instance, AWS Health might return
  /// events that aren't specific to that resource or service. To get events
  /// that are specific to a service, use the <code>services</code> parameter in
  /// the <code>filter</code> object. For more information, see <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html">Event</a>.
  /// </li>
  /// <li>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the next request to return more results.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InvalidPaginationToken].
  /// May throw [UnsupportedLocale].
  ///
  /// Parameter [filter] :
  /// Values to narrow the results returned.
  ///
  /// Parameter [locale] :
  /// The locale (language) to return information in. English (en) is the
  /// default and the only supported value at this time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in one batch, between 10 and 100,
  /// inclusive.
  ///
  /// Parameter [nextToken] :
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search
  /// request and include the returned token. When all results have been
  /// returned, the response does not contain a pagination token value.
  Future<DescribeEventsResponse> describeEvents({
    EventFilter? filter,
    String? locale,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'locale',
      locale,
      2,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHealth_20160804.DescribeEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'filter': filter,
        if (locale != null) 'locale': locale,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeEventsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about events across your organization in AWS
  /// Organizations. You can use the<code>filters</code> parameter to specify
  /// the events that you want to return. Events are returned in a summary form
  /// and don't include the affected accounts, detailed description, any
  /// additional metadata that depends on the event type, or any affected
  /// resources. To retrieve that information, use the following operations:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedAccountsForOrganization.html">DescribeAffectedAccountsForOrganization</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetailsForOrganization.html">DescribeEventDetailsForOrganization</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntitiesForOrganization.html">DescribeAffectedEntitiesForOrganization</a>
  /// </li>
  /// </ul>
  /// If you don't specify a <code>filter</code>, the
  /// <code>DescribeEventsForOrganizations</code> returns all events across your
  /// organization. Results are sorted by <code>lastModifiedTime</code>,
  /// starting with the most recent event.
  ///
  /// For more information about the different types of AWS Health events, see
  /// <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html">Event</a>.
  ///
  /// Before you can call this operation, you must first enable AWS Health to
  /// work with AWS Organizations. To do this, call the <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_EnableHealthServiceAccessForOrganization.html">EnableHealthServiceAccessForOrganization</a>
  /// operation from your organization's management account.
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the next request to return more results.
  /// </note>
  ///
  /// May throw [InvalidPaginationToken].
  /// May throw [UnsupportedLocale].
  ///
  /// Parameter [filter] :
  /// Values to narrow the results returned.
  ///
  /// Parameter [locale] :
  /// The locale (language) to return information in. English (en) is the
  /// default and the only supported value at this time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in one batch, between 10 and 100,
  /// inclusive.
  ///
  /// Parameter [nextToken] :
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search
  /// request and include the returned token. When all results have been
  /// returned, the response does not contain a pagination token value.
  Future<DescribeEventsForOrganizationResponse> describeEventsForOrganization({
    OrganizationEventFilter? filter,
    String? locale,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'locale',
      locale,
      2,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHealth_20160804.DescribeEventsForOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'filter': filter,
        if (locale != null) 'locale': locale,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeEventsForOrganizationResponse.fromJson(jsonResponse.body);
  }

  /// This operation provides status information on enabling or disabling AWS
  /// Health to work with your organization. To call this operation, you must
  /// sign in as an IAM user, assume an IAM role, or sign in as the root user
  /// (not recommended) in the organization's management account.
  Future<DescribeHealthServiceStatusForOrganizationResponse>
      describeHealthServiceStatusForOrganization() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSHealth_20160804.DescribeHealthServiceStatusForOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeHealthServiceStatusForOrganizationResponse.fromJson(
        jsonResponse.body);
  }

  /// Disables AWS Health from working with AWS Organizations. To call this
  /// operation, you must sign in as an AWS Identity and Access Management (IAM)
  /// user, assume an IAM role, or sign in as the root user (not recommended) in
  /// the organization's management account. For more information, see <a
  /// href="https://docs.aws.amazon.com/health/latest/ug/aggregate-events.html">Aggregating
  /// AWS Health events</a> in the <i>AWS Health User Guide</i>.
  ///
  /// This operation doesn't remove the service-linked role from the management
  /// account in your organization. You must use the IAM console, API, or AWS
  /// Command Line Interface (AWS CLI) to remove the service-linked role. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html#delete-service-linked-role">Deleting
  /// a Service-Linked Role</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// You can also disable the organizational feature by using the Organizations
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/APIReference/API_DisableAWSServiceAccess.html">DisableAWSServiceAccess</a>
  /// API operation. After you call this operation, AWS Health stops aggregating
  /// events for all other AWS accounts in your organization. If you call the
  /// AWS Health API operations for organizational view, AWS Health returns an
  /// error. AWS Health continues to aggregate health events for your AWS
  /// account.
  /// </note>
  ///
  /// May throw [ConcurrentModificationException].
  Future<void> disableHealthServiceAccessForOrganization() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSHealth_20160804.DisableHealthServiceAccessForOrganization'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Enables AWS Health to work with AWS Organizations. You can use the
  /// organizational view feature to aggregate events from all AWS accounts in
  /// your organization in a centralized location.
  ///
  /// This operation also creates a service-linked role for the management
  /// account in the organization.
  /// <note>
  /// To call this operation, you must meet the following requirements:
  ///
  /// <ul>
  /// <li>
  /// You must have a Business or Enterprise Support plan from <a
  /// href="http://aws.amazon.com/premiumsupport/">AWS Support</a> to use the
  /// AWS Health API. If you call the AWS Health API from an AWS account that
  /// doesn't have a Business or Enterprise Support plan, you receive a
  /// <code>SubscriptionRequiredException</code> error.
  /// </li>
  /// <li>
  /// You must have permission to call this operation from the organization's
  /// management account. For example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/health/latest/ug/security_iam_id-based-policy-examples.html">AWS
  /// Health identity-based policy examples</a>.
  /// </li>
  /// </ul> </note>
  /// If you don't have the required support plan, you can instead use the AWS
  /// Health console to enable the organizational view feature. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/health/latest/ug/aggregate-events.html">Aggregating
  /// AWS Health events</a> in the <i>AWS Health User Guide</i>.
  ///
  /// May throw [ConcurrentModificationException].
  Future<void> enableHealthServiceAccessForOrganization() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSHealth_20160804.EnableHealthServiceAccessForOrganization'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }
}

/// Information about an entity that is affected by a Health event.
class AffectedEntity {
  /// The 12-digit AWS account number that contains the affected entity.
  final String? awsAccountId;

  /// The unique identifier for the entity. Format:
  /// <code>arn:aws:health:<i>entity-region</i>:<i>aws-account</i>:entity/<i>entity-id</i>
  /// </code>. Example:
  /// <code>arn:aws:health:us-east-1:111222333444:entity/AVh5GGT7ul1arKr1sE1K</code>
  final String? entityArn;

  /// The URL of the affected entity.
  final String? entityUrl;

  /// The ID of the affected entity.
  final String? entityValue;

  /// The unique identifier for the event. The event ARN has the
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code> format.
  ///
  /// For example, an event ARN might look like the following:
  ///
  /// <code>arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  final String? eventArn;

  /// The most recent time that the entity was updated.
  final DateTime? lastUpdatedTime;

  /// The most recent status of the entity affected by the event. The possible
  /// values are <code>IMPAIRED</code>, <code>UNIMPAIRED</code>, and
  /// <code>UNKNOWN</code>.
  final EntityStatusCode? statusCode;

  /// A map of entity tags attached to the affected entity.
  /// <note>
  /// Currently, the <code>tags</code> property isn't supported.
  /// </note>
  final Map<String, String>? tags;

  AffectedEntity({
    this.awsAccountId,
    this.entityArn,
    this.entityUrl,
    this.entityValue,
    this.eventArn,
    this.lastUpdatedTime,
    this.statusCode,
    this.tags,
  });

  factory AffectedEntity.fromJson(Map<String, dynamic> json) {
    return AffectedEntity(
      awsAccountId: json['awsAccountId'] as String?,
      entityArn: json['entityArn'] as String?,
      entityUrl: json['entityUrl'] as String?,
      entityValue: json['entityValue'] as String?,
      eventArn: json['eventArn'] as String?,
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      statusCode: (json['statusCode'] as String?)?.toEntityStatusCode(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final entityArn = this.entityArn;
    final entityUrl = this.entityUrl;
    final entityValue = this.entityValue;
    final eventArn = this.eventArn;
    final lastUpdatedTime = this.lastUpdatedTime;
    final statusCode = this.statusCode;
    final tags = this.tags;
    return {
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (entityArn != null) 'entityArn': entityArn,
      if (entityUrl != null) 'entityUrl': entityUrl,
      if (entityValue != null) 'entityValue': entityValue,
      if (eventArn != null) 'eventArn': eventArn,
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (statusCode != null) 'statusCode': statusCode.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// A range of dates and times that is used by the <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_EventFilter.html">EventFilter</a>
/// and <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_EntityFilter.html">EntityFilter</a>
/// objects. If <code>from</code> is set and <code>to</code> is set: match items
/// where the timestamp (<code>startTime</code>, <code>endTime</code>, or
/// <code>lastUpdatedTime</code>) is between <code>from</code> and
/// <code>to</code> inclusive. If <code>from</code> is set and <code>to</code>
/// is not set: match items where the timestamp value is equal to or after
/// <code>from</code>. If <code>from</code> is not set and <code>to</code> is
/// set: match items where the timestamp value is equal to or before
/// <code>to</code>.
class DateTimeRange {
  /// The starting date and time of a time range.
  final DateTime? from;

  /// The ending date and time of a time range.
  final DateTime? to;

  DateTimeRange({
    this.from,
    this.to,
  });

  factory DateTimeRange.fromJson(Map<String, dynamic> json) {
    return DateTimeRange(
      from: timeStampFromJson(json['from']),
      to: timeStampFromJson(json['to']),
    );
  }

  Map<String, dynamic> toJson() {
    final from = this.from;
    final to = this.to;
    return {
      if (from != null) 'from': unixTimestampToJson(from),
      if (to != null) 'to': unixTimestampToJson(to),
    };
  }
}

class DescribeAffectedAccountsForOrganizationResponse {
  /// A JSON set of elements of the affected accounts.
  final List<String>? affectedAccounts;

  /// This parameter specifies if the AWS Health event is a public AWS service
  /// event or an account-specific event.
  ///
  /// <ul>
  /// <li>
  /// If the <code>eventScopeCode</code> value is <code>PUBLIC</code>, then the
  /// <code>affectedAccounts</code> value is always empty.
  /// </li>
  /// <li>
  /// If the <code>eventScopeCode</code> value is <code>ACCOUNT_SPECIFIC</code>,
  /// then the <code>affectedAccounts</code> value lists the affected AWS accounts
  /// in your organization. For example, if an event affects a service such as
  /// Amazon Elastic Compute Cloud and you have AWS accounts that use that
  /// service, those account IDs appear in the response.
  /// </li>
  /// <li>
  /// If the <code>eventScopeCode</code> value is <code>NONE</code>, then the
  /// <code>eventArn</code> that you specified in the request is invalid or
  /// doesn't exist.
  /// </li>
  /// </ul>
  final EventScopeCode? eventScopeCode;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  final String? nextToken;

  DescribeAffectedAccountsForOrganizationResponse({
    this.affectedAccounts,
    this.eventScopeCode,
    this.nextToken,
  });

  factory DescribeAffectedAccountsForOrganizationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAffectedAccountsForOrganizationResponse(
      affectedAccounts: (json['affectedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      eventScopeCode: (json['eventScopeCode'] as String?)?.toEventScopeCode(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final affectedAccounts = this.affectedAccounts;
    final eventScopeCode = this.eventScopeCode;
    final nextToken = this.nextToken;
    return {
      if (affectedAccounts != null) 'affectedAccounts': affectedAccounts,
      if (eventScopeCode != null) 'eventScopeCode': eventScopeCode.toValue(),
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeAffectedEntitiesForOrganizationResponse {
  /// A JSON set of elements including the <code>awsAccountId</code> and its
  /// <code>entityArn</code>, <code>entityValue</code> and its
  /// <code>entityArn</code>, <code>lastUpdatedTime</code>, and
  /// <code>statusCode</code>.
  final List<AffectedEntity>? entities;

  /// A JSON set of elements of the failed response, including the
  /// <code>awsAccountId</code>, <code>errorMessage</code>,
  /// <code>errorName</code>, and <code>eventArn</code>.
  final List<OrganizationAffectedEntitiesErrorItem>? failedSet;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  final String? nextToken;

  DescribeAffectedEntitiesForOrganizationResponse({
    this.entities,
    this.failedSet,
    this.nextToken,
  });

  factory DescribeAffectedEntitiesForOrganizationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAffectedEntitiesForOrganizationResponse(
      entities: (json['entities'] as List?)
          ?.whereNotNull()
          .map((e) => AffectedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedSet: (json['failedSet'] as List?)
          ?.whereNotNull()
          .map((e) => OrganizationAffectedEntitiesErrorItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final failedSet = this.failedSet;
    final nextToken = this.nextToken;
    return {
      if (entities != null) 'entities': entities,
      if (failedSet != null) 'failedSet': failedSet,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeAffectedEntitiesResponse {
  /// The entities that match the filter criteria.
  final List<AffectedEntity>? entities;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  final String? nextToken;

  DescribeAffectedEntitiesResponse({
    this.entities,
    this.nextToken,
  });

  factory DescribeAffectedEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAffectedEntitiesResponse(
      entities: (json['entities'] as List?)
          ?.whereNotNull()
          .map((e) => AffectedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final nextToken = this.nextToken;
    return {
      if (entities != null) 'entities': entities,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeEntityAggregatesResponse {
  /// The number of entities that are affected by each of the specified events.
  final List<EntityAggregate>? entityAggregates;

  DescribeEntityAggregatesResponse({
    this.entityAggregates,
  });

  factory DescribeEntityAggregatesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEntityAggregatesResponse(
      entityAggregates: (json['entityAggregates'] as List?)
          ?.whereNotNull()
          .map((e) => EntityAggregate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entityAggregates = this.entityAggregates;
    return {
      if (entityAggregates != null) 'entityAggregates': entityAggregates,
    };
  }
}

class DescribeEventAggregatesResponse {
  /// The number of events in each category that meet the optional filter
  /// criteria.
  final List<EventAggregate>? eventAggregates;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  final String? nextToken;

  DescribeEventAggregatesResponse({
    this.eventAggregates,
    this.nextToken,
  });

  factory DescribeEventAggregatesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEventAggregatesResponse(
      eventAggregates: (json['eventAggregates'] as List?)
          ?.whereNotNull()
          .map((e) => EventAggregate.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventAggregates = this.eventAggregates;
    final nextToken = this.nextToken;
    return {
      if (eventAggregates != null) 'eventAggregates': eventAggregates,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeEventDetailsForOrganizationResponse {
  /// Error messages for any events that could not be retrieved.
  final List<OrganizationEventDetailsErrorItem>? failedSet;

  /// Information about the events that could be retrieved.
  final List<OrganizationEventDetails>? successfulSet;

  DescribeEventDetailsForOrganizationResponse({
    this.failedSet,
    this.successfulSet,
  });

  factory DescribeEventDetailsForOrganizationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeEventDetailsForOrganizationResponse(
      failedSet: (json['failedSet'] as List?)
          ?.whereNotNull()
          .map((e) => OrganizationEventDetailsErrorItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      successfulSet: (json['successfulSet'] as List?)
          ?.whereNotNull()
          .map((e) =>
              OrganizationEventDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedSet = this.failedSet;
    final successfulSet = this.successfulSet;
    return {
      if (failedSet != null) 'failedSet': failedSet,
      if (successfulSet != null) 'successfulSet': successfulSet,
    };
  }
}

class DescribeEventDetailsResponse {
  /// Error messages for any events that could not be retrieved.
  final List<EventDetailsErrorItem>? failedSet;

  /// Information about the events that could be retrieved.
  final List<EventDetails>? successfulSet;

  DescribeEventDetailsResponse({
    this.failedSet,
    this.successfulSet,
  });

  factory DescribeEventDetailsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEventDetailsResponse(
      failedSet: (json['failedSet'] as List?)
          ?.whereNotNull()
          .map((e) => EventDetailsErrorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      successfulSet: (json['successfulSet'] as List?)
          ?.whereNotNull()
          .map((e) => EventDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedSet = this.failedSet;
    final successfulSet = this.successfulSet;
    return {
      if (failedSet != null) 'failedSet': failedSet,
      if (successfulSet != null) 'successfulSet': successfulSet,
    };
  }
}

class DescribeEventTypesResponse {
  /// A list of event types that match the filter criteria. Event types have a
  /// category (<code>issue</code>, <code>accountNotification</code>, or
  /// <code>scheduledChange</code>), a service (for example, <code>EC2</code>,
  /// <code>RDS</code>, <code>DATAPIPELINE</code>, <code>BILLING</code>), and a
  /// code (in the format <code>AWS_<i>SERVICE</i>_<i>DESCRIPTION</i> </code>; for
  /// example, <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>).
  final List<EventType>? eventTypes;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  final String? nextToken;

  DescribeEventTypesResponse({
    this.eventTypes,
    this.nextToken,
  });

  factory DescribeEventTypesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEventTypesResponse(
      eventTypes: (json['eventTypes'] as List?)
          ?.whereNotNull()
          .map((e) => EventType.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventTypes = this.eventTypes;
    final nextToken = this.nextToken;
    return {
      if (eventTypes != null) 'eventTypes': eventTypes,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeEventsForOrganizationResponse {
  /// The events that match the specified filter criteria.
  final List<OrganizationEvent>? events;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  final String? nextToken;

  DescribeEventsForOrganizationResponse({
    this.events,
    this.nextToken,
  });

  factory DescribeEventsForOrganizationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeEventsForOrganizationResponse(
      events: (json['events'] as List?)
          ?.whereNotNull()
          .map((e) => OrganizationEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      if (events != null) 'events': events,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeEventsResponse {
  /// The events that match the specified filter criteria.
  final List<Event>? events;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  final String? nextToken;

  DescribeEventsResponse({
    this.events,
    this.nextToken,
  });

  factory DescribeEventsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEventsResponse(
      events: (json['events'] as List?)
          ?.whereNotNull()
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      if (events != null) 'events': events,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeHealthServiceStatusForOrganizationResponse {
  /// Information about the status of enabling or disabling AWS Health
  /// Organizational View in your organization.
  ///
  /// Valid values are <code>ENABLED | DISABLED | PENDING</code>.
  final String? healthServiceAccessStatusForOrganization;

  DescribeHealthServiceStatusForOrganizationResponse({
    this.healthServiceAccessStatusForOrganization,
  });

  factory DescribeHealthServiceStatusForOrganizationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeHealthServiceStatusForOrganizationResponse(
      healthServiceAccessStatusForOrganization:
          json['healthServiceAccessStatusForOrganization'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthServiceAccessStatusForOrganization =
        this.healthServiceAccessStatusForOrganization;
    return {
      if (healthServiceAccessStatusForOrganization != null)
        'healthServiceAccessStatusForOrganization':
            healthServiceAccessStatusForOrganization,
    };
  }
}

/// The number of entities that are affected by one or more events. Returned by
/// the <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEntityAggregates.html">DescribeEntityAggregates</a>
/// operation.
class EntityAggregate {
  /// The number of entities that match the criteria for the specified events.
  final int? count;

  /// The unique identifier for the event. The event ARN has the
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code> format.
  ///
  /// For example, an event ARN might look like the following:
  ///
  /// <code>arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  final String? eventArn;

  EntityAggregate({
    this.count,
    this.eventArn,
  });

  factory EntityAggregate.fromJson(Map<String, dynamic> json) {
    return EntityAggregate(
      count: json['count'] as int?,
      eventArn: json['eventArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final eventArn = this.eventArn;
    return {
      if (count != null) 'count': count,
      if (eventArn != null) 'eventArn': eventArn,
    };
  }
}

/// The values to use to filter results from the <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_EntityFilter.html">EntityFilter</a>
/// operation.
class EntityFilter {
  /// A list of event ARNs (unique identifiers). For example:
  /// <code>"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
  /// "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"</code>
  final List<String> eventArns;

  /// A list of entity ARNs (unique identifiers).
  final List<String>? entityArns;

  /// A list of IDs for affected entities.
  final List<String>? entityValues;

  /// A list of the most recent dates and times that the entity was updated.
  final List<DateTimeRange>? lastUpdatedTimes;

  /// A list of entity status codes (<code>IMPAIRED</code>,
  /// <code>UNIMPAIRED</code>, or <code>UNKNOWN</code>).
  final List<EntityStatusCode>? statusCodes;

  /// A map of entity tags attached to the affected entity.
  /// <note>
  /// Currently, the <code>tags</code> property isn't supported.
  /// </note>
  final List<Map<String, String>>? tags;

  EntityFilter({
    required this.eventArns,
    this.entityArns,
    this.entityValues,
    this.lastUpdatedTimes,
    this.statusCodes,
    this.tags,
  });

  factory EntityFilter.fromJson(Map<String, dynamic> json) {
    return EntityFilter(
      eventArns: (json['eventArns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      entityArns: (json['entityArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      entityValues: (json['entityValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdatedTimes: (json['lastUpdatedTimes'] as List?)
          ?.whereNotNull()
          .map((e) => DateTimeRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCodes: (json['statusCodes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEntityStatusCode())
          .toList(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventArns = this.eventArns;
    final entityArns = this.entityArns;
    final entityValues = this.entityValues;
    final lastUpdatedTimes = this.lastUpdatedTimes;
    final statusCodes = this.statusCodes;
    final tags = this.tags;
    return {
      'eventArns': eventArns,
      if (entityArns != null) 'entityArns': entityArns,
      if (entityValues != null) 'entityValues': entityValues,
      if (lastUpdatedTimes != null) 'lastUpdatedTimes': lastUpdatedTimes,
      if (statusCodes != null)
        'statusCodes': statusCodes.map((e) => e.toValue()).toList(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// Summary information about an AWS Health event.
///
/// AWS Health events can be public or account-specific:
///
/// <ul>
/// <li>
/// <i>Public events</i> might be service events that are not specific to an AWS
/// account. For example, if there is an issue with an AWS Region, AWS Health
/// provides information about the event, even if you don't use services or
/// resources in that Region.
/// </li>
/// <li>
/// <i>Account-specific</i> events are specific to either your AWS account or an
/// account in your organization. For example, if there's an issue with Amazon
/// Elastic Compute Cloud in a Region that you use, AWS Health provides
/// information about the event and the affected resources in the account.
/// </li>
/// </ul>
/// You can determine if an event is public or account-specific by using the
/// <code>eventScopeCode</code> parameter. For more information, see <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html#AWSHealth-Type-Event-eventScopeCode">eventScopeCode</a>.
class Event {
  /// The unique identifier for the event. The event ARN has the
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code> format.
  ///
  /// For example, an event ARN might look like the following:
  ///
  /// <code>arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  final String? arn;

  /// The AWS Availability Zone of the event. For example, us-east-1a.
  final String? availabilityZone;

  /// The date and time that the event ended.
  final DateTime? endTime;

  /// This parameter specifies if the AWS Health event is a public AWS service
  /// event or an account-specific event.
  ///
  /// <ul>
  /// <li>
  /// If the <code>eventScopeCode</code> value is <code>PUBLIC</code>, then the
  /// <code>affectedAccounts</code> value is always empty.
  /// </li>
  /// <li>
  /// If the <code>eventScopeCode</code> value is <code>ACCOUNT_SPECIFIC</code>,
  /// then the <code>affectedAccounts</code> value lists the affected AWS accounts
  /// in your organization. For example, if an event affects a service such as
  /// Amazon Elastic Compute Cloud and you have AWS accounts that use that
  /// service, those account IDs appear in the response.
  /// </li>
  /// <li>
  /// If the <code>eventScopeCode</code> value is <code>NONE</code>, then the
  /// <code>eventArn</code> that you specified in the request is invalid or
  /// doesn't exist.
  /// </li>
  /// </ul>
  final EventScopeCode? eventScopeCode;

  /// The category of the event. Possible values are <code>issue</code>,
  /// <code>scheduledChange</code>, and <code>accountNotification</code>.
  final EventTypeCategory? eventTypeCategory;

  /// The unique identifier for the event type. The format is
  /// <code>AWS_<i>SERVICE</i>_<i>DESCRIPTION</i> </code>; for example,
  /// <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>.
  final String? eventTypeCode;

  /// The most recent date and time that the event was updated.
  final DateTime? lastUpdatedTime;

  /// The AWS Region name of the event.
  final String? region;

  /// The AWS service that is affected by the event. For example,
  /// <code>EC2</code>, <code>RDS</code>.
  final String? service;

  /// The date and time that the event began.
  final DateTime? startTime;

  /// The most recent status of the event. Possible values are <code>open</code>,
  /// <code>closed</code>, and <code>upcoming</code>.
  final EventStatusCode? statusCode;

  Event({
    this.arn,
    this.availabilityZone,
    this.endTime,
    this.eventScopeCode,
    this.eventTypeCategory,
    this.eventTypeCode,
    this.lastUpdatedTime,
    this.region,
    this.service,
    this.startTime,
    this.statusCode,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      arn: json['arn'] as String?,
      availabilityZone: json['availabilityZone'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      eventScopeCode: (json['eventScopeCode'] as String?)?.toEventScopeCode(),
      eventTypeCategory:
          (json['eventTypeCategory'] as String?)?.toEventTypeCategory(),
      eventTypeCode: json['eventTypeCode'] as String?,
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      region: json['region'] as String?,
      service: json['service'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      statusCode: (json['statusCode'] as String?)?.toEventStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final availabilityZone = this.availabilityZone;
    final endTime = this.endTime;
    final eventScopeCode = this.eventScopeCode;
    final eventTypeCategory = this.eventTypeCategory;
    final eventTypeCode = this.eventTypeCode;
    final lastUpdatedTime = this.lastUpdatedTime;
    final region = this.region;
    final service = this.service;
    final startTime = this.startTime;
    final statusCode = this.statusCode;
    return {
      if (arn != null) 'arn': arn,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (eventScopeCode != null) 'eventScopeCode': eventScopeCode.toValue(),
      if (eventTypeCategory != null)
        'eventTypeCategory': eventTypeCategory.toValue(),
      if (eventTypeCode != null) 'eventTypeCode': eventTypeCode,
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (region != null) 'region': region,
      if (service != null) 'service': service,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (statusCode != null) 'statusCode': statusCode.toValue(),
    };
  }
}

/// The values used to filter results from the <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetailsForOrganization.html">DescribeEventDetailsForOrganization</a>
/// and <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntitiesForOrganization.html">DescribeAffectedEntitiesForOrganization</a>
/// operations.
class EventAccountFilter {
  /// The unique identifier for the event. The event ARN has the
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code> format.
  ///
  /// For example, an event ARN might look like the following:
  ///
  /// <code>arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  final String eventArn;

  /// The 12-digit AWS account numbers that contains the affected entities.
  final String? awsAccountId;

  EventAccountFilter({
    required this.eventArn,
    this.awsAccountId,
  });

  factory EventAccountFilter.fromJson(Map<String, dynamic> json) {
    return EventAccountFilter(
      eventArn: json['eventArn'] as String,
      awsAccountId: json['awsAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventArn = this.eventArn;
    final awsAccountId = this.awsAccountId;
    return {
      'eventArn': eventArn,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
    };
  }
}

/// The number of events of each issue type. Returned by the <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventAggregates.html">DescribeEventAggregates</a>
/// operation.
class EventAggregate {
  /// The issue type for the associated count.
  final String? aggregateValue;

  /// The number of events of the associated issue type.
  final int? count;

  EventAggregate({
    this.aggregateValue,
    this.count,
  });

  factory EventAggregate.fromJson(Map<String, dynamic> json) {
    return EventAggregate(
      aggregateValue: json['aggregateValue'] as String?,
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateValue = this.aggregateValue;
    final count = this.count;
    return {
      if (aggregateValue != null) 'aggregateValue': aggregateValue,
      if (count != null) 'count': count,
    };
  }
}

/// The detailed description of the event. Included in the information returned
/// by the <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetails.html">DescribeEventDetails</a>
/// operation.
class EventDescription {
  /// The most recent description of the event.
  final String? latestDescription;

  EventDescription({
    this.latestDescription,
  });

  factory EventDescription.fromJson(Map<String, dynamic> json) {
    return EventDescription(
      latestDescription: json['latestDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final latestDescription = this.latestDescription;
    return {
      if (latestDescription != null) 'latestDescription': latestDescription,
    };
  }
}

/// Detailed information about an event. A combination of an <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html">Event</a>
/// object, an <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_EventDescription.html">EventDescription</a>
/// object, and additional metadata about the event. Returned by the <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetails.html">DescribeEventDetails</a>
/// operation.
class EventDetails {
  /// Summary information about the event.
  final Event? event;

  /// The most recent description of the event.
  final EventDescription? eventDescription;

  /// Additional metadata about the event.
  final Map<String, String>? eventMetadata;

  EventDetails({
    this.event,
    this.eventDescription,
    this.eventMetadata,
  });

  factory EventDetails.fromJson(Map<String, dynamic> json) {
    return EventDetails(
      event: json['event'] != null
          ? Event.fromJson(json['event'] as Map<String, dynamic>)
          : null,
      eventDescription: json['eventDescription'] != null
          ? EventDescription.fromJson(
              json['eventDescription'] as Map<String, dynamic>)
          : null,
      eventMetadata: (json['eventMetadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    final eventDescription = this.eventDescription;
    final eventMetadata = this.eventMetadata;
    return {
      if (event != null) 'event': event,
      if (eventDescription != null) 'eventDescription': eventDescription,
      if (eventMetadata != null) 'eventMetadata': eventMetadata,
    };
  }
}

/// Error information returned when a <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetails.html">DescribeEventDetails</a>
/// operation can't find a specified event.
class EventDetailsErrorItem {
  /// A message that describes the error.
  final String? errorMessage;

  /// The name of the error.
  final String? errorName;

  /// The unique identifier for the event. The event ARN has the
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code> format.
  ///
  /// For example, an event ARN might look like the following:
  ///
  /// <code>arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  final String? eventArn;

  EventDetailsErrorItem({
    this.errorMessage,
    this.errorName,
    this.eventArn,
  });

  factory EventDetailsErrorItem.fromJson(Map<String, dynamic> json) {
    return EventDetailsErrorItem(
      errorMessage: json['errorMessage'] as String?,
      errorName: json['errorName'] as String?,
      eventArn: json['eventArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final errorName = this.errorName;
    final eventArn = this.eventArn;
    return {
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (errorName != null) 'errorName': errorName,
      if (eventArn != null) 'eventArn': eventArn,
    };
  }
}

/// The values to use to filter results from the <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEvents.html">DescribeEvents</a>
/// and <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventAggregates.html">DescribeEventAggregates</a>
/// operations.
class EventFilter {
  /// A list of AWS Availability Zones.
  final List<String>? availabilityZones;

  /// A list of dates and times that the event ended.
  final List<DateTimeRange>? endTimes;

  /// A list of entity ARNs (unique identifiers).
  final List<String>? entityArns;

  /// A list of entity identifiers, such as EC2 instance IDs
  /// (<code>i-34ab692e</code>) or EBS volumes (<code>vol-426ab23e</code>).
  final List<String>? entityValues;

  /// A list of event ARNs (unique identifiers). For example:
  /// <code>"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
  /// "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"</code>
  final List<String>? eventArns;

  /// A list of event status codes.
  final List<EventStatusCode>? eventStatusCodes;

  /// A list of event type category codes (<code>issue</code>,
  /// <code>scheduledChange</code>, or <code>accountNotification</code>).
  final List<EventTypeCategory>? eventTypeCategories;

  /// A list of unique identifiers for event types. For example,
  /// <code>"AWS_EC2_SYSTEM_MAINTENANCE_EVENT","AWS_RDS_MAINTENANCE_SCHEDULED".</code>
  final List<String>? eventTypeCodes;

  /// A list of dates and times that the event was last updated.
  final List<DateTimeRange>? lastUpdatedTimes;

  /// A list of AWS Regions.
  final List<String>? regions;

  /// The AWS services associated with the event. For example, <code>EC2</code>,
  /// <code>RDS</code>.
  final List<String>? services;

  /// A list of dates and times that the event began.
  final List<DateTimeRange>? startTimes;

  /// A map of entity tags attached to the affected entity.
  /// <note>
  /// Currently, the <code>tags</code> property isn't supported.
  /// </note>
  final List<Map<String, String>>? tags;

  EventFilter({
    this.availabilityZones,
    this.endTimes,
    this.entityArns,
    this.entityValues,
    this.eventArns,
    this.eventStatusCodes,
    this.eventTypeCategories,
    this.eventTypeCodes,
    this.lastUpdatedTimes,
    this.regions,
    this.services,
    this.startTimes,
    this.tags,
  });

  factory EventFilter.fromJson(Map<String, dynamic> json) {
    return EventFilter(
      availabilityZones: (json['availabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      endTimes: (json['endTimes'] as List?)
          ?.whereNotNull()
          .map((e) => DateTimeRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      entityArns: (json['entityArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      entityValues: (json['entityValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      eventArns: (json['eventArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      eventStatusCodes: (json['eventStatusCodes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEventStatusCode())
          .toList(),
      eventTypeCategories: (json['eventTypeCategories'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEventTypeCategory())
          .toList(),
      eventTypeCodes: (json['eventTypeCodes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdatedTimes: (json['lastUpdatedTimes'] as List?)
          ?.whereNotNull()
          .map((e) => DateTimeRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      regions: (json['regions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      services: (json['services'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      startTimes: (json['startTimes'] as List?)
          ?.whereNotNull()
          .map((e) => DateTimeRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final endTimes = this.endTimes;
    final entityArns = this.entityArns;
    final entityValues = this.entityValues;
    final eventArns = this.eventArns;
    final eventStatusCodes = this.eventStatusCodes;
    final eventTypeCategories = this.eventTypeCategories;
    final eventTypeCodes = this.eventTypeCodes;
    final lastUpdatedTimes = this.lastUpdatedTimes;
    final regions = this.regions;
    final services = this.services;
    final startTimes = this.startTimes;
    final tags = this.tags;
    return {
      if (availabilityZones != null) 'availabilityZones': availabilityZones,
      if (endTimes != null) 'endTimes': endTimes,
      if (entityArns != null) 'entityArns': entityArns,
      if (entityValues != null) 'entityValues': entityValues,
      if (eventArns != null) 'eventArns': eventArns,
      if (eventStatusCodes != null)
        'eventStatusCodes': eventStatusCodes.map((e) => e.toValue()).toList(),
      if (eventTypeCategories != null)
        'eventTypeCategories':
            eventTypeCategories.map((e) => e.toValue()).toList(),
      if (eventTypeCodes != null) 'eventTypeCodes': eventTypeCodes,
      if (lastUpdatedTimes != null) 'lastUpdatedTimes': lastUpdatedTimes,
      if (regions != null) 'regions': regions,
      if (services != null) 'services': services,
      if (startTimes != null) 'startTimes': startTimes,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Contains the metadata about a type of event that is reported by AWS Health.
/// The <code>EventType</code> shows the category, service, and the event type
/// code of the event. For example, an <code>issue</code> might be the category,
/// <code>EC2</code> the service, and
/// <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code> the event type code.
///
/// You can use the <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventTypes.html">DescribeEventTypes</a>
/// API operation to return this information about an event.
///
/// You can also use the Amazon CloudWatch Events console to create a rule so
/// that you can get notified or take action when AWS Health delivers a specific
/// event to your AWS account. For more information, see <a
/// href="https://docs.aws.amazon.com/health/latest/ug/cloudwatch-events-health.html">Monitor
/// for AWS Health events with Amazon CloudWatch Events</a> in the <i>AWS Health
/// User Guide</i>.
class EventType {
  /// A list of event type category codes (<code>issue</code>,
  /// <code>scheduledChange</code>, or <code>accountNotification</code>).
  final EventTypeCategory? category;

  /// The unique identifier for the event type. The format is
  /// <code>AWS_<i>SERVICE</i>_<i>DESCRIPTION</i> </code>; for example,
  /// <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>.
  final String? code;

  /// The AWS service that is affected by the event. For example,
  /// <code>EC2</code>, <code>RDS</code>.
  final String? service;

  EventType({
    this.category,
    this.code,
    this.service,
  });

  factory EventType.fromJson(Map<String, dynamic> json) {
    return EventType(
      category: (json['category'] as String?)?.toEventTypeCategory(),
      code: json['code'] as String?,
      service: json['service'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final code = this.code;
    final service = this.service;
    return {
      if (category != null) 'category': category.toValue(),
      if (code != null) 'code': code,
      if (service != null) 'service': service,
    };
  }
}

/// The values to use to filter results from the <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventTypes.html">DescribeEventTypes</a>
/// operation.
class EventTypeFilter {
  /// A list of event type category codes (<code>issue</code>,
  /// <code>scheduledChange</code>, or <code>accountNotification</code>).
  final List<EventTypeCategory>? eventTypeCategories;

  /// A list of event type codes.
  final List<String>? eventTypeCodes;

  /// The AWS services associated with the event. For example, <code>EC2</code>,
  /// <code>RDS</code>.
  final List<String>? services;

  EventTypeFilter({
    this.eventTypeCategories,
    this.eventTypeCodes,
    this.services,
  });

  factory EventTypeFilter.fromJson(Map<String, dynamic> json) {
    return EventTypeFilter(
      eventTypeCategories: (json['eventTypeCategories'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEventTypeCategory())
          .toList(),
      eventTypeCodes: (json['eventTypeCodes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      services: (json['services'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventTypeCategories = this.eventTypeCategories;
    final eventTypeCodes = this.eventTypeCodes;
    final services = this.services;
    return {
      if (eventTypeCategories != null)
        'eventTypeCategories':
            eventTypeCategories.map((e) => e.toValue()).toList(),
      if (eventTypeCodes != null) 'eventTypeCodes': eventTypeCodes,
      if (services != null) 'services': services,
    };
  }
}

/// Error information returned when a <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntitiesForOrganization.html">DescribeAffectedEntitiesForOrganization</a>
/// operation can't find or process a specific entity.
class OrganizationAffectedEntitiesErrorItem {
  /// The 12-digit AWS account numbers that contains the affected entities.
  final String? awsAccountId;

  /// The unique identifier for the event type. The format is
  /// <code>AWS_SERVICE_DESCRIPTION</code>. For example,
  /// <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>.
  final String? errorMessage;

  /// The name of the error.
  final String? errorName;

  /// The unique identifier for the event. The event ARN has the
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code> format.
  ///
  /// For example, an event ARN might look like the following:
  ///
  /// <code>arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  final String? eventArn;

  OrganizationAffectedEntitiesErrorItem({
    this.awsAccountId,
    this.errorMessage,
    this.errorName,
    this.eventArn,
  });

  factory OrganizationAffectedEntitiesErrorItem.fromJson(
      Map<String, dynamic> json) {
    return OrganizationAffectedEntitiesErrorItem(
      awsAccountId: json['awsAccountId'] as String?,
      errorMessage: json['errorMessage'] as String?,
      errorName: json['errorName'] as String?,
      eventArn: json['eventArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final errorMessage = this.errorMessage;
    final errorName = this.errorName;
    final eventArn = this.eventArn;
    return {
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (errorName != null) 'errorName': errorName,
      if (eventArn != null) 'eventArn': eventArn,
    };
  }
}

/// Summary information about an event, returned by the <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventsForOrganization.html">DescribeEventsForOrganization</a>
/// operation.
class OrganizationEvent {
  /// The unique identifier for the event. The event ARN has the
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code> format.
  ///
  /// For example, an event ARN might look like the following:
  ///
  /// <code>arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  final String? arn;

  /// The date and time that the event ended.
  final DateTime? endTime;

  /// This parameter specifies if the AWS Health event is a public AWS service
  /// event or an account-specific event.
  ///
  /// <ul>
  /// <li>
  /// If the <code>eventScopeCode</code> value is <code>PUBLIC</code>, then the
  /// <code>affectedAccounts</code> value is always empty.
  /// </li>
  /// <li>
  /// If the <code>eventScopeCode</code> value is <code>ACCOUNT_SPECIFIC</code>,
  /// then the <code>affectedAccounts</code> value lists the affected AWS accounts
  /// in your organization. For example, if an event affects a service such as
  /// Amazon Elastic Compute Cloud and you have AWS accounts that use that
  /// service, those account IDs appear in the response.
  /// </li>
  /// <li>
  /// If the <code>eventScopeCode</code> value is <code>NONE</code>, then the
  /// <code>eventArn</code> that you specified in the request is invalid or
  /// doesn't exist.
  /// </li>
  /// </ul>
  final EventScopeCode? eventScopeCode;

  /// The category of the event type.
  final EventTypeCategory? eventTypeCategory;

  /// The unique identifier for the event type. The format is
  /// <code>AWS_SERVICE_DESCRIPTION</code>. For example,
  /// <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>.
  final String? eventTypeCode;

  /// The most recent date and time that the event was updated.
  final DateTime? lastUpdatedTime;

  /// The AWS Region name of the event.
  final String? region;

  /// The AWS service that is affected by the event, such as EC2 and RDS.
  final String? service;

  /// The date and time that the event began.
  final DateTime? startTime;

  /// The most recent status of the event. Possible values are <code>open</code>,
  /// <code>closed</code>, and <code>upcoming</code>.
  final EventStatusCode? statusCode;

  OrganizationEvent({
    this.arn,
    this.endTime,
    this.eventScopeCode,
    this.eventTypeCategory,
    this.eventTypeCode,
    this.lastUpdatedTime,
    this.region,
    this.service,
    this.startTime,
    this.statusCode,
  });

  factory OrganizationEvent.fromJson(Map<String, dynamic> json) {
    return OrganizationEvent(
      arn: json['arn'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      eventScopeCode: (json['eventScopeCode'] as String?)?.toEventScopeCode(),
      eventTypeCategory:
          (json['eventTypeCategory'] as String?)?.toEventTypeCategory(),
      eventTypeCode: json['eventTypeCode'] as String?,
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      region: json['region'] as String?,
      service: json['service'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      statusCode: (json['statusCode'] as String?)?.toEventStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final endTime = this.endTime;
    final eventScopeCode = this.eventScopeCode;
    final eventTypeCategory = this.eventTypeCategory;
    final eventTypeCode = this.eventTypeCode;
    final lastUpdatedTime = this.lastUpdatedTime;
    final region = this.region;
    final service = this.service;
    final startTime = this.startTime;
    final statusCode = this.statusCode;
    return {
      if (arn != null) 'arn': arn,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (eventScopeCode != null) 'eventScopeCode': eventScopeCode.toValue(),
      if (eventTypeCategory != null)
        'eventTypeCategory': eventTypeCategory.toValue(),
      if (eventTypeCode != null) 'eventTypeCode': eventTypeCode,
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (region != null) 'region': region,
      if (service != null) 'service': service,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (statusCode != null) 'statusCode': statusCode.toValue(),
    };
  }
}

/// Detailed information about an event. A combination of an <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html">Event</a>
/// object, an <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_EventDescription.html">EventDescription</a>
/// object, and additional metadata about the event. Returned by the <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetailsForOrganization.html">DescribeEventDetailsForOrganization</a>
/// operation.
class OrganizationEventDetails {
  /// The 12-digit AWS account numbers that contains the affected entities.
  final String? awsAccountId;
  final Event? event;
  final EventDescription? eventDescription;

  /// Additional metadata about the event.
  final Map<String, String>? eventMetadata;

  OrganizationEventDetails({
    this.awsAccountId,
    this.event,
    this.eventDescription,
    this.eventMetadata,
  });

  factory OrganizationEventDetails.fromJson(Map<String, dynamic> json) {
    return OrganizationEventDetails(
      awsAccountId: json['awsAccountId'] as String?,
      event: json['event'] != null
          ? Event.fromJson(json['event'] as Map<String, dynamic>)
          : null,
      eventDescription: json['eventDescription'] != null
          ? EventDescription.fromJson(
              json['eventDescription'] as Map<String, dynamic>)
          : null,
      eventMetadata: (json['eventMetadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final event = this.event;
    final eventDescription = this.eventDescription;
    final eventMetadata = this.eventMetadata;
    return {
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (event != null) 'event': event,
      if (eventDescription != null) 'eventDescription': eventDescription,
      if (eventMetadata != null) 'eventMetadata': eventMetadata,
    };
  }
}

/// Error information returned when a <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetailsForOrganization.html">DescribeEventDetailsForOrganization</a>
/// operation can't find a specified event.
class OrganizationEventDetailsErrorItem {
  /// Error information returned when a <a
  /// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetailsForOrganization.html">DescribeEventDetailsForOrganization</a>
  /// operation can't find a specified event.
  final String? awsAccountId;

  /// A message that describes the error.
  ///
  /// If you call the <code>DescribeEventDetailsForOrganization</code> operation
  /// and receive one of the following errors, follow the recommendations in the
  /// message:
  ///
  /// <ul>
  /// <li>
  /// We couldn't find a public event that matches your request. To find an event
  /// that is account specific, you must enter an AWS account ID in the request.
  /// </li>
  /// <li>
  /// We couldn't find an account specific event for the specified AWS account. To
  /// find an event that is public, you must enter a null value for the AWS
  /// account ID in the request.
  /// </li>
  /// <li>
  /// Your AWS account doesn't include the AWS Support plan required to use the
  /// AWS Health API. You must have either a Business or Enterprise Support plan.
  /// </li>
  /// </ul>
  final String? errorMessage;

  /// The name of the error.
  final String? errorName;

  /// The unique identifier for the event. The event ARN has the
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code> format.
  ///
  /// For example, an event ARN might look like the following:
  ///
  /// <code>arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  final String? eventArn;

  OrganizationEventDetailsErrorItem({
    this.awsAccountId,
    this.errorMessage,
    this.errorName,
    this.eventArn,
  });

  factory OrganizationEventDetailsErrorItem.fromJson(
      Map<String, dynamic> json) {
    return OrganizationEventDetailsErrorItem(
      awsAccountId: json['awsAccountId'] as String?,
      errorMessage: json['errorMessage'] as String?,
      errorName: json['errorName'] as String?,
      eventArn: json['eventArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final errorMessage = this.errorMessage;
    final errorName = this.errorName;
    final eventArn = this.eventArn;
    return {
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (errorName != null) 'errorName': errorName,
      if (eventArn != null) 'eventArn': eventArn,
    };
  }
}

/// The values to filter results from the <a
/// href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventsForOrganization.html">DescribeEventsForOrganization</a>
/// operation.
class OrganizationEventFilter {
  /// A list of 12-digit AWS account numbers that contains the affected entities.
  final List<String>? awsAccountIds;
  final DateTimeRange? endTime;

  /// A list of entity ARNs (unique identifiers).
  final List<String>? entityArns;

  /// A list of entity identifiers, such as EC2 instance IDs (i-34ab692e) or EBS
  /// volumes (vol-426ab23e).
  final List<String>? entityValues;

  /// A list of event status codes.
  final List<EventStatusCode>? eventStatusCodes;

  /// A list of event type category codes (issue, scheduledChange, or
  /// accountNotification).
  final List<EventTypeCategory>? eventTypeCategories;

  /// A list of unique identifiers for event types. For example,
  /// <code>"AWS_EC2_SYSTEM_MAINTENANCE_EVENT","AWS_RDS_MAINTENANCE_SCHEDULED".</code>
  final List<String>? eventTypeCodes;
  final DateTimeRange? lastUpdatedTime;

  /// A list of AWS Regions.
  final List<String>? regions;

  /// The AWS services associated with the event. For example, <code>EC2</code>,
  /// <code>RDS</code>.
  final List<String>? services;
  final DateTimeRange? startTime;

  OrganizationEventFilter({
    this.awsAccountIds,
    this.endTime,
    this.entityArns,
    this.entityValues,
    this.eventStatusCodes,
    this.eventTypeCategories,
    this.eventTypeCodes,
    this.lastUpdatedTime,
    this.regions,
    this.services,
    this.startTime,
  });

  factory OrganizationEventFilter.fromJson(Map<String, dynamic> json) {
    return OrganizationEventFilter(
      awsAccountIds: (json['awsAccountIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      endTime: json['endTime'] != null
          ? DateTimeRange.fromJson(json['endTime'] as Map<String, dynamic>)
          : null,
      entityArns: (json['entityArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      entityValues: (json['entityValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      eventStatusCodes: (json['eventStatusCodes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEventStatusCode())
          .toList(),
      eventTypeCategories: (json['eventTypeCategories'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEventTypeCategory())
          .toList(),
      eventTypeCodes: (json['eventTypeCodes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdatedTime: json['lastUpdatedTime'] != null
          ? DateTimeRange.fromJson(
              json['lastUpdatedTime'] as Map<String, dynamic>)
          : null,
      regions: (json['regions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      services: (json['services'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      startTime: json['startTime'] != null
          ? DateTimeRange.fromJson(json['startTime'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountIds = this.awsAccountIds;
    final endTime = this.endTime;
    final entityArns = this.entityArns;
    final entityValues = this.entityValues;
    final eventStatusCodes = this.eventStatusCodes;
    final eventTypeCategories = this.eventTypeCategories;
    final eventTypeCodes = this.eventTypeCodes;
    final lastUpdatedTime = this.lastUpdatedTime;
    final regions = this.regions;
    final services = this.services;
    final startTime = this.startTime;
    return {
      if (awsAccountIds != null) 'awsAccountIds': awsAccountIds,
      if (endTime != null) 'endTime': endTime,
      if (entityArns != null) 'entityArns': entityArns,
      if (entityValues != null) 'entityValues': entityValues,
      if (eventStatusCodes != null)
        'eventStatusCodes': eventStatusCodes.map((e) => e.toValue()).toList(),
      if (eventTypeCategories != null)
        'eventTypeCategories':
            eventTypeCategories.map((e) => e.toValue()).toList(),
      if (eventTypeCodes != null) 'eventTypeCodes': eventTypeCodes,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (regions != null) 'regions': regions,
      if (services != null) 'services': services,
      if (startTime != null) 'startTime': startTime,
    };
  }
}

enum EntityStatusCode {
  impaired,
  unimpaired,
  unknown,
}

extension on EntityStatusCode {
  String toValue() {
    switch (this) {
      case EntityStatusCode.impaired:
        return 'IMPAIRED';
      case EntityStatusCode.unimpaired:
        return 'UNIMPAIRED';
      case EntityStatusCode.unknown:
        return 'UNKNOWN';
    }
  }
}

extension on String {
  EntityStatusCode toEntityStatusCode() {
    switch (this) {
      case 'IMPAIRED':
        return EntityStatusCode.impaired;
      case 'UNIMPAIRED':
        return EntityStatusCode.unimpaired;
      case 'UNKNOWN':
        return EntityStatusCode.unknown;
    }
    throw Exception('$this is not known in enum EntityStatusCode');
  }
}

enum EventAggregateField {
  eventTypeCategory,
}

extension on EventAggregateField {
  String toValue() {
    switch (this) {
      case EventAggregateField.eventTypeCategory:
        return 'eventTypeCategory';
    }
  }
}

extension on String {
  EventAggregateField toEventAggregateField() {
    switch (this) {
      case 'eventTypeCategory':
        return EventAggregateField.eventTypeCategory;
    }
    throw Exception('$this is not known in enum EventAggregateField');
  }
}

enum EventScopeCode {
  public,
  accountSpecific,
  none,
}

extension on EventScopeCode {
  String toValue() {
    switch (this) {
      case EventScopeCode.public:
        return 'PUBLIC';
      case EventScopeCode.accountSpecific:
        return 'ACCOUNT_SPECIFIC';
      case EventScopeCode.none:
        return 'NONE';
    }
  }
}

extension on String {
  EventScopeCode toEventScopeCode() {
    switch (this) {
      case 'PUBLIC':
        return EventScopeCode.public;
      case 'ACCOUNT_SPECIFIC':
        return EventScopeCode.accountSpecific;
      case 'NONE':
        return EventScopeCode.none;
    }
    throw Exception('$this is not known in enum EventScopeCode');
  }
}

enum EventStatusCode {
  open,
  closed,
  upcoming,
}

extension on EventStatusCode {
  String toValue() {
    switch (this) {
      case EventStatusCode.open:
        return 'open';
      case EventStatusCode.closed:
        return 'closed';
      case EventStatusCode.upcoming:
        return 'upcoming';
    }
  }
}

extension on String {
  EventStatusCode toEventStatusCode() {
    switch (this) {
      case 'open':
        return EventStatusCode.open;
      case 'closed':
        return EventStatusCode.closed;
      case 'upcoming':
        return EventStatusCode.upcoming;
    }
    throw Exception('$this is not known in enum EventStatusCode');
  }
}

enum EventTypeCategory {
  issue,
  accountNotification,
  scheduledChange,
  investigation,
}

extension on EventTypeCategory {
  String toValue() {
    switch (this) {
      case EventTypeCategory.issue:
        return 'issue';
      case EventTypeCategory.accountNotification:
        return 'accountNotification';
      case EventTypeCategory.scheduledChange:
        return 'scheduledChange';
      case EventTypeCategory.investigation:
        return 'investigation';
    }
  }
}

extension on String {
  EventTypeCategory toEventTypeCategory() {
    switch (this) {
      case 'issue':
        return EventTypeCategory.issue;
      case 'accountNotification':
        return EventTypeCategory.accountNotification;
      case 'scheduledChange':
        return EventTypeCategory.scheduledChange;
      case 'investigation':
        return EventTypeCategory.investigation;
    }
    throw Exception('$this is not known in enum EventTypeCategory');
  }
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class InvalidPaginationToken extends _s.GenericAwsException {
  InvalidPaginationToken({String? type, String? message})
      : super(type: type, code: 'InvalidPaginationToken', message: message);
}

class UnsupportedLocale extends _s.GenericAwsException {
  UnsupportedLocale({String? type, String? message})
      : super(type: type, code: 'UnsupportedLocale', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'InvalidPaginationToken': (type, message) =>
      InvalidPaginationToken(type: type, message: message),
  'UnsupportedLocale': (type, message) =>
      UnsupportedLocale(type: type, message: message),
};
