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

part '2020-12-01.g.dart';

/// Amazon DevOps Guru is a fully managed service that helps you identify
/// anomalous behavior in business critical operational applications. You
/// specify the AWS resources that you want DevOps Guru to cover, then the
/// Amazon CloudWatch metrics and AWS CloudTrail events related to those
/// resources are analyzed. When anomalous behavior is detected, DevOps Guru
/// creates an <i>insight</i> that includes recommendations, related events, and
/// related metrics that can help you improve your operational applications. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/welcome.html">What
/// is Amazon DevOps Guru</a>.
///
/// You can specify 1 or 2 Amazon Simple Notification Service topics so you are
/// notified every time a new insight is created. You can also enable DevOps
/// Guru to generate an OpsItem in AWS Systems Manager for each insight to help
/// you manage and track your work addressing insights.
///
/// To learn about the DevOps Guru workflow, see <a
/// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/welcome.html#how-it-works">How
/// DevOps Guru works</a>. To learn about DevOps Guru concepts, see <a
/// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/concepts.html">Concepts
/// in DevOps Guru</a>.
class DevOpsGuru {
  final _s.RestJsonProtocol _protocol;
  DevOpsGuru({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'devops-guru',
            signingName: 'devops-guru',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds a notification channel to DevOps Guru. A notification channel is used
  /// to notify you about important DevOps Guru events, such as when an insight
  /// is generated.
  ///
  /// If you use an Amazon SNS topic in another account, you must attach a
  /// policy to it that grants DevOps Guru permission to it notifications.
  /// DevOps Guru adds the required policy on your behalf to send notifications
  /// using Amazon SNS in your account. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-required-permissions.html">Permissions
  /// for cross account Amazon SNS topics</a>.
  ///
  /// If you use an Amazon SNS topic that is encrypted by an AWS Key Management
  /// Service customer-managed key (CMK), then you must add permissions to the
  /// CMK. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-kms-permissions.html">Permissions
  /// for AWS KMS–encrypted Amazon SNS topics</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [config] :
  /// A <code>NotificationChannelConfig</code> object that specifies what type
  /// of notification channel to add. The one supported notification channel is
  /// Amazon Simple Notification Service (Amazon SNS).
  Future<AddNotificationChannelResponse> addNotificationChannel({
    @_s.required NotificationChannelConfig config,
  }) async {
    ArgumentError.checkNotNull(config, 'config');
    final $payload = <String, dynamic>{
      'Config': config,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/channels',
      exceptionFnMap: _exceptionFns,
    );
    return AddNotificationChannelResponse.fromJson(response);
  }

  /// Returns the number of open reactive insights, the number of open proactive
  /// insights, and the number of metrics analyzed in your AWS account. Use
  /// these numbers to gauge the health of operations in your AWS account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<DescribeAccountHealthResponse> describeAccountHealth() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts/health',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAccountHealthResponse.fromJson(response);
  }

  /// For the time range passed in, returns the number of open reactive insight
  /// that were created, the number of open proactive insights that were
  /// created, and the Mean Time to Recover (MTTR) for all closed reactive
  /// insights.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fromTime] :
  /// The start of the time range passed in. The start time granularity is at
  /// the day level. The floor of the start time is used. Returned information
  /// occurred after this day.
  ///
  /// Parameter [toTime] :
  /// The end of the time range passed in. The start time granularity is at the
  /// day level. The floor of the start time is used. Returned information
  /// occurred before this day. If this is not specified, then the current day
  /// is used.
  Future<DescribeAccountOverviewResponse> describeAccountOverview({
    @_s.required DateTime fromTime,
    DateTime toTime,
  }) async {
    ArgumentError.checkNotNull(fromTime, 'fromTime');
    final $payload = <String, dynamic>{
      'FromTime': unixTimestampToJson(fromTime),
      if (toTime != null) 'ToTime': unixTimestampToJson(toTime),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accounts/overview',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAccountOverviewResponse.fromJson(response);
  }

  /// Returns details about an anomaly that you specify using its ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the anomaly.
  Future<DescribeAnomalyResponse> describeAnomaly({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[\w-]*$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/anomalies/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAnomalyResponse.fromJson(response);
  }

  /// Returns details about an insight that you specify using its ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the insight.
  Future<DescribeInsightResponse> describeInsight({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[\w-]*$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/insights/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeInsightResponse.fromJson(response);
  }

  /// Returns the number of open proactive insights, open reactive insights, and
  /// the Mean Time to Recover (MTTR) for all closed insights in resource
  /// collections in your account. You specify the type of AWS resources
  /// collection. The one type of AWS resource collection supported is AWS
  /// CloudFormation stacks. DevOps Guru can be configured to analyze only the
  /// AWS resources that are defined in the stacks.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceCollectionType] :
  /// An AWS resource collection type. This type specifies how analyzed AWS
  /// resources are defined. The one type of AWS resource collection supported
  /// is AWS CloudFormation stacks. DevOps Guru can be configured to analyze
  /// only the AWS resources that are defined in the stacks.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<DescribeResourceCollectionHealthResponse>
      describeResourceCollectionHealth({
    @_s.required ResourceCollectionType resourceCollectionType,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        resourceCollectionType, 'resourceCollectionType');
    _s.validateStringLength(
      'nextToken',
      nextToken,
      36,
      36,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
    );
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/health/resource-collection/${Uri.encodeComponent(resourceCollectionType.toValue())}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeResourceCollectionHealthResponse.fromJson(response);
  }

  /// Returns the integration status of services that are integrated with DevOps
  /// Guru. The one service that can be integrated with DevOps Guru is AWS
  /// Systems Manager, which can be used to create an OpsItem for each generated
  /// insight.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<DescribeServiceIntegrationResponse>
      describeServiceIntegration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/service-integrations',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeServiceIntegrationResponse.fromJson(response);
  }

  /// Returns lists AWS resources that are of the specified resource collection
  /// type. The one type of AWS resource collection supported is AWS
  /// CloudFormation stacks. DevOps Guru can be configured to analyze only the
  /// AWS resources that are defined in the stacks.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceCollectionType] :
  /// The type of AWS resource collections to return. The one valid value is
  /// <code>CLOUD_FORMATION</code> for AWS CloudFormation stacks.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<GetResourceCollectionResponse> getResourceCollection({
    @_s.required ResourceCollectionType resourceCollectionType,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        resourceCollectionType, 'resourceCollectionType');
    _s.validateStringLength(
      'nextToken',
      nextToken,
      36,
      36,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
    );
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/resource-collections/${Uri.encodeComponent(resourceCollectionType.toValue())}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceCollectionResponse.fromJson(response);
  }

  /// Returns a list of the anomalies that belong to an insight that you specify
  /// using its ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [insightId] :
  /// The ID of the insight. The returned anomalies belong to this insight.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  ///
  /// Parameter [startTimeRange] :
  /// A time range used to specify when the requested anomalies started. All
  /// returned anomalies started during this time range.
  Future<ListAnomaliesForInsightResponse> listAnomaliesForInsight({
    @_s.required String insightId,
    int maxResults,
    String nextToken,
    StartTimeRange startTimeRange,
  }) async {
    ArgumentError.checkNotNull(insightId, 'insightId');
    _s.validateStringLength(
      'insightId',
      insightId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'insightId',
      insightId,
      r'''^[\w-]*$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      36,
      36,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (startTimeRange != null) 'StartTimeRange': startTimeRange,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/anomalies/insight/${Uri.encodeComponent(insightId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListAnomaliesForInsightResponse.fromJson(response);
  }

  /// Returns a list of the events emitted by the resources that are evaluated
  /// by DevOps Guru. You can use filters to specify which events are returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// A <code>ListEventsFilters</code> object used to specify which events to
  /// return.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<ListEventsResponse> listEvents({
    @_s.required ListEventsFilters filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(filters, 'filters');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      36,
      36,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
    );
    final $payload = <String, dynamic>{
      'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/events',
      exceptionFnMap: _exceptionFns,
    );
    return ListEventsResponse.fromJson(response);
  }

  /// Returns a list of insights in your AWS account. You can specify which
  /// insights are returned by their start time and status
  /// (<code>ONGOING</code>, <code>CLOSED</code>, or <code>ANY</code>).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [statusFilter] :
  /// A filter used to filter the returned insights by their status. You can
  /// specify one status filter.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<ListInsightsResponse> listInsights({
    @_s.required ListInsightsStatusFilter statusFilter,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(statusFilter, 'statusFilter');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      36,
      36,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
    );
    final $payload = <String, dynamic>{
      'StatusFilter': statusFilter,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/insights',
      exceptionFnMap: _exceptionFns,
    );
    return ListInsightsResponse.fromJson(response);
  }

  /// Returns a list of notification channels configured for DevOps Guru. Each
  /// notification channel is used to notify you when DevOps Guru generates an
  /// insight that contains information about how to improve your operations.
  /// The one supported notification channel is Amazon Simple Notification
  /// Service (Amazon SNS).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<ListNotificationChannelsResponse> listNotificationChannels({
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      36,
      36,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
    );
    final $payload = <String, dynamic>{
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channels',
      exceptionFnMap: _exceptionFns,
    );
    return ListNotificationChannelsResponse.fromJson(response);
  }

  /// Returns a list of a specified insight's recommendations. Each
  /// recommendation includes a list of related metrics and a list of related
  /// events.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [insightId] :
  /// The ID of the requested insight.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<ListRecommendationsResponse> listRecommendations({
    @_s.required String insightId,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(insightId, 'insightId');
    _s.validateStringLength(
      'insightId',
      insightId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'insightId',
      insightId,
      r'''^[\w-]*$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      36,
      36,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
    );
    final $payload = <String, dynamic>{
      'InsightId': insightId,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/recommendations',
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommendationsResponse.fromJson(response);
  }

  /// Collects customer feedback about the specified insight.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [insightFeedback] :
  /// The feedback from customers is about the recommendations in this insight.
  Future<void> putFeedback({
    InsightFeedback insightFeedback,
  }) async {
    final $payload = <String, dynamic>{
      if (insightFeedback != null) 'InsightFeedback': insightFeedback,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/feedback',
      exceptionFnMap: _exceptionFns,
    );
    return PutFeedbackResponse.fromJson(response);
  }

  /// Removes a notification channel from DevOps Guru. A notification channel is
  /// used to notify you when DevOps Guru generates an insight that contains
  /// information about how to improve your operations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the notification channel to be removed.
  Future<void> removeNotificationChannel({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/channels/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return RemoveNotificationChannelResponse.fromJson(response);
  }

  /// Returns a list of insights in your AWS account. You can specify which
  /// insights are returned by their start time, one or more statuses
  /// (<code>ONGOING</code>, <code>CLOSED</code>, and <code>CLOSED</code>), one
  /// or more severities (<code>LOW</code>, <code>MEDIUM</code>, and
  /// <code>HIGH</code>), and type (<code>REACTIVE</code> or
  /// <code>PROACTIVE</code>).
  ///
  /// Use the <code>Filters</code> parameter to specify status and severity
  /// search parameters. Use the <code>Type</code> parameter to specify
  /// <code>REACTIVE</code> or <code>PROACTIVE</code> in your search.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [startTimeRange] :
  /// The start of the time range passed in. Returned insights occurred after
  /// this time.
  ///
  /// Parameter [type] :
  /// The type of insights you are searching for (<code>REACTIVE</code> or
  /// <code>PROACTIVE</code>).
  ///
  /// Parameter [filters] :
  /// A <code>SearchInsightsFilters</code> object that is used to set the
  /// severity and status filters on your insight search.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<SearchInsightsResponse> searchInsights({
    @_s.required StartTimeRange startTimeRange,
    @_s.required InsightType type,
    SearchInsightsFilters filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(startTimeRange, 'startTimeRange');
    ArgumentError.checkNotNull(type, 'type');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      36,
      36,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
    );
    final $payload = <String, dynamic>{
      'StartTimeRange': startTimeRange,
      'Type': type?.toValue() ?? '',
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/insights/search',
      exceptionFnMap: _exceptionFns,
    );
    return SearchInsightsResponse.fromJson(response);
  }

  /// Updates the collection of resources that DevOps Guru analyzes. The one
  /// type of AWS resource collection supported is AWS CloudFormation stacks.
  /// DevOps Guru can be configured to analyze only the AWS resources that are
  /// defined in the stacks. This method also creates the IAM role required for
  /// you to use DevOps Guru.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// Specifies if the resource collection in the request is added or deleted to
  /// the resource collection.
  Future<void> updateResourceCollection({
    @_s.required UpdateResourceCollectionAction action,
    @_s.required UpdateResourceCollectionFilter resourceCollection,
  }) async {
    ArgumentError.checkNotNull(action, 'action');
    ArgumentError.checkNotNull(resourceCollection, 'resourceCollection');
    final $payload = <String, dynamic>{
      'Action': action?.toValue() ?? '',
      'ResourceCollection': resourceCollection,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/resource-collections',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateResourceCollectionResponse.fromJson(response);
  }

  /// Enables or disables integration with a service that can be integrated with
  /// DevOps Guru. The one service that can be integrated with DevOps Guru is
  /// AWS Systems Manager, which can be used to create an OpsItem for each
  /// generated insight.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceIntegration] :
  /// An <code>IntegratedServiceConfig</code> object used to specify the
  /// integrated service you want to update, and whether you want to update it
  /// to enabled or disabled.
  Future<void> updateServiceIntegration({
    @_s.required UpdateServiceIntegrationConfig serviceIntegration,
  }) async {
    ArgumentError.checkNotNull(serviceIntegration, 'serviceIntegration');
    final $payload = <String, dynamic>{
      'ServiceIntegration': serviceIntegration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/service-integrations',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateServiceIntegrationResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddNotificationChannelResponse {
  /// The ID of the added notification channel.
  @_s.JsonKey(name: 'Id')
  final String id;

  AddNotificationChannelResponse({
    @_s.required this.id,
  });
  factory AddNotificationChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$AddNotificationChannelResponseFromJson(json);
}

enum AnomalySeverity {
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('HIGH')
  high,
}

/// Details about the source of the anomalous operational data that triggered
/// the anomaly. The one supported source is Amazon CloudWatch metrics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AnomalySourceDetails {
  /// An array of <code>CloudWatchMetricsDetail</code> object that contains
  /// information about the analyzed metrics that displayed anomalous behavior.
  @_s.JsonKey(name: 'CloudWatchMetrics')
  final List<CloudWatchMetricsDetail> cloudWatchMetrics;

  AnomalySourceDetails({
    this.cloudWatchMetrics,
  });
  factory AnomalySourceDetails.fromJson(Map<String, dynamic> json) =>
      _$AnomalySourceDetailsFromJson(json);
}

enum AnomalyStatus {
  @_s.JsonValue('ONGOING')
  ongoing,
  @_s.JsonValue('CLOSED')
  closed,
}

/// A time range that specifies when the observed unusual behavior in an anomaly
/// started and ended.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AnomalyTimeRange {
  /// The time when the anomalous behavior started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The time when the anomalous behavior ended.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  AnomalyTimeRange({
    @_s.required this.startTime,
    this.endTime,
  });
  factory AnomalyTimeRange.fromJson(Map<String, dynamic> json) =>
      _$AnomalyTimeRangeFromJson(json);
}

