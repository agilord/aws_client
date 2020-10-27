// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'health-2016-08-04.g.dart';

/// The AWS Health API provides programmatic access to the AWS Health
/// information that is presented in the <a
/// href="https://phd.aws.amazon.com/phd/home#/">AWS Personal Health
/// Dashboard</a>. You can get information about events that affect your AWS
/// resources:
class Health {
  final _s.JsonProtocol _protocol;
  Health({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'health',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Returns a list of accounts in the organization from AWS Organizations that
  /// are affected by the provided event.
  ///
  /// Before you can call this operation, you must first enable AWS Health to
  /// work with AWS Organizations. To do this, call the
  /// <a>EnableHealthServiceAccessForOrganization</a> operation from your
  /// organization's master account.
  ///
  /// May throw [InvalidPaginationToken].
  ///
  /// Parameter [eventArn] :
  /// The unique identifier for the event. Format:
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code>. Example: <code>Example:
  /// arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
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
    @_s.required String eventArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(eventArn, 'eventArn');
    _s.validateStringLength(
      'eventArn',
      eventArn,
      0,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'eventArn',
      eventArn,
      r'''arn:aws(-[a-z]+(-[a-z]+)?)?:health:[^:]*:[^:]*:event(?:/[\w-]+){3}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9=/+_.-]{4,10000}''',
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
    @_s.required EntityFilter filter,
    String locale,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(filter, 'filter');
    _s.validateStringLength(
      'locale',
      locale,
      2,
      256,
    );
    _s.validateStringPattern(
      'locale',
      locale,
      r'''.{2,256}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9=/+_.-]{4,10000}''',
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
  /// At least one event ARN and account ID are required. Results are sorted by
  /// the <code>lastUpdatedTime</code> of the entity, starting with the most
  /// recent.
  ///
  /// Before you can call this operation, you must first enable AWS Health to
  /// work with AWS Organizations. To do this, call the
  /// <a>EnableHealthServiceAccessForOrganization</a> operation from your
  /// organization's master account.
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
    @_s.required List<EventAccountFilter> organizationEntityFilters,
    String locale,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        organizationEntityFilters, 'organizationEntityFilters');
    _s.validateStringLength(
      'locale',
      locale,
      2,
      256,
    );
    _s.validateStringPattern(
      'locale',
      locale,
      r'''.{2,256}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9=/+_.-]{4,10000}''',
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
    List<String> eventArns,
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
    @_s.required EventAggregateField aggregateField,
    EventFilter filter,
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9=/+_.-]{4,10000}''',
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
        'aggregateField': aggregateField?.toValue(),
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeEventAggregatesResponse.fromJson(jsonResponse.body);
  }

  /// Returns detailed information about one or more specified events.
  /// Information includes standard event data (region, service, and so on, as
  /// returned by <a>DescribeEvents</a>), a detailed event description, and
  /// possible additional metadata that depends upon the nature of the event.
  /// Affected entities are not included; to retrieve those, use the
  /// <a>DescribeAffectedEntities</a> operation.
  ///
  /// If a specified event cannot be retrieved, an error message is returned for
  /// that event.
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
    @_s.required List<String> eventArns,
    String locale,
  }) async {
    ArgumentError.checkNotNull(eventArns, 'eventArns');
    _s.validateStringLength(
      'locale',
      locale,
      2,
      256,
    );
    _s.validateStringPattern(
      'locale',
      locale,
      r'''.{2,256}''',
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
  /// more accounts in your organization. Information includes standard event
  /// data (Region, service, and so on, as returned by
  /// <a>DescribeEventsForOrganization</a>, a detailed event description, and
  /// possible additional metadata that depends upon the nature of the event.
  /// Affected entities are not included; to retrieve those, use the
  /// <a>DescribeAffectedEntitiesForOrganization</a> operation.
  ///
  /// Before you can call this operation, you must first enable AWS Health to
  /// work with AWS Organizations. To do this, call the
  /// <a>EnableHealthServiceAccessForOrganization</a> operation from your
  /// organization's master account.
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
    @_s.required List<EventAccountFilter> organizationEventDetailFilters,
    String locale,
  }) async {
    ArgumentError.checkNotNull(
        organizationEventDetailFilters, 'organizationEventDetailFilters');
    _s.validateStringLength(
      'locale',
      locale,
      2,
      256,
    );
    _s.validateStringPattern(
      'locale',
      locale,
      r'''.{2,256}''',
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

  /// Returns the event types that meet the specified filter criteria. If no
  /// filter criteria are specified, all event types are returned, in no
  /// particular order.
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
    EventTypeFilter filter,
    String locale,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'locale',
      locale,
      2,
      256,
    );
    _s.validateStringPattern(
      'locale',
      locale,
      r'''.{2,256}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9=/+_.-]{4,10000}''',
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
  /// any affected resources. To retrieve that information, use the
  /// <a>DescribeEventDetails</a> and <a>DescribeAffectedEntities</a>
  /// operations.
  ///
  /// If no filter criteria are specified, all events are returned. Results are
  /// sorted by <code>lastModifiedTime</code>, starting with the most recent.
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
    EventFilter filter,
    String locale,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'locale',
      locale,
      2,
      256,
    );
    _s.validateStringPattern(
      'locale',
      locale,
      r'''.{2,256}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9=/+_.-]{4,10000}''',
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
  /// Organizations, meeting the specified filter criteria. Events are returned
  /// in a summary form and do not include the accounts impacted, detailed
  /// description, any additional metadata that depends on the event type, or
  /// any affected resources. To retrieve that information, use the
  /// <a>DescribeAffectedAccountsForOrganization</a>,
  /// <a>DescribeEventDetailsForOrganization</a>, and
  /// <a>DescribeAffectedEntitiesForOrganization</a> operations.
  ///
  /// If no filter criteria are specified, all events across your organization
  /// are returned. Results are sorted by <code>lastModifiedTime</code>,
  /// starting with the most recent.
  ///
  /// Before you can call this operation, you must first enable Health to work
  /// with AWS Organizations. To do this, call the
  /// <a>EnableHealthServiceAccessForOrganization</a> operation from your
  /// organization's master account.
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
    OrganizationEventFilter filter,
    String locale,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'locale',
      locale,
      2,
      256,
    );
    _s.validateStringPattern(
      'locale',
      locale,
      r'''.{2,256}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9=/+_.-]{4,10000}''',
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
  /// (not recommended) in the organization's master account.
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

  /// Calling this operation disables Health from working with AWS
  /// Organizations. This does not remove the Service Linked Role (SLR) from the
  /// the master account in your organization. Use the IAM console, API, or AWS
  /// CLI to remove the SLR if desired. To call this operation, you must sign in
  /// as an IAM user, assume an IAM role, or sign in as the root user (not
  /// recommended) in the organization's master account.
  ///
  /// May throw [ConcurrentModificationException].
  Future<void> disableHealthServiceAccessForOrganization() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSHealth_20160804.DisableHealthServiceAccessForOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Calling this operation enables AWS Health to work with AWS Organizations.
  /// This applies a Service Linked Role (SLR) to the master account in the
  /// organization. To learn more about the steps in this process, visit
  /// enabling service access for AWS Health in AWS Organizations. To call this
  /// operation, you must sign in as an IAM user, assume an IAM role, or sign in
  /// as the root user (not recommended) in the organization's master account.
  ///
  /// May throw [ConcurrentModificationException].
  Future<void> enableHealthServiceAccessForOrganization() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSHealth_20160804.EnableHealthServiceAccessForOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }
}

/// Information about an entity that is affected by a Health event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AffectedEntity {
  /// The 12-digit AWS account number that contains the affected entity.
  @_s.JsonKey(name: 'awsAccountId')
  final String awsAccountId;

  /// The unique identifier for the entity. Format:
  /// <code>arn:aws:health:<i>entity-region</i>:<i>aws-account</i>:entity/<i>entity-id</i>
  /// </code>. Example:
  /// <code>arn:aws:health:us-east-1:111222333444:entity/AVh5GGT7ul1arKr1sE1K</code>
  @_s.JsonKey(name: 'entityArn')
  final String entityArn;

  /// The URL of the affected entity.
  @_s.JsonKey(name: 'entityUrl')
  final String entityUrl;

  /// The ID of the affected entity.
  @_s.JsonKey(name: 'entityValue')
  final String entityValue;

  /// The unique identifier for the event. Format:
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code>. Example: <code>Example:
  /// arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  @_s.JsonKey(name: 'eventArn')
  final String eventArn;

  /// The most recent time that the entity was updated.
  @_s.JsonKey(
      name: 'lastUpdatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdatedTime;

  /// The most recent status of the entity affected by the event. The possible
  /// values are <code>IMPAIRED</code>, <code>UNIMPAIRED</code>, and
  /// <code>UNKNOWN</code>.
  @_s.JsonKey(name: 'statusCode')
  final EntityStatusCode statusCode;

  /// A map of entity tags attached to the affected entity.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory AffectedEntity.fromJson(Map<String, dynamic> json) =>
      _$AffectedEntityFromJson(json);
}

/// A range of dates and times that is used by the <a>EventFilter</a> and
/// <a>EntityFilter</a> objects. If <code>from</code> is set and <code>to</code>
/// is set: match items where the timestamp (<code>startTime</code>,
/// <code>endTime</code>, or <code>lastUpdatedTime</code>) is between
/// <code>from</code> and <code>to</code> inclusive. If <code>from</code> is set
/// and <code>to</code> is not set: match items where the timestamp value is
/// equal to or after <code>from</code>. If <code>from</code> is not set and
/// <code>to</code> is set: match items where the timestamp value is equal to or
/// before <code>to</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DateTimeRange {
  /// The starting date and time of a time range.
  @_s.JsonKey(
      name: 'from',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime from;

  /// The ending date and time of a time range.
  @_s.JsonKey(
      name: 'to', fromJson: unixTimestampFromJson, toJson: unixTimestampToJson)
  final DateTime to;

  DateTimeRange({
    this.from,
    this.to,
  });
  Map<String, dynamic> toJson() => _$DateTimeRangeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAffectedAccountsForOrganizationResponse {
  /// A JSON set of elements of the affected accounts.
  @_s.JsonKey(name: 'affectedAccounts')
  final List<String> affectedAccounts;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeAffectedAccountsForOrganizationResponse({
    this.affectedAccounts,
    this.nextToken,
  });
  factory DescribeAffectedAccountsForOrganizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAffectedAccountsForOrganizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAffectedEntitiesForOrganizationResponse {
  /// A JSON set of elements including the <code>awsAccountId</code> and its
  /// <code>entityArn</code>, <code>entityValue</code> and its
  /// <code>entityArn</code>, <code>lastUpdatedTime</code>,
  /// <code>statusCode</code>, and <code>tags</code>.
  @_s.JsonKey(name: 'entities')
  final List<AffectedEntity> entities;

  /// A JSON set of elements of the failed response, including the
  /// <code>awsAccountId</code>, <code>errorMessage</code>,
  /// <code>errorName</code>, and <code>eventArn</code>.
  @_s.JsonKey(name: 'failedSet')
  final List<OrganizationAffectedEntitiesErrorItem> failedSet;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeAffectedEntitiesForOrganizationResponse({
    this.entities,
    this.failedSet,
    this.nextToken,
  });
  factory DescribeAffectedEntitiesForOrganizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAffectedEntitiesForOrganizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAffectedEntitiesResponse {
  /// The entities that match the filter criteria.
  @_s.JsonKey(name: 'entities')
  final List<AffectedEntity> entities;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeAffectedEntitiesResponse({
    this.entities,
    this.nextToken,
  });
  factory DescribeAffectedEntitiesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAffectedEntitiesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEntityAggregatesResponse {
  /// The number of entities that are affected by each of the specified events.
  @_s.JsonKey(name: 'entityAggregates')
  final List<EntityAggregate> entityAggregates;

  DescribeEntityAggregatesResponse({
    this.entityAggregates,
  });
  factory DescribeEntityAggregatesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeEntityAggregatesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEventAggregatesResponse {
  /// The number of events in each category that meet the optional filter
  /// criteria.
  @_s.JsonKey(name: 'eventAggregates')
  final List<EventAggregate> eventAggregates;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeEventAggregatesResponse({
    this.eventAggregates,
    this.nextToken,
  });
  factory DescribeEventAggregatesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEventAggregatesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEventDetailsForOrganizationResponse {
  /// Error messages for any events that could not be retrieved.
  @_s.JsonKey(name: 'failedSet')
  final List<OrganizationEventDetailsErrorItem> failedSet;

  /// Information about the events that could be retrieved.
  @_s.JsonKey(name: 'successfulSet')
  final List<OrganizationEventDetails> successfulSet;

  DescribeEventDetailsForOrganizationResponse({
    this.failedSet,
    this.successfulSet,
  });
  factory DescribeEventDetailsForOrganizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeEventDetailsForOrganizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEventDetailsResponse {
  /// Error messages for any events that could not be retrieved.
  @_s.JsonKey(name: 'failedSet')
  final List<EventDetailsErrorItem> failedSet;

  /// Information about the events that could be retrieved.
  @_s.JsonKey(name: 'successfulSet')
  final List<EventDetails> successfulSet;

  DescribeEventDetailsResponse({
    this.failedSet,
    this.successfulSet,
  });
  factory DescribeEventDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEventDetailsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEventTypesResponse {
  /// A list of event types that match the filter criteria. Event types have a
  /// category (<code>issue</code>, <code>accountNotification</code>, or
  /// <code>scheduledChange</code>), a service (for example, <code>EC2</code>,
  /// <code>RDS</code>, <code>DATAPIPELINE</code>, <code>BILLING</code>), and a
  /// code (in the format <code>AWS_<i>SERVICE</i>_<i>DESCRIPTION</i> </code>; for
  /// example, <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>).
  @_s.JsonKey(name: 'eventTypes')
  final List<EventType> eventTypes;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeEventTypesResponse({
    this.eventTypes,
    this.nextToken,
  });
  factory DescribeEventTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEventTypesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEventsForOrganizationResponse {
  /// The events that match the specified filter criteria.
  @_s.JsonKey(name: 'events')
  final List<OrganizationEvent> events;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeEventsForOrganizationResponse({
    this.events,
    this.nextToken,
  });
  factory DescribeEventsForOrganizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeEventsForOrganizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEventsResponse {
  /// The events that match the specified filter criteria.
  @_s.JsonKey(name: 'events')
  final List<Event> events;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next batch of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeEventsResponse({
    this.events,
    this.nextToken,
  });
  factory DescribeEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEventsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeHealthServiceStatusForOrganizationResponse {
  /// Information about the status of enabling or disabling AWS Health
  /// Organizational View in your organization.
  ///
  /// Valid values are <code>ENABLED | DISABLED | PENDING</code>.
  @_s.JsonKey(name: 'healthServiceAccessStatusForOrganization')
  final String healthServiceAccessStatusForOrganization;

  DescribeHealthServiceStatusForOrganizationResponse({
    this.healthServiceAccessStatusForOrganization,
  });
  factory DescribeHealthServiceStatusForOrganizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeHealthServiceStatusForOrganizationResponseFromJson(json);
}

/// The number of entities that are affected by one or more events. Returned by
/// the <a>DescribeEntityAggregates</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EntityAggregate {
  /// The number entities that match the criteria for the specified events.
  @_s.JsonKey(name: 'count')
  final int count;

  /// The unique identifier for the event. Format:
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code>. Example: <code>Example:
  /// arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  @_s.JsonKey(name: 'eventArn')
  final String eventArn;

  EntityAggregate({
    this.count,
    this.eventArn,
  });
  factory EntityAggregate.fromJson(Map<String, dynamic> json) =>
      _$EntityAggregateFromJson(json);
}

/// The values to use to filter results from the <a>DescribeAffectedEntities</a>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EntityFilter {
  /// A list of event ARNs (unique identifiers). For example:
  /// <code>"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
  /// "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"</code>
  @_s.JsonKey(name: 'eventArns')
  final List<String> eventArns;

  /// A list of entity ARNs (unique identifiers).
  @_s.JsonKey(name: 'entityArns')
  final List<String> entityArns;

  /// A list of IDs for affected entities.
  @_s.JsonKey(name: 'entityValues')
  final List<String> entityValues;

  /// A list of the most recent dates and times that the entity was updated.
  @_s.JsonKey(name: 'lastUpdatedTimes')
  final List<DateTimeRange> lastUpdatedTimes;

  /// A list of entity status codes (<code>IMPAIRED</code>,
  /// <code>UNIMPAIRED</code>, or <code>UNKNOWN</code>).
  @_s.JsonKey(name: 'statusCodes')
  final List<String> statusCodes;

  /// A map of entity tags attached to the affected entity.
  @_s.JsonKey(name: 'tags')
  final List<Map<String, String>> tags;

  EntityFilter({
    @_s.required this.eventArns,
    this.entityArns,
    this.entityValues,
    this.lastUpdatedTimes,
    this.statusCodes,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$EntityFilterToJson(this);
}

/// Summary information about an AWS Health event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Event {
  /// The unique identifier for the event. Format:
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code>. Example: <code>Example:
  /// arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The AWS Availability Zone of the event. For example, us-east-1a.
  @_s.JsonKey(name: 'availabilityZone')
  final String availabilityZone;

  /// The date and time that the event ended.
  @_s.JsonKey(
      name: 'endTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime endTime;

  /// The category of the event. Possible values are <code>issue</code>,
  /// <code>scheduledChange</code>, and <code>accountNotification</code>.
  @_s.JsonKey(name: 'eventTypeCategory')
  final EventTypeCategory eventTypeCategory;

  /// The unique identifier for the event type. The format is
  /// <code>AWS_<i>SERVICE</i>_<i>DESCRIPTION</i> </code>; for example,
  /// <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>.
  @_s.JsonKey(name: 'eventTypeCode')
  final String eventTypeCode;

  /// The most recent date and time that the event was updated.
  @_s.JsonKey(
      name: 'lastUpdatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdatedTime;

  /// The AWS region name of the event.
  @_s.JsonKey(name: 'region')
  final String region;

  /// The AWS service that is affected by the event. For example,
  /// <code>EC2</code>, <code>RDS</code>.
  @_s.JsonKey(name: 'service')
  final String service;

  /// The date and time that the event began.
  @_s.JsonKey(
      name: 'startTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime startTime;

  /// The most recent status of the event. Possible values are <code>open</code>,
  /// <code>closed</code>, and <code>upcoming</code>.
  @_s.JsonKey(name: 'statusCode')
  final EventStatusCode statusCode;

  Event({
    this.arn,
    this.availabilityZone,
    this.endTime,
    this.eventTypeCategory,
    this.eventTypeCode,
    this.lastUpdatedTime,
    this.region,
    this.service,
    this.startTime,
    this.statusCode,
  });
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

/// The values used to filter results from the
/// <a>DescribeEventDetailsForOrganization</a> and
/// <a>DescribeAffectedEntitiesForOrganization</a> operations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EventAccountFilter {
  /// The 12-digit AWS account numbers that contains the affected entities.
  @_s.JsonKey(name: 'awsAccountId')
  final String awsAccountId;

  /// The unique identifier for the event. Format:
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code>. Example: <code>Example:
  /// arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  @_s.JsonKey(name: 'eventArn')
  final String eventArn;

  EventAccountFilter({
    @_s.required this.awsAccountId,
    @_s.required this.eventArn,
  });
  Map<String, dynamic> toJson() => _$EventAccountFilterToJson(this);
}

/// The number of events of each issue type. Returned by the
/// <a>DescribeEventAggregates</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventAggregate {
  /// The issue type for the associated count.
  @_s.JsonKey(name: 'aggregateValue')
  final String aggregateValue;

  /// The number of events of the associated issue type.
  @_s.JsonKey(name: 'count')
  final int count;

  EventAggregate({
    this.aggregateValue,
    this.count,
  });
  factory EventAggregate.fromJson(Map<String, dynamic> json) =>
      _$EventAggregateFromJson(json);
}

/// The detailed description of the event. Included in the information returned
/// by the <a>DescribeEventDetails</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventDescription {
  /// The most recent description of the event.
  @_s.JsonKey(name: 'latestDescription')
  final String latestDescription;

  EventDescription({
    this.latestDescription,
  });
  factory EventDescription.fromJson(Map<String, dynamic> json) =>
      _$EventDescriptionFromJson(json);
}

/// Detailed information about an event. A combination of an <a>Event</a>
/// object, an <a>EventDescription</a> object, and additional metadata about the
/// event. Returned by the <a>DescribeEventDetails</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventDetails {
  /// Summary information about the event.
  @_s.JsonKey(name: 'event')
  final Event event;

  /// The most recent description of the event.
  @_s.JsonKey(name: 'eventDescription')
  final EventDescription eventDescription;

  /// Additional metadata about the event.
  @_s.JsonKey(name: 'eventMetadata')
  final Map<String, String> eventMetadata;

  EventDetails({
    this.event,
    this.eventDescription,
    this.eventMetadata,
  });
  factory EventDetails.fromJson(Map<String, dynamic> json) =>
      _$EventDetailsFromJson(json);
}

/// Error information returned when a <a>DescribeEventDetails</a> operation
/// cannot find a specified event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventDetailsErrorItem {
  /// A message that describes the error.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// The name of the error.
  @_s.JsonKey(name: 'errorName')
  final String errorName;

  /// The unique identifier for the event. Format:
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code>. Example: <code>Example:
  /// arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  @_s.JsonKey(name: 'eventArn')
  final String eventArn;

  EventDetailsErrorItem({
    this.errorMessage,
    this.errorName,
    this.eventArn,
  });
  factory EventDetailsErrorItem.fromJson(Map<String, dynamic> json) =>
      _$EventDetailsErrorItemFromJson(json);
}

/// The values to use to filter results from the <a>DescribeEvents</a> and
/// <a>DescribeEventAggregates</a> operations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EventFilter {
  /// A list of AWS availability zones.
  @_s.JsonKey(name: 'availabilityZones')
  final List<String> availabilityZones;

  /// A list of dates and times that the event ended.
  @_s.JsonKey(name: 'endTimes')
  final List<DateTimeRange> endTimes;

  /// A list of entity ARNs (unique identifiers).
  @_s.JsonKey(name: 'entityArns')
  final List<String> entityArns;

  /// A list of entity identifiers, such as EC2 instance IDs
  /// (<code>i-34ab692e</code>) or EBS volumes (<code>vol-426ab23e</code>).
  @_s.JsonKey(name: 'entityValues')
  final List<String> entityValues;

  /// A list of event ARNs (unique identifiers). For example:
  /// <code>"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
  /// "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"</code>
  @_s.JsonKey(name: 'eventArns')
  final List<String> eventArns;

  /// A list of event status codes.
  @_s.JsonKey(name: 'eventStatusCodes')
  final List<String> eventStatusCodes;

  /// A list of event type category codes (<code>issue</code>,
  /// <code>scheduledChange</code>, or <code>accountNotification</code>).
  @_s.JsonKey(name: 'eventTypeCategories')
  final List<String> eventTypeCategories;

  /// A list of unique identifiers for event types. For example,
  /// <code>"AWS_EC2_SYSTEM_MAINTENANCE_EVENT","AWS_RDS_MAINTENANCE_SCHEDULED".</code>
  @_s.JsonKey(name: 'eventTypeCodes')
  final List<String> eventTypeCodes;

  /// A list of dates and times that the event was last updated.
  @_s.JsonKey(name: 'lastUpdatedTimes')
  final List<DateTimeRange> lastUpdatedTimes;

  /// A list of AWS regions.
  @_s.JsonKey(name: 'regions')
  final List<String> regions;

  /// The AWS services associated with the event. For example, <code>EC2</code>,
  /// <code>RDS</code>.
  @_s.JsonKey(name: 'services')
  final List<String> services;

  /// A list of dates and times that the event began.
  @_s.JsonKey(name: 'startTimes')
  final List<DateTimeRange> startTimes;

  /// A map of entity tags attached to the affected entity.
  @_s.JsonKey(name: 'tags')
  final List<Map<String, String>> tags;

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
  Map<String, dynamic> toJson() => _$EventFilterToJson(this);
}

/// Metadata about a type of event that is reported by AWS Health. Data consists
/// of the category (for example, <code>issue</code>), the service (for example,
/// <code>EC2</code>), and the event type code (for example,
/// <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventType {
  /// A list of event type category codes (<code>issue</code>,
  /// <code>scheduledChange</code>, or <code>accountNotification</code>).
  @_s.JsonKey(name: 'category')
  final EventTypeCategory category;

  /// The unique identifier for the event type. The format is
  /// <code>AWS_<i>SERVICE</i>_<i>DESCRIPTION</i> </code>; for example,
  /// <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>.
  @_s.JsonKey(name: 'code')
  final String code;

  /// The AWS service that is affected by the event. For example,
  /// <code>EC2</code>, <code>RDS</code>.
  @_s.JsonKey(name: 'service')
  final String service;

  EventType({
    this.category,
    this.code,
    this.service,
  });
  factory EventType.fromJson(Map<String, dynamic> json) =>
      _$EventTypeFromJson(json);
}

/// The values to use to filter results from the <a>DescribeEventTypes</a>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EventTypeFilter {
  /// A list of event type category codes (<code>issue</code>,
  /// <code>scheduledChange</code>, or <code>accountNotification</code>).
  @_s.JsonKey(name: 'eventTypeCategories')
  final List<String> eventTypeCategories;

  /// A list of event type codes.
  @_s.JsonKey(name: 'eventTypeCodes')
  final List<String> eventTypeCodes;

  /// The AWS services associated with the event. For example, <code>EC2</code>,
  /// <code>RDS</code>.
  @_s.JsonKey(name: 'services')
  final List<String> services;

  EventTypeFilter({
    this.eventTypeCategories,
    this.eventTypeCodes,
    this.services,
  });
  Map<String, dynamic> toJson() => _$EventTypeFilterToJson(this);
}

/// Error information returned when a
/// <a>DescribeAffectedEntitiesForOrganization</a> operation cannot find or
/// process a specific entity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OrganizationAffectedEntitiesErrorItem {
  /// The 12-digit AWS account numbers that contains the affected entities.
  @_s.JsonKey(name: 'awsAccountId')
  final String awsAccountId;

  /// The unique identifier for the event type. The format is
  /// <code>AWS_SERVICE_DESCRIPTION</code>. For example,
  /// <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// The name of the error.
  @_s.JsonKey(name: 'errorName')
  final String errorName;

  /// The unique identifier for the event. Format:
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code>. Example: <code>Example:
  /// arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  @_s.JsonKey(name: 'eventArn')
  final String eventArn;

  OrganizationAffectedEntitiesErrorItem({
    this.awsAccountId,
    this.errorMessage,
    this.errorName,
    this.eventArn,
  });
  factory OrganizationAffectedEntitiesErrorItem.fromJson(
          Map<String, dynamic> json) =>
      _$OrganizationAffectedEntitiesErrorItemFromJson(json);
}

/// Summary information about an event, returned by the
/// <a>DescribeEventsForOrganization</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OrganizationEvent {
  /// The unique identifier for the event. Format:
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code>. Example: <code>Example:
  /// arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date and time that the event ended.
  @_s.JsonKey(
      name: 'endTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime endTime;

  /// The category of the event type.
  @_s.JsonKey(name: 'eventTypeCategory')
  final EventTypeCategory eventTypeCategory;

  /// The unique identifier for the event type. The format is
  /// <code>AWS_SERVICE_DESCRIPTION</code>. For example,
  /// <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>.
  @_s.JsonKey(name: 'eventTypeCode')
  final String eventTypeCode;

  /// The most recent date and time that the event was updated.
  @_s.JsonKey(
      name: 'lastUpdatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdatedTime;

  /// The AWS Region name of the event.
  @_s.JsonKey(name: 'region')
  final String region;

  /// The AWS service that is affected by the event. For example, EC2, RDS.
  @_s.JsonKey(name: 'service')
  final String service;

  /// The date and time that the event began.
  @_s.JsonKey(
      name: 'startTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime startTime;

  /// The most recent status of the event. Possible values are <code>open</code>,
  /// <code>closed</code>, and <code>upcoming</code>.
  @_s.JsonKey(name: 'statusCode')
  final EventStatusCode statusCode;

  OrganizationEvent({
    this.arn,
    this.endTime,
    this.eventTypeCategory,
    this.eventTypeCode,
    this.lastUpdatedTime,
    this.region,
    this.service,
    this.startTime,
    this.statusCode,
  });
  factory OrganizationEvent.fromJson(Map<String, dynamic> json) =>
      _$OrganizationEventFromJson(json);
}

/// Detailed information about an event. A combination of an <a>Event</a>
/// object, an <a>EventDescription</a> object, and additional metadata about the
/// event. Returned by the <a>DescribeEventDetailsForOrganization</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OrganizationEventDetails {
  /// The 12-digit AWS account numbers that contains the affected entities.
  @_s.JsonKey(name: 'awsAccountId')
  final String awsAccountId;
  @_s.JsonKey(name: 'event')
  final Event event;
  @_s.JsonKey(name: 'eventDescription')
  final EventDescription eventDescription;

  /// Additional metadata about the event.
  @_s.JsonKey(name: 'eventMetadata')
  final Map<String, String> eventMetadata;

  OrganizationEventDetails({
    this.awsAccountId,
    this.event,
    this.eventDescription,
    this.eventMetadata,
  });
  factory OrganizationEventDetails.fromJson(Map<String, dynamic> json) =>
      _$OrganizationEventDetailsFromJson(json);
}

/// Error information returned when a <a>DescribeEventDetailsForOrganization</a>
/// operation cannot find a specified event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OrganizationEventDetailsErrorItem {
  /// Error information returned when a <a>DescribeEventDetailsForOrganization</a>
  /// operation cannot find a specified event.
  @_s.JsonKey(name: 'awsAccountId')
  final String awsAccountId;

  /// A message that describes the error.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// The name of the error.
  @_s.JsonKey(name: 'errorName')
  final String errorName;

  /// The unique identifier for the event. Format:
  /// <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i>
  /// </code>. Example: <code>Example:
  /// arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code>
  @_s.JsonKey(name: 'eventArn')
  final String eventArn;

  OrganizationEventDetailsErrorItem({
    this.awsAccountId,
    this.errorMessage,
    this.errorName,
    this.eventArn,
  });
  factory OrganizationEventDetailsErrorItem.fromJson(
          Map<String, dynamic> json) =>
      _$OrganizationEventDetailsErrorItemFromJson(json);
}

/// The values to filter results from the <a>DescribeEventsForOrganization</a>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OrganizationEventFilter {
  /// A list of 12-digit AWS account numbers that contains the affected entities.
  @_s.JsonKey(name: 'awsAccountIds')
  final List<String> awsAccountIds;
  @_s.JsonKey(name: 'endTime')
  final DateTimeRange endTime;

  /// REPLACEME
  @_s.JsonKey(name: 'entityArns')
  final List<String> entityArns;

  /// A list of entity identifiers, such as EC2 instance IDs (i-34ab692e) or EBS
  /// volumes (vol-426ab23e).
  @_s.JsonKey(name: 'entityValues')
  final List<String> entityValues;

  /// A list of event status codes.
  @_s.JsonKey(name: 'eventStatusCodes')
  final List<String> eventStatusCodes;

  /// REPLACEME
  @_s.JsonKey(name: 'eventTypeCategories')
  final List<String> eventTypeCategories;

  /// A list of unique identifiers for event types. For example,
  /// <code>"AWS_EC2_SYSTEM_MAINTENANCE_EVENT","AWS_RDS_MAINTENANCE_SCHEDULED".</code>
  @_s.JsonKey(name: 'eventTypeCodes')
  final List<String> eventTypeCodes;
  @_s.JsonKey(name: 'lastUpdatedTime')
  final DateTimeRange lastUpdatedTime;

  /// A list of AWS Regions.
  @_s.JsonKey(name: 'regions')
  final List<String> regions;

  /// The AWS services associated with the event. For example, <code>EC2</code>,
  /// <code>RDS</code>.
  @_s.JsonKey(name: 'services')
  final List<String> services;
  @_s.JsonKey(name: 'startTime')
  final DateTimeRange startTime;

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
  Map<String, dynamic> toJson() => _$OrganizationEventFilterToJson(this);
}

enum EntityStatusCode {
  @_s.JsonValue('IMPAIRED')
  impaired,
  @_s.JsonValue('UNIMPAIRED')
  unimpaired,
  @_s.JsonValue('UNKNOWN')
  unknown,
}

enum EventAggregateField {
  @_s.JsonValue('eventTypeCategory')
  eventTypeCategory,
}

extension on EventAggregateField {
  String toValue() {
    switch (this) {
      case EventAggregateField.eventTypeCategory:
        return 'eventTypeCategory';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum EventStatusCode {
  @_s.JsonValue('open')
  open,
  @_s.JsonValue('closed')
  closed,
  @_s.JsonValue('upcoming')
  upcoming,
}

enum EventTypeCategory {
  @_s.JsonValue('issue')
  issue,
  @_s.JsonValue('accountNotification')
  accountNotification,
  @_s.JsonValue('scheduledChange')
  scheduledChange,
  @_s.JsonValue('investigation')
  investigation,
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class InvalidPaginationToken extends _s.GenericAwsException {
  InvalidPaginationToken({String type, String message})
      : super(type: type, code: 'InvalidPaginationToken', message: message);
}

class UnsupportedLocale extends _s.GenericAwsException {
  UnsupportedLocale({String type, String message})
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
