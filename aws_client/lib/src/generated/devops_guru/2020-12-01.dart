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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
    required NotificationChannelConfig config,
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
    required DateTime fromTime,
    DateTime? toTime,
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
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
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

  /// Returns the most recent feedback submitted in the current AWS account and
  /// Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [insightId] :
  /// The ID of the insight for which the feedback was provided.
  Future<DescribeFeedbackResponse> describeFeedback({
    String? insightId,
  }) async {
    _s.validateStringLength(
      'insightId',
      insightId,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (insightId != null) 'InsightId': insightId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/feedback',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFeedbackResponse.fromJson(response);
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
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
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
  /// AWS resources that are defined in the stacks. You can specify up to 500
  /// AWS CloudFormation stacks.
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
  /// only the AWS resources that are defined in the stacks. You can specify up
  /// to 500 AWS CloudFormation stacks.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<DescribeResourceCollectionHealthResponse>
      describeResourceCollectionHealth({
    required ResourceCollectionType resourceCollectionType,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(
        resourceCollectionType, 'resourceCollectionType');
    _s.validateStringLength(
      'nextToken',
      nextToken,
      36,
      36,
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

  /// Returns an estimate of the monthly cost for DevOps Guru to analyze your
  /// AWS resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/cost-estimate.html">Estimate
  /// your Amazon DevOps Guru costs</a> and <a
  /// href="http://aws.amazon.com/devops-guru/pricing/">Amazon DevOps Guru
  /// pricing</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<GetCostEstimationResponse> getCostEstimation({
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      36,
      36,
    );
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cost-estimation',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetCostEstimationResponse.fromJson(response);
  }

  /// Returns lists AWS resources that are of the specified resource collection
  /// type. The one type of AWS resource collection supported is AWS
  /// CloudFormation stacks. DevOps Guru can be configured to analyze only the
  /// AWS resources that are defined in the stacks. You can specify up to 500
  /// AWS CloudFormation stacks.
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
    required ResourceCollectionType resourceCollectionType,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(
        resourceCollectionType, 'resourceCollectionType');
    _s.validateStringLength(
      'nextToken',
      nextToken,
      36,
      36,
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
    required String insightId,
    int? maxResults,
    String? nextToken,
    StartTimeRange? startTimeRange,
  }) async {
    ArgumentError.checkNotNull(insightId, 'insightId');
    _s.validateStringLength(
      'insightId',
      insightId,
      1,
      100,
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
    required ListEventsFilters filters,
    int? maxResults,
    String? nextToken,
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
    required ListInsightsStatusFilter statusFilter,
    int? maxResults,
    String? nextToken,
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
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      36,
      36,
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
  /// Parameter [locale] :
  /// A locale that specifies the language to use for recommendations.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<ListRecommendationsResponse> listRecommendations({
    required String insightId,
    Locale? locale,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(insightId, 'insightId');
    _s.validateStringLength(
      'insightId',
      insightId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      36,
      36,
    );
    final $payload = <String, dynamic>{
      'InsightId': insightId,
      if (locale != null) 'Locale': locale.toValue(),
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
    InsightFeedback? insightFeedback,
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
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/channels/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required StartTimeRange startTimeRange,
    required InsightType type,
    SearchInsightsFilters? filters,
    int? maxResults,
    String? nextToken,
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
    final $payload = <String, dynamic>{
      'StartTimeRange': startTimeRange,
      'Type': type.toValue(),
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

  /// Starts the creation of an estimate of the monthly cost to analyze your AWS
  /// resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceCollection] :
  /// The collection of AWS resources used to create a monthly DevOps Guru cost
  /// estimate.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token used to identify each cost estimate request.
  Future<void> startCostEstimation({
    required CostEstimationResourceCollectionFilter resourceCollection,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(resourceCollection, 'resourceCollection');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'ResourceCollection': resourceCollection,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/cost-estimation',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the collection of resources that DevOps Guru analyzes. The one
  /// type of AWS resource collection supported is AWS CloudFormation stacks.
  /// DevOps Guru can be configured to analyze only the AWS resources that are
  /// defined in the stacks. You can specify up to 500 AWS CloudFormation
  /// stacks. This method also creates the IAM role required for you to use
  /// DevOps Guru.
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
    required UpdateResourceCollectionAction action,
    required UpdateResourceCollectionFilter resourceCollection,
  }) async {
    ArgumentError.checkNotNull(action, 'action');
    ArgumentError.checkNotNull(resourceCollection, 'resourceCollection');
    final $payload = <String, dynamic>{
      'Action': action.toValue(),
      'ResourceCollection': resourceCollection,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/resource-collections',
      exceptionFnMap: _exceptionFns,
    );
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
    required UpdateServiceIntegrationConfig serviceIntegration,
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
  }
}

class AddNotificationChannelResponse {
  /// The ID of the added notification channel.
  final String id;

  AddNotificationChannelResponse({
    required this.id,
  });

  factory AddNotificationChannelResponse.fromJson(Map<String, dynamic> json) {
    return AddNotificationChannelResponse(
      id: json['Id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'Id': id,
    };
  }
}

/// A time range that specifies when DevOps Guru opens and then closes an
/// anomaly. This is different from <code>AnomalyTimeRange</code>, which
/// specifies the time range when DevOps Guru actually observes the anomalous
/// behavior.
class AnomalyReportedTimeRange {
  /// The time when an anomaly is opened.
  final DateTime openTime;

  /// The time when an anomaly is closed.
  final DateTime? closeTime;

  AnomalyReportedTimeRange({
    required this.openTime,
    this.closeTime,
  });

  factory AnomalyReportedTimeRange.fromJson(Map<String, dynamic> json) {
    return AnomalyReportedTimeRange(
      openTime: nonNullableTimeStampFromJson(json['OpenTime'] as Object),
      closeTime: timeStampFromJson(json['CloseTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final openTime = this.openTime;
    final closeTime = this.closeTime;
    return {
      'OpenTime': unixTimestampToJson(openTime),
      if (closeTime != null) 'CloseTime': unixTimestampToJson(closeTime),
    };
  }
}

enum AnomalySeverity {
  low,
  medium,
  high,
}

extension on AnomalySeverity {
  String toValue() {
    switch (this) {
      case AnomalySeverity.low:
        return 'LOW';
      case AnomalySeverity.medium:
        return 'MEDIUM';
      case AnomalySeverity.high:
        return 'HIGH';
    }
  }
}

extension on String {
  AnomalySeverity toAnomalySeverity() {
    switch (this) {
      case 'LOW':
        return AnomalySeverity.low;
      case 'MEDIUM':
        return AnomalySeverity.medium;
      case 'HIGH':
        return AnomalySeverity.high;
    }
    throw Exception('$this is not known in enum AnomalySeverity');
  }
}

/// Details about the source of the anomalous operational data that triggered
/// the anomaly. The one supported source is Amazon CloudWatch metrics.
class AnomalySourceDetails {
  /// An array of <code>CloudWatchMetricsDetail</code> object that contains
  /// information about the analyzed metrics that displayed anomalous behavior.
  final List<CloudWatchMetricsDetail>? cloudWatchMetrics;

  AnomalySourceDetails({
    this.cloudWatchMetrics,
  });

  factory AnomalySourceDetails.fromJson(Map<String, dynamic> json) {
    return AnomalySourceDetails(
      cloudWatchMetrics: (json['CloudWatchMetrics'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CloudWatchMetricsDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchMetrics = this.cloudWatchMetrics;
    return {
      if (cloudWatchMetrics != null) 'CloudWatchMetrics': cloudWatchMetrics,
    };
  }
}

enum AnomalyStatus {
  ongoing,
  closed,
}

extension on AnomalyStatus {
  String toValue() {
    switch (this) {
      case AnomalyStatus.ongoing:
        return 'ONGOING';
      case AnomalyStatus.closed:
        return 'CLOSED';
    }
  }
}

extension on String {
  AnomalyStatus toAnomalyStatus() {
    switch (this) {
      case 'ONGOING':
        return AnomalyStatus.ongoing;
      case 'CLOSED':
        return AnomalyStatus.closed;
    }
    throw Exception('$this is not known in enum AnomalyStatus');
  }
}

/// A time range that specifies when the observed unusual behavior in an anomaly
/// started and ended. This is different from
/// <code>AnomalyReportedTimeRange</code>, which specifies the time range when
/// DevOps Guru opens and then closes an anomaly.
class AnomalyTimeRange {
  /// The time when the anomalous behavior started.
  final DateTime startTime;

  /// The time when the anomalous behavior ended.
  final DateTime? endTime;

  AnomalyTimeRange({
    required this.startTime,
    this.endTime,
  });

  factory AnomalyTimeRange.fromJson(Map<String, dynamic> json) {
    return AnomalyTimeRange(
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
      endTime: timeStampFromJson(json['EndTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final startTime = this.startTime;
    final endTime = this.endTime;
    return {
      'StartTime': unixTimestampToJson(startTime),
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
    };
  }
}

/// Information about AWS CloudFormation stacks. You can use up to 500 stacks to
/// specify which AWS resources in your account to analyze. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html">Stacks</a>
/// in the <i>AWS CloudFormation User Guide</i>.
class CloudFormationCollection {
  /// An array of CloudFormation stack names.
  final List<String>? stackNames;

  CloudFormationCollection({
    this.stackNames,
  });

  factory CloudFormationCollection.fromJson(Map<String, dynamic> json) {
    return CloudFormationCollection(
      stackNames: (json['StackNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final stackNames = this.stackNames;
    return {
      if (stackNames != null) 'StackNames': stackNames,
    };
  }
}

/// Information about AWS CloudFormation stacks. You can use up to 500 stacks to
/// specify which AWS resources in your account to analyze. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html">Stacks</a>
/// in the <i>AWS CloudFormation User Guide</i>.
class CloudFormationCollectionFilter {
  /// An array of CloudFormation stack names.
  final List<String>? stackNames;

  CloudFormationCollectionFilter({
    this.stackNames,
  });

  factory CloudFormationCollectionFilter.fromJson(Map<String, dynamic> json) {
    return CloudFormationCollectionFilter(
      stackNames: (json['StackNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final stackNames = this.stackNames;
    return {
      if (stackNames != null) 'StackNames': stackNames,
    };
  }
}

/// Information about an AWS CloudFormation stack used to create a monthly cost
/// estimate for DevOps Guru to analyze AWS resources. The maximum number of
/// stacks you can specify for a cost estimate is one. The estimate created is
/// for the cost to analyze the AWS resources defined by the stack. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html">Stacks</a>
/// in the <i>AWS CloudFormation User Guide</i>.
class CloudFormationCostEstimationResourceCollectionFilter {
  /// An array of CloudFormation stack names. Its size is fixed at 1 item.
  final List<String>? stackNames;

  CloudFormationCostEstimationResourceCollectionFilter({
    this.stackNames,
  });

  factory CloudFormationCostEstimationResourceCollectionFilter.fromJson(
      Map<String, dynamic> json) {
    return CloudFormationCostEstimationResourceCollectionFilter(
      stackNames: (json['StackNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final stackNames = this.stackNames;
    return {
      if (stackNames != null) 'StackNames': stackNames,
    };
  }
}

/// Information about the health of AWS resources in your account that are
/// specified by an AWS CloudFormation stack.
class CloudFormationHealth {
  /// Information about the health of the AWS resources in your account that are
  /// specified by an AWS CloudFormation stack, including the number of open
  /// proactive, open reactive insights, and the Mean Time to Recover (MTTR) of
  /// closed insights.
  final InsightHealth? insight;

  /// The name of the CloudFormation stack.
  final String? stackName;

  CloudFormationHealth({
    this.insight,
    this.stackName,
  });

  factory CloudFormationHealth.fromJson(Map<String, dynamic> json) {
    return CloudFormationHealth(
      insight: json['Insight'] != null
          ? InsightHealth.fromJson(json['Insight'] as Map<String, dynamic>)
          : null,
      stackName: json['StackName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final insight = this.insight;
    final stackName = this.stackName;
    return {
      if (insight != null) 'Insight': insight,
      if (stackName != null) 'StackName': stackName,
    };
  }
}

/// Information about an Amazon CloudWatch metric.
class CloudWatchMetricsDetail {
  /// An array of CloudWatch dimensions associated with
  final List<CloudWatchMetricsDimension>? dimensions;

  /// The name of the CloudWatch metric.
  final String? metricName;

  /// The namespace of the CloudWatch metric. A namespace is a container for
  /// CloudWatch metrics.
  final String? namespace;

  /// The length of time associated with the CloudWatch metric in number of
  /// seconds.
  final int? period;

  /// The type of statistic associated with the CloudWatch metric. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Statistic">Statistics</a>
  /// in the <i>Amazon CloudWatch User Guide</i>.
  final CloudWatchMetricsStat? stat;

  /// The unit of measure used for the CloudWatch metric. For example,
  /// <code>Bytes</code>, <code>Seconds</code>, <code>Count</code>, and
  /// <code>Percent</code>.
  final String? unit;

  CloudWatchMetricsDetail({
    this.dimensions,
    this.metricName,
    this.namespace,
    this.period,
    this.stat,
    this.unit,
  });

  factory CloudWatchMetricsDetail.fromJson(Map<String, dynamic> json) {
    return CloudWatchMetricsDetail(
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CloudWatchMetricsDimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricName: json['MetricName'] as String?,
      namespace: json['Namespace'] as String?,
      period: json['Period'] as int?,
      stat: (json['Stat'] as String?)?.toCloudWatchMetricsStat(),
      unit: json['Unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final metricName = this.metricName;
    final namespace = this.namespace;
    final period = this.period;
    final stat = this.stat;
    final unit = this.unit;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (metricName != null) 'MetricName': metricName,
      if (namespace != null) 'Namespace': namespace,
      if (period != null) 'Period': period,
      if (stat != null) 'Stat': stat.toValue(),
      if (unit != null) 'Unit': unit,
    };
  }
}

/// The dimension of a Amazon CloudWatch metric that is used when DevOps Guru
/// analyzes the resources in your account for operational problems and
/// anomalous behavior. A dimension is a name/value pair that is part of the
/// identity of a metric. A metric can have up to 10 dimensions. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Dimension">Dimensions</a>
/// in the <i>Amazon CloudWatch User Guide</i>.
class CloudWatchMetricsDimension {
  /// The name of the CloudWatch dimension.
  final String? name;

  /// The value of the CloudWatch dimension.
  final String? value;

  CloudWatchMetricsDimension({
    this.name,
    this.value,
  });

  factory CloudWatchMetricsDimension.fromJson(Map<String, dynamic> json) {
    return CloudWatchMetricsDimension(
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

enum CloudWatchMetricsStat {
  sum,
  average,
  sampleCount,
  minimum,
  maximum,
  p99,
  p90,
  p50,
}

extension on CloudWatchMetricsStat {
  String toValue() {
    switch (this) {
      case CloudWatchMetricsStat.sum:
        return 'Sum';
      case CloudWatchMetricsStat.average:
        return 'Average';
      case CloudWatchMetricsStat.sampleCount:
        return 'SampleCount';
      case CloudWatchMetricsStat.minimum:
        return 'Minimum';
      case CloudWatchMetricsStat.maximum:
        return 'Maximum';
      case CloudWatchMetricsStat.p99:
        return 'p99';
      case CloudWatchMetricsStat.p90:
        return 'p90';
      case CloudWatchMetricsStat.p50:
        return 'p50';
    }
  }
}

extension on String {
  CloudWatchMetricsStat toCloudWatchMetricsStat() {
    switch (this) {
      case 'Sum':
        return CloudWatchMetricsStat.sum;
      case 'Average':
        return CloudWatchMetricsStat.average;
      case 'SampleCount':
        return CloudWatchMetricsStat.sampleCount;
      case 'Minimum':
        return CloudWatchMetricsStat.minimum;
      case 'Maximum':
        return CloudWatchMetricsStat.maximum;
      case 'p99':
        return CloudWatchMetricsStat.p99;
      case 'p90':
        return CloudWatchMetricsStat.p90;
      case 'p50':
        return CloudWatchMetricsStat.p50;
    }
    throw Exception('$this is not known in enum CloudWatchMetricsStat');
  }
}

/// Information about a filter used to specify which AWS resources are analyzed
/// to create a monthly DevOps Guru cost estimate. For more information, see <a
/// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/cost-estimate.html">Estimate
/// your Amazon DevOps Guru costs</a> and <a
/// href="http://aws.amazon.com/devops-guru/pricing/">Amazon DevOps Guru
/// pricing</a>.
class CostEstimationResourceCollectionFilter {
  /// An object that specifies the CloudFormation stack that defines the AWS
  /// resources used to create a monthly estimate for DevOps Guru.
  final CloudFormationCostEstimationResourceCollectionFilter? cloudFormation;

  CostEstimationResourceCollectionFilter({
    this.cloudFormation,
  });

  factory CostEstimationResourceCollectionFilter.fromJson(
      Map<String, dynamic> json) {
    return CostEstimationResourceCollectionFilter(
      cloudFormation: json['CloudFormation'] != null
          ? CloudFormationCostEstimationResourceCollectionFilter.fromJson(
              json['CloudFormation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormation = this.cloudFormation;
    return {
      if (cloudFormation != null) 'CloudFormation': cloudFormation,
    };
  }
}

enum CostEstimationServiceResourceState {
  active,
  inactive,
}

extension on CostEstimationServiceResourceState {
  String toValue() {
    switch (this) {
      case CostEstimationServiceResourceState.active:
        return 'ACTIVE';
      case CostEstimationServiceResourceState.inactive:
        return 'INACTIVE';
    }
  }
}

extension on String {
  CostEstimationServiceResourceState toCostEstimationServiceResourceState() {
    switch (this) {
      case 'ACTIVE':
        return CostEstimationServiceResourceState.active;
      case 'INACTIVE':
        return CostEstimationServiceResourceState.inactive;
    }
    throw Exception(
        '$this is not known in enum CostEstimationServiceResourceState');
  }
}

enum CostEstimationStatus {
  ongoing,
  completed,
}

extension on CostEstimationStatus {
  String toValue() {
    switch (this) {
      case CostEstimationStatus.ongoing:
        return 'ONGOING';
      case CostEstimationStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension on String {
  CostEstimationStatus toCostEstimationStatus() {
    switch (this) {
      case 'ONGOING':
        return CostEstimationStatus.ongoing;
      case 'COMPLETED':
        return CostEstimationStatus.completed;
    }
    throw Exception('$this is not known in enum CostEstimationStatus');
  }
}

/// The time range of a cost estimation.
class CostEstimationTimeRange {
  /// The end time of the cost estimation.
  final DateTime? endTime;

  /// The start time of the cost estimation.
  final DateTime? startTime;

  CostEstimationTimeRange({
    this.endTime,
    this.startTime,
  });

  factory CostEstimationTimeRange.fromJson(Map<String, dynamic> json) {
    return CostEstimationTimeRange(
      endTime: timeStampFromJson(json['EndTime']),
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

class DescribeAccountHealthResponse {
  /// An integer that specifies the number of metrics that have been analyzed in
  /// your AWS account.
  final int metricsAnalyzed;

  /// An integer that specifies the number of open proactive insights in your AWS
  /// account.
  final int openProactiveInsights;

  /// An integer that specifies the number of open reactive insights in your AWS
  /// account.
  final int openReactiveInsights;

  /// The number of Amazon DevOps Guru resource analysis hours billed to the
  /// current AWS account in the last hour.
  final int resourceHours;

  DescribeAccountHealthResponse({
    required this.metricsAnalyzed,
    required this.openProactiveInsights,
    required this.openReactiveInsights,
    required this.resourceHours,
  });

  factory DescribeAccountHealthResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAccountHealthResponse(
      metricsAnalyzed: json['MetricsAnalyzed'] as int,
      openProactiveInsights: json['OpenProactiveInsights'] as int,
      openReactiveInsights: json['OpenReactiveInsights'] as int,
      resourceHours: json['ResourceHours'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final metricsAnalyzed = this.metricsAnalyzed;
    final openProactiveInsights = this.openProactiveInsights;
    final openReactiveInsights = this.openReactiveInsights;
    final resourceHours = this.resourceHours;
    return {
      'MetricsAnalyzed': metricsAnalyzed,
      'OpenProactiveInsights': openProactiveInsights,
      'OpenReactiveInsights': openReactiveInsights,
      'ResourceHours': resourceHours,
    };
  }
}

class DescribeAccountOverviewResponse {
  /// The Mean Time to Recover (MTTR) for all closed insights that were created
  /// during the time range passed in.
  final int meanTimeToRecoverInMilliseconds;

  /// An integer that specifies the number of open proactive insights in your AWS
  /// account that were created during the time range passed in.
  final int proactiveInsights;

  /// An integer that specifies the number of open reactive insights in your AWS
  /// account that were created during the time range passed in.
  final int reactiveInsights;

  DescribeAccountOverviewResponse({
    required this.meanTimeToRecoverInMilliseconds,
    required this.proactiveInsights,
    required this.reactiveInsights,
  });

  factory DescribeAccountOverviewResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAccountOverviewResponse(
      meanTimeToRecoverInMilliseconds:
          json['MeanTimeToRecoverInMilliseconds'] as int,
      proactiveInsights: json['ProactiveInsights'] as int,
      reactiveInsights: json['ReactiveInsights'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final meanTimeToRecoverInMilliseconds =
        this.meanTimeToRecoverInMilliseconds;
    final proactiveInsights = this.proactiveInsights;
    final reactiveInsights = this.reactiveInsights;
    return {
      'MeanTimeToRecoverInMilliseconds': meanTimeToRecoverInMilliseconds,
      'ProactiveInsights': proactiveInsights,
      'ReactiveInsights': reactiveInsights,
    };
  }
}

class DescribeAnomalyResponse {
  /// A <code>ReactiveAnomaly</code> object that represents the requested anomaly.
  final ProactiveAnomaly? proactiveAnomaly;

  /// A <code>ProactiveAnomaly</code> object that represents the requested
  /// anomaly.
  final ReactiveAnomaly? reactiveAnomaly;

  DescribeAnomalyResponse({
    this.proactiveAnomaly,
    this.reactiveAnomaly,
  });

  factory DescribeAnomalyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAnomalyResponse(
      proactiveAnomaly: json['ProactiveAnomaly'] != null
          ? ProactiveAnomaly.fromJson(
              json['ProactiveAnomaly'] as Map<String, dynamic>)
          : null,
      reactiveAnomaly: json['ReactiveAnomaly'] != null
          ? ReactiveAnomaly.fromJson(
              json['ReactiveAnomaly'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final proactiveAnomaly = this.proactiveAnomaly;
    final reactiveAnomaly = this.reactiveAnomaly;
    return {
      if (proactiveAnomaly != null) 'ProactiveAnomaly': proactiveAnomaly,
      if (reactiveAnomaly != null) 'ReactiveAnomaly': reactiveAnomaly,
    };
  }
}

class DescribeFeedbackResponse {
  final InsightFeedback? insightFeedback;

  DescribeFeedbackResponse({
    this.insightFeedback,
  });

  factory DescribeFeedbackResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFeedbackResponse(
      insightFeedback: json['InsightFeedback'] != null
          ? InsightFeedback.fromJson(
              json['InsightFeedback'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final insightFeedback = this.insightFeedback;
    return {
      if (insightFeedback != null) 'InsightFeedback': insightFeedback,
    };
  }
}

class DescribeInsightResponse {
  /// A <code>ProactiveInsight</code> object that represents the requested
  /// insight.
  final ProactiveInsight? proactiveInsight;

  /// A <code>ReactiveInsight</code> object that represents the requested insight.
  final ReactiveInsight? reactiveInsight;

  DescribeInsightResponse({
    this.proactiveInsight,
    this.reactiveInsight,
  });

  factory DescribeInsightResponse.fromJson(Map<String, dynamic> json) {
    return DescribeInsightResponse(
      proactiveInsight: json['ProactiveInsight'] != null
          ? ProactiveInsight.fromJson(
              json['ProactiveInsight'] as Map<String, dynamic>)
          : null,
      reactiveInsight: json['ReactiveInsight'] != null
          ? ReactiveInsight.fromJson(
              json['ReactiveInsight'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final proactiveInsight = this.proactiveInsight;
    final reactiveInsight = this.reactiveInsight;
    return {
      if (proactiveInsight != null) 'ProactiveInsight': proactiveInsight,
      if (reactiveInsight != null) 'ReactiveInsight': reactiveInsight,
    };
  }
}

class DescribeResourceCollectionHealthResponse {
  /// The returned <code>CloudFormationHealthOverview</code> object that contains
  /// an <code>InsightHealthOverview</code> object with the requested system
  /// health information.
  final List<CloudFormationHealth> cloudFormation;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// An array of <code>ServiceHealth</code> objects that describes the health of
  /// the AWS services associated with the resources in the collection.
  final List<ServiceHealth>? service;

  DescribeResourceCollectionHealthResponse({
    required this.cloudFormation,
    this.nextToken,
    this.service,
  });

  factory DescribeResourceCollectionHealthResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeResourceCollectionHealthResponse(
      cloudFormation: (json['CloudFormation'] as List)
          .whereNotNull()
          .map((e) => CloudFormationHealth.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      service: (json['Service'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceHealth.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormation = this.cloudFormation;
    final nextToken = this.nextToken;
    final service = this.service;
    return {
      'CloudFormation': cloudFormation,
      if (nextToken != null) 'NextToken': nextToken,
      if (service != null) 'Service': service,
    };
  }
}

class DescribeServiceIntegrationResponse {
  final ServiceIntegrationConfig? serviceIntegration;

  DescribeServiceIntegrationResponse({
    this.serviceIntegration,
  });

  factory DescribeServiceIntegrationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeServiceIntegrationResponse(
      serviceIntegration: json['ServiceIntegration'] != null
          ? ServiceIntegrationConfig.fromJson(
              json['ServiceIntegration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceIntegration = this.serviceIntegration;
    return {
      if (serviceIntegration != null) 'ServiceIntegration': serviceIntegration,
    };
  }
}

/// A range of time that specifies when anomalous behavior in an anomaly or
/// insight ended.
class EndTimeRange {
  /// The earliest end time in the time range.
  final DateTime? fromTime;

  /// The latest end time in the time range.
  final DateTime? toTime;

  EndTimeRange({
    this.fromTime,
    this.toTime,
  });

  factory EndTimeRange.fromJson(Map<String, dynamic> json) {
    return EndTimeRange(
      fromTime: timeStampFromJson(json['FromTime']),
      toTime: timeStampFromJson(json['ToTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final fromTime = this.fromTime;
    final toTime = this.toTime;
    return {
      if (fromTime != null) 'FromTime': unixTimestampToJson(fromTime),
      if (toTime != null) 'ToTime': unixTimestampToJson(toTime),
    };
  }
}

/// An AWS resource event. AWS resource events and metrics are analyzed by
/// DevOps Guru to find anomalous behavior and provide recommendations to
/// improve your operational solutions.
class Event {
  /// The source, <code>AWS_CLOUD_TRAIL</code> or <code>AWS_CODE_DEPLOY</code>,
  /// where DevOps Guru analysis found the event.
  final EventDataSource? dataSource;

  /// The class of the event. The class specifies what the event is related to,
  /// such as an infrastructure change, a deployment, or a schema change.
  final EventClass? eventClass;

  /// The AWS source that emitted the event.
  final String? eventSource;

  /// The ID of the event.
  final String? id;

  /// The name of the event.
  final String? name;
  final ResourceCollection? resourceCollection;

  /// An <code>EventResource</code> object that contains information about the
  /// resource that emitted the event.
  final List<EventResource>? resources;

  /// A <code>Timestamp</code> that specifies the time the event occurred.
  final DateTime? time;

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

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      dataSource: (json['DataSource'] as String?)?.toEventDataSource(),
      eventClass: (json['EventClass'] as String?)?.toEventClass(),
      eventSource: json['EventSource'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      resourceCollection: json['ResourceCollection'] != null
          ? ResourceCollection.fromJson(
              json['ResourceCollection'] as Map<String, dynamic>)
          : null,
      resources: (json['Resources'] as List?)
          ?.whereNotNull()
          .map((e) => EventResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      time: timeStampFromJson(json['Time']),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final eventClass = this.eventClass;
    final eventSource = this.eventSource;
    final id = this.id;
    final name = this.name;
    final resourceCollection = this.resourceCollection;
    final resources = this.resources;
    final time = this.time;
    return {
      if (dataSource != null) 'DataSource': dataSource.toValue(),
      if (eventClass != null) 'EventClass': eventClass.toValue(),
      if (eventSource != null) 'EventSource': eventSource,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (resources != null) 'Resources': resources,
      if (time != null) 'Time': unixTimestampToJson(time),
    };
  }
}

enum EventClass {
  infrastructure,
  deployment,
  securityChange,
  configChange,
  schemaChange,
}

extension on EventClass {
  String toValue() {
    switch (this) {
      case EventClass.infrastructure:
        return 'INFRASTRUCTURE';
      case EventClass.deployment:
        return 'DEPLOYMENT';
      case EventClass.securityChange:
        return 'SECURITY_CHANGE';
      case EventClass.configChange:
        return 'CONFIG_CHANGE';
      case EventClass.schemaChange:
        return 'SCHEMA_CHANGE';
    }
  }
}

extension on String {
  EventClass toEventClass() {
    switch (this) {
      case 'INFRASTRUCTURE':
        return EventClass.infrastructure;
      case 'DEPLOYMENT':
        return EventClass.deployment;
      case 'SECURITY_CHANGE':
        return EventClass.securityChange;
      case 'CONFIG_CHANGE':
        return EventClass.configChange;
      case 'SCHEMA_CHANGE':
        return EventClass.schemaChange;
    }
    throw Exception('$this is not known in enum EventClass');
  }
}

enum EventDataSource {
  awsCloudTrail,
  awsCodeDeploy,
}

extension on EventDataSource {
  String toValue() {
    switch (this) {
      case EventDataSource.awsCloudTrail:
        return 'AWS_CLOUD_TRAIL';
      case EventDataSource.awsCodeDeploy:
        return 'AWS_CODE_DEPLOY';
    }
  }
}

extension on String {
  EventDataSource toEventDataSource() {
    switch (this) {
      case 'AWS_CLOUD_TRAIL':
        return EventDataSource.awsCloudTrail;
      case 'AWS_CODE_DEPLOY':
        return EventDataSource.awsCodeDeploy;
    }
    throw Exception('$this is not known in enum EventDataSource');
  }
}

/// The AWS resource that emitted an event. AWS resource events and metrics are
/// analyzed by DevOps Guru to find anomalous behavior and provide
/// recommendations to improve your operational solutions.
class EventResource {
  /// The Amazon Resource Name (ARN) of the resource that emitted an event.
  final String? arn;

  /// The name of the resource that emitted an event.
  final String? name;

  /// The type of resource that emitted an event.
  final String? type;

  EventResource({
    this.arn,
    this.name,
    this.type,
  });

  factory EventResource.fromJson(Map<String, dynamic> json) {
    return EventResource(
      arn: json['Arn'] as String?,
      name: json['Name'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type,
    };
  }
}

/// The time range during which an AWS event occurred. AWS resource events and
/// metrics are analyzed by DevOps Guru to find anomalous behavior and provide
/// recommendations to improve your operational solutions.
class EventTimeRange {
  /// The time when the event started.
  final DateTime fromTime;

  /// The time when the event ended.
  final DateTime toTime;

  EventTimeRange({
    required this.fromTime,
    required this.toTime,
  });

  factory EventTimeRange.fromJson(Map<String, dynamic> json) {
    return EventTimeRange(
      fromTime: nonNullableTimeStampFromJson(json['FromTime'] as Object),
      toTime: nonNullableTimeStampFromJson(json['ToTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final fromTime = this.fromTime;
    final toTime = this.toTime;
    return {
      'FromTime': unixTimestampToJson(fromTime),
      'ToTime': unixTimestampToJson(toTime),
    };
  }
}

class GetCostEstimationResponse {
  /// An array of <code>ResourceCost</code> objects that each contains details
  /// about the monthly cost estimate to analyze one of your AWS resources.
  final List<ServiceResourceCost>? costs;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// The collection of the AWS resources used to create your monthly DevOps Guru
  /// cost estimate.
  final CostEstimationResourceCollectionFilter? resourceCollection;

  /// The status of creating this cost estimate. If it's still in progress, the
  /// status <code>ONGOING</code> is returned. If it is finished, the status
  /// <code>COMPLETED</code> is returned.
  final CostEstimationStatus? status;

  /// The start and end time of the cost estimation.
  final CostEstimationTimeRange? timeRange;

  /// The estimated monthly cost to analyze the AWS resources. This value is the
  /// sum of the estimated costs to analyze each resource in the
  /// <code>Costs</code> object in this response.
  final double? totalCost;

  GetCostEstimationResponse({
    this.costs,
    this.nextToken,
    this.resourceCollection,
    this.status,
    this.timeRange,
    this.totalCost,
  });

  factory GetCostEstimationResponse.fromJson(Map<String, dynamic> json) {
    return GetCostEstimationResponse(
      costs: (json['Costs'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceResourceCost.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      resourceCollection: json['ResourceCollection'] != null
          ? CostEstimationResourceCollectionFilter.fromJson(
              json['ResourceCollection'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toCostEstimationStatus(),
      timeRange: json['TimeRange'] != null
          ? CostEstimationTimeRange.fromJson(
              json['TimeRange'] as Map<String, dynamic>)
          : null,
      totalCost: json['TotalCost'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final costs = this.costs;
    final nextToken = this.nextToken;
    final resourceCollection = this.resourceCollection;
    final status = this.status;
    final timeRange = this.timeRange;
    final totalCost = this.totalCost;
    return {
      if (costs != null) 'Costs': costs,
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (status != null) 'Status': status.toValue(),
      if (timeRange != null) 'TimeRange': timeRange,
      if (totalCost != null) 'TotalCost': totalCost,
    };
  }
}

class GetResourceCollectionResponse {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// The requested list of AWS resource collections. The one type of AWS resource
  /// collection supported is AWS CloudFormation stacks. DevOps Guru can be
  /// configured to analyze only the AWS resources that are defined in the stacks.
  /// You can specify up to 500 AWS CloudFormation stacks.
  final ResourceCollectionFilter? resourceCollection;

  GetResourceCollectionResponse({
    this.nextToken,
    this.resourceCollection,
  });

  factory GetResourceCollectionResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceCollectionResponse(
      nextToken: json['NextToken'] as String?,
      resourceCollection: json['ResourceCollection'] != null
          ? ResourceCollectionFilter.fromJson(
              json['ResourceCollection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceCollection = this.resourceCollection;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
    };
  }
}

/// Information about insight feedback received from a customer.
class InsightFeedback {
  /// The feedback provided by the customer.
  final InsightFeedbackOption? feedback;

  /// The insight feedback ID.
  final String? id;

  InsightFeedback({
    this.feedback,
    this.id,
  });

  factory InsightFeedback.fromJson(Map<String, dynamic> json) {
    return InsightFeedback(
      feedback: (json['Feedback'] as String?)?.toInsightFeedbackOption(),
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final feedback = this.feedback;
    final id = this.id;
    return {
      if (feedback != null) 'Feedback': feedback.toValue(),
      if (id != null) 'Id': id,
    };
  }
}

enum InsightFeedbackOption {
  validCollection,
  recommendationUseful,
  alertTooSensitive,
  dataNoisyAnomaly,
  dataIncorrect,
}

extension on InsightFeedbackOption {
  String toValue() {
    switch (this) {
      case InsightFeedbackOption.validCollection:
        return 'VALID_COLLECTION';
      case InsightFeedbackOption.recommendationUseful:
        return 'RECOMMENDATION_USEFUL';
      case InsightFeedbackOption.alertTooSensitive:
        return 'ALERT_TOO_SENSITIVE';
      case InsightFeedbackOption.dataNoisyAnomaly:
        return 'DATA_NOISY_ANOMALY';
      case InsightFeedbackOption.dataIncorrect:
        return 'DATA_INCORRECT';
    }
  }
}

extension on String {
  InsightFeedbackOption toInsightFeedbackOption() {
    switch (this) {
      case 'VALID_COLLECTION':
        return InsightFeedbackOption.validCollection;
      case 'RECOMMENDATION_USEFUL':
        return InsightFeedbackOption.recommendationUseful;
      case 'ALERT_TOO_SENSITIVE':
        return InsightFeedbackOption.alertTooSensitive;
      case 'DATA_NOISY_ANOMALY':
        return InsightFeedbackOption.dataNoisyAnomaly;
      case 'DATA_INCORRECT':
        return InsightFeedbackOption.dataIncorrect;
    }
    throw Exception('$this is not known in enum InsightFeedbackOption');
  }
}

/// Information about the number of open reactive and proactive insights that
/// can be used to gauge the health of your system.
class InsightHealth {
  /// The Meant Time to Recover (MTTR) for the insight.
  final int? meanTimeToRecoverInMilliseconds;

  /// The number of open proactive insights.
  final int? openProactiveInsights;

  /// The number of open reactive insights.
  final int? openReactiveInsights;

  InsightHealth({
    this.meanTimeToRecoverInMilliseconds,
    this.openProactiveInsights,
    this.openReactiveInsights,
  });

  factory InsightHealth.fromJson(Map<String, dynamic> json) {
    return InsightHealth(
      meanTimeToRecoverInMilliseconds:
          json['MeanTimeToRecoverInMilliseconds'] as int?,
      openProactiveInsights: json['OpenProactiveInsights'] as int?,
      openReactiveInsights: json['OpenReactiveInsights'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final meanTimeToRecoverInMilliseconds =
        this.meanTimeToRecoverInMilliseconds;
    final openProactiveInsights = this.openProactiveInsights;
    final openReactiveInsights = this.openReactiveInsights;
    return {
      if (meanTimeToRecoverInMilliseconds != null)
        'MeanTimeToRecoverInMilliseconds': meanTimeToRecoverInMilliseconds,
      if (openProactiveInsights != null)
        'OpenProactiveInsights': openProactiveInsights,
      if (openReactiveInsights != null)
        'OpenReactiveInsights': openReactiveInsights,
    };
  }
}

enum InsightSeverity {
  low,
  medium,
  high,
}

extension on InsightSeverity {
  String toValue() {
    switch (this) {
      case InsightSeverity.low:
        return 'LOW';
      case InsightSeverity.medium:
        return 'MEDIUM';
      case InsightSeverity.high:
        return 'HIGH';
    }
  }
}

extension on String {
  InsightSeverity toInsightSeverity() {
    switch (this) {
      case 'LOW':
        return InsightSeverity.low;
      case 'MEDIUM':
        return InsightSeverity.medium;
      case 'HIGH':
        return InsightSeverity.high;
    }
    throw Exception('$this is not known in enum InsightSeverity');
  }
}

enum InsightStatus {
  ongoing,
  closed,
}

extension on InsightStatus {
  String toValue() {
    switch (this) {
      case InsightStatus.ongoing:
        return 'ONGOING';
      case InsightStatus.closed:
        return 'CLOSED';
    }
  }
}

extension on String {
  InsightStatus toInsightStatus() {
    switch (this) {
      case 'ONGOING':
        return InsightStatus.ongoing;
      case 'CLOSED':
        return InsightStatus.closed;
    }
    throw Exception('$this is not known in enum InsightStatus');
  }
}

/// A time ranged that specifies when the observed behavior in an insight
/// started and ended.
class InsightTimeRange {
  /// The time when the behavior described in an insight started.
  final DateTime startTime;

  /// The time when the behavior described in an insight ended.
  final DateTime? endTime;

  InsightTimeRange({
    required this.startTime,
    this.endTime,
  });

  factory InsightTimeRange.fromJson(Map<String, dynamic> json) {
    return InsightTimeRange(
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
      endTime: timeStampFromJson(json['EndTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final startTime = this.startTime;
    final endTime = this.endTime;
    return {
      'StartTime': unixTimestampToJson(startTime),
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
    };
  }
}

enum InsightType {
  reactive,
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
  }
}

extension on String {
  InsightType toInsightType() {
    switch (this) {
      case 'REACTIVE':
        return InsightType.reactive;
      case 'PROACTIVE':
        return InsightType.proactive;
    }
    throw Exception('$this is not known in enum InsightType');
  }
}

class ListAnomaliesForInsightResponse {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// An array of <code>ProactiveAnomalySummary</code> objects that represent the
  /// requested anomalies
  final List<ProactiveAnomalySummary>? proactiveAnomalies;

  /// An array of <code>ReactiveAnomalySummary</code> objects that represent the
  /// requested anomalies
  final List<ReactiveAnomalySummary>? reactiveAnomalies;

  ListAnomaliesForInsightResponse({
    this.nextToken,
    this.proactiveAnomalies,
    this.reactiveAnomalies,
  });

  factory ListAnomaliesForInsightResponse.fromJson(Map<String, dynamic> json) {
    return ListAnomaliesForInsightResponse(
      nextToken: json['NextToken'] as String?,
      proactiveAnomalies: (json['ProactiveAnomalies'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ProactiveAnomalySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      reactiveAnomalies: (json['ReactiveAnomalies'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ReactiveAnomalySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final proactiveAnomalies = this.proactiveAnomalies;
    final reactiveAnomalies = this.reactiveAnomalies;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (proactiveAnomalies != null) 'ProactiveAnomalies': proactiveAnomalies,
      if (reactiveAnomalies != null) 'ReactiveAnomalies': reactiveAnomalies,
    };
  }
}

/// Filters you can use to specify which events are returned when
/// <code>ListEvents</code> is called.
class ListEventsFilters {
  /// The source, <code>AWS_CLOUD_TRAIL</code> or <code>AWS_CODE_DEPLOY</code>, of
  /// the events you want returned.
  final EventDataSource? dataSource;

  /// The class of the events you want to filter for, such as an infrastructure
  /// change, a deployment, or a schema change.
  final EventClass? eventClass;

  /// The AWS source that emitted the events you want to filter for.
  final String? eventSource;

  /// A time range during which you want the filtered events to have occurred.
  final EventTimeRange? eventTimeRange;

  /// An ID of an insight that is related to the events you want to filter for.
  final String? insightId;
  final ResourceCollection? resourceCollection;

  ListEventsFilters({
    this.dataSource,
    this.eventClass,
    this.eventSource,
    this.eventTimeRange,
    this.insightId,
    this.resourceCollection,
  });

  factory ListEventsFilters.fromJson(Map<String, dynamic> json) {
    return ListEventsFilters(
      dataSource: (json['DataSource'] as String?)?.toEventDataSource(),
      eventClass: (json['EventClass'] as String?)?.toEventClass(),
      eventSource: json['EventSource'] as String?,
      eventTimeRange: json['EventTimeRange'] != null
          ? EventTimeRange.fromJson(
              json['EventTimeRange'] as Map<String, dynamic>)
          : null,
      insightId: json['InsightId'] as String?,
      resourceCollection: json['ResourceCollection'] != null
          ? ResourceCollection.fromJson(
              json['ResourceCollection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final eventClass = this.eventClass;
    final eventSource = this.eventSource;
    final eventTimeRange = this.eventTimeRange;
    final insightId = this.insightId;
    final resourceCollection = this.resourceCollection;
    return {
      if (dataSource != null) 'DataSource': dataSource.toValue(),
      if (eventClass != null) 'EventClass': eventClass.toValue(),
      if (eventSource != null) 'EventSource': eventSource,
      if (eventTimeRange != null) 'EventTimeRange': eventTimeRange,
      if (insightId != null) 'InsightId': insightId,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
    };
  }
}

class ListEventsResponse {
  /// A list of the requested events.
  final List<Event> events;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  ListEventsResponse({
    required this.events,
    this.nextToken,
  });

  factory ListEventsResponse.fromJson(Map<String, dynamic> json) {
    return ListEventsResponse(
      events: (json['Events'] as List)
          .whereNotNull()
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      'Events': events,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Used to filter for insights that have any status.
class ListInsightsAnyStatusFilter {
  /// A time range used to specify when the behavior of the filtered insights
  /// started.
  final StartTimeRange startTimeRange;

  /// Use to filter for either <code>REACTIVE</code> or <code>PROACTIVE</code>
  /// insights.
  final InsightType type;

  ListInsightsAnyStatusFilter({
    required this.startTimeRange,
    required this.type,
  });

  factory ListInsightsAnyStatusFilter.fromJson(Map<String, dynamic> json) {
    return ListInsightsAnyStatusFilter(
      startTimeRange: StartTimeRange.fromJson(
          json['StartTimeRange'] as Map<String, dynamic>),
      type: (json['Type'] as String).toInsightType(),
    );
  }

  Map<String, dynamic> toJson() {
    final startTimeRange = this.startTimeRange;
    final type = this.type;
    return {
      'StartTimeRange': startTimeRange,
      'Type': type.toValue(),
    };
  }
}

/// Used to filter for insights that have the status <code>CLOSED</code>.
class ListInsightsClosedStatusFilter {
  /// A time range used to specify when the behavior of the filtered insights
  /// ended.
  final EndTimeRange endTimeRange;

  /// Use to filter for either <code>REACTIVE</code> or <code>PROACTIVE</code>
  /// insights.
  final InsightType type;

  ListInsightsClosedStatusFilter({
    required this.endTimeRange,
    required this.type,
  });

  factory ListInsightsClosedStatusFilter.fromJson(Map<String, dynamic> json) {
    return ListInsightsClosedStatusFilter(
      endTimeRange:
          EndTimeRange.fromJson(json['EndTimeRange'] as Map<String, dynamic>),
      type: (json['Type'] as String).toInsightType(),
    );
  }

  Map<String, dynamic> toJson() {
    final endTimeRange = this.endTimeRange;
    final type = this.type;
    return {
      'EndTimeRange': endTimeRange,
      'Type': type.toValue(),
    };
  }
}

/// Used to filter for insights that have the status <code>ONGOING</code>.
class ListInsightsOngoingStatusFilter {
  /// Use to filter for either <code>REACTIVE</code> or <code>PROACTIVE</code>
  /// insights.
  final InsightType type;

  ListInsightsOngoingStatusFilter({
    required this.type,
  });

  factory ListInsightsOngoingStatusFilter.fromJson(Map<String, dynamic> json) {
    return ListInsightsOngoingStatusFilter(
      type: (json['Type'] as String).toInsightType(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'Type': type.toValue(),
    };
  }
}

class ListInsightsResponse {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// The returned list of proactive insights.
  final List<ProactiveInsightSummary>? proactiveInsights;

  /// The returned list of reactive insights.
  final List<ReactiveInsightSummary>? reactiveInsights;

  ListInsightsResponse({
    this.nextToken,
    this.proactiveInsights,
    this.reactiveInsights,
  });

  factory ListInsightsResponse.fromJson(Map<String, dynamic> json) {
    return ListInsightsResponse(
      nextToken: json['NextToken'] as String?,
      proactiveInsights: (json['ProactiveInsights'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ProactiveInsightSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      reactiveInsights: (json['ReactiveInsights'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ReactiveInsightSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final proactiveInsights = this.proactiveInsights;
    final reactiveInsights = this.reactiveInsights;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (proactiveInsights != null) 'ProactiveInsights': proactiveInsights,
      if (reactiveInsights != null) 'ReactiveInsights': reactiveInsights,
    };
  }
}

/// A filter used by <code>ListInsights</code> to specify which insights to
/// return.
class ListInsightsStatusFilter {
  /// A <code>ListInsightsAnyStatusFilter</code> that specifies insights of any
  /// status that are either <code>REACTIVE</code> or <code>PROACTIVE</code>.
  final ListInsightsAnyStatusFilter? any;

  /// A <code>ListInsightsClosedStatusFilter</code> that specifies closed insights
  /// that are either <code>REACTIVE</code> or <code>PROACTIVE</code>.
  final ListInsightsClosedStatusFilter? closed;

  /// A <code>ListInsightsAnyStatusFilter</code> that specifies ongoing insights
  /// that are either <code>REACTIVE</code> or <code>PROACTIVE</code>.
  final ListInsightsOngoingStatusFilter? ongoing;

  ListInsightsStatusFilter({
    this.any,
    this.closed,
    this.ongoing,
  });

  factory ListInsightsStatusFilter.fromJson(Map<String, dynamic> json) {
    return ListInsightsStatusFilter(
      any: json['Any'] != null
          ? ListInsightsAnyStatusFilter.fromJson(
              json['Any'] as Map<String, dynamic>)
          : null,
      closed: json['Closed'] != null
          ? ListInsightsClosedStatusFilter.fromJson(
              json['Closed'] as Map<String, dynamic>)
          : null,
      ongoing: json['Ongoing'] != null
          ? ListInsightsOngoingStatusFilter.fromJson(
              json['Ongoing'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final any = this.any;
    final closed = this.closed;
    final ongoing = this.ongoing;
    return {
      if (any != null) 'Any': any,
      if (closed != null) 'Closed': closed,
      if (ongoing != null) 'Ongoing': ongoing,
    };
  }
}

class ListNotificationChannelsResponse {
  /// An array that contains the requested notification channels.
  final List<NotificationChannel>? channels;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  ListNotificationChannelsResponse({
    this.channels,
    this.nextToken,
  });

  factory ListNotificationChannelsResponse.fromJson(Map<String, dynamic> json) {
    return ListNotificationChannelsResponse(
      channels: (json['Channels'] as List?)
          ?.whereNotNull()
          .map((e) => NotificationChannel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final nextToken = this.nextToken;
    return {
      if (channels != null) 'Channels': channels,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRecommendationsResponse {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// An array of the requested recommendations.
  final List<Recommendation>? recommendations;

  ListRecommendationsResponse({
    this.nextToken,
    this.recommendations,
  });

  factory ListRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommendationsResponse(
      nextToken: json['NextToken'] as String?,
      recommendations: (json['Recommendations'] as List?)
          ?.whereNotNull()
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recommendations = this.recommendations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (recommendations != null) 'Recommendations': recommendations,
    };
  }
}

enum Locale {
  deDe,
  enUs,
  enGb,
  esEs,
  frFr,
  itIt,
  jaJp,
  koKr,
  ptBr,
  zhCn,
  zhTw,
}

extension on Locale {
  String toValue() {
    switch (this) {
      case Locale.deDe:
        return 'DE_DE';
      case Locale.enUs:
        return 'EN_US';
      case Locale.enGb:
        return 'EN_GB';
      case Locale.esEs:
        return 'ES_ES';
      case Locale.frFr:
        return 'FR_FR';
      case Locale.itIt:
        return 'IT_IT';
      case Locale.jaJp:
        return 'JA_JP';
      case Locale.koKr:
        return 'KO_KR';
      case Locale.ptBr:
        return 'PT_BR';
      case Locale.zhCn:
        return 'ZH_CN';
      case Locale.zhTw:
        return 'ZH_TW';
    }
  }
}

extension on String {
  Locale toLocale() {
    switch (this) {
      case 'DE_DE':
        return Locale.deDe;
      case 'EN_US':
        return Locale.enUs;
      case 'EN_GB':
        return Locale.enGb;
      case 'ES_ES':
        return Locale.esEs;
      case 'FR_FR':
        return Locale.frFr;
      case 'IT_IT':
        return Locale.itIt;
      case 'JA_JP':
        return Locale.jaJp;
      case 'KO_KR':
        return Locale.koKr;
      case 'PT_BR':
        return Locale.ptBr;
      case 'ZH_CN':
        return Locale.zhCn;
      case 'ZH_TW':
        return Locale.zhTw;
    }
    throw Exception('$this is not known in enum Locale');
  }
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
class NotificationChannel {
  /// A <code>NotificationChannelConfig</code> object that contains information
  /// about configured notification channels.
  final NotificationChannelConfig? config;

  /// The ID of a notification channel.
  final String? id;

  NotificationChannel({
    this.config,
    this.id,
  });

  factory NotificationChannel.fromJson(Map<String, dynamic> json) {
    return NotificationChannel(
      config: json['Config'] != null
          ? NotificationChannelConfig.fromJson(
              json['Config'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final config = this.config;
    final id = this.id;
    return {
      if (config != null) 'Config': config,
      if (id != null) 'Id': id,
    };
  }
}

/// Information about notification channels you have configured with DevOps
/// Guru. The one supported notification channel is Amazon Simple Notification
/// Service (Amazon SNS).
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
  final SnsChannelConfig sns;

  NotificationChannelConfig({
    required this.sns,
  });

  factory NotificationChannelConfig.fromJson(Map<String, dynamic> json) {
    return NotificationChannelConfig(
      sns: SnsChannelConfig.fromJson(json['Sns'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final sns = this.sns;
    return {
      'Sns': sns,
    };
  }
}

/// Information about whether DevOps Guru is configured to create an OpsItem in
/// AWS Systems Manager OpsCenter for each created insight.
class OpsCenterIntegration {
  /// Specifies if DevOps Guru is enabled to create an AWS Systems Manager OpsItem
  /// for each created insight.
  final OptInStatus? optInStatus;

  OpsCenterIntegration({
    this.optInStatus,
  });

  factory OpsCenterIntegration.fromJson(Map<String, dynamic> json) {
    return OpsCenterIntegration(
      optInStatus: (json['OptInStatus'] as String?)?.toOptInStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final optInStatus = this.optInStatus;
    return {
      if (optInStatus != null) 'OptInStatus': optInStatus.toValue(),
    };
  }
}

/// Information about whether DevOps Guru is configured to create an OpsItem in
/// AWS Systems Manager OpsCenter for each created insight.
class OpsCenterIntegrationConfig {
  /// Specifies if DevOps Guru is enabled to create an AWS Systems Manager OpsItem
  /// for each created insight.
  final OptInStatus? optInStatus;

  OpsCenterIntegrationConfig({
    this.optInStatus,
  });

  factory OpsCenterIntegrationConfig.fromJson(Map<String, dynamic> json) {
    return OpsCenterIntegrationConfig(
      optInStatus: (json['OptInStatus'] as String?)?.toOptInStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final optInStatus = this.optInStatus;
    return {
      if (optInStatus != null) 'OptInStatus': optInStatus.toValue(),
    };
  }
}

/// Specifies if DevOps Guru is enabled to create an AWS Systems Manager OpsItem
/// for each created insight.
enum OptInStatus {
  enabled,
  disabled,
}

extension on OptInStatus {
  String toValue() {
    switch (this) {
      case OptInStatus.enabled:
        return 'ENABLED';
      case OptInStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  OptInStatus toOptInStatus() {
    switch (this) {
      case 'ENABLED':
        return OptInStatus.enabled;
      case 'DISABLED':
        return OptInStatus.disabled;
    }
    throw Exception('$this is not known in enum OptInStatus');
  }
}

/// The time range during which anomalous behavior in a proactive anomaly or an
/// insight is expected to occur.
class PredictionTimeRange {
  /// The time range during which a metric limit is expected to be exceeded. This
  /// applies to proactive insights only.
  final DateTime startTime;

  /// The time when the behavior in a proactive insight is expected to end.
  final DateTime? endTime;

  PredictionTimeRange({
    required this.startTime,
    this.endTime,
  });

  factory PredictionTimeRange.fromJson(Map<String, dynamic> json) {
    return PredictionTimeRange(
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
      endTime: timeStampFromJson(json['EndTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final startTime = this.startTime;
    final endTime = this.endTime;
    return {
      'StartTime': unixTimestampToJson(startTime),
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
    };
  }
}

/// Information about an anomaly. This object is returned by
/// <code>ListAnomalies</code>.
class ProactiveAnomaly {
  /// A <code>AnomalyReportedTimeRange</code> object that specifies the time range
  /// between when the anomaly is opened and the time when it is closed.
  final AnomalyReportedTimeRange? anomalyReportedTimeRange;
  final AnomalyTimeRange? anomalyTimeRange;

  /// The ID of the insight that contains this anomaly. An insight is composed of
  /// related anomalies.
  final String? associatedInsightId;

  /// The ID of a proactive anomaly.
  final String? id;

  /// A threshold that was exceeded by behavior in analyzed resources. Exceeding
  /// this threshold is related to the anomalous behavior that generated this
  /// anomaly.
  final double? limit;
  final PredictionTimeRange? predictionTimeRange;
  final ResourceCollection? resourceCollection;

  /// The severity of a proactive anomaly.
  final AnomalySeverity? severity;

  /// Details about the source of the analyzed operational data that triggered the
  /// anomaly. The one supported source is Amazon CloudWatch metrics.
  final AnomalySourceDetails? sourceDetails;

  /// The status of a proactive anomaly.
  final AnomalyStatus? status;

  /// The time of the anomaly's most recent update.
  final DateTime? updateTime;

  ProactiveAnomaly({
    this.anomalyReportedTimeRange,
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

  factory ProactiveAnomaly.fromJson(Map<String, dynamic> json) {
    return ProactiveAnomaly(
      anomalyReportedTimeRange: json['AnomalyReportedTimeRange'] != null
          ? AnomalyReportedTimeRange.fromJson(
              json['AnomalyReportedTimeRange'] as Map<String, dynamic>)
          : null,
      anomalyTimeRange: json['AnomalyTimeRange'] != null
          ? AnomalyTimeRange.fromJson(
              json['AnomalyTimeRange'] as Map<String, dynamic>)
          : null,
      associatedInsightId: json['AssociatedInsightId'] as String?,
      id: json['Id'] as String?,
      limit: json['Limit'] as double?,
      predictionTimeRange: json['PredictionTimeRange'] != null
          ? PredictionTimeRange.fromJson(
              json['PredictionTimeRange'] as Map<String, dynamic>)
          : null,
      resourceCollection: json['ResourceCollection'] != null
          ? ResourceCollection.fromJson(
              json['ResourceCollection'] as Map<String, dynamic>)
          : null,
      severity: (json['Severity'] as String?)?.toAnomalySeverity(),
      sourceDetails: json['SourceDetails'] != null
          ? AnomalySourceDetails.fromJson(
              json['SourceDetails'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toAnomalyStatus(),
      updateTime: timeStampFromJson(json['UpdateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyReportedTimeRange = this.anomalyReportedTimeRange;
    final anomalyTimeRange = this.anomalyTimeRange;
    final associatedInsightId = this.associatedInsightId;
    final id = this.id;
    final limit = this.limit;
    final predictionTimeRange = this.predictionTimeRange;
    final resourceCollection = this.resourceCollection;
    final severity = this.severity;
    final sourceDetails = this.sourceDetails;
    final status = this.status;
    final updateTime = this.updateTime;
    return {
      if (anomalyReportedTimeRange != null)
        'AnomalyReportedTimeRange': anomalyReportedTimeRange,
      if (anomalyTimeRange != null) 'AnomalyTimeRange': anomalyTimeRange,
      if (associatedInsightId != null)
        'AssociatedInsightId': associatedInsightId,
      if (id != null) 'Id': id,
      if (limit != null) 'Limit': limit,
      if (predictionTimeRange != null)
        'PredictionTimeRange': predictionTimeRange,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (severity != null) 'Severity': severity.toValue(),
      if (sourceDetails != null) 'SourceDetails': sourceDetails,
      if (status != null) 'Status': status.toValue(),
      if (updateTime != null) 'UpdateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// Details about a proactive anomaly. This object is returned by
/// <code>DescribeAnomaly.</code>
class ProactiveAnomalySummary {
  /// A <code>AnomalyReportedTimeRange</code> object that specifies the time range
  /// between when the anomaly is opened and the time when it is closed.
  final AnomalyReportedTimeRange? anomalyReportedTimeRange;
  final AnomalyTimeRange? anomalyTimeRange;

  /// The ID of the insight that contains this anomaly. An insight is composed of
  /// related anomalies.
  final String? associatedInsightId;

  /// The ID of the anomaly.
  final String? id;

  /// A threshold that was exceeded by behavior in analyzed resources. Exceeding
  /// this threshold is related to the anomalous behavior that generated this
  /// anomaly.
  final double? limit;
  final PredictionTimeRange? predictionTimeRange;
  final ResourceCollection? resourceCollection;

  /// The severity of the anomaly.
  final AnomalySeverity? severity;

  /// Details about the source of the analyzed operational data that triggered the
  /// anomaly. The one supported source is Amazon CloudWatch metrics.
  final AnomalySourceDetails? sourceDetails;

  /// The status of the anomaly.
  final AnomalyStatus? status;

  /// The time of the anomaly's most recent update.
  final DateTime? updateTime;

  ProactiveAnomalySummary({
    this.anomalyReportedTimeRange,
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

  factory ProactiveAnomalySummary.fromJson(Map<String, dynamic> json) {
    return ProactiveAnomalySummary(
      anomalyReportedTimeRange: json['AnomalyReportedTimeRange'] != null
          ? AnomalyReportedTimeRange.fromJson(
              json['AnomalyReportedTimeRange'] as Map<String, dynamic>)
          : null,
      anomalyTimeRange: json['AnomalyTimeRange'] != null
          ? AnomalyTimeRange.fromJson(
              json['AnomalyTimeRange'] as Map<String, dynamic>)
          : null,
      associatedInsightId: json['AssociatedInsightId'] as String?,
      id: json['Id'] as String?,
      limit: json['Limit'] as double?,
      predictionTimeRange: json['PredictionTimeRange'] != null
          ? PredictionTimeRange.fromJson(
              json['PredictionTimeRange'] as Map<String, dynamic>)
          : null,
      resourceCollection: json['ResourceCollection'] != null
          ? ResourceCollection.fromJson(
              json['ResourceCollection'] as Map<String, dynamic>)
          : null,
      severity: (json['Severity'] as String?)?.toAnomalySeverity(),
      sourceDetails: json['SourceDetails'] != null
          ? AnomalySourceDetails.fromJson(
              json['SourceDetails'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toAnomalyStatus(),
      updateTime: timeStampFromJson(json['UpdateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyReportedTimeRange = this.anomalyReportedTimeRange;
    final anomalyTimeRange = this.anomalyTimeRange;
    final associatedInsightId = this.associatedInsightId;
    final id = this.id;
    final limit = this.limit;
    final predictionTimeRange = this.predictionTimeRange;
    final resourceCollection = this.resourceCollection;
    final severity = this.severity;
    final sourceDetails = this.sourceDetails;
    final status = this.status;
    final updateTime = this.updateTime;
    return {
      if (anomalyReportedTimeRange != null)
        'AnomalyReportedTimeRange': anomalyReportedTimeRange,
      if (anomalyTimeRange != null) 'AnomalyTimeRange': anomalyTimeRange,
      if (associatedInsightId != null)
        'AssociatedInsightId': associatedInsightId,
      if (id != null) 'Id': id,
      if (limit != null) 'Limit': limit,
      if (predictionTimeRange != null)
        'PredictionTimeRange': predictionTimeRange,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (severity != null) 'Severity': severity.toValue(),
      if (sourceDetails != null) 'SourceDetails': sourceDetails,
      if (status != null) 'Status': status.toValue(),
      if (updateTime != null) 'UpdateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// Details about a proactive insight. This object is returned by
/// <code>ListInsights</code>.
class ProactiveInsight {
  /// The ID of the proactive insight.
  final String? id;
  final InsightTimeRange? insightTimeRange;

  /// The name of the proactive insight.
  final String? name;
  final PredictionTimeRange? predictionTimeRange;
  final ResourceCollection? resourceCollection;

  /// The severity of the proactive insight.
  final InsightSeverity? severity;

  /// The ID of the AWS System Manager OpsItem created for this insight. You must
  /// enable the creation of OpstItems insights before they are created for each
  /// insight.
  final String? ssmOpsItemId;

  /// The status of the proactive insight.
  final InsightStatus? status;

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

  factory ProactiveInsight.fromJson(Map<String, dynamic> json) {
    return ProactiveInsight(
      id: json['Id'] as String?,
      insightTimeRange: json['InsightTimeRange'] != null
          ? InsightTimeRange.fromJson(
              json['InsightTimeRange'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      predictionTimeRange: json['PredictionTimeRange'] != null
          ? PredictionTimeRange.fromJson(
              json['PredictionTimeRange'] as Map<String, dynamic>)
          : null,
      resourceCollection: json['ResourceCollection'] != null
          ? ResourceCollection.fromJson(
              json['ResourceCollection'] as Map<String, dynamic>)
          : null,
      severity: (json['Severity'] as String?)?.toInsightSeverity(),
      ssmOpsItemId: json['SsmOpsItemId'] as String?,
      status: (json['Status'] as String?)?.toInsightStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final insightTimeRange = this.insightTimeRange;
    final name = this.name;
    final predictionTimeRange = this.predictionTimeRange;
    final resourceCollection = this.resourceCollection;
    final severity = this.severity;
    final ssmOpsItemId = this.ssmOpsItemId;
    final status = this.status;
    return {
      if (id != null) 'Id': id,
      if (insightTimeRange != null) 'InsightTimeRange': insightTimeRange,
      if (name != null) 'Name': name,
      if (predictionTimeRange != null)
        'PredictionTimeRange': predictionTimeRange,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (severity != null) 'Severity': severity.toValue(),
      if (ssmOpsItemId != null) 'SsmOpsItemId': ssmOpsItemId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Details about a proactive insight. This object is returned by
/// <code>DescribeInsight.</code>
class ProactiveInsightSummary {
  /// The ID of the proactive insight.
  final String? id;
  final InsightTimeRange? insightTimeRange;

  /// The name of the proactive insight.
  final String? name;
  final PredictionTimeRange? predictionTimeRange;
  final ResourceCollection? resourceCollection;

  /// A collection of the names of AWS services.
  final ServiceCollection? serviceCollection;

  /// The severity of the proactive insight.
  final InsightSeverity? severity;

  /// The status of the proactive insight.
  final InsightStatus? status;

  ProactiveInsightSummary({
    this.id,
    this.insightTimeRange,
    this.name,
    this.predictionTimeRange,
    this.resourceCollection,
    this.serviceCollection,
    this.severity,
    this.status,
  });

  factory ProactiveInsightSummary.fromJson(Map<String, dynamic> json) {
    return ProactiveInsightSummary(
      id: json['Id'] as String?,
      insightTimeRange: json['InsightTimeRange'] != null
          ? InsightTimeRange.fromJson(
              json['InsightTimeRange'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      predictionTimeRange: json['PredictionTimeRange'] != null
          ? PredictionTimeRange.fromJson(
              json['PredictionTimeRange'] as Map<String, dynamic>)
          : null,
      resourceCollection: json['ResourceCollection'] != null
          ? ResourceCollection.fromJson(
              json['ResourceCollection'] as Map<String, dynamic>)
          : null,
      serviceCollection: json['ServiceCollection'] != null
          ? ServiceCollection.fromJson(
              json['ServiceCollection'] as Map<String, dynamic>)
          : null,
      severity: (json['Severity'] as String?)?.toInsightSeverity(),
      status: (json['Status'] as String?)?.toInsightStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final insightTimeRange = this.insightTimeRange;
    final name = this.name;
    final predictionTimeRange = this.predictionTimeRange;
    final resourceCollection = this.resourceCollection;
    final serviceCollection = this.serviceCollection;
    final severity = this.severity;
    final status = this.status;
    return {
      if (id != null) 'Id': id,
      if (insightTimeRange != null) 'InsightTimeRange': insightTimeRange,
      if (name != null) 'Name': name,
      if (predictionTimeRange != null)
        'PredictionTimeRange': predictionTimeRange,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (serviceCollection != null) 'ServiceCollection': serviceCollection,
      if (severity != null) 'Severity': severity.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class PutFeedbackResponse {
  PutFeedbackResponse();

  factory PutFeedbackResponse.fromJson(Map<String, dynamic> _) {
    return PutFeedbackResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Details about a reactive anomaly. This object is returned by
/// <code>ListAnomalies</code>.
class ReactiveAnomaly {
  /// A <code>AnomalyReportedTimeRange</code> object that specifies the time range
  /// between when the anomaly is opened and the time when it is closed.
  final AnomalyReportedTimeRange? anomalyReportedTimeRange;
  final AnomalyTimeRange? anomalyTimeRange;

  /// The ID of the insight that contains this anomaly. An insight is composed of
  /// related anomalies.
  final String? associatedInsightId;

  /// The ID of the reactive anomaly.
  final String? id;
  final ResourceCollection? resourceCollection;

  /// The severity of the anomaly.
  final AnomalySeverity? severity;

  /// Details about the source of the analyzed operational data that triggered the
  /// anomaly. The one supported source is Amazon CloudWatch metrics.
  final AnomalySourceDetails? sourceDetails;

  /// The status of the anomaly.
  final AnomalyStatus? status;

  ReactiveAnomaly({
    this.anomalyReportedTimeRange,
    this.anomalyTimeRange,
    this.associatedInsightId,
    this.id,
    this.resourceCollection,
    this.severity,
    this.sourceDetails,
    this.status,
  });

  factory ReactiveAnomaly.fromJson(Map<String, dynamic> json) {
    return ReactiveAnomaly(
      anomalyReportedTimeRange: json['AnomalyReportedTimeRange'] != null
          ? AnomalyReportedTimeRange.fromJson(
              json['AnomalyReportedTimeRange'] as Map<String, dynamic>)
          : null,
      anomalyTimeRange: json['AnomalyTimeRange'] != null
          ? AnomalyTimeRange.fromJson(
              json['AnomalyTimeRange'] as Map<String, dynamic>)
          : null,
      associatedInsightId: json['AssociatedInsightId'] as String?,
      id: json['Id'] as String?,
      resourceCollection: json['ResourceCollection'] != null
          ? ResourceCollection.fromJson(
              json['ResourceCollection'] as Map<String, dynamic>)
          : null,
      severity: (json['Severity'] as String?)?.toAnomalySeverity(),
      sourceDetails: json['SourceDetails'] != null
          ? AnomalySourceDetails.fromJson(
              json['SourceDetails'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toAnomalyStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyReportedTimeRange = this.anomalyReportedTimeRange;
    final anomalyTimeRange = this.anomalyTimeRange;
    final associatedInsightId = this.associatedInsightId;
    final id = this.id;
    final resourceCollection = this.resourceCollection;
    final severity = this.severity;
    final sourceDetails = this.sourceDetails;
    final status = this.status;
    return {
      if (anomalyReportedTimeRange != null)
        'AnomalyReportedTimeRange': anomalyReportedTimeRange,
      if (anomalyTimeRange != null) 'AnomalyTimeRange': anomalyTimeRange,
      if (associatedInsightId != null)
        'AssociatedInsightId': associatedInsightId,
      if (id != null) 'Id': id,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (severity != null) 'Severity': severity.toValue(),
      if (sourceDetails != null) 'SourceDetails': sourceDetails,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Details about a reactive anomaly. This object is returned by
/// <code>DescribeAnomaly.</code>
class ReactiveAnomalySummary {
  /// A <code>AnomalyReportedTimeRange</code> object that specifies the time range
  /// between when the anomaly is opened and the time when it is closed.
  final AnomalyReportedTimeRange? anomalyReportedTimeRange;
  final AnomalyTimeRange? anomalyTimeRange;

  /// The ID of the insight that contains this anomaly. An insight is composed of
  /// related anomalies.
  final String? associatedInsightId;

  /// The ID of the reactive anomaly.
  final String? id;
  final ResourceCollection? resourceCollection;

  /// The severity of the reactive anomaly.
  final AnomalySeverity? severity;

  /// Details about the source of the analyzed operational data that triggered the
  /// anomaly. The one supported source is Amazon CloudWatch metrics.
  final AnomalySourceDetails? sourceDetails;

  /// The status of the reactive anomaly.
  final AnomalyStatus? status;

  ReactiveAnomalySummary({
    this.anomalyReportedTimeRange,
    this.anomalyTimeRange,
    this.associatedInsightId,
    this.id,
    this.resourceCollection,
    this.severity,
    this.sourceDetails,
    this.status,
  });

  factory ReactiveAnomalySummary.fromJson(Map<String, dynamic> json) {
    return ReactiveAnomalySummary(
      anomalyReportedTimeRange: json['AnomalyReportedTimeRange'] != null
          ? AnomalyReportedTimeRange.fromJson(
              json['AnomalyReportedTimeRange'] as Map<String, dynamic>)
          : null,
      anomalyTimeRange: json['AnomalyTimeRange'] != null
          ? AnomalyTimeRange.fromJson(
              json['AnomalyTimeRange'] as Map<String, dynamic>)
          : null,
      associatedInsightId: json['AssociatedInsightId'] as String?,
      id: json['Id'] as String?,
      resourceCollection: json['ResourceCollection'] != null
          ? ResourceCollection.fromJson(
              json['ResourceCollection'] as Map<String, dynamic>)
          : null,
      severity: (json['Severity'] as String?)?.toAnomalySeverity(),
      sourceDetails: json['SourceDetails'] != null
          ? AnomalySourceDetails.fromJson(
              json['SourceDetails'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toAnomalyStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyReportedTimeRange = this.anomalyReportedTimeRange;
    final anomalyTimeRange = this.anomalyTimeRange;
    final associatedInsightId = this.associatedInsightId;
    final id = this.id;
    final resourceCollection = this.resourceCollection;
    final severity = this.severity;
    final sourceDetails = this.sourceDetails;
    final status = this.status;
    return {
      if (anomalyReportedTimeRange != null)
        'AnomalyReportedTimeRange': anomalyReportedTimeRange,
      if (anomalyTimeRange != null) 'AnomalyTimeRange': anomalyTimeRange,
      if (associatedInsightId != null)
        'AssociatedInsightId': associatedInsightId,
      if (id != null) 'Id': id,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (severity != null) 'Severity': severity.toValue(),
      if (sourceDetails != null) 'SourceDetails': sourceDetails,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Information about a reactive insight. This object is returned by
/// <code>ListInsights</code>.
class ReactiveInsight {
  /// The ID of a reactive insight.
  final String? id;
  final InsightTimeRange? insightTimeRange;

  /// The name of a reactive insight.
  final String? name;
  final ResourceCollection? resourceCollection;

  /// The severity of a reactive insight.
  final InsightSeverity? severity;

  /// The ID of the AWS System Manager OpsItem created for this insight. You must
  /// enable the creation of OpstItems insights before they are created for each
  /// insight.
  final String? ssmOpsItemId;

  /// The status of a reactive insight.
  final InsightStatus? status;

  ReactiveInsight({
    this.id,
    this.insightTimeRange,
    this.name,
    this.resourceCollection,
    this.severity,
    this.ssmOpsItemId,
    this.status,
  });

  factory ReactiveInsight.fromJson(Map<String, dynamic> json) {
    return ReactiveInsight(
      id: json['Id'] as String?,
      insightTimeRange: json['InsightTimeRange'] != null
          ? InsightTimeRange.fromJson(
              json['InsightTimeRange'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      resourceCollection: json['ResourceCollection'] != null
          ? ResourceCollection.fromJson(
              json['ResourceCollection'] as Map<String, dynamic>)
          : null,
      severity: (json['Severity'] as String?)?.toInsightSeverity(),
      ssmOpsItemId: json['SsmOpsItemId'] as String?,
      status: (json['Status'] as String?)?.toInsightStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final insightTimeRange = this.insightTimeRange;
    final name = this.name;
    final resourceCollection = this.resourceCollection;
    final severity = this.severity;
    final ssmOpsItemId = this.ssmOpsItemId;
    final status = this.status;
    return {
      if (id != null) 'Id': id,
      if (insightTimeRange != null) 'InsightTimeRange': insightTimeRange,
      if (name != null) 'Name': name,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (severity != null) 'Severity': severity.toValue(),
      if (ssmOpsItemId != null) 'SsmOpsItemId': ssmOpsItemId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Information about a reactive insight. This object is returned by
/// <code>DescribeInsight.</code>
class ReactiveInsightSummary {
  /// The ID of a reactive summary.
  final String? id;
  final InsightTimeRange? insightTimeRange;

  /// The name of a reactive insight.
  final String? name;
  final ResourceCollection? resourceCollection;

  /// A collection of the names of AWS services.
  final ServiceCollection? serviceCollection;

  /// The severity of a reactive insight.
  final InsightSeverity? severity;

  /// The status of a reactive insight.
  final InsightStatus? status;

  ReactiveInsightSummary({
    this.id,
    this.insightTimeRange,
    this.name,
    this.resourceCollection,
    this.serviceCollection,
    this.severity,
    this.status,
  });

  factory ReactiveInsightSummary.fromJson(Map<String, dynamic> json) {
    return ReactiveInsightSummary(
      id: json['Id'] as String?,
      insightTimeRange: json['InsightTimeRange'] != null
          ? InsightTimeRange.fromJson(
              json['InsightTimeRange'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      resourceCollection: json['ResourceCollection'] != null
          ? ResourceCollection.fromJson(
              json['ResourceCollection'] as Map<String, dynamic>)
          : null,
      serviceCollection: json['ServiceCollection'] != null
          ? ServiceCollection.fromJson(
              json['ServiceCollection'] as Map<String, dynamic>)
          : null,
      severity: (json['Severity'] as String?)?.toInsightSeverity(),
      status: (json['Status'] as String?)?.toInsightStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final insightTimeRange = this.insightTimeRange;
    final name = this.name;
    final resourceCollection = this.resourceCollection;
    final serviceCollection = this.serviceCollection;
    final severity = this.severity;
    final status = this.status;
    return {
      if (id != null) 'Id': id,
      if (insightTimeRange != null) 'InsightTimeRange': insightTimeRange,
      if (name != null) 'Name': name,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (serviceCollection != null) 'ServiceCollection': serviceCollection,
      if (severity != null) 'Severity': severity.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Recommendation information to help you remediate detected anomalous behavior
/// that generated an insight.
class Recommendation {
  /// A description of the problem.
  final String? description;

  /// A hyperlink to information to help you address the problem.
  final String? link;

  /// The name of the recommendation.
  final String? name;

  /// The reason DevOps Guru flagged the anomalous behavior as a problem.
  final String? reason;

  /// Anomalies that are related to the problem. Use these Anomalies to learn more
  /// about what's happening and to help address the issue.
  final List<RecommendationRelatedAnomaly>? relatedAnomalies;

  /// Events that are related to the problem. Use these events to learn more about
  /// what's happening and to help address the issue.
  final List<RecommendationRelatedEvent>? relatedEvents;

  Recommendation({
    this.description,
    this.link,
    this.name,
    this.reason,
    this.relatedAnomalies,
    this.relatedEvents,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      description: json['Description'] as String?,
      link: json['Link'] as String?,
      name: json['Name'] as String?,
      reason: json['Reason'] as String?,
      relatedAnomalies: (json['RelatedAnomalies'] as List?)
          ?.whereNotNull()
          .map((e) =>
              RecommendationRelatedAnomaly.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedEvents: (json['RelatedEvents'] as List?)
          ?.whereNotNull()
          .map((e) =>
              RecommendationRelatedEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final link = this.link;
    final name = this.name;
    final reason = this.reason;
    final relatedAnomalies = this.relatedAnomalies;
    final relatedEvents = this.relatedEvents;
    return {
      if (description != null) 'Description': description,
      if (link != null) 'Link': link,
      if (name != null) 'Name': name,
      if (reason != null) 'Reason': reason,
      if (relatedAnomalies != null) 'RelatedAnomalies': relatedAnomalies,
      if (relatedEvents != null) 'RelatedEvents': relatedEvents,
    };
  }
}

/// Information about an anomaly that is related to a recommendation.
class RecommendationRelatedAnomaly {
  /// An array of objects that represent resources in which DevOps Guru detected
  /// anomalous behavior. Each object contains the name and type of the resource.
  final List<RecommendationRelatedAnomalyResource>? resources;

  /// Information about where the anomalous behavior related the recommendation
  /// was found. For example, details in Amazon CloudWatch metrics.
  final List<RecommendationRelatedAnomalySourceDetail>? sourceDetails;

  RecommendationRelatedAnomaly({
    this.resources,
    this.sourceDetails,
  });

  factory RecommendationRelatedAnomaly.fromJson(Map<String, dynamic> json) {
    return RecommendationRelatedAnomaly(
      resources: (json['Resources'] as List?)
          ?.whereNotNull()
          .map((e) => RecommendationRelatedAnomalyResource.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      sourceDetails: (json['SourceDetails'] as List?)
          ?.whereNotNull()
          .map((e) => RecommendationRelatedAnomalySourceDetail.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resources = this.resources;
    final sourceDetails = this.sourceDetails;
    return {
      if (resources != null) 'Resources': resources,
      if (sourceDetails != null) 'SourceDetails': sourceDetails,
    };
  }
}

/// Information about a resource in which DevOps Guru detected anomalous
/// behavior.
class RecommendationRelatedAnomalyResource {
  /// The name of the resource.
  final String? name;

  /// The type of the resource.
  final String? type;

  RecommendationRelatedAnomalyResource({
    this.name,
    this.type,
  });

  factory RecommendationRelatedAnomalyResource.fromJson(
      Map<String, dynamic> json) {
    return RecommendationRelatedAnomalyResource(
      name: json['Name'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      if (name != null) 'Name': name,
      if (type != null) 'Type': type,
    };
  }
}

/// Contains an array of
/// <code>RecommendationRelatedCloudWatchMetricsSourceDetail</code> objects that
/// contain the name and namespace of an Amazon CloudWatch metric.
class RecommendationRelatedAnomalySourceDetail {
  /// An array of <code>CloudWatchMetricsDetail</code> objects that contains
  /// information about the analyzed metrics that displayed anomalous behavior.
  final List<RecommendationRelatedCloudWatchMetricsSourceDetail>?
      cloudWatchMetrics;

  RecommendationRelatedAnomalySourceDetail({
    this.cloudWatchMetrics,
  });

  factory RecommendationRelatedAnomalySourceDetail.fromJson(
      Map<String, dynamic> json) {
    return RecommendationRelatedAnomalySourceDetail(
      cloudWatchMetrics: (json['CloudWatchMetrics'] as List?)
          ?.whereNotNull()
          .map((e) =>
              RecommendationRelatedCloudWatchMetricsSourceDetail.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchMetrics = this.cloudWatchMetrics;
    return {
      if (cloudWatchMetrics != null) 'CloudWatchMetrics': cloudWatchMetrics,
    };
  }
}

/// Information about an Amazon CloudWatch metric that is analyzed by DevOps
/// Guru. It is one of many analyzed metrics that are used to generate insights.
class RecommendationRelatedCloudWatchMetricsSourceDetail {
  /// The name of the CloudWatch metric.
  final String? metricName;

  /// The namespace of the CloudWatch metric. A namespace is a container for
  /// CloudWatch metrics.
  final String? namespace;

  RecommendationRelatedCloudWatchMetricsSourceDetail({
    this.metricName,
    this.namespace,
  });

  factory RecommendationRelatedCloudWatchMetricsSourceDetail.fromJson(
      Map<String, dynamic> json) {
    return RecommendationRelatedCloudWatchMetricsSourceDetail(
      metricName: json['MetricName'] as String?,
      namespace: json['Namespace'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final namespace = this.namespace;
    return {
      if (metricName != null) 'MetricName': metricName,
      if (namespace != null) 'Namespace': namespace,
    };
  }
}

/// Information about an event that is related to a recommendation.
class RecommendationRelatedEvent {
  /// The name of the event. This corresponds to the <code>Name</code> field in an
  /// <code>Event</code> object.
  final String? name;

  /// A <code>ResourceCollection</code> object that contains arrays of the names
  /// of AWS CloudFormation stacks. You can specify up to 500 AWS CloudFormation
  /// stacks.
  final List<RecommendationRelatedEventResource>? resources;

  RecommendationRelatedEvent({
    this.name,
    this.resources,
  });

  factory RecommendationRelatedEvent.fromJson(Map<String, dynamic> json) {
    return RecommendationRelatedEvent(
      name: json['Name'] as String?,
      resources: (json['Resources'] as List?)
          ?.whereNotNull()
          .map((e) => RecommendationRelatedEventResource.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final resources = this.resources;
    return {
      if (name != null) 'Name': name,
      if (resources != null) 'Resources': resources,
    };
  }
}

/// Information about an AWS resource that emitted and event that is related to
/// a recommendation in an insight.
class RecommendationRelatedEventResource {
  /// The name of the resource that emitted the event. This corresponds to the
  /// <code>Name</code> field in an <code>EventResource</code> object.
  final String? name;

  /// The type of the resource that emitted the event. This corresponds to the
  /// <code>Type</code> field in an <code>EventResource</code> object.
  final String? type;

  RecommendationRelatedEventResource({
    this.name,
    this.type,
  });

  factory RecommendationRelatedEventResource.fromJson(
      Map<String, dynamic> json) {
    return RecommendationRelatedEventResource(
      name: json['Name'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      if (name != null) 'Name': name,
      if (type != null) 'Type': type,
    };
  }
}

class RemoveNotificationChannelResponse {
  RemoveNotificationChannelResponse();

  factory RemoveNotificationChannelResponse.fromJson(Map<String, dynamic> _) {
    return RemoveNotificationChannelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A collection of AWS resources supported by DevOps Guru. The one type of AWS
/// resource collection supported is AWS CloudFormation stacks. DevOps Guru can
/// be configured to analyze only the AWS resources that are defined in the
/// stacks. You can specify up to 500 AWS CloudFormation stacks.
class ResourceCollection {
  /// An array of the names of AWS CloudFormation stacks. The stacks define AWS
  /// resources that DevOps Guru analyzes. You can specify up to 500 AWS
  /// CloudFormation stacks.
  final CloudFormationCollection? cloudFormation;

  ResourceCollection({
    this.cloudFormation,
  });

  factory ResourceCollection.fromJson(Map<String, dynamic> json) {
    return ResourceCollection(
      cloudFormation: json['CloudFormation'] != null
          ? CloudFormationCollection.fromJson(
              json['CloudFormation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormation = this.cloudFormation;
    return {
      if (cloudFormation != null) 'CloudFormation': cloudFormation,
    };
  }
}

/// Information about a filter used to specify which AWS resources are analyzed
/// for anomalous behavior by DevOps Guru.
class ResourceCollectionFilter {
  /// Information about AWS CloudFormation stacks. You can use up to 500 stacks to
  /// specify which AWS resources in your account to analyze. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html">Stacks</a>
  /// in the <i>AWS CloudFormation User Guide</i>.
  final CloudFormationCollectionFilter? cloudFormation;

  ResourceCollectionFilter({
    this.cloudFormation,
  });

  factory ResourceCollectionFilter.fromJson(Map<String, dynamic> json) {
    return ResourceCollectionFilter(
      cloudFormation: json['CloudFormation'] != null
          ? CloudFormationCollectionFilter.fromJson(
              json['CloudFormation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormation = this.cloudFormation;
    return {
      if (cloudFormation != null) 'CloudFormation': cloudFormation,
    };
  }
}

enum ResourceCollectionType {
  awsCloudFormation,
  awsService,
}

extension on ResourceCollectionType {
  String toValue() {
    switch (this) {
      case ResourceCollectionType.awsCloudFormation:
        return 'AWS_CLOUD_FORMATION';
      case ResourceCollectionType.awsService:
        return 'AWS_SERVICE';
    }
  }
}

extension on String {
  ResourceCollectionType toResourceCollectionType() {
    switch (this) {
      case 'AWS_CLOUD_FORMATION':
        return ResourceCollectionType.awsCloudFormation;
      case 'AWS_SERVICE':
        return ResourceCollectionType.awsService;
    }
    throw Exception('$this is not known in enum ResourceCollectionType');
  }
}

/// Specifies one or more severity values and one or more status values that are
/// used to search for insights.
class SearchInsightsFilters {
  final ResourceCollection? resourceCollection;

  /// A collection of the names of AWS services.
  final ServiceCollection? serviceCollection;

  /// An array of severity values used to search for insights.
  final List<InsightSeverity>? severities;

  /// An array of status values used to search for insights.
  final List<InsightStatus>? statuses;

  SearchInsightsFilters({
    this.resourceCollection,
    this.serviceCollection,
    this.severities,
    this.statuses,
  });

  factory SearchInsightsFilters.fromJson(Map<String, dynamic> json) {
    return SearchInsightsFilters(
      resourceCollection: json['ResourceCollection'] != null
          ? ResourceCollection.fromJson(
              json['ResourceCollection'] as Map<String, dynamic>)
          : null,
      serviceCollection: json['ServiceCollection'] != null
          ? ServiceCollection.fromJson(
              json['ServiceCollection'] as Map<String, dynamic>)
          : null,
      severities: (json['Severities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toInsightSeverity())
          .toList(),
      statuses: (json['Statuses'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toInsightStatus())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceCollection = this.resourceCollection;
    final serviceCollection = this.serviceCollection;
    final severities = this.severities;
    final statuses = this.statuses;
    return {
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (serviceCollection != null) 'ServiceCollection': serviceCollection,
      if (severities != null)
        'Severities': severities.map((e) => e.toValue()).toList(),
      if (statuses != null)
        'Statuses': statuses.map((e) => e.toValue()).toList(),
    };
  }
}

class SearchInsightsResponse {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// The returned proactive insights.
  final List<ProactiveInsightSummary>? proactiveInsights;

  /// The returned reactive insights.
  final List<ReactiveInsightSummary>? reactiveInsights;

  SearchInsightsResponse({
    this.nextToken,
    this.proactiveInsights,
    this.reactiveInsights,
  });

  factory SearchInsightsResponse.fromJson(Map<String, dynamic> json) {
    return SearchInsightsResponse(
      nextToken: json['NextToken'] as String?,
      proactiveInsights: (json['ProactiveInsights'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ProactiveInsightSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      reactiveInsights: (json['ReactiveInsights'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ReactiveInsightSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final proactiveInsights = this.proactiveInsights;
    final reactiveInsights = this.reactiveInsights;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (proactiveInsights != null) 'ProactiveInsights': proactiveInsights,
      if (reactiveInsights != null) 'ReactiveInsights': reactiveInsights,
    };
  }
}

/// A collection of the names of AWS services.
class ServiceCollection {
  /// An array of strings that each specifies the name of an AWS service.
  final List<ServiceName>? serviceNames;

  ServiceCollection({
    this.serviceNames,
  });

  factory ServiceCollection.fromJson(Map<String, dynamic> json) {
    return ServiceCollection(
      serviceNames: (json['ServiceNames'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toServiceName())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceNames = this.serviceNames;
    return {
      if (serviceNames != null)
        'ServiceNames': serviceNames.map((e) => e.toValue()).toList(),
    };
  }
}

/// Represents the health of an AWS service.
class ServiceHealth {
  /// Represents the health of an AWS service. This is a
  /// <code>ServiceInsightHealth</code> that contains the number of open proactive
  /// and reactive insights for this service.
  final ServiceInsightHealth? insight;

  /// The name of the AWS service.
  final ServiceName? serviceName;

  ServiceHealth({
    this.insight,
    this.serviceName,
  });

  factory ServiceHealth.fromJson(Map<String, dynamic> json) {
    return ServiceHealth(
      insight: json['Insight'] != null
          ? ServiceInsightHealth.fromJson(
              json['Insight'] as Map<String, dynamic>)
          : null,
      serviceName: (json['ServiceName'] as String?)?.toServiceName(),
    );
  }

  Map<String, dynamic> toJson() {
    final insight = this.insight;
    final serviceName = this.serviceName;
    return {
      if (insight != null) 'Insight': insight,
      if (serviceName != null) 'ServiceName': serviceName.toValue(),
    };
  }
}

/// Contains the number of open proactive and reactive insights in an analyzed
/// AWS service.
class ServiceInsightHealth {
  /// The number of open proactive insights in the AWS service
  final int? openProactiveInsights;

  /// The number of open reactive insights in the AWS service
  final int? openReactiveInsights;

  ServiceInsightHealth({
    this.openProactiveInsights,
    this.openReactiveInsights,
  });

  factory ServiceInsightHealth.fromJson(Map<String, dynamic> json) {
    return ServiceInsightHealth(
      openProactiveInsights: json['OpenProactiveInsights'] as int?,
      openReactiveInsights: json['OpenReactiveInsights'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final openProactiveInsights = this.openProactiveInsights;
    final openReactiveInsights = this.openReactiveInsights;
    return {
      if (openProactiveInsights != null)
        'OpenProactiveInsights': openProactiveInsights,
      if (openReactiveInsights != null)
        'OpenReactiveInsights': openReactiveInsights,
    };
  }
}

/// Information about the integration of DevOps Guru with another AWS service,
/// such as AWS Systems Manager.
class ServiceIntegrationConfig {
  /// Information about whether DevOps Guru is configured to create an OpsItem in
  /// AWS Systems Manager OpsCenter for each created insight.
  final OpsCenterIntegration? opsCenter;

  ServiceIntegrationConfig({
    this.opsCenter,
  });

  factory ServiceIntegrationConfig.fromJson(Map<String, dynamic> json) {
    return ServiceIntegrationConfig(
      opsCenter: json['OpsCenter'] != null
          ? OpsCenterIntegration.fromJson(
              json['OpsCenter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final opsCenter = this.opsCenter;
    return {
      if (opsCenter != null) 'OpsCenter': opsCenter,
    };
  }
}

enum ServiceName {
  apiGateway,
  applicationElb,
  autoScalingGroup,
  cloudFront,
  dynamoDb,
  ec2,
  ecs,
  eks,
  elasticBeanstalk,
  elastiCache,
  elb,
  es,
  kinesis,
  lambda,
  natGateway,
  networkElb,
  rds,
  redshift,
  route_53,
  s3,
  sageMaker,
  sns,
  sqs,
  stepFunctions,
  swf,
}

extension on ServiceName {
  String toValue() {
    switch (this) {
      case ServiceName.apiGateway:
        return 'API_GATEWAY';
      case ServiceName.applicationElb:
        return 'APPLICATION_ELB';
      case ServiceName.autoScalingGroup:
        return 'AUTO_SCALING_GROUP';
      case ServiceName.cloudFront:
        return 'CLOUD_FRONT';
      case ServiceName.dynamoDb:
        return 'DYNAMO_DB';
      case ServiceName.ec2:
        return 'EC2';
      case ServiceName.ecs:
        return 'ECS';
      case ServiceName.eks:
        return 'EKS';
      case ServiceName.elasticBeanstalk:
        return 'ELASTIC_BEANSTALK';
      case ServiceName.elastiCache:
        return 'ELASTI_CACHE';
      case ServiceName.elb:
        return 'ELB';
      case ServiceName.es:
        return 'ES';
      case ServiceName.kinesis:
        return 'KINESIS';
      case ServiceName.lambda:
        return 'LAMBDA';
      case ServiceName.natGateway:
        return 'NAT_GATEWAY';
      case ServiceName.networkElb:
        return 'NETWORK_ELB';
      case ServiceName.rds:
        return 'RDS';
      case ServiceName.redshift:
        return 'REDSHIFT';
      case ServiceName.route_53:
        return 'ROUTE_53';
      case ServiceName.s3:
        return 'S3';
      case ServiceName.sageMaker:
        return 'SAGE_MAKER';
      case ServiceName.sns:
        return 'SNS';
      case ServiceName.sqs:
        return 'SQS';
      case ServiceName.stepFunctions:
        return 'STEP_FUNCTIONS';
      case ServiceName.swf:
        return 'SWF';
    }
  }
}

extension on String {
  ServiceName toServiceName() {
    switch (this) {
      case 'API_GATEWAY':
        return ServiceName.apiGateway;
      case 'APPLICATION_ELB':
        return ServiceName.applicationElb;
      case 'AUTO_SCALING_GROUP':
        return ServiceName.autoScalingGroup;
      case 'CLOUD_FRONT':
        return ServiceName.cloudFront;
      case 'DYNAMO_DB':
        return ServiceName.dynamoDb;
      case 'EC2':
        return ServiceName.ec2;
      case 'ECS':
        return ServiceName.ecs;
      case 'EKS':
        return ServiceName.eks;
      case 'ELASTIC_BEANSTALK':
        return ServiceName.elasticBeanstalk;
      case 'ELASTI_CACHE':
        return ServiceName.elastiCache;
      case 'ELB':
        return ServiceName.elb;
      case 'ES':
        return ServiceName.es;
      case 'KINESIS':
        return ServiceName.kinesis;
      case 'LAMBDA':
        return ServiceName.lambda;
      case 'NAT_GATEWAY':
        return ServiceName.natGateway;
      case 'NETWORK_ELB':
        return ServiceName.networkElb;
      case 'RDS':
        return ServiceName.rds;
      case 'REDSHIFT':
        return ServiceName.redshift;
      case 'ROUTE_53':
        return ServiceName.route_53;
      case 'S3':
        return ServiceName.s3;
      case 'SAGE_MAKER':
        return ServiceName.sageMaker;
      case 'SNS':
        return ServiceName.sns;
      case 'SQS':
        return ServiceName.sqs;
      case 'STEP_FUNCTIONS':
        return ServiceName.stepFunctions;
      case 'SWF':
        return ServiceName.swf;
    }
    throw Exception('$this is not known in enum ServiceName');
  }
}

/// An object that contains information about the estimated monthly cost to
/// analyze an AWS resource. For more information, see <a
/// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/cost-estimate.html">Estimate
/// your Amazon DevOps Guru costs</a> and <a
/// href="http://aws.amazon.com/devops-guru/pricing/">Amazon DevOps Guru
/// pricing</a>.
class ServiceResourceCost {
  /// The total estimated monthly cost to analyze the active resources for this
  /// resource.
  final double? cost;

  /// The number of active resources analyzed for this service to create a monthly
  /// cost estimate.
  final int? count;

  /// The state of the resource. The resource is <code>ACTIVE</code> if it
  /// produces metrics, events, or logs within an hour, otherwise it is
  /// <code>INACTIVE</code>. You pay for the number of active AWS resource hours
  /// analyzed for each resource. Inactive resources are not charged.
  final CostEstimationServiceResourceState? state;

  /// The type of the AWS resource.
  final String? type;

  /// The price per hour to analyze the resources in the service. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/cost-estimate.html">Estimate
  /// your Amazon DevOps Guru costs</a> and <a
  /// href="http://aws.amazon.com/devops-guru/pricing/">Amazon DevOps Guru
  /// pricing</a>.
  final double? unitCost;

  ServiceResourceCost({
    this.cost,
    this.count,
    this.state,
    this.type,
    this.unitCost,
  });

  factory ServiceResourceCost.fromJson(Map<String, dynamic> json) {
    return ServiceResourceCost(
      cost: json['Cost'] as double?,
      count: json['Count'] as int?,
      state: (json['State'] as String?)?.toCostEstimationServiceResourceState(),
      type: json['Type'] as String?,
      unitCost: json['UnitCost'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final cost = this.cost;
    final count = this.count;
    final state = this.state;
    final type = this.type;
    final unitCost = this.unitCost;
    return {
      if (cost != null) 'Cost': cost,
      if (count != null) 'Count': count,
      if (state != null) 'State': state.toValue(),
      if (type != null) 'Type': type,
      if (unitCost != null) 'UnitCost': unitCost,
    };
  }
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
class SnsChannelConfig {
  /// The Amazon Resource Name (ARN) of an Amazon Simple Notification Service
  /// topic.
  final String? topicArn;

  SnsChannelConfig({
    this.topicArn,
  });

  factory SnsChannelConfig.fromJson(Map<String, dynamic> json) {
    return SnsChannelConfig(
      topicArn: json['TopicArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final topicArn = this.topicArn;
    return {
      if (topicArn != null) 'TopicArn': topicArn,
    };
  }
}

class StartCostEstimationResponse {
  StartCostEstimationResponse();

  factory StartCostEstimationResponse.fromJson(Map<String, dynamic> _) {
    return StartCostEstimationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A time range used to specify when the behavior of an insight or anomaly
/// started.
class StartTimeRange {
  /// The start time of the time range.
  final DateTime? fromTime;

  /// The end time of the time range.
  final DateTime? toTime;

  StartTimeRange({
    this.fromTime,
    this.toTime,
  });

  factory StartTimeRange.fromJson(Map<String, dynamic> json) {
    return StartTimeRange(
      fromTime: timeStampFromJson(json['FromTime']),
      toTime: timeStampFromJson(json['ToTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final fromTime = this.fromTime;
    final toTime = this.toTime;
    return {
      if (fromTime != null) 'FromTime': unixTimestampToJson(fromTime),
      if (toTime != null) 'ToTime': unixTimestampToJson(toTime),
    };
  }
}

/// Contains the names of AWS CloudFormation stacks used to update a collection
/// of stacks. You can specify up to 500 AWS CloudFormation stacks.
class UpdateCloudFormationCollectionFilter {
  /// An array of the names of the AWS CloudFormation stacks to update. You can
  /// specify up to 500 AWS CloudFormation stacks.
  final List<String>? stackNames;

  UpdateCloudFormationCollectionFilter({
    this.stackNames,
  });

  factory UpdateCloudFormationCollectionFilter.fromJson(
      Map<String, dynamic> json) {
    return UpdateCloudFormationCollectionFilter(
      stackNames: (json['StackNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final stackNames = this.stackNames;
    return {
      if (stackNames != null) 'StackNames': stackNames,
    };
  }
}

enum UpdateResourceCollectionAction {
  add,
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
  }
}

extension on String {
  UpdateResourceCollectionAction toUpdateResourceCollectionAction() {
    switch (this) {
      case 'ADD':
        return UpdateResourceCollectionAction.add;
      case 'REMOVE':
        return UpdateResourceCollectionAction.remove;
    }
    throw Exception(
        '$this is not known in enum UpdateResourceCollectionAction');
  }
}

/// Contains information used to update a collection of AWS resources.
class UpdateResourceCollectionFilter {
  /// An collection of AWS CloudFormation stacks. You can specify up to 500 AWS
  /// CloudFormation stacks.
  final UpdateCloudFormationCollectionFilter? cloudFormation;

  UpdateResourceCollectionFilter({
    this.cloudFormation,
  });

  factory UpdateResourceCollectionFilter.fromJson(Map<String, dynamic> json) {
    return UpdateResourceCollectionFilter(
      cloudFormation: json['CloudFormation'] != null
          ? UpdateCloudFormationCollectionFilter.fromJson(
              json['CloudFormation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormation = this.cloudFormation;
    return {
      if (cloudFormation != null) 'CloudFormation': cloudFormation,
    };
  }
}

class UpdateResourceCollectionResponse {
  UpdateResourceCollectionResponse();

  factory UpdateResourceCollectionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateResourceCollectionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about updating the integration status of an AWS service, such as
/// AWS Systems Manager, with DevOps Guru.
class UpdateServiceIntegrationConfig {
  final OpsCenterIntegrationConfig? opsCenter;

  UpdateServiceIntegrationConfig({
    this.opsCenter,
  });

  factory UpdateServiceIntegrationConfig.fromJson(Map<String, dynamic> json) {
    return UpdateServiceIntegrationConfig(
      opsCenter: json['OpsCenter'] != null
          ? OpsCenterIntegrationConfig.fromJson(
              json['OpsCenter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final opsCenter = this.opsCenter;
    return {
      if (opsCenter != null) 'OpsCenter': opsCenter,
    };
  }
}

class UpdateServiceIntegrationResponse {
  UpdateServiceIntegrationResponse();

  factory UpdateServiceIntegrationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateServiceIntegrationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
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