/// Information about AWS CloudFormation stacks. You can use stacks to specify
/// which AWS resources in your account to analyze. For more information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html">Stacks</a>
/// in the <i>AWS CloudFormation User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CloudFormationCollection {
  /// An array of CloudFormation stack names.
  @_s.JsonKey(name: 'StackNames')
  final List<String> stackNames;

  CloudFormationCollection({
    this.stackNames,
  });
  factory CloudFormationCollection.fromJson(Map<String, dynamic> json) =>
      _$CloudFormationCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CloudFormationCollectionToJson(this);
}

/// Information about AWS CloudFormation stacks. You can use stacks to specify
/// which AWS resources in your account to analyze. For more information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html">Stacks</a>
/// in the <i>AWS CloudFormation User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloudFormationCollectionFilter {
  /// An array of CloudFormation stack names.
  @_s.JsonKey(name: 'StackNames')
  final List<String> stackNames;

  CloudFormationCollectionFilter({
    this.stackNames,
  });
  factory CloudFormationCollectionFilter.fromJson(Map<String, dynamic> json) =>
      _$CloudFormationCollectionFilterFromJson(json);
}

/// Information about the health of AWS resources in your account that are
/// specified by an AWS CloudFormation stack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloudFormationHealth {
  /// Information about the health of the AWS resources in your account that are
  /// specified by an AWS CloudFormation stack, including the number of open
  /// proactive, open reactive insights, and the Mean Time to Recover (MTTR) of
  /// closed insights.
  @_s.JsonKey(name: 'Insight')
  final InsightHealth insight;

  /// The name of the CloudFormation stack.
  @_s.JsonKey(name: 'StackName')
  final String stackName;

  CloudFormationHealth({
    this.insight,
    this.stackName,
  });
  factory CloudFormationHealth.fromJson(Map<String, dynamic> json) =>
      _$CloudFormationHealthFromJson(json);
}

