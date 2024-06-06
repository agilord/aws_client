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

/// Amazon DevOps Guru is a fully managed service that helps you identify
/// anomalous behavior in business critical operational applications. You
/// specify the Amazon Web Services resources that you want DevOps Guru to
/// cover, then the Amazon CloudWatch metrics and Amazon Web Services CloudTrail
/// events related to those resources are analyzed. When anomalous behavior is
/// detected, DevOps Guru creates an <i>insight</i> that includes
/// recommendations, related events, and related metrics that can help you
/// improve your operational applications. For more information, see <a
/// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/welcome.html">What
/// is Amazon DevOps Guru</a>.
///
/// You can specify 1 or 2 Amazon Simple Notification Service topics so you are
/// notified every time a new insight is created. You can also enable DevOps
/// Guru to generate an OpsItem in Amazon Web Services Systems Manager for each
/// insight to help you manage and track your work addressing insights.
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
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Adds a notification channel to DevOps Guru. A notification channel is used
  /// to notify you about important DevOps Guru events, such as when an insight
  /// is generated.
  ///
  /// If you use an Amazon SNS topic in another account, you must attach a
  /// policy to it that grants DevOps Guru permission to send it notifications.
  /// DevOps Guru adds the required policy on your behalf to send notifications
  /// using Amazon SNS in your account. DevOps Guru only supports standard SNS
  /// topics. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-required-permissions.html">Permissions
  /// for Amazon SNS topics</a>.
  ///
  /// If you use an Amazon SNS topic that is encrypted by an Amazon Web Services
  /// Key Management Service customer-managed key (CMK), then you must add
  /// permissions to the CMK. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-kms-permissions.html">Permissions
  /// for Amazon Web Services KMS–encrypted Amazon SNS topics</a>.
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

  /// Deletes the insight along with the associated anomalies, events and
  /// recommendations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the insight.
  Future<void> deleteInsight({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/insights/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the number of open reactive insights, the number of open proactive
  /// insights, and the number of metrics analyzed in your Amazon Web Services
  /// account. Use these numbers to gauge the health of operations in your
  /// Amazon Web Services account.
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
  ///
  /// Parameter [accountId] :
  /// The ID of the member account.
  Future<DescribeAnomalyResponse> describeAnomaly({
    required String id,
    String? accountId,
  }) async {
    final $query = <String, List<String>>{
      if (accountId != null) 'AccountId': [accountId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/anomalies/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAnomalyResponse.fromJson(response);
  }

  /// Returns the integration status of services that are integrated with DevOps
  /// Guru as Consumer via EventBridge. The one service that can be integrated
  /// with DevOps Guru is Amazon CodeGuru Profiler, which can produce proactive
  /// recommendations which can be stored and viewed in DevOps Guru.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<DescribeEventSourcesConfigResponse>
      describeEventSourcesConfig() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/event-sources',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeEventSourcesConfigResponse.fromJson(response);
  }

  /// Returns the most recent feedback submitted in the current Amazon Web
  /// Services account and Region.
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
  ///
  /// Parameter [accountId] :
  /// The ID of the member account in the organization.
  Future<DescribeInsightResponse> describeInsight({
    required String id,
    String? accountId,
  }) async {
    final $query = <String, List<String>>{
      if (accountId != null) 'AccountId': [accountId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/insights/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeInsightResponse.fromJson(response);
  }

  /// Returns active insights, predictive insights, and resource hours analyzed
  /// in last hour.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// The ID of the Amazon Web Services account.
  ///
  /// Parameter [organizationalUnitIds] :
  /// The ID of the organizational unit.
  Future<DescribeOrganizationHealthResponse> describeOrganizationHealth({
    List<String>? accountIds,
    List<String>? organizationalUnitIds,
  }) async {
    final $payload = <String, dynamic>{
      if (accountIds != null) 'AccountIds': accountIds,
      if (organizationalUnitIds != null)
        'OrganizationalUnitIds': organizationalUnitIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/organization/health',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeOrganizationHealthResponse.fromJson(response);
  }

  /// Returns an overview of your organization's history based on the specified
  /// time range. The overview includes the total reactive and proactive
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
  /// Parameter [accountIds] :
  /// The ID of the Amazon Web Services account.
  ///
  /// Parameter [organizationalUnitIds] :
  /// The ID of the organizational unit.
  ///
  /// Parameter [toTime] :
  /// The end of the time range passed in. The start time granularity is at the
  /// day level. The floor of the start time is used. Returned information
  /// occurred before this day. If this is not specified, then the current day
  /// is used.
  Future<DescribeOrganizationOverviewResponse> describeOrganizationOverview({
    required DateTime fromTime,
    List<String>? accountIds,
    List<String>? organizationalUnitIds,
    DateTime? toTime,
  }) async {
    final $payload = <String, dynamic>{
      'FromTime': unixTimestampToJson(fromTime),
      if (accountIds != null) 'AccountIds': accountIds,
      if (organizationalUnitIds != null)
        'OrganizationalUnitIds': organizationalUnitIds,
      if (toTime != null) 'ToTime': unixTimestampToJson(toTime),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/organization/overview',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeOrganizationOverviewResponse.fromJson(response);
  }

  /// Provides an overview of your system's health. If additional member
  /// accounts are part of your organization, you can filter those accounts
  /// using the <code>AccountIds</code> field.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [organizationResourceCollectionType] :
  /// An Amazon Web Services resource collection type. This type specifies how
  /// analyzed Amazon Web Services resources are defined. The two types of
  /// Amazon Web Services resource collections supported are Amazon Web Services
  /// CloudFormation stacks and Amazon Web Services resources that contain the
  /// same Amazon Web Services tag. DevOps Guru can be configured to analyze the
  /// Amazon Web Services resources that are defined in the stacks or that are
  /// tagged using the same tag <i>key</i>. You can specify up to 500 Amazon Web
  /// Services CloudFormation stacks.
  ///
  /// Parameter [accountIds] :
  /// The ID of the Amazon Web Services account.
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
  /// Parameter [organizationalUnitIds] :
  /// The ID of the organizational unit.
  Future<DescribeOrganizationResourceCollectionHealthResponse>
      describeOrganizationResourceCollectionHealth({
    required OrganizationResourceCollectionType
        organizationResourceCollectionType,
    List<String>? accountIds,
    int? maxResults,
    String? nextToken,
    List<String>? organizationalUnitIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'OrganizationResourceCollectionType':
          organizationResourceCollectionType.toValue(),
      if (accountIds != null) 'AccountIds': accountIds,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (organizationalUnitIds != null)
        'OrganizationalUnitIds': organizationalUnitIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/organization/health/resource-collection',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeOrganizationResourceCollectionHealthResponse.fromJson(
        response);
  }

  /// Returns the number of open proactive insights, open reactive insights, and
  /// the Mean Time to Recover (MTTR) for all closed insights in resource
  /// collections in your account. You specify the type of Amazon Web Services
  /// resources collection. The two types of Amazon Web Services resource
  /// collections supported are Amazon Web Services CloudFormation stacks and
  /// Amazon Web Services resources that contain the same Amazon Web Services
  /// tag. DevOps Guru can be configured to analyze the Amazon Web Services
  /// resources that are defined in the stacks or that are tagged using the same
  /// tag <i>key</i>. You can specify up to 500 Amazon Web Services
  /// CloudFormation stacks.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceCollectionType] :
  /// An Amazon Web Services resource collection type. This type specifies how
  /// analyzed Amazon Web Services resources are defined. The two types of
  /// Amazon Web Services resource collections supported are Amazon Web Services
  /// CloudFormation stacks and Amazon Web Services resources that contain the
  /// same Amazon Web Services tag. DevOps Guru can be configured to analyze the
  /// Amazon Web Services resources that are defined in the stacks or that are
  /// tagged using the same tag <i>key</i>. You can specify up to 500 Amazon Web
  /// Services CloudFormation stacks.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<DescribeResourceCollectionHealthResponse>
      describeResourceCollectionHealth({
    required ResourceCollectionType resourceCollectionType,
    String? nextToken,
  }) async {
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
  /// Guru. The one service that can be integrated with DevOps Guru is Amazon
  /// Web Services Systems Manager, which can be used to create an OpsItem for
  /// each generated insight.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
  /// Amazon Web Services resources. For more information, see <a
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

  /// Returns lists Amazon Web Services resources that are of the specified
  /// resource collection type. The two types of Amazon Web Services resource
  /// collections supported are Amazon Web Services CloudFormation stacks and
  /// Amazon Web Services resources that contain the same Amazon Web Services
  /// tag. DevOps Guru can be configured to analyze the Amazon Web Services
  /// resources that are defined in the stacks or that are tagged using the same
  /// tag <i>key</i>. You can specify up to 500 Amazon Web Services
  /// CloudFormation stacks.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceCollectionType] :
  /// The type of Amazon Web Services resource collections to return. The one
  /// valid value is <code>CLOUD_FORMATION</code> for Amazon Web Services
  /// CloudFormation stacks.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<GetResourceCollectionResponse> getResourceCollection({
    required ResourceCollectionType resourceCollectionType,
    String? nextToken,
  }) async {
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
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account.
  ///
  /// Parameter [filters] :
  /// Specifies one or more service names that are used to list anomalies.
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
    String? accountId,
    ListAnomaliesForInsightFilters? filters,
    int? maxResults,
    String? nextToken,
    StartTimeRange? startTimeRange,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      if (accountId != null) 'AccountId': accountId,
      if (filters != null) 'Filters': filters,
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

  /// Returns the list of log groups that contain log anomalies.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [insightId] :
  /// The ID of the insight containing the log groups.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<ListAnomalousLogGroupsResponse> listAnomalousLogGroups({
    required String insightId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $payload = <String, dynamic>{
      'InsightId': insightId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-log-anomalies',
      exceptionFnMap: _exceptionFns,
    );
    return ListAnomalousLogGroupsResponse.fromJson(response);
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
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account.
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
    String? accountId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $payload = <String, dynamic>{
      'Filters': filters,
      if (accountId != null) 'AccountId': accountId,
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

  /// Returns a list of insights in your Amazon Web Services account. You can
  /// specify which insights are returned by their start time and status
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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

  /// Returns the list of all log groups that are being monitored and tagged by
  /// DevOps Guru.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// Filters to determine which monitored resources you want to retrieve. You
  /// can filter by resource type or resource permission status.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<ListMonitoredResourcesResponse> listMonitoredResources({
    ListMonitoredResourcesFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/monitoredResources',
      exceptionFnMap: _exceptionFns,
    );
    return ListMonitoredResourcesResponse.fromJson(response);
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

  /// Returns a list of insights associated with the account or OU Id.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// The ID of the Amazon Web Services account.
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
  /// Parameter [organizationalUnitIds] :
  /// The ID of the organizational unit.
  Future<ListOrganizationInsightsResponse> listOrganizationInsights({
    required ListInsightsStatusFilter statusFilter,
    List<String>? accountIds,
    int? maxResults,
    String? nextToken,
    List<String>? organizationalUnitIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'StatusFilter': statusFilter,
      if (accountIds != null) 'AccountIds': accountIds,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (organizationalUnitIds != null)
        'OrganizationalUnitIds': organizationalUnitIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/organization/insights',
      exceptionFnMap: _exceptionFns,
    );
    return ListOrganizationInsightsResponse.fromJson(response);
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
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account.
  ///
  /// Parameter [locale] :
  /// A locale that specifies the language to use for recommendations.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<ListRecommendationsResponse> listRecommendations({
    required String insightId,
    String? accountId,
    Locale? locale,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'InsightId': insightId,
      if (accountId != null) 'AccountId': accountId,
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/channels/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of insights in your Amazon Web Services account. You can
  /// specify which insights are returned by their start time, one or more
  /// statuses (<code>ONGOING</code> or <code>CLOSED</code>), one or more
  /// severities (<code>LOW</code>, <code>MEDIUM</code>, and <code>HIGH</code>),
  /// and type (<code>REACTIVE</code> or <code>PROACTIVE</code>).
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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

  /// Returns a list of insights in your organization. You can specify which
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
  /// Parameter [accountIds] :
  /// The ID of the Amazon Web Services account.
  ///
  /// Parameter [type] :
  /// The type of insights you are searching for (<code>REACTIVE</code> or
  /// <code>PROACTIVE</code>).
  ///
  /// Parameter [filters] :
  /// A <code>SearchOrganizationInsightsFilters</code> object that is used to
  /// set the severity and status filters on your insight search.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  Future<SearchOrganizationInsightsResponse> searchOrganizationInsights({
    required List<String> accountIds,
    required StartTimeRange startTimeRange,
    required InsightType type,
    SearchOrganizationInsightsFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'AccountIds': accountIds,
      'StartTimeRange': startTimeRange,
      'Type': type.toValue(),
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/organization/insights/search',
      exceptionFnMap: _exceptionFns,
    );
    return SearchOrganizationInsightsResponse.fromJson(response);
  }

  /// Starts the creation of an estimate of the monthly cost to analyze your
  /// Amazon Web Services resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceCollection] :
  /// The collection of Amazon Web Services resources used to create a monthly
  /// DevOps Guru cost estimate.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token used to identify each cost estimate request.
  Future<void> startCostEstimation({
    required CostEstimationResourceCollectionFilter resourceCollection,
    String? clientToken,
  }) async {
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

  /// Enables or disables integration with a service that can be integrated with
  /// DevOps Guru. The one service that can be integrated with DevOps Guru is
  /// Amazon CodeGuru Profiler, which can produce proactive recommendations
  /// which can be stored and viewed in DevOps Guru.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventSources] :
  /// Configuration information about the integration of DevOps Guru as the
  /// Consumer via EventBridge with another AWS Service.
  Future<void> updateEventSourcesConfig({
    EventSourcesConfig? eventSources,
  }) async {
    final $payload = <String, dynamic>{
      if (eventSources != null) 'EventSources': eventSources,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/event-sources',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the collection of resources that DevOps Guru analyzes. The two
  /// types of Amazon Web Services resource collections supported are Amazon Web
  /// Services CloudFormation stacks and Amazon Web Services resources that
  /// contain the same Amazon Web Services tag. DevOps Guru can be configured to
  /// analyze the Amazon Web Services resources that are defined in the stacks
  /// or that are tagged using the same tag <i>key</i>. You can specify up to
  /// 500 Amazon Web Services CloudFormation stacks. This method also creates
  /// the IAM role required for you to use DevOps Guru.
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
  /// Amazon Web Services Systems Manager, which can be used to create an
  /// OpsItem for each generated insight.
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

/// Returns the number of open reactive insights, the number of open proactive
/// insights, and the number of metrics analyzed in your Amazon Web Services
/// account. Use these numbers to gauge the health of operations in your Amazon
/// Web Services account.
class AccountHealth {
  /// The ID of the Amazon Web Services account.
  final String? accountId;

  /// Information about the health of the Amazon Web Services resources in your
  /// account, including the number of open proactive, open reactive insights, and
  /// the Mean Time to Recover (MTTR) of closed insights.
  final AccountInsightHealth? insight;

  AccountHealth({
    this.accountId,
    this.insight,
  });

  factory AccountHealth.fromJson(Map<String, dynamic> json) {
    return AccountHealth(
      accountId: json['AccountId'] as String?,
      insight: json['Insight'] != null
          ? AccountInsightHealth.fromJson(
              json['Insight'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final insight = this.insight;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (insight != null) 'Insight': insight,
    };
  }
}

/// Information about the number of open reactive and proactive insights that
/// can be used to gauge the health of your system.
class AccountInsightHealth {
  /// An integer that specifies the number of open proactive insights in your
  /// Amazon Web Services account.
  final int? openProactiveInsights;

  /// An integer that specifies the number of open reactive insights in your
  /// Amazon Web Services account.
  final int? openReactiveInsights;

  AccountInsightHealth({
    this.openProactiveInsights,
    this.openReactiveInsights,
  });

  factory AccountInsightHealth.fromJson(Map<String, dynamic> json) {
    return AccountInsightHealth(
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

/// Information about your account's integration with Amazon CodeGuru Profiler.
/// This returns whether DevOps Guru is configured to consume recommendations
/// generated from Amazon CodeGuru Profiler.
class AmazonCodeGuruProfilerIntegration {
  /// The status of the CodeGuru Profiler integration. Specifies if DevOps Guru is
  /// enabled to consume recommendations that are generated from Amazon CodeGuru
  /// Profiler.
  final EventSourceOptInStatus? status;

  AmazonCodeGuruProfilerIntegration({
    this.status,
  });

  factory AmazonCodeGuruProfilerIntegration.fromJson(
      Map<String, dynamic> json) {
    return AmazonCodeGuruProfilerIntegration(
      status: (json['Status'] as String?)?.toEventSourceOptInStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// An Amazon CloudWatch log group that contains log anomalies and is used to
/// generate an insight.
class AnomalousLogGroup {
  /// The time the anomalous log events stopped.
  final DateTime? impactEndTime;

  /// The time the anomalous log events began. The impact start time indicates the
  /// time of the first log anomaly event that occurs.
  final DateTime? impactStartTime;

  /// The log anomalies in the log group. Each log anomaly displayed represents a
  /// cluster of similar anomalous log events.
  final List<LogAnomalyShowcase>? logAnomalyShowcases;

  /// The name of the CloudWatch log group.
  final String? logGroupName;

  /// The number of log lines that were scanned for anomalous log events.
  final int? numberOfLogLinesScanned;

  AnomalousLogGroup({
    this.impactEndTime,
    this.impactStartTime,
    this.logAnomalyShowcases,
    this.logGroupName,
    this.numberOfLogLinesScanned,
  });

  factory AnomalousLogGroup.fromJson(Map<String, dynamic> json) {
    return AnomalousLogGroup(
      impactEndTime: timeStampFromJson(json['ImpactEndTime']),
      impactStartTime: timeStampFromJson(json['ImpactStartTime']),
      logAnomalyShowcases: (json['LogAnomalyShowcases'] as List?)
          ?.whereNotNull()
          .map((e) => LogAnomalyShowcase.fromJson(e as Map<String, dynamic>))
          .toList(),
      logGroupName: json['LogGroupName'] as String?,
      numberOfLogLinesScanned: json['NumberOfLogLinesScanned'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final impactEndTime = this.impactEndTime;
    final impactStartTime = this.impactStartTime;
    final logAnomalyShowcases = this.logAnomalyShowcases;
    final logGroupName = this.logGroupName;
    final numberOfLogLinesScanned = this.numberOfLogLinesScanned;
    return {
      if (impactEndTime != null)
        'ImpactEndTime': unixTimestampToJson(impactEndTime),
      if (impactStartTime != null)
        'ImpactStartTime': unixTimestampToJson(impactStartTime),
      if (logAnomalyShowcases != null)
        'LogAnomalyShowcases': logAnomalyShowcases,
      if (logGroupName != null) 'LogGroupName': logGroupName,
      if (numberOfLogLinesScanned != null)
        'NumberOfLogLinesScanned': numberOfLogLinesScanned,
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

/// The Amazon Web Services resources in which DevOps Guru detected unusual
/// behavior that resulted in the generation of an anomaly. When DevOps Guru
/// detects multiple related anomalies, it creates and insight with details
/// about the anomalous behavior and suggestions about how to correct the
/// problem.
class AnomalyResource {
  /// The name of the Amazon Web Services resource.
  final String? name;

  /// The type of the Amazon Web Services resource.
  final String? type;

  AnomalyResource({
    this.name,
    this.type,
  });

  factory AnomalyResource.fromJson(Map<String, dynamic> json) {
    return AnomalyResource(
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

enum AnomalySeverity {
  low,
  medium,
  high,
}

extension AnomalySeverityValueExtension on AnomalySeverity {
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

extension AnomalySeverityFromString on String {
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
/// the anomaly.
class AnomalySourceDetails {
  /// An array of <code>CloudWatchMetricsDetail</code> objects that contain
  /// information about analyzed CloudWatch metrics that show anomalous behavior.
  final List<CloudWatchMetricsDetail>? cloudWatchMetrics;

  /// An array of <code>PerformanceInsightsMetricsDetail</code> objects that
  /// contain information about analyzed Performance Insights metrics that show
  /// anomalous behavior.
  final List<PerformanceInsightsMetricsDetail>? performanceInsightsMetrics;

  AnomalySourceDetails({
    this.cloudWatchMetrics,
    this.performanceInsightsMetrics,
  });

  factory AnomalySourceDetails.fromJson(Map<String, dynamic> json) {
    return AnomalySourceDetails(
      cloudWatchMetrics: (json['CloudWatchMetrics'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CloudWatchMetricsDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      performanceInsightsMetrics: (json['PerformanceInsightsMetrics'] as List?)
          ?.whereNotNull()
          .map((e) => PerformanceInsightsMetricsDetail.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchMetrics = this.cloudWatchMetrics;
    final performanceInsightsMetrics = this.performanceInsightsMetrics;
    return {
      if (cloudWatchMetrics != null) 'CloudWatchMetrics': cloudWatchMetrics,
      if (performanceInsightsMetrics != null)
        'PerformanceInsightsMetrics': performanceInsightsMetrics,
    };
  }
}

/// Metadata about the detection source that generates proactive anomalies. The
/// anomaly is detected using analysis of the metric data&#x2028; over a period
/// of time
class AnomalySourceMetadata {
  /// The source of the anomaly.
  final String? source;

  /// The name of the anomaly's resource.
  final String? sourceResourceName;

  /// The anomaly's resource type.
  final String? sourceResourceType;

  AnomalySourceMetadata({
    this.source,
    this.sourceResourceName,
    this.sourceResourceType,
  });

  factory AnomalySourceMetadata.fromJson(Map<String, dynamic> json) {
    return AnomalySourceMetadata(
      source: json['Source'] as String?,
      sourceResourceName: json['SourceResourceName'] as String?,
      sourceResourceType: json['SourceResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final sourceResourceName = this.sourceResourceName;
    final sourceResourceType = this.sourceResourceType;
    return {
      if (source != null) 'Source': source,
      if (sourceResourceName != null) 'SourceResourceName': sourceResourceName,
      if (sourceResourceType != null) 'SourceResourceType': sourceResourceType,
    };
  }
}

enum AnomalyStatus {
  ongoing,
  closed,
}

extension AnomalyStatusValueExtension on AnomalyStatus {
  String toValue() {
    switch (this) {
      case AnomalyStatus.ongoing:
        return 'ONGOING';
      case AnomalyStatus.closed:
        return 'CLOSED';
    }
  }
}

extension AnomalyStatusFromString on String {
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

enum AnomalyType {
  causal,
  contextual,
}

extension AnomalyTypeValueExtension on AnomalyType {
  String toValue() {
    switch (this) {
      case AnomalyType.causal:
        return 'CAUSAL';
      case AnomalyType.contextual:
        return 'CONTEXTUAL';
    }
  }
}

extension AnomalyTypeFromString on String {
  AnomalyType toAnomalyType() {
    switch (this) {
      case 'CAUSAL':
        return AnomalyType.causal;
      case 'CONTEXTUAL':
        return AnomalyType.contextual;
    }
    throw Exception('$this is not known in enum AnomalyType');
  }
}

/// Information about Amazon Web Services CloudFormation stacks. You can use up
/// to 500 stacks to specify which Amazon Web Services resources in your account
/// to analyze. For more information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html">Stacks</a>
/// in the <i>Amazon Web Services CloudFormation User Guide</i>.
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

/// Information about Amazon Web Services CloudFormation stacks. You can use up
/// to 500 stacks to specify which Amazon Web Services resources in your account
/// to analyze. For more information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html">Stacks</a>
/// in the <i>Amazon Web Services CloudFormation User Guide</i>.
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

/// Information about an Amazon Web Services CloudFormation stack used to create
/// a monthly cost estimate for DevOps Guru to analyze Amazon Web Services
/// resources. The maximum number of stacks you can specify for a cost estimate
/// is one. The estimate created is for the cost to analyze the Amazon Web
/// Services resources defined by the stack. For more information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html">Stacks</a>
/// in the <i>Amazon Web Services CloudFormation User Guide</i>.
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

/// Information about the health of Amazon Web Services resources in your
/// account that are specified by an Amazon Web Services CloudFormation stack.
class CloudFormationHealth {
  /// Number of resources that DevOps Guru is monitoring in your account that are
  /// specified by an Amazon Web Services CloudFormation stack.
  final int? analyzedResourceCount;

  /// Information about the health of the Amazon Web Services resources in your
  /// account that are specified by an Amazon Web Services CloudFormation stack,
  /// including the number of open proactive, open reactive insights, and the Mean
  /// Time to Recover (MTTR) of closed insights.
  final InsightHealth? insight;

  /// The name of the CloudFormation stack.
  final String? stackName;

  CloudFormationHealth({
    this.analyzedResourceCount,
    this.insight,
    this.stackName,
  });

  factory CloudFormationHealth.fromJson(Map<String, dynamic> json) {
    return CloudFormationHealth(
      analyzedResourceCount: json['AnalyzedResourceCount'] as int?,
      insight: json['Insight'] != null
          ? InsightHealth.fromJson(json['Insight'] as Map<String, dynamic>)
          : null,
      stackName: json['StackName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analyzedResourceCount = this.analyzedResourceCount;
    final insight = this.insight;
    final stackName = this.stackName;
    return {
      if (analyzedResourceCount != null)
        'AnalyzedResourceCount': analyzedResourceCount,
      if (insight != null) 'Insight': insight,
      if (stackName != null) 'StackName': stackName,
    };
  }
}

enum CloudWatchMetricDataStatusCode {
  complete,
  internalError,
  partialData,
}

extension CloudWatchMetricDataStatusCodeValueExtension
    on CloudWatchMetricDataStatusCode {
  String toValue() {
    switch (this) {
      case CloudWatchMetricDataStatusCode.complete:
        return 'Complete';
      case CloudWatchMetricDataStatusCode.internalError:
        return 'InternalError';
      case CloudWatchMetricDataStatusCode.partialData:
        return 'PartialData';
    }
  }
}

extension CloudWatchMetricDataStatusCodeFromString on String {
  CloudWatchMetricDataStatusCode toCloudWatchMetricDataStatusCode() {
    switch (this) {
      case 'Complete':
        return CloudWatchMetricDataStatusCode.complete;
      case 'InternalError':
        return CloudWatchMetricDataStatusCode.internalError;
      case 'PartialData':
        return CloudWatchMetricDataStatusCode.partialData;
    }
    throw Exception(
        '$this is not known in enum CloudWatchMetricDataStatusCode');
  }
}

/// Contains information about the analyzed metrics that displayed anomalous
/// behavior.
class CloudWatchMetricsDataSummary {
  /// This is an enum of the status showing whether the metric value pair list has
  /// partial or complete data, or if there was an error.
  final CloudWatchMetricDataStatusCode? statusCode;

  /// This is a list of Amazon CloudWatch metric values at given timestamp.
  final List<TimestampMetricValuePair>? timestampMetricValuePairList;

  CloudWatchMetricsDataSummary({
    this.statusCode,
    this.timestampMetricValuePairList,
  });

  factory CloudWatchMetricsDataSummary.fromJson(Map<String, dynamic> json) {
    return CloudWatchMetricsDataSummary(
      statusCode:
          (json['StatusCode'] as String?)?.toCloudWatchMetricDataStatusCode(),
      timestampMetricValuePairList:
          (json['TimestampMetricValuePairList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  TimestampMetricValuePair.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final timestampMetricValuePairList = this.timestampMetricValuePairList;
    return {
      if (statusCode != null) 'StatusCode': statusCode.toValue(),
      if (timestampMetricValuePairList != null)
        'TimestampMetricValuePairList': timestampMetricValuePairList,
    };
  }
}

/// Information about an Amazon CloudWatch metric.
class CloudWatchMetricsDetail {
  /// An array of CloudWatch dimensions associated with
  final List<CloudWatchMetricsDimension>? dimensions;

  /// This object returns anomaly metric data.
  final CloudWatchMetricsDataSummary? metricDataSummary;

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
    this.metricDataSummary,
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
      metricDataSummary: json['MetricDataSummary'] != null
          ? CloudWatchMetricsDataSummary.fromJson(
              json['MetricDataSummary'] as Map<String, dynamic>)
          : null,
      metricName: json['MetricName'] as String?,
      namespace: json['Namespace'] as String?,
      period: json['Period'] as int?,
      stat: (json['Stat'] as String?)?.toCloudWatchMetricsStat(),
      unit: json['Unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final metricDataSummary = this.metricDataSummary;
    final metricName = this.metricName;
    final namespace = this.namespace;
    final period = this.period;
    final stat = this.stat;
    final unit = this.unit;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (metricDataSummary != null) 'MetricDataSummary': metricDataSummary,
      if (metricName != null) 'MetricName': metricName,
      if (namespace != null) 'Namespace': namespace,
      if (period != null) 'Period': period,
      if (stat != null) 'Stat': stat.toValue(),
      if (unit != null) 'Unit': unit,
    };
  }
}

/// The dimension of an Amazon CloudWatch metric that is used when DevOps Guru
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

extension CloudWatchMetricsStatValueExtension on CloudWatchMetricsStat {
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

extension CloudWatchMetricsStatFromString on String {
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

/// Information about a filter used to specify which Amazon Web Services
/// resources are analyzed to create a monthly DevOps Guru cost estimate. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/cost-estimate.html">Estimate
/// your Amazon DevOps Guru costs</a> and <a
/// href="http://aws.amazon.com/devops-guru/pricing/">Amazon DevOps Guru
/// pricing</a>.
class CostEstimationResourceCollectionFilter {
  /// An object that specifies the CloudFormation stack that defines the Amazon
  /// Web Services resources used to create a monthly estimate for DevOps Guru.
  final CloudFormationCostEstimationResourceCollectionFilter? cloudFormation;

  /// The Amazon Web Services tags used to filter the resource collection that is
  /// used for a cost estimate.
  ///
  /// Tags help you identify and organize your Amazon Web Services resources. Many
  /// Amazon Web Services services support tagging, so you can assign the same tag
  /// to resources from different services to indicate that the resources are
  /// related. For example, you can assign the same tag to an Amazon DynamoDB
  /// table resource that you assign to an Lambda function. For more information
  /// about using tags, see the <a
  /// href="https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html">Tagging
  /// best practices</a> whitepaper.
  ///
  /// Each Amazon Web Services tag has two parts.
  ///
  /// <ul>
  /// <li>
  /// A tag <i>key</i> (for example, <code>CostCenter</code>,
  /// <code>Environment</code>, <code>Project</code>, or <code>Secret</code>). Tag
  /// <i>keys</i> are case-sensitive.
  /// </li>
  /// <li>
  /// An optional field known as a tag <i>value</i> (for example,
  /// <code>111122223333</code>, <code>Production</code>, or a team name).
  /// Omitting the tag <i>value</i> is the same as using an empty string. Like tag
  /// <i>keys</i>, tag <i>values</i> are case-sensitive.
  /// </li>
  /// </ul>
  /// Together these are known as <i>key</i>-<i>value</i> pairs.
  /// <important>
  /// The string used for a <i>key</i> in a tag that you use to define your
  /// resource coverage must begin with the prefix <code>Devops-guru-</code>. The
  /// tag <i>key</i> might be <code>DevOps-Guru-deployment-application</code> or
  /// <code>devops-guru-rds-application</code>. When you create a <i>key</i>, the
  /// case of characters in the <i>key</i> can be whatever you choose. After you
  /// create a <i>key</i>, it is case-sensitive. For example, DevOps Guru works
  /// with a <i>key</i> named <code>devops-guru-rds</code> and a <i>key</i> named
  /// <code>DevOps-Guru-RDS</code>, and these act as two different <i>keys</i>.
  /// Possible <i>key</i>/<i>value</i> pairs in your application might be
  /// <code>Devops-Guru-production-application/RDS</code> or
  /// <code>Devops-Guru-production-application/containers</code>.
  /// </important>
  final List<TagCostEstimationResourceCollectionFilter>? tags;

  CostEstimationResourceCollectionFilter({
    this.cloudFormation,
    this.tags,
  });

  factory CostEstimationResourceCollectionFilter.fromJson(
      Map<String, dynamic> json) {
    return CostEstimationResourceCollectionFilter(
      cloudFormation: json['CloudFormation'] != null
          ? CloudFormationCostEstimationResourceCollectionFilter.fromJson(
              json['CloudFormation'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => TagCostEstimationResourceCollectionFilter.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormation = this.cloudFormation;
    final tags = this.tags;
    return {
      if (cloudFormation != null) 'CloudFormation': cloudFormation,
      if (tags != null) 'Tags': tags,
    };
  }
}

enum CostEstimationServiceResourceState {
  active,
  inactive,
}

extension CostEstimationServiceResourceStateValueExtension
    on CostEstimationServiceResourceState {
  String toValue() {
    switch (this) {
      case CostEstimationServiceResourceState.active:
        return 'ACTIVE';
      case CostEstimationServiceResourceState.inactive:
        return 'INACTIVE';
    }
  }
}

extension CostEstimationServiceResourceStateFromString on String {
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

extension CostEstimationStatusValueExtension on CostEstimationStatus {
  String toValue() {
    switch (this) {
      case CostEstimationStatus.ongoing:
        return 'ONGOING';
      case CostEstimationStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension CostEstimationStatusFromString on String {
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

class DeleteInsightResponse {
  DeleteInsightResponse();

  factory DeleteInsightResponse.fromJson(Map<String, dynamic> _) {
    return DeleteInsightResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAccountHealthResponse {
  /// An integer that specifies the number of metrics that have been analyzed in
  /// your Amazon Web Services account.
  final int metricsAnalyzed;

  /// An integer that specifies the number of open proactive insights in your
  /// Amazon Web Services account.
  final int openProactiveInsights;

  /// An integer that specifies the number of open reactive insights in your
  /// Amazon Web Services account.
  final int openReactiveInsights;

  /// The number of Amazon DevOps Guru resource analysis hours billed to the
  /// current Amazon Web Services account in the last hour.
  final int resourceHours;

  /// Number of resources that DevOps Guru is monitoring in your Amazon Web
  /// Services account.
  final int? analyzedResourceCount;

  DescribeAccountHealthResponse({
    required this.metricsAnalyzed,
    required this.openProactiveInsights,
    required this.openReactiveInsights,
    required this.resourceHours,
    this.analyzedResourceCount,
  });

  factory DescribeAccountHealthResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAccountHealthResponse(
      metricsAnalyzed: json['MetricsAnalyzed'] as int,
      openProactiveInsights: json['OpenProactiveInsights'] as int,
      openReactiveInsights: json['OpenReactiveInsights'] as int,
      resourceHours: json['ResourceHours'] as int,
      analyzedResourceCount: json['AnalyzedResourceCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricsAnalyzed = this.metricsAnalyzed;
    final openProactiveInsights = this.openProactiveInsights;
    final openReactiveInsights = this.openReactiveInsights;
    final resourceHours = this.resourceHours;
    final analyzedResourceCount = this.analyzedResourceCount;
    return {
      'MetricsAnalyzed': metricsAnalyzed,
      'OpenProactiveInsights': openProactiveInsights,
      'OpenReactiveInsights': openReactiveInsights,
      'ResourceHours': resourceHours,
      if (analyzedResourceCount != null)
        'AnalyzedResourceCount': analyzedResourceCount,
    };
  }
}

class DescribeAccountOverviewResponse {
  /// The Mean Time to Recover (MTTR) for all closed insights that were created
  /// during the time range passed in.
  final int meanTimeToRecoverInMilliseconds;

  /// An integer that specifies the number of open proactive insights in your
  /// Amazon Web Services account that were created during the time range passed
  /// in.
  final int proactiveInsights;

  /// An integer that specifies the number of open reactive insights in your
  /// Amazon Web Services account that were created during the time range passed
  /// in.
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
  /// A <code>ProactiveAnomaly</code> object that represents the requested
  /// anomaly.
  final ProactiveAnomaly? proactiveAnomaly;

  /// A <code>ReactiveAnomaly</code> object that represents the requested anomaly.
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

class DescribeEventSourcesConfigResponse {
  /// Lists the event sources in the configuration.
  final EventSourcesConfig? eventSources;

  DescribeEventSourcesConfigResponse({
    this.eventSources,
  });

  factory DescribeEventSourcesConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeEventSourcesConfigResponse(
      eventSources: json['EventSources'] != null
          ? EventSourcesConfig.fromJson(
              json['EventSources'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eventSources = this.eventSources;
    return {
      if (eventSources != null) 'EventSources': eventSources,
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

class DescribeOrganizationHealthResponse {
  /// An integer that specifies the number of metrics that have been analyzed in
  /// your organization.
  final int metricsAnalyzed;

  /// An integer that specifies the number of open proactive insights in your
  /// Amazon Web Services account.
  final int openProactiveInsights;

  /// An integer that specifies the number of open reactive insights in your
  /// Amazon Web Services account.
  final int openReactiveInsights;

  /// The number of Amazon DevOps Guru resource analysis hours billed to the
  /// current Amazon Web Services account in the last hour.
  final int resourceHours;

  DescribeOrganizationHealthResponse({
    required this.metricsAnalyzed,
    required this.openProactiveInsights,
    required this.openReactiveInsights,
    required this.resourceHours,
  });

  factory DescribeOrganizationHealthResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOrganizationHealthResponse(
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

class DescribeOrganizationOverviewResponse {
  /// An integer that specifies the number of open proactive insights in your
  /// Amazon Web Services account.
  final int proactiveInsights;

  /// An integer that specifies the number of open reactive insights in your
  /// Amazon Web Services account.
  final int reactiveInsights;

  DescribeOrganizationOverviewResponse({
    required this.proactiveInsights,
    required this.reactiveInsights,
  });

  factory DescribeOrganizationOverviewResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOrganizationOverviewResponse(
      proactiveInsights: json['ProactiveInsights'] as int,
      reactiveInsights: json['ReactiveInsights'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final proactiveInsights = this.proactiveInsights;
    final reactiveInsights = this.reactiveInsights;
    return {
      'ProactiveInsights': proactiveInsights,
      'ReactiveInsights': reactiveInsights,
    };
  }
}

class DescribeOrganizationResourceCollectionHealthResponse {
  /// The name of the organization's account.
  final List<AccountHealth>? account;

  /// The returned <code>CloudFormationHealthOverview</code> object that contains
  /// an <code>InsightHealthOverview</code> object with the requested system
  /// health information.
  final List<CloudFormationHealth>? cloudFormation;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// An array of <code>ServiceHealth</code> objects that describes the health of
  /// the Amazon Web Services services associated with the resources in the
  /// collection.
  final List<ServiceHealth>? service;

  /// Tags help you identify and organize your Amazon Web Services resources. Many
  /// Amazon Web Services services support tagging, so you can assign the same tag
  /// to resources from different services to indicate that the resources are
  /// related. For example, you can assign the same tag to an Amazon DynamoDB
  /// table resource that you assign to an Lambda function. For more information
  /// about using tags, see the <a
  /// href="https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html">Tagging
  /// best practices</a> whitepaper.
  ///
  /// Each Amazon Web Services tag has two parts.
  ///
  /// <ul>
  /// <li>
  /// A tag <i>key</i> (for example, <code>CostCenter</code>,
  /// <code>Environment</code>, <code>Project</code>, or <code>Secret</code>). Tag
  /// <i>keys</i> are case-sensitive.
  /// </li>
  /// <li>
  /// An optional field known as a tag <i>value</i> (for example,
  /// <code>111122223333</code>, <code>Production</code>, or a team name).
  /// Omitting the tag <i>value</i> is the same as using an empty string. Like tag
  /// <i>keys</i>, tag <i>values</i> are case-sensitive.
  /// </li>
  /// </ul>
  /// Together these are known as <i>key</i>-<i>value</i> pairs.
  /// <important>
  /// The string used for a <i>key</i> in a tag that you use to define your
  /// resource coverage must begin with the prefix <code>Devops-guru-</code>. The
  /// tag <i>key</i> might be <code>DevOps-Guru-deployment-application</code> or
  /// <code>devops-guru-rds-application</code>. When you create a <i>key</i>, the
  /// case of characters in the <i>key</i> can be whatever you choose. After you
  /// create a <i>key</i>, it is case-sensitive. For example, DevOps Guru works
  /// with a <i>key</i> named <code>devops-guru-rds</code> and a <i>key</i> named
  /// <code>DevOps-Guru-RDS</code>, and these act as two different <i>keys</i>.
  /// Possible <i>key</i>/<i>value</i> pairs in your application might be
  /// <code>Devops-Guru-production-application/RDS</code> or
  /// <code>Devops-Guru-production-application/containers</code>.
  /// </important>
  final List<TagHealth>? tags;

  DescribeOrganizationResourceCollectionHealthResponse({
    this.account,
    this.cloudFormation,
    this.nextToken,
    this.service,
    this.tags,
  });

  factory DescribeOrganizationResourceCollectionHealthResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOrganizationResourceCollectionHealthResponse(
      account: (json['Account'] as List?)
          ?.whereNotNull()
          .map((e) => AccountHealth.fromJson(e as Map<String, dynamic>))
          .toList(),
      cloudFormation: (json['CloudFormation'] as List?)
          ?.whereNotNull()
          .map((e) => CloudFormationHealth.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      service: (json['Service'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceHealth.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => TagHealth.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    final cloudFormation = this.cloudFormation;
    final nextToken = this.nextToken;
    final service = this.service;
    final tags = this.tags;
    return {
      if (account != null) 'Account': account,
      if (cloudFormation != null) 'CloudFormation': cloudFormation,
      if (nextToken != null) 'NextToken': nextToken,
      if (service != null) 'Service': service,
      if (tags != null) 'Tags': tags,
    };
  }
}

class DescribeResourceCollectionHealthResponse {
  /// The returned <code>CloudFormationHealthOverview</code> object that contains
  /// an <code>InsightHealthOverview</code> object with the requested system
  /// health information.
  final List<CloudFormationHealth>? cloudFormation;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// An array of <code>ServiceHealth</code> objects that describes the health of
  /// the Amazon Web Services services associated with the resources in the
  /// collection.
  final List<ServiceHealth>? service;

  /// The Amazon Web Services tags that are used by resources in the resource
  /// collection.
  ///
  /// Tags help you identify and organize your Amazon Web Services resources. Many
  /// Amazon Web Services services support tagging, so you can assign the same tag
  /// to resources from different services to indicate that the resources are
  /// related. For example, you can assign the same tag to an Amazon DynamoDB
  /// table resource that you assign to an Lambda function. For more information
  /// about using tags, see the <a
  /// href="https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html">Tagging
  /// best practices</a> whitepaper.
  ///
  /// Each Amazon Web Services tag has two parts.
  ///
  /// <ul>
  /// <li>
  /// A tag <i>key</i> (for example, <code>CostCenter</code>,
  /// <code>Environment</code>, <code>Project</code>, or <code>Secret</code>). Tag
  /// <i>keys</i> are case-sensitive.
  /// </li>
  /// <li>
  /// An optional field known as a tag <i>value</i> (for example,
  /// <code>111122223333</code>, <code>Production</code>, or a team name).
  /// Omitting the tag <i>value</i> is the same as using an empty string. Like tag
  /// <i>keys</i>, tag <i>values</i> are case-sensitive.
  /// </li>
  /// </ul>
  /// Together these are known as <i>key</i>-<i>value</i> pairs.
  /// <important>
  /// The string used for a <i>key</i> in a tag that you use to define your
  /// resource coverage must begin with the prefix <code>Devops-guru-</code>. The
  /// tag <i>key</i> might be <code>DevOps-Guru-deployment-application</code> or
  /// <code>devops-guru-rds-application</code>. When you create a <i>key</i>, the
  /// case of characters in the <i>key</i> can be whatever you choose. After you
  /// create a <i>key</i>, it is case-sensitive. For example, DevOps Guru works
  /// with a <i>key</i> named <code>devops-guru-rds</code> and a <i>key</i> named
  /// <code>DevOps-Guru-RDS</code>, and these act as two different <i>keys</i>.
  /// Possible <i>key</i>/<i>value</i> pairs in your application might be
  /// <code>Devops-Guru-production-application/RDS</code> or
  /// <code>Devops-Guru-production-application/containers</code>.
  /// </important>
  final List<TagHealth>? tags;

  DescribeResourceCollectionHealthResponse({
    this.cloudFormation,
    this.nextToken,
    this.service,
    this.tags,
  });

  factory DescribeResourceCollectionHealthResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeResourceCollectionHealthResponse(
      cloudFormation: (json['CloudFormation'] as List?)
          ?.whereNotNull()
          .map((e) => CloudFormationHealth.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      service: (json['Service'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceHealth.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => TagHealth.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormation = this.cloudFormation;
    final nextToken = this.nextToken;
    final service = this.service;
    final tags = this.tags;
    return {
      if (cloudFormation != null) 'CloudFormation': cloudFormation,
      if (nextToken != null) 'NextToken': nextToken,
      if (service != null) 'Service': service,
      if (tags != null) 'Tags': tags,
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

  Map<String, dynamic> toJson() {
    final fromTime = this.fromTime;
    final toTime = this.toTime;
    return {
      if (fromTime != null) 'FromTime': unixTimestampToJson(fromTime),
      if (toTime != null) 'ToTime': unixTimestampToJson(toTime),
    };
  }
}

/// An Amazon Web Services resource event. Amazon Web Services resource events
/// and metrics are analyzed by DevOps Guru to find anomalous behavior and
/// provide recommendations to improve your operational solutions.
class Event {
  /// The source, <code>AWS_CLOUD_TRAIL</code> or <code>AWS_CODE_DEPLOY</code>,
  /// where DevOps Guru analysis found the event.
  final EventDataSource? dataSource;

  /// The class of the event. The class specifies what the event is related to,
  /// such as an infrastructure change, a deployment, or a schema change.
  final EventClass? eventClass;

  /// The Amazon Web Services source that emitted the event.
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

extension EventClassValueExtension on EventClass {
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

extension EventClassFromString on String {
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

extension EventDataSourceValueExtension on EventDataSource {
  String toValue() {
    switch (this) {
      case EventDataSource.awsCloudTrail:
        return 'AWS_CLOUD_TRAIL';
      case EventDataSource.awsCodeDeploy:
        return 'AWS_CODE_DEPLOY';
    }
  }
}

extension EventDataSourceFromString on String {
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

/// The Amazon Web Services resource that emitted an event. Amazon Web Services
/// resource events and metrics are analyzed by DevOps Guru to find anomalous
/// behavior and provide recommendations to improve your operational solutions.
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

enum EventSourceOptInStatus {
  enabled,
  disabled,
}

extension EventSourceOptInStatusValueExtension on EventSourceOptInStatus {
  String toValue() {
    switch (this) {
      case EventSourceOptInStatus.enabled:
        return 'ENABLED';
      case EventSourceOptInStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension EventSourceOptInStatusFromString on String {
  EventSourceOptInStatus toEventSourceOptInStatus() {
    switch (this) {
      case 'ENABLED':
        return EventSourceOptInStatus.enabled;
      case 'DISABLED':
        return EventSourceOptInStatus.disabled;
    }
    throw Exception('$this is not known in enum EventSourceOptInStatus');
  }
}

/// Information about the integration of DevOps Guru as consumer with another
/// AWS service, such as AWS CodeGuru Profiler via EventBridge.
class EventSourcesConfig {
  /// Information about whether DevOps Guru is configured to consume
  /// recommendations which are generated from AWS CodeGuru Profiler.
  final AmazonCodeGuruProfilerIntegration? amazonCodeGuruProfiler;

  EventSourcesConfig({
    this.amazonCodeGuruProfiler,
  });

  factory EventSourcesConfig.fromJson(Map<String, dynamic> json) {
    return EventSourcesConfig(
      amazonCodeGuruProfiler: json['AmazonCodeGuruProfiler'] != null
          ? AmazonCodeGuruProfilerIntegration.fromJson(
              json['AmazonCodeGuruProfiler'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final amazonCodeGuruProfiler = this.amazonCodeGuruProfiler;
    return {
      if (amazonCodeGuruProfiler != null)
        'AmazonCodeGuruProfiler': amazonCodeGuruProfiler,
    };
  }
}

/// The time range during which an Amazon Web Services event occurred. Amazon
/// Web Services resource events and metrics are analyzed by DevOps Guru to find
/// anomalous behavior and provide recommendations to improve your operational
/// solutions.
class EventTimeRange {
  /// The time when the event started.
  final DateTime fromTime;

  /// The time when the event ended.
  final DateTime toTime;

  EventTimeRange({
    required this.fromTime,
    required this.toTime,
  });

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
  /// about the monthly cost estimate to analyze one of your Amazon Web Services
  /// resources.
  final List<ServiceResourceCost>? costs;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// The collection of the Amazon Web Services resources used to create your
  /// monthly DevOps Guru cost estimate.
  final CostEstimationResourceCollectionFilter? resourceCollection;

  /// The status of creating this cost estimate. If it's still in progress, the
  /// status <code>ONGOING</code> is returned. If it is finished, the status
  /// <code>COMPLETED</code> is returned.
  final CostEstimationStatus? status;

  /// The start and end time of the cost estimation.
  final CostEstimationTimeRange? timeRange;

  /// The estimated monthly cost to analyze the Amazon Web Services resources.
  /// This value is the sum of the estimated costs to analyze each resource in the
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

  /// The requested list of Amazon Web Services resource collections. The two
  /// types of Amazon Web Services resource collections supported are Amazon Web
  /// Services CloudFormation stacks and Amazon Web Services resources that
  /// contain the same Amazon Web Services tag. DevOps Guru can be configured to
  /// analyze the Amazon Web Services resources that are defined in the stacks or
  /// that are tagged using the same tag <i>key</i>. You can specify up to 500
  /// Amazon Web Services CloudFormation stacks.
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

extension InsightFeedbackOptionValueExtension on InsightFeedbackOption {
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

extension InsightFeedbackOptionFromString on String {
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

extension InsightSeverityValueExtension on InsightSeverity {
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

extension InsightSeverityFromString on String {
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

extension InsightStatusValueExtension on InsightStatus {
  String toValue() {
    switch (this) {
      case InsightStatus.ongoing:
        return 'ONGOING';
      case InsightStatus.closed:
        return 'CLOSED';
    }
  }
}

extension InsightStatusFromString on String {
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

extension InsightTypeValueExtension on InsightType {
  String toValue() {
    switch (this) {
      case InsightType.reactive:
        return 'REACTIVE';
      case InsightType.proactive:
        return 'PROACTIVE';
    }
  }
}

extension InsightTypeFromString on String {
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

/// Information about the KMS encryption used with DevOps Guru.
class KMSServerSideEncryptionIntegration {
  /// Describes the specified KMS key.
  ///
  /// To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN.
  /// When using an alias name, prefix it with "alias/". If you specify a
  /// predefined Amazon Web Services alias (an Amazon Web Services alias with no
  /// key ID), Amazon Web Services KMS associates the alias with an Amazon Web
  /// Services managed key and returns its KeyId and Arn in the response. To
  /// specify a KMS key in a different Amazon Web Services account, you must use
  /// the key ARN or alias ARN.
  ///
  /// For example:
  ///
  /// Key ID: 1234abcd-12ab-34cd-56ef-1234567890ab
  ///
  /// Key ARN:
  /// arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab
  ///
  /// Alias name: alias/ExampleAlias
  ///
  /// Alias ARN: arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias
  final String? kMSKeyId;

  /// Specifies if DevOps Guru is enabled for customer managed keys.
  final OptInStatus? optInStatus;

  /// The type of KMS key used. Customer managed keys are the KMS keys that you
  /// create. Amazon Web Services owned keys are keys that are owned and managed
  /// by DevOps Guru.
  final ServerSideEncryptionType? type;

  KMSServerSideEncryptionIntegration({
    this.kMSKeyId,
    this.optInStatus,
    this.type,
  });

  factory KMSServerSideEncryptionIntegration.fromJson(
      Map<String, dynamic> json) {
    return KMSServerSideEncryptionIntegration(
      kMSKeyId: json['KMSKeyId'] as String?,
      optInStatus: (json['OptInStatus'] as String?)?.toOptInStatus(),
      type: (json['Type'] as String?)?.toServerSideEncryptionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final kMSKeyId = this.kMSKeyId;
    final optInStatus = this.optInStatus;
    final type = this.type;
    return {
      if (kMSKeyId != null) 'KMSKeyId': kMSKeyId,
      if (optInStatus != null) 'OptInStatus': optInStatus.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Information about whether DevOps Guru is configured to encrypt server-side
/// data using KMS.
class KMSServerSideEncryptionIntegrationConfig {
  /// Describes the specified KMS key.
  ///
  /// To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN.
  /// When using an alias name, prefix it with "alias/". If you specify a
  /// predefined Amazon Web Services alias (an Amazon Web Services alias with no
  /// key ID), Amazon Web Services KMS associates the alias with an Amazon Web
  /// Services managed key and returns its KeyId and Arn in the response. To
  /// specify a KMS key in a different Amazon Web Services account, you must use
  /// the key ARN or alias ARN.
  ///
  /// For example:
  ///
  /// Key ID: 1234abcd-12ab-34cd-56ef-1234567890ab
  ///
  /// Key ARN:
  /// arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab
  ///
  /// Alias name: alias/ExampleAlias
  ///
  /// Alias ARN: arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias
  final String? kMSKeyId;

  /// Specifies if DevOps Guru is enabled for KMS integration.
  final OptInStatus? optInStatus;

  /// The type of KMS key used. Customer managed keys are the KMS keys that you
  /// create. Amazon Web Services owned keys are keys that are owned and managed
  /// by DevOps Guru.
  final ServerSideEncryptionType? type;

  KMSServerSideEncryptionIntegrationConfig({
    this.kMSKeyId,
    this.optInStatus,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final kMSKeyId = this.kMSKeyId;
    final optInStatus = this.optInStatus;
    final type = this.type;
    return {
      if (kMSKeyId != null) 'KMSKeyId': kMSKeyId,
      if (optInStatus != null) 'OptInStatus': optInStatus.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Specifies one or more service names that are used to list anomalies.
class ListAnomaliesForInsightFilters {
  final ServiceCollection? serviceCollection;

  ListAnomaliesForInsightFilters({
    this.serviceCollection,
  });

  Map<String, dynamic> toJson() {
    final serviceCollection = this.serviceCollection;
    return {
      if (serviceCollection != null) 'ServiceCollection': serviceCollection,
    };
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

class ListAnomalousLogGroupsResponse {
  /// The list of Amazon CloudWatch log groups that are related to an insight.
  final List<AnomalousLogGroup> anomalousLogGroups;

  /// The ID of the insight containing the log groups.
  final String insightId;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  ListAnomalousLogGroupsResponse({
    required this.anomalousLogGroups,
    required this.insightId,
    this.nextToken,
  });

  factory ListAnomalousLogGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListAnomalousLogGroupsResponse(
      anomalousLogGroups: (json['AnomalousLogGroups'] as List)
          .whereNotNull()
          .map((e) => AnomalousLogGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      insightId: json['InsightId'] as String,
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalousLogGroups = this.anomalousLogGroups;
    final insightId = this.insightId;
    final nextToken = this.nextToken;
    return {
      'AnomalousLogGroups': anomalousLogGroups,
      'InsightId': insightId,
      if (nextToken != null) 'NextToken': nextToken,
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

  /// The Amazon Web Services source that emitted the events you want to filter
  /// for.
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

/// Filters to determine which monitored resources you want to retrieve. You can
/// filter by resource type or resource permission status.
class ListMonitoredResourcesFilters {
  /// The permission status of a resource.
  final ResourcePermission resourcePermission;

  /// The type of resource that you wish to retrieve, such as log groups.
  final List<ResourceTypeFilter> resourceTypeFilters;

  ListMonitoredResourcesFilters({
    required this.resourcePermission,
    required this.resourceTypeFilters,
  });

  Map<String, dynamic> toJson() {
    final resourcePermission = this.resourcePermission;
    final resourceTypeFilters = this.resourceTypeFilters;
    return {
      'ResourcePermission': resourcePermission.toValue(),
      'ResourceTypeFilters':
          resourceTypeFilters.map((e) => e.toValue()).toList(),
    };
  }
}

class ListMonitoredResourcesResponse {
  /// Information about the resource that is being monitored, including the name
  /// of the resource, the type of resource, and whether or not permission is
  /// given to DevOps Guru to access that resource.
  final List<MonitoredResourceIdentifier> monitoredResourceIdentifiers;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  ListMonitoredResourcesResponse({
    required this.monitoredResourceIdentifiers,
    this.nextToken,
  });

  factory ListMonitoredResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListMonitoredResourcesResponse(
      monitoredResourceIdentifiers: (json['MonitoredResourceIdentifiers']
              as List)
          .whereNotNull()
          .map((e) =>
              MonitoredResourceIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final monitoredResourceIdentifiers = this.monitoredResourceIdentifiers;
    final nextToken = this.nextToken;
    return {
      'MonitoredResourceIdentifiers': monitoredResourceIdentifiers,
      if (nextToken != null) 'NextToken': nextToken,
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

class ListOrganizationInsightsResponse {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// An integer that specifies the number of open proactive insights in your
  /// Amazon Web Services account.
  final List<ProactiveOrganizationInsightSummary>? proactiveInsights;

  /// An integer that specifies the number of open reactive insights in your
  /// Amazon Web Services account.
  final List<ReactiveOrganizationInsightSummary>? reactiveInsights;

  ListOrganizationInsightsResponse({
    this.nextToken,
    this.proactiveInsights,
    this.reactiveInsights,
  });

  factory ListOrganizationInsightsResponse.fromJson(Map<String, dynamic> json) {
    return ListOrganizationInsightsResponse(
      nextToken: json['NextToken'] as String?,
      proactiveInsights: (json['ProactiveInsights'] as List?)
          ?.whereNotNull()
          .map((e) => ProactiveOrganizationInsightSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      reactiveInsights: (json['ReactiveInsights'] as List?)
          ?.whereNotNull()
          .map((e) => ReactiveOrganizationInsightSummary.fromJson(
              e as Map<String, dynamic>))
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

extension LocaleValueExtension on Locale {
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

extension LocaleFromString on String {
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

/// Information about an anomalous log event found within a log group.
class LogAnomalyClass {
  /// The explanation for why the log event is considered an anomaly.
  final String? explanation;

  /// The token where the anomaly was detected. This may refer to an exception or
  /// another location, or it may be blank for log anomalies such as format
  /// anomalies.
  final String? logAnomalyToken;

  /// The type of log anomaly that has been detected.
  final LogAnomalyType? logAnomalyType;

  /// The ID of the log event.
  final String? logEventId;

  /// The time of the first occurrence of the anomalous log event.
  final DateTime? logEventTimestamp;

  /// The name of the Amazon CloudWatch log stream that the anomalous log event
  /// belongs to. A log stream is a sequence of log events that share the same
  /// source.
  final String? logStreamName;

  /// The number of log lines where this anomalous log event occurs.
  final int? numberOfLogLinesOccurrences;

  LogAnomalyClass({
    this.explanation,
    this.logAnomalyToken,
    this.logAnomalyType,
    this.logEventId,
    this.logEventTimestamp,
    this.logStreamName,
    this.numberOfLogLinesOccurrences,
  });

  factory LogAnomalyClass.fromJson(Map<String, dynamic> json) {
    return LogAnomalyClass(
      explanation: json['Explanation'] as String?,
      logAnomalyToken: json['LogAnomalyToken'] as String?,
      logAnomalyType: (json['LogAnomalyType'] as String?)?.toLogAnomalyType(),
      logEventId: json['LogEventId'] as String?,
      logEventTimestamp: timeStampFromJson(json['LogEventTimestamp']),
      logStreamName: json['LogStreamName'] as String?,
      numberOfLogLinesOccurrences: json['NumberOfLogLinesOccurrences'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final explanation = this.explanation;
    final logAnomalyToken = this.logAnomalyToken;
    final logAnomalyType = this.logAnomalyType;
    final logEventId = this.logEventId;
    final logEventTimestamp = this.logEventTimestamp;
    final logStreamName = this.logStreamName;
    final numberOfLogLinesOccurrences = this.numberOfLogLinesOccurrences;
    return {
      if (explanation != null) 'Explanation': explanation,
      if (logAnomalyToken != null) 'LogAnomalyToken': logAnomalyToken,
      if (logAnomalyType != null) 'LogAnomalyType': logAnomalyType.toValue(),
      if (logEventId != null) 'LogEventId': logEventId,
      if (logEventTimestamp != null)
        'LogEventTimestamp': unixTimestampToJson(logEventTimestamp),
      if (logStreamName != null) 'LogStreamName': logStreamName,
      if (numberOfLogLinesOccurrences != null)
        'NumberOfLogLinesOccurrences': numberOfLogLinesOccurrences,
    };
  }
}

/// A cluster of similar anomalous log events found within a log group.
class LogAnomalyShowcase {
  /// A list of anomalous log events that may be related.
  final List<LogAnomalyClass>? logAnomalyClasses;

  LogAnomalyShowcase({
    this.logAnomalyClasses,
  });

  factory LogAnomalyShowcase.fromJson(Map<String, dynamic> json) {
    return LogAnomalyShowcase(
      logAnomalyClasses: (json['LogAnomalyClasses'] as List?)
          ?.whereNotNull()
          .map((e) => LogAnomalyClass.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logAnomalyClasses = this.logAnomalyClasses;
    return {
      if (logAnomalyClasses != null) 'LogAnomalyClasses': logAnomalyClasses,
    };
  }
}

enum LogAnomalyType {
  keyword,
  keywordToken,
  format,
  httpCode,
  blockFormat,
  numericalPoint,
  numericalNan,
  newFieldName,
}

extension LogAnomalyTypeValueExtension on LogAnomalyType {
  String toValue() {
    switch (this) {
      case LogAnomalyType.keyword:
        return 'KEYWORD';
      case LogAnomalyType.keywordToken:
        return 'KEYWORD_TOKEN';
      case LogAnomalyType.format:
        return 'FORMAT';
      case LogAnomalyType.httpCode:
        return 'HTTP_CODE';
      case LogAnomalyType.blockFormat:
        return 'BLOCK_FORMAT';
      case LogAnomalyType.numericalPoint:
        return 'NUMERICAL_POINT';
      case LogAnomalyType.numericalNan:
        return 'NUMERICAL_NAN';
      case LogAnomalyType.newFieldName:
        return 'NEW_FIELD_NAME';
    }
  }
}

extension LogAnomalyTypeFromString on String {
  LogAnomalyType toLogAnomalyType() {
    switch (this) {
      case 'KEYWORD':
        return LogAnomalyType.keyword;
      case 'KEYWORD_TOKEN':
        return LogAnomalyType.keywordToken;
      case 'FORMAT':
        return LogAnomalyType.format;
      case 'HTTP_CODE':
        return LogAnomalyType.httpCode;
      case 'BLOCK_FORMAT':
        return LogAnomalyType.blockFormat;
      case 'NUMERICAL_POINT':
        return LogAnomalyType.numericalPoint;
      case 'NUMERICAL_NAN':
        return LogAnomalyType.numericalNan;
      case 'NEW_FIELD_NAME':
        return LogAnomalyType.newFieldName;
    }
    throw Exception('$this is not known in enum LogAnomalyType');
  }
}

/// Information about the integration of DevOps Guru with CloudWatch log groups
/// for log anomaly detection.
class LogsAnomalyDetectionIntegration {
  /// Specifies if DevOps Guru is configured to perform log anomaly detection on
  /// CloudWatch log groups.
  final OptInStatus? optInStatus;

  LogsAnomalyDetectionIntegration({
    this.optInStatus,
  });

  factory LogsAnomalyDetectionIntegration.fromJson(Map<String, dynamic> json) {
    return LogsAnomalyDetectionIntegration(
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

/// Information about the integration of DevOps Guru with CloudWatch log groups
/// for log anomaly detection. You can use this to update the configuration.
class LogsAnomalyDetectionIntegrationConfig {
  /// Specifies if DevOps Guru is configured to perform log anomaly detection on
  /// CloudWatch log groups.
  final OptInStatus? optInStatus;

  LogsAnomalyDetectionIntegrationConfig({
    this.optInStatus,
  });

  Map<String, dynamic> toJson() {
    final optInStatus = this.optInStatus;
    return {
      if (optInStatus != null) 'OptInStatus': optInStatus.toValue(),
    };
  }
}

/// Information about the resource that is being monitored, including the name
/// of the resource, the type of resource, and whether or not permission is
/// given to DevOps Guru to access that resource.
class MonitoredResourceIdentifier {
  /// The time at which DevOps Guru last updated this resource.
  final DateTime? lastUpdated;

  /// The name of the resource being monitored.
  final String? monitoredResourceName;
  final ResourceCollection? resourceCollection;

  /// The permission status of a resource.
  final ResourcePermission? resourcePermission;

  /// The type of resource being monitored.
  final String? type;

  MonitoredResourceIdentifier({
    this.lastUpdated,
    this.monitoredResourceName,
    this.resourceCollection,
    this.resourcePermission,
    this.type,
  });

  factory MonitoredResourceIdentifier.fromJson(Map<String, dynamic> json) {
    return MonitoredResourceIdentifier(
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      monitoredResourceName: json['MonitoredResourceName'] as String?,
      resourceCollection: json['ResourceCollection'] != null
          ? ResourceCollection.fromJson(
              json['ResourceCollection'] as Map<String, dynamic>)
          : null,
      resourcePermission:
          (json['ResourcePermission'] as String?)?.toResourcePermission(),
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdated = this.lastUpdated;
    final monitoredResourceName = this.monitoredResourceName;
    final resourceCollection = this.resourceCollection;
    final resourcePermission = this.resourcePermission;
    final type = this.type;
    return {
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (monitoredResourceName != null)
        'MonitoredResourceName': monitoredResourceName,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (resourcePermission != null)
        'ResourcePermission': resourcePermission.toValue(),
      if (type != null) 'Type': type,
    };
  }
}

/// Information about a notification channel. A notification channel is used to
/// notify you when DevOps Guru creates an insight. The one supported
/// notification channel is Amazon Simple Notification Service (Amazon SNS).
///
/// If you use an Amazon SNS topic in another account, you must attach a policy
/// to it that grants DevOps Guru permission to send it notifications. DevOps
/// Guru adds the required policy on your behalf to send notifications using
/// Amazon SNS in your account. DevOps Guru only supports standard SNS topics.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-required-permissions.html">Permissions
/// for Amazon SNS topics</a>.
///
/// If you use an Amazon SNS topic that is encrypted by an Amazon Web Services
/// Key Management Service customer-managed key (CMK), then you must add
/// permissions to the CMK. For more information, see <a
/// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-kms-permissions.html">Permissions
/// for Amazon Web Services KMS–encrypted Amazon SNS topics</a>.
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
  /// to it that grants DevOps Guru permission to send it notifications. DevOps
  /// Guru adds the required policy on your behalf to send notifications using
  /// Amazon SNS in your account. DevOps Guru only supports standard SNS topics.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-required-permissions.html">Permissions
  /// for Amazon SNS topics</a>.
  ///
  /// If you use an Amazon SNS topic that is encrypted by an Amazon Web Services
  /// Key Management Service customer-managed key (CMK), then you must add
  /// permissions to the CMK. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-kms-permissions.html">Permissions
  /// for Amazon Web Services KMS–encrypted Amazon SNS topics</a>.
  final SnsChannelConfig sns;

  /// The filter configurations for the Amazon SNS notification topic you use with
  /// DevOps Guru. If you do not provide filter configurations, the default
  /// configurations are to receive notifications for all message types of
  /// <code>High</code> or <code>Medium</code> severity.
  final NotificationFilterConfig? filters;

  NotificationChannelConfig({
    required this.sns,
    this.filters,
  });

  factory NotificationChannelConfig.fromJson(Map<String, dynamic> json) {
    return NotificationChannelConfig(
      sns: SnsChannelConfig.fromJson(json['Sns'] as Map<String, dynamic>),
      filters: json['Filters'] != null
          ? NotificationFilterConfig.fromJson(
              json['Filters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sns = this.sns;
    final filters = this.filters;
    return {
      'Sns': sns,
      if (filters != null) 'Filters': filters,
    };
  }
}

/// The filter configurations for the Amazon SNS notification topic you use with
/// DevOps Guru. You can choose to specify which events or message types to
/// receive notifications for. You can also choose to specify which severity
/// levels to receive notifications for.
class NotificationFilterConfig {
  /// The events that you want to receive notifications for. For example, you can
  /// choose to receive notifications only when the severity level is upgraded or
  /// a new insight is created.
  final List<NotificationMessageType>? messageTypes;

  /// The severity levels that you want to receive notifications for. For example,
  /// you can choose to receive notifications only for insights with
  /// <code>HIGH</code> and <code>MEDIUM</code> severity levels. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/working-with-insights.html#understanding-insights-severities">Understanding
  /// insight severities</a>.
  final List<InsightSeverity>? severities;

  NotificationFilterConfig({
    this.messageTypes,
    this.severities,
  });

  factory NotificationFilterConfig.fromJson(Map<String, dynamic> json) {
    return NotificationFilterConfig(
      messageTypes: (json['MessageTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toNotificationMessageType())
          .toList(),
      severities: (json['Severities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toInsightSeverity())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final messageTypes = this.messageTypes;
    final severities = this.severities;
    return {
      if (messageTypes != null)
        'MessageTypes': messageTypes.map((e) => e.toValue()).toList(),
      if (severities != null)
        'Severities': severities.map((e) => e.toValue()).toList(),
    };
  }
}

enum NotificationMessageType {
  newInsight,
  closedInsight,
  newAssociation,
  severityUpgraded,
  newRecommendation,
}

extension NotificationMessageTypeValueExtension on NotificationMessageType {
  String toValue() {
    switch (this) {
      case NotificationMessageType.newInsight:
        return 'NEW_INSIGHT';
      case NotificationMessageType.closedInsight:
        return 'CLOSED_INSIGHT';
      case NotificationMessageType.newAssociation:
        return 'NEW_ASSOCIATION';
      case NotificationMessageType.severityUpgraded:
        return 'SEVERITY_UPGRADED';
      case NotificationMessageType.newRecommendation:
        return 'NEW_RECOMMENDATION';
    }
  }
}

extension NotificationMessageTypeFromString on String {
  NotificationMessageType toNotificationMessageType() {
    switch (this) {
      case 'NEW_INSIGHT':
        return NotificationMessageType.newInsight;
      case 'CLOSED_INSIGHT':
        return NotificationMessageType.closedInsight;
      case 'NEW_ASSOCIATION':
        return NotificationMessageType.newAssociation;
      case 'SEVERITY_UPGRADED':
        return NotificationMessageType.severityUpgraded;
      case 'NEW_RECOMMENDATION':
        return NotificationMessageType.newRecommendation;
    }
    throw Exception('$this is not known in enum NotificationMessageType');
  }
}

/// Information about whether DevOps Guru is configured to create an OpsItem in
/// Amazon Web Services Systems Manager OpsCenter for each created insight.
class OpsCenterIntegration {
  /// Specifies if DevOps Guru is enabled to create an Amazon Web Services Systems
  /// Manager OpsItem for each created insight.
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
/// Amazon Web Services Systems Manager OpsCenter for each created insight. You
/// can use this to update the configuration.
class OpsCenterIntegrationConfig {
  /// Specifies if DevOps Guru is enabled to create an Amazon Web Services Systems
  /// Manager OpsItem for each created insight.
  final OptInStatus? optInStatus;

  OpsCenterIntegrationConfig({
    this.optInStatus,
  });

  Map<String, dynamic> toJson() {
    final optInStatus = this.optInStatus;
    return {
      if (optInStatus != null) 'OptInStatus': optInStatus.toValue(),
    };
  }
}

/// Specifies if DevOps Guru is enabled to create an Amazon Web Services Systems
/// Manager OpsItem for each created insight.
enum OptInStatus {
  enabled,
  disabled,
}

extension OptInStatusValueExtension on OptInStatus {
  String toValue() {
    switch (this) {
      case OptInStatus.enabled:
        return 'ENABLED';
      case OptInStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension OptInStatusFromString on String {
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

enum OrganizationResourceCollectionType {
  awsCloudFormation,
  awsService,
  awsAccount,
  awsTags,
}

extension OrganizationResourceCollectionTypeValueExtension
    on OrganizationResourceCollectionType {
  String toValue() {
    switch (this) {
      case OrganizationResourceCollectionType.awsCloudFormation:
        return 'AWS_CLOUD_FORMATION';
      case OrganizationResourceCollectionType.awsService:
        return 'AWS_SERVICE';
      case OrganizationResourceCollectionType.awsAccount:
        return 'AWS_ACCOUNT';
      case OrganizationResourceCollectionType.awsTags:
        return 'AWS_TAGS';
    }
  }
}

extension OrganizationResourceCollectionTypeFromString on String {
  OrganizationResourceCollectionType toOrganizationResourceCollectionType() {
    switch (this) {
      case 'AWS_CLOUD_FORMATION':
        return OrganizationResourceCollectionType.awsCloudFormation;
      case 'AWS_SERVICE':
        return OrganizationResourceCollectionType.awsService;
      case 'AWS_ACCOUNT':
        return OrganizationResourceCollectionType.awsAccount;
      case 'AWS_TAGS':
        return OrganizationResourceCollectionType.awsTags;
    }
    throw Exception(
        '$this is not known in enum OrganizationResourceCollectionType');
  }
}

/// A logical grouping of Performance Insights metrics for a related subject
/// area. For example, the <code>db.sql</code> dimension group consists of the
/// following dimensions: <code>db.sql.id</code>, <code>db.sql.db_id</code>,
/// <code>db.sql.statement</code>, and <code>db.sql.tokenized_id</code>.
/// <note>
/// Each response element returns a maximum of 500 bytes. For larger elements,
/// such as SQL statements, only the first 500 bytes are returned.
/// </note>
/// Amazon RDS Performance Insights enables you to monitor and explore different
/// dimensions of database load based on data captured from a running DB
/// instance. DB load is measured as average active sessions. Performance
/// Insights provides the data to API consumers as a two-dimensional time-series
/// dataset. The time dimension provides DB load data for each time point in the
/// queried time range. Each time point decomposes overall load in relation to
/// the requested dimensions, measured at that time point. Examples include SQL,
/// Wait event, User, and Host.
///
/// <ul>
/// <li>
/// To learn more about Performance Insights and Amazon Aurora DB instances, go
/// to the <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights.html">
/// Amazon Aurora User Guide</a>.
/// </li>
/// <li>
/// To learn more about Performance Insights and Amazon RDS DB instances, go to
/// the <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html">
/// Amazon RDS User Guide</a>.
/// </li>
/// </ul>
class PerformanceInsightsMetricDimensionGroup {
  /// A list of specific dimensions from a dimension group. If this parameter is
  /// not present, then it signifies that all of the dimensions in the group were
  /// requested or are present in the response.
  ///
  /// Valid values for elements in the <code>Dimensions</code> array are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.application.name</code> - The name of the application that is
  /// connected to the database (only Aurora PostgreSQL and RDS PostgreSQL)
  /// </li>
  /// <li>
  /// <code>db.host.id</code> - The host ID of the connected client (all engines)
  /// </li>
  /// <li>
  /// <code>db.host.name</code> - The host name of the connected client (all
  /// engines)
  /// </li>
  /// <li>
  /// <code>db.name</code> - The name of the database to which the client is
  /// connected (only Aurora PostgreSQL, Amazon RDS PostgreSQL, Aurora MySQL,
  /// Amazon RDS MySQL, and MariaDB)
  /// </li>
  /// <li>
  /// <code>db.session_type.name</code> - The type of the current session (only
  /// Aurora PostgreSQL and RDS PostgreSQL)
  /// </li>
  /// <li>
  /// <code>db.sql.id</code> - The SQL ID generated by Performance Insights (all
  /// engines)
  /// </li>
  /// <li>
  /// <code>db.sql.db_id</code> - The SQL ID generated by the database (all
  /// engines)
  /// </li>
  /// <li>
  /// <code>db.sql.statement</code> - The SQL text that is being executed (all
  /// engines)
  /// </li>
  /// <li>
  /// <code>db.sql.tokenized_id</code>
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized.id</code> - The SQL digest ID generated by
  /// Performance Insights (all engines)
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized.db_id</code> - SQL digest ID generated by the
  /// database (all engines)
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized.statement</code> - The SQL digest text (all engines)
  /// </li>
  /// <li>
  /// <code>db.user.id</code> - The ID of the user logged in to the database (all
  /// engines)
  /// </li>
  /// <li>
  /// <code>db.user.name</code> - The name of the user logged in to the database
  /// (all engines)
  /// </li>
  /// <li>
  /// <code>db.wait_event.name</code> - The event for which the backend is waiting
  /// (all engines)
  /// </li>
  /// <li>
  /// <code>db.wait_event.type</code> - The type of event for which the backend is
  /// waiting (all engines)
  /// </li>
  /// <li>
  /// <code>db.wait_event_type.name</code> - The name of the event type for which
  /// the backend is waiting (all engines)
  /// </li>
  /// </ul>
  final List<String>? dimensions;

  /// The name of the dimension group. Its valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>db</code> - The name of the database to which the client is connected
  /// (only Aurora PostgreSQL, Amazon RDS PostgreSQL, Aurora MySQL, Amazon RDS
  /// MySQL, and MariaDB)
  /// </li>
  /// <li>
  /// <code>db.application</code> - The name of the application that is connected
  /// to the database (only Aurora PostgreSQL and RDS PostgreSQL)
  /// </li>
  /// <li>
  /// <code>db.host</code> - The host name of the connected client (all engines)
  /// </li>
  /// <li>
  /// <code>db.session_type</code> - The type of the current session (only Aurora
  /// PostgreSQL and RDS PostgreSQL)
  /// </li>
  /// <li>
  /// <code>db.sql</code> - The SQL that is currently executing (all engines)
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized</code> - The SQL digest (all engines)
  /// </li>
  /// <li>
  /// <code>db.wait_event</code> - The event for which the database backend is
  /// waiting (all engines)
  /// </li>
  /// <li>
  /// <code>db.wait_event_type</code> - The type of event for which the database
  /// backend is waiting (all engines)
  /// </li>
  /// <li>
  /// <code>db.user</code> - The user logged in to the database (all engines)
  /// </li>
  /// </ul>
  final String? group;

  /// The maximum number of items to fetch for this dimension group.
  final int? limit;

  PerformanceInsightsMetricDimensionGroup({
    this.dimensions,
    this.group,
    this.limit,
  });

  factory PerformanceInsightsMetricDimensionGroup.fromJson(
      Map<String, dynamic> json) {
    return PerformanceInsightsMetricDimensionGroup(
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      group: json['Group'] as String?,
      limit: json['Limit'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final group = this.group;
    final limit = this.limit;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (group != null) 'Group': group,
      if (limit != null) 'Limit': limit,
    };
  }
}

/// A single query to be processed. Use these parameters to query the
/// Performance Insights <code>GetResourceMetrics</code> API to retrieve the
/// metrics for an anomaly. For more information, see <code> <a
/// href="https://docs.aws.amazon.com/performance-insights/latest/APIReference/API_GetResourceMetrics.html">GetResourceMetrics</a>
/// </code> in the <i>Amazon RDS Performance Insights API Reference</i>.
///
/// Amazon RDS Performance Insights enables you to monitor and explore different
/// dimensions of database load based on data captured from a running DB
/// instance. DB load is measured as average active sessions. Performance
/// Insights provides the data to API consumers as a two-dimensional time-series
/// dataset. The time dimension provides DB load data for each time point in the
/// queried time range. Each time point decomposes overall load in relation to
/// the requested dimensions, measured at that time point. Examples include SQL,
/// Wait event, User, and Host.
///
/// <ul>
/// <li>
/// To learn more about Performance Insights and Amazon Aurora DB instances, go
/// to the <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights.html">
/// Amazon Aurora User Guide</a>.
/// </li>
/// <li>
/// To learn more about Performance Insights and Amazon RDS DB instances, go to
/// the <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html">
/// Amazon RDS User Guide</a>.
/// </li>
/// </ul>
class PerformanceInsightsMetricQuery {
  /// One or more filters to apply to a Performance Insights
  /// <code>GetResourceMetrics</code> API query. Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Any number of filters by the same dimension, as specified in the
  /// <code>GroupBy</code> parameter.
  /// </li>
  /// <li>
  /// A single filter for any other dimension in this dimension group.
  /// </li>
  /// </ul>
  final Map<String, String>? filter;

  /// The specification for how to aggregate the data points from a Performance
  /// Insights <code>GetResourceMetrics</code> API query. The Performance Insights
  /// query returns all of the dimensions within that group, unless you provide
  /// the names of specific dimensions within that group. You can also request
  /// that Performance Insights return a limited number of values for a dimension.
  final PerformanceInsightsMetricDimensionGroup? groupBy;

  /// The name of the meteric used used when querying an Performance Insights
  /// <code>GetResourceMetrics</code> API for anomaly metrics.
  ///
  /// Valid values for <code>Metric</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.load.avg</code> - a scaled representation of the number of active
  /// sessions for the database engine.
  /// </li>
  /// <li>
  /// <code>db.sampledload.avg</code> - the raw number of active sessions for the
  /// database engine.
  /// </li>
  /// </ul>
  /// If the number of active sessions is less than an internal Performance
  /// Insights threshold, <code>db.load.avg</code> and
  /// <code>db.sampledload.avg</code> are the same value. If the number of active
  /// sessions is greater than the internal threshold, Performance Insights
  /// samples the active sessions, with <code>db.load.avg</code> showing the
  /// scaled values, <code>db.sampledload.avg</code> showing the raw values, and
  /// <code>db.sampledload.avg</code> less than <code>db.load.avg</code>. For most
  /// use cases, you can query <code>db.load.avg</code> only.
  final String? metric;

  PerformanceInsightsMetricQuery({
    this.filter,
    this.groupBy,
    this.metric,
  });

  factory PerformanceInsightsMetricQuery.fromJson(Map<String, dynamic> json) {
    return PerformanceInsightsMetricQuery(
      filter: (json['Filter'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      groupBy: json['GroupBy'] != null
          ? PerformanceInsightsMetricDimensionGroup.fromJson(
              json['GroupBy'] as Map<String, dynamic>)
          : null,
      metric: json['Metric'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    final groupBy = this.groupBy;
    final metric = this.metric;
    return {
      if (filter != null) 'Filter': filter,
      if (groupBy != null) 'GroupBy': groupBy,
      if (metric != null) 'Metric': metric,
    };
  }
}

/// Details about Performance Insights metrics.
///
/// Amazon RDS Performance Insights enables you to monitor and explore different
/// dimensions of database load based on data captured from a running DB
/// instance. DB load is measured as average active sessions. Performance
/// Insights provides the data to API consumers as a two-dimensional time-series
/// dataset. The time dimension provides DB load data for each time point in the
/// queried time range. Each time point decomposes overall load in relation to
/// the requested dimensions, measured at that time point. Examples include SQL,
/// Wait event, User, and Host.
///
/// <ul>
/// <li>
/// To learn more about Performance Insights and Amazon Aurora DB instances, go
/// to the <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights.html">
/// Amazon Aurora User Guide</a>.
/// </li>
/// <li>
/// To learn more about Performance Insights and Amazon RDS DB instances, go to
/// the <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html">
/// Amazon RDS User Guide</a>.
/// </li>
/// </ul>
class PerformanceInsightsMetricsDetail {
  /// The name used for a specific Performance Insights metric.
  final String? metricDisplayName;

  /// A single query to be processed for the metric. For more information, see
  /// <code> <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/APIReference/API_PerformanceInsightsMetricQuery.html">PerformanceInsightsMetricQuery</a>
  /// </code>.
  final PerformanceInsightsMetricQuery? metricQuery;

  /// For more information, see <code> <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/APIReference/API_PerformanceInsightsReferenceData.html">PerformanceInsightsReferenceData</a>
  /// </code>.
  final List<PerformanceInsightsReferenceData>? referenceData;

  /// The metric statistics during the anomalous period detected by DevOps Guru;
  final List<PerformanceInsightsStat>? statsAtAnomaly;

  /// Typical metric statistics that are not considered anomalous. When DevOps
  /// Guru analyzes metrics, it compares them to <code>StatsAtBaseline</code> to
  /// help determine if they are anomalous.
  final List<PerformanceInsightsStat>? statsAtBaseline;

  /// The unit of measure for a metric. For example, a session or a process.
  final String? unit;

  PerformanceInsightsMetricsDetail({
    this.metricDisplayName,
    this.metricQuery,
    this.referenceData,
    this.statsAtAnomaly,
    this.statsAtBaseline,
    this.unit,
  });

  factory PerformanceInsightsMetricsDetail.fromJson(Map<String, dynamic> json) {
    return PerformanceInsightsMetricsDetail(
      metricDisplayName: json['MetricDisplayName'] as String?,
      metricQuery: json['MetricQuery'] != null
          ? PerformanceInsightsMetricQuery.fromJson(
              json['MetricQuery'] as Map<String, dynamic>)
          : null,
      referenceData: (json['ReferenceData'] as List?)
          ?.whereNotNull()
          .map((e) => PerformanceInsightsReferenceData.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      statsAtAnomaly: (json['StatsAtAnomaly'] as List?)
          ?.whereNotNull()
          .map((e) =>
              PerformanceInsightsStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      statsAtBaseline: (json['StatsAtBaseline'] as List?)
          ?.whereNotNull()
          .map((e) =>
              PerformanceInsightsStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      unit: json['Unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricDisplayName = this.metricDisplayName;
    final metricQuery = this.metricQuery;
    final referenceData = this.referenceData;
    final statsAtAnomaly = this.statsAtAnomaly;
    final statsAtBaseline = this.statsAtBaseline;
    final unit = this.unit;
    return {
      if (metricDisplayName != null) 'MetricDisplayName': metricDisplayName,
      if (metricQuery != null) 'MetricQuery': metricQuery,
      if (referenceData != null) 'ReferenceData': referenceData,
      if (statsAtAnomaly != null) 'StatsAtAnomaly': statsAtAnomaly,
      if (statsAtBaseline != null) 'StatsAtBaseline': statsAtBaseline,
      if (unit != null) 'Unit': unit,
    };
  }
}

/// Reference scalar values and other metrics that DevOps Guru displays on a
/// graph in its console along with the actual metrics it analyzed. Compare
/// these reference values to your actual metrics to help you understand
/// anomalous behavior that DevOps Guru detected.
class PerformanceInsightsReferenceComparisonValues {
  /// A metric that DevOps Guru compares to actual metric values. This reference
  /// metric is used to determine if an actual metric should be considered
  /// anomalous.
  final PerformanceInsightsReferenceMetric? referenceMetric;

  /// A scalar value DevOps Guru for a metric that DevOps Guru compares to actual
  /// metric values. This reference value is used to determine if an actual metric
  /// value should be considered anomalous.
  final PerformanceInsightsReferenceScalar? referenceScalar;

  PerformanceInsightsReferenceComparisonValues({
    this.referenceMetric,
    this.referenceScalar,
  });

  factory PerformanceInsightsReferenceComparisonValues.fromJson(
      Map<String, dynamic> json) {
    return PerformanceInsightsReferenceComparisonValues(
      referenceMetric: json['ReferenceMetric'] != null
          ? PerformanceInsightsReferenceMetric.fromJson(
              json['ReferenceMetric'] as Map<String, dynamic>)
          : null,
      referenceScalar: json['ReferenceScalar'] != null
          ? PerformanceInsightsReferenceScalar.fromJson(
              json['ReferenceScalar'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final referenceMetric = this.referenceMetric;
    final referenceScalar = this.referenceScalar;
    return {
      if (referenceMetric != null) 'ReferenceMetric': referenceMetric,
      if (referenceScalar != null) 'ReferenceScalar': referenceScalar,
    };
  }
}

/// Reference data used to evaluate Performance Insights to determine if its
/// performance is anomalous or not.
class PerformanceInsightsReferenceData {
  /// The specific reference values used to evaluate the Performance Insights. For
  /// more information, see <code> <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/APIReference/API_PerformanceInsightsReferenceComparisonValues.html">PerformanceInsightsReferenceComparisonValues</a>
  /// </code>.
  final PerformanceInsightsReferenceComparisonValues? comparisonValues;

  /// The name of the reference data.
  final String? name;

  PerformanceInsightsReferenceData({
    this.comparisonValues,
    this.name,
  });

  factory PerformanceInsightsReferenceData.fromJson(Map<String, dynamic> json) {
    return PerformanceInsightsReferenceData(
      comparisonValues: json['ComparisonValues'] != null
          ? PerformanceInsightsReferenceComparisonValues.fromJson(
              json['ComparisonValues'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonValues = this.comparisonValues;
    final name = this.name;
    return {
      if (comparisonValues != null) 'ComparisonValues': comparisonValues,
      if (name != null) 'Name': name,
    };
  }
}

/// Information about a reference metric used to evaluate Performance Insights.
class PerformanceInsightsReferenceMetric {
  /// A query to be processed on the metric.
  final PerformanceInsightsMetricQuery? metricQuery;

  PerformanceInsightsReferenceMetric({
    this.metricQuery,
  });

  factory PerformanceInsightsReferenceMetric.fromJson(
      Map<String, dynamic> json) {
    return PerformanceInsightsReferenceMetric(
      metricQuery: json['MetricQuery'] != null
          ? PerformanceInsightsMetricQuery.fromJson(
              json['MetricQuery'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metricQuery = this.metricQuery;
    return {
      if (metricQuery != null) 'MetricQuery': metricQuery,
    };
  }
}

/// A reference value to compare Performance Insights metrics against to
/// determine if the metrics demonstrate anomalous behavior.
class PerformanceInsightsReferenceScalar {
  /// The reference value.
  final double? value;

  PerformanceInsightsReferenceScalar({
    this.value,
  });

  factory PerformanceInsightsReferenceScalar.fromJson(
      Map<String, dynamic> json) {
    return PerformanceInsightsReferenceScalar(
      value: json['Value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      if (value != null) 'Value': value,
    };
  }
}

/// A statistic in a Performance Insights collection.
class PerformanceInsightsStat {
  /// The statistic type.
  final String? type;

  /// The value of the statistic.
  final double? value;

  PerformanceInsightsStat({
    this.type,
    this.value,
  });

  factory PerformanceInsightsStat.fromJson(Map<String, dynamic> json) {
    return PerformanceInsightsStat(
      type: json['Type'] as String?,
      value: json['Value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      if (type != null) 'Type': type,
      if (value != null) 'Value': value,
    };
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
  /// An <code>AnomalyReportedTimeRange</code> object that specifies the time
  /// range between when the anomaly is opened and the time when it is closed.
  final AnomalyReportedTimeRange? anomalyReportedTimeRange;

  /// Information about a resource in which DevOps Guru detected anomalous
  /// behavior.
  final List<AnomalyResource>? anomalyResources;
  final AnomalyTimeRange? anomalyTimeRange;

  /// The ID of the insight that contains this anomaly. An insight is composed of
  /// related anomalies.
  final String? associatedInsightId;

  /// A description of the proactive anomaly.
  final String? description;

  /// The ID of a proactive anomaly.
  final String? id;

  /// A threshold that was exceeded by behavior in analyzed resources. Exceeding
  /// this threshold is related to the anomalous behavior that generated this
  /// anomaly.
  final double? limit;
  final PredictionTimeRange? predictionTimeRange;
  final ResourceCollection? resourceCollection;

  /// The severity of the anomaly. The severity of anomalies that generate an
  /// insight determine that insight's severity. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/working-with-insights.html#understanding-insights-severities">Understanding
  /// insight severities</a> in the <i>Amazon DevOps Guru User Guide</i>.
  final AnomalySeverity? severity;

  /// Details about the source of the analyzed operational data that triggered the
  /// anomaly. The one supported source is Amazon CloudWatch metrics.
  final AnomalySourceDetails? sourceDetails;

  /// The metadata for the anomaly.
  final AnomalySourceMetadata? sourceMetadata;

  /// The status of a proactive anomaly.
  final AnomalyStatus? status;

  /// The time of the anomaly's most recent update.
  final DateTime? updateTime;

  ProactiveAnomaly({
    this.anomalyReportedTimeRange,
    this.anomalyResources,
    this.anomalyTimeRange,
    this.associatedInsightId,
    this.description,
    this.id,
    this.limit,
    this.predictionTimeRange,
    this.resourceCollection,
    this.severity,
    this.sourceDetails,
    this.sourceMetadata,
    this.status,
    this.updateTime,
  });

  factory ProactiveAnomaly.fromJson(Map<String, dynamic> json) {
    return ProactiveAnomaly(
      anomalyReportedTimeRange: json['AnomalyReportedTimeRange'] != null
          ? AnomalyReportedTimeRange.fromJson(
              json['AnomalyReportedTimeRange'] as Map<String, dynamic>)
          : null,
      anomalyResources: (json['AnomalyResources'] as List?)
          ?.whereNotNull()
          .map((e) => AnomalyResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      anomalyTimeRange: json['AnomalyTimeRange'] != null
          ? AnomalyTimeRange.fromJson(
              json['AnomalyTimeRange'] as Map<String, dynamic>)
          : null,
      associatedInsightId: json['AssociatedInsightId'] as String?,
      description: json['Description'] as String?,
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
      sourceMetadata: json['SourceMetadata'] != null
          ? AnomalySourceMetadata.fromJson(
              json['SourceMetadata'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toAnomalyStatus(),
      updateTime: timeStampFromJson(json['UpdateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyReportedTimeRange = this.anomalyReportedTimeRange;
    final anomalyResources = this.anomalyResources;
    final anomalyTimeRange = this.anomalyTimeRange;
    final associatedInsightId = this.associatedInsightId;
    final description = this.description;
    final id = this.id;
    final limit = this.limit;
    final predictionTimeRange = this.predictionTimeRange;
    final resourceCollection = this.resourceCollection;
    final severity = this.severity;
    final sourceDetails = this.sourceDetails;
    final sourceMetadata = this.sourceMetadata;
    final status = this.status;
    final updateTime = this.updateTime;
    return {
      if (anomalyReportedTimeRange != null)
        'AnomalyReportedTimeRange': anomalyReportedTimeRange,
      if (anomalyResources != null) 'AnomalyResources': anomalyResources,
      if (anomalyTimeRange != null) 'AnomalyTimeRange': anomalyTimeRange,
      if (associatedInsightId != null)
        'AssociatedInsightId': associatedInsightId,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (limit != null) 'Limit': limit,
      if (predictionTimeRange != null)
        'PredictionTimeRange': predictionTimeRange,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (severity != null) 'Severity': severity.toValue(),
      if (sourceDetails != null) 'SourceDetails': sourceDetails,
      if (sourceMetadata != null) 'SourceMetadata': sourceMetadata,
      if (status != null) 'Status': status.toValue(),
      if (updateTime != null) 'UpdateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// Details about a proactive anomaly. This object is returned by
/// <code>DescribeAnomaly.</code>
class ProactiveAnomalySummary {
  /// An <code>AnomalyReportedTimeRange</code> object that specifies the time
  /// range between when the anomaly is opened and the time when it is closed.
  final AnomalyReportedTimeRange? anomalyReportedTimeRange;

  /// Information about a resource in which DevOps Guru detected anomalous
  /// behavior.
  final List<AnomalyResource>? anomalyResources;
  final AnomalyTimeRange? anomalyTimeRange;

  /// The ID of the insight that contains this anomaly. An insight is composed of
  /// related anomalies.
  final String? associatedInsightId;

  /// A description of the proactive anomaly.
  final String? description;

  /// The ID of the anomaly.
  final String? id;

  /// A threshold that was exceeded by behavior in analyzed resources. Exceeding
  /// this threshold is related to the anomalous behavior that generated this
  /// anomaly.
  final double? limit;
  final PredictionTimeRange? predictionTimeRange;
  final ResourceCollection? resourceCollection;

  /// The severity of the anomaly. The severity of anomalies that generate an
  /// insight determine that insight's severity. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/working-with-insights.html#understanding-insights-severities">Understanding
  /// insight severities</a> in the <i>Amazon DevOps Guru User Guide</i>.
  final AnomalySeverity? severity;

  /// Details about the source of the analyzed operational data that triggered the
  /// anomaly. The one supported source is Amazon CloudWatch metrics.
  final AnomalySourceDetails? sourceDetails;

  /// The metadata of the source which detects proactive anomalies.
  final AnomalySourceMetadata? sourceMetadata;

  /// The status of the anomaly.
  final AnomalyStatus? status;

  /// The time of the anomaly's most recent update.
  final DateTime? updateTime;

  ProactiveAnomalySummary({
    this.anomalyReportedTimeRange,
    this.anomalyResources,
    this.anomalyTimeRange,
    this.associatedInsightId,
    this.description,
    this.id,
    this.limit,
    this.predictionTimeRange,
    this.resourceCollection,
    this.severity,
    this.sourceDetails,
    this.sourceMetadata,
    this.status,
    this.updateTime,
  });

  factory ProactiveAnomalySummary.fromJson(Map<String, dynamic> json) {
    return ProactiveAnomalySummary(
      anomalyReportedTimeRange: json['AnomalyReportedTimeRange'] != null
          ? AnomalyReportedTimeRange.fromJson(
              json['AnomalyReportedTimeRange'] as Map<String, dynamic>)
          : null,
      anomalyResources: (json['AnomalyResources'] as List?)
          ?.whereNotNull()
          .map((e) => AnomalyResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      anomalyTimeRange: json['AnomalyTimeRange'] != null
          ? AnomalyTimeRange.fromJson(
              json['AnomalyTimeRange'] as Map<String, dynamic>)
          : null,
      associatedInsightId: json['AssociatedInsightId'] as String?,
      description: json['Description'] as String?,
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
      sourceMetadata: json['SourceMetadata'] != null
          ? AnomalySourceMetadata.fromJson(
              json['SourceMetadata'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toAnomalyStatus(),
      updateTime: timeStampFromJson(json['UpdateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyReportedTimeRange = this.anomalyReportedTimeRange;
    final anomalyResources = this.anomalyResources;
    final anomalyTimeRange = this.anomalyTimeRange;
    final associatedInsightId = this.associatedInsightId;
    final description = this.description;
    final id = this.id;
    final limit = this.limit;
    final predictionTimeRange = this.predictionTimeRange;
    final resourceCollection = this.resourceCollection;
    final severity = this.severity;
    final sourceDetails = this.sourceDetails;
    final sourceMetadata = this.sourceMetadata;
    final status = this.status;
    final updateTime = this.updateTime;
    return {
      if (anomalyReportedTimeRange != null)
        'AnomalyReportedTimeRange': anomalyReportedTimeRange,
      if (anomalyResources != null) 'AnomalyResources': anomalyResources,
      if (anomalyTimeRange != null) 'AnomalyTimeRange': anomalyTimeRange,
      if (associatedInsightId != null)
        'AssociatedInsightId': associatedInsightId,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (limit != null) 'Limit': limit,
      if (predictionTimeRange != null)
        'PredictionTimeRange': predictionTimeRange,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (severity != null) 'Severity': severity.toValue(),
      if (sourceDetails != null) 'SourceDetails': sourceDetails,
      if (sourceMetadata != null) 'SourceMetadata': sourceMetadata,
      if (status != null) 'Status': status.toValue(),
      if (updateTime != null) 'UpdateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// Details about a proactive insight. This object is returned by
/// <code>ListInsights</code>.
class ProactiveInsight {
  /// Describes the proactive insight.
  final String? description;

  /// The ID of the proactive insight.
  final String? id;
  final InsightTimeRange? insightTimeRange;

  /// The name of the proactive insight.
  final String? name;
  final PredictionTimeRange? predictionTimeRange;
  final ResourceCollection? resourceCollection;

  /// The severity of the insight. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/working-with-insights.html#understanding-insights-severities">Understanding
  /// insight severities</a> in the <i>Amazon DevOps Guru User Guide</i>.
  final InsightSeverity? severity;

  /// The ID of the Amazon Web Services System Manager OpsItem created for this
  /// insight. You must enable the creation of OpstItems insights before they are
  /// created for each insight.
  final String? ssmOpsItemId;

  /// The status of the proactive insight.
  final InsightStatus? status;

  ProactiveInsight({
    this.description,
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
      description: json['Description'] as String?,
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
    final description = this.description;
    final id = this.id;
    final insightTimeRange = this.insightTimeRange;
    final name = this.name;
    final predictionTimeRange = this.predictionTimeRange;
    final resourceCollection = this.resourceCollection;
    final severity = this.severity;
    final ssmOpsItemId = this.ssmOpsItemId;
    final status = this.status;
    return {
      if (description != null) 'Description': description,
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
  /// The Amazon Resource Names (ARNs) of the Amazon Web Services resources that
  /// generated this insight.
  final List<String>? associatedResourceArns;

  /// The ID of the proactive insight.
  final String? id;
  final InsightTimeRange? insightTimeRange;

  /// The name of the proactive insight.
  final String? name;
  final PredictionTimeRange? predictionTimeRange;
  final ResourceCollection? resourceCollection;

  /// A collection of the names of Amazon Web Services services.
  final ServiceCollection? serviceCollection;

  /// The severity of the insight. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/working-with-insights.html#understanding-insights-severities">Understanding
  /// insight severities</a> in the <i>Amazon DevOps Guru User Guide</i>.
  final InsightSeverity? severity;

  /// The status of the proactive insight.
  final InsightStatus? status;

  ProactiveInsightSummary({
    this.associatedResourceArns,
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
      associatedResourceArns: (json['AssociatedResourceArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
    final associatedResourceArns = this.associatedResourceArns;
    final id = this.id;
    final insightTimeRange = this.insightTimeRange;
    final name = this.name;
    final predictionTimeRange = this.predictionTimeRange;
    final resourceCollection = this.resourceCollection;
    final serviceCollection = this.serviceCollection;
    final severity = this.severity;
    final status = this.status;
    return {
      if (associatedResourceArns != null)
        'AssociatedResourceArns': associatedResourceArns,
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

/// Details about a proactive insight. This object is returned by
/// <code>DescribeInsight</code>.
class ProactiveOrganizationInsightSummary {
  /// The ID of the Amazon Web Services account.
  final String? accountId;

  /// The ID of the insight summary.
  final String? id;
  final InsightTimeRange? insightTimeRange;

  /// The name of the insight summary.
  final String? name;

  /// The ID of the organizational unit.
  final String? organizationalUnitId;
  final PredictionTimeRange? predictionTimeRange;
  final ResourceCollection? resourceCollection;
  final ServiceCollection? serviceCollection;

  /// An array of severity values used to search for insights. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/working-with-insights.html#understanding-insights-severities">Understanding
  /// insight severities</a> in the <i>Amazon DevOps Guru User Guide</i>.
  final InsightSeverity? severity;

  /// An array of status values used to search for insights.
  final InsightStatus? status;

  ProactiveOrganizationInsightSummary({
    this.accountId,
    this.id,
    this.insightTimeRange,
    this.name,
    this.organizationalUnitId,
    this.predictionTimeRange,
    this.resourceCollection,
    this.serviceCollection,
    this.severity,
    this.status,
  });

  factory ProactiveOrganizationInsightSummary.fromJson(
      Map<String, dynamic> json) {
    return ProactiveOrganizationInsightSummary(
      accountId: json['AccountId'] as String?,
      id: json['Id'] as String?,
      insightTimeRange: json['InsightTimeRange'] != null
          ? InsightTimeRange.fromJson(
              json['InsightTimeRange'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      organizationalUnitId: json['OrganizationalUnitId'] as String?,
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
    final accountId = this.accountId;
    final id = this.id;
    final insightTimeRange = this.insightTimeRange;
    final name = this.name;
    final organizationalUnitId = this.organizationalUnitId;
    final predictionTimeRange = this.predictionTimeRange;
    final resourceCollection = this.resourceCollection;
    final serviceCollection = this.serviceCollection;
    final severity = this.severity;
    final status = this.status;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (id != null) 'Id': id,
      if (insightTimeRange != null) 'InsightTimeRange': insightTimeRange,
      if (name != null) 'Name': name,
      if (organizationalUnitId != null)
        'OrganizationalUnitId': organizationalUnitId,
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
  /// An <code>AnomalyReportedTimeRange</code> object that specifies the time
  /// range between when the anomaly is opened and the time when it is closed.
  final AnomalyReportedTimeRange? anomalyReportedTimeRange;

  /// The Amazon Web Services resources in which anomalous behavior was detected
  /// by DevOps Guru.
  final List<AnomalyResource>? anomalyResources;
  final AnomalyTimeRange? anomalyTimeRange;

  /// The ID of the insight that contains this anomaly. An insight is composed of
  /// related anomalies.
  final String? associatedInsightId;

  /// The ID of the causal anomaly that is associated with this reactive anomaly.
  /// The ID of a `CAUSAL` anomaly is always `NULL`.
  final String? causalAnomalyId;

  /// A description of the reactive anomaly.
  final String? description;

  /// The ID of the reactive anomaly.
  final String? id;

  /// The name of the reactive anomaly.
  final String? name;
  final ResourceCollection? resourceCollection;

  /// The severity of the anomaly. The severity of anomalies that generate an
  /// insight determine that insight's severity. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/working-with-insights.html#understanding-insights-severities">Understanding
  /// insight severities</a> in the <i>Amazon DevOps Guru User Guide</i>.
  final AnomalySeverity? severity;

  /// Details about the source of the analyzed operational data that triggered the
  /// anomaly. The one supported source is Amazon CloudWatch metrics.
  final AnomalySourceDetails? sourceDetails;

  /// The status of the anomaly.
  final AnomalyStatus? status;

  /// The type of the reactive anomaly. It can be one of the following types.
  ///
  /// <ul>
  /// <li>
  /// <code>CAUSAL</code> - the anomaly can cause a new insight.
  /// </li>
  /// <li>
  /// <code>CONTEXTUAL</code> - the anomaly contains additional information about
  /// an insight or its causal anomaly.
  /// </li>
  /// </ul>
  final AnomalyType? type;

  ReactiveAnomaly({
    this.anomalyReportedTimeRange,
    this.anomalyResources,
    this.anomalyTimeRange,
    this.associatedInsightId,
    this.causalAnomalyId,
    this.description,
    this.id,
    this.name,
    this.resourceCollection,
    this.severity,
    this.sourceDetails,
    this.status,
    this.type,
  });

  factory ReactiveAnomaly.fromJson(Map<String, dynamic> json) {
    return ReactiveAnomaly(
      anomalyReportedTimeRange: json['AnomalyReportedTimeRange'] != null
          ? AnomalyReportedTimeRange.fromJson(
              json['AnomalyReportedTimeRange'] as Map<String, dynamic>)
          : null,
      anomalyResources: (json['AnomalyResources'] as List?)
          ?.whereNotNull()
          .map((e) => AnomalyResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      anomalyTimeRange: json['AnomalyTimeRange'] != null
          ? AnomalyTimeRange.fromJson(
              json['AnomalyTimeRange'] as Map<String, dynamic>)
          : null,
      associatedInsightId: json['AssociatedInsightId'] as String?,
      causalAnomalyId: json['CausalAnomalyId'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
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
      type: (json['Type'] as String?)?.toAnomalyType(),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyReportedTimeRange = this.anomalyReportedTimeRange;
    final anomalyResources = this.anomalyResources;
    final anomalyTimeRange = this.anomalyTimeRange;
    final associatedInsightId = this.associatedInsightId;
    final causalAnomalyId = this.causalAnomalyId;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final resourceCollection = this.resourceCollection;
    final severity = this.severity;
    final sourceDetails = this.sourceDetails;
    final status = this.status;
    final type = this.type;
    return {
      if (anomalyReportedTimeRange != null)
        'AnomalyReportedTimeRange': anomalyReportedTimeRange,
      if (anomalyResources != null) 'AnomalyResources': anomalyResources,
      if (anomalyTimeRange != null) 'AnomalyTimeRange': anomalyTimeRange,
      if (associatedInsightId != null)
        'AssociatedInsightId': associatedInsightId,
      if (causalAnomalyId != null) 'CausalAnomalyId': causalAnomalyId,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (severity != null) 'Severity': severity.toValue(),
      if (sourceDetails != null) 'SourceDetails': sourceDetails,
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Details about a reactive anomaly. This object is returned by
/// <code>DescribeAnomaly.</code>
class ReactiveAnomalySummary {
  /// An <code>AnomalyReportedTimeRange</code> object that specifies the time
  /// range between when the anomaly is opened and the time when it is closed.
  final AnomalyReportedTimeRange? anomalyReportedTimeRange;

  /// The Amazon Web Services resources in which anomalous behavior was detected
  /// by DevOps Guru.
  final List<AnomalyResource>? anomalyResources;
  final AnomalyTimeRange? anomalyTimeRange;

  /// The ID of the insight that contains this anomaly. An insight is composed of
  /// related anomalies.
  final String? associatedInsightId;

  /// The ID of the causal anomaly that is associated with this reactive anomaly.
  /// The ID of a `CAUSAL` anomaly is always `NULL`.
  final String? causalAnomalyId;

  /// A description of the reactive anomaly.
  final String? description;

  /// The ID of the reactive anomaly.
  final String? id;

  /// The name of the reactive anomaly.
  final String? name;
  final ResourceCollection? resourceCollection;

  /// The severity of the anomaly. The severity of anomalies that generate an
  /// insight determine that insight's severity. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/working-with-insights.html#understanding-insights-severities">Understanding
  /// insight severities</a> in the <i>Amazon DevOps Guru User Guide</i>.
  final AnomalySeverity? severity;

  /// Details about the source of the analyzed operational data that triggered the
  /// anomaly. The one supported source is Amazon CloudWatch metrics.
  final AnomalySourceDetails? sourceDetails;

  /// The status of the reactive anomaly.
  final AnomalyStatus? status;

  /// The type of the reactive anomaly. It can be one of the following types.
  ///
  /// <ul>
  /// <li>
  /// <code>CAUSAL</code> - the anomaly can cause a new insight.
  /// </li>
  /// <li>
  /// <code>CONTEXTUAL</code> - the anomaly contains additional information about
  /// an insight or its causal anomaly.
  /// </li>
  /// </ul>
  final AnomalyType? type;

  ReactiveAnomalySummary({
    this.anomalyReportedTimeRange,
    this.anomalyResources,
    this.anomalyTimeRange,
    this.associatedInsightId,
    this.causalAnomalyId,
    this.description,
    this.id,
    this.name,
    this.resourceCollection,
    this.severity,
    this.sourceDetails,
    this.status,
    this.type,
  });

  factory ReactiveAnomalySummary.fromJson(Map<String, dynamic> json) {
    return ReactiveAnomalySummary(
      anomalyReportedTimeRange: json['AnomalyReportedTimeRange'] != null
          ? AnomalyReportedTimeRange.fromJson(
              json['AnomalyReportedTimeRange'] as Map<String, dynamic>)
          : null,
      anomalyResources: (json['AnomalyResources'] as List?)
          ?.whereNotNull()
          .map((e) => AnomalyResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      anomalyTimeRange: json['AnomalyTimeRange'] != null
          ? AnomalyTimeRange.fromJson(
              json['AnomalyTimeRange'] as Map<String, dynamic>)
          : null,
      associatedInsightId: json['AssociatedInsightId'] as String?,
      causalAnomalyId: json['CausalAnomalyId'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
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
      type: (json['Type'] as String?)?.toAnomalyType(),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyReportedTimeRange = this.anomalyReportedTimeRange;
    final anomalyResources = this.anomalyResources;
    final anomalyTimeRange = this.anomalyTimeRange;
    final associatedInsightId = this.associatedInsightId;
    final causalAnomalyId = this.causalAnomalyId;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final resourceCollection = this.resourceCollection;
    final severity = this.severity;
    final sourceDetails = this.sourceDetails;
    final status = this.status;
    final type = this.type;
    return {
      if (anomalyReportedTimeRange != null)
        'AnomalyReportedTimeRange': anomalyReportedTimeRange,
      if (anomalyResources != null) 'AnomalyResources': anomalyResources,
      if (anomalyTimeRange != null) 'AnomalyTimeRange': anomalyTimeRange,
      if (associatedInsightId != null)
        'AssociatedInsightId': associatedInsightId,
      if (causalAnomalyId != null) 'CausalAnomalyId': causalAnomalyId,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (resourceCollection != null) 'ResourceCollection': resourceCollection,
      if (severity != null) 'Severity': severity.toValue(),
      if (sourceDetails != null) 'SourceDetails': sourceDetails,
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Information about a reactive insight. This object is returned by
/// <code>ListInsights</code>.
class ReactiveInsight {
  /// Describes the reactive insight.
  final String? description;

  /// The ID of a reactive insight.
  final String? id;
  final InsightTimeRange? insightTimeRange;

  /// The name of a reactive insight.
  final String? name;
  final ResourceCollection? resourceCollection;

  /// The severity of the insight. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/working-with-insights.html#understanding-insights-severities">Understanding
  /// insight severities</a> in the <i>Amazon DevOps Guru User Guide</i>.
  final InsightSeverity? severity;

  /// The ID of the Amazon Web Services System Manager OpsItem created for this
  /// insight. You must enable the creation of OpstItems insights before they are
  /// created for each insight.
  final String? ssmOpsItemId;

  /// The status of a reactive insight.
  final InsightStatus? status;

  ReactiveInsight({
    this.description,
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
      description: json['Description'] as String?,
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
    final description = this.description;
    final id = this.id;
    final insightTimeRange = this.insightTimeRange;
    final name = this.name;
    final resourceCollection = this.resourceCollection;
    final severity = this.severity;
    final ssmOpsItemId = this.ssmOpsItemId;
    final status = this.status;
    return {
      if (description != null) 'Description': description,
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
  /// The Amazon Resource Names (ARNs) of the Amazon Web Services resources that
  /// generated this insight.
  final List<String>? associatedResourceArns;

  /// The ID of a reactive summary.
  final String? id;
  final InsightTimeRange? insightTimeRange;

  /// The name of a reactive insight.
  final String? name;
  final ResourceCollection? resourceCollection;

  /// A collection of the names of Amazon Web Services services.
  final ServiceCollection? serviceCollection;

  /// The severity of the insight. For more information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/working-with-insights.html#understanding-insights-severities">Understanding
  /// insight severities</a> in the <i>Amazon DevOps Guru User Guide</i>.
  final InsightSeverity? severity;

  /// The status of a reactive insight.
  final InsightStatus? status;

  ReactiveInsightSummary({
    this.associatedResourceArns,
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
      associatedResourceArns: (json['AssociatedResourceArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
    final associatedResourceArns = this.associatedResourceArns;
    final id = this.id;
    final insightTimeRange = this.insightTimeRange;
    final name = this.name;
    final resourceCollection = this.resourceCollection;
    final serviceCollection = this.serviceCollection;
    final severity = this.severity;
    final status = this.status;
    return {
      if (associatedResourceArns != null)
        'AssociatedResourceArns': associatedResourceArns,
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

/// Information about a reactive insight. This object is returned by
/// <code>DescribeInsight</code>.
class ReactiveOrganizationInsightSummary {
  /// The ID of the Amazon Web Services account.
  final String? accountId;

  /// The ID of the insight summary.
  final String? id;
  final InsightTimeRange? insightTimeRange;

  /// The name of the insight summary.
  final String? name;

  /// The ID of the organizational unit.
  final String? organizationalUnitId;
  final ResourceCollection? resourceCollection;
  final ServiceCollection? serviceCollection;

  /// An array of severity values used to search for insights. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/working-with-insights.html#understanding-insights-severities">Understanding
  /// insight severities</a> in the <i>Amazon DevOps Guru User Guide</i>.
  final InsightSeverity? severity;

  /// An array of status values used to search for insights.
  final InsightStatus? status;

  ReactiveOrganizationInsightSummary({
    this.accountId,
    this.id,
    this.insightTimeRange,
    this.name,
    this.organizationalUnitId,
    this.resourceCollection,
    this.serviceCollection,
    this.severity,
    this.status,
  });

  factory ReactiveOrganizationInsightSummary.fromJson(
      Map<String, dynamic> json) {
    return ReactiveOrganizationInsightSummary(
      accountId: json['AccountId'] as String?,
      id: json['Id'] as String?,
      insightTimeRange: json['InsightTimeRange'] != null
          ? InsightTimeRange.fromJson(
              json['InsightTimeRange'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      organizationalUnitId: json['OrganizationalUnitId'] as String?,
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
    final accountId = this.accountId;
    final id = this.id;
    final insightTimeRange = this.insightTimeRange;
    final name = this.name;
    final organizationalUnitId = this.organizationalUnitId;
    final resourceCollection = this.resourceCollection;
    final serviceCollection = this.serviceCollection;
    final severity = this.severity;
    final status = this.status;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (id != null) 'Id': id,
      if (insightTimeRange != null) 'InsightTimeRange': insightTimeRange,
      if (name != null) 'Name': name,
      if (organizationalUnitId != null)
        'OrganizationalUnitId': organizationalUnitId,
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
  /// The category type of the recommendation.
  final String? category;

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
    this.category,
    this.description,
    this.link,
    this.name,
    this.reason,
    this.relatedAnomalies,
    this.relatedEvents,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      category: json['Category'] as String?,
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
    final category = this.category;
    final description = this.description;
    final link = this.link;
    final name = this.name;
    final reason = this.reason;
    final relatedAnomalies = this.relatedAnomalies;
    final relatedEvents = this.relatedEvents;
    return {
      if (category != null) 'Category': category,
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
  /// The ID of an anomaly that generated the insight with this recommendation.
  final String? anomalyId;

  /// An array of objects that represent resources in which DevOps Guru detected
  /// anomalous behavior. Each object contains the name and type of the resource.
  final List<RecommendationRelatedAnomalyResource>? resources;

  /// Information about where the anomalous behavior related the recommendation
  /// was found. For example, details in Amazon CloudWatch metrics.
  final List<RecommendationRelatedAnomalySourceDetail>? sourceDetails;

  RecommendationRelatedAnomaly({
    this.anomalyId,
    this.resources,
    this.sourceDetails,
  });

  factory RecommendationRelatedAnomaly.fromJson(Map<String, dynamic> json) {
    return RecommendationRelatedAnomaly(
      anomalyId: json['AnomalyId'] as String?,
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
    final anomalyId = this.anomalyId;
    final resources = this.resources;
    final sourceDetails = this.sourceDetails;
    return {
      if (anomalyId != null) 'AnomalyId': anomalyId,
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

  /// The type of the resource. Resource types take the same form that is used by
  /// Amazon Web Services CloudFormation resource type identifiers,
  /// <code>service-provider::service-name::data-type-name</code>. For example,
  /// <code>AWS::RDS::DBCluster</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Amazon
  /// Web Services resource and property types reference</a> in the <i>Amazon Web
  /// Services CloudFormation User Guide</i>.
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
  /// of Amazon Web Services CloudFormation stacks. You can specify up to 500
  /// Amazon Web Services CloudFormation stacks.
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

/// Information about an Amazon Web Services resource that emitted and event
/// that is related to a recommendation in an insight.
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

/// A collection of Amazon Web Services resources supported by DevOps Guru. The
/// two types of Amazon Web Services resource collections supported are Amazon
/// Web Services CloudFormation stacks and Amazon Web Services resources that
/// contain the same Amazon Web Services tag. DevOps Guru can be configured to
/// analyze the Amazon Web Services resources that are defined in the stacks or
/// that are tagged using the same tag <i>key</i>. You can specify up to 500
/// Amazon Web Services CloudFormation stacks.
class ResourceCollection {
  /// An array of the names of Amazon Web Services CloudFormation stacks. The
  /// stacks define Amazon Web Services resources that DevOps Guru analyzes. You
  /// can specify up to 500 Amazon Web Services CloudFormation stacks.
  final CloudFormationCollection? cloudFormation;

  /// The Amazon Web Services tags that are used by resources in the resource
  /// collection.
  ///
  /// Tags help you identify and organize your Amazon Web Services resources. Many
  /// Amazon Web Services services support tagging, so you can assign the same tag
  /// to resources from different services to indicate that the resources are
  /// related. For example, you can assign the same tag to an Amazon DynamoDB
  /// table resource that you assign to an Lambda function. For more information
  /// about using tags, see the <a
  /// href="https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html">Tagging
  /// best practices</a> whitepaper.
  ///
  /// Each Amazon Web Services tag has two parts.
  ///
  /// <ul>
  /// <li>
  /// A tag <i>key</i> (for example, <code>CostCenter</code>,
  /// <code>Environment</code>, <code>Project</code>, or <code>Secret</code>). Tag
  /// <i>keys</i> are case-sensitive.
  /// </li>
  /// <li>
  /// An optional field known as a tag <i>value</i> (for example,
  /// <code>111122223333</code>, <code>Production</code>, or a team name).
  /// Omitting the tag <i>value</i> is the same as using an empty string. Like tag
  /// <i>keys</i>, tag <i>values</i> are case-sensitive.
  /// </li>
  /// </ul>
  /// Together these are known as <i>key</i>-<i>value</i> pairs.
  /// <important>
  /// The string used for a <i>key</i> in a tag that you use to define your
  /// resource coverage must begin with the prefix <code>Devops-guru-</code>. The
  /// tag <i>key</i> might be <code>DevOps-Guru-deployment-application</code> or
  /// <code>devops-guru-rds-application</code>. When you create a <i>key</i>, the
  /// case of characters in the <i>key</i> can be whatever you choose. After you
  /// create a <i>key</i>, it is case-sensitive. For example, DevOps Guru works
  /// with a <i>key</i> named <code>devops-guru-rds</code> and a <i>key</i> named
  /// <code>DevOps-Guru-RDS</code>, and these act as two different <i>keys</i>.
  /// Possible <i>key</i>/<i>value</i> pairs in your application might be
  /// <code>Devops-Guru-production-application/RDS</code> or
  /// <code>Devops-Guru-production-application/containers</code>.
  /// </important>
  final List<TagCollection>? tags;

  ResourceCollection({
    this.cloudFormation,
    this.tags,
  });

  factory ResourceCollection.fromJson(Map<String, dynamic> json) {
    return ResourceCollection(
      cloudFormation: json['CloudFormation'] != null
          ? CloudFormationCollection.fromJson(
              json['CloudFormation'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => TagCollection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormation = this.cloudFormation;
    final tags = this.tags;
    return {
      if (cloudFormation != null) 'CloudFormation': cloudFormation,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Information about a filter used to specify which Amazon Web Services
/// resources are analyzed for anomalous behavior by DevOps Guru.
class ResourceCollectionFilter {
  /// Information about Amazon Web Services CloudFormation stacks. You can use up
  /// to 500 stacks to specify which Amazon Web Services resources in your account
  /// to analyze. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html">Stacks</a>
  /// in the <i>Amazon Web Services CloudFormation User Guide</i>.
  final CloudFormationCollectionFilter? cloudFormation;

  /// The Amazon Web Services tags used to filter the resources in the resource
  /// collection.
  ///
  /// Tags help you identify and organize your Amazon Web Services resources. Many
  /// Amazon Web Services services support tagging, so you can assign the same tag
  /// to resources from different services to indicate that the resources are
  /// related. For example, you can assign the same tag to an Amazon DynamoDB
  /// table resource that you assign to an Lambda function. For more information
  /// about using tags, see the <a
  /// href="https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html">Tagging
  /// best practices</a> whitepaper.
  ///
  /// Each Amazon Web Services tag has two parts.
  ///
  /// <ul>
  /// <li>
  /// A tag <i>key</i> (for example, <code>CostCenter</code>,
  /// <code>Environment</code>, <code>Project</code>, or <code>Secret</code>). Tag
  /// <i>keys</i> are case-sensitive.
  /// </li>
  /// <li>
  /// An optional field known as a tag <i>value</i> (for example,
  /// <code>111122223333</code>, <code>Production</code>, or a team name).
  /// Omitting the tag <i>value</i> is the same as using an empty string. Like tag
  /// <i>keys</i>, tag <i>values</i> are case-sensitive.
  /// </li>
  /// </ul>
  /// Together these are known as <i>key</i>-<i>value</i> pairs.
  /// <important>
  /// The string used for a <i>key</i> in a tag that you use to define your
  /// resource coverage must begin with the prefix <code>Devops-guru-</code>. The
  /// tag <i>key</i> might be <code>DevOps-Guru-deployment-application</code> or
  /// <code>devops-guru-rds-application</code>. When you create a <i>key</i>, the
  /// case of characters in the <i>key</i> can be whatever you choose. After you
  /// create a <i>key</i>, it is case-sensitive. For example, DevOps Guru works
  /// with a <i>key</i> named <code>devops-guru-rds</code> and a <i>key</i> named
  /// <code>DevOps-Guru-RDS</code>, and these act as two different <i>keys</i>.
  /// Possible <i>key</i>/<i>value</i> pairs in your application might be
  /// <code>Devops-Guru-production-application/RDS</code> or
  /// <code>Devops-Guru-production-application/containers</code>.
  /// </important>
  final List<TagCollectionFilter>? tags;

  ResourceCollectionFilter({
    this.cloudFormation,
    this.tags,
  });

  factory ResourceCollectionFilter.fromJson(Map<String, dynamic> json) {
    return ResourceCollectionFilter(
      cloudFormation: json['CloudFormation'] != null
          ? CloudFormationCollectionFilter.fromJson(
              json['CloudFormation'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => TagCollectionFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormation = this.cloudFormation;
    final tags = this.tags;
    return {
      if (cloudFormation != null) 'CloudFormation': cloudFormation,
      if (tags != null) 'Tags': tags,
    };
  }
}

enum ResourceCollectionType {
  awsCloudFormation,
  awsService,
  awsTags,
}

extension ResourceCollectionTypeValueExtension on ResourceCollectionType {
  String toValue() {
    switch (this) {
      case ResourceCollectionType.awsCloudFormation:
        return 'AWS_CLOUD_FORMATION';
      case ResourceCollectionType.awsService:
        return 'AWS_SERVICE';
      case ResourceCollectionType.awsTags:
        return 'AWS_TAGS';
    }
  }
}

extension ResourceCollectionTypeFromString on String {
  ResourceCollectionType toResourceCollectionType() {
    switch (this) {
      case 'AWS_CLOUD_FORMATION':
        return ResourceCollectionType.awsCloudFormation;
      case 'AWS_SERVICE':
        return ResourceCollectionType.awsService;
      case 'AWS_TAGS':
        return ResourceCollectionType.awsTags;
    }
    throw Exception('$this is not known in enum ResourceCollectionType');
  }
}

enum ResourcePermission {
  fullPermission,
  missingPermission,
}

extension ResourcePermissionValueExtension on ResourcePermission {
  String toValue() {
    switch (this) {
      case ResourcePermission.fullPermission:
        return 'FULL_PERMISSION';
      case ResourcePermission.missingPermission:
        return 'MISSING_PERMISSION';
    }
  }
}

extension ResourcePermissionFromString on String {
  ResourcePermission toResourcePermission() {
    switch (this) {
      case 'FULL_PERMISSION':
        return ResourcePermission.fullPermission;
      case 'MISSING_PERMISSION':
        return ResourcePermission.missingPermission;
    }
    throw Exception('$this is not known in enum ResourcePermission');
  }
}

enum ResourceTypeFilter {
  logGroups,
  cloudfrontDistribution,
  dynamodbTable,
  ec2NatGateway,
  ecsCluster,
  ecsService,
  eksCluster,
  elasticBeanstalkEnvironment,
  elasticLoadBalancerLoadBalancer,
  elasticLoadBalancingV2LoadBalancer,
  elasticLoadBalancingV2TargetGroup,
  elasticacheCacheCluster,
  elasticsearchDomain,
  kinesisStream,
  lambdaFunction,
  openSearchServiceDomain,
  rdsDbInstance,
  rdsDbCluster,
  redshiftCluster,
  route53HostedZone,
  route53HealthCheck,
  s3Bucket,
  sagemakerEndpoint,
  snsTopic,
  sqsQueue,
  stepFunctionsActivity,
  stepFunctionsStateMachine,
}

extension ResourceTypeFilterValueExtension on ResourceTypeFilter {
  String toValue() {
    switch (this) {
      case ResourceTypeFilter.logGroups:
        return 'LOG_GROUPS';
      case ResourceTypeFilter.cloudfrontDistribution:
        return 'CLOUDFRONT_DISTRIBUTION';
      case ResourceTypeFilter.dynamodbTable:
        return 'DYNAMODB_TABLE';
      case ResourceTypeFilter.ec2NatGateway:
        return 'EC2_NAT_GATEWAY';
      case ResourceTypeFilter.ecsCluster:
        return 'ECS_CLUSTER';
      case ResourceTypeFilter.ecsService:
        return 'ECS_SERVICE';
      case ResourceTypeFilter.eksCluster:
        return 'EKS_CLUSTER';
      case ResourceTypeFilter.elasticBeanstalkEnvironment:
        return 'ELASTIC_BEANSTALK_ENVIRONMENT';
      case ResourceTypeFilter.elasticLoadBalancerLoadBalancer:
        return 'ELASTIC_LOAD_BALANCER_LOAD_BALANCER';
      case ResourceTypeFilter.elasticLoadBalancingV2LoadBalancer:
        return 'ELASTIC_LOAD_BALANCING_V2_LOAD_BALANCER';
      case ResourceTypeFilter.elasticLoadBalancingV2TargetGroup:
        return 'ELASTIC_LOAD_BALANCING_V2_TARGET_GROUP';
      case ResourceTypeFilter.elasticacheCacheCluster:
        return 'ELASTICACHE_CACHE_CLUSTER';
      case ResourceTypeFilter.elasticsearchDomain:
        return 'ELASTICSEARCH_DOMAIN';
      case ResourceTypeFilter.kinesisStream:
        return 'KINESIS_STREAM';
      case ResourceTypeFilter.lambdaFunction:
        return 'LAMBDA_FUNCTION';
      case ResourceTypeFilter.openSearchServiceDomain:
        return 'OPEN_SEARCH_SERVICE_DOMAIN';
      case ResourceTypeFilter.rdsDbInstance:
        return 'RDS_DB_INSTANCE';
      case ResourceTypeFilter.rdsDbCluster:
        return 'RDS_DB_CLUSTER';
      case ResourceTypeFilter.redshiftCluster:
        return 'REDSHIFT_CLUSTER';
      case ResourceTypeFilter.route53HostedZone:
        return 'ROUTE53_HOSTED_ZONE';
      case ResourceTypeFilter.route53HealthCheck:
        return 'ROUTE53_HEALTH_CHECK';
      case ResourceTypeFilter.s3Bucket:
        return 'S3_BUCKET';
      case ResourceTypeFilter.sagemakerEndpoint:
        return 'SAGEMAKER_ENDPOINT';
      case ResourceTypeFilter.snsTopic:
        return 'SNS_TOPIC';
      case ResourceTypeFilter.sqsQueue:
        return 'SQS_QUEUE';
      case ResourceTypeFilter.stepFunctionsActivity:
        return 'STEP_FUNCTIONS_ACTIVITY';
      case ResourceTypeFilter.stepFunctionsStateMachine:
        return 'STEP_FUNCTIONS_STATE_MACHINE';
    }
  }
}

extension ResourceTypeFilterFromString on String {
  ResourceTypeFilter toResourceTypeFilter() {
    switch (this) {
      case 'LOG_GROUPS':
        return ResourceTypeFilter.logGroups;
      case 'CLOUDFRONT_DISTRIBUTION':
        return ResourceTypeFilter.cloudfrontDistribution;
      case 'DYNAMODB_TABLE':
        return ResourceTypeFilter.dynamodbTable;
      case 'EC2_NAT_GATEWAY':
        return ResourceTypeFilter.ec2NatGateway;
      case 'ECS_CLUSTER':
        return ResourceTypeFilter.ecsCluster;
      case 'ECS_SERVICE':
        return ResourceTypeFilter.ecsService;
      case 'EKS_CLUSTER':
        return ResourceTypeFilter.eksCluster;
      case 'ELASTIC_BEANSTALK_ENVIRONMENT':
        return ResourceTypeFilter.elasticBeanstalkEnvironment;
      case 'ELASTIC_LOAD_BALANCER_LOAD_BALANCER':
        return ResourceTypeFilter.elasticLoadBalancerLoadBalancer;
      case 'ELASTIC_LOAD_BALANCING_V2_LOAD_BALANCER':
        return ResourceTypeFilter.elasticLoadBalancingV2LoadBalancer;
      case 'ELASTIC_LOAD_BALANCING_V2_TARGET_GROUP':
        return ResourceTypeFilter.elasticLoadBalancingV2TargetGroup;
      case 'ELASTICACHE_CACHE_CLUSTER':
        return ResourceTypeFilter.elasticacheCacheCluster;
      case 'ELASTICSEARCH_DOMAIN':
        return ResourceTypeFilter.elasticsearchDomain;
      case 'KINESIS_STREAM':
        return ResourceTypeFilter.kinesisStream;
      case 'LAMBDA_FUNCTION':
        return ResourceTypeFilter.lambdaFunction;
      case 'OPEN_SEARCH_SERVICE_DOMAIN':
        return ResourceTypeFilter.openSearchServiceDomain;
      case 'RDS_DB_INSTANCE':
        return ResourceTypeFilter.rdsDbInstance;
      case 'RDS_DB_CLUSTER':
        return ResourceTypeFilter.rdsDbCluster;
      case 'REDSHIFT_CLUSTER':
        return ResourceTypeFilter.redshiftCluster;
      case 'ROUTE53_HOSTED_ZONE':
        return ResourceTypeFilter.route53HostedZone;
      case 'ROUTE53_HEALTH_CHECK':
        return ResourceTypeFilter.route53HealthCheck;
      case 'S3_BUCKET':
        return ResourceTypeFilter.s3Bucket;
      case 'SAGEMAKER_ENDPOINT':
        return ResourceTypeFilter.sagemakerEndpoint;
      case 'SNS_TOPIC':
        return ResourceTypeFilter.snsTopic;
      case 'SQS_QUEUE':
        return ResourceTypeFilter.sqsQueue;
      case 'STEP_FUNCTIONS_ACTIVITY':
        return ResourceTypeFilter.stepFunctionsActivity;
      case 'STEP_FUNCTIONS_STATE_MACHINE':
        return ResourceTypeFilter.stepFunctionsStateMachine;
    }
    throw Exception('$this is not known in enum ResourceTypeFilter');
  }
}

/// Specifies values used to filter responses when searching for insights. You
/// can use a <code>ResourceCollection</code>, <code>ServiceCollection</code>,
/// array of severities, and an array of status values. Each filter type
/// contains one or more values to search for. If you specify multiple filter
/// types, the filter types are joined with an <code>AND</code>, and the request
/// returns only results that match all of the specified filters.
class SearchInsightsFilters {
  final ResourceCollection? resourceCollection;

  /// A collection of the names of Amazon Web Services services.
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

/// Filters you can use to specify which events are returned when
/// <code>ListEvents</code> is called.
class SearchOrganizationInsightsFilters {
  final ResourceCollection? resourceCollection;
  final ServiceCollection? serviceCollection;

  /// An array of severity values used to search for insights.
  final List<InsightSeverity>? severities;

  /// An array of status values used to search for insights.
  final List<InsightStatus>? statuses;

  SearchOrganizationInsightsFilters({
    this.resourceCollection,
    this.serviceCollection,
    this.severities,
    this.statuses,
  });

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

class SearchOrganizationInsightsResponse {
  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String? nextToken;

  /// An integer that specifies the number of open proactive insights in your
  /// Amazon Web Services account.
  final List<ProactiveInsightSummary>? proactiveInsights;

  /// An integer that specifies the number of open reactive insights in your
  /// Amazon Web Services account.
  final List<ReactiveInsightSummary>? reactiveInsights;

  SearchOrganizationInsightsResponse({
    this.nextToken,
    this.proactiveInsights,
    this.reactiveInsights,
  });

  factory SearchOrganizationInsightsResponse.fromJson(
      Map<String, dynamic> json) {
    return SearchOrganizationInsightsResponse(
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

enum ServerSideEncryptionType {
  customerManagedKey,
  awsOwnedKmsKey,
}

extension ServerSideEncryptionTypeValueExtension on ServerSideEncryptionType {
  String toValue() {
    switch (this) {
      case ServerSideEncryptionType.customerManagedKey:
        return 'CUSTOMER_MANAGED_KEY';
      case ServerSideEncryptionType.awsOwnedKmsKey:
        return 'AWS_OWNED_KMS_KEY';
    }
  }
}

extension ServerSideEncryptionTypeFromString on String {
  ServerSideEncryptionType toServerSideEncryptionType() {
    switch (this) {
      case 'CUSTOMER_MANAGED_KEY':
        return ServerSideEncryptionType.customerManagedKey;
      case 'AWS_OWNED_KMS_KEY':
        return ServerSideEncryptionType.awsOwnedKmsKey;
    }
    throw Exception('$this is not known in enum ServerSideEncryptionType');
  }
}

/// A collection of the names of Amazon Web Services services.
class ServiceCollection {
  /// An array of strings that each specifies the name of an Amazon Web Services
  /// service.
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

/// Represents the health of an Amazon Web Services service.
class ServiceHealth {
  /// Number of resources that DevOps Guru is monitoring in an analyzed Amazon Web
  /// Services service.
  final int? analyzedResourceCount;

  /// Represents the health of an Amazon Web Services service. This is a
  /// <code>ServiceInsightHealth</code> that contains the number of open proactive
  /// and reactive insights for this service.
  final ServiceInsightHealth? insight;

  /// The name of the Amazon Web Services service.
  final ServiceName? serviceName;

  ServiceHealth({
    this.analyzedResourceCount,
    this.insight,
    this.serviceName,
  });

  factory ServiceHealth.fromJson(Map<String, dynamic> json) {
    return ServiceHealth(
      analyzedResourceCount: json['AnalyzedResourceCount'] as int?,
      insight: json['Insight'] != null
          ? ServiceInsightHealth.fromJson(
              json['Insight'] as Map<String, dynamic>)
          : null,
      serviceName: (json['ServiceName'] as String?)?.toServiceName(),
    );
  }

  Map<String, dynamic> toJson() {
    final analyzedResourceCount = this.analyzedResourceCount;
    final insight = this.insight;
    final serviceName = this.serviceName;
    return {
      if (analyzedResourceCount != null)
        'AnalyzedResourceCount': analyzedResourceCount,
      if (insight != null) 'Insight': insight,
      if (serviceName != null) 'ServiceName': serviceName.toValue(),
    };
  }
}

/// Contains the number of open proactive and reactive insights in an analyzed
/// Amazon Web Services service.
class ServiceInsightHealth {
  /// The number of open proactive insights in the Amazon Web Services service
  final int? openProactiveInsights;

  /// The number of open reactive insights in the Amazon Web Services service
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

/// Information about the integration of DevOps Guru with another Amazon Web
/// Services service, such as Amazon Web Services Systems Manager.
class ServiceIntegrationConfig {
  /// Information about whether DevOps Guru is configured to encrypt server-side
  /// data using KMS.
  final KMSServerSideEncryptionIntegration? kMSServerSideEncryption;

  /// Information about whether DevOps Guru is configured to perform log anomaly
  /// detection on Amazon CloudWatch log groups.
  final LogsAnomalyDetectionIntegration? logsAnomalyDetection;

  /// Information about whether DevOps Guru is configured to create an OpsItem in
  /// Amazon Web Services Systems Manager OpsCenter for each created insight.
  final OpsCenterIntegration? opsCenter;

  ServiceIntegrationConfig({
    this.kMSServerSideEncryption,
    this.logsAnomalyDetection,
    this.opsCenter,
  });

  factory ServiceIntegrationConfig.fromJson(Map<String, dynamic> json) {
    return ServiceIntegrationConfig(
      kMSServerSideEncryption: json['KMSServerSideEncryption'] != null
          ? KMSServerSideEncryptionIntegration.fromJson(
              json['KMSServerSideEncryption'] as Map<String, dynamic>)
          : null,
      logsAnomalyDetection: json['LogsAnomalyDetection'] != null
          ? LogsAnomalyDetectionIntegration.fromJson(
              json['LogsAnomalyDetection'] as Map<String, dynamic>)
          : null,
      opsCenter: json['OpsCenter'] != null
          ? OpsCenterIntegration.fromJson(
              json['OpsCenter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final kMSServerSideEncryption = this.kMSServerSideEncryption;
    final logsAnomalyDetection = this.logsAnomalyDetection;
    final opsCenter = this.opsCenter;
    return {
      if (kMSServerSideEncryption != null)
        'KMSServerSideEncryption': kMSServerSideEncryption,
      if (logsAnomalyDetection != null)
        'LogsAnomalyDetection': logsAnomalyDetection,
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

extension ServiceNameValueExtension on ServiceName {
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

extension ServiceNameFromString on String {
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
/// analyze an Amazon Web Services resource. For more information, see <a
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
  /// <code>INACTIVE</code>. You pay for the number of active Amazon Web Services
  /// resource hours analyzed for each resource. Inactive resources are not
  /// charged.
  final CostEstimationServiceResourceState? state;

  /// The type of the Amazon Web Services resource.
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
/// to it that grants DevOps Guru permission to send it notifications. DevOps
/// Guru adds the required policy on your behalf to send notifications using
/// Amazon SNS in your account. DevOps Guru only supports standard SNS topics.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-required-permissions.html">Permissions
/// for Amazon SNS topics</a>.
///
/// If you use an Amazon SNS topic that is encrypted by an Amazon Web Services
/// Key Management Service customer-managed key (CMK), then you must add
/// permissions to the CMK. For more information, see <a
/// href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-kms-permissions.html">Permissions
/// for Amazon Web Services KMS–encrypted Amazon SNS topics</a>.
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

  Map<String, dynamic> toJson() {
    final fromTime = this.fromTime;
    final toTime = this.toTime;
    return {
      if (fromTime != null) 'FromTime': unixTimestampToJson(fromTime),
      if (toTime != null) 'ToTime': unixTimestampToJson(toTime),
    };
  }
}

/// A collection of Amazon Web Services tags.
///
/// Tags help you identify and organize your Amazon Web Services resources. Many
/// Amazon Web Services services support tagging, so you can assign the same tag
/// to resources from different services to indicate that the resources are
/// related. For example, you can assign the same tag to an Amazon DynamoDB
/// table resource that you assign to an Lambda function. For more information
/// about using tags, see the <a
/// href="https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html">Tagging
/// best practices</a> whitepaper.
///
/// Each Amazon Web Services tag has two parts.
///
/// <ul>
/// <li>
/// A tag <i>key</i> (for example, <code>CostCenter</code>,
/// <code>Environment</code>, <code>Project</code>, or <code>Secret</code>). Tag
/// <i>keys</i> are case-sensitive.
/// </li>
/// <li>
/// An optional field known as a tag <i>value</i> (for example,
/// <code>111122223333</code>, <code>Production</code>, or a team name).
/// Omitting the tag <i>value</i> is the same as using an empty string. Like tag
/// <i>keys</i>, tag <i>values</i> are case-sensitive.
/// </li>
/// </ul>
/// Together these are known as <i>key</i>-<i>value</i> pairs.
/// <important>
/// The string used for a <i>key</i> in a tag that you use to define your
/// resource coverage must begin with the prefix <code>Devops-guru-</code>. The
/// tag <i>key</i> might be <code>DevOps-Guru-deployment-application</code> or
/// <code>devops-guru-rds-application</code>. When you create a <i>key</i>, the
/// case of characters in the <i>key</i> can be whatever you choose. After you
/// create a <i>key</i>, it is case-sensitive. For example, DevOps Guru works
/// with a <i>key</i> named <code>devops-guru-rds</code> and a <i>key</i> named
/// <code>DevOps-Guru-RDS</code>, and these act as two different <i>keys</i>.
/// Possible <i>key</i>/<i>value</i> pairs in your application might be
/// <code>Devops-Guru-production-application/RDS</code> or
/// <code>Devops-Guru-production-application/containers</code>.
/// </important>
class TagCollection {
  /// An Amazon Web Services tag <i>key</i> that is used to identify the Amazon
  /// Web Services resources that DevOps Guru analyzes. All Amazon Web Services
  /// resources in your account and Region tagged with this <i>key</i> make up
  /// your DevOps Guru application and analysis boundary.
  /// <important>
  /// The string used for a <i>key</i> in a tag that you use to define your
  /// resource coverage must begin with the prefix <code>Devops-guru-</code>. The
  /// tag <i>key</i> might be <code>DevOps-Guru-deployment-application</code> or
  /// <code>devops-guru-rds-application</code>. When you create a <i>key</i>, the
  /// case of characters in the <i>key</i> can be whatever you choose. After you
  /// create a <i>key</i>, it is case-sensitive. For example, DevOps Guru works
  /// with a <i>key</i> named <code>devops-guru-rds</code> and a <i>key</i> named
  /// <code>DevOps-Guru-RDS</code>, and these act as two different <i>keys</i>.
  /// Possible <i>key</i>/<i>value</i> pairs in your application might be
  /// <code>Devops-Guru-production-application/RDS</code> or
  /// <code>Devops-Guru-production-application/containers</code>.
  /// </important>
  final String appBoundaryKey;

  /// The values in an Amazon Web Services tag collection.
  ///
  /// The tag's <i>value</i> is an optional field used to associate a string with
  /// the tag <i>key</i> (for example, <code>111122223333</code>,
  /// <code>Production</code>, or a team name). The <i>key</i> and <i>value</i>
  /// are the tag's <i>key</i> pair. Omitting the tag <i>value</i> is the same as
  /// using an empty string. Like tag <i>keys</i>, tag <i>values</i> are
  /// case-sensitive. You can specify a maximum of 256 characters for a tag value.
  final List<String> tagValues;

  TagCollection({
    required this.appBoundaryKey,
    required this.tagValues,
  });

  factory TagCollection.fromJson(Map<String, dynamic> json) {
    return TagCollection(
      appBoundaryKey: json['AppBoundaryKey'] as String,
      tagValues: (json['TagValues'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appBoundaryKey = this.appBoundaryKey;
    final tagValues = this.tagValues;
    return {
      'AppBoundaryKey': appBoundaryKey,
      'TagValues': tagValues,
    };
  }
}

/// A collection of Amazon Web Services tags used to filter insights. This is
/// used to return insights generated from only resources that contain the tags
/// in the tag collection.
class TagCollectionFilter {
  /// An Amazon Web Services tag <i>key</i> that is used to identify the Amazon
  /// Web Services resources that DevOps Guru analyzes. All Amazon Web Services
  /// resources in your account and Region tagged with this <i>key</i> make up
  /// your DevOps Guru application and analysis boundary.
  /// <important>
  /// The string used for a <i>key</i> in a tag that you use to define your
  /// resource coverage must begin with the prefix <code>Devops-guru-</code>. The
  /// tag <i>key</i> might be <code>DevOps-Guru-deployment-application</code> or
  /// <code>devops-guru-rds-application</code>. When you create a <i>key</i>, the
  /// case of characters in the <i>key</i> can be whatever you choose. After you
  /// create a <i>key</i>, it is case-sensitive. For example, DevOps Guru works
  /// with a <i>key</i> named <code>devops-guru-rds</code> and a <i>key</i> named
  /// <code>DevOps-Guru-RDS</code>, and these act as two different <i>keys</i>.
  /// Possible <i>key</i>/<i>value</i> pairs in your application might be
  /// <code>Devops-Guru-production-application/RDS</code> or
  /// <code>Devops-Guru-production-application/containers</code>.
  /// </important>
  final String appBoundaryKey;

  /// The values in an Amazon Web Services tag collection.
  ///
  /// The tag's <i>value</i> is an optional field used to associate a string with
  /// the tag <i>key</i> (for example, <code>111122223333</code>,
  /// <code>Production</code>, or a team name). The <i>key</i> and <i>value</i>
  /// are the tag's <i>key</i> pair. Omitting the tag <i>value</i> is the same as
  /// using an empty string. Like tag <i>keys</i>, tag <i>values</i> are
  /// case-sensitive. You can specify a maximum of 256 characters for a tag value.
  final List<String> tagValues;

  TagCollectionFilter({
    required this.appBoundaryKey,
    required this.tagValues,
  });

  factory TagCollectionFilter.fromJson(Map<String, dynamic> json) {
    return TagCollectionFilter(
      appBoundaryKey: json['AppBoundaryKey'] as String,
      tagValues: (json['TagValues'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appBoundaryKey = this.appBoundaryKey;
    final tagValues = this.tagValues;
    return {
      'AppBoundaryKey': appBoundaryKey,
      'TagValues': tagValues,
    };
  }
}

/// Information about a collection of Amazon Web Services resources that are
/// identified by an Amazon Web Services tag. This collection of resources is
/// used to create a monthly cost estimate for DevOps Guru to analyze Amazon Web
/// Services resources. The maximum number of tags you can specify for a cost
/// estimate is one. The estimate created is for the cost to analyze the Amazon
/// Web Services resources defined by the tag. For more information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html">Stacks</a>
/// in the <i>Amazon Web Services CloudFormation User Guide</i>.
class TagCostEstimationResourceCollectionFilter {
  /// An Amazon Web Services tag <i>key</i> that is used to identify the Amazon
  /// Web Services resources that DevOps Guru analyzes. All Amazon Web Services
  /// resources in your account and Region tagged with this <i>key</i> make up
  /// your DevOps Guru application and analysis boundary.
  /// <important>
  /// The string used for a <i>key</i> in a tag that you use to define your
  /// resource coverage must begin with the prefix <code>Devops-guru-</code>. The
  /// tag <i>key</i> might be <code>DevOps-Guru-deployment-application</code> or
  /// <code>devops-guru-rds-application</code>. When you create a <i>key</i>, the
  /// case of characters in the <i>key</i> can be whatever you choose. After you
  /// create a <i>key</i>, it is case-sensitive. For example, DevOps Guru works
  /// with a <i>key</i> named <code>devops-guru-rds</code> and a <i>key</i> named
  /// <code>DevOps-Guru-RDS</code>, and these act as two different <i>keys</i>.
  /// Possible <i>key</i>/<i>value</i> pairs in your application might be
  /// <code>Devops-Guru-production-application/RDS</code> or
  /// <code>Devops-Guru-production-application/containers</code>.
  /// </important>
  final String appBoundaryKey;

  /// The values in an Amazon Web Services tag collection.
  ///
  /// The tag's <i>value</i> is an optional field used to associate a string with
  /// the tag <i>key</i> (for example, <code>111122223333</code>,
  /// <code>Production</code>, or a team name). The <i>key</i> and <i>value</i>
  /// are the tag's <i>key</i> pair. Omitting the tag <i>value</i> is the same as
  /// using an empty string. Like tag <i>keys</i>, tag <i>values</i> are
  /// case-sensitive. You can specify a maximum of 256 characters for a tag value.
  final List<String> tagValues;

  TagCostEstimationResourceCollectionFilter({
    required this.appBoundaryKey,
    required this.tagValues,
  });

  factory TagCostEstimationResourceCollectionFilter.fromJson(
      Map<String, dynamic> json) {
    return TagCostEstimationResourceCollectionFilter(
      appBoundaryKey: json['AppBoundaryKey'] as String,
      tagValues: (json['TagValues'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appBoundaryKey = this.appBoundaryKey;
    final tagValues = this.tagValues;
    return {
      'AppBoundaryKey': appBoundaryKey,
      'TagValues': tagValues,
    };
  }
}

/// Information about the health of Amazon Web Services resources in your
/// account that are specified by an Amazon Web Services tag <i>key</i>.
class TagHealth {
  /// Number of resources that DevOps Guru is monitoring in your account that are
  /// specified by an Amazon Web Services tag.
  final int? analyzedResourceCount;

  /// An Amazon Web Services tag <i>key</i> that is used to identify the Amazon
  /// Web Services resources that DevOps Guru analyzes. All Amazon Web Services
  /// resources in your account and Region tagged with this <i>key</i> make up
  /// your DevOps Guru application and analysis boundary.
  /// <important>
  /// The string used for a <i>key</i> in a tag that you use to define your
  /// resource coverage must begin with the prefix <code>Devops-guru-</code>. The
  /// tag <i>key</i> might be <code>DevOps-Guru-deployment-application</code> or
  /// <code>devops-guru-rds-application</code>. When you create a <i>key</i>, the
  /// case of characters in the <i>key</i> can be whatever you choose. After you
  /// create a <i>key</i>, it is case-sensitive. For example, DevOps Guru works
  /// with a <i>key</i> named <code>devops-guru-rds</code> and a <i>key</i> named
  /// <code>DevOps-Guru-RDS</code>, and these act as two different <i>keys</i>.
  /// Possible <i>key</i>/<i>value</i> pairs in your application might be
  /// <code>Devops-Guru-production-application/RDS</code> or
  /// <code>Devops-Guru-production-application/containers</code>.
  /// </important>
  final String? appBoundaryKey;

  /// Information about the health of the Amazon Web Services resources in your
  /// account that are specified by an Amazon Web Services tag, including the
  /// number of open proactive, open reactive insights, and the Mean Time to
  /// Recover (MTTR) of closed insights.
  final InsightHealth? insight;

  /// The value in an Amazon Web Services tag.
  ///
  /// The tag's <i>value</i> is an optional field used to associate a string with
  /// the tag <i>key</i> (for example, <code>111122223333</code>,
  /// <code>Production</code>, or a team name). The <i>key</i> and <i>value</i>
  /// are the tag's <i>key</i> pair. Omitting the tag <i>value</i> is the same as
  /// using an empty string. Like tag <i>keys</i>, tag <i>values</i> are
  /// case-sensitive. You can specify a maximum of 256 characters for a tag value.
  final String? tagValue;

  TagHealth({
    this.analyzedResourceCount,
    this.appBoundaryKey,
    this.insight,
    this.tagValue,
  });

  factory TagHealth.fromJson(Map<String, dynamic> json) {
    return TagHealth(
      analyzedResourceCount: json['AnalyzedResourceCount'] as int?,
      appBoundaryKey: json['AppBoundaryKey'] as String?,
      insight: json['Insight'] != null
          ? InsightHealth.fromJson(json['Insight'] as Map<String, dynamic>)
          : null,
      tagValue: json['TagValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analyzedResourceCount = this.analyzedResourceCount;
    final appBoundaryKey = this.appBoundaryKey;
    final insight = this.insight;
    final tagValue = this.tagValue;
    return {
      if (analyzedResourceCount != null)
        'AnalyzedResourceCount': analyzedResourceCount,
      if (appBoundaryKey != null) 'AppBoundaryKey': appBoundaryKey,
      if (insight != null) 'Insight': insight,
      if (tagValue != null) 'TagValue': tagValue,
    };
  }
}

/// A pair that contains metric values at the respective timestamp.
class TimestampMetricValuePair {
  /// Value of the anomalous metric data point at respective Timestamp.
  final double? metricValue;

  /// A <code>Timestamp</code> that specifies the time the event occurred.
  final DateTime? timestamp;

  TimestampMetricValuePair({
    this.metricValue,
    this.timestamp,
  });

  factory TimestampMetricValuePair.fromJson(Map<String, dynamic> json) {
    return TimestampMetricValuePair(
      metricValue: json['MetricValue'] as double?,
      timestamp: timeStampFromJson(json['Timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final metricValue = this.metricValue;
    final timestamp = this.timestamp;
    return {
      if (metricValue != null) 'MetricValue': metricValue,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// Contains the names of Amazon Web Services CloudFormation stacks used to
/// update a collection of stacks. You can specify up to 500 Amazon Web Services
/// CloudFormation stacks.
class UpdateCloudFormationCollectionFilter {
  /// An array of the names of the Amazon Web Services CloudFormation stacks to
  /// update. You can specify up to 500 Amazon Web Services CloudFormation stacks.
  final List<String>? stackNames;

  UpdateCloudFormationCollectionFilter({
    this.stackNames,
  });

  Map<String, dynamic> toJson() {
    final stackNames = this.stackNames;
    return {
      if (stackNames != null) 'StackNames': stackNames,
    };
  }
}

class UpdateEventSourcesConfigResponse {
  UpdateEventSourcesConfigResponse();

  factory UpdateEventSourcesConfigResponse.fromJson(Map<String, dynamic> _) {
    return UpdateEventSourcesConfigResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum UpdateResourceCollectionAction {
  add,
  remove,
}

extension UpdateResourceCollectionActionValueExtension
    on UpdateResourceCollectionAction {
  String toValue() {
    switch (this) {
      case UpdateResourceCollectionAction.add:
        return 'ADD';
      case UpdateResourceCollectionAction.remove:
        return 'REMOVE';
    }
  }
}

extension UpdateResourceCollectionActionFromString on String {
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

/// Contains information used to update a collection of Amazon Web Services
/// resources.
class UpdateResourceCollectionFilter {
  /// A collection of Amazon Web Services CloudFormation stacks. You can specify
  /// up to 500 Amazon Web Services CloudFormation stacks.
  final UpdateCloudFormationCollectionFilter? cloudFormation;

  /// The updated Amazon Web Services tags used to filter the resources in the
  /// resource collection.
  ///
  /// Tags help you identify and organize your Amazon Web Services resources. Many
  /// Amazon Web Services services support tagging, so you can assign the same tag
  /// to resources from different services to indicate that the resources are
  /// related. For example, you can assign the same tag to an Amazon DynamoDB
  /// table resource that you assign to an Lambda function. For more information
  /// about using tags, see the <a
  /// href="https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html">Tagging
  /// best practices</a> whitepaper.
  ///
  /// Each Amazon Web Services tag has two parts.
  ///
  /// <ul>
  /// <li>
  /// A tag <i>key</i> (for example, <code>CostCenter</code>,
  /// <code>Environment</code>, <code>Project</code>, or <code>Secret</code>). Tag
  /// <i>keys</i> are case-sensitive.
  /// </li>
  /// <li>
  /// An optional field known as a tag <i>value</i> (for example,
  /// <code>111122223333</code>, <code>Production</code>, or a team name).
  /// Omitting the tag <i>value</i> is the same as using an empty string. Like tag
  /// <i>keys</i>, tag <i>values</i> are case-sensitive.
  /// </li>
  /// </ul>
  /// Together these are known as <i>key</i>-<i>value</i> pairs.
  /// <important>
  /// The string used for a <i>key</i> in a tag that you use to define your
  /// resource coverage must begin with the prefix <code>Devops-guru-</code>. The
  /// tag <i>key</i> might be <code>DevOps-Guru-deployment-application</code> or
  /// <code>devops-guru-rds-application</code>. When you create a <i>key</i>, the
  /// case of characters in the <i>key</i> can be whatever you choose. After you
  /// create a <i>key</i>, it is case-sensitive. For example, DevOps Guru works
  /// with a <i>key</i> named <code>devops-guru-rds</code> and a <i>key</i> named
  /// <code>DevOps-Guru-RDS</code>, and these act as two different <i>keys</i>.
  /// Possible <i>key</i>/<i>value</i> pairs in your application might be
  /// <code>Devops-Guru-production-application/RDS</code> or
  /// <code>Devops-Guru-production-application/containers</code>.
  /// </important>
  final List<UpdateTagCollectionFilter>? tags;

  UpdateResourceCollectionFilter({
    this.cloudFormation,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final cloudFormation = this.cloudFormation;
    final tags = this.tags;
    return {
      if (cloudFormation != null) 'CloudFormation': cloudFormation,
      if (tags != null) 'Tags': tags,
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

/// Information about updating the integration status of an Amazon Web Services
/// service, such as Amazon Web Services Systems Manager, with DevOps Guru.
class UpdateServiceIntegrationConfig {
  /// Information about whether DevOps Guru is configured to encrypt server-side
  /// data using KMS.
  final KMSServerSideEncryptionIntegrationConfig? kMSServerSideEncryption;

  /// Information about whether DevOps Guru is configured to perform log anomaly
  /// detection on Amazon CloudWatch log groups.
  final LogsAnomalyDetectionIntegrationConfig? logsAnomalyDetection;
  final OpsCenterIntegrationConfig? opsCenter;

  UpdateServiceIntegrationConfig({
    this.kMSServerSideEncryption,
    this.logsAnomalyDetection,
    this.opsCenter,
  });

  Map<String, dynamic> toJson() {
    final kMSServerSideEncryption = this.kMSServerSideEncryption;
    final logsAnomalyDetection = this.logsAnomalyDetection;
    final opsCenter = this.opsCenter;
    return {
      if (kMSServerSideEncryption != null)
        'KMSServerSideEncryption': kMSServerSideEncryption,
      if (logsAnomalyDetection != null)
        'LogsAnomalyDetection': logsAnomalyDetection,
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

/// A new collection of Amazon Web Services resources that are defined by an
/// Amazon Web Services tag or tag <i>key</i>/<i>value</i> pair.
class UpdateTagCollectionFilter {
  /// An Amazon Web Services tag <i>key</i> that is used to identify the Amazon
  /// Web Services resources that DevOps Guru analyzes. All Amazon Web Services
  /// resources in your account and Region tagged with this <i>key</i> make up
  /// your DevOps Guru application and analysis boundary.
  /// <important>
  /// The string used for a <i>key</i> in a tag that you use to define your
  /// resource coverage must begin with the prefix <code>Devops-guru-</code>. The
  /// tag <i>key</i> might be <code>DevOps-Guru-deployment-application</code> or
  /// <code>devops-guru-rds-application</code>. When you create a <i>key</i>, the
  /// case of characters in the <i>key</i> can be whatever you choose. After you
  /// create a <i>key</i>, it is case-sensitive. For example, DevOps Guru works
  /// with a <i>key</i> named <code>devops-guru-rds</code> and a <i>key</i> named
  /// <code>DevOps-Guru-RDS</code>, and these act as two different <i>keys</i>.
  /// Possible <i>key</i>/<i>value</i> pairs in your application might be
  /// <code>Devops-Guru-production-application/RDS</code> or
  /// <code>Devops-Guru-production-application/containers</code>.
  /// </important>
  final String appBoundaryKey;

  /// The values in an Amazon Web Services tag collection.
  ///
  /// The tag's <i>value</i> is an optional field used to associate a string with
  /// the tag <i>key</i> (for example, <code>111122223333</code>,
  /// <code>Production</code>, or a team name). The <i>key</i> and <i>value</i>
  /// are the tag's <i>key</i> pair. Omitting the tag <i>value</i> is the same as
  /// using an empty string. Like tag <i>keys</i>, tag <i>values</i> are
  /// case-sensitive. You can specify a maximum of 256 characters for a tag value.
  final List<String> tagValues;

  UpdateTagCollectionFilter({
    required this.appBoundaryKey,
    required this.tagValues,
  });

  Map<String, dynamic> toJson() {
    final appBoundaryKey = this.appBoundaryKey;
    final tagValues = this.tagValues;
    return {
      'AppBoundaryKey': appBoundaryKey,
      'TagValues': tagValues,
    };
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