/// Information about an Amazon CloudWatch metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloudWatchMetricsDetail {
  /// An array of CloudWatch dimensions associated with
  @_s.JsonKey(name: 'Dimensions')
  final List<CloudWatchMetricsDimension> dimensions;

  /// The name of the CloudWatch metric.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// The namespace of the CloudWatch metric. A namespace is a container for
  /// CloudWatch metrics.
  @_s.JsonKey(name: 'Namespace')
  final String namespace;

  /// The length of time associated with the CloudWatch metric in number of
  /// seconds.
  @_s.JsonKey(name: 'Period')
  final int period;

  /// The type of statistic associated with the CloudWatch metric. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Statistic">Statistics</a>
  /// in the <i>Amazon CloudWatch User Guide</i>.
  @_s.JsonKey(name: 'Stat')
  final CloudWatchMetricsStat stat;

  /// The unit of measure used for the CloudWatch metric. For example,
  /// <code>Bytes</code>, <code>Seconds</code>, <code>Count</code>, and
  /// <code>Percent</code>.
  @_s.JsonKey(name: 'Unit')
  final String unit;

  CloudWatchMetricsDetail({
    this.dimensions,
    this.metricName,
    this.namespace,
    this.period,
    this.stat,
    this.unit,
  });
  factory CloudWatchMetricsDetail.fromJson(Map<String, dynamic> json) =>
      _$CloudWatchMetricsDetailFromJson(json);
}

/// The dimension of a Amazon CloudWatch metric that is used when DevOps Guru
/// analyzes the resources in your account for operational problems and
/// anomalous behaviour. A dimension is a name/value pair that is part of the
/// identity of a metric. A metric can have up to 10 dimensions. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Dimension">Dimensions</a>
/// in the <i>Amazon CloudWatch User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloudWatchMetricsDimension {
  /// The name of the CloudWatch dimension.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The value of the CloudWatch dimension.
  @_s.JsonKey(name: 'Value')
  final String value;

  CloudWatchMetricsDimension({
    this.name,
    this.value,
  });
  factory CloudWatchMetricsDimension.fromJson(Map<String, dynamic> json) =>
      _$CloudWatchMetricsDimensionFromJson(json);
}

enum CloudWatchMetricsStat {
  @_s.JsonValue('Sum')
  sum,
  @_s.JsonValue('Average')
  average,
  @_s.JsonValue('SampleCount')
  sampleCount,
  @_s.JsonValue('Minimum')
  minimum,
  @_s.JsonValue('Maximum')
  maximum,
  @_s.JsonValue('p99')
  p99,
  @_s.JsonValue('p90')
  p90,
  @_s.JsonValue('p50')
  p50,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAccountHealthResponse {
  /// An integer that specifies the number of metrics that have been analyzed in
  /// your AWS account.
  @_s.JsonKey(name: 'MetricsAnalyzed')
  final int metricsAnalyzed;

  /// An integer that specifies the number of open proactive insights in your AWS
  /// account.
  @_s.JsonKey(name: 'OpenProactiveInsights')
  final int openProactiveInsights;

  /// An integer that specifies the number of open reactive insights in your AWS
  /// account.
  @_s.JsonKey(name: 'OpenReactiveInsights')
  final int openReactiveInsights;

  DescribeAccountHealthResponse({
    @_s.required this.metricsAnalyzed,
    @_s.required this.openProactiveInsights,
    @_s.required this.openReactiveInsights,
  });
  factory DescribeAccountHealthResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAccountHealthResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAccountOverviewResponse {
  /// The Mean Time to Recover (MTTR) for all closed insights that were created
  /// during the time range passed in.
  @_s.JsonKey(name: 'MeanTimeToRecoverInMilliseconds')
  final int meanTimeToRecoverInMilliseconds;

  /// An integer that specifies the number of open proactive insights in your AWS
  /// account that were created during the time range passed in.
  @_s.JsonKey(name: 'ProactiveInsights')
  final int proactiveInsights;

  /// An integer that specifies the number of open reactive insights in your AWS
  /// account that were created during the time range passed in.
  @_s.JsonKey(name: 'ReactiveInsights')
  final int reactiveInsights;

  DescribeAccountOverviewResponse({
    @_s.required this.meanTimeToRecoverInMilliseconds,
    @_s.required this.proactiveInsights,
    @_s.required this.reactiveInsights,
  });
  factory DescribeAccountOverviewResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAccountOverviewResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAnomalyResponse {
  /// An <code>ReactiveAnomaly</code> object that represents the requested
  /// anomaly.
  @_s.JsonKey(name: 'ProactiveAnomaly')
  final ProactiveAnomaly proactiveAnomaly;

  /// An <code>ProactiveAnomaly</code> object that represents the requested
  /// anomaly.
  @_s.JsonKey(name: 'ReactiveAnomaly')
  final ReactiveAnomaly reactiveAnomaly;

  DescribeAnomalyResponse({
    this.proactiveAnomaly,
    this.reactiveAnomaly,
  });
  factory DescribeAnomalyResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAnomalyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInsightResponse {
  /// An <code>ProactiveInsight</code> object that represents the requested
  /// insight.
  @_s.JsonKey(name: 'ProactiveInsight')
  final ProactiveInsight proactiveInsight;

  /// An <code>ReactiveInsight</code> object that represents the requested
  /// insight.
  @_s.JsonKey(name: 'ReactiveInsight')
  final ReactiveInsight reactiveInsight;

  DescribeInsightResponse({
    this.proactiveInsight,
    this.reactiveInsight,
  });
  factory DescribeInsightResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeInsightResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeResourceCollectionHealthResponse {
  /// The returned <code>CloudFormationHealthOverview</code> object that contains
  /// an <code>InsightHealthOverview</code> object with the requested system
  /// health information.
  @_s.JsonKey(name: 'CloudFormation')
  final List<CloudFormationHealth> cloudFormation;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeResourceCollectionHealthResponse({
    @_s.required this.cloudFormation,
    this.nextToken,
  });
  factory DescribeResourceCollectionHealthResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeResourceCollectionHealthResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeServiceIntegrationResponse {
  @_s.JsonKey(name: 'ServiceIntegration')
  final ServiceIntegrationConfig serviceIntegration;

  DescribeServiceIntegrationResponse({
    this.serviceIntegration,
  });
  factory DescribeServiceIntegrationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeServiceIntegrationResponseFromJson(json);
}

/// A range of time that specifies when anomalous behavior in an anomaly or
/// insight ended.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EndTimeRange {
  /// The earliest end time in the time range.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FromTime')
  final DateTime fromTime;

  /// The latest end time in the time range.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ToTime')
  final DateTime toTime;

  EndTimeRange({
    this.fromTime,
    this.toTime,
  });
  Map<String, dynamic> toJson() => _$EndTimeRangeToJson(this);
}

/// An AWS resource event. AWS resource events and metrics are analyzed by
/// DevOps Guru to find anomalous behavior and provide recommendations to
/// improve your operational solutions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Event {
  /// The source, <code>AWS_CLOUD_TRAIL</code> or <code>AWS_CODE_DEPLOY</code>,
  /// where DevOps Guru analysis found the event.
  @_s.JsonKey(name: 'DataSource')
  final EventDataSource dataSource;

  /// The class of the event. The class specifies what the event is related to,
  /// such as an infrastructure change, a deployment, or a schema change.
  @_s.JsonKey(name: 'EventClass')
  final EventClass eventClass;

  /// The AWS source that emitted the event.
  @_s.JsonKey(name: 'EventSource')
  final String eventSource;

  /// The ID of the event.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the event.
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'ResourceCollection')
  final ResourceCollection resourceCollection;

  /// An <code>EventResource</code> object that contains information about the
  /// resource that emitted the event.
  @_s.JsonKey(name: 'Resources')
  final List<EventResource> resources;

  /// A <code>Timestamp</code> that specifies the time the event occurred.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Time')
  final DateTime time;

  Event({
    this.dataSource,
    this.eventClass,
    this.eventSource,
    this.id,
    this.name,
    this.resourceCollection,
    this.resources,
    this.time,
  });
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

enum EventClass {
  @_s.JsonValue('INFRASTRUCTURE')
  infrastructure,
  @_s.JsonValue('DEPLOYMENT')
  deployment,
  @_s.JsonValue('SECURITY_CHANGE')
  securityChange,
  @_s.JsonValue('CONFIG_CHANGE')
  configChange,
  @_s.JsonValue('SCHEMA_CHANGE')
  schemaChange,
}

enum EventDataSource {
  @_s.JsonValue('AWS_CLOUD_TRAIL')
  awsCloudTrail,
  @_s.JsonValue('AWS_CODE_DEPLOY')
  awsCodeDeploy,
}

/// The AWS resource that emitted an event. AWS resource events and metrics are
/// analyzed by DevOps Guru to find anomalous behavior and provide
/// recommendations to improve your operational solutions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventResource {
  /// The Amazon Resource Name (ARN) of the resource that emitted an event.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The name of the resource that emitted an event.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of resource that emitted an event.
  @_s.JsonKey(name: 'Type')
  final String type;

  EventResource({
    this.arn,
    this.name,
    this.type,
  });
  factory EventResource.fromJson(Map<String, dynamic> json) =>
      _$EventResourceFromJson(json);
}

/// The time range during which an AWS event occurred. AWS resource events and
/// metrics are analyzed by DevOps Guru to find anomalous behavior and provide
/// recommendations to improve your operational solutions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EventTimeRange {
  /// The time when the event started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FromTime')
  final DateTime fromTime;

  /// The time when the event ended.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ToTime')
  final DateTime toTime;

  EventTimeRange({
    @_s.required this.fromTime,
    @_s.required this.toTime,
  });
  Map<String, dynamic> toJson() => _$EventTimeRangeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResourceCollectionResponse {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The requested list of AWS resource collections. The one type of AWS resource
  /// collection supported is AWS CloudFormation stacks. DevOps Guru can be
  /// configured to analyze only the AWS resources that are defined in the stacks.
  @_s.JsonKey(name: 'ResourceCollection')
  final ResourceCollectionFilter resourceCollection;

  GetResourceCollectionResponse({
    this.nextToken,
    this.resourceCollection,
  });
  factory GetResourceCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResourceCollectionResponseFromJson(json);
}

/// Information about insight feedback received from a customer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InsightFeedback {
  /// The feedback provided by the customer.
  @_s.JsonKey(name: 'Feedback')
  final InsightFeedbackOption feedback;

  /// The insight feedback ID.
  @_s.JsonKey(name: 'Id')
  final String id;

  InsightFeedback({
    this.feedback,
    this.id,
  });
  Map<String, dynamic> toJson() => _$InsightFeedbackToJson(this);
}

enum InsightFeedbackOption {
  @_s.JsonValue('VALID_COLLECTION')
  validCollection,
  @_s.JsonValue('RECOMMENDATION_USEFUL')
  recommendationUseful,
  @_s.JsonValue('ALERT_TOO_SENSITIVE')
  alertTooSensitive,
  @_s.JsonValue('DATA_NOISY_ANOMALY')
  dataNoisyAnomaly,
  @_s.JsonValue('DATA_INCORRECT')
  dataIncorrect,
}

/// Information about the number of open reactive and proactive insights that
/// can be used to gauge the health of your system.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InsightHealth {
  /// The Meant Time to Recover (MTTR) for the insight.
  @_s.JsonKey(name: 'MeanTimeToRecoverInMilliseconds')
  final int meanTimeToRecoverInMilliseconds;

  /// The number of open proactive insights.
  @_s.JsonKey(name: 'OpenProactiveInsights')
  final int openProactiveInsights;

  /// The number of open reactive insights.
  @_s.JsonKey(name: 'OpenReactiveInsights')
  final int openReactiveInsights;

  InsightHealth({
    this.meanTimeToRecoverInMilliseconds,
    this.openProactiveInsights,
    this.openReactiveInsights,
  });
  factory InsightHealth.fromJson(Map<String, dynamic> json) =>
      _$InsightHealthFromJson(json);
}

enum InsightSeverity {
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('HIGH')
  high,
}

enum InsightStatus {
  @_s.JsonValue('ONGOING')
  ongoing,
  @_s.JsonValue('CLOSED')
  closed,
}

/// A time ranged that specifies when the observed behavior in an insight
/// started and ended.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InsightTimeRange {
  /// The time when the behavior described in an insight started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The time when the behavior described in an insight ended.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  InsightTimeRange({
    @_s.required this.startTime,
    this.endTime,
  });
  factory InsightTimeRange.fromJson(Map<String, dynamic> json) =>
      _$InsightTimeRangeFromJson(json);
}

enum InsightType {
  @_s.JsonValue('REACTIVE')
  reactive,
  @_s.JsonValue('PROACTIVE')
  proactive,
}

extension on InsightType {
  String toValue() {
    switch (this) {
      case InsightType.reactive:
        return 'REACTIVE';
      case InsightType.proactive:
        return 'PROACTIVE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAnomaliesForInsightResponse {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of <code>ProactiveAnomalySummary</code> objects that represent the
  /// requested anomalies
  @_s.JsonKey(name: 'ProactiveAnomalies')
  final List<ProactiveAnomalySummary> proactiveAnomalies;

  /// An array of <code>ReactiveAnomalySummary</code> objects that represent the
  /// requested anomalies
  @_s.JsonKey(name: 'ReactiveAnomalies')
  final List<ReactiveAnomalySummary> reactiveAnomalies;

  ListAnomaliesForInsightResponse({
    this.nextToken,
    this.proactiveAnomalies,
    this.reactiveAnomalies,
  });
  factory ListAnomaliesForInsightResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAnomaliesForInsightResponseFromJson(json);
}

/// Filters you can use to specify which events are returned when
/// <code>ListEvents</code> is called.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListEventsFilters {
  /// The source, <code>AWS_CLOUD_TRAIL</code> or <code>AWS_CODE_DEPLOY</code>, of
  /// the events you want returned.
  @_s.JsonKey(name: 'DataSource')
  final EventDataSource dataSource;

  /// The class of the events you want to filter for, such as an infrastructure
  /// change, a deployment, or a schema change.
  @_s.JsonKey(name: 'EventClass')
  final EventClass eventClass;

  /// The AWS source that emitted the events you want to filter for.
  @_s.JsonKey(name: 'EventSource')
  final String eventSource;

  /// A time range during which you want the filtered events to have occurred.
  @_s.JsonKey(name: 'EventTimeRange')
  final EventTimeRange eventTimeRange;

  /// An ID of an insight that is related to the events you want to filter for.
  @_s.JsonKey(name: 'InsightId')
  final String insightId;
  @_s.JsonKey(name: 'ResourceCollection')
  final ResourceCollection resourceCollection;

  ListEventsFilters({
    this.dataSource,
    this.eventClass,
    this.eventSource,
    this.eventTimeRange,
    this.insightId,
    this.resourceCollection,
  });
  Map<String, dynamic> toJson() => _$ListEventsFiltersToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEventsResponse {
  /// A list of the requested events.
  @_s.JsonKey(name: 'Events')
  final List<Event> events;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListEventsResponse({
    @_s.required this.events,
    this.nextToken,
  });
  factory ListEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListEventsResponseFromJson(json);
}

/// Used to filter for insights that have any status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListInsightsAnyStatusFilter {
  /// A time range used to specify when the behavior of the filtered insights
  /// started.
  @_s.JsonKey(name: 'StartTimeRange')
  final StartTimeRange startTimeRange;

  /// Use to filter for either <code>REACTIVE</code> or <code>PROACTIVE</code>
  /// insights.
  @_s.JsonKey(name: 'Type')
  final InsightType type;

  ListInsightsAnyStatusFilter({
    @_s.required this.startTimeRange,
    @_s.required this.type,
  });
  Map<String, dynamic> toJson() => _$ListInsightsAnyStatusFilterToJson(this);
}

/// Used to filter for insights that have the status <code>CLOSED</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListInsightsClosedStatusFilter {
  /// A time range used to specify when the behavior of the filtered insights
  /// ended.
  @_s.JsonKey(name: 'EndTimeRange')
  final EndTimeRange endTimeRange;

  /// Use to filter for either <code>REACTIVE</code> or <code>PROACTIVE</code>
  /// insights.
  @_s.JsonKey(name: 'Type')
  final InsightType type;

  ListInsightsClosedStatusFilter({
    @_s.required this.endTimeRange,
    @_s.required this.type,
  });
  Map<String, dynamic> toJson() => _$ListInsightsClosedStatusFilterToJson(this);
}

/// Used to filter for insights that have the status <code>ONGOING</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListInsightsOngoingStatusFilter {
  /// Use to filter for either <code>REACTIVE</code> or <code>PROACTIVE</code>
  /// insights.
  @_s.JsonKey(name: 'Type')
  final InsightType type;

  ListInsightsOngoingStatusFilter({
    @_s.required this.type,
  });
  Map<String, dynamic> toJson() =>
      _$ListInsightsOngoingStatusFilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInsightsResponse {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The returned list of proactive insights.
  @_s.JsonKey(name: 'ProactiveInsights')
  final List<ProactiveInsightSummary> proactiveInsights;

  /// The returned list of reactive insights.
  @_s.JsonKey(name: 'ReactiveInsights')
  final List<ReactiveInsightSummary> reactiveInsights;

  ListInsightsResponse({
    this.nextToken,
    this.proactiveInsights,
    this.reactiveInsights,
  });
  factory ListInsightsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListInsightsResponseFromJson(json);
}

/// A filter used by <code>ListInsights</code> to specify which insights to
/// return.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListInsightsStatusFilter {
  /// A <code>ListInsightsAnyStatusFilter</code> that specifies insights of any
  /// status that are either <code>REACTIVE</code> or <code>PROACTIVE</code>.
  @_s.JsonKey(name: 'Any')
  final ListInsightsAnyStatusFilter any;

  /// A <code>ListInsightsClosedStatusFilter</code> that specifies closed insights
  /// that are either <code>REACTIVE</code> or <code>PROACTIVE</code>.
  @_s.JsonKey(name: 'Closed')
  final ListInsightsClosedStatusFilter closed;

  /// A <code>ListInsightsAnyStatusFilter</code> that specifies ongoing insights
  /// that are either <code>REACTIVE</code> or <code>PROACTIVE</code>.
  @_s.JsonKey(name: 'Ongoing')
  final ListInsightsOngoingStatusFilter ongoing;

  ListInsightsStatusFilter({
    this.any,
    this.closed,
    this.ongoing,
  });
  Map<String, dynamic> toJson() => _$ListInsightsStatusFilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListNotificationChannelsResponse {
  /// An array that contains the requested notification channels.
  @_s.JsonKey(name: 'Channels')
  final List<NotificationChannel> channels;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListNotificationChannelsResponse({
    this.channels,
    this.nextToken,
  });
  factory ListNotificationChannelsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListNotificationChannelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRecommendationsResponse {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of the requested recommendations.
  @_s.JsonKey(name: 'Recommendations')
  final List<Recommendation> recommendations;

  ListRecommendationsResponse({
    this.nextToken,
    this.recommendations,
  });
  factory ListRecommendationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRecommendationsResponseFromJson(json);
}

/// Information about a notification channel. A notification channel is used to
/// notify you when DevOps Guru creates an insight. The one supported
/// notification channel is Amazon Simple Notification Service (Amazon SNS).
///
/// If you use an Amazon SNS topic in another account, you must attach a policy
/// to it that grants DevOps Guru permission to it notifications. DevOps Guru
/// adds the required policy on your behalf to send notifications using Amazon
/// SNS in your account. For more information, see <a
/// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-required-permissions.html">Permissions
/// for cross account Amazon SNS topics</a>.
///
/// If you use an Amazon SNS topic that is encrypted by an AWS Key Management
/// Service customer-managed key (CMK), then you must add permissions to the
/// CMK. For more information, see <a
/// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-kms-permissions.html">Permissions
/// for AWS KMS–encrypted Amazon SNS topics</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotificationChannel {
  /// A <code>NotificationChannelConfig</code> object that contains information
  /// about configured notification channels.
  @_s.JsonKey(name: 'Config')
  final NotificationChannelConfig config;

  /// The ID of a notification channel.
  @_s.JsonKey(name: 'Id')
  final String id;

  NotificationChannel({
    this.config,
    this.id,
  });
  factory NotificationChannel.fromJson(Map<String, dynamic> json) =>
      _$NotificationChannelFromJson(json);
}

/// Information about notification channels you have configured with DevOps
/// Guru. The one supported notification channel is Amazon Simple Notification
/// Service (Amazon SNS).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NotificationChannelConfig {
  /// Information about a notification channel configured in DevOps Guru to send
  /// notifications when insights are created.
  ///
  /// If you use an Amazon SNS topic in another account, you must attach a policy
  /// to it that grants DevOps Guru permission to it notifications. DevOps Guru
  /// adds the required policy on your behalf to send notifications using Amazon
  /// SNS in your account. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-required-permissions.html">Permissions
  /// for cross account Amazon SNS topics</a>.
  ///
  /// If you use an Amazon SNS topic that is encrypted by an AWS Key Management
  /// Service customer-managed key (CMK), then you must add permissions to the
  /// CMK. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-kms-permissions.html">Permissions
  /// for AWS KMS–encrypted Amazon SNS topics</a>.
  @_s.JsonKey(name: 'Sns')
  final SnsChannelConfig sns;

  NotificationChannelConfig({
    @_s.required this.sns,
  });
  factory NotificationChannelConfig.fromJson(Map<String, dynamic> json) =>
      _$NotificationChannelConfigFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationChannelConfigToJson(this);
}

/// Information about whether DevOps Guru is configured to create an OpsItem in
/// AWS Systems Manager OpsCenter for each created insight.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OpsCenterIntegration {
  /// Specifies if DevOps Guru is enabled to create an AWS Systems Manager OpsItem
  /// for each created insight.
  @_s.JsonKey(name: 'OptInStatus')
  final OptInStatus optInStatus;

  OpsCenterIntegration({
    this.optInStatus,
  });
  factory OpsCenterIntegration.fromJson(Map<String, dynamic> json) =>
      _$OpsCenterIntegrationFromJson(json);
}

/// Information about whether DevOps Guru is configured to create an OpsItem in
/// AWS Systems Manager OpsCenter for each created insight.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OpsCenterIntegrationConfig {
  /// Specifies if DevOps Guru is enabled to create an AWS Systems Manager OpsItem
  /// for each created insight.
  @_s.JsonKey(name: 'OptInStatus')
  final OptInStatus optInStatus;

  OpsCenterIntegrationConfig({
    this.optInStatus,
  });
  Map<String, dynamic> toJson() => _$OpsCenterIntegrationConfigToJson(this);
}

/// Specifies if DevOps Guru is enabled to create an AWS Systems Manager OpsItem
/// for each created insight.
enum OptInStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// The time range during which anomalous behavior in a proactive anomaly or an
/// insight is expected to occur.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PredictionTimeRange {
  /// The time range during which a metric limit is expected to be exceeded. This
  /// applies to proactive insights only.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The time when the behavior in a proactive insight is expected to end.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  PredictionTimeRange({
    @_s.required this.startTime,
    this.endTime,
  });
  factory PredictionTimeRange.fromJson(Map<String, dynamic> json) =>
      _$PredictionTimeRangeFromJson(json);
}

/// Information about an anomaly. This object is returned by
/// <code>ListAnomalies</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProactiveAnomaly {
  @_s.JsonKey(name: 'AnomalyTimeRange')
  final AnomalyTimeRange anomalyTimeRange;

  /// The ID of the insight that contains this anomaly. An insight is composed of
  /// related anomalies.
  @_s.JsonKey(name: 'AssociatedInsightId')
  final String associatedInsightId;

  /// The ID of a proactive anomaly.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// A threshold that was exceeded by behavior in analyzed resources. Exceeding
  /// this threshold is related to the anomalous behavior that generated this
  /// anomaly.
  @_s.JsonKey(name: 'Limit')
  final double limit;
  @_s.JsonKey(name: 'PredictionTimeRange')
  final PredictionTimeRange predictionTimeRange;
  @_s.JsonKey(name: 'ResourceCollection')
  final ResourceCollection resourceCollection;

  /// The severity of a proactive anomaly.
  @_s.JsonKey(name: 'Severity')
  final AnomalySeverity severity;

  /// Details about the source of the analyzed operational data that triggered the
  /// anomaly. The one supported source is Amazon CloudWatch metrics.
  @_s.JsonKey(name: 'SourceDetails')
  final AnomalySourceDetails sourceDetails;

  /// The status of a proactive anomaly.
  @_s.JsonKey(name: 'Status')
  final AnomalyStatus status;

  /// The time of the anomaly's most recent update.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdateTime')
  final DateTime updateTime;

  ProactiveAnomaly({
    this.anomalyTimeRange,
    this.associatedInsightId,
    this.id,
    this.limit,
    this.predictionTimeRange,
    this.resourceCollection,
    this.severity,
    this.sourceDetails,
    this.status,
    this.updateTime,
  });
  factory ProactiveAnomaly.fromJson(Map<String, dynamic> json) =>
      _$ProactiveAnomalyFromJson(json);
}

/// Details about a proactive anomaly. This object is returned by
/// <code>DescribeAnomaly.</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProactiveAnomalySummary {
  @_s.JsonKey(name: 'AnomalyTimeRange')
  final AnomalyTimeRange anomalyTimeRange;

  /// The ID of the insight that contains this anomaly. An insight is composed of
  /// related anomalies.
  @_s.JsonKey(name: 'AssociatedInsightId')
  final String associatedInsightId;

  /// The ID of the anomaly.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// A threshold that was exceeded by behavior in analyzed resources. Exceeding
  /// this threshold is related to the anomalous behavior that generated this
  /// anomaly.
  @_s.JsonKey(name: 'Limit')
  final double limit;
  @_s.JsonKey(name: 'PredictionTimeRange')
  final PredictionTimeRange predictionTimeRange;
  @_s.JsonKey(name: 'ResourceCollection')
  final ResourceCollection resourceCollection;

  /// The severity of the anomaly.
  @_s.JsonKey(name: 'Severity')
  final AnomalySeverity severity;

  /// Details about the source of the analyzed operational data that triggered the
  /// anomaly. The one supported source is Amazon CloudWatch metrics.
  @_s.JsonKey(name: 'SourceDetails')
  final AnomalySourceDetails sourceDetails;

  /// The status of the anomaly.
  @_s.JsonKey(name: 'Status')
  final AnomalyStatus status;

  /// The time of the anomaly's most recent update.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdateTime')
  final DateTime updateTime;

  ProactiveAnomalySummary({
    this.anomalyTimeRange,
    this.associatedInsightId,
    this.id,
    this.limit,
    this.predictionTimeRange,
    this.resourceCollection,
    this.severity,
    this.sourceDetails,
    this.status,
    this.updateTime,
  });
  factory ProactiveAnomalySummary.fromJson(Map<String, dynamic> json) =>
      _$ProactiveAnomalySummaryFromJson(json);
}

/// Details about a proactive insight. This object is returned by
/// <code>ListInsights</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProactiveInsight {
  /// The ID of the proactive insight.
  @_s.JsonKey(name: 'Id')
  final String id;
  @_s.JsonKey(name: 'InsightTimeRange')
  final InsightTimeRange insightTimeRange;

  /// The name of the proactive insight.
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'PredictionTimeRange')
  final PredictionTimeRange predictionTimeRange;
  @_s.JsonKey(name: 'ResourceCollection')
  final ResourceCollection resourceCollection;

  /// The severity of the proactive insight.
  @_s.JsonKey(name: 'Severity')
  final InsightSeverity severity;

  /// The ID of the AWS System Manager OpsItem created for this insight. You must
  /// enable the creation of OpstItems insights before they are created for each
  /// insight.
  @_s.JsonKey(name: 'SsmOpsItemId')
  final String ssmOpsItemId;

  /// The status of the proactive insight.
  @_s.JsonKey(name: 'Status')
  final InsightStatus status;

  ProactiveInsight({
    this.id,
    this.insightTimeRange,
    this.name,
    this.predictionTimeRange,
    this.resourceCollection,
    this.severity,
    this.ssmOpsItemId,
    this.status,
  });
  factory ProactiveInsight.fromJson(Map<String, dynamic> json) =>
      _$ProactiveInsightFromJson(json);
}

/// Details about a proactive insight. This object is returned by
/// <code>DescribeInsight.</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProactiveInsightSummary {
  /// The ID of the proactive insight.
  @_s.JsonKey(name: 'Id')
  final String id;
  @_s.JsonKey(name: 'InsightTimeRange')
  final InsightTimeRange insightTimeRange;

  /// The name of the proactive insight.
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'PredictionTimeRange')
  final PredictionTimeRange predictionTimeRange;
  @_s.JsonKey(name: 'ResourceCollection')
  final ResourceCollection resourceCollection;

  /// The severity of the proactive insight.
  @_s.JsonKey(name: 'Severity')
  final InsightSeverity severity;

  /// The status of the proactive insight.
  @_s.JsonKey(name: 'Status')
  final InsightStatus status;

  ProactiveInsightSummary({
    this.id,
    this.insightTimeRange,
    this.name,
    this.predictionTimeRange,
    this.resourceCollection,
    this.severity,
    this.status,
  });
  factory ProactiveInsightSummary.fromJson(Map<String, dynamic> json) =>
      _$ProactiveInsightSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutFeedbackResponse {
  PutFeedbackResponse();
  factory PutFeedbackResponse.fromJson(Map<String, dynamic> json) =>
      _$PutFeedbackResponseFromJson(json);
}

/// Details about a reactive anomaly. This object is returned by
/// <code>ListAnomalies</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReactiveAnomaly {
  @_s.JsonKey(name: 'AnomalyTimeRange')
  final AnomalyTimeRange anomalyTimeRange;

  /// The ID of the insight that contains this anomaly. An insight is composed of
  /// related anomalies.
  @_s.JsonKey(name: 'AssociatedInsightId')
  final String associatedInsightId;

  /// The ID of the reactive anomaly.
  @_s.JsonKey(name: 'Id')
  final String id;
  @_s.JsonKey(name: 'ResourceCollection')
  final ResourceCollection resourceCollection;

  /// The severity of the anomaly.
  @_s.JsonKey(name: 'Severity')
  final AnomalySeverity severity;

  /// Details about the source of the analyzed operational data that triggered the
  /// anomaly. The one supported source is Amazon CloudWatch metrics.
  @_s.JsonKey(name: 'SourceDetails')
  final AnomalySourceDetails sourceDetails;

  /// The status of the anomaly.
  @_s.JsonKey(name: 'Status')
  final AnomalyStatus status;

  ReactiveAnomaly({
    this.anomalyTimeRange,
    this.associatedInsightId,
    this.id,
    this.resourceCollection,
    this.severity,
    this.sourceDetails,
    this.status,
  });
  factory ReactiveAnomaly.fromJson(Map<String, dynamic> json) =>
      _$ReactiveAnomalyFromJson(json);
}

/// Details about a reactive anomaly. This object is returned by
/// <code>DescribeAnomaly.</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReactiveAnomalySummary {
  @_s.JsonKey(name: 'AnomalyTimeRange')
  final AnomalyTimeRange anomalyTimeRange;

  /// The ID of the insight that contains this anomaly. An insight is composed of
  /// related anomalies.
  @_s.JsonKey(name: 'AssociatedInsightId')
  final String associatedInsightId;

  /// The ID of the reactive anomaly.
  @_s.JsonKey(name: 'Id')
  final String id;
  @_s.JsonKey(name: 'ResourceCollection')
  final ResourceCollection resourceCollection;

  /// The severity of the reactive anomaly.
  @_s.JsonKey(name: 'Severity')
  final AnomalySeverity severity;

  /// Details about the source of the analyzed operational data that triggered the
  /// anomaly. The one supported source is Amazon CloudWatch metrics.
  @_s.JsonKey(name: 'SourceDetails')
  final AnomalySourceDetails sourceDetails;

  /// The status of the reactive anomaly.
  @_s.JsonKey(name: 'Status')
  final AnomalyStatus status;

  ReactiveAnomalySummary({
    this.anomalyTimeRange,
    this.associatedInsightId,
    this.id,
    this.resourceCollection,
    this.severity,
    this.sourceDetails,
    this.status,
  });
  factory ReactiveAnomalySummary.fromJson(Map<String, dynamic> json) =>
      _$ReactiveAnomalySummaryFromJson(json);
}

/// Information about a reactive insight. This object is returned by
/// <code>ListInsights</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReactiveInsight {
  /// The ID of a reactive insight.
  @_s.JsonKey(name: 'Id')
  final String id;
  @_s.JsonKey(name: 'InsightTimeRange')
  final InsightTimeRange insightTimeRange;

  /// The name of a reactive insight.
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'ResourceCollection')
  final ResourceCollection resourceCollection;

  /// The severity of a reactive insight.
  @_s.JsonKey(name: 'Severity')
  final InsightSeverity severity;

  /// The ID of the AWS System Manager OpsItem created for this insight. You must
  /// enable the creation of OpstItems insights before they are created for each
  /// insight.
  @_s.JsonKey(name: 'SsmOpsItemId')
  final String ssmOpsItemId;

  /// The status of a reactive insight.
  @_s.JsonKey(name: 'Status')
  final InsightStatus status;

  ReactiveInsight({
    this.id,
    this.insightTimeRange,
    this.name,
    this.resourceCollection,
    this.severity,
    this.ssmOpsItemId,
    this.status,
  });
  factory ReactiveInsight.fromJson(Map<String, dynamic> json) =>
      _$ReactiveInsightFromJson(json);
}

/// Information about a reactive insight. This object is returned by
/// <code>DescribeInsight.</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReactiveInsightSummary {
  /// The ID of a reactive summary.
  @_s.JsonKey(name: 'Id')
  final String id;
  @_s.JsonKey(name: 'InsightTimeRange')
  final InsightTimeRange insightTimeRange;

  /// The name of a reactive insight.
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'ResourceCollection')
  final ResourceCollection resourceCollection;

  /// The severity of a reactive insight.
  @_s.JsonKey(name: 'Severity')
  final InsightSeverity severity;

  /// The status of a reactive insight.
  @_s.JsonKey(name: 'Status')
  final InsightStatus status;

  ReactiveInsightSummary({
    this.id,
    this.insightTimeRange,
    this.name,
    this.resourceCollection,
    this.severity,
    this.status,
  });
  factory ReactiveInsightSummary.fromJson(Map<String, dynamic> json) =>
      _$ReactiveInsightSummaryFromJson(json);
}

/// Recommendation information to help you remediate detected anomalous behavior
/// that generated an insight.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Recommendation {
  /// A description of the problem.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A hyperlink to information to help you address the problem.
  @_s.JsonKey(name: 'Link')
  final String link;

  /// The name of the recommendation.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The reason DevOps Guru flagged the anomalous behavior as a problem.
  @_s.JsonKey(name: 'Reason')
  final String reason;

  /// Anomalies that are related to the problem. Use these Anomalies to learn more
  /// about what's happening and to help address the issue.
  @_s.JsonKey(name: 'RelatedAnomalies')
  final List<RecommendationRelatedAnomaly> relatedAnomalies;

  /// Events that are related to the problem. Use these events to learn more about
  /// what's happening and to help address the issue.
  @_s.JsonKey(name: 'RelatedEvents')
  final List<RecommendationRelatedEvent> relatedEvents;

  Recommendation({
    this.description,
    this.link,
    this.name,
    this.reason,
    this.relatedAnomalies,
    this.relatedEvents,
  });
  factory Recommendation.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFromJson(json);
}

/// Information about an anomaly that is related to a recommendation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecommendationRelatedAnomaly {
  /// An array of objects that represent resources in which DevOps Guru detected
  /// anomalous behavior. Each object contains the name and type of the resource.
  @_s.JsonKey(name: 'Resources')
  final List<RecommendationRelatedAnomalyResource> resources;

  /// Information about where the anomalous behavior related the recommendation
  /// was found. For example, details in Amazon CloudWatch metrics.
  @_s.JsonKey(name: 'SourceDetails')
  final List<RecommendationRelatedAnomalySourceDetail> sourceDetails;

  RecommendationRelatedAnomaly({
    this.resources,
    this.sourceDetails,
  });
  factory RecommendationRelatedAnomaly.fromJson(Map<String, dynamic> json) =>
      _$RecommendationRelatedAnomalyFromJson(json);
}

/// Information about a resource in which DevOps Guru detected anomalous
/// behavior.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecommendationRelatedAnomalyResource {
  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of the resource.
  @_s.JsonKey(name: 'Type')
  final String type;

  RecommendationRelatedAnomalyResource({
    this.name,
    this.type,
  });
  factory RecommendationRelatedAnomalyResource.fromJson(
          Map<String, dynamic> json) =>
      _$RecommendationRelatedAnomalyResourceFromJson(json);
}

/// Contains an array of
/// <code>RecommendationRelatedCloudWatchMetricsSourceDetail</code> objects that
/// contain the name and namespace of an Amazon CloudWatch metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecommendationRelatedAnomalySourceDetail {
  /// An array of <code>CloudWatchMetricsDetail</code> objects that contains
  /// information about the analyzed metrics that displayed anomalous behavior.
  @_s.JsonKey(name: 'CloudWatchMetrics')
  final List<RecommendationRelatedCloudWatchMetricsSourceDetail>
      cloudWatchMetrics;

  RecommendationRelatedAnomalySourceDetail({
    this.cloudWatchMetrics,
  });
  factory RecommendationRelatedAnomalySourceDetail.fromJson(
          Map<String, dynamic> json) =>
      _$RecommendationRelatedAnomalySourceDetailFromJson(json);
}

/// Information about an Amazon CloudWatch metric that is analyzed by DevOps
/// Guru. It is one of many analyzed metrics that are used to generate insights.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecommendationRelatedCloudWatchMetricsSourceDetail {
  /// The name of the CloudWatch metric.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// The namespace of the CloudWatch metric. A namespace is a container for
  /// CloudWatch metrics.
  @_s.JsonKey(name: 'Namespace')
  final String namespace;

  RecommendationRelatedCloudWatchMetricsSourceDetail({
    this.metricName,
    this.namespace,
  });
  factory RecommendationRelatedCloudWatchMetricsSourceDetail.fromJson(
          Map<String, dynamic> json) =>
      _$RecommendationRelatedCloudWatchMetricsSourceDetailFromJson(json);
}

/// Information about an event that is related to a recommendation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecommendationRelatedEvent {
  /// The name of the event. This corresponds to the <code>Name</code> field in an
  /// <code>Event</code> object.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A <code>ResourceCollection</code> object that contains arrays of the names
  /// of AWS CloudFormation stacks.
  @_s.JsonKey(name: 'Resources')
  final List<RecommendationRelatedEventResource> resources;

  RecommendationRelatedEvent({
    this.name,
    this.resources,
  });
  factory RecommendationRelatedEvent.fromJson(Map<String, dynamic> json) =>
      _$RecommendationRelatedEventFromJson(json);
}

/// Information about an AWS resource that emitted and event that is related to
/// a recommendation in an insight.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecommendationRelatedEventResource {
  /// The name of the resource that emitted the event. This corresponds to the
  /// <code>Name</code> field in an <code>EventResource</code> object.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of the resource that emitted the event. This corresponds to the
  /// <code>Type</code> field in an <code>EventResource</code> object.
  @_s.JsonKey(name: 'Type')
  final String type;

  RecommendationRelatedEventResource({
    this.name,
    this.type,
  });
  factory RecommendationRelatedEventResource.fromJson(
          Map<String, dynamic> json) =>
      _$RecommendationRelatedEventResourceFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveNotificationChannelResponse {
  RemoveNotificationChannelResponse();
  factory RemoveNotificationChannelResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RemoveNotificationChannelResponseFromJson(json);
}

/// A collection of AWS resources supported by DevOps Guru. The one type of AWS
/// resource collection supported is AWS CloudFormation stacks. DevOps Guru can
/// be configured to analyze only the AWS resources that are defined in the
/// stacks.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceCollection {
  /// An array of the names of AWS CloudFormation stacks. The stacks define AWS
  /// resources that DevOps Guru analyzes.
  @_s.JsonKey(name: 'CloudFormation')
  final CloudFormationCollection cloudFormation;

  ResourceCollection({
    this.cloudFormation,
  });
  factory ResourceCollection.fromJson(Map<String, dynamic> json) =>
      _$ResourceCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceCollectionToJson(this);
}

/// Information about a filter used to specify which AWS resources are analyzed
/// for anomalous behavior by DevOps Guru.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceCollectionFilter {
  /// Information about AWS CloudFormation stacks. You can use stacks to specify
  /// which AWS resources in your account to analyze. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html">Stacks</a>
  /// in the <i>AWS CloudFormation User Guide</i>.
  @_s.JsonKey(name: 'CloudFormation')
  final CloudFormationCollectionFilter cloudFormation;

  ResourceCollectionFilter({
    this.cloudFormation,
  });
  factory ResourceCollectionFilter.fromJson(Map<String, dynamic> json) =>
      _$ResourceCollectionFilterFromJson(json);
}

enum ResourceCollectionType {
  @_s.JsonValue('AWS_CLOUD_FORMATION')
  awsCloudFormation,
}

extension on ResourceCollectionType {
  String toValue() {
    switch (this) {
      case ResourceCollectionType.awsCloudFormation:
        return 'AWS_CLOUD_FORMATION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Specifies one or more severity values and one or more status values that are
/// used to search for insights.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SearchInsightsFilters {
  @_s.JsonKey(name: 'ResourceCollection')
  final ResourceCollection resourceCollection;

  /// An array of severity values used to search for insights.
  @_s.JsonKey(name: 'Severities')
  final List<InsightSeverity> severities;

  /// An array of status values used to search for insights.
  @_s.JsonKey(name: 'Statuses')
  final List<InsightStatus> statuses;

  SearchInsightsFilters({
    this.resourceCollection,
    this.severities,
    this.statuses,
  });
  Map<String, dynamic> toJson() => _$SearchInsightsFiltersToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchInsightsResponse {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The returned proactive insights.
  @_s.JsonKey(name: 'ProactiveInsights')
  final List<ProactiveInsightSummary> proactiveInsights;

  /// The returned reactive insights.
  @_s.JsonKey(name: 'ReactiveInsights')
  final List<ReactiveInsightSummary> reactiveInsights;

  SearchInsightsResponse({
    this.nextToken,
    this.proactiveInsights,
    this.reactiveInsights,
  });
  factory SearchInsightsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchInsightsResponseFromJson(json);
}

/// Information about the integration of DevOps Guru with another AWS service,
/// such as AWS Systems Manager.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceIntegrationConfig {
  /// Information about whether DevOps Guru is configured to create an OpsItem in
  /// AWS Systems Manager OpsCenter for each created insight.
  @_s.JsonKey(name: 'OpsCenter')
  final OpsCenterIntegration opsCenter;

  ServiceIntegrationConfig({
    this.opsCenter,
  });
  factory ServiceIntegrationConfig.fromJson(Map<String, dynamic> json) =>
      _$ServiceIntegrationConfigFromJson(json);
}

/// Contains the Amazon Resource Name (ARN) of an Amazon Simple Notification
/// Service topic.
///
/// If you use an Amazon SNS topic in another account, you must attach a policy
/// to it that grants DevOps Guru permission to it notifications. DevOps Guru
/// adds the required policy on your behalf to send notifications using Amazon
/// SNS in your account. For more information, see <a
/// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-required-permissions.html">Permissions
/// for cross account Amazon SNS topics</a>.
///
/// If you use an Amazon SNS topic that is encrypted by an AWS Key Management
/// Service customer-managed key (CMK), then you must add permissions to the
/// CMK. For more information, see <a
/// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-kms-permissions.html">Permissions
/// for AWS KMS–encrypted Amazon SNS topics</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SnsChannelConfig {
  /// The Amazon Resource Name (ARN) of an Amazon Simple Notification Service
  /// topic.
  @_s.JsonKey(name: 'TopicArn')
  final String topicArn;

  SnsChannelConfig({
    this.topicArn,
  });
  factory SnsChannelConfig.fromJson(Map<String, dynamic> json) =>
      _$SnsChannelConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SnsChannelConfigToJson(this);
}

/// A time range used to specify when the behavior of an insight or anomaly
/// started.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartTimeRange {
  /// The start time of the time range.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FromTime')
  final DateTime fromTime;

  /// The end time of the time range.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ToTime')
  final DateTime toTime;

  StartTimeRange({
    this.fromTime,
    this.toTime,
  });
  Map<String, dynamic> toJson() => _$StartTimeRangeToJson(this);
}

/// Contains the names of AWS CloudFormation stacks used to update a collection
/// of stacks.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateCloudFormationCollectionFilter {
  /// An array of the name of stacks to update.
  @_s.JsonKey(name: 'StackNames')
  final List<String> stackNames;

  UpdateCloudFormationCollectionFilter({
    this.stackNames,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateCloudFormationCollectionFilterToJson(this);
}

enum UpdateResourceCollectionAction {
  @_s.JsonValue('ADD')
  add,
  @_s.JsonValue('REMOVE')
  remove,
}

extension on UpdateResourceCollectionAction {
  String toValue() {
    switch (this) {
      case UpdateResourceCollectionAction.add:
        return 'ADD';
      case UpdateResourceCollectionAction.remove:
        return 'REMOVE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information used to update a collection of AWS resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateResourceCollectionFilter {
  /// An collection of AWS CloudFormation stacks.
  @_s.JsonKey(name: 'CloudFormation')
  final UpdateCloudFormationCollectionFilter cloudFormation;

  UpdateResourceCollectionFilter({
    this.cloudFormation,
  });
  Map<String, dynamic> toJson() => _$UpdateResourceCollectionFilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateResourceCollectionResponse {
  UpdateResourceCollectionResponse();
  factory UpdateResourceCollectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateResourceCollectionResponseFromJson(json);
}

/// Information about updating the integration status of an AWS service, such as
/// AWS Systems Manager, with DevOps Guru.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateServiceIntegrationConfig {
  @_s.JsonKey(name: 'OpsCenter')
  final OpsCenterIntegrationConfig opsCenter;

  UpdateServiceIntegrationConfig({
    this.opsCenter,
  });
  Map<String, dynamic> toJson() => _$UpdateServiceIntegrationConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateServiceIntegrationResponse {
  UpdateServiceIntegrationResponse();
  factory UpdateServiceIntegrationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateServiceIntegrationResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
